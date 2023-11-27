
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

CREATE EXTENSION IF NOT EXISTS "pgsodium" WITH SCHEMA "pgsodium";

CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql";

CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "pgjwt" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "postgis" WITH SCHEMA "extensions";

CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";

CREATE TYPE "public"."experience_level" AS ENUM (
    'beginner',
    'intermediate',
    'experienced',
    'veteran'
);

ALTER TYPE "public"."experience_level" OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."create_chat"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
begin
  insert into chats(group_id)
  values (new.id);
  return new;
end;
$$;

ALTER FUNCTION "public"."create_chat"() OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "grouplanguage" "text") RETURNS TABLE("id" bigint, "created_at" timestamp with time zone, "is_remote" boolean, "description" "text", "owner_id" "uuid", "title" "text", "language" character varying, "dist_meters" double precision, "num_members" bigint, "num_dms" bigint)
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
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
$$;

ALTER FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "grouplanguage" "text") OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "lang" character varying) RETURNS TABLE("id" bigint, "created_at" timestamp with time zone, "is_remote" boolean, "description" "text", "owner_id" "uuid", "title" "text", "language" character varying, "dist_meters" double precision, "num_members" bigint, "num_dms" bigint)
    LANGUAGE "plpgsql" SECURITY DEFINER
    AS $$
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
$$;

ALTER FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "lang" character varying) OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."has_user_group_request"("p_group_id" bigint) RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
select exists(
  select 1
  from chats chat
  where chat.user_id = auth.uid() and chat.group_id = p_group_id)
$$;

ALTER FUNCTION "public"."has_user_group_request"("p_group_id" bigint) OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."is_group_owner"("group_id" bigint) RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
select exists(
  select 1
  from groups g
  where g.owner_id = auth.uid() and g.id = group_id)
$$;

ALTER FUNCTION "public"."is_group_owner"("group_id" bigint) OWNER TO "postgres";

CREATE OR REPLACE FUNCTION "public"."is_user_member_of_group"("p_group_id" bigint) RETURNS boolean
    LANGUAGE "sql" STABLE SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
select exists(
  select 1
  from members member
  where member.user_id = auth.uid() and member.group_id = p_group_id)
$$;

ALTER FUNCTION "public"."is_user_member_of_group"("p_group_id" bigint) OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";

CREATE TABLE IF NOT EXISTS "public"."group_addresses" (
    "id" bigint NOT NULL,
    "address" "text" NOT NULL,
    "location" "extensions"."geography"(Point,4326) NOT NULL
);

ALTER TABLE "public"."group_addresses" OWNER TO "postgres";

ALTER TABLE "public"."group_addresses" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."addresses_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."chats" (
    "id" bigint NOT NULL,
    "group_id" bigint NOT NULL,
    "user_id" "uuid",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL
);

ALTER TABLE "public"."chats" OWNER TO "postgres";

ALTER TABLE "public"."chats" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."chat_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."groups" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "is_remote" boolean NOT NULL,
    "description" "text",
    "owner_id" "uuid" DEFAULT "auth"."uid"(),
    "title" "text" NOT NULL,
    "language" character varying DEFAULT 'en'::character varying NOT NULL
);

ALTER TABLE "public"."groups" OWNER TO "postgres";

ALTER TABLE "public"."groups" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."group_sessions" (
    "id" bigint NOT NULL,
    "weekday" smallint NOT NULL,
    "start_time" time with time zone NOT NULL,
    "end_time" time with time zone NOT NULL,
    "group_id" bigint NOT NULL
);

ALTER TABLE "public"."group_sessions" OWNER TO "postgres";

ALTER TABLE "public"."group_sessions" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."group_sessions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."members" (
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "is_dm" boolean DEFAULT false,
    "group_id" bigint NOT NULL,
    "user_id" "uuid" NOT NULL
);

ALTER TABLE "public"."members" OWNER TO "postgres";

CREATE TABLE IF NOT EXISTS "public"."messages" (
    "id" bigint NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "sender_id" "uuid" NOT NULL,
    "chat_id" bigint NOT NULL,
    "message" "text" NOT NULL
);

ALTER TABLE "public"."messages" OWNER TO "postgres";

ALTER TABLE "public"."messages" ALTER COLUMN "id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME "public"."message_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

CREATE TABLE IF NOT EXISTS "public"."users" (
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "firstname" "text" NOT NULL,
    "id" "uuid" DEFAULT "auth"."uid"() NOT NULL,
    "picture_url" "text",
    "experience_level" "public"."experience_level" NOT NULL,
    "last_online" timestamp without time zone NOT NULL,
    "timezone_offset" smallint DEFAULT '0'::smallint NOT NULL
);

ALTER TABLE "public"."users" OWNER TO "postgres";

ALTER TABLE ONLY "public"."chats"
    ADD CONSTRAINT "chat_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."group_addresses"
    ADD CONSTRAINT "group_addresses_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."groups"
    ADD CONSTRAINT "group_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."group_sessions"
    ADD CONSTRAINT "group_sessions_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."members"
    ADD CONSTRAINT "members_pkey" PRIMARY KEY ("group_id", "user_id");

ALTER TABLE ONLY "public"."messages"
    ADD CONSTRAINT "message_pkey" PRIMARY KEY ("id");

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "players_pkey" PRIMARY KEY ("id");

CREATE INDEX "group_addresses_geo_index" ON "public"."group_addresses" USING "gist" ("location");

CREATE OR REPLACE TRIGGER "group_created_trigger" AFTER INSERT ON "public"."groups" FOR EACH ROW EXECUTE FUNCTION "public"."create_chat"();

ALTER TABLE ONLY "public"."chats"
    ADD CONSTRAINT "chats_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "public"."groups"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."chats"
    ADD CONSTRAINT "chats_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."group_addresses"
    ADD CONSTRAINT "group_addresses_id_fkey" FOREIGN KEY ("id") REFERENCES "public"."groups"("id");

ALTER TABLE ONLY "public"."group_sessions"
    ADD CONSTRAINT "group_sessions_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "public"."groups"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."groups"
    ADD CONSTRAINT "groups_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."members"
    ADD CONSTRAINT "members_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "public"."groups"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."members"
    ADD CONSTRAINT "members_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."messages"
    ADD CONSTRAINT "messages_chat_id_fkey" FOREIGN KEY ("chat_id") REFERENCES "public"."chats"("id") ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE ONLY "public"."messages"
    ADD CONSTRAINT "messages_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;

CREATE POLICY "Enable all for users based on sender_id" ON "public"."messages" USING (("auth"."uid"() = "sender_id")) WITH CHECK (("auth"."uid"() = "sender_id"));

CREATE POLICY "Enable create for requester and owner" ON "public"."chats" FOR INSERT TO "authenticated" WITH CHECK (("public"."is_group_owner"("group_id") OR ("user_id" = "auth"."uid"())));

CREATE POLICY "Enable delete for requester and owner" ON "public"."chats" FOR DELETE TO "authenticated" USING (("public"."is_group_owner"("group_id") OR ("user_id" = "auth"."uid"())));

CREATE POLICY "Enable insert for users based on user_id" ON "public"."users" FOR INSERT WITH CHECK (("auth"."uid"() = "id"));

CREATE POLICY "Enable read access for all authenticated users" ON "public"."groups" FOR SELECT TO "authenticated" USING (true);

CREATE POLICY "Enable read access for authenticated users" ON "public"."group_sessions" FOR SELECT TO "authenticated" USING (true);

CREATE POLICY "Enable read access for members" ON "public"."members" FOR SELECT TO "authenticated" USING ("public"."is_user_member_of_group"("group_id"));

CREATE POLICY "Enable read access for members and requester" ON "public"."chats" FOR SELECT TO "authenticated" USING (("public"."is_user_member_of_group"("group_id") OR "public"."has_user_group_request"("group_id")));

CREATE POLICY "Enable read access for requesting user" ON "public"."messages" FOR SELECT USING ((EXISTS ( SELECT 1
   FROM "public"."chats"
  WHERE (("chats"."id" = "messages"."chat_id") AND ("chats"."user_id" = "auth"."uid"())))));

CREATE POLICY "Enable read for authenticated users only" ON "public"."users" FOR SELECT TO "authenticated" USING (true);

CREATE POLICY "Enable read for users in group" ON "public"."messages" FOR SELECT TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM (("public"."members"
     JOIN "public"."groups" USING ("created_at"))
     JOIN "public"."chats" USING ("created_at", "group_id", "user_id", "id"))
  WHERE (("chats"."id" = "messages"."chat_id") AND ("members"."user_id" = "auth"."uid"())))));

CREATE POLICY "Enable update for users based on user_id" ON "public"."users" FOR UPDATE USING (("auth"."uid"() = "id")) WITH CHECK (("auth"."uid"() = "id"));

CREATE POLICY "Owner of a group has full access of members" ON "public"."members" TO "authenticated" USING ((EXISTS ( SELECT 1
   FROM "public"."groups"
  WHERE (("groups"."id" = "members"."group_id") AND ("groups"."owner_id" = "auth"."uid"()))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."groups"
  WHERE (("groups"."id" = "members"."group_id") AND ("groups"."owner_id" = "auth"."uid"())))));

CREATE POLICY "Owners have full permission on groups" ON "public"."groups" USING (("auth"."uid"() = "owner_id")) WITH CHECK (("auth"."uid"() = "owner_id"));

ALTER TABLE "public"."chats" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "group owners have full access" ON "public"."group_sessions" USING ("public"."is_group_owner"("group_id")) WITH CHECK ("public"."is_group_owner"("group_id"));

ALTER TABLE "public"."group_addresses" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."group_sessions" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."groups" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."members" ENABLE ROW LEVEL SECURITY;

CREATE POLICY "members have full access to address" ON "public"."group_addresses" USING (("auth"."uid"() IN ( SELECT "members"."user_id"
   FROM "public"."members"
  WHERE ("members"."group_id" = "group_addresses"."id")))) WITH CHECK (("auth"."uid"() IN ( SELECT "members"."user_id"
   FROM "public"."members"
  WHERE ("members"."group_id" = "group_addresses"."id"))));

ALTER TABLE "public"."messages" ENABLE ROW LEVEL SECURITY;

ALTER TABLE "public"."users" ENABLE ROW LEVEL SECURITY;

GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";

GRANT ALL ON FUNCTION "public"."create_chat"() TO "anon";
GRANT ALL ON FUNCTION "public"."create_chat"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."create_chat"() TO "service_role";

GRANT ALL ON FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "grouplanguage" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "grouplanguage" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "grouplanguage" "text") TO "service_role";

GRANT ALL ON FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "lang" character varying) TO "anon";
GRANT ALL ON FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "lang" character varying) TO "authenticated";
GRANT ALL ON FUNCTION "public"."find_groups"("lat" double precision, "long" double precision, "remote" boolean, "lang" character varying) TO "service_role";

GRANT ALL ON FUNCTION "public"."has_user_group_request"("p_group_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."has_user_group_request"("p_group_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."has_user_group_request"("p_group_id" bigint) TO "service_role";

GRANT ALL ON FUNCTION "public"."is_group_owner"("group_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."is_group_owner"("group_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_group_owner"("group_id" bigint) TO "service_role";

GRANT ALL ON FUNCTION "public"."is_user_member_of_group"("p_group_id" bigint) TO "anon";
GRANT ALL ON FUNCTION "public"."is_user_member_of_group"("p_group_id" bigint) TO "authenticated";
GRANT ALL ON FUNCTION "public"."is_user_member_of_group"("p_group_id" bigint) TO "service_role";

GRANT ALL ON TABLE "public"."group_addresses" TO "anon";
GRANT ALL ON TABLE "public"."group_addresses" TO "authenticated";
GRANT ALL ON TABLE "public"."group_addresses" TO "service_role";

GRANT ALL ON SEQUENCE "public"."addresses_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."addresses_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."addresses_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."chats" TO "anon";
GRANT ALL ON TABLE "public"."chats" TO "authenticated";
GRANT ALL ON TABLE "public"."chats" TO "service_role";

GRANT ALL ON SEQUENCE "public"."chat_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."chat_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."chat_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."groups" TO "anon";
GRANT ALL ON TABLE "public"."groups" TO "authenticated";
GRANT ALL ON TABLE "public"."groups" TO "service_role";

GRANT ALL ON SEQUENCE "public"."group_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."group_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."group_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."group_sessions" TO "anon";
GRANT ALL ON TABLE "public"."group_sessions" TO "authenticated";
GRANT ALL ON TABLE "public"."group_sessions" TO "service_role";

GRANT ALL ON SEQUENCE "public"."group_sessions_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."group_sessions_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."group_sessions_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."members" TO "anon";
GRANT ALL ON TABLE "public"."members" TO "authenticated";
GRANT ALL ON TABLE "public"."members" TO "service_role";

GRANT ALL ON TABLE "public"."messages" TO "anon";
GRANT ALL ON TABLE "public"."messages" TO "authenticated";
GRANT ALL ON TABLE "public"."messages" TO "service_role";

GRANT ALL ON SEQUENCE "public"."message_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."message_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."message_id_seq" TO "service_role";

GRANT ALL ON TABLE "public"."users" TO "anon";
GRANT ALL ON TABLE "public"."users" TO "authenticated";
GRANT ALL ON TABLE "public"."users" TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";

ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";

RESET ALL;
