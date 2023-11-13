CREATE OR REPLACE FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "groupLanguage" character varying) RETURNS TABLE("id" bigint, "created_at" timestamp with time zone, "is_remote" boolean, "description" "text", "owner_id" "uuid", "title" "text", "language" character varying, "dist_meters" double precision, "num_members" bigint, "num_dms" bigint)
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
begin
IF remote THEN
RETURN QUERY
   select groups.*, NULL::FLOAT AS dist_meters, count(*) as num_members, sum(case is_dm when true then 1 else 0 end) as num_dms
  from groups join members on groups.id = members.group_id where groups.is_remote = true AND NOT is_user_member_of_group(groups.id)
    AND NOT has_user_group_request(groups.id)
  group by groups.id;
 
ELSE
 RETURN QUERY
  select groups.*, st_distance(location, st_point(long, lat)::geography)+ (RANDOM() - 0.5)*2*200 -- Add a random +- 200 meter to result
  as dist_meters, count(*) as num_members, sum(case is_dm when true then 1 else 0 end) as num_dms
  from group_addresses natural join groups join members on groups.id = members.group_id where groups.is_remote = false AND location <-> st_point(long, lat)::geography < 10000 AND NOT is_user_member_of_group(groups.id)
    AND NOT has_user_group_request(groups.id)
  group by groups.id, group_addresses.location
  order by dist_meters;
  END IF;
  end;
$$;