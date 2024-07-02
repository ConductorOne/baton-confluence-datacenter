--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7 (Debian 15.7-1.pgdg120+1)
-- Dumped by pg_dump version 15.7 (Debian 15.7-1.pgdg120+1)

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

--
-- Name: content_function_for_denormalised_permissions(); Type: FUNCTION; Schema: public; Owner: confluence
--

CREATE FUNCTION public.content_function_for_denormalised_permissions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN NEW;
END

$$;


ALTER FUNCTION public.content_function_for_denormalised_permissions() OWNER TO confluence;

--
-- Name: content_perm_set_function_for_denormalised_permissions(); Type: FUNCTION; Schema: public; Owner: confluence
--

CREATE FUNCTION public.content_perm_set_function_for_denormalised_permissions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN NEW;
END

$$;


ALTER FUNCTION public.content_perm_set_function_for_denormalised_permissions() OWNER TO confluence;

--
-- Name: content_permission_function_for_denormalised_permissions(); Type: FUNCTION; Schema: public; Owner: confluence
--

CREATE FUNCTION public.content_permission_function_for_denormalised_permissions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN NEW;
END

$$;


ALTER FUNCTION public.content_permission_function_for_denormalised_permissions() OWNER TO confluence;

--
-- Name: space_function_for_denormalised_permissions(); Type: FUNCTION; Schema: public; Owner: confluence
--

CREATE FUNCTION public.space_function_for_denormalised_permissions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN NEW;
END

$$;


ALTER FUNCTION public.space_function_for_denormalised_permissions() OWNER TO confluence;

--
-- Name: space_permission_function_for_denormalised_permissions(); Type: FUNCTION; Schema: public; Owner: confluence
--

CREATE FUNCTION public.space_permission_function_for_denormalised_permissions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  RETURN NEW;
END

$$;


ALTER FUNCTION public.space_permission_function_for_denormalised_permissions() OWNER TO confluence;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AO_187CCC_SIDEBAR_LINK; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_187CCC_SIDEBAR_LINK" (
    "CATEGORY" character varying(255),
    "CUSTOM_ICON_CLASS" character varying(255),
    "CUSTOM_TITLE" character varying(255),
    "DEST_PAGE_ID" bigint DEFAULT 0,
    "HARDCODED_URL" character varying(255),
    "HIDDEN" boolean,
    "ID" integer NOT NULL,
    "POSITION" integer DEFAULT 0,
    "SPACE_KEY" character varying(255),
    "TYPE" character varying(255),
    "WEB_ITEM_KEY" character varying(255)
);


ALTER TABLE public."AO_187CCC_SIDEBAR_LINK" OWNER TO confluence;

--
-- Name: AO_187CCC_SIDEBAR_LINK_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_187CCC_SIDEBAR_LINK_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_187CCC_SIDEBAR_LINK_ID_seq" OWNER TO confluence;

--
-- Name: AO_187CCC_SIDEBAR_LINK_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_187CCC_SIDEBAR_LINK_ID_seq" OWNED BY public."AO_187CCC_SIDEBAR_LINK"."ID";


--
-- Name: AO_21D670_WHITELIST_RULES; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_21D670_WHITELIST_RULES" (
    "ALLOWINBOUND" boolean,
    "AUTHENTICATIONREQUIRED" boolean DEFAULT false NOT NULL,
    "EXPRESSION" text NOT NULL,
    "ID" integer NOT NULL,
    "TYPE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_21D670_WHITELIST_RULES" OWNER TO confluence;

--
-- Name: AO_21D670_WHITELIST_RULES_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_21D670_WHITELIST_RULES_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_21D670_WHITELIST_RULES_ID_seq" OWNER TO confluence;

--
-- Name: AO_21D670_WHITELIST_RULES_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_21D670_WHITELIST_RULES_ID_seq" OWNED BY public."AO_21D670_WHITELIST_RULES"."ID";


--
-- Name: AO_21F425_MESSAGE_AO; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_21F425_MESSAGE_AO" (
    "CONTENT" text NOT NULL,
    "ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_21F425_MESSAGE_AO" OWNER TO confluence;

--
-- Name: AO_21F425_MESSAGE_MAPPING_AO; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_21F425_MESSAGE_MAPPING_AO" (
    "ID" integer NOT NULL,
    "MESSAGE_ID" character varying(255) NOT NULL,
    "USER_HASH" character varying(255) NOT NULL
);


ALTER TABLE public."AO_21F425_MESSAGE_MAPPING_AO" OWNER TO confluence;

--
-- Name: AO_21F425_MESSAGE_MAPPING_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_21F425_MESSAGE_MAPPING_AO_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_21F425_MESSAGE_MAPPING_AO_ID_seq" OWNER TO confluence;

--
-- Name: AO_21F425_MESSAGE_MAPPING_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_21F425_MESSAGE_MAPPING_AO_ID_seq" OWNED BY public."AO_21F425_MESSAGE_MAPPING_AO"."ID";


--
-- Name: AO_21F425_USER_PROPERTY_AO; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_21F425_USER_PROPERTY_AO" (
    "ID" integer NOT NULL,
    "KEY" character varying(255) NOT NULL,
    "USER" character varying(255) NOT NULL,
    "VALUE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_21F425_USER_PROPERTY_AO" OWNER TO confluence;

--
-- Name: AO_21F425_USER_PROPERTY_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_21F425_USER_PROPERTY_AO_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_21F425_USER_PROPERTY_AO_ID_seq" OWNER TO confluence;

--
-- Name: AO_21F425_USER_PROPERTY_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_21F425_USER_PROPERTY_AO_ID_seq" OWNED BY public."AO_21F425_USER_PROPERTY_AO"."ID";


--
-- Name: AO_32184F_RECONCILIATIONS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_32184F_RECONCILIATIONS" (
    "ANCESTOR" character varying(255),
    "CONTENT_ID" bigint DEFAULT 0 NOT NULL,
    "EVENT_TYPE" character varying(255) NOT NULL,
    "ID" integer NOT NULL,
    "INSERTED" timestamp without time zone NOT NULL,
    "REVISION" character varying(255),
    "TRIGGER" character varying(255)
);


ALTER TABLE public."AO_32184F_RECONCILIATIONS" OWNER TO confluence;

--
-- Name: AO_32184F_RECONCILIATIONS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_32184F_RECONCILIATIONS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_32184F_RECONCILIATIONS_ID_seq" OWNER TO confluence;

--
-- Name: AO_32184F_RECONCILIATIONS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_32184F_RECONCILIATIONS_ID_seq" OWNED BY public."AO_32184F_RECONCILIATIONS"."ID";


--
-- Name: AO_32184F_SYNCHRONY_REQUESTS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_32184F_SYNCHRONY_REQUESTS" (
    "CONTENT_ID" bigint DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL,
    "INSERTED" timestamp without time zone NOT NULL,
    "PAYLOAD" character varying(255),
    "SUCCESSFUL" boolean,
    "TYPE" character varying(255),
    "URL" character varying(255)
);


ALTER TABLE public."AO_32184F_SYNCHRONY_REQUESTS" OWNER TO confluence;

--
-- Name: AO_32184F_SYNCHRONY_REQUESTS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_32184F_SYNCHRONY_REQUESTS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_32184F_SYNCHRONY_REQUESTS_ID_seq" OWNER TO confluence;

--
-- Name: AO_32184F_SYNCHRONY_REQUESTS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_32184F_SYNCHRONY_REQUESTS_ID_seq" OWNED BY public."AO_32184F_SYNCHRONY_REQUESTS"."ID";


--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_38321B_CUSTOM_CONTENT_LINK" (
    "CONTENT_KEY" character varying(255),
    "ID" integer NOT NULL,
    "LINK_LABEL" character varying(255),
    "LINK_URL" character varying(255),
    "SEQUENCE" integer DEFAULT 0
);


ALTER TABLE public."AO_38321B_CUSTOM_CONTENT_LINK" OWNER TO confluence;

--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_38321B_CUSTOM_CONTENT_LINK_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_38321B_CUSTOM_CONTENT_LINK_ID_seq" OWNER TO confluence;

--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_38321B_CUSTOM_CONTENT_LINK_ID_seq" OWNED BY public."AO_38321B_CUSTOM_CONTENT_LINK"."ID";


--
-- Name: AO_4789DD_DISABLED_CHECKS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_4789DD_DISABLED_CHECKS" (
    "HEALTH_CHECK_KEY" character varying(255) NOT NULL,
    "ID" integer NOT NULL
);


ALTER TABLE public."AO_4789DD_DISABLED_CHECKS" OWNER TO confluence;

--
-- Name: AO_4789DD_DISABLED_CHECKS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_4789DD_DISABLED_CHECKS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_DISABLED_CHECKS_ID_seq" OWNER TO confluence;

--
-- Name: AO_4789DD_DISABLED_CHECKS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_4789DD_DISABLED_CHECKS_ID_seq" OWNED BY public."AO_4789DD_DISABLED_CHECKS"."ID";


--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_4789DD_HEALTH_CHECK_STATUS" (
    "APPLICATION_NAME" character varying(255),
    "COMPLETE_KEY" character varying(255),
    "DESCRIPTION" text,
    "FAILED_DATE" timestamp without time zone,
    "FAILURE_REASON" text,
    "ID" integer NOT NULL,
    "IS_HEALTHY" boolean,
    "IS_RESOLVED" boolean,
    "NODE_ID" character varying(255),
    "RESOLVED_DATE" timestamp without time zone,
    "SEVERITY" character varying(255),
    "STATUS_NAME" character varying(255) NOT NULL
);


ALTER TABLE public."AO_4789DD_HEALTH_CHECK_STATUS" OWNER TO confluence;

--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_4789DD_HEALTH_CHECK_STATUS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_HEALTH_CHECK_STATUS_ID_seq" OWNER TO confluence;

--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_4789DD_HEALTH_CHECK_STATUS_ID_seq" OWNED BY public."AO_4789DD_HEALTH_CHECK_STATUS"."ID";


--
-- Name: AO_4789DD_HEALTH_CHECK_WATCHER; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_4789DD_HEALTH_CHECK_WATCHER" (
    "ID" integer NOT NULL,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_4789DD_HEALTH_CHECK_WATCHER" OWNER TO confluence;

--
-- Name: AO_4789DD_HEALTH_CHECK_WATCHER_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_4789DD_HEALTH_CHECK_WATCHER_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_HEALTH_CHECK_WATCHER_ID_seq" OWNER TO confluence;

--
-- Name: AO_4789DD_HEALTH_CHECK_WATCHER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_4789DD_HEALTH_CHECK_WATCHER_ID_seq" OWNED BY public."AO_4789DD_HEALTH_CHECK_WATCHER"."ID";


--
-- Name: AO_4789DD_PROPERTIES; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_4789DD_PROPERTIES" (
    "ID" integer NOT NULL,
    "PROPERTY_NAME" character varying(255) NOT NULL,
    "PROPERTY_VALUE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_4789DD_PROPERTIES" OWNER TO confluence;

--
-- Name: AO_4789DD_PROPERTIES_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_4789DD_PROPERTIES_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_PROPERTIES_ID_seq" OWNER TO confluence;

--
-- Name: AO_4789DD_PROPERTIES_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_4789DD_PROPERTIES_ID_seq" OWNED BY public."AO_4789DD_PROPERTIES"."ID";


--
-- Name: AO_4789DD_READ_NOTIFICATIONS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_4789DD_READ_NOTIFICATIONS" (
    "ID" integer NOT NULL,
    "IS_SNOOZED" boolean,
    "NOTIFICATION_ID" integer NOT NULL,
    "SNOOZE_COUNT" integer,
    "SNOOZE_DATE" timestamp without time zone,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_4789DD_READ_NOTIFICATIONS" OWNER TO confluence;

--
-- Name: AO_4789DD_READ_NOTIFICATIONS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_4789DD_READ_NOTIFICATIONS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_READ_NOTIFICATIONS_ID_seq" OWNER TO confluence;

--
-- Name: AO_4789DD_READ_NOTIFICATIONS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_4789DD_READ_NOTIFICATIONS_ID_seq" OWNED BY public."AO_4789DD_READ_NOTIFICATIONS"."ID";


--
-- Name: AO_4789DD_SHORTENED_KEY; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_4789DD_SHORTENED_KEY" (
    "ID" integer NOT NULL,
    "KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_4789DD_SHORTENED_KEY" OWNER TO confluence;

--
-- Name: AO_4789DD_SHORTENED_KEY_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_4789DD_SHORTENED_KEY_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_SHORTENED_KEY_ID_seq" OWNER TO confluence;

--
-- Name: AO_4789DD_SHORTENED_KEY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_4789DD_SHORTENED_KEY_ID_seq" OWNED BY public."AO_4789DD_SHORTENED_KEY"."ID";


--
-- Name: AO_4789DD_TASK_MONITOR; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_4789DD_TASK_MONITOR" (
    "CLUSTERED_TASK_ID" character varying(255),
    "CREATED_TIMESTAMP" bigint DEFAULT 0,
    "ID" integer NOT NULL,
    "NODE_ID" character varying(255),
    "PROGRESS_MESSAGE" text,
    "PROGRESS_PERCENTAGE" integer,
    "SERIALIZED_ERRORS" text,
    "SERIALIZED_WARNINGS" text,
    "TASK_ID" character varying(255) NOT NULL,
    "TASK_MONITOR_KIND" character varying(255),
    "TASK_STATUS" text
);


ALTER TABLE public."AO_4789DD_TASK_MONITOR" OWNER TO confluence;

--
-- Name: AO_4789DD_TASK_MONITOR_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_4789DD_TASK_MONITOR_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_4789DD_TASK_MONITOR_ID_seq" OWNER TO confluence;

--
-- Name: AO_4789DD_TASK_MONITOR_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_4789DD_TASK_MONITOR_ID_seq" OWNED BY public."AO_4789DD_TASK_MONITOR"."ID";


--
-- Name: AO_54C900_CONTENT_BLUEPRINT_AO; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_54C900_CONTENT_BLUEPRINT_AO" (
    "CREATE_RESULT" character varying(255),
    "HOW_TO_USE_TEMPLATE" character varying(255),
    "ID" integer NOT NULL,
    "INDEX_DISABLED" boolean,
    "INDEX_KEY" character varying(255),
    "INDEX_TITLE_I18N_KEY" character varying(255),
    "NAME" character varying(255),
    "PLUGIN_CLONE" boolean,
    "PLUGIN_MODULE_KEY" character varying(255),
    "SPACE_KEY" character varying(255),
    "UUID" character varying(255)
);


ALTER TABLE public."AO_54C900_CONTENT_BLUEPRINT_AO" OWNER TO confluence;

--
-- Name: AO_54C900_CONTENT_BLUEPRINT_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_54C900_CONTENT_BLUEPRINT_AO_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_54C900_CONTENT_BLUEPRINT_AO_ID_seq" OWNER TO confluence;

--
-- Name: AO_54C900_CONTENT_BLUEPRINT_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_54C900_CONTENT_BLUEPRINT_AO_ID_seq" OWNED BY public."AO_54C900_CONTENT_BLUEPRINT_AO"."ID";


--
-- Name: AO_54C900_C_TEMPLATE_REF; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_54C900_C_TEMPLATE_REF" (
    "CB_INDEX_PARENTID" integer,
    "CB_PARENTID" integer,
    "ID" integer NOT NULL,
    "NAME" character varying(255),
    "PARENT_ID" integer,
    "PLUGIN_CLONE" boolean,
    "PLUGIN_MODULE_KEY" character varying(255),
    "TEMPLATE_ID" bigint DEFAULT 0,
    "UUID" character varying(255)
);


ALTER TABLE public."AO_54C900_C_TEMPLATE_REF" OWNER TO confluence;

--
-- Name: AO_54C900_C_TEMPLATE_REF_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_54C900_C_TEMPLATE_REF_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_54C900_C_TEMPLATE_REF_ID_seq" OWNER TO confluence;

--
-- Name: AO_54C900_C_TEMPLATE_REF_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_54C900_C_TEMPLATE_REF_ID_seq" OWNED BY public."AO_54C900_C_TEMPLATE_REF"."ID";


--
-- Name: AO_54C900_SPACE_BLUEPRINT_AO; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_54C900_SPACE_BLUEPRINT_AO" (
    "CATEGORY" character varying(255),
    "HOME_PAGE_ID" integer,
    "ID" integer NOT NULL,
    "NAME" character varying(255),
    "PLUGIN_CLONE" boolean,
    "PLUGIN_MODULE_KEY" character varying(255),
    "PROMOTED_BPS" text,
    "UUID" character varying(255)
);


ALTER TABLE public."AO_54C900_SPACE_BLUEPRINT_AO" OWNER TO confluence;

--
-- Name: AO_54C900_SPACE_BLUEPRINT_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_54C900_SPACE_BLUEPRINT_AO_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_54C900_SPACE_BLUEPRINT_AO_ID_seq" OWNER TO confluence;

--
-- Name: AO_54C900_SPACE_BLUEPRINT_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_54C900_SPACE_BLUEPRINT_AO_ID_seq" OWNED BY public."AO_54C900_SPACE_BLUEPRINT_AO"."ID";


--
-- Name: AO_563AEE_ACTIVITY_ENTITY; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_563AEE_ACTIVITY_ENTITY" (
    "ACTIVITY_ID" bigint NOT NULL,
    "ACTOR_ID" integer,
    "CONTENT" text,
    "GENERATOR_DISPLAY_NAME" character varying(255),
    "GENERATOR_ID" character varying(450),
    "ICON_ID" integer,
    "ID" character varying(450),
    "ISSUE_KEY" character varying(255),
    "OBJECT_ID" integer,
    "POSTER" character varying(255),
    "PROJECT_KEY" character varying(255),
    "PUBLISHED" timestamp without time zone,
    "TARGET_ID" integer,
    "TITLE" character varying(255),
    "URL" character varying(450),
    "USERNAME" character varying(255),
    "VERB" character varying(450)
);


ALTER TABLE public."AO_563AEE_ACTIVITY_ENTITY" OWNER TO confluence;

--
-- Name: AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq" OWNER TO confluence;

--
-- Name: AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq" OWNED BY public."AO_563AEE_ACTIVITY_ENTITY"."ACTIVITY_ID";


--
-- Name: AO_563AEE_ACTOR_ENTITY; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_563AEE_ACTOR_ENTITY" (
    "FULL_NAME" character varying(255),
    "ID" integer NOT NULL,
    "PROFILE_PAGE_URI" character varying(450),
    "PROFILE_PICTURE_URI" character varying(450),
    "USERNAME" character varying(255)
);


ALTER TABLE public."AO_563AEE_ACTOR_ENTITY" OWNER TO confluence;

--
-- Name: AO_563AEE_ACTOR_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_563AEE_ACTOR_ENTITY_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_ACTOR_ENTITY_ID_seq" OWNER TO confluence;

--
-- Name: AO_563AEE_ACTOR_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_563AEE_ACTOR_ENTITY_ID_seq" OWNED BY public."AO_563AEE_ACTOR_ENTITY"."ID";


--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_563AEE_MEDIA_LINK_ENTITY" (
    "DURATION" integer,
    "HEIGHT" integer,
    "ID" integer NOT NULL,
    "URL" character varying(450),
    "WIDTH" integer
);


ALTER TABLE public."AO_563AEE_MEDIA_LINK_ENTITY" OWNER TO confluence;

--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_563AEE_MEDIA_LINK_ENTITY_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_MEDIA_LINK_ENTITY_ID_seq" OWNER TO confluence;

--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_563AEE_MEDIA_LINK_ENTITY_ID_seq" OWNED BY public."AO_563AEE_MEDIA_LINK_ENTITY"."ID";


--
-- Name: AO_563AEE_OBJECT_ENTITY; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_563AEE_OBJECT_ENTITY" (
    "CONTENT" character varying(255),
    "DISPLAY_NAME" character varying(255),
    "ID" integer NOT NULL,
    "IMAGE_ID" integer,
    "OBJECT_ID" character varying(450),
    "OBJECT_TYPE" character varying(450),
    "SUMMARY" character varying(255),
    "URL" character varying(450)
);


ALTER TABLE public."AO_563AEE_OBJECT_ENTITY" OWNER TO confluence;

--
-- Name: AO_563AEE_OBJECT_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_563AEE_OBJECT_ENTITY_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_OBJECT_ENTITY_ID_seq" OWNER TO confluence;

--
-- Name: AO_563AEE_OBJECT_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_563AEE_OBJECT_ENTITY_ID_seq" OWNED BY public."AO_563AEE_OBJECT_ENTITY"."ID";


--
-- Name: AO_563AEE_TARGET_ENTITY; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_563AEE_TARGET_ENTITY" (
    "CONTENT" character varying(255),
    "DISPLAY_NAME" character varying(255),
    "ID" integer NOT NULL,
    "IMAGE_ID" integer,
    "OBJECT_ID" character varying(450),
    "OBJECT_TYPE" character varying(450),
    "SUMMARY" character varying(255),
    "URL" character varying(450)
);


ALTER TABLE public."AO_563AEE_TARGET_ENTITY" OWNER TO confluence;

--
-- Name: AO_563AEE_TARGET_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_563AEE_TARGET_ENTITY_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_563AEE_TARGET_ENTITY_ID_seq" OWNER TO confluence;

--
-- Name: AO_563AEE_TARGET_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_563AEE_TARGET_ENTITY_ID_seq" OWNED BY public."AO_563AEE_TARGET_ENTITY"."ID";


--
-- Name: AO_59F889_ZDU_CLUSTER_NODES; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_59F889_ZDU_CLUSTER_NODES" (
    "ID" integer NOT NULL,
    "IP_ADDRESS" character varying(255) NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "NODE_ID" character varying(255) NOT NULL,
    "PORT_NUMBER" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."AO_59F889_ZDU_CLUSTER_NODES" OWNER TO confluence;

--
-- Name: AO_59F889_ZDU_CLUSTER_NODES_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_59F889_ZDU_CLUSTER_NODES_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_59F889_ZDU_CLUSTER_NODES_ID_seq" OWNER TO confluence;

--
-- Name: AO_59F889_ZDU_CLUSTER_NODES_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_59F889_ZDU_CLUSTER_NODES_ID_seq" OWNED BY public."AO_59F889_ZDU_CLUSTER_NODES"."ID";


--
-- Name: AO_5F3884_FEATURE_DISCOVERY; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_5F3884_FEATURE_DISCOVERY" (
    "DISCOVERED" boolean,
    "ID" integer NOT NULL,
    "USER_KEY" character varying(255)
);


ALTER TABLE public."AO_5F3884_FEATURE_DISCOVERY" OWNER TO confluence;

--
-- Name: AO_5F3884_FEATURE_DISCOVERY_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_5F3884_FEATURE_DISCOVERY_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_5F3884_FEATURE_DISCOVERY_ID_seq" OWNER TO confluence;

--
-- Name: AO_5F3884_FEATURE_DISCOVERY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_5F3884_FEATURE_DISCOVERY_ID_seq" OWNED BY public."AO_5F3884_FEATURE_DISCOVERY"."ID";


--
-- Name: AO_6384AB_DISCOVERED; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_6384AB_DISCOVERED" (
    "DATE" timestamp without time zone,
    "ID" integer NOT NULL,
    "KEY" character varying(255),
    "PLUGIN_KEY" character varying(255),
    "USER_KEY" character varying(255)
);


ALTER TABLE public."AO_6384AB_DISCOVERED" OWNER TO confluence;

--
-- Name: AO_6384AB_DISCOVERED_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_6384AB_DISCOVERED_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_6384AB_DISCOVERED_ID_seq" OWNER TO confluence;

--
-- Name: AO_6384AB_DISCOVERED_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_6384AB_DISCOVERED_ID_seq" OWNED BY public."AO_6384AB_DISCOVERED"."ID";


--
-- Name: AO_6384AB_FEATURE_METADATA_AO; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_6384AB_FEATURE_METADATA_AO" (
    "CONTEXT" character varying(255),
    "ID" integer NOT NULL,
    "INSTALLATION_DATE" timestamp without time zone,
    "KEY" character varying(255)
);


ALTER TABLE public."AO_6384AB_FEATURE_METADATA_AO" OWNER TO confluence;

--
-- Name: AO_6384AB_FEATURE_METADATA_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_6384AB_FEATURE_METADATA_AO_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_6384AB_FEATURE_METADATA_AO_ID_seq" OWNER TO confluence;

--
-- Name: AO_6384AB_FEATURE_METADATA_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_6384AB_FEATURE_METADATA_AO_ID_seq" OWNED BY public."AO_6384AB_FEATURE_METADATA_AO"."ID";


--
-- Name: AO_723324_CLIENT_CONFIG; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_723324_CLIENT_CONFIG" (
    "AUTHORIZATION_ENDPOINT" character varying(255) NOT NULL,
    "CLIENT_ID" character varying(255) NOT NULL,
    "CLIENT_SECRET" character varying(255) NOT NULL,
    "DESCRIPTION" character varying(255),
    "ID" character varying(255) NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "SCOPES" text NOT NULL,
    "TOKEN_ENDPOINT" character varying(255) NOT NULL,
    "TYPE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_723324_CLIENT_CONFIG" OWNER TO confluence;

--
-- Name: AO_723324_CLIENT_TOKEN; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_723324_CLIENT_TOKEN" (
    "ACCESS_TOKEN" text NOT NULL,
    "ACCESS_TOKEN_EXPIRATION" bigint DEFAULT 0 NOT NULL,
    "CONFIG_ID" character varying(255) NOT NULL,
    "ID" character varying(255) NOT NULL,
    "LAST_REFRESHED" bigint,
    "LAST_STATUS_UPDATED" bigint NOT NULL,
    "REFRESH_COUNT" integer DEFAULT 0,
    "REFRESH_TOKEN" text,
    "REFRESH_TOKEN_EXPIRATION" bigint,
    "STATUS" character varying(255) NOT NULL
);


ALTER TABLE public."AO_723324_CLIENT_TOKEN" OWNER TO confluence;

--
-- Name: AO_7B47A5_EVENT; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_7B47A5_EVENT" (
    "CONTAINER_ID" bigint DEFAULT 0,
    "CONTENT_ID" bigint,
    "EVENT_AT" bigint DEFAULT 0 NOT NULL,
    "ID" bigint NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "SPACE_KEY" character varying(255),
    "USER_KEY" character varying(255),
    "VERSION_MODIFICATION_DATE" bigint
);


ALTER TABLE public."AO_7B47A5_EVENT" OWNER TO confluence;

--
-- Name: AO_7B47A5_EVENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_7B47A5_EVENT_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_7B47A5_EVENT_ID_seq" OWNER TO confluence;

--
-- Name: AO_7B47A5_EVENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_7B47A5_EVENT_ID_seq" OWNED BY public."AO_7B47A5_EVENT"."ID";


--
-- Name: AO_7B47A5_SETTINGS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_7B47A5_SETTINGS" (
    "CREATED_AT" bigint DEFAULT 0 NOT NULL,
    "ID" bigint NOT NULL,
    "KEY" character varying(255) NOT NULL,
    "UPDATED_AT" bigint DEFAULT 0 NOT NULL,
    "VALUE" text NOT NULL
);


ALTER TABLE public."AO_7B47A5_SETTINGS" OWNER TO confluence;

--
-- Name: AO_7B47A5_SETTINGS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_7B47A5_SETTINGS_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_7B47A5_SETTINGS_ID_seq" OWNER TO confluence;

--
-- Name: AO_7B47A5_SETTINGS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_7B47A5_SETTINGS_ID_seq" OWNED BY public."AO_7B47A5_SETTINGS"."ID";


--
-- Name: AO_7CDE43_EVENT; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_7CDE43_EVENT" (
    "EVENT_KEY" character varying(255),
    "ID" integer NOT NULL,
    "NOTIFICATION_ID" integer
);


ALTER TABLE public."AO_7CDE43_EVENT" OWNER TO confluence;

--
-- Name: AO_7CDE43_EVENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_7CDE43_EVENT_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_7CDE43_EVENT_ID_seq" OWNER TO confluence;

--
-- Name: AO_7CDE43_EVENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_7CDE43_EVENT_ID_seq" OWNED BY public."AO_7CDE43_EVENT"."ID";


--
-- Name: AO_7CDE43_FILTER_PARAM; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_7CDE43_FILTER_PARAM" (
    "ID" integer NOT NULL,
    "NOTIFICATION_ID" integer,
    "PARAM_KEY" character varying(255),
    "PARAM_VALUE" text
);


ALTER TABLE public."AO_7CDE43_FILTER_PARAM" OWNER TO confluence;

--
-- Name: AO_7CDE43_FILTER_PARAM_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_7CDE43_FILTER_PARAM_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_7CDE43_FILTER_PARAM_ID_seq" OWNER TO confluence;

--
-- Name: AO_7CDE43_FILTER_PARAM_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_7CDE43_FILTER_PARAM_ID_seq" OWNED BY public."AO_7CDE43_FILTER_PARAM"."ID";


--
-- Name: AO_7CDE43_NOTIFICATION; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_7CDE43_NOTIFICATION" (
    "ID" integer NOT NULL,
    "NOTIFICATION_SCHEME_ID" integer
);


ALTER TABLE public."AO_7CDE43_NOTIFICATION" OWNER TO confluence;

--
-- Name: AO_7CDE43_NOTIFICATION_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_7CDE43_NOTIFICATION_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_7CDE43_NOTIFICATION_ID_seq" OWNER TO confluence;

--
-- Name: AO_7CDE43_NOTIFICATION_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_7CDE43_NOTIFICATION_ID_seq" OWNED BY public."AO_7CDE43_NOTIFICATION"."ID";


--
-- Name: AO_7CDE43_NOTIFICATION_SCHEME; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_7CDE43_NOTIFICATION_SCHEME" (
    "DESCRIPTION" text,
    "ID" integer NOT NULL,
    "SCHEME_NAME" character varying(255)
);


ALTER TABLE public."AO_7CDE43_NOTIFICATION_SCHEME" OWNER TO confluence;

--
-- Name: AO_7CDE43_NOTIFICATION_SCHEME_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_7CDE43_NOTIFICATION_SCHEME_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_7CDE43_NOTIFICATION_SCHEME_ID_seq" OWNER TO confluence;

--
-- Name: AO_7CDE43_NOTIFICATION_SCHEME_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_7CDE43_NOTIFICATION_SCHEME_ID_seq" OWNED BY public."AO_7CDE43_NOTIFICATION_SCHEME"."ID";


--
-- Name: AO_7CDE43_RECIPIENT; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_7CDE43_RECIPIENT" (
    "ID" integer NOT NULL,
    "INDIVIDUAL" boolean,
    "NOTIFICATION_ID" integer,
    "PARAM_DISPLAY" text,
    "PARAM_VALUE" text,
    "SERVER_ID" integer DEFAULT 0,
    "TYPE" character varying(255)
);


ALTER TABLE public."AO_7CDE43_RECIPIENT" OWNER TO confluence;

--
-- Name: AO_7CDE43_RECIPIENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_7CDE43_RECIPIENT_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_7CDE43_RECIPIENT_ID_seq" OWNER TO confluence;

--
-- Name: AO_7CDE43_RECIPIENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_7CDE43_RECIPIENT_ID_seq" OWNED BY public."AO_7CDE43_RECIPIENT"."ID";


--
-- Name: AO_7CDE43_SERVER_CONFIG; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_7CDE43_SERVER_CONFIG" (
    "CUSTOM_TEMPLATE_PATH" text,
    "DEFAULT_USER_ID_TEMPLATE" character varying(255),
    "ENABLED_FOR_ALL_USERS" boolean,
    "GROUPS_WITH_ACCESS" text,
    "ID" integer NOT NULL,
    "NOTIFICATION_MEDIUM_KEY" character varying(255),
    "SERVER_NAME" character varying(255)
);


ALTER TABLE public."AO_7CDE43_SERVER_CONFIG" OWNER TO confluence;

--
-- Name: AO_7CDE43_SERVER_CONFIG_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_7CDE43_SERVER_CONFIG_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_7CDE43_SERVER_CONFIG_ID_seq" OWNER TO confluence;

--
-- Name: AO_7CDE43_SERVER_CONFIG_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_7CDE43_SERVER_CONFIG_ID_seq" OWNED BY public."AO_7CDE43_SERVER_CONFIG"."ID";


--
-- Name: AO_7CDE43_SERVER_PARAM; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_7CDE43_SERVER_PARAM" (
    "ID" integer NOT NULL,
    "PARAM_KEY" character varying(255),
    "PARAM_VALUE" text,
    "SERVER_CONFIG_ID" integer
);


ALTER TABLE public."AO_7CDE43_SERVER_PARAM" OWNER TO confluence;

--
-- Name: AO_7CDE43_SERVER_PARAM_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_7CDE43_SERVER_PARAM_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_7CDE43_SERVER_PARAM_ID_seq" OWNER TO confluence;

--
-- Name: AO_7CDE43_SERVER_PARAM_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_7CDE43_SERVER_PARAM_ID_seq" OWNED BY public."AO_7CDE43_SERVER_PARAM"."ID";


--
-- Name: AO_81F455_PERSONAL_TOKEN; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_81F455_PERSONAL_TOKEN" (
    "CREATED_AT" timestamp without time zone NOT NULL,
    "EXPIRING_AT" timestamp without time zone NOT NULL,
    "HASHED_TOKEN" character varying(255) NOT NULL,
    "ID" bigint NOT NULL,
    "LAST_ACCESSED_AT" timestamp without time zone,
    "NAME" character varying(255) NOT NULL,
    "NOTIFICATION_STATE" character varying(255) NOT NULL,
    "TOKEN_ID" character varying(255) NOT NULL,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_81F455_PERSONAL_TOKEN" OWNER TO confluence;

--
-- Name: AO_81F455_PERSONAL_TOKEN_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_81F455_PERSONAL_TOKEN_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_81F455_PERSONAL_TOKEN_ID_seq" OWNER TO confluence;

--
-- Name: AO_81F455_PERSONAL_TOKEN_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_81F455_PERSONAL_TOKEN_ID_seq" OWNED BY public."AO_81F455_PERSONAL_TOKEN"."ID";


--
-- Name: AO_8752F1_DATA_PIPELINE_CONFIG; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_8752F1_DATA_PIPELINE_CONFIG" (
    "ID" integer NOT NULL,
    "KEY" character varying(250) NOT NULL,
    "VALUE" text
);


ALTER TABLE public."AO_8752F1_DATA_PIPELINE_CONFIG" OWNER TO confluence;

--
-- Name: AO_8752F1_DATA_PIPELINE_CONFIG_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_8752F1_DATA_PIPELINE_CONFIG_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_8752F1_DATA_PIPELINE_CONFIG_ID_seq" OWNER TO confluence;

--
-- Name: AO_8752F1_DATA_PIPELINE_CONFIG_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_8752F1_DATA_PIPELINE_CONFIG_ID_seq" OWNED BY public."AO_8752F1_DATA_PIPELINE_CONFIG"."ID";


--
-- Name: AO_8752F1_DATA_PIPELINE_EOO; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_8752F1_DATA_PIPELINE_EOO" (
    "ENTITY_IDENTIFIER" character varying(255) NOT NULL,
    "ENTITY_TYPE" character varying(255) NOT NULL,
    "ID" integer NOT NULL
);


ALTER TABLE public."AO_8752F1_DATA_PIPELINE_EOO" OWNER TO confluence;

--
-- Name: AO_8752F1_DATA_PIPELINE_EOO_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_8752F1_DATA_PIPELINE_EOO_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_8752F1_DATA_PIPELINE_EOO_ID_seq" OWNER TO confluence;

--
-- Name: AO_8752F1_DATA_PIPELINE_EOO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_8752F1_DATA_PIPELINE_EOO_ID_seq" OWNED BY public."AO_8752F1_DATA_PIPELINE_EOO"."ID";


--
-- Name: AO_8752F1_DATA_PIPELINE_JOB; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_8752F1_DATA_PIPELINE_JOB" (
    "CREATED" bigint NOT NULL,
    "ERRORS" text,
    "EXPORTED_ENTITIES" integer,
    "EXPORT_FORCED" boolean,
    "EXPORT_FROM" bigint NOT NULL,
    "EXPORT_PATH" text,
    "ID" integer NOT NULL,
    "METADATA" character varying(255),
    "OPTED_OUT_ENTITY_IDENTIFIERS" text,
    "ROOT_EXPORT_PATH" character varying(255),
    "SCHEMA_VERSION" integer DEFAULT 0 NOT NULL,
    "STATUS" character varying(255) NOT NULL,
    "UPDATED" bigint NOT NULL,
    "WARNINGS" text,
    "WRITTEN_ROWS" integer
);


ALTER TABLE public."AO_8752F1_DATA_PIPELINE_JOB" OWNER TO confluence;

--
-- Name: AO_8752F1_DATA_PIPELINE_JOB_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_8752F1_DATA_PIPELINE_JOB_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_8752F1_DATA_PIPELINE_JOB_ID_seq" OWNER TO confluence;

--
-- Name: AO_8752F1_DATA_PIPELINE_JOB_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_8752F1_DATA_PIPELINE_JOB_ID_seq" OWNED BY public."AO_8752F1_DATA_PIPELINE_JOB"."ID";


--
-- Name: AO_88BB94_BATCH_NOTIFICATION; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_88BB94_BATCH_NOTIFICATION" (
    "BATCHING_COLUMN" character varying(255) NOT NULL,
    "CONTENT_TYPE" character varying(255) NOT NULL,
    "ID" integer NOT NULL,
    "NOTIFICATION_KEY" character varying(255) NOT NULL,
    "PAYLOAD" text NOT NULL
);


ALTER TABLE public."AO_88BB94_BATCH_NOTIFICATION" OWNER TO confluence;

--
-- Name: AO_88BB94_BATCH_NOTIFICATION_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_88BB94_BATCH_NOTIFICATION_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_88BB94_BATCH_NOTIFICATION_ID_seq" OWNER TO confluence;

--
-- Name: AO_88BB94_BATCH_NOTIFICATION_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_88BB94_BATCH_NOTIFICATION_ID_seq" OWNED BY public."AO_88BB94_BATCH_NOTIFICATION"."ID";


--
-- Name: AO_92296B_AORECENTLY_VIEWED; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_92296B_AORECENTLY_VIEWED" (
    "CONTENT_ID" bigint,
    "CONTENT_TYPE" character varying(255),
    "ID" bigint NOT NULL,
    "LAST_VIEW_DATE" timestamp without time zone,
    "SPACE_KEY" character varying(255),
    "USER_KEY" character varying(255)
);


ALTER TABLE public."AO_92296B_AORECENTLY_VIEWED" OWNER TO confluence;

--
-- Name: AO_92296B_AORECENTLY_VIEWED_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_92296B_AORECENTLY_VIEWED_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_92296B_AORECENTLY_VIEWED_ID_seq" OWNER TO confluence;

--
-- Name: AO_92296B_AORECENTLY_VIEWED_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_92296B_AORECENTLY_VIEWED_ID_seq" OWNED BY public."AO_92296B_AORECENTLY_VIEWED"."ID";


--
-- Name: AO_9412A1_AONOTIFICATION; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_9412A1_AONOTIFICATION" (
    "ACTION" character varying(255),
    "ACTION_ICON_URL" text,
    "APPLICATION" character varying(255),
    "APPLICATION_LINK_ID" character varying(255),
    "CREATED" timestamp without time zone,
    "DESCRIPTION" text,
    "ENTITY" character varying(255),
    "GLOBAL_ID" character varying(255),
    "GROUPING_ID" character varying(255),
    "ICON_URL" text,
    "ID" bigint NOT NULL,
    "ITEM_ICON_URL" text,
    "ITEM_TITLE" text,
    "ITEM_URL" text,
    "METADATA" text,
    "PINNED" boolean DEFAULT false,
    "READ" boolean DEFAULT false,
    "STATUS" character varying(255),
    "TITLE" text,
    "UPDATED" timestamp without time zone,
    "URL" text,
    "USER" character varying(255)
);


ALTER TABLE public."AO_9412A1_AONOTIFICATION" OWNER TO confluence;

--
-- Name: AO_9412A1_AONOTIFICATION_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_9412A1_AONOTIFICATION_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_9412A1_AONOTIFICATION_ID_seq" OWNER TO confluence;

--
-- Name: AO_9412A1_AONOTIFICATION_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_9412A1_AONOTIFICATION_ID_seq" OWNED BY public."AO_9412A1_AONOTIFICATION"."ID";


--
-- Name: AO_9412A1_AOREGISTRATION; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_9412A1_AOREGISTRATION" (
    "DATA" text,
    "ID" character varying(255) NOT NULL,
    "UPDATED" timestamp without time zone
);


ALTER TABLE public."AO_9412A1_AOREGISTRATION" OWNER TO confluence;

--
-- Name: AO_9412A1_AOTASK; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_9412A1_AOTASK" (
    "APPLICATION" character varying(255),
    "APPLICATION_LINK_ID" character varying(255),
    "CREATED" timestamp without time zone,
    "DESCRIPTION" text,
    "ENTITY" character varying(255),
    "GLOBAL_ID" character varying(255),
    "ID" bigint NOT NULL,
    "ITEM_ICON_URL" text,
    "ITEM_TITLE" text,
    "METADATA" text,
    "STATUS" character varying(255),
    "TITLE" text,
    "UPDATED" timestamp without time zone,
    "URL" text,
    "USER" character varying(255)
);


ALTER TABLE public."AO_9412A1_AOTASK" OWNER TO confluence;

--
-- Name: AO_9412A1_AOTASK_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_9412A1_AOTASK_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_9412A1_AOTASK_ID_seq" OWNER TO confluence;

--
-- Name: AO_9412A1_AOTASK_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_9412A1_AOTASK_ID_seq" OWNED BY public."AO_9412A1_AOTASK"."ID";


--
-- Name: AO_9412A1_AOUSER; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_9412A1_AOUSER" (
    "CREATED" timestamp without time zone,
    "ID" bigint NOT NULL,
    "LAST_READ_NOTIFICATION_ID" bigint DEFAULT 0,
    "TASK_ORDERING" text,
    "UPDATED" timestamp without time zone,
    "USERNAME" character varying(255) NOT NULL
);


ALTER TABLE public."AO_9412A1_AOUSER" OWNER TO confluence;

--
-- Name: AO_9412A1_AOUSER_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_9412A1_AOUSER_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_9412A1_AOUSER_ID_seq" OWNER TO confluence;

--
-- Name: AO_9412A1_AOUSER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_9412A1_AOUSER_ID_seq" OWNED BY public."AO_9412A1_AOUSER"."ID";


--
-- Name: AO_9412A1_USER_APP_LINK; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_9412A1_USER_APP_LINK" (
    "APPLICATION_LINK_ID" character varying(255),
    "AUTH_VERIFIED" boolean,
    "CREATED" timestamp without time zone,
    "ID" bigint NOT NULL,
    "UPDATED" timestamp without time zone,
    "USER_ID" bigint
);


ALTER TABLE public."AO_9412A1_USER_APP_LINK" OWNER TO confluence;

--
-- Name: AO_9412A1_USER_APP_LINK_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_9412A1_USER_APP_LINK_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_9412A1_USER_APP_LINK_ID_seq" OWNER TO confluence;

--
-- Name: AO_9412A1_USER_APP_LINK_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_9412A1_USER_APP_LINK_ID_seq" OWNED BY public."AO_9412A1_USER_APP_LINK"."ID";


--
-- Name: AO_950DC3_TC_CUSTOM_EV_TYPES; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_CUSTOM_EV_TYPES" (
    "BELONG_SUB_CALENDAR_ID" character varying(255),
    "CREATED" character varying(255),
    "ICON" character varying(255) NOT NULL,
    "ID" character varying(255) NOT NULL,
    "TITLE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_CUSTOM_EV_TYPES" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_DISABLE_EV_TYPES; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_DISABLE_EV_TYPES" (
    "EVENT_KEY" character varying(255) NOT NULL,
    "ID" integer NOT NULL,
    "SUB_CALENDAR_ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_DISABLE_EV_TYPES" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_DISABLE_EV_TYPES_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_DISABLE_EV_TYPES_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_DISABLE_EV_TYPES_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_DISABLE_EV_TYPES_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_DISABLE_EV_TYPES_ID_seq" OWNED BY public."AO_950DC3_TC_DISABLE_EV_TYPES"."ID";


--
-- Name: AO_950DC3_TC_EVENTS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_EVENTS" (
    "ALL_DAY" boolean NOT NULL,
    "CREATED" bigint DEFAULT 0 NOT NULL,
    "DESCRIPTION" text,
    "END" bigint DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL,
    "LAST_MODIFIED" bigint DEFAULT 0,
    "LOCATION" text,
    "ORGANISER" character varying(255),
    "RECURRENCE_ID_TIMESTAMP" bigint,
    "RECURRENCE_RULE" character varying(255),
    "REMINDER_SETTING_ID" character varying(255),
    "SEQUENCE" integer DEFAULT 0 NOT NULL,
    "START" bigint DEFAULT 0 NOT NULL,
    "SUB_CALENDAR_ID" character varying(255) NOT NULL,
    "SUMMARY" text,
    "URL" text,
    "UTC_END" bigint DEFAULT 0,
    "UTC_START" bigint DEFAULT 0,
    "VEVENT_UID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_EVENTS" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_EVENTS_EXCL; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_EVENTS_EXCL" (
    "ALL_DAY" boolean NOT NULL,
    "EVENT_ID" integer NOT NULL,
    "EXCLUSION" bigint DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_EVENTS_EXCL" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_EVENTS_EXCL_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_EVENTS_EXCL_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_EVENTS_EXCL_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_EVENTS_EXCL_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_EVENTS_EXCL_ID_seq" OWNED BY public."AO_950DC3_TC_EVENTS_EXCL"."ID";


--
-- Name: AO_950DC3_TC_EVENTS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_EVENTS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_EVENTS_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_EVENTS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_EVENTS_ID_seq" OWNED BY public."AO_950DC3_TC_EVENTS"."ID";


--
-- Name: AO_950DC3_TC_EVENTS_INVITEES; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_EVENTS_INVITEES" (
    "EVENT_ID" integer NOT NULL,
    "ID" integer NOT NULL,
    "INVITEE_ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_EVENTS_INVITEES" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_EVENTS_INVITEES_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_EVENTS_INVITEES_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_EVENTS_INVITEES_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_EVENTS_INVITEES_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_EVENTS_INVITEES_ID_seq" OWNED BY public."AO_950DC3_TC_EVENTS_INVITEES"."ID";


--
-- Name: AO_950DC3_TC_JIRA_REMI_EVENTS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_JIRA_REMI_EVENTS" (
    "ALL_DAY" boolean DEFAULT false NOT NULL,
    "ASSIGNEE" character varying(255),
    "DESCRIPTION" text,
    "EVENT_TYPE" character varying(255),
    "ID" integer NOT NULL,
    "ISSUE_ICON_URL" character varying(255),
    "ISSUE_LINK" character varying(255),
    "JQL" character varying(255),
    "KEY_ID" character varying(255) NOT NULL,
    "STATUS" character varying(255),
    "SUB_CALENDAR_ID" character varying(255) NOT NULL,
    "TICKET_ID" character varying(255),
    "TITLE" character varying(255),
    "USER_ID" character varying(255),
    "UTC_END" bigint DEFAULT 0,
    "UTC_START" bigint DEFAULT 0
);


ALTER TABLE public."AO_950DC3_TC_JIRA_REMI_EVENTS" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_JIRA_REMI_EVENTS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_JIRA_REMI_EVENTS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_JIRA_REMI_EVENTS_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_JIRA_REMI_EVENTS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_JIRA_REMI_EVENTS_ID_seq" OWNED BY public."AO_950DC3_TC_JIRA_REMI_EVENTS"."ID";


--
-- Name: AO_950DC3_TC_REMINDER_SETTINGS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_REMINDER_SETTINGS" (
    "CUSTOM_EVENT_TYPE_ID" character varying(255),
    "ID" character varying(255) NOT NULL,
    "LAST_MODIFIER" character varying(255),
    "PERIOD" bigint DEFAULT 0 NOT NULL,
    "STORE_KEY" character varying(255) NOT NULL,
    "SUB_CALENDAR_ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_REMINDER_SETTINGS" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_REMINDER_USERS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_REMINDER_USERS" (
    "ID" integer NOT NULL,
    "SUB_CALENDAR_ID" character varying(255) NOT NULL,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_REMINDER_USERS" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_REMINDER_USERS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_REMINDER_USERS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_REMINDER_USERS_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_REMINDER_USERS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_REMINDER_USERS_ID_seq" OWNED BY public."AO_950DC3_TC_REMINDER_USERS"."ID";


--
-- Name: AO_950DC3_TC_SUBCALS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_SUBCALS" (
    "COLOUR" character varying(255),
    "CREATED" bigint DEFAULT 0,
    "CREATOR" character varying(255),
    "DESCRIPTION" text,
    "ID" character varying(255) NOT NULL,
    "LAST_MODIFIED" bigint DEFAULT 0,
    "NAME" text NOT NULL,
    "PARENT_ID" character varying(255),
    "SPACE_KEY" character varying(255),
    "STORE_KEY" character varying(255) NOT NULL,
    "SUBSCRIPTION_ID" character varying(255),
    "TIME_ZONE_ID" character varying(255),
    "USING_CUSTOM_EVENT_TYPE_ID" character varying(255)
);


ALTER TABLE public."AO_950DC3_TC_SUBCALS" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_SUBCALS_IN_SPACE; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_SUBCALS_IN_SPACE" (
    "ID" integer NOT NULL,
    "SPACE_KEY" character varying(255) NOT NULL,
    "SUB_CALENDAR_ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_SUBCALS_IN_SPACE" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_SUBCALS_IN_SPACE_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_SUBCALS_IN_SPACE_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_SUBCALS_IN_SPACE_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_SUBCALS_IN_SPACE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_SUBCALS_IN_SPACE_ID_seq" OWNED BY public."AO_950DC3_TC_SUBCALS_IN_SPACE"."ID";


--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_GRP; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_SUBCALS_PRIV_GRP" (
    "GROUP_NAME" character varying(255) NOT NULL,
    "ID" integer NOT NULL,
    "SUB_CALENDAR_ID" character varying(255) NOT NULL,
    "TYPE" character varying(255) NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_SUBCALS_PRIV_GRP" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_GRP_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_SUBCALS_PRIV_GRP_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_SUBCALS_PRIV_GRP_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_GRP_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_SUBCALS_PRIV_GRP_ID_seq" OWNED BY public."AO_950DC3_TC_SUBCALS_PRIV_GRP"."ID";


--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_USR; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_SUBCALS_PRIV_USR" (
    "ID" integer NOT NULL,
    "SUB_CALENDAR_ID" character varying(255) NOT NULL,
    "TYPE" character varying(255) NOT NULL,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_SUBCALS_PRIV_USR" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_USR_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_SUBCALS_PRIV_USR_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_SUBCALS_PRIV_USR_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_USR_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_SUBCALS_PRIV_USR_ID_seq" OWNED BY public."AO_950DC3_TC_SUBCALS_PRIV_USR"."ID";


--
-- Name: AO_950DC3_TC_SUBCALS_PROPS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_950DC3_TC_SUBCALS_PROPS" (
    "ID" integer NOT NULL,
    "KEY" character varying(255) NOT NULL,
    "SUB_CALENDAR_ID" character varying(255) NOT NULL,
    "VALUE" text NOT NULL
);


ALTER TABLE public."AO_950DC3_TC_SUBCALS_PROPS" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_SUBCALS_PROPS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_950DC3_TC_SUBCALS_PROPS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_950DC3_TC_SUBCALS_PROPS_ID_seq" OWNER TO confluence;

--
-- Name: AO_950DC3_TC_SUBCALS_PROPS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_950DC3_TC_SUBCALS_PROPS_ID_seq" OWNED BY public."AO_950DC3_TC_SUBCALS_PROPS"."ID";


--
-- Name: AO_954A21_PUSH_NOTIFICATION_AO; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_954A21_PUSH_NOTIFICATION_AO" (
    "ACTIVE" boolean,
    "APP_NAME" character varying(255) NOT NULL,
    "BUILD" character varying(255),
    "CUSTOM_SETTING" character varying(255),
    "DEVICE_ID" character varying(255),
    "ENDPOINT" character varying(255),
    "GROUP_SETTING" character varying(255),
    "ID" character varying(255) NOT NULL,
    "STATUS_UPDATED_TIME" bigint,
    "TOKEN" character varying(255),
    "USER_NAME" character varying(255) NOT NULL
);


ALTER TABLE public."AO_954A21_PUSH_NOTIFICATION_AO" OWNER TO confluence;

--
-- Name: AO_A0B856_DAILY_COUNTS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_A0B856_DAILY_COUNTS" (
    "DAY_SINCE_EPOCH" bigint DEFAULT 0 NOT NULL,
    "ERRORS" integer DEFAULT 0 NOT NULL,
    "EVENT_ID" character varying(64) NOT NULL,
    "FAILURES" integer DEFAULT 0 NOT NULL,
    "ID" character varying(88) NOT NULL,
    "SUCCESSES" integer DEFAULT 0 NOT NULL,
    "WEBHOOK_ID" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."AO_A0B856_DAILY_COUNTS" OWNER TO confluence;

--
-- Name: AO_A0B856_HIST_INVOCATION; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_A0B856_HIST_INVOCATION" (
    "ERROR_CONTENT" text,
    "EVENT_ID" character varying(64) NOT NULL,
    "FINISH" bigint DEFAULT 0 NOT NULL,
    "ID" character varying(77) NOT NULL,
    "OUTCOME" character varying(255) NOT NULL,
    "REQUEST_BODY" text,
    "REQUEST_HEADERS" text,
    "REQUEST_ID" character varying(64) NOT NULL,
    "REQUEST_METHOD" character varying(16) NOT NULL,
    "REQUEST_URL" character varying(255) NOT NULL,
    "RESPONSE_BODY" text,
    "RESPONSE_HEADERS" text,
    "RESULT_DESCRIPTION" character varying(255) NOT NULL,
    "START" bigint DEFAULT 0 NOT NULL,
    "STATUS_CODE" integer,
    "WEBHOOK_ID" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."AO_A0B856_HIST_INVOCATION" OWNER TO confluence;

--
-- Name: AO_A0B856_WEBHOOK; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_A0B856_WEBHOOK" (
    "ACTIVE" boolean,
    "CREATED" timestamp without time zone NOT NULL,
    "ID" integer NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "SCOPE_ID" character varying(255),
    "SCOPE_TYPE" character varying(255) NOT NULL,
    "UPDATED" timestamp without time zone NOT NULL,
    "URL" text NOT NULL
);


ALTER TABLE public."AO_A0B856_WEBHOOK" OWNER TO confluence;

--
-- Name: AO_A0B856_WEBHOOK_CONFIG; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_A0B856_WEBHOOK_CONFIG" (
    "ID" integer NOT NULL,
    "KEY" character varying(255) NOT NULL,
    "VALUE" character varying(255) NOT NULL,
    "WEBHOOKID" integer NOT NULL
);


ALTER TABLE public."AO_A0B856_WEBHOOK_CONFIG" OWNER TO confluence;

--
-- Name: AO_A0B856_WEBHOOK_CONFIG_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_A0B856_WEBHOOK_CONFIG_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_A0B856_WEBHOOK_CONFIG_ID_seq" OWNER TO confluence;

--
-- Name: AO_A0B856_WEBHOOK_CONFIG_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_A0B856_WEBHOOK_CONFIG_ID_seq" OWNED BY public."AO_A0B856_WEBHOOK_CONFIG"."ID";


--
-- Name: AO_A0B856_WEBHOOK_EVENT; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_A0B856_WEBHOOK_EVENT" (
    "EVENT_ID" character varying(255) NOT NULL,
    "ID" integer NOT NULL,
    "WEBHOOKID" integer NOT NULL
);


ALTER TABLE public."AO_A0B856_WEBHOOK_EVENT" OWNER TO confluence;

--
-- Name: AO_A0B856_WEBHOOK_EVENT_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_A0B856_WEBHOOK_EVENT_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_A0B856_WEBHOOK_EVENT_ID_seq" OWNER TO confluence;

--
-- Name: AO_A0B856_WEBHOOK_EVENT_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_A0B856_WEBHOOK_EVENT_ID_seq" OWNED BY public."AO_A0B856_WEBHOOK_EVENT"."ID";


--
-- Name: AO_A0B856_WEBHOOK_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_A0B856_WEBHOOK_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_A0B856_WEBHOOK_ID_seq" OWNER TO confluence;

--
-- Name: AO_A0B856_WEBHOOK_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_A0B856_WEBHOOK_ID_seq" OWNED BY public."AO_A0B856_WEBHOOK"."ID";


--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_A0B856_WEB_HOOK_LISTENER_AO" (
    "DESCRIPTION" text,
    "ENABLED" boolean,
    "EVENTS" text,
    "EXCLUDE_BODY" boolean,
    "FILTERS" text,
    "ID" integer NOT NULL,
    "LAST_UPDATED" timestamp without time zone NOT NULL,
    "LAST_UPDATED_USER" character varying(255),
    "NAME" text NOT NULL,
    "PARAMETERS" text,
    "REGISTRATION_METHOD" character varying(255) NOT NULL,
    "URL" text NOT NULL
);


ALTER TABLE public."AO_A0B856_WEB_HOOK_LISTENER_AO" OWNER TO confluence;

--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq" OWNER TO confluence;

--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq" OWNED BY public."AO_A0B856_WEB_HOOK_LISTENER_AO"."ID";


--
-- Name: AO_AC3877_RL_USER_COUNTER; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_AC3877_RL_USER_COUNTER" (
    "ID" bigint NOT NULL,
    "INTERVAL_START" timestamp without time zone NOT NULL,
    "NODE_ID" character varying(255) NOT NULL,
    "REJECT_COUNT" bigint DEFAULT 0 NOT NULL,
    "USER_ID" character varying(255) NOT NULL
);


ALTER TABLE public."AO_AC3877_RL_USER_COUNTER" OWNER TO confluence;

--
-- Name: AO_AC3877_RL_USER_COUNTER_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_AC3877_RL_USER_COUNTER_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_AC3877_RL_USER_COUNTER_ID_seq" OWNER TO confluence;

--
-- Name: AO_AC3877_RL_USER_COUNTER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_AC3877_RL_USER_COUNTER_ID_seq" OWNED BY public."AO_AC3877_RL_USER_COUNTER"."ID";


--
-- Name: AO_AC3877_SETTINGS_VERSION; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_AC3877_SETTINGS_VERSION" (
    "TYPE" character varying(255) NOT NULL,
    "VERSION" bigint NOT NULL
);


ALTER TABLE public."AO_AC3877_SETTINGS_VERSION" OWNER TO confluence;

--
-- Name: AO_AC3877_SYSTEM_RL_SETTINGS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_AC3877_SYSTEM_RL_SETTINGS" (
    "CAPACITY" integer DEFAULT 0 NOT NULL,
    "CLEAN_JOB_DURATION" character varying(255) NOT NULL,
    "FILL_RATE" integer DEFAULT 0 NOT NULL,
    "FLUSH_JOB_DURATION" character varying(255) NOT NULL,
    "INTERVAL_FREQUENCY" integer DEFAULT 0 NOT NULL,
    "INTERVAL_TIME_UNIT" character varying(255) NOT NULL,
    "MODE" character varying(255) NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "REAPER_JOB_DURATION" character varying(255) NOT NULL,
    "RETENTION_PERIOD_DURATION" character varying(255) NOT NULL,
    "SETTINGS_RELOAD_JOB_DURATION" character varying(255) NOT NULL
);


ALTER TABLE public."AO_AC3877_SYSTEM_RL_SETTINGS" OWNER TO confluence;

--
-- Name: AO_AC3877_USER_RL_SETTINGS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_AC3877_USER_RL_SETTINGS" (
    "CAPACITY" integer DEFAULT 0 NOT NULL,
    "FILL_RATE" integer DEFAULT 0 NOT NULL,
    "INTERVAL_FREQUENCY" integer DEFAULT 0 NOT NULL,
    "INTERVAL_TIME_UNIT" character varying(255) NOT NULL,
    "USER_ID" character varying(255) NOT NULL,
    "WHITELISTED" boolean NOT NULL
);


ALTER TABLE public."AO_AC3877_USER_RL_SETTINGS" OWNER TO confluence;

--
-- Name: AO_BAF3AA_AOINLINE_TASK; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_BAF3AA_AOINLINE_TASK" (
    "ASSIGNEE_USER_KEY" character varying(255),
    "BODY" text,
    "COMPLETE_DATE" timestamp without time zone,
    "COMPLETE_USER_KEY" character varying(255),
    "CONTENT_ID" bigint DEFAULT 0,
    "CREATE_DATE" timestamp without time zone,
    "CREATOR_USER_KEY" character varying(255),
    "DUE_DATE" timestamp without time zone,
    "GLOBAL_ID" bigint NOT NULL,
    "ID" bigint DEFAULT 0,
    "TASK_STATUS" character varying(255),
    "UPDATE_DATE" timestamp without time zone
);


ALTER TABLE public."AO_BAF3AA_AOINLINE_TASK" OWNER TO confluence;

--
-- Name: AO_BAF3AA_AOINLINE_TASK_GLOBAL_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_BAF3AA_AOINLINE_TASK_GLOBAL_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_BAF3AA_AOINLINE_TASK_GLOBAL_ID_seq" OWNER TO confluence;

--
-- Name: AO_BAF3AA_AOINLINE_TASK_GLOBAL_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_BAF3AA_AOINLINE_TASK_GLOBAL_ID_seq" OWNED BY public."AO_BAF3AA_AOINLINE_TASK"."GLOBAL_ID";


--
-- Name: AO_C77861_AUDIT_ACTION_CACHE; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_C77861_AUDIT_ACTION_CACHE" (
    "ACTION" character varying(255) NOT NULL,
    "ACTION_T_KEY" character varying(255),
    "ID" integer NOT NULL
);


ALTER TABLE public."AO_C77861_AUDIT_ACTION_CACHE" OWNER TO confluence;

--
-- Name: AO_C77861_AUDIT_ACTION_CACHE_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_C77861_AUDIT_ACTION_CACHE_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_C77861_AUDIT_ACTION_CACHE_ID_seq" OWNER TO confluence;

--
-- Name: AO_C77861_AUDIT_ACTION_CACHE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_C77861_AUDIT_ACTION_CACHE_ID_seq" OWNED BY public."AO_C77861_AUDIT_ACTION_CACHE"."ID";


--
-- Name: AO_C77861_AUDIT_CATEGORY_CACHE; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_C77861_AUDIT_CATEGORY_CACHE" (
    "CATEGORY" character varying(255) NOT NULL,
    "CATEGORY_T_KEY" character varying(255),
    "ID" integer NOT NULL
);


ALTER TABLE public."AO_C77861_AUDIT_CATEGORY_CACHE" OWNER TO confluence;

--
-- Name: AO_C77861_AUDIT_CATEGORY_CACHE_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_C77861_AUDIT_CATEGORY_CACHE_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_C77861_AUDIT_CATEGORY_CACHE_ID_seq" OWNER TO confluence;

--
-- Name: AO_C77861_AUDIT_CATEGORY_CACHE_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_C77861_AUDIT_CATEGORY_CACHE_ID_seq" OWNED BY public."AO_C77861_AUDIT_CATEGORY_CACHE"."ID";


--
-- Name: AO_C77861_AUDIT_DENY_LISTED; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_C77861_AUDIT_DENY_LISTED" (
    "ACTION" character varying(255),
    "ID" bigint NOT NULL
);


ALTER TABLE public."AO_C77861_AUDIT_DENY_LISTED" OWNER TO confluence;

--
-- Name: AO_C77861_AUDIT_DENY_LISTED_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_C77861_AUDIT_DENY_LISTED_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_C77861_AUDIT_DENY_LISTED_ID_seq" OWNER TO confluence;

--
-- Name: AO_C77861_AUDIT_DENY_LISTED_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_C77861_AUDIT_DENY_LISTED_ID_seq" OWNED BY public."AO_C77861_AUDIT_DENY_LISTED"."ID";


--
-- Name: AO_C77861_AUDIT_ENTITY; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_C77861_AUDIT_ENTITY" (
    "ACTION" character varying(255) NOT NULL,
    "ACTION_T_KEY" character varying(255),
    "AREA" character varying(255) NOT NULL,
    "ATTRIBUTES" text,
    "CATEGORY" character varying(255),
    "CATEGORY_T_KEY" character varying(255),
    "CHANGE_VALUES" text,
    "ENTITY_TIMESTAMP" bigint NOT NULL,
    "ID" bigint NOT NULL,
    "LEVEL" character varying(255) NOT NULL,
    "METHOD" character varying(255),
    "NODE" character varying(255),
    "PRIMARY_RESOURCE_ID" character varying(255),
    "PRIMARY_RESOURCE_TYPE" character varying(255),
    "RESOURCES" text,
    "RESOURCE_ID_3" character varying(255),
    "RESOURCE_ID_4" character varying(255),
    "RESOURCE_ID_5" character varying(255),
    "RESOURCE_TYPE_3" character varying(255),
    "RESOURCE_TYPE_4" character varying(255),
    "RESOURCE_TYPE_5" character varying(255),
    "SEARCH_STRING" text,
    "SECONDARY_RESOURCE_ID" character varying(255),
    "SECONDARY_RESOURCE_TYPE" character varying(255),
    "SOURCE" character varying(255),
    "SYSTEM_INFO" character varying(255),
    "USER_ID" character varying(255),
    "USER_NAME" character varying(255),
    "USER_TYPE" character varying(255)
);


ALTER TABLE public."AO_C77861_AUDIT_ENTITY" OWNER TO confluence;

--
-- Name: AO_C77861_AUDIT_ENTITY_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_C77861_AUDIT_ENTITY_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_C77861_AUDIT_ENTITY_ID_seq" OWNER TO confluence;

--
-- Name: AO_C77861_AUDIT_ENTITY_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_C77861_AUDIT_ENTITY_ID_seq" OWNED BY public."AO_C77861_AUDIT_ENTITY"."ID";


--
-- Name: AO_DC98AE_AOHELP_TIP; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_DC98AE_AOHELP_TIP" (
    "DISMISSED_HELP_TIP" character varying(255),
    "ID" integer NOT NULL,
    "USER_KEY" character varying(255)
);


ALTER TABLE public."AO_DC98AE_AOHELP_TIP" OWNER TO confluence;

--
-- Name: AO_DC98AE_AOHELP_TIP_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_DC98AE_AOHELP_TIP_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_DC98AE_AOHELP_TIP_ID_seq" OWNER TO confluence;

--
-- Name: AO_DC98AE_AOHELP_TIP_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_DC98AE_AOHELP_TIP_ID_seq" OWNED BY public."AO_DC98AE_AOHELP_TIP"."ID";


--
-- Name: AO_ED669C_IDP_CONFIG; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_ED669C_IDP_CONFIG" (
    "ADDITIONAL_JIT_SCOPES" text,
    "ADDITIONAL_SCOPES" text,
    "AUTHORIZATION_ENDPOINT" character varying(255),
    "BUTTON_TEXT" character varying(255) NOT NULL,
    "CLIENT_ID" character varying(255),
    "CLIENT_SECRET" character varying(255),
    "ENABLED" boolean NOT NULL,
    "ENABLE_REMEMBER_ME" boolean,
    "ID" bigint NOT NULL,
    "INCLUDE_CUSTOMER_LOGINS" boolean,
    "ISSUER" character varying(255) NOT NULL,
    "LAST_UPDATED" timestamp without time zone,
    "MAPPING_DISPLAYNAME" character varying(255),
    "MAPPING_EMAIL" character varying(255),
    "MAPPING_GROUPS" character varying(255),
    "NAME" character varying(255) NOT NULL,
    "SAML_IDP_TYPE" character varying(255),
    "SIGNING_CERT" text,
    "SSO_TYPE" character varying(255),
    "SSO_URL" character varying(255),
    "TOKEN_ENDPOINT" character varying(255),
    "USERNAME_ATTRIBUTE" character varying(255),
    "USERNAME_CLAIM" character varying(255),
    "USER_INFO_ENDPOINT" character varying(255),
    "USER_PROVISIONING_ENABLED" boolean,
    "USE_DISCOVERY" boolean
);


ALTER TABLE public."AO_ED669C_IDP_CONFIG" OWNER TO confluence;

--
-- Name: AO_ED669C_IDP_CONFIG_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_ED669C_IDP_CONFIG_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_ED669C_IDP_CONFIG_ID_seq" OWNER TO confluence;

--
-- Name: AO_ED669C_IDP_CONFIG_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_ED669C_IDP_CONFIG_ID_seq" OWNED BY public."AO_ED669C_IDP_CONFIG"."ID";


--
-- Name: AO_ED669C_SEEN_ASSERTIONS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_ED669C_SEEN_ASSERTIONS" (
    "ASSERTION_ID" character varying(255) NOT NULL,
    "EXPIRY_TIMESTAMP" bigint DEFAULT 0 NOT NULL,
    "ID" integer NOT NULL
);


ALTER TABLE public."AO_ED669C_SEEN_ASSERTIONS" OWNER TO confluence;

--
-- Name: AO_ED669C_SEEN_ASSERTIONS_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_ED669C_SEEN_ASSERTIONS_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_ED669C_SEEN_ASSERTIONS_ID_seq" OWNER TO confluence;

--
-- Name: AO_ED669C_SEEN_ASSERTIONS_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_ED669C_SEEN_ASSERTIONS_ID_seq" OWNED BY public."AO_ED669C_SEEN_ASSERTIONS"."ID";


--
-- Name: AO_FE1BC5_ACCESS_TOKEN; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_FE1BC5_ACCESS_TOKEN" (
    "AUTHORIZATION_CODE" character varying(255) NOT NULL,
    "AUTHORIZATION_DATE" bigint NOT NULL,
    "CLIENT_ID" character varying(255) NOT NULL,
    "CREATED_AT" bigint NOT NULL,
    "ID" character varying(255) NOT NULL,
    "LAST_ACCESSED" bigint,
    "SCOPE" character varying(255) NOT NULL,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_FE1BC5_ACCESS_TOKEN" OWNER TO confluence;

--
-- Name: AO_FE1BC5_AUTHORIZATION; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_FE1BC5_AUTHORIZATION" (
    "AUTHORIZATION_CODE" character varying(255) NOT NULL,
    "CLIENT_ID" character varying(255) NOT NULL,
    "CODE_CHALLENGE" character varying(255),
    "CODE_CHALLENGE_METHOD" character varying(255),
    "CREATED_AT" bigint NOT NULL,
    "REDIRECT_URI" character varying(255) NOT NULL,
    "SCOPE" character varying(255) NOT NULL,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_FE1BC5_AUTHORIZATION" OWNER TO confluence;

--
-- Name: AO_FE1BC5_CLIENT; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_FE1BC5_CLIENT" (
    "CLIENT_ID" character varying(255) NOT NULL,
    "CLIENT_SECRET" character varying(255) NOT NULL,
    "ID" character varying(255) NOT NULL,
    "NAME" character varying(255) NOT NULL,
    "SCOPE" character varying(255),
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_FE1BC5_CLIENT" OWNER TO confluence;

--
-- Name: AO_FE1BC5_REDIRECT_URI; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_FE1BC5_REDIRECT_URI" (
    "CLIENT_ID" character varying(255) NOT NULL,
    "ID" integer NOT NULL,
    "URI" character varying(450) NOT NULL
);


ALTER TABLE public."AO_FE1BC5_REDIRECT_URI" OWNER TO confluence;

--
-- Name: AO_FE1BC5_REDIRECT_URI_ID_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public."AO_FE1BC5_REDIRECT_URI_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AO_FE1BC5_REDIRECT_URI_ID_seq" OWNER TO confluence;

--
-- Name: AO_FE1BC5_REDIRECT_URI_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public."AO_FE1BC5_REDIRECT_URI_ID_seq" OWNED BY public."AO_FE1BC5_REDIRECT_URI"."ID";


--
-- Name: AO_FE1BC5_REFRESH_TOKEN; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."AO_FE1BC5_REFRESH_TOKEN" (
    "ACCESS_TOKEN_ID" character varying(255),
    "AUTHORIZATION_CODE" character varying(255) NOT NULL,
    "AUTHORIZATION_DATE" bigint NOT NULL,
    "CLIENT_ID" character varying(255) NOT NULL,
    "CREATED_AT" bigint NOT NULL,
    "ID" character varying(255) NOT NULL,
    "REFRESH_COUNT" integer,
    "SCOPE" character varying(255) NOT NULL,
    "USER_KEY" character varying(255) NOT NULL
);


ALTER TABLE public."AO_FE1BC5_REFRESH_TOKEN" OWNER TO confluence;

--
-- Name: EVENTS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."EVENTS" (
    rev character varying(255) NOT NULL,
    history character varying(255) NOT NULL,
    partition integer NOT NULL,
    sequence integer NOT NULL,
    event bytea,
    contentid bigint NOT NULL,
    inserted timestamp without time zone NOT NULL
);


ALTER TABLE public."EVENTS" OWNER TO confluence;

--
-- Name: SECRETS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."SECRETS" (
    key character varying(255) NOT NULL,
    value character varying(256) NOT NULL
);


ALTER TABLE public."SECRETS" OWNER TO confluence;

--
-- Name: SNAPSHOTS; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public."SNAPSHOTS" (
    key character varying(255) NOT NULL,
    value bytea NOT NULL,
    contentid bigint NOT NULL,
    inserted timestamp without time zone NOT NULL
);


ALTER TABLE public."SNAPSHOTS" OWNER TO confluence;

--
-- Name: attachmentdata; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.attachmentdata (
    attachmentdataid bigint NOT NULL,
    hibernateversion integer DEFAULT 0 NOT NULL,
    attversion integer NOT NULL,
    data bytea,
    attachmentid bigint NOT NULL
);


ALTER TABLE public.attachmentdata OWNER TO confluence;

--
-- Name: audit_affected_object; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.audit_affected_object (
    id bigint NOT NULL,
    name character varying(255),
    type character varying(255),
    auditrecordid bigint
);


ALTER TABLE public.audit_affected_object OWNER TO confluence;

--
-- Name: audit_changed_value; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.audit_changed_value (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    oldvalue character varying(255),
    newvalue character varying(255),
    auditrecordid bigint
);


ALTER TABLE public.audit_changed_value OWNER TO confluence;

--
-- Name: auditrecord; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.auditrecord (
    auditrecordid bigint NOT NULL,
    summary character varying(255),
    description character varying(255),
    category character varying(255),
    address character varying(255),
    sysamdin boolean NOT NULL,
    authorname character varying(255),
    authorfullname character varying(255),
    authorkey character varying(255),
    objectname character varying(255),
    objecttype character varying(255),
    searchstring character varying(4000),
    creationdate bigint NOT NULL
);


ALTER TABLE public.auditrecord OWNER TO confluence;

--
-- Name: background_job; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.background_job (
    id bigint NOT NULL,
    type character varying(100),
    owner character varying(255),
    description character varying(1000),
    run_at timestamp without time zone NOT NULL,
    iteration_number integer NOT NULL,
    number_of_failures integer NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    last_touch_time timestamp without time zone NOT NULL,
    duration_ms bigint NOT NULL,
    parameters text
);


ALTER TABLE public.background_job OWNER TO confluence;

--
-- Name: background_job_archived; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.background_job_archived (
    id bigint NOT NULL,
    type character varying(100),
    owner character varying(255),
    description character varying(1000),
    error_message text,
    iteration_number integer NOT NULL,
    number_of_failures integer NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    completion_time timestamp without time zone NOT NULL,
    duration_ms bigint NOT NULL,
    state character varying(255) NOT NULL
);


ALTER TABLE public.background_job_archived OWNER TO confluence;

--
-- Name: backup_restore_job_details; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.backup_restore_job_details (
    id bigint NOT NULL,
    operation character varying(255) NOT NULL,
    scope character varying(20) NOT NULL,
    state character varying(20) NOT NULL,
    create_time timestamp without time zone NOT NULL,
    start_processing_time timestamp without time zone,
    finish_processing_time timestamp without time zone,
    error_message character varying(1000),
    owner character varying(255),
    terminator character varying(255),
    cancel_time timestamp without time zone,
    filename character varying(1000),
    single_space_key character varying(255),
    space_keys character varying(1000),
    file_delete_time timestamp without time zone,
    file_exists boolean
);


ALTER TABLE public.backup_restore_job_details OWNER TO confluence;

--
-- Name: backup_restore_job_settings; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.backup_restore_job_settings (
    id bigint NOT NULL,
    settings text
);


ALTER TABLE public.backup_restore_job_settings OWNER TO confluence;

--
-- Name: backup_restore_job_statistics; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.backup_restore_job_statistics (
    id bigint NOT NULL,
    job_statistics text
);


ALTER TABLE public.backup_restore_job_statistics OWNER TO confluence;

--
-- Name: bandana; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.bandana (
    bandanaid bigint NOT NULL,
    bandanacontext character varying(255) NOT NULL,
    bandanakey character varying(100) NOT NULL,
    bandanavalue text
);


ALTER TABLE public.bandana OWNER TO confluence;

--
-- Name: bodycontent; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.bodycontent (
    bodycontentid bigint NOT NULL,
    body text,
    contentid bigint,
    bodytypeid smallint
);


ALTER TABLE public.bodycontent OWNER TO confluence;

--
-- Name: clustersafety; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.clustersafety (
    clustersafetyid bigint NOT NULL,
    safetynumber integer
);


ALTER TABLE public.clustersafety OWNER TO confluence;

--
-- Name: confancestors; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.confancestors (
    descendentid bigint NOT NULL,
    ancestorposition integer NOT NULL,
    ancestorid bigint NOT NULL
);


ALTER TABLE public.confancestors OWNER TO confluence;

--
-- Name: confversion; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.confversion (
    confversionid bigint NOT NULL,
    buildnumber integer NOT NULL,
    installdate timestamp without time zone,
    versiontag character varying(255),
    finalized character(1) DEFAULT 'N'::bpchar NOT NULL,
    creationdate timestamp without time zone,
    lastmoddate timestamp without time zone
);


ALTER TABLE public.confversion OWNER TO confluence;

--
-- Name: confzdu; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.confzdu (
    confzduid bigint NOT NULL,
    state character varying(255) NOT NULL,
    orig_ver character varying(255) NOT NULL,
    orig_build_number integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.confzdu OWNER TO confluence;

--
-- Name: content; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.content (
    contentid bigint NOT NULL,
    hibernateversion integer DEFAULT 0 NOT NULL,
    contenttype character varying(255) NOT NULL,
    title character varying(255),
    lowertitle character varying(255),
    version integer,
    creator character varying(255),
    creationdate timestamp without time zone,
    lastmodifier character varying(255),
    lastmoddate timestamp without time zone,
    versioncomment text,
    prevver bigint,
    content_status character varying(255),
    pageid bigint,
    spaceid bigint,
    child_position integer,
    parentid bigint,
    pluginkey character varying(255),
    pluginver character varying(255),
    parentccid bigint,
    draftpageid character varying(255),
    draftspacekey character varying(255),
    drafttype character varying(255),
    draftpageversion integer,
    parentcommentid bigint,
    username character varying(255)
);


ALTER TABLE public.content OWNER TO confluence;

--
-- Name: content_label; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.content_label (
    id bigint NOT NULL,
    labelid bigint NOT NULL,
    contentid bigint,
    pagetemplateid bigint,
    owner character varying(255),
    creationdate timestamp without time zone,
    lastmoddate timestamp without time zone,
    labelableid bigint,
    labelabletype character varying(255)
);


ALTER TABLE public.content_label OWNER TO confluence;

--
-- Name: content_perm; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.content_perm (
    id bigint NOT NULL,
    cp_type character varying(10) NOT NULL,
    username character varying(255),
    groupname character varying(255),
    cps_id bigint NOT NULL,
    creator character varying(255),
    creationdate timestamp without time zone,
    lastmodifier character varying(255),
    lastmoddate timestamp without time zone
);


ALTER TABLE public.content_perm OWNER TO confluence;

--
-- Name: content_perm_set; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.content_perm_set (
    id bigint NOT NULL,
    cont_perm_type character varying(10) NOT NULL,
    content_id bigint NOT NULL,
    creationdate timestamp without time zone,
    lastmoddate timestamp without time zone
);


ALTER TABLE public.content_perm_set OWNER TO confluence;

--
-- Name: content_relation; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.content_relation (
    relationid bigint NOT NULL,
    targetcontentid bigint NOT NULL,
    sourcecontentid bigint NOT NULL,
    targettype character varying(255) NOT NULL,
    sourcetype character varying(255) NOT NULL,
    relationname character varying(255) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    lastmoddate timestamp without time zone NOT NULL,
    creator character varying(255) NOT NULL,
    lastmodifier character varying(255) NOT NULL
);


ALTER TABLE public.content_relation OWNER TO confluence;

--
-- Name: contentproperties; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.contentproperties (
    propertyid bigint NOT NULL,
    propertyname character varying(255) NOT NULL,
    stringval character varying(255),
    longval bigint,
    dateval timestamp without time zone,
    contentid bigint
);


ALTER TABLE public.contentproperties OWNER TO confluence;

--
-- Name: cwd_app_dir_group_mapping; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_app_dir_group_mapping (
    id bigint NOT NULL,
    app_dir_mapping_id bigint NOT NULL,
    application_id bigint NOT NULL,
    directory_id bigint NOT NULL,
    group_name character varying(255) NOT NULL
);


ALTER TABLE public.cwd_app_dir_group_mapping OWNER TO confluence;

--
-- Name: cwd_app_dir_mapping; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_app_dir_mapping (
    id bigint NOT NULL,
    application_id bigint,
    directory_id bigint NOT NULL,
    allow_all character(1) NOT NULL,
    list_index integer
);


ALTER TABLE public.cwd_app_dir_mapping OWNER TO confluence;

--
-- Name: cwd_app_dir_operation; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_app_dir_operation (
    app_dir_mapping_id bigint NOT NULL,
    operation_type character varying(32) NOT NULL
);


ALTER TABLE public.cwd_app_dir_operation OWNER TO confluence;

--
-- Name: cwd_application; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_application (
    id bigint NOT NULL,
    application_name character varying(255) NOT NULL,
    lower_application_name character varying(255) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_date timestamp without time zone NOT NULL,
    active character(1) NOT NULL,
    description character varying(255),
    application_type character varying(32) NOT NULL,
    credential character varying(255) NOT NULL
);


ALTER TABLE public.cwd_application OWNER TO confluence;

--
-- Name: cwd_application_address; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_application_address (
    application_id bigint NOT NULL,
    remote_address character varying(255) NOT NULL
);


ALTER TABLE public.cwd_application_address OWNER TO confluence;

--
-- Name: cwd_application_attribute; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_application_attribute (
    application_id bigint NOT NULL,
    attribute_name character varying(255) NOT NULL,
    attribute_value character varying(4000)
);


ALTER TABLE public.cwd_application_attribute OWNER TO confluence;

--
-- Name: cwd_directory; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_directory (
    id bigint NOT NULL,
    directory_name character varying(255) NOT NULL,
    lower_directory_name character varying(255) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_date timestamp without time zone NOT NULL,
    active character(1) NOT NULL,
    description character varying(255),
    impl_class character varying(255) NOT NULL,
    lower_impl_class character varying(255) NOT NULL,
    directory_type character varying(32) NOT NULL
);


ALTER TABLE public.cwd_directory OWNER TO confluence;

--
-- Name: cwd_directory_attribute; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_directory_attribute (
    directory_id bigint NOT NULL,
    attribute_name character varying(255) NOT NULL,
    attribute_value character varying(4000)
);


ALTER TABLE public.cwd_directory_attribute OWNER TO confluence;

--
-- Name: cwd_directory_operation; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_directory_operation (
    directory_id bigint NOT NULL,
    operation_type character varying(32) NOT NULL
);


ALTER TABLE public.cwd_directory_operation OWNER TO confluence;

--
-- Name: cwd_group; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_group (
    id bigint NOT NULL,
    group_name character varying(255) NOT NULL,
    lower_group_name character varying(255) NOT NULL,
    active character(1) NOT NULL,
    local character(1) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_date timestamp without time zone NOT NULL,
    description character varying(255),
    group_type character varying(32) NOT NULL,
    directory_id bigint NOT NULL,
    external_id character varying(255)
);


ALTER TABLE public.cwd_group OWNER TO confluence;

--
-- Name: cwd_group_attribute; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_group_attribute (
    id bigint NOT NULL,
    group_id bigint NOT NULL,
    directory_id bigint NOT NULL,
    attribute_name character varying(255) NOT NULL,
    attribute_value character varying(255),
    attribute_lower_value character varying(255)
);


ALTER TABLE public.cwd_group_attribute OWNER TO confluence;

--
-- Name: cwd_membership; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_membership (
    id bigint NOT NULL,
    parent_id bigint NOT NULL,
    child_group_id bigint,
    child_user_id bigint
);


ALTER TABLE public.cwd_membership OWNER TO confluence;

--
-- Name: cwd_synchronisation_status; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_synchronisation_status (
    id integer NOT NULL,
    directory_id bigint NOT NULL,
    node_id character varying(36),
    node_name character varying(255),
    sync_start bigint NOT NULL,
    sync_end bigint,
    status character varying(32) NOT NULL,
    status_parameters text,
    incremental_sync_error text,
    full_sync_error text
);


ALTER TABLE public.cwd_synchronisation_status OWNER TO confluence;

--
-- Name: cwd_synchronisation_token; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_synchronisation_token (
    directory_id bigint NOT NULL,
    sync_status_token text
);


ALTER TABLE public.cwd_synchronisation_token OWNER TO confluence;

--
-- Name: cwd_tombstone; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_tombstone (
    id bigint NOT NULL,
    tombstone_type character varying(255) NOT NULL,
    tombstone_timestamp bigint NOT NULL,
    entity_name character varying(255),
    directory_id bigint,
    parent character varying(255),
    application_id bigint
);


ALTER TABLE public.cwd_tombstone OWNER TO confluence;

--
-- Name: cwd_user; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_user (
    id bigint NOT NULL,
    user_name character varying(255) NOT NULL,
    lower_user_name character varying(255) NOT NULL,
    active character(1) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    updated_date timestamp without time zone NOT NULL,
    first_name character varying(255),
    lower_first_name character varying(255),
    last_name character varying(255),
    lower_last_name character varying(255),
    display_name character varying(255),
    lower_display_name character varying(255),
    email_address character varying(255),
    lower_email_address character varying(255),
    external_id character varying(255),
    directory_id bigint NOT NULL,
    credential character varying(255)
);


ALTER TABLE public.cwd_user OWNER TO confluence;

--
-- Name: cwd_user_attribute; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_user_attribute (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    directory_id bigint NOT NULL,
    attribute_name character varying(255) NOT NULL,
    attribute_value character varying(255),
    attribute_lower_value character varying(255)
);


ALTER TABLE public.cwd_user_attribute OWNER TO confluence;

--
-- Name: cwd_user_credential_record; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.cwd_user_credential_record (
    id bigint NOT NULL,
    user_id bigint,
    password_hash character varying(255) NOT NULL,
    list_index integer
);


ALTER TABLE public.cwd_user_credential_record OWNER TO confluence;

--
-- Name: decorator; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.decorator (
    decoratorid bigint NOT NULL,
    spacekey character varying(255),
    decoratorname character varying(255),
    body text,
    lastmoddate timestamp without time zone
);


ALTER TABLE public.decorator OWNER TO confluence;

--
-- Name: denormalised_content; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_content (
    id bigint NOT NULL,
    space_id bigint,
    parent_id bigint,
    title character varying(255),
    "position" integer,
    status integer NOT NULL,
    creation_date timestamp without time zone,
    last_modification_date timestamp without time zone
);


ALTER TABLE public.denormalised_content OWNER TO confluence;

--
-- Name: denormalised_content_change_log; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_content_change_log (
    id bigint NOT NULL,
    content_id bigint,
    cps_id bigint
);


ALTER TABLE public.denormalised_content_change_log OWNER TO confluence;

--
-- Name: denormalised_content_change_log_id_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public.denormalised_content_change_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.denormalised_content_change_log_id_seq OWNER TO confluence;

--
-- Name: denormalised_content_change_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public.denormalised_content_change_log_id_seq OWNED BY public.denormalised_content_change_log.id;


--
-- Name: denormalised_content_view_permissions; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_content_view_permissions (
    sid_id bigint NOT NULL,
    content_id bigint NOT NULL
);


ALTER TABLE public.denormalised_content_view_permissions OWNER TO confluence;

--
-- Name: denormalised_service_lock; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_service_lock (
    lock_name character varying(100) NOT NULL
);


ALTER TABLE public.denormalised_service_lock OWNER TO confluence;

--
-- Name: denormalised_sid; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_sid (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    type integer NOT NULL
);


ALTER TABLE public.denormalised_sid OWNER TO confluence;

--
-- Name: denormalised_space_change_log; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_space_change_log (
    id bigint NOT NULL,
    space_id bigint
);


ALTER TABLE public.denormalised_space_change_log OWNER TO confluence;

--
-- Name: denormalised_space_change_log_id_seq; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public.denormalised_space_change_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.denormalised_space_change_log_id_seq OWNER TO confluence;

--
-- Name: denormalised_space_change_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: confluence
--

ALTER SEQUENCE public.denormalised_space_change_log_id_seq OWNED BY public.denormalised_space_change_log.id;


--
-- Name: denormalised_space_edit_permissions; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_space_edit_permissions (
    sid_id bigint NOT NULL,
    space_id bigint NOT NULL
);


ALTER TABLE public.denormalised_space_edit_permissions OWNER TO confluence;

--
-- Name: denormalised_space_view_permissions; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_space_view_permissions (
    sid_id bigint NOT NULL,
    space_id bigint NOT NULL
);


ALTER TABLE public.denormalised_space_view_permissions OWNER TO confluence;

--
-- Name: denormalised_state; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_state (
    service_type character varying(255) NOT NULL,
    state character varying(255),
    last_up_to_date_timestamp bigint
);


ALTER TABLE public.denormalised_state OWNER TO confluence;

--
-- Name: denormalised_state_change_log; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.denormalised_state_change_log (
    id bigint NOT NULL,
    message character varying(1023),
    message_level character varying(255),
    "timestamp" bigint
);


ALTER TABLE public.denormalised_state_change_log OWNER TO confluence;

--
-- Name: diagnostics_alerts; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.diagnostics_alerts (
    id bigint NOT NULL,
    details_json text,
    issue_component_id character varying(255) NOT NULL,
    issue_id character varying(255) NOT NULL,
    issue_severity integer NOT NULL,
    node_name character varying(255) NOT NULL,
    node_name_lower character varying(255) NOT NULL,
    "timestamp" bigint NOT NULL,
    trigger_module character varying(255),
    trigger_plugin_key character varying(255),
    trigger_plugin_key_lower character varying(255),
    trigger_plugin_version character varying(255)
);


ALTER TABLE public.diagnostics_alerts OWNER TO confluence;

--
-- Name: follow_connections; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.follow_connections (
    connectionid bigint NOT NULL,
    follower character varying(255),
    followee character varying(255)
);


ALTER TABLE public.follow_connections OWNER TO confluence;

--
-- Name: gr_response_group; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.gr_response_group (
    id character varying(255) NOT NULL,
    jobid character varying(255) NOT NULL,
    nodeid character varying(255) NOT NULL,
    starttimestamp bigint,
    endtimestamp bigint
);


ALTER TABLE public.gr_response_group OWNER TO confluence;

--
-- Name: guardrails_response; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.guardrails_response (
    id character varying(255) NOT NULL,
    guardrailsresponse text,
    guardrailsresponsetype character varying(255),
    queryid character varying(255) NOT NULL,
    responsegroupid character varying(255),
    success boolean NOT NULL,
    querycomplexity character varying(255),
    querystatus character varying(255)
);


ALTER TABLE public.guardrails_response OWNER TO confluence;

--
-- Name: hibernate_unique_key; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.hibernate_unique_key (
    next_hi bigint
);


ALTER TABLE public.hibernate_unique_key OWNER TO confluence;

--
-- Name: imagedetails; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.imagedetails (
    attachmentid bigint NOT NULL,
    height integer,
    width integer,
    mimetype character varying(30)
);


ALTER TABLE public.imagedetails OWNER TO confluence;

--
-- Name: journalentry; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.journalentry (
    entry_id bigint NOT NULL,
    journal_name character varying(255),
    creationdate timestamp without time zone,
    type character varying(255),
    message character varying(2047),
    triedtimes integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.journalentry OWNER TO confluence;

--
-- Name: keystore; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.keystore (
    keyid bigint NOT NULL,
    alias character varying(255) NOT NULL,
    type character varying(32) NOT NULL,
    algorithm character varying(32) NOT NULL,
    keyspec text NOT NULL
);


ALTER TABLE public.keystore OWNER TO confluence;

--
-- Name: label; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.label (
    labelid bigint NOT NULL,
    name character varying(255),
    owner character varying(255),
    namespace character varying(255),
    creationdate timestamp without time zone,
    lastmoddate timestamp without time zone
);


ALTER TABLE public.label OWNER TO confluence;

--
-- Name: likes; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.likes (
    id bigint NOT NULL,
    contentid bigint NOT NULL,
    username character varying(255) NOT NULL,
    creationdate timestamp without time zone NOT NULL
);


ALTER TABLE public.likes OWNER TO confluence;

--
-- Name: links; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.links (
    linkid bigint NOT NULL,
    destpagetitle character varying(255),
    lowerdestpagetitle character varying(255),
    destspacekey character varying(255) NOT NULL,
    lowerdestspacekey character varying(255),
    contentid bigint NOT NULL,
    creator character varying(255),
    creationdate timestamp without time zone,
    lastmodifier character varying(255),
    lastmoddate timestamp without time zone
);


ALTER TABLE public.links OWNER TO confluence;

--
-- Name: logininfo; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.logininfo (
    id bigint NOT NULL,
    curfailed integer,
    totalfailed integer,
    successdate timestamp without time zone,
    prevsuccessdate timestamp without time zone,
    faileddate timestamp without time zone,
    username character varying(255) NOT NULL
);


ALTER TABLE public.logininfo OWNER TO confluence;

--
-- Name: mig_analytics_event; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_analytics_event (
    id character varying(255) NOT NULL,
    eventtimestamp bigint NOT NULL,
    eventtype character varying(255) NOT NULL,
    event text NOT NULL
);


ALTER TABLE public.mig_analytics_event OWNER TO confluence;

--
-- Name: mig_app_access_scope; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_app_access_scope (
    serverappkey character varying(255) NOT NULL,
    accessscope character varying(255) NOT NULL
);


ALTER TABLE public.mig_app_access_scope OWNER TO confluence;

--
-- Name: mig_app_assessment_info; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_app_assessment_info (
    appkey character varying(255) NOT NULL,
    assessmentstatus character varying(100) NOT NULL,
    notes text,
    alternativeapp character varying(255),
    consent character varying(100) DEFAULT 'NotGiven'::character varying NOT NULL
);


ALTER TABLE public.mig_app_assessment_info OWNER TO confluence;

--
-- Name: mig_attachment; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_attachment (
    cloudid character varying(255) NOT NULL,
    attachmentid bigint NOT NULL,
    mediaid character varying(255),
    version integer NOT NULL
);


ALTER TABLE public.mig_attachment OWNER TO confluence;

--
-- Name: mig_check_override; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_check_override (
    id character varying(255) NOT NULL,
    executionid character varying(255) NOT NULL,
    checktype character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.mig_check_override OWNER TO confluence;

--
-- Name: mig_check_result; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_check_result (
    id character varying(255) NOT NULL,
    executionid character varying(255) NOT NULL,
    checktype character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL,
    lastupdated timestamp without time zone NOT NULL,
    details character varying(255),
    status character varying(255) NOT NULL,
    lastexecutiontime timestamp without time zone
);


ALTER TABLE public.mig_check_result OWNER TO confluence;

--
-- Name: mig_cloud_site; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_cloud_site (
    cloudid character varying(255) NOT NULL,
    cloudurl character varying(255) NOT NULL,
    containertoken character varying(420) NOT NULL,
    isfailing boolean,
    mediaclientid character varying(255),
    createdtime timestamp without time zone,
    edition character varying(255),
    cloudtype character varying(20) DEFAULT 'STANDARD'::character varying NOT NULL
);


ALTER TABLE public.mig_cloud_site OWNER TO confluence;

--
-- Name: mig_config; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_config (
    id integer NOT NULL,
    exportconcurrencyclustermax integer,
    exportconcurrencynodemax integer,
    lastupdate timestamp without time zone NOT NULL,
    attachmentconcurrencyclustermax integer,
    attachmentconcurrencynodemax integer,
    importconcurrencyclustermax integer,
    importconcurrencynodemax integer,
    uploadconcurrencyclustermax integer,
    uploadconcurrencynodemax integer,
    attachmentuploadconcurrency integer
);


ALTER TABLE public.mig_config OWNER TO confluence;

--
-- Name: mig_db_changelog; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_db_changelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.mig_db_changelog OWNER TO confluence;

--
-- Name: mig_db_changelog_lock; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_db_changelog_lock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.mig_db_changelog_lock OWNER TO confluence;

--
-- Name: mig_detected_event_log; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_detected_event_log (
    cloudid character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.mig_detected_event_log OWNER TO confluence;

--
-- Name: mig_exclude_app; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_exclude_app (
    id character varying(255) NOT NULL,
    taskid character varying(255) NOT NULL,
    appkey character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.mig_exclude_app OWNER TO confluence;

--
-- Name: mig_export_cache; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_export_cache (
    id character varying(255) NOT NULL,
    snapshottime bigint NOT NULL,
    exporttype character varying(255) DEFAULT 'ORIGINAL'::character varying NOT NULL,
    spacekey character varying(255) NOT NULL,
    cloudid character varying(255) NOT NULL,
    containsusermigrationtask boolean,
    filepath character varying(1024) NOT NULL,
    bandanahash character varying(1024) NOT NULL,
    ospropertyentryhash character varying(1024) NOT NULL,
    usermappinghash character varying(1024) NOT NULL
);


ALTER TABLE public.mig_export_cache OWNER TO confluence;

--
-- Name: mig_incorrect_email; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_incorrect_email (
    id character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255),
    checktype character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL,
    scanid character varying(255) NOT NULL,
    directoryid bigint NOT NULL,
    directoryname character varying(255) NOT NULL,
    lastauthenticated bigint,
    newemail character varying(255),
    userkey character varying(255)
);


ALTER TABLE public.mig_incorrect_email OWNER TO confluence;

--
-- Name: mig_invalid_email_user; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_invalid_email_user (
    username character varying(255) NOT NULL,
    email character varying(255),
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.mig_invalid_email_user OWNER TO confluence;

--
-- Name: mig_mapi_plan_mapping; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_mapi_plan_mapping (
    jobid character varying(255) NOT NULL,
    planid character varying(255) NOT NULL,
    migrationid character varying(255)
);


ALTER TABLE public.mig_mapi_plan_mapping OWNER TO confluence;

--
-- Name: mig_needed_in_cloud_app; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_needed_in_cloud_app (
    id character varying(255) NOT NULL,
    taskid character varying(255) NOT NULL,
    appkey character varying(255) NOT NULL,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.mig_needed_in_cloud_app OWNER TO confluence;

--
-- Name: mig_plan; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_plan (
    id character varying(255) NOT NULL,
    cloudid character varying(255) NOT NULL,
    planname character varying(255) NOT NULL,
    createdtime timestamp without time zone NOT NULL,
    lastupdate timestamp without time zone NOT NULL,
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    executionstatus character varying(255) DEFAULT 'CREATED'::character varying NOT NULL,
    message character varying(2000),
    completionpercent integer DEFAULT 0 NOT NULL,
    doneresult character varying(255),
    migrationid character varying(255),
    migrationscopeid character varying(255),
    activestatus character varying(255) DEFAULT 'ACTIVE'::character varying NOT NULL,
    schedulerversion character varying(255),
    migrationtag character varying(255) DEFAULT 'NOT_SPECIFIED'::character varying NOT NULL,
    migrationcreator character varying(5) DEFAULT 'CCMA'::character varying,
    detailedstatus character varying(255)
);


ALTER TABLE public.mig_plan OWNER TO confluence;

--
-- Name: mig_sequences; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_sequences (
    sequence_name character varying(255) NOT NULL,
    next_val bigint NOT NULL
);


ALTER TABLE public.mig_sequences OWNER TO confluence;

--
-- Name: mig_space_statistic; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_space_statistic (
    spaceid bigint NOT NULL,
    sumofpageblogdraftcount bigint NOT NULL,
    attachmentsize bigint NOT NULL,
    attachmentcount bigint NOT NULL,
    estimatedmigrationtime bigint NOT NULL,
    lastupdated timestamp without time zone,
    lastcalculated timestamp without time zone NOT NULL
);


ALTER TABLE public.mig_space_statistic OWNER TO confluence;

--
-- Name: mig_spaces; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_spaces (
    spaceid bigint NOT NULL,
    spacename character varying(255) NOT NULL,
    spacekey character varying(255) NOT NULL,
    cloud character varying(255)
);


ALTER TABLE public.mig_spaces OWNER TO confluence;

--
-- Name: mig_stats; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_stats (
    stattype character varying(255) NOT NULL,
    statname character varying(255) NOT NULL,
    collectedtime timestamp without time zone NOT NULL,
    statvalue bigint NOT NULL,
    planid character varying(255)
);


ALTER TABLE public.mig_stats OWNER TO confluence;

--
-- Name: mig_step; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_step (
    id character varying(255) NOT NULL,
    planid character varying(255) NOT NULL,
    taskid character varying(255) NOT NULL,
    stepindex integer DEFAULT 0 NOT NULL,
    steptype character varying(255) NOT NULL,
    stepconfig character varying(4000),
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    executionstatus character varying(255) DEFAULT 'CREATED'::character varying NOT NULL,
    message character varying(2000),
    completionpercent integer DEFAULT 0 NOT NULL,
    doneresult character varying(4000),
    node_id character varying(255),
    node_heartbeat timestamp without time zone,
    node_execution_id character varying(64),
    execution_state character varying(4000),
    detailedstatus character varying(255),
    stepsubtype character varying(100)
);


ALTER TABLE public.mig_step OWNER TO confluence;

--
-- Name: mig_task; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_task (
    id character varying(255) NOT NULL,
    planid character varying(255) NOT NULL,
    tasktype character varying(255) NOT NULL,
    taskindex integer DEFAULT 0 NOT NULL,
    weight integer DEFAULT 1 NOT NULL,
    spacekey character varying(255),
    starttime timestamp without time zone,
    endtime timestamp without time zone,
    executionstatus character varying(255) DEFAULT 'CREATED'::character varying NOT NULL,
    message character varying(2000),
    completionpercent integer DEFAULT 0 NOT NULL,
    doneresult character varying(255),
    scoped boolean,
    globalentitytype character varying(100),
    detailedstatus character varying(255)
);


ALTER TABLE public.mig_task OWNER TO confluence;

--
-- Name: mig_tombstone_account; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_tombstone_account (
    id character varying(255) NOT NULL,
    userkey character varying(255) NOT NULL,
    aaid character varying(128) NOT NULL
);


ALTER TABLE public.mig_tombstone_account OWNER TO confluence;

--
-- Name: mig_user_domain_rules; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_user_domain_rules (
    domain_name character varying(255) NOT NULL,
    rule_behaviour character varying(255) NOT NULL
);


ALTER TABLE public.mig_user_domain_rules OWNER TO confluence;

--
-- Name: mig_userbase_scan; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_userbase_scan (
    id character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    invalidusers bigint NOT NULL,
    duplicateusers bigint NOT NULL,
    started timestamp without time zone NOT NULL,
    finished timestamp without time zone,
    created timestamp without time zone NOT NULL
);


ALTER TABLE public.mig_userbase_scan OWNER TO confluence;

--
-- Name: mig_work_item; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.mig_work_item (
    itemid bigint NOT NULL,
    refid character varying(255) NOT NULL,
    retrycount integer NOT NULL,
    itemtype character varying(255) NOT NULL,
    itemstatus character varying(255) NOT NULL,
    jobid character varying(255),
    groupid character varying(255) NOT NULL
);


ALTER TABLE public.mig_work_item OWNER TO confluence;

--
-- Name: most_used_labels_cache; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.most_used_labels_cache (
    spaceid bigint NOT NULL,
    request_ts bigint,
    expiration_ts bigint,
    request_limit integer,
    labels text,
    version integer
);


ALTER TABLE public.most_used_labels_cache OWNER TO confluence;

--
-- Name: notifications; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.notifications (
    notificationid bigint NOT NULL,
    contentid bigint,
    labelid bigint,
    spaceid bigint,
    username character varying(255) NOT NULL,
    creator character varying(255),
    creationdate timestamp without time zone,
    lastmodifier character varying(255),
    lastmoddate timestamp without time zone,
    digest boolean,
    network boolean,
    contenttype character varying(255)
);


ALTER TABLE public.notifications OWNER TO confluence;

--
-- Name: os_propertyentry; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.os_propertyentry (
    entity_name character varying(125) NOT NULL,
    entity_id bigint NOT NULL,
    entity_key character varying(200) NOT NULL,
    key_type integer,
    boolean_val boolean,
    double_val double precision,
    string_val character varying(255),
    text_val text,
    long_val bigint,
    int_val integer,
    date_val timestamp without time zone
);


ALTER TABLE public.os_propertyentry OWNER TO confluence;

--
-- Name: pagetemplates; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.pagetemplates (
    templateid bigint NOT NULL,
    hibernateversion integer DEFAULT 0 NOT NULL,
    templatename character varying(255) NOT NULL,
    templatedesc character varying(255),
    pluginkey character varying(255),
    modulekey character varying(255),
    refpluginkey character varying(255),
    refmodulekey character varying(255),
    content text,
    spaceid bigint,
    prevver bigint,
    version integer NOT NULL,
    creator character varying(255),
    creationdate timestamp without time zone,
    lastmodifier character varying(255),
    lastmoddate timestamp without time zone,
    bodytypeid smallint
);


ALTER TABLE public.pagetemplates OWNER TO confluence;

--
-- Name: plugindata; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.plugindata (
    plugindataid bigint NOT NULL,
    pluginkey character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    lastmoddate timestamp without time zone,
    data bytea
);


ALTER TABLE public.plugindata OWNER TO confluence;

--
-- Name: remembermetoken; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.remembermetoken (
    id bigint NOT NULL,
    username character varying(255) NOT NULL,
    created bigint NOT NULL,
    token character varying(255) NOT NULL
);


ALTER TABLE public.remembermetoken OWNER TO confluence;

--
-- Name: scheduler_clustered_jobs; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.scheduler_clustered_jobs (
    id bigint NOT NULL,
    job_id character varying(255),
    next_run_time timestamp without time zone,
    version bigint,
    job_runner_key character varying(255),
    raw_parameters bytea,
    sched_type character(1),
    cron_expression character varying(255),
    cron_time_zone character varying(60),
    interval_first_run_time timestamp without time zone,
    interval_millis bigint
);


ALTER TABLE public.scheduler_clustered_jobs OWNER TO confluence;

--
-- Name: scheduler_run_details; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.scheduler_run_details (
    id bigint NOT NULL,
    job_id character varying(255),
    start_time timestamp without time zone,
    duration bigint,
    outcome character(1),
    message character varying(255)
);


ALTER TABLE public.scheduler_run_details OWNER TO confluence;

--
-- Name: seq_journal_entry_id; Type: SEQUENCE; Schema: public; Owner: confluence
--

CREATE SEQUENCE public.seq_journal_entry_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_journal_entry_id OWNER TO confluence;

--
-- Name: spacepermissions; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.spacepermissions (
    permid bigint NOT NULL,
    spaceid bigint,
    permtype character varying(255) NOT NULL,
    permgroupname character varying(255),
    permusername character varying(255),
    permalluserssubject character varying(255),
    creator character varying(255),
    creationdate timestamp without time zone,
    lastmodifier character varying(255),
    lastmoddate timestamp without time zone
);


ALTER TABLE public.spacepermissions OWNER TO confluence;

--
-- Name: spaces; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.spaces (
    spaceid bigint NOT NULL,
    spacename character varying(255),
    spacekey character varying(255) NOT NULL,
    lowerspacekey character varying(255) NOT NULL,
    spacedescid bigint,
    homepage bigint,
    creator character varying(255),
    creationdate timestamp without time zone,
    lastmodifier character varying(255),
    lastmoddate timestamp without time zone,
    spacetype character varying(255),
    spacestatus character varying(255)
);


ALTER TABLE public.spaces OWNER TO confluence;

--
-- Name: thiswillnotbecreated; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.thiswillnotbecreated (
    keyid bigint NOT NULL,
    alias character varying(255) NOT NULL,
    type character varying(32) NOT NULL,
    algorithm character varying(32) NOT NULL,
    keyspec text NOT NULL
);


ALTER TABLE public.thiswillnotbecreated OWNER TO confluence;

--
-- Name: trustedapp; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.trustedapp (
    trustedappid bigint NOT NULL,
    name character varying(255) NOT NULL,
    timeout integer NOT NULL,
    public_key_id bigint NOT NULL
);


ALTER TABLE public.trustedapp OWNER TO confluence;

--
-- Name: trustedapprestriction; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.trustedapprestriction (
    trustedapprestrictionid bigint NOT NULL,
    type character varying(32) NOT NULL,
    restriction character varying(255),
    trustedappid bigint
);


ALTER TABLE public.trustedapprestriction OWNER TO confluence;

--
-- Name: user_mapping; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.user_mapping (
    user_key character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    lower_username character varying(255)
);


ALTER TABLE public.user_mapping OWNER TO confluence;

--
-- Name: user_relation; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.user_relation (
    relationid bigint NOT NULL,
    sourceuser character varying(255) NOT NULL,
    targetuser character varying(255) NOT NULL,
    relationname character varying(255) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    lastmoddate timestamp without time zone NOT NULL,
    creator character varying(255) NOT NULL,
    lastmodifier character varying(255) NOT NULL
);


ALTER TABLE public.user_relation OWNER TO confluence;

--
-- Name: usercontent_relation; Type: TABLE; Schema: public; Owner: confluence
--

CREATE TABLE public.usercontent_relation (
    relationid bigint NOT NULL,
    targetcontentid bigint NOT NULL,
    sourceuser character varying(255) NOT NULL,
    targettype character varying(255) NOT NULL,
    relationname character varying(255) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    lastmoddate timestamp without time zone NOT NULL,
    creator character varying(255) NOT NULL,
    lastmodifier character varying(255) NOT NULL
);


ALTER TABLE public.usercontent_relation OWNER TO confluence;

--
-- Name: AO_187CCC_SIDEBAR_LINK ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_187CCC_SIDEBAR_LINK" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_187CCC_SIDEBAR_LINK_ID_seq"'::regclass);


--
-- Name: AO_21D670_WHITELIST_RULES ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_21D670_WHITELIST_RULES" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_21D670_WHITELIST_RULES_ID_seq"'::regclass);


--
-- Name: AO_21F425_MESSAGE_MAPPING_AO ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_21F425_MESSAGE_MAPPING_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_21F425_MESSAGE_MAPPING_AO_ID_seq"'::regclass);


--
-- Name: AO_21F425_USER_PROPERTY_AO ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_21F425_USER_PROPERTY_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_21F425_USER_PROPERTY_AO_ID_seq"'::regclass);


--
-- Name: AO_32184F_RECONCILIATIONS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_32184F_RECONCILIATIONS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_32184F_RECONCILIATIONS_ID_seq"'::regclass);


--
-- Name: AO_32184F_SYNCHRONY_REQUESTS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_32184F_SYNCHRONY_REQUESTS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_32184F_SYNCHRONY_REQUESTS_ID_seq"'::regclass);


--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_38321B_CUSTOM_CONTENT_LINK" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_38321B_CUSTOM_CONTENT_LINK_ID_seq"'::regclass);


--
-- Name: AO_4789DD_DISABLED_CHECKS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_DISABLED_CHECKS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_DISABLED_CHECKS_ID_seq"'::regclass);


--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_HEALTH_CHECK_STATUS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_HEALTH_CHECK_STATUS_ID_seq"'::regclass);


--
-- Name: AO_4789DD_HEALTH_CHECK_WATCHER ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_HEALTH_CHECK_WATCHER" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_HEALTH_CHECK_WATCHER_ID_seq"'::regclass);


--
-- Name: AO_4789DD_PROPERTIES ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_PROPERTIES" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_PROPERTIES_ID_seq"'::regclass);


--
-- Name: AO_4789DD_READ_NOTIFICATIONS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_READ_NOTIFICATIONS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_READ_NOTIFICATIONS_ID_seq"'::regclass);


--
-- Name: AO_4789DD_SHORTENED_KEY ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_SHORTENED_KEY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_SHORTENED_KEY_ID_seq"'::regclass);


--
-- Name: AO_4789DD_TASK_MONITOR ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_TASK_MONITOR" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_4789DD_TASK_MONITOR_ID_seq"'::regclass);


--
-- Name: AO_54C900_CONTENT_BLUEPRINT_AO ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_CONTENT_BLUEPRINT_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_54C900_CONTENT_BLUEPRINT_AO_ID_seq"'::regclass);


--
-- Name: AO_54C900_C_TEMPLATE_REF ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_C_TEMPLATE_REF" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_54C900_C_TEMPLATE_REF_ID_seq"'::regclass);


--
-- Name: AO_54C900_SPACE_BLUEPRINT_AO ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_SPACE_BLUEPRINT_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_54C900_SPACE_BLUEPRINT_AO_ID_seq"'::regclass);


--
-- Name: AO_563AEE_ACTIVITY_ENTITY ACTIVITY_ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY" ALTER COLUMN "ACTIVITY_ID" SET DEFAULT nextval('public."AO_563AEE_ACTIVITY_ENTITY_ACTIVITY_ID_seq"'::regclass);


--
-- Name: AO_563AEE_ACTOR_ENTITY ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_ACTOR_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_563AEE_ACTOR_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_MEDIA_LINK_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_563AEE_MEDIA_LINK_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_563AEE_OBJECT_ENTITY ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_OBJECT_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_563AEE_OBJECT_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_563AEE_TARGET_ENTITY ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_TARGET_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_563AEE_TARGET_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_59F889_ZDU_CLUSTER_NODES ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_59F889_ZDU_CLUSTER_NODES" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_59F889_ZDU_CLUSTER_NODES_ID_seq"'::regclass);


--
-- Name: AO_5F3884_FEATURE_DISCOVERY ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_5F3884_FEATURE_DISCOVERY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_5F3884_FEATURE_DISCOVERY_ID_seq"'::regclass);


--
-- Name: AO_6384AB_DISCOVERED ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_6384AB_DISCOVERED" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_6384AB_DISCOVERED_ID_seq"'::regclass);


--
-- Name: AO_6384AB_FEATURE_METADATA_AO ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_6384AB_FEATURE_METADATA_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_6384AB_FEATURE_METADATA_AO_ID_seq"'::regclass);


--
-- Name: AO_7B47A5_EVENT ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7B47A5_EVENT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_7B47A5_EVENT_ID_seq"'::regclass);


--
-- Name: AO_7B47A5_SETTINGS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7B47A5_SETTINGS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_7B47A5_SETTINGS_ID_seq"'::regclass);


--
-- Name: AO_7CDE43_EVENT ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_EVENT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_7CDE43_EVENT_ID_seq"'::regclass);


--
-- Name: AO_7CDE43_FILTER_PARAM ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_FILTER_PARAM" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_7CDE43_FILTER_PARAM_ID_seq"'::regclass);


--
-- Name: AO_7CDE43_NOTIFICATION ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_NOTIFICATION" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_7CDE43_NOTIFICATION_ID_seq"'::regclass);


--
-- Name: AO_7CDE43_NOTIFICATION_SCHEME ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_NOTIFICATION_SCHEME" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_7CDE43_NOTIFICATION_SCHEME_ID_seq"'::regclass);


--
-- Name: AO_7CDE43_RECIPIENT ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_RECIPIENT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_7CDE43_RECIPIENT_ID_seq"'::regclass);


--
-- Name: AO_7CDE43_SERVER_CONFIG ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_SERVER_CONFIG" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_7CDE43_SERVER_CONFIG_ID_seq"'::regclass);


--
-- Name: AO_7CDE43_SERVER_PARAM ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_SERVER_PARAM" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_7CDE43_SERVER_PARAM_ID_seq"'::regclass);


--
-- Name: AO_81F455_PERSONAL_TOKEN ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_81F455_PERSONAL_TOKEN" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_81F455_PERSONAL_TOKEN_ID_seq"'::regclass);


--
-- Name: AO_8752F1_DATA_PIPELINE_CONFIG ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_8752F1_DATA_PIPELINE_CONFIG" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_8752F1_DATA_PIPELINE_CONFIG_ID_seq"'::regclass);


--
-- Name: AO_8752F1_DATA_PIPELINE_EOO ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_8752F1_DATA_PIPELINE_EOO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_8752F1_DATA_PIPELINE_EOO_ID_seq"'::regclass);


--
-- Name: AO_8752F1_DATA_PIPELINE_JOB ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_8752F1_DATA_PIPELINE_JOB" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_8752F1_DATA_PIPELINE_JOB_ID_seq"'::regclass);


--
-- Name: AO_88BB94_BATCH_NOTIFICATION ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_88BB94_BATCH_NOTIFICATION" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_88BB94_BATCH_NOTIFICATION_ID_seq"'::regclass);


--
-- Name: AO_92296B_AORECENTLY_VIEWED ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_92296B_AORECENTLY_VIEWED" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_92296B_AORECENTLY_VIEWED_ID_seq"'::regclass);


--
-- Name: AO_9412A1_AONOTIFICATION ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_AONOTIFICATION" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_9412A1_AONOTIFICATION_ID_seq"'::regclass);


--
-- Name: AO_9412A1_AOTASK ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_AOTASK" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_9412A1_AOTASK_ID_seq"'::regclass);


--
-- Name: AO_9412A1_AOUSER ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_AOUSER" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_9412A1_AOUSER_ID_seq"'::regclass);


--
-- Name: AO_9412A1_USER_APP_LINK ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_USER_APP_LINK" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_9412A1_USER_APP_LINK_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_DISABLE_EV_TYPES ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_DISABLE_EV_TYPES" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_DISABLE_EV_TYPES_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_EVENTS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_EVENTS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_EVENTS_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_EVENTS_EXCL ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_EVENTS_EXCL" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_EVENTS_EXCL_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_EVENTS_INVITEES ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_EVENTS_INVITEES" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_EVENTS_INVITEES_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_JIRA_REMI_EVENTS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_JIRA_REMI_EVENTS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_JIRA_REMI_EVENTS_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_REMINDER_USERS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_REMINDER_USERS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_REMINDER_USERS_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_SUBCALS_IN_SPACE ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS_IN_SPACE" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_SUBCALS_IN_SPACE_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_GRP ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS_PRIV_GRP" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_SUBCALS_PRIV_GRP_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_USR ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS_PRIV_USR" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_SUBCALS_PRIV_USR_ID_seq"'::regclass);


--
-- Name: AO_950DC3_TC_SUBCALS_PROPS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS_PROPS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_950DC3_TC_SUBCALS_PROPS_ID_seq"'::regclass);


--
-- Name: AO_A0B856_WEBHOOK ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEBHOOK" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_A0B856_WEBHOOK_ID_seq"'::regclass);


--
-- Name: AO_A0B856_WEBHOOK_CONFIG ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEBHOOK_CONFIG" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_A0B856_WEBHOOK_CONFIG_ID_seq"'::regclass);


--
-- Name: AO_A0B856_WEBHOOK_EVENT ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEBHOOK_EVENT" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_A0B856_WEBHOOK_EVENT_ID_seq"'::regclass);


--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEB_HOOK_LISTENER_AO" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_A0B856_WEB_HOOK_LISTENER_AO_ID_seq"'::regclass);


--
-- Name: AO_AC3877_RL_USER_COUNTER ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_AC3877_RL_USER_COUNTER" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_AC3877_RL_USER_COUNTER_ID_seq"'::regclass);


--
-- Name: AO_BAF3AA_AOINLINE_TASK GLOBAL_ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_BAF3AA_AOINLINE_TASK" ALTER COLUMN "GLOBAL_ID" SET DEFAULT nextval('public."AO_BAF3AA_AOINLINE_TASK_GLOBAL_ID_seq"'::regclass);


--
-- Name: AO_C77861_AUDIT_ACTION_CACHE ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_ACTION_CACHE" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_C77861_AUDIT_ACTION_CACHE_ID_seq"'::regclass);


--
-- Name: AO_C77861_AUDIT_CATEGORY_CACHE ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_CATEGORY_CACHE" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_C77861_AUDIT_CATEGORY_CACHE_ID_seq"'::regclass);


--
-- Name: AO_C77861_AUDIT_DENY_LISTED ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_DENY_LISTED" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_C77861_AUDIT_DENY_LISTED_ID_seq"'::regclass);


--
-- Name: AO_C77861_AUDIT_ENTITY ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_ENTITY" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_C77861_AUDIT_ENTITY_ID_seq"'::regclass);


--
-- Name: AO_DC98AE_AOHELP_TIP ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_DC98AE_AOHELP_TIP" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_DC98AE_AOHELP_TIP_ID_seq"'::regclass);


--
-- Name: AO_ED669C_IDP_CONFIG ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_ED669C_IDP_CONFIG" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_ED669C_IDP_CONFIG_ID_seq"'::regclass);


--
-- Name: AO_ED669C_SEEN_ASSERTIONS ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_ED669C_SEEN_ASSERTIONS" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_ED669C_SEEN_ASSERTIONS_ID_seq"'::regclass);


--
-- Name: AO_FE1BC5_REDIRECT_URI ID; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_FE1BC5_REDIRECT_URI" ALTER COLUMN "ID" SET DEFAULT nextval('public."AO_FE1BC5_REDIRECT_URI_ID_seq"'::regclass);


--
-- Name: denormalised_content_change_log id; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_content_change_log ALTER COLUMN id SET DEFAULT nextval('public.denormalised_content_change_log_id_seq'::regclass);


--
-- Name: denormalised_space_change_log id; Type: DEFAULT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_space_change_log ALTER COLUMN id SET DEFAULT nextval('public.denormalised_space_change_log_id_seq'::regclass);


--
-- Name: AO_187CCC_SIDEBAR_LINK AO_187CCC_SIDEBAR_LINK_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_187CCC_SIDEBAR_LINK"
    ADD CONSTRAINT "AO_187CCC_SIDEBAR_LINK_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_21D670_WHITELIST_RULES AO_21D670_WHITELIST_RULES_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_21D670_WHITELIST_RULES"
    ADD CONSTRAINT "AO_21D670_WHITELIST_RULES_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_21F425_MESSAGE_AO AO_21F425_MESSAGE_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_21F425_MESSAGE_AO"
    ADD CONSTRAINT "AO_21F425_MESSAGE_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_21F425_MESSAGE_MAPPING_AO AO_21F425_MESSAGE_MAPPING_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_21F425_MESSAGE_MAPPING_AO"
    ADD CONSTRAINT "AO_21F425_MESSAGE_MAPPING_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_21F425_USER_PROPERTY_AO AO_21F425_USER_PROPERTY_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_21F425_USER_PROPERTY_AO"
    ADD CONSTRAINT "AO_21F425_USER_PROPERTY_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_32184F_RECONCILIATIONS AO_32184F_RECONCILIATIONS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_32184F_RECONCILIATIONS"
    ADD CONSTRAINT "AO_32184F_RECONCILIATIONS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_32184F_SYNCHRONY_REQUESTS AO_32184F_SYNCHRONY_REQUESTS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_32184F_SYNCHRONY_REQUESTS"
    ADD CONSTRAINT "AO_32184F_SYNCHRONY_REQUESTS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_38321B_CUSTOM_CONTENT_LINK AO_38321B_CUSTOM_CONTENT_LINK_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_38321B_CUSTOM_CONTENT_LINK"
    ADD CONSTRAINT "AO_38321B_CUSTOM_CONTENT_LINK_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_DISABLED_CHECKS AO_4789DD_DISABLED_CHECKS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_DISABLED_CHECKS"
    ADD CONSTRAINT "AO_4789DD_DISABLED_CHECKS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_HEALTH_CHECK_STATUS AO_4789DD_HEALTH_CHECK_STATUS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_HEALTH_CHECK_STATUS"
    ADD CONSTRAINT "AO_4789DD_HEALTH_CHECK_STATUS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_HEALTH_CHECK_WATCHER AO_4789DD_HEALTH_CHECK_WATCHER_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_HEALTH_CHECK_WATCHER"
    ADD CONSTRAINT "AO_4789DD_HEALTH_CHECK_WATCHER_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_PROPERTIES AO_4789DD_PROPERTIES_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_PROPERTIES"
    ADD CONSTRAINT "AO_4789DD_PROPERTIES_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_READ_NOTIFICATIONS AO_4789DD_READ_NOTIFICATIONS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_READ_NOTIFICATIONS"
    ADD CONSTRAINT "AO_4789DD_READ_NOTIFICATIONS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_SHORTENED_KEY AO_4789DD_SHORTENED_KEY_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_SHORTENED_KEY"
    ADD CONSTRAINT "AO_4789DD_SHORTENED_KEY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_4789DD_TASK_MONITOR AO_4789DD_TASK_MONITOR_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_TASK_MONITOR"
    ADD CONSTRAINT "AO_4789DD_TASK_MONITOR_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_54C900_CONTENT_BLUEPRINT_AO AO_54C900_CONTENT_BLUEPRINT_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_CONTENT_BLUEPRINT_AO"
    ADD CONSTRAINT "AO_54C900_CONTENT_BLUEPRINT_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_54C900_C_TEMPLATE_REF AO_54C900_C_TEMPLATE_REF_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_C_TEMPLATE_REF"
    ADD CONSTRAINT "AO_54C900_C_TEMPLATE_REF_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_54C900_SPACE_BLUEPRINT_AO AO_54C900_SPACE_BLUEPRINT_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_SPACE_BLUEPRINT_AO"
    ADD CONSTRAINT "AO_54C900_SPACE_BLUEPRINT_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_563AEE_ACTIVITY_ENTITY AO_563AEE_ACTIVITY_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT "AO_563AEE_ACTIVITY_ENTITY_pkey" PRIMARY KEY ("ACTIVITY_ID");


--
-- Name: AO_563AEE_ACTOR_ENTITY AO_563AEE_ACTOR_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_ACTOR_ENTITY"
    ADD CONSTRAINT "AO_563AEE_ACTOR_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_563AEE_MEDIA_LINK_ENTITY AO_563AEE_MEDIA_LINK_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_MEDIA_LINK_ENTITY"
    ADD CONSTRAINT "AO_563AEE_MEDIA_LINK_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_563AEE_OBJECT_ENTITY AO_563AEE_OBJECT_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_OBJECT_ENTITY"
    ADD CONSTRAINT "AO_563AEE_OBJECT_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_563AEE_TARGET_ENTITY AO_563AEE_TARGET_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_TARGET_ENTITY"
    ADD CONSTRAINT "AO_563AEE_TARGET_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_59F889_ZDU_CLUSTER_NODES AO_59F889_ZDU_CLUSTER_NODES_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_59F889_ZDU_CLUSTER_NODES"
    ADD CONSTRAINT "AO_59F889_ZDU_CLUSTER_NODES_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_5F3884_FEATURE_DISCOVERY AO_5F3884_FEATURE_DISCOVERY_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_5F3884_FEATURE_DISCOVERY"
    ADD CONSTRAINT "AO_5F3884_FEATURE_DISCOVERY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_6384AB_DISCOVERED AO_6384AB_DISCOVERED_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_6384AB_DISCOVERED"
    ADD CONSTRAINT "AO_6384AB_DISCOVERED_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_6384AB_FEATURE_METADATA_AO AO_6384AB_FEATURE_METADATA_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_6384AB_FEATURE_METADATA_AO"
    ADD CONSTRAINT "AO_6384AB_FEATURE_METADATA_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_723324_CLIENT_CONFIG AO_723324_CLIENT_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_723324_CLIENT_CONFIG"
    ADD CONSTRAINT "AO_723324_CLIENT_CONFIG_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_723324_CLIENT_TOKEN AO_723324_CLIENT_TOKEN_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_723324_CLIENT_TOKEN"
    ADD CONSTRAINT "AO_723324_CLIENT_TOKEN_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_7B47A5_EVENT AO_7B47A5_EVENT_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7B47A5_EVENT"
    ADD CONSTRAINT "AO_7B47A5_EVENT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_7B47A5_SETTINGS AO_7B47A5_SETTINGS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7B47A5_SETTINGS"
    ADD CONSTRAINT "AO_7B47A5_SETTINGS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_7CDE43_EVENT AO_7CDE43_EVENT_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_EVENT"
    ADD CONSTRAINT "AO_7CDE43_EVENT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_7CDE43_FILTER_PARAM AO_7CDE43_FILTER_PARAM_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_FILTER_PARAM"
    ADD CONSTRAINT "AO_7CDE43_FILTER_PARAM_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_7CDE43_NOTIFICATION_SCHEME AO_7CDE43_NOTIFICATION_SCHEME_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_NOTIFICATION_SCHEME"
    ADD CONSTRAINT "AO_7CDE43_NOTIFICATION_SCHEME_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_7CDE43_NOTIFICATION AO_7CDE43_NOTIFICATION_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_NOTIFICATION"
    ADD CONSTRAINT "AO_7CDE43_NOTIFICATION_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_7CDE43_RECIPIENT AO_7CDE43_RECIPIENT_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_RECIPIENT"
    ADD CONSTRAINT "AO_7CDE43_RECIPIENT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_7CDE43_SERVER_CONFIG AO_7CDE43_SERVER_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_SERVER_CONFIG"
    ADD CONSTRAINT "AO_7CDE43_SERVER_CONFIG_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_7CDE43_SERVER_PARAM AO_7CDE43_SERVER_PARAM_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_SERVER_PARAM"
    ADD CONSTRAINT "AO_7CDE43_SERVER_PARAM_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_81F455_PERSONAL_TOKEN AO_81F455_PERSONAL_TOKEN_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_81F455_PERSONAL_TOKEN"
    ADD CONSTRAINT "AO_81F455_PERSONAL_TOKEN_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_8752F1_DATA_PIPELINE_CONFIG AO_8752F1_DATA_PIPELINE_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_8752F1_DATA_PIPELINE_CONFIG"
    ADD CONSTRAINT "AO_8752F1_DATA_PIPELINE_CONFIG_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_8752F1_DATA_PIPELINE_EOO AO_8752F1_DATA_PIPELINE_EOO_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_8752F1_DATA_PIPELINE_EOO"
    ADD CONSTRAINT "AO_8752F1_DATA_PIPELINE_EOO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_8752F1_DATA_PIPELINE_JOB AO_8752F1_DATA_PIPELINE_JOB_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_8752F1_DATA_PIPELINE_JOB"
    ADD CONSTRAINT "AO_8752F1_DATA_PIPELINE_JOB_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_88BB94_BATCH_NOTIFICATION AO_88BB94_BATCH_NOTIFICATION_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_88BB94_BATCH_NOTIFICATION"
    ADD CONSTRAINT "AO_88BB94_BATCH_NOTIFICATION_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_92296B_AORECENTLY_VIEWED AO_92296B_AORECENTLY_VIEWED_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_92296B_AORECENTLY_VIEWED"
    ADD CONSTRAINT "AO_92296B_AORECENTLY_VIEWED_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_9412A1_AONOTIFICATION AO_9412A1_AONOTIFICATION_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_AONOTIFICATION"
    ADD CONSTRAINT "AO_9412A1_AONOTIFICATION_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_9412A1_AOREGISTRATION AO_9412A1_AOREGISTRATION_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_AOREGISTRATION"
    ADD CONSTRAINT "AO_9412A1_AOREGISTRATION_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_9412A1_AOTASK AO_9412A1_AOTASK_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_AOTASK"
    ADD CONSTRAINT "AO_9412A1_AOTASK_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_9412A1_AOUSER AO_9412A1_AOUSER_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_AOUSER"
    ADD CONSTRAINT "AO_9412A1_AOUSER_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_9412A1_USER_APP_LINK AO_9412A1_USER_APP_LINK_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_USER_APP_LINK"
    ADD CONSTRAINT "AO_9412A1_USER_APP_LINK_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_CUSTOM_EV_TYPES AO_950DC3_TC_CUSTOM_EV_TYPES_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_CUSTOM_EV_TYPES"
    ADD CONSTRAINT "AO_950DC3_TC_CUSTOM_EV_TYPES_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_DISABLE_EV_TYPES AO_950DC3_TC_DISABLE_EV_TYPES_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_DISABLE_EV_TYPES"
    ADD CONSTRAINT "AO_950DC3_TC_DISABLE_EV_TYPES_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_EVENTS_EXCL AO_950DC3_TC_EVENTS_EXCL_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_EVENTS_EXCL"
    ADD CONSTRAINT "AO_950DC3_TC_EVENTS_EXCL_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_EVENTS_INVITEES AO_950DC3_TC_EVENTS_INVITEES_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_EVENTS_INVITEES"
    ADD CONSTRAINT "AO_950DC3_TC_EVENTS_INVITEES_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_EVENTS AO_950DC3_TC_EVENTS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_EVENTS"
    ADD CONSTRAINT "AO_950DC3_TC_EVENTS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_JIRA_REMI_EVENTS AO_950DC3_TC_JIRA_REMI_EVENTS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_JIRA_REMI_EVENTS"
    ADD CONSTRAINT "AO_950DC3_TC_JIRA_REMI_EVENTS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_REMINDER_SETTINGS AO_950DC3_TC_REMINDER_SETTINGS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_REMINDER_SETTINGS"
    ADD CONSTRAINT "AO_950DC3_TC_REMINDER_SETTINGS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_REMINDER_USERS AO_950DC3_TC_REMINDER_USERS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_REMINDER_USERS"
    ADD CONSTRAINT "AO_950DC3_TC_REMINDER_USERS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_SUBCALS_IN_SPACE AO_950DC3_TC_SUBCALS_IN_SPACE_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS_IN_SPACE"
    ADD CONSTRAINT "AO_950DC3_TC_SUBCALS_IN_SPACE_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_GRP AO_950DC3_TC_SUBCALS_PRIV_GRP_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS_PRIV_GRP"
    ADD CONSTRAINT "AO_950DC3_TC_SUBCALS_PRIV_GRP_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_SUBCALS_PRIV_USR AO_950DC3_TC_SUBCALS_PRIV_USR_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS_PRIV_USR"
    ADD CONSTRAINT "AO_950DC3_TC_SUBCALS_PRIV_USR_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_SUBCALS_PROPS AO_950DC3_TC_SUBCALS_PROPS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS_PROPS"
    ADD CONSTRAINT "AO_950DC3_TC_SUBCALS_PROPS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_950DC3_TC_SUBCALS AO_950DC3_TC_SUBCALS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS"
    ADD CONSTRAINT "AO_950DC3_TC_SUBCALS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_954A21_PUSH_NOTIFICATION_AO AO_954A21_PUSH_NOTIFICATION_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_954A21_PUSH_NOTIFICATION_AO"
    ADD CONSTRAINT "AO_954A21_PUSH_NOTIFICATION_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_A0B856_DAILY_COUNTS AO_A0B856_DAILY_COUNTS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_DAILY_COUNTS"
    ADD CONSTRAINT "AO_A0B856_DAILY_COUNTS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_A0B856_HIST_INVOCATION AO_A0B856_HIST_INVOCATION_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_HIST_INVOCATION"
    ADD CONSTRAINT "AO_A0B856_HIST_INVOCATION_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_A0B856_WEBHOOK_CONFIG AO_A0B856_WEBHOOK_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEBHOOK_CONFIG"
    ADD CONSTRAINT "AO_A0B856_WEBHOOK_CONFIG_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_A0B856_WEBHOOK_EVENT AO_A0B856_WEBHOOK_EVENT_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEBHOOK_EVENT"
    ADD CONSTRAINT "AO_A0B856_WEBHOOK_EVENT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_A0B856_WEBHOOK AO_A0B856_WEBHOOK_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEBHOOK"
    ADD CONSTRAINT "AO_A0B856_WEBHOOK_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_A0B856_WEB_HOOK_LISTENER_AO AO_A0B856_WEB_HOOK_LISTENER_AO_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEB_HOOK_LISTENER_AO"
    ADD CONSTRAINT "AO_A0B856_WEB_HOOK_LISTENER_AO_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_AC3877_RL_USER_COUNTER AO_AC3877_RL_USER_COUNTER_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_AC3877_RL_USER_COUNTER"
    ADD CONSTRAINT "AO_AC3877_RL_USER_COUNTER_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_AC3877_SETTINGS_VERSION AO_AC3877_SETTINGS_VERSION_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_AC3877_SETTINGS_VERSION"
    ADD CONSTRAINT "AO_AC3877_SETTINGS_VERSION_pkey" PRIMARY KEY ("TYPE");


--
-- Name: AO_AC3877_SYSTEM_RL_SETTINGS AO_AC3877_SYSTEM_RL_SETTINGS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_AC3877_SYSTEM_RL_SETTINGS"
    ADD CONSTRAINT "AO_AC3877_SYSTEM_RL_SETTINGS_pkey" PRIMARY KEY ("NAME");


--
-- Name: AO_AC3877_USER_RL_SETTINGS AO_AC3877_USER_RL_SETTINGS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_AC3877_USER_RL_SETTINGS"
    ADD CONSTRAINT "AO_AC3877_USER_RL_SETTINGS_pkey" PRIMARY KEY ("USER_ID");


--
-- Name: AO_BAF3AA_AOINLINE_TASK AO_BAF3AA_AOINLINE_TASK_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_BAF3AA_AOINLINE_TASK"
    ADD CONSTRAINT "AO_BAF3AA_AOINLINE_TASK_pkey" PRIMARY KEY ("GLOBAL_ID");


--
-- Name: AO_C77861_AUDIT_ACTION_CACHE AO_C77861_AUDIT_ACTION_CACHE_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_ACTION_CACHE"
    ADD CONSTRAINT "AO_C77861_AUDIT_ACTION_CACHE_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_C77861_AUDIT_CATEGORY_CACHE AO_C77861_AUDIT_CATEGORY_CACHE_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_CATEGORY_CACHE"
    ADD CONSTRAINT "AO_C77861_AUDIT_CATEGORY_CACHE_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_C77861_AUDIT_DENY_LISTED AO_C77861_AUDIT_DENY_LISTED_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_DENY_LISTED"
    ADD CONSTRAINT "AO_C77861_AUDIT_DENY_LISTED_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_C77861_AUDIT_ENTITY AO_C77861_AUDIT_ENTITY_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_C77861_AUDIT_ENTITY"
    ADD CONSTRAINT "AO_C77861_AUDIT_ENTITY_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_DC98AE_AOHELP_TIP AO_DC98AE_AOHELP_TIP_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_DC98AE_AOHELP_TIP"
    ADD CONSTRAINT "AO_DC98AE_AOHELP_TIP_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_ED669C_IDP_CONFIG AO_ED669C_IDP_CONFIG_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_ED669C_IDP_CONFIG"
    ADD CONSTRAINT "AO_ED669C_IDP_CONFIG_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_ED669C_SEEN_ASSERTIONS AO_ED669C_SEEN_ASSERTIONS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_ED669C_SEEN_ASSERTIONS"
    ADD CONSTRAINT "AO_ED669C_SEEN_ASSERTIONS_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_FE1BC5_ACCESS_TOKEN AO_FE1BC5_ACCESS_TOKEN_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_FE1BC5_ACCESS_TOKEN"
    ADD CONSTRAINT "AO_FE1BC5_ACCESS_TOKEN_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_FE1BC5_AUTHORIZATION AO_FE1BC5_AUTHORIZATION_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_FE1BC5_AUTHORIZATION"
    ADD CONSTRAINT "AO_FE1BC5_AUTHORIZATION_pkey" PRIMARY KEY ("AUTHORIZATION_CODE");


--
-- Name: AO_FE1BC5_CLIENT AO_FE1BC5_CLIENT_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_FE1BC5_CLIENT"
    ADD CONSTRAINT "AO_FE1BC5_CLIENT_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_FE1BC5_REDIRECT_URI AO_FE1BC5_REDIRECT_URI_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_FE1BC5_REDIRECT_URI"
    ADD CONSTRAINT "AO_FE1BC5_REDIRECT_URI_pkey" PRIMARY KEY ("ID");


--
-- Name: AO_FE1BC5_REFRESH_TOKEN AO_FE1BC5_REFRESH_TOKEN_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_FE1BC5_REFRESH_TOKEN"
    ADD CONSTRAINT "AO_FE1BC5_REFRESH_TOKEN_pkey" PRIMARY KEY ("ID");


--
-- Name: EVENTS EVENTS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."EVENTS"
    ADD CONSTRAINT "EVENTS_pkey" PRIMARY KEY (rev, history);


--
-- Name: SECRETS SECRETS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."SECRETS"
    ADD CONSTRAINT "SECRETS_pkey" PRIMARY KEY (key);


--
-- Name: SNAPSHOTS SNAPSHOTS_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."SNAPSHOTS"
    ADD CONSTRAINT "SNAPSHOTS_pkey" PRIMARY KEY (key);


--
-- Name: attachmentdata attachmentdata_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.attachmentdata
    ADD CONSTRAINT attachmentdata_pkey PRIMARY KEY (attachmentdataid);


--
-- Name: audit_affected_object audit_affected_object_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.audit_affected_object
    ADD CONSTRAINT audit_affected_object_pkey PRIMARY KEY (id);


--
-- Name: audit_changed_value audit_changed_value_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.audit_changed_value
    ADD CONSTRAINT audit_changed_value_pkey PRIMARY KEY (id);


--
-- Name: auditrecord auditrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.auditrecord
    ADD CONSTRAINT auditrecord_pkey PRIMARY KEY (auditrecordid);


--
-- Name: background_job_archived background_job_archived_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.background_job_archived
    ADD CONSTRAINT background_job_archived_pkey PRIMARY KEY (id);


--
-- Name: background_job background_job_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.background_job
    ADD CONSTRAINT background_job_pkey PRIMARY KEY (id);


--
-- Name: backup_restore_job_details backup_restore_job_details_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.backup_restore_job_details
    ADD CONSTRAINT backup_restore_job_details_pkey PRIMARY KEY (id);


--
-- Name: backup_restore_job_settings backup_restore_job_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.backup_restore_job_settings
    ADD CONSTRAINT backup_restore_job_settings_pkey PRIMARY KEY (id);


--
-- Name: backup_restore_job_statistics backup_restore_job_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.backup_restore_job_statistics
    ADD CONSTRAINT backup_restore_job_statistics_pkey PRIMARY KEY (id);


--
-- Name: bandana bandana_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.bandana
    ADD CONSTRAINT bandana_pkey PRIMARY KEY (bandanaid);


--
-- Name: bandana bandana_unique_key; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.bandana
    ADD CONSTRAINT bandana_unique_key UNIQUE (bandanacontext, bandanakey);


--
-- Name: bodycontent bodycontent_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.bodycontent
    ADD CONSTRAINT bodycontent_pkey PRIMARY KEY (bodycontentid);


--
-- Name: content_relation c2c_relation_unique; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_relation
    ADD CONSTRAINT c2c_relation_unique UNIQUE (targetcontentid, sourcecontentid, relationname);


--
-- Name: clustersafety clustersafety_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.clustersafety
    ADD CONSTRAINT clustersafety_pkey PRIMARY KEY (clustersafetyid);


--
-- Name: confancestors confancestors_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.confancestors
    ADD CONSTRAINT confancestors_pkey PRIMARY KEY (descendentid, ancestorposition);


--
-- Name: confversion confversion_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.confversion
    ADD CONSTRAINT confversion_pkey PRIMARY KEY (confversionid);


--
-- Name: confzdu confzdu_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.confzdu
    ADD CONSTRAINT confzdu_pkey PRIMARY KEY (confzduid);


--
-- Name: content_label content_label_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_label
    ADD CONSTRAINT content_label_pkey PRIMARY KEY (id);


--
-- Name: content_perm content_perm_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm
    ADD CONSTRAINT content_perm_pkey PRIMARY KEY (id);


--
-- Name: content_perm_set content_perm_set_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm_set
    ADD CONSTRAINT content_perm_set_pkey PRIMARY KEY (id);


--
-- Name: content content_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (contentid);


--
-- Name: content_relation content_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_relation
    ADD CONSTRAINT content_relation_pkey PRIMARY KEY (relationid);


--
-- Name: contentproperties contentproperties_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.contentproperties
    ADD CONSTRAINT contentproperties_pkey PRIMARY KEY (propertyid);


--
-- Name: content_perm cp_unique_group; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm
    ADD CONSTRAINT cp_unique_group UNIQUE (cps_id, cp_type, groupname);


--
-- Name: content_perm cp_unique_user; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm
    ADD CONSTRAINT cp_unique_user UNIQUE (cps_id, cp_type, username);


--
-- Name: content_perm_set cps_unique_type; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm_set
    ADD CONSTRAINT cps_unique_type UNIQUE (content_id, cont_perm_type);


--
-- Name: cwd_app_dir_group_mapping cwd_app_dir_group_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_app_dir_group_mapping
    ADD CONSTRAINT cwd_app_dir_group_mapping_pkey PRIMARY KEY (id);


--
-- Name: cwd_app_dir_mapping cwd_app_dir_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_app_dir_mapping
    ADD CONSTRAINT cwd_app_dir_mapping_pkey PRIMARY KEY (id);


--
-- Name: cwd_app_dir_operation cwd_app_dir_operation_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_app_dir_operation
    ADD CONSTRAINT cwd_app_dir_operation_pkey PRIMARY KEY (app_dir_mapping_id, operation_type);


--
-- Name: cwd_application_address cwd_application_address_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_application_address
    ADD CONSTRAINT cwd_application_address_pkey PRIMARY KEY (application_id, remote_address);


--
-- Name: cwd_application_attribute cwd_application_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_application_attribute
    ADD CONSTRAINT cwd_application_attribute_pkey PRIMARY KEY (application_id, attribute_name);


--
-- Name: cwd_application cwd_application_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_application
    ADD CONSTRAINT cwd_application_pkey PRIMARY KEY (id);


--
-- Name: cwd_directory_attribute cwd_directory_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_directory_attribute
    ADD CONSTRAINT cwd_directory_attribute_pkey PRIMARY KEY (directory_id, attribute_name);


--
-- Name: cwd_directory_operation cwd_directory_operation_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_directory_operation
    ADD CONSTRAINT cwd_directory_operation_pkey PRIMARY KEY (directory_id, operation_type);


--
-- Name: cwd_directory cwd_directory_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_directory
    ADD CONSTRAINT cwd_directory_pkey PRIMARY KEY (id);


--
-- Name: cwd_group_attribute cwd_group_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_group_attribute
    ADD CONSTRAINT cwd_group_attribute_pkey PRIMARY KEY (id);


--
-- Name: cwd_group cwd_group_name_dir_id; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_group
    ADD CONSTRAINT cwd_group_name_dir_id UNIQUE (lower_group_name, directory_id);


--
-- Name: cwd_group cwd_group_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_group
    ADD CONSTRAINT cwd_group_pkey PRIMARY KEY (id);


--
-- Name: cwd_membership cwd_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_membership
    ADD CONSTRAINT cwd_membership_pkey PRIMARY KEY (id);


--
-- Name: cwd_synchronisation_status cwd_synchronisation_status_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_synchronisation_status
    ADD CONSTRAINT cwd_synchronisation_status_pkey PRIMARY KEY (id);


--
-- Name: cwd_synchronisation_token cwd_synchronisation_token_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_synchronisation_token
    ADD CONSTRAINT cwd_synchronisation_token_pkey PRIMARY KEY (directory_id);


--
-- Name: cwd_tombstone cwd_tombstone_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_tombstone
    ADD CONSTRAINT cwd_tombstone_pkey PRIMARY KEY (id);


--
-- Name: cwd_membership cwd_unique_group_membership; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_membership
    ADD CONSTRAINT cwd_unique_group_membership UNIQUE (parent_id, child_group_id);


--
-- Name: cwd_group_attribute cwd_unique_grp_attr; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_group_attribute
    ADD CONSTRAINT cwd_unique_grp_attr UNIQUE (directory_id, group_id, attribute_name, attribute_lower_value);


--
-- Name: cwd_membership cwd_unique_user_membership; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_membership
    ADD CONSTRAINT cwd_unique_user_membership UNIQUE (parent_id, child_user_id);


--
-- Name: cwd_user_attribute cwd_unique_usr_attr; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_user_attribute
    ADD CONSTRAINT cwd_unique_usr_attr UNIQUE (directory_id, user_id, attribute_name, attribute_lower_value);


--
-- Name: cwd_user_attribute cwd_user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_user_attribute
    ADD CONSTRAINT cwd_user_attribute_pkey PRIMARY KEY (id);


--
-- Name: cwd_user_credential_record cwd_user_credential_record_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_user_credential_record
    ADD CONSTRAINT cwd_user_credential_record_pkey PRIMARY KEY (id);


--
-- Name: cwd_user cwd_user_name_dir_id; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_user
    ADD CONSTRAINT cwd_user_name_dir_id UNIQUE (lower_user_name, directory_id);


--
-- Name: cwd_user cwd_user_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_user
    ADD CONSTRAINT cwd_user_pkey PRIMARY KEY (id);


--
-- Name: decorator decorator_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.decorator
    ADD CONSTRAINT decorator_pkey PRIMARY KEY (decoratorid);


--
-- Name: denormalised_content_change_log denormalised_content_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_content_change_log
    ADD CONSTRAINT denormalised_content_change_log_pkey PRIMARY KEY (id);


--
-- Name: denormalised_content denormalised_content_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_content
    ADD CONSTRAINT denormalised_content_pkey PRIMARY KEY (id);


--
-- Name: denormalised_content_view_permissions denormalised_content_view_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_content_view_permissions
    ADD CONSTRAINT denormalised_content_view_permissions_pkey PRIMARY KEY (sid_id, content_id);


--
-- Name: denormalised_service_lock denormalised_service_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_service_lock
    ADD CONSTRAINT denormalised_service_lock_pkey PRIMARY KEY (lock_name);


--
-- Name: denormalised_sid denormalised_sid_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_sid
    ADD CONSTRAINT denormalised_sid_pkey PRIMARY KEY (id);


--
-- Name: denormalised_space_change_log denormalised_space_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_space_change_log
    ADD CONSTRAINT denormalised_space_change_log_pkey PRIMARY KEY (id);


--
-- Name: denormalised_space_edit_permissions denormalised_space_edit_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_space_edit_permissions
    ADD CONSTRAINT denormalised_space_edit_permissions_pkey PRIMARY KEY (sid_id, space_id);


--
-- Name: denormalised_space_view_permissions denormalised_space_view_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_space_view_permissions
    ADD CONSTRAINT denormalised_space_view_permissions_pkey PRIMARY KEY (sid_id, space_id);


--
-- Name: denormalised_state_change_log denormalised_state_change_log_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_state_change_log
    ADD CONSTRAINT denormalised_state_change_log_pkey PRIMARY KEY (id);


--
-- Name: denormalised_state denormalised_state_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.denormalised_state
    ADD CONSTRAINT denormalised_state_pkey PRIMARY KEY (service_type);


--
-- Name: diagnostics_alerts diagnostics_alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.diagnostics_alerts
    ADD CONSTRAINT diagnostics_alerts_pkey PRIMARY KEY (id);


--
-- Name: follow_connections follow_connections_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.follow_connections
    ADD CONSTRAINT follow_connections_pkey PRIMARY KEY (connectionid);


--
-- Name: gr_response_group gr_response_group_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.gr_response_group
    ADD CONSTRAINT gr_response_group_pkey PRIMARY KEY (id);


--
-- Name: guardrails_response guardrails_response_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.guardrails_response
    ADD CONSTRAINT guardrails_response_pkey PRIMARY KEY (id);


--
-- Name: imagedetails imagedetails_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.imagedetails
    ADD CONSTRAINT imagedetails_pkey PRIMARY KEY (attachmentid);


--
-- Name: journalentry journalentry_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.journalentry
    ADD CONSTRAINT journalentry_pkey PRIMARY KEY (entry_id);


--
-- Name: keystore keystore_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.keystore
    ADD CONSTRAINT keystore_pkey PRIMARY KEY (keyid);


--
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (labelid);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (linkid);


--
-- Name: logininfo logininfo_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.logininfo
    ADD CONSTRAINT logininfo_pkey PRIMARY KEY (id);


--
-- Name: mig_analytics_event mig_analytics_event_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_analytics_event
    ADD CONSTRAINT mig_analytics_event_pkey PRIMARY KEY (id);


--
-- Name: mig_app_access_scope mig_app_access_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_app_access_scope
    ADD CONSTRAINT mig_app_access_scope_pkey PRIMARY KEY (serverappkey, accessscope);


--
-- Name: mig_app_assessment_info mig_app_assessment_info_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_app_assessment_info
    ADD CONSTRAINT mig_app_assessment_info_pkey PRIMARY KEY (appkey);


--
-- Name: mig_attachment mig_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_attachment
    ADD CONSTRAINT mig_attachment_pkey PRIMARY KEY (cloudid, attachmentid);


--
-- Name: mig_check_override mig_check_override_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_check_override
    ADD CONSTRAINT mig_check_override_pkey PRIMARY KEY (id);


--
-- Name: mig_check_override mig_check_override_unique; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_check_override
    ADD CONSTRAINT mig_check_override_unique UNIQUE (executionid, checktype);


--
-- Name: mig_check_result mig_check_result_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_check_result
    ADD CONSTRAINT mig_check_result_pkey PRIMARY KEY (id);


--
-- Name: mig_cloud_site mig_cloud_site_cloudurl_key; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_cloud_site
    ADD CONSTRAINT mig_cloud_site_cloudurl_key UNIQUE (cloudurl);


--
-- Name: mig_cloud_site mig_cloud_site_containertoken_key; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_cloud_site
    ADD CONSTRAINT mig_cloud_site_containertoken_key UNIQUE (containertoken);


--
-- Name: mig_cloud_site mig_cloud_site_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_cloud_site
    ADD CONSTRAINT mig_cloud_site_pkey PRIMARY KEY (cloudid);


--
-- Name: mig_config mig_config_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_config
    ADD CONSTRAINT mig_config_pkey PRIMARY KEY (id);


--
-- Name: mig_db_changelog_lock mig_db_changelog_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_db_changelog_lock
    ADD CONSTRAINT mig_db_changelog_lock_pkey PRIMARY KEY (id);


--
-- Name: mig_detected_event_log mig_detected_event_log_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_detected_event_log
    ADD CONSTRAINT mig_detected_event_log_pkey PRIMARY KEY (cloudid, email);


--
-- Name: mig_exclude_app mig_exclude_app_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_exclude_app
    ADD CONSTRAINT mig_exclude_app_pkey PRIMARY KEY (id);


--
-- Name: mig_exclude_app mig_exclude_app_unique; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_exclude_app
    ADD CONSTRAINT mig_exclude_app_unique UNIQUE (taskid, appkey);


--
-- Name: mig_export_cache mig_export_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_export_cache
    ADD CONSTRAINT mig_export_cache_pkey PRIMARY KEY (id);


--
-- Name: mig_incorrect_email mig_incorrect_email_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_incorrect_email
    ADD CONSTRAINT mig_incorrect_email_pkey PRIMARY KEY (id);


--
-- Name: mig_invalid_email_user mig_invalid_email_user_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_invalid_email_user
    ADD CONSTRAINT mig_invalid_email_user_pkey PRIMARY KEY (username);


--
-- Name: mig_mapi_plan_mapping mig_mapi_plan_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_mapi_plan_mapping
    ADD CONSTRAINT mig_mapi_plan_mapping_pkey PRIMARY KEY (jobid);


--
-- Name: mig_needed_in_cloud_app mig_needed_in_cloud_app_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_needed_in_cloud_app
    ADD CONSTRAINT mig_needed_in_cloud_app_pkey PRIMARY KEY (id);


--
-- Name: mig_needed_in_cloud_app mig_needed_in_cloud_app_unique; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_needed_in_cloud_app
    ADD CONSTRAINT mig_needed_in_cloud_app_unique UNIQUE (taskid, appkey);


--
-- Name: mig_plan mig_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_plan
    ADD CONSTRAINT mig_plan_pkey PRIMARY KEY (id);


--
-- Name: mig_sequences mig_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_sequences
    ADD CONSTRAINT mig_sequences_pkey PRIMARY KEY (sequence_name);


--
-- Name: mig_space_statistic mig_space_statistic_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_space_statistic
    ADD CONSTRAINT mig_space_statistic_pkey PRIMARY KEY (spaceid);


--
-- Name: mig_stats mig_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_stats
    ADD CONSTRAINT mig_stats_pkey PRIMARY KEY (stattype, statname);


--
-- Name: mig_step mig_step_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_step
    ADD CONSTRAINT mig_step_pkey PRIMARY KEY (id);


--
-- Name: mig_task mig_task_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_task
    ADD CONSTRAINT mig_task_pkey PRIMARY KEY (id);


--
-- Name: mig_tombstone_account mig_tombstone_account_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_tombstone_account
    ADD CONSTRAINT mig_tombstone_account_pkey PRIMARY KEY (id);


--
-- Name: mig_user_domain_rules mig_user_domain_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_user_domain_rules
    ADD CONSTRAINT mig_user_domain_rules_pkey PRIMARY KEY (domain_name);


--
-- Name: mig_userbase_scan mig_userbase_scan_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_userbase_scan
    ADD CONSTRAINT mig_userbase_scan_pkey PRIMARY KEY (id);


--
-- Name: mig_work_item mig_work_item_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_work_item
    ADD CONSTRAINT mig_work_item_pkey PRIMARY KEY (itemid);


--
-- Name: mig_work_item mig_work_item_refid_key; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_work_item
    ADD CONSTRAINT mig_work_item_refid_key UNIQUE (refid);


--
-- Name: most_used_labels_cache most_used_labels_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.most_used_labels_cache
    ADD CONSTRAINT most_used_labels_cache_pkey PRIMARY KEY (spaceid);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notificationid);


--
-- Name: os_propertyentry os_propertyentry_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.os_propertyentry
    ADD CONSTRAINT os_propertyentry_pkey PRIMARY KEY (entity_name, entity_id, entity_key);


--
-- Name: pagetemplates pagetemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.pagetemplates
    ADD CONSTRAINT pagetemplates_pkey PRIMARY KEY (templateid);


--
-- Name: mig_plan plan_name_uniqueness; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_plan
    ADD CONSTRAINT plan_name_uniqueness UNIQUE (planname);


--
-- Name: plugindata plugindata_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.plugindata
    ADD CONSTRAINT plugindata_pkey PRIMARY KEY (plugindataid);


--
-- Name: remembermetoken remembermetoken_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.remembermetoken
    ADD CONSTRAINT remembermetoken_pkey PRIMARY KEY (id);


--
-- Name: scheduler_clustered_jobs scheduler_clustered_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.scheduler_clustered_jobs
    ADD CONSTRAINT scheduler_clustered_jobs_pkey PRIMARY KEY (id);


--
-- Name: scheduler_run_details scheduler_run_details_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.scheduler_run_details
    ADD CONSTRAINT scheduler_run_details_pkey PRIMARY KEY (id);


--
-- Name: spacepermissions spacepermissions_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spacepermissions
    ADD CONSTRAINT spacepermissions_pkey PRIMARY KEY (permid);


--
-- Name: spaces spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT spaces_pkey PRIMARY KEY (spaceid);


--
-- Name: thiswillnotbecreated thiswillnotbecreated_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.thiswillnotbecreated
    ADD CONSTRAINT thiswillnotbecreated_pkey PRIMARY KEY (keyid);


--
-- Name: trustedapp trustedapp_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.trustedapp
    ADD CONSTRAINT trustedapp_pkey PRIMARY KEY (trustedappid);


--
-- Name: trustedapprestriction trustedapprestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.trustedapprestriction
    ADD CONSTRAINT trustedapprestriction_pkey PRIMARY KEY (trustedapprestrictionid);


--
-- Name: usercontent_relation u2c_relation_unique; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.usercontent_relation
    ADD CONSTRAINT u2c_relation_unique UNIQUE (targetcontentid, sourceuser, relationname);


--
-- Name: user_relation u2u_relation_unique; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT u2u_relation_unique UNIQUE (sourceuser, targetuser, relationname);


--
-- Name: AO_4789DD_DISABLED_CHECKS u_ao_4789dd_disable1943052426; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_DISABLED_CHECKS"
    ADD CONSTRAINT u_ao_4789dd_disable1943052426 UNIQUE ("HEALTH_CHECK_KEY");


--
-- Name: AO_4789DD_HEALTH_CHECK_WATCHER u_ao_4789dd_health_432053140; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_HEALTH_CHECK_WATCHER"
    ADD CONSTRAINT u_ao_4789dd_health_432053140 UNIQUE ("USER_KEY");


--
-- Name: AO_4789DD_SHORTENED_KEY u_ao_4789dd_shortened_key_key; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_SHORTENED_KEY"
    ADD CONSTRAINT u_ao_4789dd_shortened_key_key UNIQUE ("KEY");


--
-- Name: AO_4789DD_TASK_MONITOR u_ao_4789dd_task_mo1827547914; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_4789DD_TASK_MONITOR"
    ADD CONSTRAINT u_ao_4789dd_task_mo1827547914 UNIQUE ("TASK_ID");


--
-- Name: AO_723324_CLIENT_CONFIG u_ao_723324_client_config_name; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_723324_CLIENT_CONFIG"
    ADD CONSTRAINT u_ao_723324_client_config_name UNIQUE ("NAME");


--
-- Name: AO_7B47A5_SETTINGS u_ao_7b47a5_settings_key; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7B47A5_SETTINGS"
    ADD CONSTRAINT u_ao_7b47a5_settings_key UNIQUE ("KEY");


--
-- Name: AO_8752F1_DATA_PIPELINE_CONFIG u_ao_8752f1_data_pi710125765; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_8752F1_DATA_PIPELINE_CONFIG"
    ADD CONSTRAINT u_ao_8752f1_data_pi710125765 UNIQUE ("KEY");


--
-- Name: AO_9412A1_AOUSER u_ao_9412a1_aouser_username; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_AOUSER"
    ADD CONSTRAINT u_ao_9412a1_aouser_username UNIQUE ("USERNAME");


--
-- Name: AO_ED669C_IDP_CONFIG u_ao_ed669c_idp_con1454004950; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_ED669C_IDP_CONFIG"
    ADD CONSTRAINT u_ao_ed669c_idp_con1454004950 UNIQUE ("BUTTON_TEXT");


--
-- Name: AO_ED669C_IDP_CONFIG u_ao_ed669c_idp_config_issuer; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_ED669C_IDP_CONFIG"
    ADD CONSTRAINT u_ao_ed669c_idp_config_issuer UNIQUE ("ISSUER");


--
-- Name: AO_ED669C_IDP_CONFIG u_ao_ed669c_idp_config_name; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_ED669C_IDP_CONFIG"
    ADD CONSTRAINT u_ao_ed669c_idp_config_name UNIQUE ("NAME");


--
-- Name: AO_ED669C_SEEN_ASSERTIONS u_ao_ed669c_seen_as1055534769; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_ED669C_SEEN_ASSERTIONS"
    ADD CONSTRAINT u_ao_ed669c_seen_as1055534769 UNIQUE ("ASSERTION_ID");


--
-- Name: AO_FE1BC5_CLIENT u_ao_fe1bc5_client_1625323162; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_FE1BC5_CLIENT"
    ADD CONSTRAINT u_ao_fe1bc5_client_1625323162 UNIQUE ("CLIENT_SECRET");


--
-- Name: AO_FE1BC5_CLIENT u_ao_fe1bc5_client_client_id; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_FE1BC5_CLIENT"
    ADD CONSTRAINT u_ao_fe1bc5_client_client_id UNIQUE ("CLIENT_ID");


--
-- Name: AO_FE1BC5_CLIENT u_ao_fe1bc5_client_name; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_FE1BC5_CLIENT"
    ADD CONSTRAINT u_ao_fe1bc5_client_name UNIQUE ("NAME");


--
-- Name: plugindata uk_6i3f2odnxreeous9k1baxbc0a; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.plugindata
    ADD CONSTRAINT uk_6i3f2odnxreeous9k1baxbc0a UNIQUE (pluginkey);


--
-- Name: logininfo uk_cxh64nyrevdya903riaky8hs0; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.logininfo
    ADD CONSTRAINT uk_cxh64nyrevdya903riaky8hs0 UNIQUE (username);


--
-- Name: plugindata uk_dg9b9idpgjdj5ljfmnld9lshn; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.plugindata
    ADD CONSTRAINT uk_dg9b9idpgjdj5ljfmnld9lshn UNIQUE (filename);


--
-- Name: cwd_application uk_esg7ywl12bt4wt5h1ka27m6u3; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_application
    ADD CONSTRAINT uk_esg7ywl12bt4wt5h1ka27m6u3 UNIQUE (lower_application_name);


--
-- Name: trustedapp uk_f48dl9nadsqeudry5cyura0du; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.trustedapp
    ADD CONSTRAINT uk_f48dl9nadsqeudry5cyura0du UNIQUE (name);


--
-- Name: scheduler_clustered_jobs uk_h41yn0carypy2jdlo4oapqo7m; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.scheduler_clustered_jobs
    ADD CONSTRAINT uk_h41yn0carypy2jdlo4oapqo7m UNIQUE (job_id);


--
-- Name: spaces uk_jp1ad5yufsih5r7lqrygakpug; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT uk_jp1ad5yufsih5r7lqrygakpug UNIQUE (spacekey);


--
-- Name: trustedapp uk_mqknjsql47jf4ue5kn4sdtbj0; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.trustedapp
    ADD CONSTRAINT uk_mqknjsql47jf4ue5kn4sdtbj0 UNIQUE (public_key_id);


--
-- Name: attachmentdata uk_mxrudo8qrpxb7w28dnoo64aec; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.attachmentdata
    ADD CONSTRAINT uk_mxrudo8qrpxb7w28dnoo64aec UNIQUE (attachmentid);


--
-- Name: cwd_directory uk_ojmqo7ksu5dlpaqs0b9qf0k37; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_directory
    ADD CONSTRAINT uk_ojmqo7ksu5dlpaqs0b9qf0k37 UNIQUE (lower_directory_name);


--
-- Name: confversion uk_osprt1myxoltvtd8yodb0besm; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.confversion
    ADD CONSTRAINT uk_osprt1myxoltvtd8yodb0besm UNIQUE (buildnumber);


--
-- Name: mig_check_result uniq_executionid_checktype; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_check_result
    ADD CONSTRAINT uniq_executionid_checktype UNIQUE (executionid, checktype);


--
-- Name: user_mapping unq_lwr_username; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.user_mapping
    ADD CONSTRAINT unq_lwr_username UNIQUE (lower_username);


--
-- Name: user_mapping user_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.user_mapping
    ADD CONSTRAINT user_mapping_pkey PRIMARY KEY (user_key);


--
-- Name: user_relation user_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT user_relation_pkey PRIMARY KEY (relationid);


--
-- Name: usercontent_relation usercontent_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.usercontent_relation
    ADD CONSTRAINT usercontent_relation_pkey PRIMARY KEY (relationid);


--
-- Name: a_author_key_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX a_author_key_idx ON public.auditrecord USING btree (authorkey);


--
-- Name: a_category_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX a_category_idx ON public.auditrecord USING btree (category);


--
-- Name: a_date_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX a_date_idx ON public.auditrecord USING btree (creationdate);


--
-- Name: a_objects_parent_index; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX a_objects_parent_index ON public.audit_affected_object USING btree (auditrecordid);


--
-- Name: a_values_parent_index; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX a_values_parent_index ON public.audit_changed_value USING btree (auditrecordid);


--
-- Name: al_is_comp_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX al_is_comp_id_idx ON public.diagnostics_alerts USING btree (issue_component_id);


--
-- Name: al_issue_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX al_issue_id_idx ON public.diagnostics_alerts USING btree (issue_id);


--
-- Name: al_issue_severity_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX al_issue_severity_idx ON public.diagnostics_alerts USING btree (issue_severity);


--
-- Name: al_node_name_lower_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX al_node_name_lower_idx ON public.diagnostics_alerts USING btree (node_name_lower);


--
-- Name: al_timetamp_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX al_timetamp_idx ON public.diagnostics_alerts USING btree ("timestamp");


--
-- Name: al_trigger_plug_key_lower_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX al_trigger_plug_key_lower_idx ON public.diagnostics_alerts USING btree (trigger_plugin_key_lower);


--
-- Name: attch_idver_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX attch_idver_idx ON public.attachmentdata USING btree (attversion, attachmentid);


--
-- Name: band_cont_key_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX band_cont_key_idx ON public.bandana USING btree (bandanacontext, bandanakey);


--
-- Name: band_context_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX band_context_idx ON public.bandana USING btree (bandanacontext);


--
-- Name: body_content_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX body_content_idx ON public.bodycontent USING btree (contentid);


--
-- Name: c_ancestorid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_ancestorid_idx ON public.confancestors USING btree (ancestorid);


--
-- Name: c_contentproperties_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_contentproperties_idx ON public.contentproperties USING btree (contentid);


--
-- Name: c_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_creator_idx ON public.content USING btree (creator);


--
-- Name: c_draftpageid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_draftpageid_idx ON public.content USING btree (draftpageid);


--
-- Name: c_drafttype_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_drafttype_idx ON public.content USING btree (drafttype);


--
-- Name: c_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_lastmodifier_idx ON public.content USING btree (lastmodifier);


--
-- Name: c_ltitle_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_ltitle_idx ON public.content USING btree (lowertitle);


--
-- Name: c_pageid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_pageid_idx ON public.content USING btree (pageid);


--
-- Name: c_parentccid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_parentccid_idx ON public.content USING btree (parentccid);


--
-- Name: c_parentcommid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_parentcommid_idx ON public.content USING btree (parentcommentid);


--
-- Name: c_parentid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_parentid_idx ON public.content USING btree (parentid);


--
-- Name: c_prevver_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_prevver_idx ON public.content USING btree (prevver);


--
-- Name: c_si_ct_pv_cs_cd_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_si_ct_pv_cs_cd_idx ON public.content USING btree (spaceid, contenttype, prevver, content_status, creationdate);


--
-- Name: c_spaceid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_spaceid_idx ON public.content USING btree (spaceid);


--
-- Name: c_title_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_title_idx ON public.content USING btree (title);


--
-- Name: c_trustedappid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_trustedappid_idx ON public.trustedapprestriction USING btree (trustedappid);


--
-- Name: c_username_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX c_username_idx ON public.content USING btree (username);


--
-- Name: cl_contentid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cl_contentid_idx ON public.content_label USING btree (contentid);


--
-- Name: cl_labelable_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cl_labelable_idx ON public.content_label USING btree (labelableid, labelabletype);


--
-- Name: cl_labelid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cl_labelid_idx ON public.content_label USING btree (labelid);


--
-- Name: cl_lastmoddate_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cl_lastmoddate_idx ON public.content_label USING btree (lastmoddate);


--
-- Name: cl_owner_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cl_owner_idx ON public.content_label USING btree (owner);


--
-- Name: cl_pagetemplateid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cl_pagetemplateid_idx ON public.content_label USING btree (pagetemplateid);


--
-- Name: cn_followee_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cn_followee_idx ON public.follow_connections USING btree (followee);


--
-- Name: cn_follower_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cn_follower_idx ON public.follow_connections USING btree (follower);


--
-- Name: content_prop_date_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX content_prop_date_idx ON public.contentproperties USING btree (dateval);


--
-- Name: content_prop_long_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX content_prop_long_idx ON public.contentproperties USING btree (longval);


--
-- Name: content_prop_name_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX content_prop_name_idx ON public.contentproperties USING btree (propertyname);


--
-- Name: content_prop_str_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX content_prop_str_idx ON public.contentproperties USING btree (stringval);


--
-- Name: cp_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cp_creator_idx ON public.content_perm USING btree (creator);


--
-- Name: cp_gn_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cp_gn_idx ON public.content_perm USING btree (groupname);


--
-- Name: cp_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cp_lastmodifier_idx ON public.content_perm USING btree (lastmodifier);


--
-- Name: cp_os_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cp_os_idx ON public.content_perm USING btree (cps_id);


--
-- Name: cp_un_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cp_un_idx ON public.content_perm USING btree (username);


--
-- Name: cps_content_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cps_content_idx ON public.content_perm_set USING btree (content_id);


--
-- Name: cps_permtype_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX cps_permtype_idx ON public.content_perm_set USING btree (cont_perm_type);


--
-- Name: create_time_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX create_time_idx ON public.backup_restore_job_details USING btree (create_time);


--
-- Name: dec_key_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX dec_key_idx ON public.decorator USING btree (spacekey);


--
-- Name: dec_name_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX dec_name_idx ON public.decorator USING btree (decoratorname);


--
-- Name: denorm_content_parent_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX denorm_content_parent_id_idx ON public.denormalised_content USING btree (parent_id);


--
-- Name: denorm_content_space_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX denorm_content_space_id_idx ON public.denormalised_content USING btree (space_id);


--
-- Name: denormalised_content_view_permissions_denorm_content_sid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX denormalised_content_view_permissions_denorm_content_sid_idx ON public.denormalised_content_view_permissions USING btree (content_id, sid_id);


--
-- Name: denormalised_sid_name_type_uniq_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE UNIQUE INDEX denormalised_sid_name_type_uniq_idx ON public.denormalised_sid USING btree (name, type);


--
-- Name: denormalised_space_edit_permissions_denorm_space_sid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX denormalised_space_edit_permissions_denorm_space_sid_idx ON public.denormalised_space_edit_permissions USING btree (space_id, sid_id);


--
-- Name: denormalised_space_view_permissions_denorm_space_sid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX denormalised_space_view_permissions_denorm_space_sid_idx ON public.denormalised_space_view_permissions USING btree (space_id, sid_id);


--
-- Name: e_c_i_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX e_c_i_idx ON public."EVENTS" USING btree (contentid, inserted);


--
-- Name: e_h_p_s_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE UNIQUE INDEX e_h_p_s_idx ON public."EVENTS" USING btree (history, partition, sequence);


--
-- Name: e_h_r_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE UNIQUE INDEX e_h_r_idx ON public."EVENTS" USING btree (history, rev);


--
-- Name: e_i_c_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX e_i_c_idx ON public."EVENTS" USING btree (inserted, contentid);


--
-- Name: file_state_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX file_state_idx ON public.backup_restore_job_details USING btree (file_delete_time, file_exists);


--
-- Name: idx_app_active; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_app_active ON public.cwd_application USING btree (active);


--
-- Name: idx_app_dir_app; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_app_dir_app ON public.cwd_app_dir_mapping USING btree (application_id);


--
-- Name: idx_app_dir_dir; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_app_dir_dir ON public.cwd_app_dir_mapping USING btree (directory_id);


--
-- Name: idx_app_dir_group_app; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_app_dir_group_app ON public.cwd_app_dir_group_mapping USING btree (application_id);


--
-- Name: idx_app_dir_group_group_dir; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_app_dir_group_group_dir ON public.cwd_app_dir_group_mapping USING btree (directory_id, group_name);


--
-- Name: idx_app_dir_group_mapping; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_app_dir_group_mapping ON public.cwd_app_dir_group_mapping USING btree (app_dir_mapping_id);


--
-- Name: idx_app_type; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_app_type ON public.cwd_application USING btree (application_type);


--
-- Name: idx_dir_active; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_dir_active ON public.cwd_directory USING btree (active);


--
-- Name: idx_dir_l_impl_class; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_dir_l_impl_class ON public.cwd_directory USING btree (lower_impl_class);


--
-- Name: idx_dir_type; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_dir_type ON public.cwd_directory USING btree (directory_type);


--
-- Name: idx_directory_id; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_directory_id ON public.cwd_synchronisation_status USING btree (directory_id);


--
-- Name: idx_group_active; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_group_active ON public.cwd_group USING btree (active, directory_id);


--
-- Name: idx_group_attr_dir_name_lval; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_group_attr_dir_name_lval ON public.cwd_group_attribute USING btree (directory_id, attribute_name, attribute_lower_value);


--
-- Name: idx_group_attr_group_id; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_group_attr_group_id ON public.cwd_group_attribute USING btree (group_id);


--
-- Name: idx_group_dir_id; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_group_dir_id ON public.cwd_group USING btree (directory_id);


--
-- Name: idx_group_external_id; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_group_external_id ON public.cwd_group USING btree (external_id);


--
-- Name: idx_mem_dir_child; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_mem_dir_child ON public.cwd_membership USING btree (child_group_id, child_user_id);


--
-- Name: idx_mem_dir_child_user; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_mem_dir_child_user ON public.cwd_membership USING btree (child_user_id);


--
-- Name: idx_mem_dir_parent; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_mem_dir_parent ON public.cwd_membership USING btree (parent_id);


--
-- Name: idx_mem_dir_parent_child; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_mem_dir_parent_child ON public.cwd_membership USING btree (parent_id, child_group_id, child_user_id);


--
-- Name: idx_sync_end; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_sync_end ON public.cwd_synchronisation_status USING btree (sync_end);


--
-- Name: idx_sync_status_node_id; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_sync_status_node_id ON public.cwd_synchronisation_status USING btree (node_id);


--
-- Name: idx_tombstone_type_timestamp; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_tombstone_type_timestamp ON public.cwd_tombstone USING btree (tombstone_type, tombstone_timestamp);


--
-- Name: idx_user_active; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_active ON public.cwd_user USING btree (active, directory_id);


--
-- Name: idx_user_attr_dir_name_lval; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_attr_dir_name_lval ON public.cwd_user_attribute USING btree (directory_id, attribute_name, attribute_lower_value);


--
-- Name: idx_user_attr_user_id; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_attr_user_id ON public.cwd_user_attribute USING btree (user_id);


--
-- Name: idx_user_cred_record_user_id; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_cred_record_user_id ON public.cwd_user_credential_record USING btree (user_id);


--
-- Name: idx_user_external_id; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_external_id ON public.cwd_user USING btree (external_id);


--
-- Name: idx_user_lower_display_name; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_lower_display_name ON public.cwd_user USING btree (lower_display_name, directory_id);


--
-- Name: idx_user_lower_email_address; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_lower_email_address ON public.cwd_user USING btree (lower_email_address, directory_id);


--
-- Name: idx_user_lower_first_name; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_lower_first_name ON public.cwd_user USING btree (lower_first_name, directory_id);


--
-- Name: idx_user_lower_last_name; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_lower_last_name ON public.cwd_user USING btree (lower_last_name, directory_id);


--
-- Name: idx_user_lower_user_name; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_lower_user_name ON public.cwd_user USING btree (lower_user_name);


--
-- Name: idx_user_name_dir_id; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX idx_user_name_dir_id ON public.cwd_user USING btree (directory_id);


--
-- Name: index_ao_21f425_mes1965715920; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_21f425_mes1965715920 ON public."AO_21F425_MESSAGE_MAPPING_AO" USING btree ("MESSAGE_ID");


--
-- Name: index_ao_21f425_mes223897723; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_21f425_mes223897723 ON public."AO_21F425_MESSAGE_MAPPING_AO" USING btree ("USER_HASH");


--
-- Name: index_ao_21f425_use1458667739; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_21f425_use1458667739 ON public."AO_21F425_USER_PROPERTY_AO" USING btree ("USER");


--
-- Name: index_ao_32184f_rec1103397526; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_32184f_rec1103397526 ON public."AO_32184F_RECONCILIATIONS" USING btree ("INSERTED");


--
-- Name: index_ao_32184f_rec210212237; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_32184f_rec210212237 ON public."AO_32184F_RECONCILIATIONS" USING btree ("CONTENT_ID");


--
-- Name: index_ao_32184f_syn1707491631; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_32184f_syn1707491631 ON public."AO_32184F_SYNCHRONY_REQUESTS" USING btree ("CONTENT_ID");


--
-- Name: index_ao_32184f_syn38261542; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_32184f_syn38261542 ON public."AO_32184F_SYNCHRONY_REQUESTS" USING btree ("INSERTED");


--
-- Name: index_ao_38321b_cus1828044926; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_38321b_cus1828044926 ON public."AO_38321B_CUSTOM_CONTENT_LINK" USING btree ("CONTENT_KEY");


--
-- Name: index_ao_4789dd_tas42846517; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_4789dd_tas42846517 ON public."AO_4789DD_TASK_MONITOR" USING btree ("TASK_MONITOR_KIND");


--
-- Name: index_ao_54c900_c_t1381246324; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_54c900_c_t1381246324 ON public."AO_54C900_C_TEMPLATE_REF" USING btree ("UUID");


--
-- Name: index_ao_54c900_c_t667820477; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_54c900_c_t667820477 ON public."AO_54C900_C_TEMPLATE_REF" USING btree ("CB_INDEX_PARENTID");


--
-- Name: index_ao_54c900_c_t757546442; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_54c900_c_t757546442 ON public."AO_54C900_C_TEMPLATE_REF" USING btree ("CB_PARENTID");


--
-- Name: index_ao_54c900_c_t852152353; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_54c900_c_t852152353 ON public."AO_54C900_C_TEMPLATE_REF" USING btree ("PARENT_ID");


--
-- Name: index_ao_54c900_spa357134289; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_54c900_spa357134289 ON public."AO_54C900_SPACE_BLUEPRINT_AO" USING btree ("HOME_PAGE_ID");


--
-- Name: index_ao_563aee_act1642652291; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_563aee_act1642652291 ON public."AO_563AEE_ACTIVITY_ENTITY" USING btree ("OBJECT_ID");


--
-- Name: index_ao_563aee_act1978295567; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_563aee_act1978295567 ON public."AO_563AEE_ACTIVITY_ENTITY" USING btree ("TARGET_ID");


--
-- Name: index_ao_563aee_act972488439; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_563aee_act972488439 ON public."AO_563AEE_ACTIVITY_ENTITY" USING btree ("ICON_ID");


--
-- Name: index_ao_563aee_act995325379; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_563aee_act995325379 ON public."AO_563AEE_ACTIVITY_ENTITY" USING btree ("ACTOR_ID");


--
-- Name: index_ao_563aee_obj696886343; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_563aee_obj696886343 ON public."AO_563AEE_OBJECT_ENTITY" USING btree ("IMAGE_ID");


--
-- Name: index_ao_563aee_tar521440921; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_563aee_tar521440921 ON public."AO_563AEE_TARGET_ENTITY" USING btree ("IMAGE_ID");


--
-- Name: index_ao_6384ab_dis59056004; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_6384ab_dis59056004 ON public."AO_6384AB_DISCOVERED" USING btree ("USER_KEY");


--
-- Name: index_ao_6384ab_fea1458039816; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_6384ab_fea1458039816 ON public."AO_6384AB_FEATURE_METADATA_AO" USING btree ("CONTEXT", "KEY");


--
-- Name: index_ao_7b47a5_eve1148682696; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_7b47a5_eve1148682696 ON public."AO_7B47A5_EVENT" USING btree ("NAME", "CONTAINER_ID", "EVENT_AT");


--
-- Name: index_ao_7b47a5_eve1927422530; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_7b47a5_eve1927422530 ON public."AO_7B47A5_EVENT" USING btree ("EVENT_AT", "ID");


--
-- Name: index_ao_7b47a5_eve2068276537; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_7b47a5_eve2068276537 ON public."AO_7B47A5_EVENT" USING btree ("NAME", "SPACE_KEY", "EVENT_AT");


--
-- Name: index_ao_7b47a5_eve731223880; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_7b47a5_eve731223880 ON public."AO_7B47A5_EVENT" USING btree ("SPACE_KEY");


--
-- Name: index_ao_7cde43_eve1433596955; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_7cde43_eve1433596955 ON public."AO_7CDE43_EVENT" USING btree ("NOTIFICATION_ID");


--
-- Name: index_ao_7cde43_fil1140550715; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_7cde43_fil1140550715 ON public."AO_7CDE43_FILTER_PARAM" USING btree ("NOTIFICATION_ID");


--
-- Name: index_ao_7cde43_not7362182; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_7cde43_not7362182 ON public."AO_7CDE43_NOTIFICATION" USING btree ("NOTIFICATION_SCHEME_ID");


--
-- Name: index_ao_7cde43_rec1271577318; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_7cde43_rec1271577318 ON public."AO_7CDE43_RECIPIENT" USING btree ("NOTIFICATION_ID");


--
-- Name: index_ao_7cde43_ser828034299; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_7cde43_ser828034299 ON public."AO_7CDE43_SERVER_PARAM" USING btree ("SERVER_CONFIG_ID");


--
-- Name: index_ao_81f455_per1449732247; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_81f455_per1449732247 ON public."AO_81F455_PERSONAL_TOKEN" USING btree ("TOKEN_ID", "EXPIRING_AT");


--
-- Name: index_ao_8752f1_dat1803576496; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_8752f1_dat1803576496 ON public."AO_8752F1_DATA_PIPELINE_JOB" USING btree ("STATUS");


--
-- Name: index_ao_92296b_aor1216492770; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_92296b_aor1216492770 ON public."AO_92296B_AORECENTLY_VIEWED" USING btree ("CONTENT_ID");


--
-- Name: index_ao_92296b_aor1615591099; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_92296b_aor1615591099 ON public."AO_92296B_AORECENTLY_VIEWED" USING btree ("SPACE_KEY");


--
-- Name: index_ao_92296b_aor205355936; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_92296b_aor205355936 ON public."AO_92296B_AORECENTLY_VIEWED" USING btree ("LAST_VIEW_DATE");


--
-- Name: index_ao_92296b_aor426054036; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_92296b_aor426054036 ON public."AO_92296B_AORECENTLY_VIEWED" USING btree ("USER_KEY");


--
-- Name: index_ao_92296b_aor818798913; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_92296b_aor818798913 ON public."AO_92296B_AORECENTLY_VIEWED" USING btree ("CONTENT_TYPE");


--
-- Name: index_ao_9412a1_aon1547032463; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_9412a1_aon1547032463 ON public."AO_9412A1_AONOTIFICATION" USING btree ("CREATED");


--
-- Name: index_ao_9412a1_aon648423710; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_9412a1_aon648423710 ON public."AO_9412A1_AONOTIFICATION" USING btree ("USER");


--
-- Name: index_ao_9412a1_aon849931648; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_9412a1_aon849931648 ON public."AO_9412A1_AONOTIFICATION" USING btree ("GLOBAL_ID");


--
-- Name: index_ao_9412a1_aot1465568358; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_9412a1_aot1465568358 ON public."AO_9412A1_AOTASK" USING btree ("GLOBAL_ID");


--
-- Name: index_ao_9412a1_aotask_user; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_9412a1_aotask_user ON public."AO_9412A1_AOTASK" USING btree ("USER");


--
-- Name: index_ao_9412a1_use1222319987; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_9412a1_use1222319987 ON public."AO_9412A1_USER_APP_LINK" USING btree ("USER_ID");


--
-- Name: index_ao_9412a1_use643533071; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_9412a1_use643533071 ON public."AO_9412A1_USER_APP_LINK" USING btree ("APPLICATION_LINK_ID");


--
-- Name: index_ao_950dc3_tc_100715625; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_100715625 ON public."AO_950DC3_TC_EVENTS_INVITEES" USING btree ("EVENT_ID");


--
-- Name: index_ao_950dc3_tc_1063578969; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1063578969 ON public."AO_950DC3_TC_SUBCALS_IN_SPACE" USING btree ("SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_122365134; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_122365134 ON public."AO_950DC3_TC_REMINDER_USERS" USING btree ("SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_1286773626; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1286773626 ON public."AO_950DC3_TC_EVENTS" USING btree ("REMINDER_SETTING_ID");


--
-- Name: index_ao_950dc3_tc_1297323317; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1297323317 ON public."AO_950DC3_TC_JIRA_REMI_EVENTS" USING btree ("SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_1329118146; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1329118146 ON public."AO_950DC3_TC_SUBCALS_IN_SPACE" USING btree ("SPACE_KEY");


--
-- Name: index_ao_950dc3_tc_1437233256; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1437233256 ON public."AO_950DC3_TC_CUSTOM_EV_TYPES" USING btree ("BELONG_SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_1526147574; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1526147574 ON public."AO_950DC3_TC_EVENTS" USING btree ("UTC_START");


--
-- Name: index_ao_950dc3_tc_1566630573; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1566630573 ON public."AO_950DC3_TC_JIRA_REMI_EVENTS" USING btree ("KEY_ID");


--
-- Name: index_ao_950dc3_tc_1684546011; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1684546011 ON public."AO_950DC3_TC_REMINDER_SETTINGS" USING btree ("PERIOD");


--
-- Name: index_ao_950dc3_tc_1709841361; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1709841361 ON public."AO_950DC3_TC_EVENTS" USING btree ("START");


--
-- Name: index_ao_950dc3_tc_1806144629; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1806144629 ON public."AO_950DC3_TC_DISABLE_EV_TYPES" USING btree ("SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_1847876863; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1847876863 ON public."AO_950DC3_TC_SUBCALS_PROPS" USING btree ("KEY");


--
-- Name: index_ao_950dc3_tc_1861854175; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1861854175 ON public."AO_950DC3_TC_SUBCALS_PROPS" USING btree ("SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_1886631335; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1886631335 ON public."AO_950DC3_TC_REMINDER_SETTINGS" USING btree ("SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_1891203755; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1891203755 ON public."AO_950DC3_TC_SUBCALS_PRIV_GRP" USING btree ("TYPE");


--
-- Name: index_ao_950dc3_tc_1977525806; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1977525806 ON public."AO_950DC3_TC_EVENTS_EXCL" USING btree ("EVENT_ID");


--
-- Name: index_ao_950dc3_tc_1978066438; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_1978066438 ON public."AO_950DC3_TC_SUBCALS_PRIV_USR" USING btree ("TYPE");


--
-- Name: index_ao_950dc3_tc_2015126094; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_2015126094 ON public."AO_950DC3_TC_JIRA_REMI_EVENTS" USING btree ("UTC_END");


--
-- Name: index_ao_950dc3_tc_2073603249; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_2073603249 ON public."AO_950DC3_TC_REMINDER_SETTINGS" USING btree ("CUSTOM_EVENT_TYPE_ID");


--
-- Name: index_ao_950dc3_tc_2091184233; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_2091184233 ON public."AO_950DC3_TC_SUBCALS" USING btree ("SPACE_KEY");


--
-- Name: index_ao_950dc3_tc_363043564; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_363043564 ON public."AO_950DC3_TC_EVENTS" USING btree ("SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_38648977; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_38648977 ON public."AO_950DC3_TC_EVENTS" USING btree ("UTC_END");


--
-- Name: index_ao_950dc3_tc_480965355; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_480965355 ON public."AO_950DC3_TC_JIRA_REMI_EVENTS" USING btree ("UTC_START");


--
-- Name: index_ao_950dc3_tc_525483330; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_525483330 ON public."AO_950DC3_TC_SUBCALS_PRIV_GRP" USING btree ("SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_554676722; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_554676722 ON public."AO_950DC3_TC_SUBCALS" USING btree ("STORE_KEY");


--
-- Name: index_ao_950dc3_tc_786531555; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_786531555 ON public."AO_950DC3_TC_REMINDER_SETTINGS" USING btree ("STORE_KEY");


--
-- Name: index_ao_950dc3_tc_836865362; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_836865362 ON public."AO_950DC3_TC_SUBCALS" USING btree ("SUBSCRIPTION_ID");


--
-- Name: index_ao_950dc3_tc_851944294; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_851944294 ON public."AO_950DC3_TC_EVENTS" USING btree ("VEVENT_UID");


--
-- Name: index_ao_950dc3_tc_932705473; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_932705473 ON public."AO_950DC3_TC_SUBCALS" USING btree ("PARENT_ID");


--
-- Name: index_ao_950dc3_tc_997641231; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_997641231 ON public."AO_950DC3_TC_SUBCALS_PRIV_USR" USING btree ("SUB_CALENDAR_ID");


--
-- Name: index_ao_950dc3_tc_events_end; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_950dc3_tc_events_end ON public."AO_950DC3_TC_EVENTS" USING btree ("END");


--
-- Name: index_ao_954a21_pus160381072; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_954a21_pus160381072 ON public."AO_954A21_PUSH_NOTIFICATION_AO" USING btree ("USER_NAME");


--
-- Name: index_ao_954a21_pus1665669807; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_954a21_pus1665669807 ON public."AO_954A21_PUSH_NOTIFICATION_AO" USING btree ("STATUS_UPDATED_TIME");


--
-- Name: index_ao_a0b856_web1050270930; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_a0b856_web1050270930 ON public."AO_A0B856_WEBHOOK_CONFIG" USING btree ("WEBHOOKID");


--
-- Name: index_ao_a0b856_web110787824; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_a0b856_web110787824 ON public."AO_A0B856_WEBHOOK_EVENT" USING btree ("WEBHOOKID");


--
-- Name: index_ao_ac3877_rl_1696242418; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_ac3877_rl_1696242418 ON public."AO_AC3877_RL_USER_COUNTER" USING btree ("INTERVAL_START");


--
-- Name: index_ao_ac3877_rl_2023752663; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_ac3877_rl_2023752663 ON public."AO_AC3877_RL_USER_COUNTER" USING btree ("USER_ID");


--
-- Name: index_ao_baf3aa_aoi1066945234; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_baf3aa_aoi1066945234 ON public."AO_BAF3AA_AOINLINE_TASK" USING btree ("CONTENT_ID");


--
-- Name: index_ao_baf3aa_aoi1143751131; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_baf3aa_aoi1143751131 ON public."AO_BAF3AA_AOINLINE_TASK" USING btree ("TASK_STATUS");


--
-- Name: index_ao_baf3aa_aoi1389674752; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_baf3aa_aoi1389674752 ON public."AO_BAF3AA_AOINLINE_TASK" USING btree ("CREATE_DATE");


--
-- Name: index_ao_baf3aa_aoi1395974671; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_baf3aa_aoi1395974671 ON public."AO_BAF3AA_AOINLINE_TASK" USING btree ("CREATOR_USER_KEY");


--
-- Name: index_ao_baf3aa_aoi1978441610; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_baf3aa_aoi1978441610 ON public."AO_BAF3AA_AOINLINE_TASK" USING btree ("DUE_DATE");


--
-- Name: index_ao_baf3aa_aoi866493194; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_baf3aa_aoi866493194 ON public."AO_BAF3AA_AOINLINE_TASK" USING btree ("ASSIGNEE_USER_KEY");


--
-- Name: index_ao_c77861_aud1143993171; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud1143993171 ON public."AO_C77861_AUDIT_CATEGORY_CACHE" USING btree ("CATEGORY");


--
-- Name: index_ao_c77861_aud148201205; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud148201205 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("CATEGORY");


--
-- Name: index_ao_c77861_aud1486016429; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud1486016429 ON public."AO_C77861_AUDIT_ACTION_CACHE" USING btree ("ACTION");


--
-- Name: index_ao_c77861_aud1490488814; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud1490488814 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("USER_ID", "ENTITY_TIMESTAMP");


--
-- Name: index_ao_c77861_aud1896469708; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud1896469708 ON public."AO_C77861_AUDIT_ACTION_CACHE" USING btree ("ACTION_T_KEY");


--
-- Name: index_ao_c77861_aud2071685161; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud2071685161 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("ENTITY_TIMESTAMP", "ID");


--
-- Name: index_ao_c77861_aud237541374; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud237541374 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("PRIMARY_RESOURCE_ID", "PRIMARY_RESOURCE_TYPE", "ENTITY_TIMESTAMP");


--
-- Name: index_ao_c77861_aud265617021; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud265617021 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("ACTION");


--
-- Name: index_ao_c77861_aud470300084; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud470300084 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("SECONDARY_RESOURCE_ID", "SECONDARY_RESOURCE_TYPE", "ENTITY_TIMESTAMP");


--
-- Name: index_ao_c77861_aud477310041; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud477310041 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("RESOURCE_ID_3", "RESOURCE_TYPE_3", "ENTITY_TIMESTAMP");


--
-- Name: index_ao_c77861_aud617238068; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud617238068 ON public."AO_C77861_AUDIT_CATEGORY_CACHE" USING btree ("CATEGORY_T_KEY");


--
-- Name: index_ao_c77861_aud737336300; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud737336300 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("RESOURCE_ID_4", "RESOURCE_TYPE_4", "ENTITY_TIMESTAMP");


--
-- Name: index_ao_c77861_aud76822836; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud76822836 ON public."AO_C77861_AUDIT_DENY_LISTED" USING btree ("ACTION");


--
-- Name: index_ao_c77861_aud96775159; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_c77861_aud96775159 ON public."AO_C77861_AUDIT_ENTITY" USING btree ("RESOURCE_ID_5", "RESOURCE_TYPE_5", "ENTITY_TIMESTAMP");


--
-- Name: index_ao_dc98ae_aoh1533992358; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_dc98ae_aoh1533992358 ON public."AO_DC98AE_AOHELP_TIP" USING btree ("USER_KEY");


--
-- Name: index_ao_dc98ae_aoh411805038; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_dc98ae_aoh411805038 ON public."AO_DC98AE_AOHELP_TIP" USING btree ("DISMISSED_HELP_TIP");


--
-- Name: index_ao_ed669c_see20117222; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX index_ao_ed669c_see20117222 ON public."AO_ED669C_SEEN_ASSERTIONS" USING btree ("EXPIRY_TIMESTAMP");


--
-- Name: j_creationdate_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX j_creationdate_idx ON public.journalentry USING btree (creationdate);


--
-- Name: j_j_name_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX j_j_name_idx ON public.journalentry USING btree (journal_name);


--
-- Name: job_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX job_id_idx ON public.scheduler_run_details USING btree (job_id);


--
-- Name: job_id_start_time_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX job_id_start_time_idx ON public.scheduler_run_details USING btree (job_id, start_time);


--
-- Name: job_last_touch_time_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX job_last_touch_time_idx ON public.background_job_archived USING btree (completion_time);


--
-- Name: job_run_at_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX job_run_at_idx ON public.background_job USING btree (run_at);


--
-- Name: job_runner_key_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX job_runner_key_idx ON public.scheduler_clustered_jobs USING btree (job_runner_key);


--
-- Name: l_contentid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX l_contentid_idx ON public.links USING btree (contentid);


--
-- Name: l_destpgtitle_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX l_destpgtitle_idx ON public.links USING btree (destpagetitle);


--
-- Name: l_destspacekey_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX l_destspacekey_idx ON public.links USING btree (destspacekey);


--
-- Name: l_ldestpgtitle_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX l_ldestpgtitle_idx ON public.links USING btree (lowerdestpagetitle);


--
-- Name: l_ldestspacekey_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX l_ldestspacekey_idx ON public.links USING btree (lowerdestspacekey);


--
-- Name: l_name_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX l_name_idx ON public.label USING btree (name);


--
-- Name: l_namespace_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX l_namespace_idx ON public.label USING btree (namespace);


--
-- Name: l_owner_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX l_owner_idx ON public.label USING btree (owner);


--
-- Name: like_cdate_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX like_cdate_idx ON public.likes USING btree (creationdate);


--
-- Name: like_cid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX like_cid_idx ON public.likes USING btree (contentid);


--
-- Name: like_username_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX like_username_idx ON public.likes USING btree (username);


--
-- Name: links_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX links_creator_idx ON public.links USING btree (creator);


--
-- Name: links_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX links_lastmodifier_idx ON public.links USING btree (lastmodifier);


--
-- Name: mig_attachment_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_attachment_id_idx ON public.mig_attachment USING btree (attachmentid);


--
-- Name: mig_plan_status_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_plan_status_idx ON public.mig_plan USING btree (executionstatus);


--
-- Name: mig_scan_type_name_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_scan_type_name_idx ON public.mig_incorrect_email USING btree (scanid, checktype, username);


--
-- Name: mig_space_statistic_attachmentcount_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_space_statistic_attachmentcount_idx ON public.mig_space_statistic USING btree (attachmentcount);


--
-- Name: mig_space_statistic_attachmentsize_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_space_statistic_attachmentsize_idx ON public.mig_space_statistic USING btree (attachmentsize);


--
-- Name: mig_space_statistic_estimatedmigrationtime_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_space_statistic_estimatedmigrationtime_idx ON public.mig_space_statistic USING btree (estimatedmigrationtime);


--
-- Name: mig_space_statistic_lastupdated_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_space_statistic_lastupdated_idx ON public.mig_space_statistic USING btree (lastupdated);


--
-- Name: mig_space_statistic_sumofpageblogdraftcount_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_space_statistic_sumofpageblogdraftcount_idx ON public.mig_space_statistic USING btree (sumofpageblogdraftcount);


--
-- Name: mig_spaces_cloud_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_spaces_cloud_idx ON public.mig_spaces USING btree (spaceid, cloud);


--
-- Name: mig_step_plan_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_step_plan_idx ON public.mig_step USING btree (planid);


--
-- Name: mig_step_plan_status_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_step_plan_status_idx ON public.mig_step USING btree (planid, executionstatus);


--
-- Name: mig_step_task_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_step_task_id_idx ON public.mig_step USING btree (taskid);


--
-- Name: mig_step_task_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_step_task_idx ON public.mig_step USING btree (taskid, stepindex);


--
-- Name: mig_step_type_plan_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_step_type_plan_id_idx ON public.mig_step USING btree (planid, steptype);


--
-- Name: mig_task_plan_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_task_plan_id_idx ON public.mig_task USING btree (planid);


--
-- Name: mig_task_plan_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_task_plan_idx ON public.mig_task USING btree (planid, taskindex);


--
-- Name: mig_tombstone_account_userkey_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_tombstone_account_userkey_idx ON public.mig_tombstone_account USING btree (userkey);


--
-- Name: mig_work_item_type_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX mig_work_item_type_idx ON public.mig_work_item USING btree (itemtype);


--
-- Name: n_contentid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX n_contentid_idx ON public.notifications USING btree (contentid);


--
-- Name: n_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX n_creator_idx ON public.notifications USING btree (creator);


--
-- Name: n_labelid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX n_labelid_idx ON public.notifications USING btree (labelid);


--
-- Name: n_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX n_lastmodifier_idx ON public.notifications USING btree (lastmodifier);


--
-- Name: n_spaceid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX n_spaceid_idx ON public.notifications USING btree (spaceid);


--
-- Name: n_username_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX n_username_idx ON public.notifications USING btree (username);


--
-- Name: next_run_time_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX next_run_time_idx ON public.scheduler_clustered_jobs USING btree (next_run_time);


--
-- Name: ospe_entityid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX ospe_entityid_idx ON public.os_propertyentry USING btree (entity_id);


--
-- Name: owner_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX owner_idx ON public.backup_restore_job_details USING btree (owner);


--
-- Name: pt_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX pt_creator_idx ON public.pagetemplates USING btree (creator);


--
-- Name: pt_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX pt_lastmodifier_idx ON public.pagetemplates USING btree (lastmodifier);


--
-- Name: pt_prevver_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX pt_prevver_idx ON public.pagetemplates USING btree (prevver);


--
-- Name: pt_spaceid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX pt_spaceid_idx ON public.pagetemplates USING btree (spaceid);


--
-- Name: r_c2c_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX r_c2c_creator_idx ON public.content_relation USING btree (creator);


--
-- Name: r_c2c_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX r_c2c_lastmodifier_idx ON public.content_relation USING btree (lastmodifier);


--
-- Name: r_u2c_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX r_u2c_creator_idx ON public.usercontent_relation USING btree (creator);


--
-- Name: r_u2c_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX r_u2c_lastmodifier_idx ON public.usercontent_relation USING btree (lastmodifier);


--
-- Name: r_u2u_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX r_u2u_creator_idx ON public.user_relation USING btree (creator);


--
-- Name: r_u2u_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX r_u2u_lastmodifier_idx ON public.user_relation USING btree (lastmodifier);


--
-- Name: relation_c2c_cdate_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_c2c_cdate_idx ON public.content_relation USING btree (creationdate);


--
-- Name: relation_c2c_relationname_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_c2c_relationname_idx ON public.content_relation USING btree (relationname);


--
-- Name: relation_c2c_sourcecontent_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_c2c_sourcecontent_idx ON public.content_relation USING btree (sourcecontentid);


--
-- Name: relation_c2c_sourcetype_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_c2c_sourcetype_idx ON public.content_relation USING btree (sourcetype);


--
-- Name: relation_c2c_targetcontent_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_c2c_targetcontent_idx ON public.content_relation USING btree (targetcontentid);


--
-- Name: relation_c2c_targettype_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_c2c_targettype_idx ON public.content_relation USING btree (targettype);


--
-- Name: relation_u2c_cdate_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_u2c_cdate_idx ON public.usercontent_relation USING btree (creationdate);


--
-- Name: relation_u2c_relationname_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_u2c_relationname_idx ON public.usercontent_relation USING btree (relationname);


--
-- Name: relation_u2c_sourceuser_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_u2c_sourceuser_idx ON public.usercontent_relation USING btree (sourceuser);


--
-- Name: relation_u2c_targetcontent_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_u2c_targetcontent_idx ON public.usercontent_relation USING btree (targetcontentid);


--
-- Name: relation_u2c_targettype_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_u2c_targettype_idx ON public.usercontent_relation USING btree (targettype);


--
-- Name: relation_u2u_cdate_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_u2u_cdate_idx ON public.user_relation USING btree (creationdate);


--
-- Name: relation_u2u_relationname_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_u2u_relationname_idx ON public.user_relation USING btree (relationname);


--
-- Name: relation_u2u_sourceuser_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_u2u_sourceuser_idx ON public.user_relation USING btree (sourceuser);


--
-- Name: relation_u2u_targetuser_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX relation_u2u_targetuser_idx ON public.user_relation USING btree (targetuser);


--
-- Name: rmt_username_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX rmt_username_idx ON public.remembermetoken USING btree (username);


--
-- Name: s_c_i_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX s_c_i_idx ON public."SNAPSHOTS" USING btree (contentid, inserted);


--
-- Name: s_creationdate_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX s_creationdate_idx ON public.spaces USING btree (creationdate);


--
-- Name: s_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX s_creator_idx ON public.spaces USING btree (creator);


--
-- Name: s_homepage_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX s_homepage_idx ON public.spaces USING btree (homepage);


--
-- Name: s_i_c_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX s_i_c_idx ON public."SNAPSHOTS" USING btree (inserted, contentid);


--
-- Name: s_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX s_lastmodifier_idx ON public.spaces USING btree (lastmodifier);


--
-- Name: s_lspacekey_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX s_lspacekey_idx ON public.spaces USING btree (lowerspacekey);


--
-- Name: s_spacedescid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX s_spacedescid_idx ON public.spaces USING btree (spacedescid);


--
-- Name: s_spacestatus_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX s_spacestatus_idx ON public.spaces USING btree (spacestatus);


--
-- Name: single_space_key_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX single_space_key_idx ON public.backup_restore_job_details USING btree (single_space_key);


--
-- Name: sp_comp_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX sp_comp_idx ON public.spacepermissions USING btree (permtype, permgroupname);


--
-- Name: sp_creator_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX sp_creator_idx ON public.spacepermissions USING btree (creator);


--
-- Name: sp_lastmodifier_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX sp_lastmodifier_idx ON public.spacepermissions USING btree (lastmodifier);


--
-- Name: sp_permtype_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX sp_permtype_idx ON public.spacepermissions USING btree (permtype);


--
-- Name: sp_pgname_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX sp_pgname_idx ON public.spacepermissions USING btree (permgroupname);


--
-- Name: sp_puname_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX sp_puname_idx ON public.spacepermissions USING btree (permusername);


--
-- Name: sp_spaceid_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX sp_spaceid_idx ON public.spacepermissions USING btree (spaceid);


--
-- Name: space_id_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX space_id_idx ON public.denormalised_space_change_log USING btree (space_id);


--
-- Name: start_time_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX start_time_idx ON public.scheduler_run_details USING btree (start_time);


--
-- Name: start_time_outcome_idx; Type: INDEX; Schema: public; Owner: confluence
--

CREATE INDEX start_time_outcome_idx ON public.scheduler_run_details USING btree (start_time, outcome);


--
-- Name: content_perm_set denormalised_content_perm_set_trigger_on_delete; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_content_perm_set_trigger_on_delete AFTER DELETE ON public.content_perm_set FOR EACH ROW EXECUTE FUNCTION public.content_perm_set_function_for_denormalised_permissions();


--
-- Name: content_perm denormalised_content_permission_trigger_on_delete; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_content_permission_trigger_on_delete AFTER DELETE ON public.content_perm FOR EACH ROW EXECUTE FUNCTION public.content_permission_function_for_denormalised_permissions();


--
-- Name: content_perm denormalised_content_permission_trigger_on_insert; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_content_permission_trigger_on_insert AFTER INSERT ON public.content_perm FOR EACH ROW EXECUTE FUNCTION public.content_permission_function_for_denormalised_permissions();


--
-- Name: content_perm denormalised_content_permission_trigger_on_update; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_content_permission_trigger_on_update AFTER UPDATE ON public.content_perm FOR EACH ROW EXECUTE FUNCTION public.content_permission_function_for_denormalised_permissions();


--
-- Name: content denormalised_content_trigger_on_delete; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_content_trigger_on_delete AFTER DELETE ON public.content FOR EACH ROW EXECUTE FUNCTION public.content_function_for_denormalised_permissions();


--
-- Name: content denormalised_content_trigger_on_insert; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_content_trigger_on_insert AFTER INSERT ON public.content FOR EACH ROW EXECUTE FUNCTION public.content_function_for_denormalised_permissions();


--
-- Name: content denormalised_content_trigger_on_update; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_content_trigger_on_update AFTER UPDATE ON public.content FOR EACH ROW EXECUTE FUNCTION public.content_function_for_denormalised_permissions();


--
-- Name: spacepermissions denormalised_space_permission_trigger_on_delete; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_space_permission_trigger_on_delete AFTER DELETE ON public.spacepermissions FOR EACH ROW EXECUTE FUNCTION public.space_permission_function_for_denormalised_permissions();


--
-- Name: spacepermissions denormalised_space_permission_trigger_on_insert; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_space_permission_trigger_on_insert AFTER INSERT ON public.spacepermissions FOR EACH ROW EXECUTE FUNCTION public.space_permission_function_for_denormalised_permissions();


--
-- Name: spacepermissions denormalised_space_permission_trigger_on_update; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_space_permission_trigger_on_update AFTER UPDATE ON public.spacepermissions FOR EACH ROW EXECUTE FUNCTION public.space_permission_function_for_denormalised_permissions();


--
-- Name: spaces denormalised_space_trigger_on_delete; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_space_trigger_on_delete AFTER DELETE ON public.spaces FOR EACH ROW EXECUTE FUNCTION public.space_function_for_denormalised_permissions();


--
-- Name: spaces denormalised_space_trigger_on_insert; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_space_trigger_on_insert AFTER INSERT ON public.spaces FOR EACH ROW EXECUTE FUNCTION public.space_function_for_denormalised_permissions();


--
-- Name: spaces denormalised_space_trigger_on_update; Type: TRIGGER; Schema: public; Owner: confluence
--

CREATE TRIGGER denormalised_space_trigger_on_update AFTER UPDATE ON public.spaces FOR EACH ROW EXECUTE FUNCTION public.space_function_for_denormalised_permissions();


--
-- Name: pagetemplates fk18a1d37pvq2o9hu5x3tps97mx; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.pagetemplates
    ADD CONSTRAINT fk18a1d37pvq2o9hu5x3tps97mx FOREIGN KEY (spaceid) REFERENCES public.spaces(spaceid);


--
-- Name: imagedetails fk2301qiciuq6sc32jaj8tysg3s; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.imagedetails
    ADD CONSTRAINT fk2301qiciuq6sc32jaj8tysg3s FOREIGN KEY (attachmentid) REFERENCES public.content(contentid);


--
-- Name: content_label fk28kifokt21qd9ges0q0wv0fb9; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_label
    ADD CONSTRAINT fk28kifokt21qd9ges0q0wv0fb9 FOREIGN KEY (pagetemplateid) REFERENCES public.pagetemplates(templateid);


--
-- Name: content_perm_set fk2buunk1hor0i3k0m3nt03hw1w; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm_set
    ADD CONSTRAINT fk2buunk1hor0i3k0m3nt03hw1w FOREIGN KEY (content_id) REFERENCES public.content(contentid);


--
-- Name: cwd_user_credential_record fk2rfdh2ap00b8mholdsy1b785b; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_user_credential_record
    ADD CONSTRAINT fk2rfdh2ap00b8mholdsy1b785b FOREIGN KEY (user_id) REFERENCES public.cwd_user(id);


--
-- Name: contentproperties fk3fly21xfk13rqh63txw2t6k2v; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.contentproperties
    ADD CONSTRAINT fk3fly21xfk13rqh63txw2t6k2v FOREIGN KEY (contentid) REFERENCES public.content(contentid);


--
-- Name: notifications fk4tccrjamrjvmd2aogl3hklpfj; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk4tccrjamrjvmd2aogl3hklpfj FOREIGN KEY (labelid) REFERENCES public.label(labelid);


--
-- Name: pagetemplates fk4wgwy1dqci8rcwad4tnqbglt8; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.pagetemplates
    ADD CONSTRAINT fk4wgwy1dqci8rcwad4tnqbglt8 FOREIGN KEY (prevver) REFERENCES public.pagetemplates(templateid);


--
-- Name: spaces fk7ndewmrl3hqcpwc8eydn9mv8j; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT fk7ndewmrl3hqcpwc8eydn9mv8j FOREIGN KEY (spacedescid) REFERENCES public.content(contentid);


--
-- Name: content_label fk91v3v5nemr532qq4gla9sj9tf; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_label
    ADD CONSTRAINT fk91v3v5nemr532qq4gla9sj9tf FOREIGN KEY (labelid) REFERENCES public.label(labelid);


--
-- Name: audit_affected_object fk_affected_object_record; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.audit_affected_object
    ADD CONSTRAINT fk_affected_object_record FOREIGN KEY (auditrecordid) REFERENCES public.auditrecord(auditrecordid);


--
-- Name: AO_54C900_C_TEMPLATE_REF fk_ao_54c900_c_template_ref_cb_index_parentid; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_C_TEMPLATE_REF"
    ADD CONSTRAINT fk_ao_54c900_c_template_ref_cb_index_parentid FOREIGN KEY ("CB_INDEX_PARENTID") REFERENCES public."AO_54C900_CONTENT_BLUEPRINT_AO"("ID");


--
-- Name: AO_54C900_C_TEMPLATE_REF fk_ao_54c900_c_template_ref_cb_parentid; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_C_TEMPLATE_REF"
    ADD CONSTRAINT fk_ao_54c900_c_template_ref_cb_parentid FOREIGN KEY ("CB_PARENTID") REFERENCES public."AO_54C900_CONTENT_BLUEPRINT_AO"("ID");


--
-- Name: AO_54C900_C_TEMPLATE_REF fk_ao_54c900_c_template_ref_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_C_TEMPLATE_REF"
    ADD CONSTRAINT fk_ao_54c900_c_template_ref_parent_id FOREIGN KEY ("PARENT_ID") REFERENCES public."AO_54C900_C_TEMPLATE_REF"("ID");


--
-- Name: AO_54C900_SPACE_BLUEPRINT_AO fk_ao_54c900_space_blueprint_ao_home_page_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_54C900_SPACE_BLUEPRINT_AO"
    ADD CONSTRAINT fk_ao_54c900_space_blueprint_ao_home_page_id FOREIGN KEY ("HOME_PAGE_ID") REFERENCES public."AO_54C900_C_TEMPLATE_REF"("ID");


--
-- Name: AO_563AEE_ACTIVITY_ENTITY fk_ao_563aee_activity_entity_actor_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_activity_entity_actor_id FOREIGN KEY ("ACTOR_ID") REFERENCES public."AO_563AEE_ACTOR_ENTITY"("ID");


--
-- Name: AO_563AEE_ACTIVITY_ENTITY fk_ao_563aee_activity_entity_icon_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_activity_entity_icon_id FOREIGN KEY ("ICON_ID") REFERENCES public."AO_563AEE_MEDIA_LINK_ENTITY"("ID");


--
-- Name: AO_563AEE_ACTIVITY_ENTITY fk_ao_563aee_activity_entity_object_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_activity_entity_object_id FOREIGN KEY ("OBJECT_ID") REFERENCES public."AO_563AEE_OBJECT_ENTITY"("ID");


--
-- Name: AO_563AEE_ACTIVITY_ENTITY fk_ao_563aee_activity_entity_target_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_ACTIVITY_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_activity_entity_target_id FOREIGN KEY ("TARGET_ID") REFERENCES public."AO_563AEE_TARGET_ENTITY"("ID");


--
-- Name: AO_563AEE_OBJECT_ENTITY fk_ao_563aee_object_entity_image_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_OBJECT_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_object_entity_image_id FOREIGN KEY ("IMAGE_ID") REFERENCES public."AO_563AEE_MEDIA_LINK_ENTITY"("ID");


--
-- Name: AO_563AEE_TARGET_ENTITY fk_ao_563aee_target_entity_image_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_563AEE_TARGET_ENTITY"
    ADD CONSTRAINT fk_ao_563aee_target_entity_image_id FOREIGN KEY ("IMAGE_ID") REFERENCES public."AO_563AEE_MEDIA_LINK_ENTITY"("ID");


--
-- Name: AO_7CDE43_EVENT fk_ao_7cde43_event_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_EVENT"
    ADD CONSTRAINT fk_ao_7cde43_event_notification_id FOREIGN KEY ("NOTIFICATION_ID") REFERENCES public."AO_7CDE43_NOTIFICATION"("ID");


--
-- Name: AO_7CDE43_FILTER_PARAM fk_ao_7cde43_filter_param_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_FILTER_PARAM"
    ADD CONSTRAINT fk_ao_7cde43_filter_param_notification_id FOREIGN KEY ("NOTIFICATION_ID") REFERENCES public."AO_7CDE43_NOTIFICATION"("ID");


--
-- Name: AO_7CDE43_NOTIFICATION fk_ao_7cde43_notification_notification_scheme_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_NOTIFICATION"
    ADD CONSTRAINT fk_ao_7cde43_notification_notification_scheme_id FOREIGN KEY ("NOTIFICATION_SCHEME_ID") REFERENCES public."AO_7CDE43_NOTIFICATION_SCHEME"("ID");


--
-- Name: AO_7CDE43_RECIPIENT fk_ao_7cde43_recipient_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_RECIPIENT"
    ADD CONSTRAINT fk_ao_7cde43_recipient_notification_id FOREIGN KEY ("NOTIFICATION_ID") REFERENCES public."AO_7CDE43_NOTIFICATION"("ID");


--
-- Name: AO_7CDE43_SERVER_PARAM fk_ao_7cde43_server_param_server_config_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_7CDE43_SERVER_PARAM"
    ADD CONSTRAINT fk_ao_7cde43_server_param_server_config_id FOREIGN KEY ("SERVER_CONFIG_ID") REFERENCES public."AO_7CDE43_SERVER_CONFIG"("ID");


--
-- Name: AO_9412A1_USER_APP_LINK fk_ao_9412a1_user_app_link_user_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_9412A1_USER_APP_LINK"
    ADD CONSTRAINT fk_ao_9412a1_user_app_link_user_id FOREIGN KEY ("USER_ID") REFERENCES public."AO_9412A1_AOUSER"("ID");


--
-- Name: AO_950DC3_TC_CUSTOM_EV_TYPES fk_ao_950dc3_tc_custom_ev_types_belong_sub_calendar_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_CUSTOM_EV_TYPES"
    ADD CONSTRAINT fk_ao_950dc3_tc_custom_ev_types_belong_sub_calendar_id FOREIGN KEY ("BELONG_SUB_CALENDAR_ID") REFERENCES public."AO_950DC3_TC_SUBCALS"("ID");


--
-- Name: AO_950DC3_TC_DISABLE_EV_TYPES fk_ao_950dc3_tc_disable_ev_types_sub_calendar_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_DISABLE_EV_TYPES"
    ADD CONSTRAINT fk_ao_950dc3_tc_disable_ev_types_sub_calendar_id FOREIGN KEY ("SUB_CALENDAR_ID") REFERENCES public."AO_950DC3_TC_SUBCALS"("ID");


--
-- Name: AO_950DC3_TC_JIRA_REMI_EVENTS fk_ao_950dc3_tc_jira_remi_events_sub_calendar_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_JIRA_REMI_EVENTS"
    ADD CONSTRAINT fk_ao_950dc3_tc_jira_remi_events_sub_calendar_id FOREIGN KEY ("SUB_CALENDAR_ID") REFERENCES public."AO_950DC3_TC_SUBCALS"("ID");


--
-- Name: AO_950DC3_TC_REMINDER_USERS fk_ao_950dc3_tc_reminder_users_sub_calendar_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_REMINDER_USERS"
    ADD CONSTRAINT fk_ao_950dc3_tc_reminder_users_sub_calendar_id FOREIGN KEY ("SUB_CALENDAR_ID") REFERENCES public."AO_950DC3_TC_SUBCALS"("ID");


--
-- Name: AO_950DC3_TC_SUBCALS_IN_SPACE fk_ao_950dc3_tc_subcals_in_space_sub_calendar_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS_IN_SPACE"
    ADD CONSTRAINT fk_ao_950dc3_tc_subcals_in_space_sub_calendar_id FOREIGN KEY ("SUB_CALENDAR_ID") REFERENCES public."AO_950DC3_TC_SUBCALS"("ID");


--
-- Name: AO_950DC3_TC_SUBCALS fk_ao_950dc3_tc_subcals_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS"
    ADD CONSTRAINT fk_ao_950dc3_tc_subcals_parent_id FOREIGN KEY ("PARENT_ID") REFERENCES public."AO_950DC3_TC_SUBCALS"("ID");


--
-- Name: AO_950DC3_TC_SUBCALS fk_ao_950dc3_tc_subcals_subscription_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_950DC3_TC_SUBCALS"
    ADD CONSTRAINT fk_ao_950dc3_tc_subcals_subscription_id FOREIGN KEY ("SUBSCRIPTION_ID") REFERENCES public."AO_950DC3_TC_SUBCALS"("ID");


--
-- Name: AO_A0B856_WEBHOOK_CONFIG fk_ao_a0b856_webhook_config_webhookid; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEBHOOK_CONFIG"
    ADD CONSTRAINT fk_ao_a0b856_webhook_config_webhookid FOREIGN KEY ("WEBHOOKID") REFERENCES public."AO_A0B856_WEBHOOK"("ID");


--
-- Name: AO_A0B856_WEBHOOK_EVENT fk_ao_a0b856_webhook_event_webhookid; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public."AO_A0B856_WEBHOOK_EVENT"
    ADD CONSTRAINT fk_ao_a0b856_webhook_event_webhookid FOREIGN KEY ("WEBHOOKID") REFERENCES public."AO_A0B856_WEBHOOK"("ID");


--
-- Name: cwd_app_dir_mapping fk_app_dir_dir; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_app_dir_mapping
    ADD CONSTRAINT fk_app_dir_dir FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: cwd_app_dir_group_mapping fk_app_dir_group_app; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_app_dir_group_mapping
    ADD CONSTRAINT fk_app_dir_group_app FOREIGN KEY (application_id) REFERENCES public.cwd_application(id);


--
-- Name: cwd_app_dir_group_mapping fk_app_dir_group_dir; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_app_dir_group_mapping
    ADD CONSTRAINT fk_app_dir_group_dir FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: cwd_app_dir_group_mapping fk_app_dir_group_mapping; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_app_dir_group_mapping
    ADD CONSTRAINT fk_app_dir_group_mapping FOREIGN KEY (app_dir_mapping_id) REFERENCES public.cwd_app_dir_mapping(id);


--
-- Name: cwd_app_dir_operation fk_app_dir_mapping; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_app_dir_operation
    ADD CONSTRAINT fk_app_dir_mapping FOREIGN KEY (app_dir_mapping_id) REFERENCES public.cwd_app_dir_mapping(id);


--
-- Name: cwd_application_address fk_application_address; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_application_address
    ADD CONSTRAINT fk_application_address FOREIGN KEY (application_id) REFERENCES public.cwd_application(id);


--
-- Name: cwd_application_attribute fk_application_attribute; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_application_attribute
    ADD CONSTRAINT fk_application_attribute FOREIGN KEY (application_id) REFERENCES public.cwd_application(id);


--
-- Name: content_relation fk_c2crelation_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_relation
    ADD CONSTRAINT fk_c2crelation_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: content_relation fk_c2crelation_lastmodifier; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_relation
    ADD CONSTRAINT fk_c2crelation_lastmodifier FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: audit_changed_value fk_changed_value_record; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.audit_changed_value
    ADD CONSTRAINT fk_changed_value_record FOREIGN KEY (auditrecordid) REFERENCES public.auditrecord(auditrecordid);


--
-- Name: cwd_membership fk_child_grp; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_membership
    ADD CONSTRAINT fk_child_grp FOREIGN KEY (child_group_id) REFERENCES public.cwd_group(id);


--
-- Name: cwd_membership fk_child_user; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_membership
    ADD CONSTRAINT fk_child_user FOREIGN KEY (child_user_id) REFERENCES public.cwd_user(id);


--
-- Name: content fk_content_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fk_content_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: content_label fk_content_label_owner; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_label
    ADD CONSTRAINT fk_content_label_owner FOREIGN KEY (owner) REFERENCES public.user_mapping(user_key);


--
-- Name: content fk_content_lastmodifier; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fk_content_lastmodifier FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: content_perm fk_content_perm_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm
    ADD CONSTRAINT fk_content_perm_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: content_perm fk_content_perm_lastmodifier; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm
    ADD CONSTRAINT fk_content_perm_lastmodifier FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: content_perm fk_content_perm_username; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm
    ADD CONSTRAINT fk_content_perm_username FOREIGN KEY (username) REFERENCES public.user_mapping(user_key);


--
-- Name: content fk_content_username; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fk_content_username FOREIGN KEY (username) REFERENCES public.user_mapping(user_key);


--
-- Name: cwd_directory_attribute fk_directory_attribute; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_directory_attribute
    ADD CONSTRAINT fk_directory_attribute FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: cwd_group fk_directory_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_group
    ADD CONSTRAINT fk_directory_id FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: cwd_directory_operation fk_directory_operation; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_directory_operation
    ADD CONSTRAINT fk_directory_operation FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: follow_connections fk_follow_connections_followee; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.follow_connections
    ADD CONSTRAINT fk_follow_connections_followee FOREIGN KEY (followee) REFERENCES public.user_mapping(user_key);


--
-- Name: follow_connections fk_follow_connections_follower; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.follow_connections
    ADD CONSTRAINT fk_follow_connections_follower FOREIGN KEY (follower) REFERENCES public.user_mapping(user_key);


--
-- Name: cwd_group_attribute fk_group_attr_dir_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_group_attribute
    ADD CONSTRAINT fk_group_attr_dir_id FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: cwd_group_attribute fk_group_attr_id_group_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_group_attribute
    ADD CONSTRAINT fk_group_attr_id_group_id FOREIGN KEY (group_id) REFERENCES public.cwd_group(id);


--
-- Name: label fk_label_owner; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT fk_label_owner FOREIGN KEY (owner) REFERENCES public.user_mapping(user_key);


--
-- Name: likes fk_likes_username; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fk_likes_username FOREIGN KEY (username) REFERENCES public.user_mapping(user_key);


--
-- Name: links fk_links_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_links_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: links fk_links_lastmodifier; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fk_links_lastmodifier FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: logininfo fk_logininfo_username; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.logininfo
    ADD CONSTRAINT fk_logininfo_username FOREIGN KEY (username) REFERENCES public.user_mapping(user_key);


--
-- Name: notifications fk_notifications_content; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_notifications_content FOREIGN KEY (contentid) REFERENCES public.content(contentid);


--
-- Name: notifications fk_notifications_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_notifications_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: notifications fk_notifications_lastmodifier; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_notifications_lastmodifier FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: notifications fk_notifications_username; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_notifications_username FOREIGN KEY (username) REFERENCES public.user_mapping(user_key);


--
-- Name: pagetemplates fk_pagetemplates_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.pagetemplates
    ADD CONSTRAINT fk_pagetemplates_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: pagetemplates fk_pagetemplates_lastmodifier; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.pagetemplates
    ADD CONSTRAINT fk_pagetemplates_lastmodifier FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: cwd_membership fk_parent_grp; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_membership
    ADD CONSTRAINT fk_parent_grp FOREIGN KEY (parent_id) REFERENCES public.cwd_group(id);


--
-- Name: usercontent_relation fk_relation_u2cuser; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.usercontent_relation
    ADD CONSTRAINT fk_relation_u2cuser FOREIGN KEY (sourceuser) REFERENCES public.user_mapping(user_key);


--
-- Name: user_relation fk_relation_u2ususer; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT fk_relation_u2ususer FOREIGN KEY (sourceuser) REFERENCES public.user_mapping(user_key);


--
-- Name: user_relation fk_relation_u2utuser; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT fk_relation_u2utuser FOREIGN KEY (targetuser) REFERENCES public.user_mapping(user_key);


--
-- Name: spacepermissions fk_spacepermissions_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spacepermissions
    ADD CONSTRAINT fk_spacepermissions_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: spacepermissions fk_spacepermissions_lastmodifi; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spacepermissions
    ADD CONSTRAINT fk_spacepermissions_lastmodifi FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: spacepermissions fk_spacepermissions_permuserna; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spacepermissions
    ADD CONSTRAINT fk_spacepermissions_permuserna FOREIGN KEY (permusername) REFERENCES public.user_mapping(user_key);


--
-- Name: spaces fk_spaces_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT fk_spaces_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: spaces fk_spaces_lastmodifier; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT fk_spaces_lastmodifier FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: cwd_synchronisation_status fk_sync_status_dir; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_synchronisation_status
    ADD CONSTRAINT fk_sync_status_dir FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: cwd_synchronisation_token fk_sync_token_dir; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_synchronisation_token
    ADD CONSTRAINT fk_sync_token_dir FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: usercontent_relation fk_u2crelation_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.usercontent_relation
    ADD CONSTRAINT fk_u2crelation_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: usercontent_relation fk_u2crelation_lastmodifier; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.usercontent_relation
    ADD CONSTRAINT fk_u2crelation_lastmodifier FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: user_relation fk_u2urelation_creator; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT fk_u2urelation_creator FOREIGN KEY (creator) REFERENCES public.user_mapping(user_key);


--
-- Name: user_relation fk_u2urelation_lastmodifier; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.user_relation
    ADD CONSTRAINT fk_u2urelation_lastmodifier FOREIGN KEY (lastmodifier) REFERENCES public.user_mapping(user_key);


--
-- Name: cwd_user_attribute fk_user_attr_dir_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_user_attribute
    ADD CONSTRAINT fk_user_attr_dir_id FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: cwd_user_attribute fk_user_attribute_id_user_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_user_attribute
    ADD CONSTRAINT fk_user_attribute_id_user_id FOREIGN KEY (user_id) REFERENCES public.cwd_user(id);


--
-- Name: cwd_user fk_user_dir_id; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_user
    ADD CONSTRAINT fk_user_dir_id FOREIGN KEY (directory_id) REFERENCES public.cwd_directory(id);


--
-- Name: content fkal6o8xwypd4mdgid9b9nw1q51; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fkal6o8xwypd4mdgid9b9nw1q51 FOREIGN KEY (parentcommentid) REFERENCES public.content(contentid);


--
-- Name: likes fkbdoiwi70i7o3tc7hpbu4vnlmy; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT fkbdoiwi70i7o3tc7hpbu4vnlmy FOREIGN KEY (contentid) REFERENCES public.content(contentid);


--
-- Name: spacepermissions fkbi3x723m8fbgoko3s84f9oddl; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spacepermissions
    ADD CONSTRAINT fkbi3x723m8fbgoko3s84f9oddl FOREIGN KEY (spaceid) REFERENCES public.spaces(spaceid);


--
-- Name: content_perm fkde5wl1cur1se9281gc0dsawtb; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_perm
    ADD CONSTRAINT fkde5wl1cur1se9281gc0dsawtb FOREIGN KEY (cps_id) REFERENCES public.content_perm_set(id);


--
-- Name: content_relation fke2a00urqyxmyaj3jop48ub8qd; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_relation
    ADD CONSTRAINT fke2a00urqyxmyaj3jop48ub8qd FOREIGN KEY (sourcecontentid) REFERENCES public.content(contentid);


--
-- Name: content fkfiyhka48c7e776qj90klbpm9q; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fkfiyhka48c7e776qj90klbpm9q FOREIGN KEY (parentccid) REFERENCES public.content(contentid);


--
-- Name: content_label fki8cvahsu6d2y285vtrp4nhc3w; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_label
    ADD CONSTRAINT fki8cvahsu6d2y285vtrp4nhc3w FOREIGN KEY (contentid) REFERENCES public.content(contentid);


--
-- Name: content_relation fkipr00838mkln699cimd7rg17x; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content_relation
    ADD CONSTRAINT fkipr00838mkln699cimd7rg17x FOREIGN KEY (targetcontentid) REFERENCES public.content(contentid);


--
-- Name: spaces fkj4cu5838aqcbw57wy7ckt0t7o; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.spaces
    ADD CONSTRAINT fkj4cu5838aqcbw57wy7ckt0t7o FOREIGN KEY (homepage) REFERENCES public.content(contentid);


--
-- Name: attachmentdata fkjnh4yvwen0176qsvh4rpsry2j; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.attachmentdata
    ADD CONSTRAINT fkjnh4yvwen0176qsvh4rpsry2j FOREIGN KEY (attachmentid) REFERENCES public.content(contentid);


--
-- Name: trustedapprestriction fkjofk5643721eftow3njwr73aa; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.trustedapprestriction
    ADD CONSTRAINT fkjofk5643721eftow3njwr73aa FOREIGN KEY (trustedappid) REFERENCES public.trustedapp(trustedappid);


--
-- Name: content fkk6kbb7suqeloj82nx7xdcd803; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fkk6kbb7suqeloj82nx7xdcd803 FOREIGN KEY (prevver) REFERENCES public.content(contentid);


--
-- Name: confancestors fklmhsipswol8imeqsg906ih62x; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.confancestors
    ADD CONSTRAINT fklmhsipswol8imeqsg906ih62x FOREIGN KEY (descendentid) REFERENCES public.content(contentid);


--
-- Name: content fklmweu06nft59g7mw1i1myorys; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fklmweu06nft59g7mw1i1myorys FOREIGN KEY (spaceid) REFERENCES public.spaces(spaceid);


--
-- Name: trustedapp fkm7n581y7groa49tygapkmnfiv; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.trustedapp
    ADD CONSTRAINT fkm7n581y7groa49tygapkmnfiv FOREIGN KEY (public_key_id) REFERENCES public.keystore(keyid);


--
-- Name: bodycontent fkmbyiayesfp1eiq6gmol3mk3yl; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.bodycontent
    ADD CONSTRAINT fkmbyiayesfp1eiq6gmol3mk3yl FOREIGN KEY (contentid) REFERENCES public.content(contentid);


--
-- Name: notifications fkmqe1phe52xwqc4hk4ib8p9eh6; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fkmqe1phe52xwqc4hk4ib8p9eh6 FOREIGN KEY (spaceid) REFERENCES public.spaces(spaceid);


--
-- Name: links fkn8mycko8frerne7brh5nr1csr; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT fkn8mycko8frerne7brh5nr1csr FOREIGN KEY (contentid) REFERENCES public.content(contentid);


--
-- Name: content fkoxtt893weujkyh0iicoxsm37v; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fkoxtt893weujkyh0iicoxsm37v FOREIGN KEY (parentid) REFERENCES public.content(contentid);


--
-- Name: usercontent_relation fkpwgl85a266iie5i0adu8bdbcv; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.usercontent_relation
    ADD CONSTRAINT fkpwgl85a266iie5i0adu8bdbcv FOREIGN KEY (targetcontentid) REFERENCES public.content(contentid);


--
-- Name: confancestors fksqb1af9h7fvqtgy73o8jdcuue; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.confancestors
    ADD CONSTRAINT fksqb1af9h7fvqtgy73o8jdcuue FOREIGN KEY (ancestorid) REFERENCES public.content(contentid);


--
-- Name: cwd_app_dir_mapping fkstekj41875rgsw8otffrayhpl; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.cwd_app_dir_mapping
    ADD CONSTRAINT fkstekj41875rgsw8otffrayhpl FOREIGN KEY (application_id) REFERENCES public.cwd_application(id);


--
-- Name: content fkwjyn6091q3l1gl7bh143ma2a; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT fkwjyn6091q3l1gl7bh143ma2a FOREIGN KEY (pageid) REFERENCES public.content(contentid);


--
-- Name: mig_attachment mig_attachment_site_fk; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_attachment
    ADD CONSTRAINT mig_attachment_site_fk FOREIGN KEY (cloudid) REFERENCES public.mig_cloud_site(cloudid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: mig_plan mig_plan_site_fk; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_plan
    ADD CONSTRAINT mig_plan_site_fk FOREIGN KEY (cloudid) REFERENCES public.mig_cloud_site(cloudid) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: mig_step mig_step_plan_fk; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_step
    ADD CONSTRAINT mig_step_plan_fk FOREIGN KEY (planid) REFERENCES public.mig_plan(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: mig_step mig_step_task_fk; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_step
    ADD CONSTRAINT mig_step_task_fk FOREIGN KEY (taskid) REFERENCES public.mig_task(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: mig_task mig_task_plan_fk; Type: FK CONSTRAINT; Schema: public; Owner: confluence
--

ALTER TABLE ONLY public.mig_task
    ADD CONSTRAINT mig_task_plan_fk FOREIGN KEY (planid) REFERENCES public.mig_plan(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

