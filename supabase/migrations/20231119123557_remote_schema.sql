drop policy "Enable read access for all members" on "public"."members";

drop function if exists "public"."find_groups"(lat double precision, long double precision, remote boolean);

drop function if exists "public"."find_groups"(lat double precision, long double precision, remote boolean, "groupLanguage" character varying);

drop function if exists "public"."has_user_group_request"(group_id bigint);

drop function if exists "public"."is_user_member_of_group"(group_id bigint);

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.find_groups(lat double precision, long double precision, remote boolean, grouplanguage text)
 RETURNS TABLE(id bigint, created_at timestamp with time zone, is_remote boolean, description text, owner_id uuid, title text, language character varying, dist_meters double precision, num_members bigint, num_dms bigint)
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
begin
IF remote THEN
RETURN QUERY
   select groups.*, NULL::FLOAT AS dist_meters, count(*) as num_members, sum(case is_dm when true then 1 else 0 end) as num_dms
  from groups join members on groups.id = members.group_id where groups.is_remote = true AND NOT is_user_member_of_group(groups.id)
    AND NOT has_user_group_request(groups.id) AND groups.language = groupLanguage
  group by groups.id;
 
ELSE
 RETURN QUERY
  select groups.*, st_distance(location, st_point(long, lat)::geography)+ (RANDOM() - 0.5)*2*200 -- Add a random +- 200 meter to result
  as dist_meters, count(*) as num_members, sum(case is_dm when true then 1 else 0 end) as num_dms
  from group_addresses natural join groups join members on groups.id = members.group_id where groups.is_remote = false AND location <-> st_point(long, lat)::geography < 10000 AND NOT is_user_member_of_group(groups.id)
    AND NOT has_user_group_request(groups.id) AND groups.language = groupLanguage
  group by groups.id, group_addresses.location
  order by dist_meters;
  END IF;
  end;
$function$
;

CREATE OR REPLACE FUNCTION public.find_groups(lat double precision, long double precision, remote boolean, lang character varying)
 RETURNS TABLE(id bigint, created_at timestamp with time zone, is_remote boolean, description text, owner_id uuid, title text, language character varying, dist_meters double precision, num_members bigint, num_dms bigint)
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
begin
raise log 'userid = %', auth.uid();
raise log 'isInGroup25 = %', is_user_member_of_group(25);
raise log 'isInGroup29 = %', is_user_member_of_group(29);
raise log 'isInGroup34 = %', is_user_member_of_group(34);


IF remote THEN
RETURN QUERY
   select groups.*, NULL::FLOAT AS dist_meters, count(*) as num_members, sum(case is_dm when true then 1 else 0 end) as num_dms
  from groups join members on groups.id = members.group_id where groups.is_remote = true AND NOT is_user_member_of_group(groups.id)
    AND NOT has_user_group_request(groups.id) AND groups.language = lang
  group by groups.id;
 
ELSE
 RETURN QUERY
  select groups.*, st_distance(location, st_point(long, lat)::geography)+ (RANDOM() - 0.5)*2*200 -- Add a random +- 200 meter to result
  as dist_meters, count(*) as num_members, sum(case is_dm when true then 1 else 0 end) as num_dms
  from group_addresses natural join groups join members on groups.id = members.group_id where groups.is_remote = false AND location <-> st_point(long, lat)::geography < 10000 AND NOT is_user_member_of_group(groups.id)
    AND NOT has_user_group_request(groups.id) AND groups.language = lang
  group by groups.id, group_addresses.location
  order by dist_meters;
  END IF;
  end;
$function$
;

CREATE OR REPLACE FUNCTION public.has_user_group_request(p_group_id bigint)
 RETURNS boolean
 LANGUAGE sql
 STABLE SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
select exists(
  select 1
  from chats chat
  where chat.user_id = auth.uid() and chat.group_id = p_group_id)
$function$
;

CREATE OR REPLACE FUNCTION public.is_user_member_of_group(p_group_id bigint)
 RETURNS boolean
 LANGUAGE sql
 STABLE SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
select exists(
  select 1
  from members member
  where member.user_id = auth.uid() and member.group_id = p_group_id)
$function$
;

create policy "Enable read access for members"
on "public"."members"
as permissive
for select
to authenticated
using (is_user_member_of_group(group_id));



