--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE nextcloud;
ALTER ROLE nextcloud WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:bLO0ZFg+H/uwjGAvfFeJQQ==$4mMLzgiov4LjLGdzXUxIMcHKwp1sctGJpdz4BVhR6Gw=:/igZGPo/CCBV41M+R33VR1OcU7Jo5Dow1rmK57UD9BA=';
CREATE ROLE oc_x79;
ALTER ROLE oc_x79 WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:1KsAlF9N+dDSzMRpRb/vJA==$ihlPOmLYi7ZVeXREWjHR3iyY2LI0mpvo17eO+UusAZg=:PjHbKQvWXLLWc1beDSeCDBjGn722a/i5gUVec/kB3Bo=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "nextcloud" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: nextcloud; Type: DATABASE; Schema: -; Owner: nextcloud
--

CREATE DATABASE nextcloud WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE nextcloud OWNER TO nextcloud;

\connect nextcloud

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: oc_accounts; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_accounts (
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    data text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.oc_accounts OWNER TO oc_x79;

--
-- Name: oc_accounts_data; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_accounts_data (
    id bigint NOT NULL,
    uid character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    value character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.oc_accounts_data OWNER TO oc_x79;

--
-- Name: oc_accounts_data_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_accounts_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_accounts_data_id_seq OWNER TO oc_x79;

--
-- Name: oc_accounts_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_accounts_data_id_seq OWNED BY public.oc_accounts_data.id;


--
-- Name: oc_activity; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_activity (
    activity_id bigint NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    type character varying(255) DEFAULT NULL::character varying,
    "user" character varying(64) DEFAULT NULL::character varying,
    affecteduser character varying(64) NOT NULL,
    app character varying(32) NOT NULL,
    subject character varying(255) NOT NULL,
    subjectparams text NOT NULL,
    message character varying(255) DEFAULT NULL::character varying,
    messageparams text,
    file character varying(4000) DEFAULT NULL::character varying,
    link character varying(4000) DEFAULT NULL::character varying,
    object_type character varying(255) DEFAULT NULL::character varying,
    object_id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_activity OWNER TO oc_x79;

--
-- Name: oc_activity_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_activity_activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_activity_activity_id_seq OWNER TO oc_x79;

--
-- Name: oc_activity_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_activity_activity_id_seq OWNED BY public.oc_activity.activity_id;


--
-- Name: oc_activity_mq; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_activity_mq (
    mail_id bigint NOT NULL,
    amq_timestamp integer DEFAULT 0 NOT NULL,
    amq_latest_send integer DEFAULT 0 NOT NULL,
    amq_type character varying(255) NOT NULL,
    amq_affecteduser character varying(64) NOT NULL,
    amq_appid character varying(32) NOT NULL,
    amq_subject character varying(255) NOT NULL,
    amq_subjectparams text,
    object_type character varying(255) DEFAULT NULL::character varying,
    object_id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_activity_mq OWNER TO oc_x79;

--
-- Name: oc_activity_mq_mail_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_activity_mq_mail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_activity_mq_mail_id_seq OWNER TO oc_x79;

--
-- Name: oc_activity_mq_mail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_activity_mq_mail_id_seq OWNED BY public.oc_activity_mq.mail_id;


--
-- Name: oc_addressbookchanges; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_addressbookchanges (
    id bigint NOT NULL,
    uri character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL,
    addressbookid bigint NOT NULL,
    operation smallint NOT NULL,
    created_at integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_addressbookchanges OWNER TO oc_x79;

--
-- Name: oc_addressbookchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_addressbookchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_addressbookchanges_id_seq OWNER TO oc_x79;

--
-- Name: oc_addressbookchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_addressbookchanges_id_seq OWNED BY public.oc_addressbookchanges.id;


--
-- Name: oc_addressbooks; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_addressbooks (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    uri character varying(255) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_addressbooks OWNER TO oc_x79;

--
-- Name: oc_addressbooks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_addressbooks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_addressbooks_id_seq OWNER TO oc_x79;

--
-- Name: oc_addressbooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_addressbooks_id_seq OWNED BY public.oc_addressbooks.id;


--
-- Name: oc_appconfig; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_appconfig (
    appid character varying(32) DEFAULT ''::character varying NOT NULL,
    configkey character varying(64) DEFAULT ''::character varying NOT NULL,
    configvalue text,
    type integer DEFAULT 2 NOT NULL,
    lazy smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_appconfig OWNER TO oc_x79;

--
-- Name: oc_appconfig_ex; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_appconfig_ex (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    configkey character varying(64) NOT NULL,
    configvalue text,
    sensitive smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_appconfig_ex OWNER TO oc_x79;

--
-- Name: oc_appconfig_ex_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_appconfig_ex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_appconfig_ex_id_seq OWNER TO oc_x79;

--
-- Name: oc_appconfig_ex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_appconfig_ex_id_seq OWNED BY public.oc_appconfig_ex.id;


--
-- Name: oc_authorized_groups; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_authorized_groups (
    id integer NOT NULL,
    group_id character varying(200) NOT NULL,
    class character varying(200) NOT NULL
);


ALTER TABLE public.oc_authorized_groups OWNER TO oc_x79;

--
-- Name: oc_authorized_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_authorized_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_authorized_groups_id_seq OWNER TO oc_x79;

--
-- Name: oc_authorized_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_authorized_groups_id_seq OWNED BY public.oc_authorized_groups.id;


--
-- Name: oc_authtoken; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_authtoken (
    id bigint NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    login_name character varying(255) DEFAULT ''::character varying NOT NULL,
    password text,
    name text DEFAULT ''::text NOT NULL,
    token character varying(200) DEFAULT ''::character varying NOT NULL,
    type smallint DEFAULT 0,
    remember smallint DEFAULT 0,
    last_activity integer DEFAULT 0,
    last_check integer DEFAULT 0,
    scope text,
    expires integer,
    private_key text,
    public_key text,
    version smallint DEFAULT 1 NOT NULL,
    password_invalid boolean DEFAULT false,
    password_hash character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_authtoken OWNER TO oc_x79;

--
-- Name: oc_authtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_authtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_authtoken_id_seq OWNER TO oc_x79;

--
-- Name: oc_authtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_authtoken_id_seq OWNED BY public.oc_authtoken.id;


--
-- Name: oc_bruteforce_attempts; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_bruteforce_attempts (
    id bigint NOT NULL,
    action character varying(64) DEFAULT ''::character varying NOT NULL,
    occurred integer DEFAULT 0 NOT NULL,
    ip character varying(255) DEFAULT ''::character varying NOT NULL,
    subnet character varying(255) DEFAULT ''::character varying NOT NULL,
    metadata character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_bruteforce_attempts OWNER TO oc_x79;

--
-- Name: oc_bruteforce_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_bruteforce_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_bruteforce_attempts_id_seq OWNER TO oc_x79;

--
-- Name: oc_bruteforce_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_bruteforce_attempts_id_seq OWNED BY public.oc_bruteforce_attempts.id;


--
-- Name: oc_calendar_appt_bookings; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendar_appt_bookings (
    id bigint NOT NULL,
    appt_config_id bigint NOT NULL,
    created_at integer NOT NULL,
    token character varying(32) NOT NULL,
    display_name character varying(128) NOT NULL,
    description text,
    email character varying(128) NOT NULL,
    start integer NOT NULL,
    "end" integer NOT NULL,
    timezone character varying(32) NOT NULL,
    confirmed boolean DEFAULT false
);


ALTER TABLE public.oc_calendar_appt_bookings OWNER TO oc_x79;

--
-- Name: oc_calendar_appt_bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendar_appt_bookings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendar_appt_bookings_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendar_appt_bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendar_appt_bookings_id_seq OWNED BY public.oc_calendar_appt_bookings.id;


--
-- Name: oc_calendar_appt_configs; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendar_appt_configs (
    id bigint NOT NULL,
    token character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    location text,
    visibility character varying(10) NOT NULL,
    user_id character varying(64) NOT NULL,
    target_calendar_uri character varying(255) NOT NULL,
    calendar_freebusy_uris text,
    availability text,
    start integer,
    "end" integer,
    length integer NOT NULL,
    increment integer NOT NULL,
    preparation_duration integer DEFAULT 0 NOT NULL,
    followup_duration integer DEFAULT 0 NOT NULL,
    time_before_next_slot integer,
    daily_max integer,
    future_limit integer,
    create_talk_room boolean DEFAULT false
);


ALTER TABLE public.oc_calendar_appt_configs OWNER TO oc_x79;

--
-- Name: oc_calendar_appt_configs_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendar_appt_configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendar_appt_configs_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendar_appt_configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendar_appt_configs_id_seq OWNED BY public.oc_calendar_appt_configs.id;


--
-- Name: oc_calendar_invitations; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendar_invitations (
    id bigint NOT NULL,
    uid character varying(255) NOT NULL,
    recurrenceid character varying(255) DEFAULT NULL::character varying,
    attendee character varying(255) NOT NULL,
    organizer character varying(255) NOT NULL,
    sequence bigint,
    token character varying(60) NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.oc_calendar_invitations OWNER TO oc_x79;

--
-- Name: oc_calendar_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendar_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendar_invitations_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendar_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendar_invitations_id_seq OWNED BY public.oc_calendar_invitations.id;


--
-- Name: oc_calendar_reminders; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendar_reminders (
    id bigint NOT NULL,
    calendar_id bigint NOT NULL,
    object_id bigint NOT NULL,
    is_recurring smallint,
    uid character varying(255) NOT NULL,
    recurrence_id bigint,
    is_recurrence_exception smallint NOT NULL,
    event_hash character varying(255) NOT NULL,
    alarm_hash character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    is_relative smallint NOT NULL,
    notification_date bigint NOT NULL,
    is_repeat_based smallint NOT NULL
);


ALTER TABLE public.oc_calendar_reminders OWNER TO oc_x79;

--
-- Name: oc_calendar_reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendar_reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendar_reminders_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendar_reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendar_reminders_id_seq OWNED BY public.oc_calendar_reminders.id;


--
-- Name: oc_calendar_resources; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendar_resources (
    id bigint NOT NULL,
    backend_id character varying(64) DEFAULT NULL::character varying,
    resource_id character varying(64) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    group_restrictions character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_calendar_resources OWNER TO oc_x79;

--
-- Name: oc_calendar_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendar_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendar_resources_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendar_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendar_resources_id_seq OWNED BY public.oc_calendar_resources.id;


--
-- Name: oc_calendar_resources_md; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendar_resources_md (
    id bigint NOT NULL,
    resource_id bigint NOT NULL,
    key character varying(255) NOT NULL,
    value character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_calendar_resources_md OWNER TO oc_x79;

--
-- Name: oc_calendar_resources_md_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendar_resources_md_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendar_resources_md_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendar_resources_md_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendar_resources_md_id_seq OWNED BY public.oc_calendar_resources_md.id;


--
-- Name: oc_calendar_rooms; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendar_rooms (
    id bigint NOT NULL,
    backend_id character varying(64) DEFAULT NULL::character varying,
    resource_id character varying(64) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    group_restrictions character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_calendar_rooms OWNER TO oc_x79;

--
-- Name: oc_calendar_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendar_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendar_rooms_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendar_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendar_rooms_id_seq OWNED BY public.oc_calendar_rooms.id;


--
-- Name: oc_calendar_rooms_md; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendar_rooms_md (
    id bigint NOT NULL,
    room_id bigint NOT NULL,
    key character varying(255) NOT NULL,
    value character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_calendar_rooms_md OWNER TO oc_x79;

--
-- Name: oc_calendar_rooms_md_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendar_rooms_md_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendar_rooms_md_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendar_rooms_md_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendar_rooms_md_id_seq OWNED BY public.oc_calendar_rooms_md.id;


--
-- Name: oc_calendarchanges; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendarchanges (
    id bigint NOT NULL,
    uri character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL,
    calendarid bigint NOT NULL,
    operation smallint NOT NULL,
    calendartype integer DEFAULT 0 NOT NULL,
    created_at integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_calendarchanges OWNER TO oc_x79;

--
-- Name: oc_calendarchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendarchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendarchanges_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendarchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendarchanges_id_seq OWNED BY public.oc_calendarchanges.id;


--
-- Name: oc_calendarobjects; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendarobjects (
    id bigint NOT NULL,
    calendardata bytea,
    uri character varying(255) DEFAULT NULL::character varying,
    calendarid bigint NOT NULL,
    lastmodified integer,
    etag character varying(32) DEFAULT NULL::character varying,
    size bigint NOT NULL,
    componenttype character varying(8) DEFAULT NULL::character varying,
    firstoccurence bigint,
    lastoccurence bigint,
    uid character varying(255) DEFAULT NULL::character varying,
    classification integer DEFAULT 0,
    calendartype integer DEFAULT 0 NOT NULL,
    deleted_at integer
);


ALTER TABLE public.oc_calendarobjects OWNER TO oc_x79;

--
-- Name: oc_calendarobjects_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendarobjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendarobjects_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendarobjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendarobjects_id_seq OWNED BY public.oc_calendarobjects.id;


--
-- Name: oc_calendarobjects_props; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendarobjects_props (
    id bigint NOT NULL,
    calendarid bigint DEFAULT 0 NOT NULL,
    objectid bigint DEFAULT 0 NOT NULL,
    name character varying(64) DEFAULT NULL::character varying,
    parameter character varying(64) DEFAULT NULL::character varying,
    value character varying(255) DEFAULT NULL::character varying,
    calendartype integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_calendarobjects_props OWNER TO oc_x79;

--
-- Name: oc_calendarobjects_props_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendarobjects_props_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendarobjects_props_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendarobjects_props_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendarobjects_props_id_seq OWNED BY public.oc_calendarobjects_props.id;


--
-- Name: oc_calendars; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendars (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    displayname character varying(255) DEFAULT NULL::character varying,
    uri character varying(255) DEFAULT NULL::character varying,
    synctoken integer DEFAULT 1 NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    calendarorder integer DEFAULT 0 NOT NULL,
    calendarcolor character varying(255) DEFAULT NULL::character varying,
    timezone text,
    components character varying(64) DEFAULT NULL::character varying,
    transparent smallint DEFAULT 0 NOT NULL,
    deleted_at integer
);


ALTER TABLE public.oc_calendars OWNER TO oc_x79;

--
-- Name: oc_calendars_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendars_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendars_id_seq OWNED BY public.oc_calendars.id;


--
-- Name: oc_calendarsubscriptions; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_calendarsubscriptions (
    id bigint NOT NULL,
    uri character varying(255) DEFAULT NULL::character varying,
    principaluri character varying(255) DEFAULT NULL::character varying,
    displayname character varying(100) DEFAULT NULL::character varying,
    refreshrate character varying(10) DEFAULT NULL::character varying,
    calendarorder integer DEFAULT 0 NOT NULL,
    calendarcolor character varying(255) DEFAULT NULL::character varying,
    striptodos smallint,
    stripalarms smallint,
    stripattachments smallint,
    lastmodified integer,
    synctoken integer DEFAULT 1 NOT NULL,
    source text
);


ALTER TABLE public.oc_calendarsubscriptions OWNER TO oc_x79;

--
-- Name: oc_calendarsubscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_calendarsubscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_calendarsubscriptions_id_seq OWNER TO oc_x79;

--
-- Name: oc_calendarsubscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_calendarsubscriptions_id_seq OWNED BY public.oc_calendarsubscriptions.id;


--
-- Name: oc_cards; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_cards (
    id bigint NOT NULL,
    addressbookid bigint DEFAULT 0 NOT NULL,
    carddata bytea,
    uri character varying(255) DEFAULT NULL::character varying,
    lastmodified bigint,
    etag character varying(32) DEFAULT NULL::character varying,
    size bigint NOT NULL,
    uid character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_cards OWNER TO oc_x79;

--
-- Name: oc_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_cards_id_seq OWNER TO oc_x79;

--
-- Name: oc_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_cards_id_seq OWNED BY public.oc_cards.id;


--
-- Name: oc_cards_properties; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_cards_properties (
    id bigint NOT NULL,
    addressbookid bigint DEFAULT 0 NOT NULL,
    cardid bigint DEFAULT 0 NOT NULL,
    name character varying(64) DEFAULT NULL::character varying,
    value character varying(255) DEFAULT NULL::character varying,
    preferred integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_cards_properties OWNER TO oc_x79;

--
-- Name: oc_cards_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_cards_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_cards_properties_id_seq OWNER TO oc_x79;

--
-- Name: oc_cards_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_cards_properties_id_seq OWNED BY public.oc_cards_properties.id;


--
-- Name: oc_cfg_shares; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_cfg_shares (
    id integer NOT NULL,
    full_id character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    node_id integer NOT NULL
);


ALTER TABLE public.oc_cfg_shares OWNER TO oc_x79;

--
-- Name: oc_cfg_shares_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_cfg_shares_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_cfg_shares_id_seq OWNER TO oc_x79;

--
-- Name: oc_cfg_shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_cfg_shares_id_seq OWNED BY public.oc_cfg_shares.id;


--
-- Name: oc_circles_circle; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_circles_circle (
    id integer NOT NULL,
    unique_id character varying(31) NOT NULL,
    name character varying(127) NOT NULL,
    display_name character varying(255) DEFAULT ''::character varying,
    sanitized_name character varying(127) DEFAULT ''::character varying,
    instance character varying(255) DEFAULT ''::character varying,
    config integer,
    source integer,
    settings text,
    description text,
    creation timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    contact_addressbook integer,
    contact_groupname character varying(127) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_circles_circle OWNER TO oc_x79;

--
-- Name: oc_circles_circle_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_circles_circle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_circles_circle_id_seq OWNER TO oc_x79;

--
-- Name: oc_circles_circle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_circles_circle_id_seq OWNED BY public.oc_circles_circle.id;


--
-- Name: oc_circles_event; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_circles_event (
    token character varying(63) NOT NULL,
    instance character varying(255) NOT NULL,
    event text,
    result text,
    interface integer DEFAULT 0 NOT NULL,
    severity integer,
    retry integer,
    status integer,
    updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    creation bigint
);


ALTER TABLE public.oc_circles_event OWNER TO oc_x79;

--
-- Name: oc_circles_member; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_circles_member (
    id integer NOT NULL,
    single_id character varying(31) DEFAULT NULL::character varying,
    circle_id character varying(31) NOT NULL,
    member_id character varying(31) DEFAULT NULL::character varying,
    user_id character varying(127) NOT NULL,
    user_type smallint DEFAULT 1 NOT NULL,
    instance character varying(255) DEFAULT ''::character varying,
    invited_by character varying(31) DEFAULT NULL::character varying,
    level smallint NOT NULL,
    status character varying(15) DEFAULT NULL::character varying,
    note text,
    cached_name character varying(255) DEFAULT ''::character varying,
    cached_update timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    contact_id character varying(127) DEFAULT NULL::character varying,
    contact_meta text,
    joined timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_circles_member OWNER TO oc_x79;

--
-- Name: oc_circles_member_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_circles_member_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_circles_member_id_seq OWNER TO oc_x79;

--
-- Name: oc_circles_member_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_circles_member_id_seq OWNED BY public.oc_circles_member.id;


--
-- Name: oc_circles_membership; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_circles_membership (
    circle_id character varying(31) NOT NULL,
    single_id character varying(31) NOT NULL,
    level integer NOT NULL,
    inheritance_first character varying(31) NOT NULL,
    inheritance_last character varying(31) NOT NULL,
    inheritance_depth integer NOT NULL,
    inheritance_path text NOT NULL
);


ALTER TABLE public.oc_circles_membership OWNER TO oc_x79;

--
-- Name: oc_circles_mount; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_circles_mount (
    id integer NOT NULL,
    mount_id character varying(31) NOT NULL,
    circle_id character varying(31) NOT NULL,
    single_id character varying(31) NOT NULL,
    token character varying(63) DEFAULT NULL::character varying,
    parent integer,
    mountpoint text,
    mountpoint_hash character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_circles_mount OWNER TO oc_x79;

--
-- Name: oc_circles_mount_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_circles_mount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_circles_mount_id_seq OWNER TO oc_x79;

--
-- Name: oc_circles_mount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_circles_mount_id_seq OWNED BY public.oc_circles_mount.id;


--
-- Name: oc_circles_mountpoint; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_circles_mountpoint (
    id integer NOT NULL,
    mount_id character varying(31) NOT NULL,
    single_id character varying(31) NOT NULL,
    mountpoint text,
    mountpoint_hash character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_circles_mountpoint OWNER TO oc_x79;

--
-- Name: oc_circles_mountpoint_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_circles_mountpoint_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_circles_mountpoint_id_seq OWNER TO oc_x79;

--
-- Name: oc_circles_mountpoint_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_circles_mountpoint_id_seq OWNED BY public.oc_circles_mountpoint.id;


--
-- Name: oc_circles_remote; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_circles_remote (
    id integer NOT NULL,
    type character varying(15) DEFAULT 'Unknown'::character varying NOT NULL,
    interface integer DEFAULT 0 NOT NULL,
    uid character varying(20) DEFAULT NULL::character varying,
    instance character varying(127) DEFAULT NULL::character varying,
    href character varying(254) DEFAULT NULL::character varying,
    item text,
    creation timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_circles_remote OWNER TO oc_x79;

--
-- Name: oc_circles_remote_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_circles_remote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_circles_remote_id_seq OWNER TO oc_x79;

--
-- Name: oc_circles_remote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_circles_remote_id_seq OWNED BY public.oc_circles_remote.id;


--
-- Name: oc_circles_share_lock; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_circles_share_lock (
    id integer NOT NULL,
    item_id character varying(31) NOT NULL,
    circle_id character varying(31) NOT NULL,
    instance character varying(127) NOT NULL
);


ALTER TABLE public.oc_circles_share_lock OWNER TO oc_x79;

--
-- Name: oc_circles_share_lock_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_circles_share_lock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_circles_share_lock_id_seq OWNER TO oc_x79;

--
-- Name: oc_circles_share_lock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_circles_share_lock_id_seq OWNED BY public.oc_circles_share_lock.id;


--
-- Name: oc_circles_token; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_circles_token (
    id integer NOT NULL,
    share_id integer,
    circle_id character varying(31) DEFAULT NULL::character varying,
    single_id character varying(31) DEFAULT NULL::character varying,
    member_id character varying(31) DEFAULT NULL::character varying,
    token character varying(31) DEFAULT NULL::character varying,
    password character varying(127) DEFAULT NULL::character varying,
    accepted integer
);


ALTER TABLE public.oc_circles_token OWNER TO oc_x79;

--
-- Name: oc_circles_token_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_circles_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_circles_token_id_seq OWNER TO oc_x79;

--
-- Name: oc_circles_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_circles_token_id_seq OWNED BY public.oc_circles_token.id;


--
-- Name: oc_collres_accesscache; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_collres_accesscache (
    user_id character varying(64) NOT NULL,
    collection_id bigint DEFAULT 0 NOT NULL,
    resource_type character varying(64) DEFAULT ''::character varying NOT NULL,
    resource_id character varying(64) DEFAULT ''::character varying NOT NULL,
    access boolean DEFAULT false
);


ALTER TABLE public.oc_collres_accesscache OWNER TO oc_x79;

--
-- Name: oc_collres_collections; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_collres_collections (
    id bigint NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.oc_collres_collections OWNER TO oc_x79;

--
-- Name: oc_collres_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_collres_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_collres_collections_id_seq OWNER TO oc_x79;

--
-- Name: oc_collres_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_collres_collections_id_seq OWNED BY public.oc_collres_collections.id;


--
-- Name: oc_collres_resources; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_collres_resources (
    collection_id bigint NOT NULL,
    resource_type character varying(64) NOT NULL,
    resource_id character varying(64) NOT NULL
);


ALTER TABLE public.oc_collres_resources OWNER TO oc_x79;

--
-- Name: oc_comments; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_comments (
    id bigint NOT NULL,
    parent_id bigint DEFAULT 0 NOT NULL,
    topmost_parent_id bigint DEFAULT 0 NOT NULL,
    children_count integer DEFAULT 0 NOT NULL,
    actor_type character varying(64) DEFAULT ''::character varying NOT NULL,
    actor_id character varying(64) DEFAULT ''::character varying NOT NULL,
    message text,
    verb character varying(64) DEFAULT NULL::character varying,
    creation_timestamp timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    latest_child_timestamp timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    object_type character varying(64) DEFAULT ''::character varying NOT NULL,
    object_id character varying(64) DEFAULT ''::character varying NOT NULL,
    reference_id character varying(64) DEFAULT NULL::character varying,
    reactions character varying(4000) DEFAULT NULL::character varying,
    expire_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    meta_data text DEFAULT ''::text
);


ALTER TABLE public.oc_comments OWNER TO oc_x79;

--
-- Name: oc_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_comments_id_seq OWNER TO oc_x79;

--
-- Name: oc_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_comments_id_seq OWNED BY public.oc_comments.id;


--
-- Name: oc_comments_read_markers; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_comments_read_markers (
    user_id character varying(64) DEFAULT ''::character varying NOT NULL,
    object_type character varying(64) DEFAULT ''::character varying NOT NULL,
    object_id character varying(64) DEFAULT ''::character varying NOT NULL,
    marker_datetime timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_comments_read_markers OWNER TO oc_x79;

--
-- Name: oc_dav_absence; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_dav_absence (
    id integer NOT NULL,
    user_id character varying(64) NOT NULL,
    first_day character varying(10) NOT NULL,
    last_day character varying(10) NOT NULL,
    status character varying(100) NOT NULL,
    message text NOT NULL,
    replacement_user_id character varying(64) DEFAULT ''::character varying,
    replacement_user_display_name character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.oc_dav_absence OWNER TO oc_x79;

--
-- Name: oc_dav_absence_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_dav_absence_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_dav_absence_id_seq OWNER TO oc_x79;

--
-- Name: oc_dav_absence_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_dav_absence_id_seq OWNED BY public.oc_dav_absence.id;


--
-- Name: oc_dav_cal_proxy; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_dav_cal_proxy (
    id bigint NOT NULL,
    owner_id character varying(64) NOT NULL,
    proxy_id character varying(64) NOT NULL,
    permissions integer
);


ALTER TABLE public.oc_dav_cal_proxy OWNER TO oc_x79;

--
-- Name: oc_dav_cal_proxy_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_dav_cal_proxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_dav_cal_proxy_id_seq OWNER TO oc_x79;

--
-- Name: oc_dav_cal_proxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_dav_cal_proxy_id_seq OWNED BY public.oc_dav_cal_proxy.id;


--
-- Name: oc_dav_shares; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_dav_shares (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    access smallint,
    resourceid bigint NOT NULL,
    publicuri character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_dav_shares OWNER TO oc_x79;

--
-- Name: oc_dav_shares_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_dav_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_dav_shares_id_seq OWNER TO oc_x79;

--
-- Name: oc_dav_shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_dav_shares_id_seq OWNED BY public.oc_dav_shares.id;


--
-- Name: oc_direct_edit; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_direct_edit (
    id bigint NOT NULL,
    editor_id character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    file_id bigint NOT NULL,
    user_id character varying(64) DEFAULT NULL::character varying,
    share_id bigint,
    "timestamp" bigint NOT NULL,
    accessed boolean DEFAULT false,
    file_path character varying(4000) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_direct_edit OWNER TO oc_x79;

--
-- Name: oc_direct_edit_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_direct_edit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_direct_edit_id_seq OWNER TO oc_x79;

--
-- Name: oc_direct_edit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_direct_edit_id_seq OWNED BY public.oc_direct_edit.id;


--
-- Name: oc_directlink; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_directlink (
    id bigint NOT NULL,
    user_id character varying(64) DEFAULT NULL::character varying,
    file_id bigint NOT NULL,
    token character varying(60) DEFAULT NULL::character varying,
    expiration bigint NOT NULL
);


ALTER TABLE public.oc_directlink OWNER TO oc_x79;

--
-- Name: oc_directlink_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_directlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_directlink_id_seq OWNER TO oc_x79;

--
-- Name: oc_directlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_directlink_id_seq OWNED BY public.oc_directlink.id;


--
-- Name: oc_ex_apps; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_apps (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    version character varying(32) NOT NULL,
    name character varying(64) NOT NULL,
    daemon_config_name character varying(64) DEFAULT '0'::character varying NOT NULL,
    port smallint NOT NULL,
    secret character varying(256) NOT NULL,
    status json NOT NULL,
    enabled smallint DEFAULT 0 NOT NULL,
    created_time bigint NOT NULL
);


ALTER TABLE public.oc_ex_apps OWNER TO oc_x79;

--
-- Name: oc_ex_apps_daemons; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_apps_daemons (
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    display_name character varying(255) NOT NULL,
    accepts_deploy_id character varying(64) NOT NULL,
    protocol character varying(32) NOT NULL,
    host character varying(255) NOT NULL,
    deploy_config json NOT NULL
);


ALTER TABLE public.oc_ex_apps_daemons OWNER TO oc_x79;

--
-- Name: oc_ex_apps_daemons_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_apps_daemons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_apps_daemons_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_apps_daemons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_apps_daemons_id_seq OWNED BY public.oc_ex_apps_daemons.id;


--
-- Name: oc_ex_apps_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_apps_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_apps_id_seq OWNED BY public.oc_ex_apps.id;


--
-- Name: oc_ex_apps_routes; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_apps_routes (
    id integer NOT NULL,
    appid character varying(32) NOT NULL,
    url character varying(512) NOT NULL,
    verb character varying(64) NOT NULL,
    access_level integer DEFAULT 0 NOT NULL,
    headers_to_exclude character varying(512) DEFAULT NULL::character varying,
    bruteforce_protection character varying(512) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_ex_apps_routes OWNER TO oc_x79;

--
-- Name: oc_ex_apps_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_apps_routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_apps_routes_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_apps_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_apps_routes_id_seq OWNED BY public.oc_ex_apps_routes.id;


--
-- Name: oc_ex_deploy_options; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_deploy_options (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    type character varying(32) NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.oc_ex_deploy_options OWNER TO oc_x79;

--
-- Name: oc_ex_deploy_options_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_deploy_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_deploy_options_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_deploy_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_deploy_options_id_seq OWNED BY public.oc_ex_deploy_options.id;


--
-- Name: oc_ex_event_handlers; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_event_handlers (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    event_type character varying(32) NOT NULL,
    event_subtypes json NOT NULL,
    action_handler character varying(410) NOT NULL
);


ALTER TABLE public.oc_ex_event_handlers OWNER TO oc_x79;

--
-- Name: oc_ex_event_handlers_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_event_handlers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_event_handlers_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_event_handlers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_event_handlers_id_seq OWNED BY public.oc_ex_event_handlers.id;


--
-- Name: oc_ex_occ_commands; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_occ_commands (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    name character varying(64) NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    hidden smallint DEFAULT 0 NOT NULL,
    arguments json NOT NULL,
    options json NOT NULL,
    usages json NOT NULL,
    execute_handler character varying(410) NOT NULL
);


ALTER TABLE public.oc_ex_occ_commands OWNER TO oc_x79;

--
-- Name: oc_ex_occ_commands_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_occ_commands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_occ_commands_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_occ_commands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_occ_commands_id_seq OWNED BY public.oc_ex_occ_commands.id;


--
-- Name: oc_ex_settings_forms; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_settings_forms (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    formid character varying(64) NOT NULL,
    scheme json NOT NULL
);


ALTER TABLE public.oc_ex_settings_forms OWNER TO oc_x79;

--
-- Name: oc_ex_settings_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_settings_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_settings_forms_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_settings_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_settings_forms_id_seq OWNED BY public.oc_ex_settings_forms.id;


--
-- Name: oc_ex_speech_to_text; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_speech_to_text (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    name character varying(64) NOT NULL,
    display_name character varying(64) NOT NULL,
    action_handler character varying(410) NOT NULL
);


ALTER TABLE public.oc_ex_speech_to_text OWNER TO oc_x79;

--
-- Name: oc_ex_speech_to_text_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_speech_to_text_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_speech_to_text_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_speech_to_text_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_speech_to_text_id_seq OWNED BY public.oc_ex_speech_to_text.id;


--
-- Name: oc_ex_speech_to_text_q; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_speech_to_text_q (
    id bigint NOT NULL,
    result text DEFAULT ''::text NOT NULL,
    error character varying(1024) DEFAULT ''::character varying NOT NULL,
    finished smallint DEFAULT 0 NOT NULL,
    created_time bigint NOT NULL
);


ALTER TABLE public.oc_ex_speech_to_text_q OWNER TO oc_x79;

--
-- Name: oc_ex_speech_to_text_q_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_speech_to_text_q_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_speech_to_text_q_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_speech_to_text_q_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_speech_to_text_q_id_seq OWNED BY public.oc_ex_speech_to_text_q.id;


--
-- Name: oc_ex_task_processing; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_task_processing (
    id bigint NOT NULL,
    app_id character varying(32) NOT NULL,
    name character varying(255) NOT NULL,
    display_name character varying(255) NOT NULL,
    task_type character varying(255) NOT NULL,
    custom_task_type text,
    provider text NOT NULL
);


ALTER TABLE public.oc_ex_task_processing OWNER TO oc_x79;

--
-- Name: oc_ex_task_processing_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_task_processing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_task_processing_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_task_processing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_task_processing_id_seq OWNED BY public.oc_ex_task_processing.id;


--
-- Name: oc_ex_text_processing; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_text_processing (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    name character varying(64) NOT NULL,
    display_name character varying(64) NOT NULL,
    action_handler character varying(410) NOT NULL,
    task_type character varying(64) NOT NULL
);


ALTER TABLE public.oc_ex_text_processing OWNER TO oc_x79;

--
-- Name: oc_ex_text_processing_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_text_processing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_text_processing_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_text_processing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_text_processing_id_seq OWNED BY public.oc_ex_text_processing.id;


--
-- Name: oc_ex_text_processing_q; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_text_processing_q (
    id bigint NOT NULL,
    result text DEFAULT ''::text NOT NULL,
    error character varying(1024) DEFAULT ''::character varying NOT NULL,
    finished smallint DEFAULT 0 NOT NULL,
    created_time bigint NOT NULL
);


ALTER TABLE public.oc_ex_text_processing_q OWNER TO oc_x79;

--
-- Name: oc_ex_text_processing_q_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_text_processing_q_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_text_processing_q_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_text_processing_q_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_text_processing_q_id_seq OWNED BY public.oc_ex_text_processing_q.id;


--
-- Name: oc_ex_translation; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_translation (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    name character varying(64) NOT NULL,
    display_name character varying(64) NOT NULL,
    from_languages json NOT NULL,
    to_languages json NOT NULL,
    action_handler character varying(410) NOT NULL,
    action_detect_lang character varying(410) DEFAULT ''::character varying
);


ALTER TABLE public.oc_ex_translation OWNER TO oc_x79;

--
-- Name: oc_ex_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_translation_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_translation_id_seq OWNED BY public.oc_ex_translation.id;


--
-- Name: oc_ex_translation_q; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_translation_q (
    id bigint NOT NULL,
    result text DEFAULT ''::text NOT NULL,
    error character varying(1024) DEFAULT ''::character varying NOT NULL,
    finished smallint DEFAULT 0 NOT NULL,
    created_time bigint NOT NULL
);


ALTER TABLE public.oc_ex_translation_q OWNER TO oc_x79;

--
-- Name: oc_ex_translation_q_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_translation_q_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_translation_q_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_translation_q_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_translation_q_id_seq OWNED BY public.oc_ex_translation_q.id;


--
-- Name: oc_ex_ui_files_actions; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_ui_files_actions (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    name character varying(64) NOT NULL,
    display_name character varying(64) NOT NULL,
    mime text DEFAULT 'file'::text NOT NULL,
    permissions character varying(255) NOT NULL,
    "order" bigint DEFAULT 0 NOT NULL,
    icon character varying(255) DEFAULT ''::character varying,
    action_handler character varying(64) NOT NULL,
    version character varying(64) DEFAULT '1.0'::character varying NOT NULL
);


ALTER TABLE public.oc_ex_ui_files_actions OWNER TO oc_x79;

--
-- Name: oc_ex_ui_files_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_ui_files_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_ui_files_actions_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_ui_files_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_ui_files_actions_id_seq OWNED BY public.oc_ex_ui_files_actions.id;


--
-- Name: oc_ex_ui_scripts; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_ui_scripts (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    type character varying(16) NOT NULL,
    name character varying(32) NOT NULL,
    path character varying(410) NOT NULL,
    after_app_id character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_ex_ui_scripts OWNER TO oc_x79;

--
-- Name: oc_ex_ui_scripts_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_ui_scripts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_ui_scripts_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_ui_scripts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_ui_scripts_id_seq OWNED BY public.oc_ex_ui_scripts.id;


--
-- Name: oc_ex_ui_states; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_ui_states (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    type character varying(16) NOT NULL,
    name character varying(32) NOT NULL,
    key character varying(64) NOT NULL,
    value json NOT NULL
);


ALTER TABLE public.oc_ex_ui_states OWNER TO oc_x79;

--
-- Name: oc_ex_ui_states_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_ui_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_ui_states_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_ui_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_ui_states_id_seq OWNED BY public.oc_ex_ui_states.id;


--
-- Name: oc_ex_ui_styles; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_ui_styles (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    type character varying(16) NOT NULL,
    name character varying(32) NOT NULL,
    path character varying(410) NOT NULL
);


ALTER TABLE public.oc_ex_ui_styles OWNER TO oc_x79;

--
-- Name: oc_ex_ui_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_ui_styles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_ui_styles_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_ui_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_ui_styles_id_seq OWNED BY public.oc_ex_ui_styles.id;


--
-- Name: oc_ex_ui_top_menu; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ex_ui_top_menu (
    id bigint NOT NULL,
    appid character varying(32) NOT NULL,
    name character varying(32) NOT NULL,
    display_name character varying(32) NOT NULL,
    icon character varying(255) DEFAULT ''::character varying,
    admin_required smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_ex_ui_top_menu OWNER TO oc_x79;

--
-- Name: oc_ex_ui_top_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ex_ui_top_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ex_ui_top_menu_id_seq OWNER TO oc_x79;

--
-- Name: oc_ex_ui_top_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ex_ui_top_menu_id_seq OWNED BY public.oc_ex_ui_top_menu.id;


--
-- Name: oc_federated_reshares; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_federated_reshares (
    share_id bigint NOT NULL,
    remote_id character varying(255) DEFAULT ''::character varying
);


ALTER TABLE public.oc_federated_reshares OWNER TO oc_x79;

--
-- Name: oc_file_locks; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_file_locks (
    id bigint NOT NULL,
    lock integer DEFAULT 0 NOT NULL,
    key character varying(64) NOT NULL,
    ttl integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.oc_file_locks OWNER TO oc_x79;

--
-- Name: oc_file_locks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_file_locks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_file_locks_id_seq OWNER TO oc_x79;

--
-- Name: oc_file_locks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_file_locks_id_seq OWNED BY public.oc_file_locks.id;


--
-- Name: oc_filecache; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_filecache (
    fileid bigint NOT NULL,
    storage bigint DEFAULT 0 NOT NULL,
    path character varying(4000) DEFAULT NULL::character varying,
    path_hash character varying(32) DEFAULT ''::character varying NOT NULL,
    parent bigint DEFAULT 0 NOT NULL,
    name character varying(250) DEFAULT NULL::character varying,
    mimetype bigint DEFAULT 0 NOT NULL,
    mimepart bigint DEFAULT 0 NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    mtime bigint DEFAULT 0 NOT NULL,
    storage_mtime bigint DEFAULT 0 NOT NULL,
    encrypted integer DEFAULT 0 NOT NULL,
    unencrypted_size bigint DEFAULT 0 NOT NULL,
    etag character varying(40) DEFAULT NULL::character varying,
    permissions integer DEFAULT 0,
    checksum character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_filecache OWNER TO oc_x79;

--
-- Name: oc_filecache_extended; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_filecache_extended (
    fileid bigint NOT NULL,
    metadata_etag character varying(40) DEFAULT NULL::character varying,
    creation_time bigint DEFAULT 0 NOT NULL,
    upload_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_filecache_extended OWNER TO oc_x79;

--
-- Name: oc_filecache_fileid_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_filecache_fileid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_filecache_fileid_seq OWNER TO oc_x79;

--
-- Name: oc_filecache_fileid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_filecache_fileid_seq OWNED BY public.oc_filecache.fileid;


--
-- Name: oc_files_metadata; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_files_metadata (
    id bigint NOT NULL,
    file_id bigint NOT NULL,
    "json" text NOT NULL,
    sync_token character varying(15) NOT NULL,
    last_update timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.oc_files_metadata OWNER TO oc_x79;

--
-- Name: oc_files_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_files_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_files_metadata_id_seq OWNER TO oc_x79;

--
-- Name: oc_files_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_files_metadata_id_seq OWNED BY public.oc_files_metadata.id;


--
-- Name: oc_files_metadata_index; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_files_metadata_index (
    id bigint NOT NULL,
    file_id bigint NOT NULL,
    meta_key character varying(31) DEFAULT NULL::character varying,
    meta_value_string character varying(63) DEFAULT NULL::character varying,
    meta_value_int bigint
);


ALTER TABLE public.oc_files_metadata_index OWNER TO oc_x79;

--
-- Name: oc_files_metadata_index_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_files_metadata_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_files_metadata_index_id_seq OWNER TO oc_x79;

--
-- Name: oc_files_metadata_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_files_metadata_index_id_seq OWNED BY public.oc_files_metadata_index.id;


--
-- Name: oc_files_reminders; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_files_reminders (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    file_id bigint NOT NULL,
    due_date timestamp(0) without time zone NOT NULL,
    updated_at timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone NOT NULL,
    notified boolean DEFAULT false
);


ALTER TABLE public.oc_files_reminders OWNER TO oc_x79;

--
-- Name: oc_files_reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_files_reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_files_reminders_id_seq OWNER TO oc_x79;

--
-- Name: oc_files_reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_files_reminders_id_seq OWNED BY public.oc_files_reminders.id;


--
-- Name: oc_files_trash; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_files_trash (
    auto_id bigint NOT NULL,
    id character varying(250) DEFAULT ''::character varying NOT NULL,
    "user" character varying(64) DEFAULT ''::character varying NOT NULL,
    "timestamp" character varying(12) DEFAULT ''::character varying NOT NULL,
    location character varying(512) DEFAULT ''::character varying NOT NULL,
    type character varying(4) DEFAULT NULL::character varying,
    mime character varying(255) DEFAULT NULL::character varying,
    deleted_by character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_files_trash OWNER TO oc_x79;

--
-- Name: oc_files_trash_auto_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_files_trash_auto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_files_trash_auto_id_seq OWNER TO oc_x79;

--
-- Name: oc_files_trash_auto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_files_trash_auto_id_seq OWNED BY public.oc_files_trash.auto_id;


--
-- Name: oc_files_versions; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_files_versions (
    id bigint NOT NULL,
    file_id bigint NOT NULL,
    "timestamp" bigint NOT NULL,
    size bigint NOT NULL,
    mimetype bigint NOT NULL,
    metadata json NOT NULL
);


ALTER TABLE public.oc_files_versions OWNER TO oc_x79;

--
-- Name: oc_files_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_files_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_files_versions_id_seq OWNER TO oc_x79;

--
-- Name: oc_files_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_files_versions_id_seq OWNED BY public.oc_files_versions.id;


--
-- Name: oc_flow_checks; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_flow_checks (
    id integer NOT NULL,
    class character varying(256) DEFAULT ''::character varying NOT NULL,
    operator character varying(16) DEFAULT ''::character varying NOT NULL,
    value text,
    hash character varying(32) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_flow_checks OWNER TO oc_x79;

--
-- Name: oc_flow_checks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_flow_checks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_flow_checks_id_seq OWNER TO oc_x79;

--
-- Name: oc_flow_checks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_flow_checks_id_seq OWNED BY public.oc_flow_checks.id;


--
-- Name: oc_flow_operations; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_flow_operations (
    id integer NOT NULL,
    class character varying(256) DEFAULT ''::character varying NOT NULL,
    name character varying(256) DEFAULT ''::character varying,
    checks text,
    operation text,
    entity character varying(256) DEFAULT 'OCA\WorkflowEngine\Entity\File'::character varying NOT NULL,
    events text DEFAULT '[]'::text NOT NULL
);


ALTER TABLE public.oc_flow_operations OWNER TO oc_x79;

--
-- Name: oc_flow_operations_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_flow_operations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_flow_operations_id_seq OWNER TO oc_x79;

--
-- Name: oc_flow_operations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_flow_operations_id_seq OWNED BY public.oc_flow_operations.id;


--
-- Name: oc_flow_operations_scope; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_flow_operations_scope (
    id bigint NOT NULL,
    operation_id integer DEFAULT 0 NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    value character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.oc_flow_operations_scope OWNER TO oc_x79;

--
-- Name: oc_flow_operations_scope_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_flow_operations_scope_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_flow_operations_scope_id_seq OWNER TO oc_x79;

--
-- Name: oc_flow_operations_scope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_flow_operations_scope_id_seq OWNED BY public.oc_flow_operations_scope.id;


--
-- Name: oc_group_admin; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_group_admin (
    gid character varying(64) DEFAULT ''::character varying NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_group_admin OWNER TO oc_x79;

--
-- Name: oc_group_user; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_group_user (
    gid character varying(64) DEFAULT ''::character varying NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_group_user OWNER TO oc_x79;

--
-- Name: oc_groups; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_groups (
    gid character varying(64) DEFAULT ''::character varying NOT NULL,
    displayname character varying(255) DEFAULT 'name'::character varying NOT NULL
);


ALTER TABLE public.oc_groups OWNER TO oc_x79;

--
-- Name: oc_jobs; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_jobs (
    id bigint NOT NULL,
    class character varying(255) DEFAULT ''::character varying NOT NULL,
    argument character varying(4000) DEFAULT ''::character varying NOT NULL,
    last_run integer DEFAULT 0,
    last_checked integer DEFAULT 0,
    reserved_at integer DEFAULT 0,
    execution_duration integer DEFAULT 0,
    argument_hash character varying(64) DEFAULT NULL::character varying,
    time_sensitive smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_jobs OWNER TO oc_x79;

--
-- Name: oc_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_jobs_id_seq OWNER TO oc_x79;

--
-- Name: oc_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_jobs_id_seq OWNED BY public.oc_jobs.id;


--
-- Name: oc_known_users; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_known_users (
    id bigint NOT NULL,
    known_to character varying(255) NOT NULL,
    known_user character varying(255) NOT NULL
);


ALTER TABLE public.oc_known_users OWNER TO oc_x79;

--
-- Name: oc_known_users_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_known_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_known_users_id_seq OWNER TO oc_x79;

--
-- Name: oc_known_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_known_users_id_seq OWNED BY public.oc_known_users.id;


--
-- Name: oc_login_flow_v2; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_login_flow_v2 (
    id bigint NOT NULL,
    "timestamp" bigint NOT NULL,
    started smallint DEFAULT 0 NOT NULL,
    poll_token character varying(255) NOT NULL,
    login_token character varying(255) NOT NULL,
    public_key text NOT NULL,
    private_key text NOT NULL,
    client_name character varying(255) NOT NULL,
    login_name character varying(255) DEFAULT NULL::character varying,
    server character varying(255) DEFAULT NULL::character varying,
    app_password character varying(1024) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_login_flow_v2 OWNER TO oc_x79;

--
-- Name: oc_login_flow_v2_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_login_flow_v2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_login_flow_v2_id_seq OWNER TO oc_x79;

--
-- Name: oc_login_flow_v2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_login_flow_v2_id_seq OWNED BY public.oc_login_flow_v2.id;


--
-- Name: oc_mail_accounts; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_accounts (
    id integer NOT NULL,
    user_id character varying(64) NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    inbound_host character varying(64) DEFAULT ''::character varying NOT NULL,
    inbound_port character varying(6) DEFAULT ''::character varying NOT NULL,
    inbound_ssl_mode character varying(10) DEFAULT ''::character varying NOT NULL,
    inbound_user character varying(64) DEFAULT ''::character varying NOT NULL,
    inbound_password character varying(2048) DEFAULT NULL::character varying,
    outbound_host character varying(64) DEFAULT NULL::character varying,
    outbound_port character varying(6) DEFAULT NULL::character varying,
    outbound_ssl_mode character varying(10) DEFAULT NULL::character varying,
    outbound_user character varying(64) DEFAULT NULL::character varying,
    outbound_password character varying(2048) DEFAULT NULL::character varying,
    signature text DEFAULT ''::text,
    last_mailbox_sync integer DEFAULT 0 NOT NULL,
    editor_mode character varying(64) DEFAULT 'plaintext'::character varying NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    show_subscribed_only boolean DEFAULT false,
    personal_namespace character varying(255) DEFAULT NULL::character varying,
    drafts_mailbox_id integer,
    sent_mailbox_id integer,
    trash_mailbox_id integer,
    sieve_enabled boolean DEFAULT false,
    sieve_host character varying(64) DEFAULT NULL::character varying,
    sieve_port character varying(6) DEFAULT NULL::character varying,
    sieve_ssl_mode character varying(10) DEFAULT NULL::character varying,
    sieve_user character varying(64) DEFAULT NULL::character varying,
    sieve_password character varying(2048) DEFAULT NULL::character varying,
    provisioning_id integer,
    signature_above_quote boolean DEFAULT false,
    signature_mode smallint DEFAULT 0 NOT NULL,
    auth_method character varying(255) DEFAULT 'password'::character varying NOT NULL,
    archive_mailbox_id integer,
    oauth_refresh_token character varying(3000) DEFAULT NULL::character varying,
    oauth_token_ttl integer,
    oauth_access_token text,
    smime_certificate_id integer,
    junk_mailbox_id integer,
    quota_percentage integer,
    trash_retention_days integer,
    snooze_mailbox_id integer,
    search_body boolean DEFAULT false,
    ooo_follows_system boolean DEFAULT false,
    debug boolean DEFAULT false
);


ALTER TABLE public.oc_mail_accounts OWNER TO oc_x79;

--
-- Name: oc_mail_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_accounts_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_accounts_id_seq OWNED BY public.oc_mail_accounts.id;


--
-- Name: oc_mail_aliases; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_aliases (
    id integer NOT NULL,
    account_id integer DEFAULT 0 NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    alias character varying(255) NOT NULL,
    signature text DEFAULT ''::text,
    signature_mode smallint DEFAULT 0 NOT NULL,
    smime_certificate_id integer
);


ALTER TABLE public.oc_mail_aliases OWNER TO oc_x79;

--
-- Name: oc_mail_aliases_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_aliases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_aliases_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_aliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_aliases_id_seq OWNED BY public.oc_mail_aliases.id;


--
-- Name: oc_mail_attachments; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_attachments (
    id integer NOT NULL,
    local_message_id integer,
    user_id character varying(64) DEFAULT ''::character varying NOT NULL,
    file_name character varying(255) DEFAULT ''::character varying NOT NULL,
    created_at integer DEFAULT 0 NOT NULL,
    mime_type character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_mail_attachments OWNER TO oc_x79;

--
-- Name: oc_mail_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_attachments_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_attachments_id_seq OWNED BY public.oc_mail_attachments.id;


--
-- Name: oc_mail_coll_addresses; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_coll_addresses (
    id integer NOT NULL,
    user_id character varying(64) DEFAULT ''::character varying NOT NULL,
    email character varying(255) NOT NULL,
    display_name character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_mail_coll_addresses OWNER TO oc_x79;

--
-- Name: oc_mail_coll_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_coll_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_coll_addresses_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_coll_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_coll_addresses_id_seq OWNED BY public.oc_mail_coll_addresses.id;


--
-- Name: oc_mail_internal_address; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_internal_address (
    id integer NOT NULL,
    address character varying(255) NOT NULL,
    type character varying(64) NOT NULL,
    user_id character varying(64) NOT NULL
);


ALTER TABLE public.oc_mail_internal_address OWNER TO oc_x79;

--
-- Name: oc_mail_internal_address_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_internal_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_internal_address_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_internal_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_internal_address_id_seq OWNED BY public.oc_mail_internal_address.id;


--
-- Name: oc_mail_local_messages; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_local_messages (
    id integer NOT NULL,
    type integer NOT NULL,
    account_id integer NOT NULL,
    alias_id integer,
    send_at integer,
    subject text NOT NULL,
    html boolean DEFAULT false,
    in_reply_to_message_id text,
    failed boolean DEFAULT false,
    editor_body text,
    updated_at integer,
    smime_sign boolean DEFAULT false,
    smime_certificate_id integer,
    smime_encrypt boolean DEFAULT false,
    status integer DEFAULT 0,
    raw text,
    request_mdn boolean DEFAULT false,
    pgp_mime boolean DEFAULT false,
    body_plain text,
    body_html text
);


ALTER TABLE public.oc_mail_local_messages OWNER TO oc_x79;

--
-- Name: oc_mail_local_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_local_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_local_messages_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_local_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_local_messages_id_seq OWNED BY public.oc_mail_local_messages.id;


--
-- Name: oc_mail_mailboxes; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_mailboxes (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    account_id integer NOT NULL,
    attributes character varying(255) DEFAULT '[]'::character varying NOT NULL,
    delimiter character varying(1) DEFAULT NULL::character varying,
    messages integer NOT NULL,
    unseen integer NOT NULL,
    selectable boolean DEFAULT false,
    special_use character varying(255) DEFAULT '[]'::character varying NOT NULL,
    sync_new_lock integer,
    sync_changed_lock integer,
    sync_vanished_lock integer,
    sync_new_token character varying(255) DEFAULT NULL::character varying,
    sync_changed_token character varying(255) DEFAULT NULL::character varying,
    sync_vanished_token character varying(255) DEFAULT NULL::character varying,
    sync_in_background boolean DEFAULT false,
    my_acls character varying(32) DEFAULT NULL::character varying,
    shared boolean DEFAULT false,
    name_hash character varying(255) NOT NULL
);


ALTER TABLE public.oc_mail_mailboxes OWNER TO oc_x79;

--
-- Name: oc_mail_mailboxes_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_mailboxes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_mailboxes_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_mailboxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_mailboxes_id_seq OWNED BY public.oc_mail_mailboxes.id;


--
-- Name: oc_mail_message_tags; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_message_tags (
    id integer NOT NULL,
    imap_message_id character varying(1023) NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.oc_mail_message_tags OWNER TO oc_x79;

--
-- Name: oc_mail_message_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_message_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_message_tags_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_message_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_message_tags_id_seq OWNED BY public.oc_mail_message_tags.id;


--
-- Name: oc_mail_messages; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_messages (
    id bigint NOT NULL,
    uid integer NOT NULL,
    message_id character varying(1023) DEFAULT NULL::character varying,
    mailbox_id integer NOT NULL,
    subject character varying(255) DEFAULT ''::character varying NOT NULL,
    sent_at integer NOT NULL,
    flag_answered boolean DEFAULT false,
    flag_deleted boolean DEFAULT false,
    flag_draft boolean DEFAULT false,
    flag_flagged boolean DEFAULT false,
    flag_seen boolean DEFAULT false,
    flag_forwarded boolean DEFAULT false,
    flag_junk boolean DEFAULT false,
    flag_notjunk boolean DEFAULT false,
    flag_attachments boolean DEFAULT false,
    flag_important boolean DEFAULT false,
    structure_analyzed boolean DEFAULT false,
    preview_text character varying(255) DEFAULT NULL::character varying,
    updated_at integer,
    "references" text,
    in_reply_to character varying(1023) DEFAULT NULL::character varying,
    thread_root_id character varying(1023) DEFAULT NULL::character varying,
    flag_mdnsent boolean DEFAULT false,
    imip_message boolean DEFAULT false,
    imip_processed boolean DEFAULT false,
    imip_error boolean DEFAULT false,
    encrypted boolean DEFAULT false,
    mentions_me boolean DEFAULT false,
    summary character varying(1024) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_mail_messages OWNER TO oc_x79;

--
-- Name: oc_mail_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_messages_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_messages_id_seq OWNED BY public.oc_mail_messages.id;


--
-- Name: oc_mail_messages_retention; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_messages_retention (
    id integer NOT NULL,
    known_since integer NOT NULL,
    mailbox_id integer NOT NULL,
    uid integer NOT NULL
);


ALTER TABLE public.oc_mail_messages_retention OWNER TO oc_x79;

--
-- Name: oc_mail_messages_retention_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_messages_retention_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_messages_retention_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_messages_retention_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_messages_retention_id_seq OWNED BY public.oc_mail_messages_retention.id;


--
-- Name: oc_mail_messages_snoozed; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_messages_snoozed (
    id integer NOT NULL,
    snoozed_until integer NOT NULL,
    src_mailbox_id integer,
    mailbox_id integer NOT NULL,
    uid integer NOT NULL
);


ALTER TABLE public.oc_mail_messages_snoozed OWNER TO oc_x79;

--
-- Name: oc_mail_messages_snoozed_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_messages_snoozed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_messages_snoozed_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_messages_snoozed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_messages_snoozed_id_seq OWNED BY public.oc_mail_messages_snoozed.id;


--
-- Name: oc_mail_provisionings; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_provisionings (
    id integer NOT NULL,
    provisioning_domain character varying(63) DEFAULT ''::character varying NOT NULL,
    email_template character varying(255) DEFAULT ''::character varying NOT NULL,
    imap_user character varying(128) DEFAULT ''::character varying NOT NULL,
    imap_host character varying(255) DEFAULT ''::character varying NOT NULL,
    imap_port smallint NOT NULL,
    imap_ssl_mode character varying(64) DEFAULT ''::character varying NOT NULL,
    smtp_user character varying(128) DEFAULT ''::character varying NOT NULL,
    smtp_host character varying(255) DEFAULT ''::character varying NOT NULL,
    smtp_port smallint NOT NULL,
    smtp_ssl_mode character varying(64) DEFAULT ''::character varying NOT NULL,
    sieve_enabled boolean DEFAULT false,
    sieve_user character varying(128) DEFAULT NULL::character varying,
    sieve_host character varying(128) DEFAULT NULL::character varying,
    sieve_port smallint,
    sieve_ssl_mode character varying(64) DEFAULT NULL::character varying,
    ldap_aliases_provisioning boolean DEFAULT false,
    ldap_aliases_attribute character varying(255) DEFAULT ''::character varying,
    master_password_enabled boolean DEFAULT false,
    master_password character varying(256) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_mail_provisionings OWNER TO oc_x79;

--
-- Name: oc_mail_provisionings_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_provisionings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_provisionings_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_provisionings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_provisionings_id_seq OWNED BY public.oc_mail_provisionings.id;


--
-- Name: oc_mail_recipients; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_recipients (
    id bigint NOT NULL,
    local_message_id integer,
    message_id integer,
    type integer NOT NULL,
    label character varying(255) DEFAULT NULL::character varying,
    email character varying(255) NOT NULL
);


ALTER TABLE public.oc_mail_recipients OWNER TO oc_x79;

--
-- Name: oc_mail_recipients_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_recipients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_recipients_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_recipients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_recipients_id_seq OWNED BY public.oc_mail_recipients.id;


--
-- Name: oc_mail_smime_certificates; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_smime_certificates (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    email_address character varying(255) NOT NULL,
    certificate text NOT NULL,
    private_key text
);


ALTER TABLE public.oc_mail_smime_certificates OWNER TO oc_x79;

--
-- Name: oc_mail_smime_certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_smime_certificates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_smime_certificates_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_smime_certificates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_smime_certificates_id_seq OWNED BY public.oc_mail_smime_certificates.id;


--
-- Name: oc_mail_tags; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_tags (
    id integer NOT NULL,
    user_id character varying(64) NOT NULL,
    imap_label character varying(64) NOT NULL,
    display_name character varying(128) NOT NULL,
    color character varying(9) DEFAULT '#fff'::character varying,
    is_default_tag boolean DEFAULT false
);


ALTER TABLE public.oc_mail_tags OWNER TO oc_x79;

--
-- Name: oc_mail_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_tags_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_tags_id_seq OWNED BY public.oc_mail_tags.id;


--
-- Name: oc_mail_trusted_senders; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mail_trusted_senders (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    user_id character varying(64) NOT NULL,
    type character varying(255) DEFAULT 'individual'::character varying NOT NULL
);


ALTER TABLE public.oc_mail_trusted_senders OWNER TO oc_x79;

--
-- Name: oc_mail_trusted_senders_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mail_trusted_senders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mail_trusted_senders_id_seq OWNER TO oc_x79;

--
-- Name: oc_mail_trusted_senders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mail_trusted_senders_id_seq OWNED BY public.oc_mail_trusted_senders.id;


--
-- Name: oc_migrations; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_migrations (
    app character varying(255) NOT NULL,
    version character varying(255) NOT NULL
);


ALTER TABLE public.oc_migrations OWNER TO oc_x79;

--
-- Name: oc_mimetypes; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mimetypes (
    id bigint NOT NULL,
    mimetype character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_mimetypes OWNER TO oc_x79;

--
-- Name: oc_mimetypes_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mimetypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mimetypes_id_seq OWNER TO oc_x79;

--
-- Name: oc_mimetypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mimetypes_id_seq OWNED BY public.oc_mimetypes.id;


--
-- Name: oc_mounts; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_mounts (
    id bigint NOT NULL,
    storage_id bigint NOT NULL,
    root_id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    mount_point character varying(4000) NOT NULL,
    mount_id bigint,
    mount_provider_class character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_mounts OWNER TO oc_x79;

--
-- Name: oc_mounts_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_mounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_mounts_id_seq OWNER TO oc_x79;

--
-- Name: oc_mounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_mounts_id_seq OWNED BY public.oc_mounts.id;


--
-- Name: oc_notes_meta; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_notes_meta (
    id integer NOT NULL,
    file_id integer NOT NULL,
    user_id character varying(64) NOT NULL,
    last_update integer NOT NULL,
    etag character varying(32) NOT NULL,
    content_etag character varying(32) NOT NULL,
    file_etag character varying(40) NOT NULL
);


ALTER TABLE public.oc_notes_meta OWNER TO oc_x79;

--
-- Name: oc_notes_meta_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_notes_meta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_notes_meta_id_seq OWNER TO oc_x79;

--
-- Name: oc_notes_meta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_notes_meta_id_seq OWNED BY public.oc_notes_meta.id;


--
-- Name: oc_notifications; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_notifications (
    notification_id integer NOT NULL,
    app character varying(32) NOT NULL,
    "user" character varying(64) NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    object_type character varying(64) NOT NULL,
    object_id character varying(64) NOT NULL,
    subject character varying(64) NOT NULL,
    subject_parameters text,
    message character varying(64) DEFAULT NULL::character varying,
    message_parameters text,
    link character varying(4000) DEFAULT NULL::character varying,
    icon character varying(4000) DEFAULT NULL::character varying,
    actions text
);


ALTER TABLE public.oc_notifications OWNER TO oc_x79;

--
-- Name: oc_notifications_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_notifications_notification_id_seq OWNER TO oc_x79;

--
-- Name: oc_notifications_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_notifications_notification_id_seq OWNED BY public.oc_notifications.notification_id;


--
-- Name: oc_notifications_pushhash; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_notifications_pushhash (
    id integer NOT NULL,
    uid character varying(64) NOT NULL,
    token integer DEFAULT 0 NOT NULL,
    deviceidentifier character varying(128) NOT NULL,
    devicepublickey character varying(512) NOT NULL,
    devicepublickeyhash character varying(128) NOT NULL,
    pushtokenhash character varying(128) NOT NULL,
    proxyserver character varying(256) NOT NULL,
    apptype character varying(32) DEFAULT 'unknown'::character varying NOT NULL
);


ALTER TABLE public.oc_notifications_pushhash OWNER TO oc_x79;

--
-- Name: oc_notifications_pushhash_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_notifications_pushhash_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_notifications_pushhash_id_seq OWNER TO oc_x79;

--
-- Name: oc_notifications_pushhash_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_notifications_pushhash_id_seq OWNED BY public.oc_notifications_pushhash.id;


--
-- Name: oc_notifications_settings; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_notifications_settings (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    batch_time integer DEFAULT 0 NOT NULL,
    last_send_id bigint DEFAULT 0 NOT NULL,
    next_send_time integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_notifications_settings OWNER TO oc_x79;

--
-- Name: oc_notifications_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_notifications_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_notifications_settings_id_seq OWNER TO oc_x79;

--
-- Name: oc_notifications_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_notifications_settings_id_seq OWNED BY public.oc_notifications_settings.id;


--
-- Name: oc_oauth2_access_tokens; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_oauth2_access_tokens (
    id integer NOT NULL,
    token_id integer NOT NULL,
    client_id integer NOT NULL,
    hashed_code character varying(128) NOT NULL,
    encrypted_token character varying(786) NOT NULL,
    code_created_at bigint DEFAULT 0 NOT NULL,
    token_count bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_oauth2_access_tokens OWNER TO oc_x79;

--
-- Name: oc_oauth2_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_oauth2_access_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_oauth2_access_tokens_id_seq OWNER TO oc_x79;

--
-- Name: oc_oauth2_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_oauth2_access_tokens_id_seq OWNED BY public.oc_oauth2_access_tokens.id;


--
-- Name: oc_oauth2_clients; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_oauth2_clients (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    redirect_uri character varying(2000) NOT NULL,
    client_identifier character varying(64) NOT NULL,
    secret character varying(512) NOT NULL
);


ALTER TABLE public.oc_oauth2_clients OWNER TO oc_x79;

--
-- Name: oc_oauth2_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_oauth2_clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_oauth2_clients_id_seq OWNER TO oc_x79;

--
-- Name: oc_oauth2_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_oauth2_clients_id_seq OWNED BY public.oc_oauth2_clients.id;


--
-- Name: oc_onlyoffice_filekey; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_onlyoffice_filekey (
    id integer NOT NULL,
    file_id bigint DEFAULT '-1'::integer,
    key character varying(128) NOT NULL,
    lock integer DEFAULT 0 NOT NULL,
    fs integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_onlyoffice_filekey OWNER TO oc_x79;

--
-- Name: oc_onlyoffice_filekey_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_onlyoffice_filekey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_onlyoffice_filekey_id_seq OWNER TO oc_x79;

--
-- Name: oc_onlyoffice_filekey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_onlyoffice_filekey_id_seq OWNED BY public.oc_onlyoffice_filekey.id;


--
-- Name: oc_onlyoffice_instance; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_onlyoffice_instance (
    id integer NOT NULL,
    remote character varying(128) NOT NULL,
    expire bigint DEFAULT 0 NOT NULL,
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_onlyoffice_instance OWNER TO oc_x79;

--
-- Name: oc_onlyoffice_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_onlyoffice_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_onlyoffice_instance_id_seq OWNER TO oc_x79;

--
-- Name: oc_onlyoffice_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_onlyoffice_instance_id_seq OWNED BY public.oc_onlyoffice_instance.id;


--
-- Name: oc_onlyoffice_permissions; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_onlyoffice_permissions (
    id integer NOT NULL,
    share_id bigint DEFAULT '-1'::integer NOT NULL,
    permissions integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_onlyoffice_permissions OWNER TO oc_x79;

--
-- Name: oc_onlyoffice_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_onlyoffice_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_onlyoffice_permissions_id_seq OWNER TO oc_x79;

--
-- Name: oc_onlyoffice_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_onlyoffice_permissions_id_seq OWNED BY public.oc_onlyoffice_permissions.id;


--
-- Name: oc_open_local_editor; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_open_local_editor (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    path_hash character varying(64) NOT NULL,
    expiration_time bigint NOT NULL,
    token character varying(128) NOT NULL
);


ALTER TABLE public.oc_open_local_editor OWNER TO oc_x79;

--
-- Name: oc_open_local_editor_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_open_local_editor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_open_local_editor_id_seq OWNER TO oc_x79;

--
-- Name: oc_open_local_editor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_open_local_editor_id_seq OWNED BY public.oc_open_local_editor.id;


--
-- Name: oc_photos_albums; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_photos_albums (
    album_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    "user" character varying(255) NOT NULL,
    created bigint NOT NULL,
    location character varying(255) NOT NULL,
    last_added_photo bigint NOT NULL
);


ALTER TABLE public.oc_photos_albums OWNER TO oc_x79;

--
-- Name: oc_photos_albums_album_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_photos_albums_album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_photos_albums_album_id_seq OWNER TO oc_x79;

--
-- Name: oc_photos_albums_album_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_photos_albums_album_id_seq OWNED BY public.oc_photos_albums.album_id;


--
-- Name: oc_photos_albums_collabs; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_photos_albums_collabs (
    id bigint NOT NULL,
    album_id bigint NOT NULL,
    collaborator_id character varying(64) NOT NULL,
    collaborator_type integer NOT NULL
);


ALTER TABLE public.oc_photos_albums_collabs OWNER TO oc_x79;

--
-- Name: oc_photos_albums_collabs_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_photos_albums_collabs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_photos_albums_collabs_id_seq OWNER TO oc_x79;

--
-- Name: oc_photos_albums_collabs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_photos_albums_collabs_id_seq OWNED BY public.oc_photos_albums_collabs.id;


--
-- Name: oc_photos_albums_files; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_photos_albums_files (
    album_file_id bigint NOT NULL,
    album_id bigint NOT NULL,
    file_id bigint NOT NULL,
    added bigint NOT NULL,
    owner character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_photos_albums_files OWNER TO oc_x79;

--
-- Name: oc_photos_albums_files_album_file_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_photos_albums_files_album_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_photos_albums_files_album_file_id_seq OWNER TO oc_x79;

--
-- Name: oc_photos_albums_files_album_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_photos_albums_files_album_file_id_seq OWNED BY public.oc_photos_albums_files.album_file_id;


--
-- Name: oc_preferences; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_preferences (
    userid character varying(64) DEFAULT ''::character varying NOT NULL,
    appid character varying(32) DEFAULT ''::character varying NOT NULL,
    configkey character varying(64) DEFAULT ''::character varying NOT NULL,
    configvalue text,
    lazy smallint DEFAULT 0 NOT NULL,
    type smallint DEFAULT 0 NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    indexed character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.oc_preferences OWNER TO oc_x79;

--
-- Name: oc_preferences_ex; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_preferences_ex (
    id bigint NOT NULL,
    userid character varying(64) NOT NULL,
    appid character varying(32) NOT NULL,
    configkey character varying(64) NOT NULL,
    configvalue text
);


ALTER TABLE public.oc_preferences_ex OWNER TO oc_x79;

--
-- Name: oc_preferences_ex_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_preferences_ex_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_preferences_ex_id_seq OWNER TO oc_x79;

--
-- Name: oc_preferences_ex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_preferences_ex_id_seq OWNED BY public.oc_preferences_ex.id;


--
-- Name: oc_privacy_admins; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_privacy_admins (
    id integer NOT NULL,
    displayname character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_privacy_admins OWNER TO oc_x79;

--
-- Name: oc_privacy_admins_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_privacy_admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_privacy_admins_id_seq OWNER TO oc_x79;

--
-- Name: oc_privacy_admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_privacy_admins_id_seq OWNED BY public.oc_privacy_admins.id;


--
-- Name: oc_profile_config; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_profile_config (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    config text NOT NULL
);


ALTER TABLE public.oc_profile_config OWNER TO oc_x79;

--
-- Name: oc_profile_config_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_profile_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_profile_config_id_seq OWNER TO oc_x79;

--
-- Name: oc_profile_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_profile_config_id_seq OWNED BY public.oc_profile_config.id;


--
-- Name: oc_properties; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_properties (
    id bigint NOT NULL,
    userid character varying(64) DEFAULT ''::character varying NOT NULL,
    propertypath character varying(255) DEFAULT ''::character varying NOT NULL,
    propertyname character varying(255) DEFAULT ''::character varying NOT NULL,
    propertyvalue text NOT NULL,
    valuetype smallint DEFAULT 1
);


ALTER TABLE public.oc_properties OWNER TO oc_x79;

--
-- Name: oc_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_properties_id_seq OWNER TO oc_x79;

--
-- Name: oc_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_properties_id_seq OWNED BY public.oc_properties.id;


--
-- Name: oc_ratelimit_entries; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_ratelimit_entries (
    id bigint NOT NULL,
    hash character varying(128) NOT NULL,
    delete_after timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.oc_ratelimit_entries OWNER TO oc_x79;

--
-- Name: oc_ratelimit_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_ratelimit_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_ratelimit_entries_id_seq OWNER TO oc_x79;

--
-- Name: oc_ratelimit_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_ratelimit_entries_id_seq OWNED BY public.oc_ratelimit_entries.id;


--
-- Name: oc_reactions; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_reactions (
    id bigint NOT NULL,
    parent_id bigint NOT NULL,
    message_id bigint NOT NULL,
    actor_type character varying(64) DEFAULT ''::character varying NOT NULL,
    actor_id character varying(64) DEFAULT ''::character varying NOT NULL,
    reaction character varying(32) NOT NULL
);


ALTER TABLE public.oc_reactions OWNER TO oc_x79;

--
-- Name: oc_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_reactions_id_seq OWNER TO oc_x79;

--
-- Name: oc_reactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_reactions_id_seq OWNED BY public.oc_reactions.id;


--
-- Name: oc_recent_contact; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_recent_contact (
    id integer NOT NULL,
    actor_uid character varying(64) NOT NULL,
    uid character varying(64) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    federated_cloud_id character varying(255) DEFAULT NULL::character varying,
    card bytea NOT NULL,
    last_contact integer NOT NULL
);


ALTER TABLE public.oc_recent_contact OWNER TO oc_x79;

--
-- Name: oc_recent_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_recent_contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_recent_contact_id_seq OWNER TO oc_x79;

--
-- Name: oc_recent_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_recent_contact_id_seq OWNED BY public.oc_recent_contact.id;


--
-- Name: oc_richdocuments_assets; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_richdocuments_assets (
    id bigint NOT NULL,
    uid character varying(64) DEFAULT NULL::character varying,
    fileid bigint NOT NULL,
    token character varying(64) DEFAULT NULL::character varying,
    "timestamp" bigint DEFAULT 0
);


ALTER TABLE public.oc_richdocuments_assets OWNER TO oc_x79;

--
-- Name: oc_richdocuments_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_richdocuments_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_richdocuments_assets_id_seq OWNER TO oc_x79;

--
-- Name: oc_richdocuments_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_richdocuments_assets_id_seq OWNED BY public.oc_richdocuments_assets.id;


--
-- Name: oc_richdocuments_direct; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_richdocuments_direct (
    id bigint NOT NULL,
    token character varying(64) DEFAULT NULL::character varying,
    uid character varying(64) DEFAULT NULL::character varying,
    fileid bigint NOT NULL,
    "timestamp" bigint DEFAULT 0,
    template_destination bigint,
    template_id bigint,
    share character varying(64) DEFAULT NULL::character varying,
    initiator_host character varying(255) DEFAULT NULL::character varying,
    initiator_token character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_richdocuments_direct OWNER TO oc_x79;

--
-- Name: oc_richdocuments_direct_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_richdocuments_direct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_richdocuments_direct_id_seq OWNER TO oc_x79;

--
-- Name: oc_richdocuments_direct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_richdocuments_direct_id_seq OWNED BY public.oc_richdocuments_direct.id;


--
-- Name: oc_richdocuments_template; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_richdocuments_template (
    id bigint NOT NULL,
    userid character varying(64) DEFAULT NULL::character varying,
    fileid bigint NOT NULL,
    templateid bigint NOT NULL,
    "timestamp" bigint NOT NULL
);


ALTER TABLE public.oc_richdocuments_template OWNER TO oc_x79;

--
-- Name: oc_richdocuments_template_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_richdocuments_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_richdocuments_template_id_seq OWNER TO oc_x79;

--
-- Name: oc_richdocuments_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_richdocuments_template_id_seq OWNED BY public.oc_richdocuments_template.id;


--
-- Name: oc_richdocuments_wopi; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_richdocuments_wopi (
    id bigint NOT NULL,
    owner_uid character varying(64) DEFAULT NULL::character varying,
    editor_uid character varying(64) DEFAULT NULL::character varying,
    guest_displayname character varying(64) DEFAULT NULL::character varying,
    fileid bigint NOT NULL,
    version bigint DEFAULT 0,
    canwrite boolean DEFAULT false,
    server_host character varying(255) DEFAULT 'localhost'::character varying NOT NULL,
    token character varying(32) DEFAULT ''::character varying,
    expiry bigint,
    template_destination bigint,
    template_id bigint,
    hide_download boolean DEFAULT false,
    direct boolean DEFAULT false,
    remote_server character varying(255) DEFAULT ''::character varying,
    remote_server_token character varying(32) DEFAULT ''::character varying,
    share character varying(64) DEFAULT NULL::character varying,
    token_type integer DEFAULT 0
);


ALTER TABLE public.oc_richdocuments_wopi OWNER TO oc_x79;

--
-- Name: oc_richdocuments_wopi_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_richdocuments_wopi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_richdocuments_wopi_id_seq OWNER TO oc_x79;

--
-- Name: oc_richdocuments_wopi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_richdocuments_wopi_id_seq OWNED BY public.oc_richdocuments_wopi.id;


--
-- Name: oc_rocket_file_chats; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_rocket_file_chats (
    file_id integer NOT NULL,
    chat_id character varying(255) NOT NULL,
    created timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_rocket_file_chats OWNER TO oc_x79;

--
-- Name: oc_rocket_users; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_rocket_users (
    nc_user_id character varying(30) NOT NULL,
    rc_user_id character varying(30) NOT NULL,
    rc_token character varying(50) NOT NULL,
    rc_current_channel_id character varying(50) NOT NULL,
    rc_uuid_password character varying(50) NOT NULL
);


ALTER TABLE public.oc_rocket_users OWNER TO oc_x79;

--
-- Name: oc_schedulingobjects; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_schedulingobjects (
    id bigint NOT NULL,
    principaluri character varying(255) DEFAULT NULL::character varying,
    calendardata bytea,
    uri character varying(255) DEFAULT NULL::character varying,
    lastmodified integer,
    etag character varying(32) DEFAULT NULL::character varying,
    size bigint NOT NULL
);


ALTER TABLE public.oc_schedulingobjects OWNER TO oc_x79;

--
-- Name: oc_schedulingobjects_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_schedulingobjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_schedulingobjects_id_seq OWNER TO oc_x79;

--
-- Name: oc_schedulingobjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_schedulingobjects_id_seq OWNED BY public.oc_schedulingobjects.id;


--
-- Name: oc_sec_signatory; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_sec_signatory (
    id bigint NOT NULL,
    key_id_sum character varying(127) NOT NULL,
    key_id character varying(512) NOT NULL,
    host character varying(512) NOT NULL,
    provider_id character varying(31) NOT NULL,
    account character varying(127) DEFAULT ''::character varying,
    public_key text DEFAULT ''::text NOT NULL,
    metadata text DEFAULT '[]'::text NOT NULL,
    type smallint DEFAULT 9 NOT NULL,
    status smallint DEFAULT 0 NOT NULL,
    creation integer DEFAULT 0,
    last_updated integer DEFAULT 0
);


ALTER TABLE public.oc_sec_signatory OWNER TO oc_x79;

--
-- Name: oc_sec_signatory_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_sec_signatory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_sec_signatory_id_seq OWNER TO oc_x79;

--
-- Name: oc_sec_signatory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_sec_signatory_id_seq OWNED BY public.oc_sec_signatory.id;


--
-- Name: oc_share; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_share (
    id bigint NOT NULL,
    share_type smallint DEFAULT 0 NOT NULL,
    share_with character varying(255) DEFAULT NULL::character varying,
    password character varying(255) DEFAULT NULL::character varying,
    uid_owner character varying(64) DEFAULT ''::character varying NOT NULL,
    uid_initiator character varying(64) DEFAULT NULL::character varying,
    parent bigint,
    item_type character varying(64) DEFAULT ''::character varying NOT NULL,
    item_source character varying(255) DEFAULT NULL::character varying,
    item_target character varying(255) DEFAULT NULL::character varying,
    file_source bigint,
    file_target character varying(512) DEFAULT NULL::character varying,
    permissions smallint DEFAULT 0 NOT NULL,
    stime bigint DEFAULT 0 NOT NULL,
    accepted smallint DEFAULT 0 NOT NULL,
    expiration timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    token character varying(32) DEFAULT NULL::character varying,
    mail_send smallint DEFAULT 0 NOT NULL,
    share_name character varying(64) DEFAULT NULL::character varying,
    password_by_talk boolean DEFAULT false,
    note text,
    hide_download smallint DEFAULT 0,
    label character varying(255) DEFAULT NULL::character varying,
    attributes json,
    password_expiration_time timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    reminder_sent boolean DEFAULT false
);


ALTER TABLE public.oc_share OWNER TO oc_x79;

--
-- Name: oc_share_external; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_share_external (
    id bigint NOT NULL,
    parent bigint DEFAULT '-1'::integer,
    share_type integer,
    remote character varying(512) NOT NULL,
    remote_id character varying(255) DEFAULT ''::character varying,
    share_token character varying(64) NOT NULL,
    password character varying(64) DEFAULT NULL::character varying,
    name character varying(4000) NOT NULL,
    owner character varying(64) NOT NULL,
    "user" character varying(64) NOT NULL,
    mountpoint character varying(4000) NOT NULL,
    mountpoint_hash character varying(32) NOT NULL,
    accepted integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_share_external OWNER TO oc_x79;

--
-- Name: oc_share_external_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_share_external_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_share_external_id_seq OWNER TO oc_x79;

--
-- Name: oc_share_external_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_share_external_id_seq OWNED BY public.oc_share_external.id;


--
-- Name: oc_share_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_share_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_share_id_seq OWNER TO oc_x79;

--
-- Name: oc_share_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_share_id_seq OWNED BY public.oc_share.id;


--
-- Name: oc_shares_limits; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_shares_limits (
    id character varying(32) NOT NULL,
    "limit" bigint NOT NULL,
    downloads bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_shares_limits OWNER TO oc_x79;

--
-- Name: oc_storages; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_storages (
    numeric_id bigint NOT NULL,
    id character varying(64) DEFAULT NULL::character varying,
    available integer DEFAULT 1 NOT NULL,
    last_checked integer
);


ALTER TABLE public.oc_storages OWNER TO oc_x79;

--
-- Name: oc_storages_credentials; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_storages_credentials (
    id bigint NOT NULL,
    "user" character varying(64) DEFAULT NULL::character varying,
    identifier character varying(64) NOT NULL,
    credentials text
);


ALTER TABLE public.oc_storages_credentials OWNER TO oc_x79;

--
-- Name: oc_storages_credentials_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_storages_credentials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_storages_credentials_id_seq OWNER TO oc_x79;

--
-- Name: oc_storages_credentials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_storages_credentials_id_seq OWNED BY public.oc_storages_credentials.id;


--
-- Name: oc_storages_numeric_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_storages_numeric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_storages_numeric_id_seq OWNER TO oc_x79;

--
-- Name: oc_storages_numeric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_storages_numeric_id_seq OWNED BY public.oc_storages.numeric_id;


--
-- Name: oc_systemtag; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_systemtag (
    id bigint NOT NULL,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    visibility smallint DEFAULT 1 NOT NULL,
    editable smallint DEFAULT 1 NOT NULL,
    etag character varying(32) DEFAULT NULL::character varying,
    color character varying(6) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_systemtag OWNER TO oc_x79;

--
-- Name: oc_systemtag_group; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_systemtag_group (
    systemtagid bigint DEFAULT 0 NOT NULL,
    gid character varying(255) NOT NULL
);


ALTER TABLE public.oc_systemtag_group OWNER TO oc_x79;

--
-- Name: oc_systemtag_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_systemtag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_systemtag_id_seq OWNER TO oc_x79;

--
-- Name: oc_systemtag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_systemtag_id_seq OWNED BY public.oc_systemtag.id;


--
-- Name: oc_systemtag_object_mapping; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_systemtag_object_mapping (
    objectid character varying(64) DEFAULT ''::character varying NOT NULL,
    objecttype character varying(64) DEFAULT ''::character varying NOT NULL,
    systemtagid bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_systemtag_object_mapping OWNER TO oc_x79;

--
-- Name: oc_talk_attachments; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_attachments (
    id bigint NOT NULL,
    room_id bigint NOT NULL,
    message_id bigint NOT NULL,
    message_time bigint NOT NULL,
    object_type character varying(64) NOT NULL,
    actor_type character varying(64) NOT NULL,
    actor_id character varying(64) NOT NULL
);


ALTER TABLE public.oc_talk_attachments OWNER TO oc_x79;

--
-- Name: oc_talk_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_attachments_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_attachments_id_seq OWNED BY public.oc_talk_attachments.id;


--
-- Name: oc_talk_attendees; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_attendees (
    id bigint NOT NULL,
    room_id bigint NOT NULL,
    actor_type character varying(32) NOT NULL,
    actor_id character varying(255) NOT NULL,
    display_name character varying(255) DEFAULT ''::character varying,
    pin character varying(32) DEFAULT NULL::character varying,
    participant_type smallint DEFAULT 0 NOT NULL,
    favorite boolean DEFAULT false,
    notification_level integer DEFAULT 0,
    last_joined_call integer DEFAULT 0 NOT NULL,
    last_read_message bigint DEFAULT 0,
    last_mention_message bigint DEFAULT 0,
    read_privacy smallint DEFAULT 0,
    access_token character varying(64) DEFAULT NULL::character varying,
    remote_id character varying(255) DEFAULT NULL::character varying,
    last_mention_direct bigint DEFAULT 0 NOT NULL,
    permissions integer DEFAULT 0 NOT NULL,
    notification_calls integer DEFAULT 1 NOT NULL,
    phone_number character varying(255) DEFAULT ''::character varying,
    call_id character varying(255) DEFAULT ''::character varying,
    invited_cloud_id character varying(255) DEFAULT NULL::character varying,
    state smallint DEFAULT 0 NOT NULL,
    unread_messages bigint DEFAULT 0 NOT NULL,
    last_attendee_activity bigint DEFAULT 0 NOT NULL,
    archived boolean DEFAULT false
);


ALTER TABLE public.oc_talk_attendees OWNER TO oc_x79;

--
-- Name: oc_talk_attendees_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_attendees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_attendees_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_attendees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_attendees_id_seq OWNED BY public.oc_talk_attendees.id;


--
-- Name: oc_talk_bans; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_bans (
    id bigint NOT NULL,
    moderator_actor_type character varying(32) NOT NULL,
    moderator_actor_id character varying(255) NOT NULL,
    moderator_displayname character varying(255) DEFAULT NULL::character varying,
    banned_actor_type character varying(32) NOT NULL,
    banned_actor_id character varying(255) NOT NULL,
    banned_displayname character varying(255) DEFAULT NULL::character varying,
    room_id bigint NOT NULL,
    banned_time timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    internal_note text
);


ALTER TABLE public.oc_talk_bans OWNER TO oc_x79;

--
-- Name: oc_talk_bans_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_bans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_bans_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_bans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_bans_id_seq OWNED BY public.oc_talk_bans.id;


--
-- Name: oc_talk_bots_conversation; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_bots_conversation (
    id bigint NOT NULL,
    bot_id bigint DEFAULT 0 NOT NULL,
    token character varying(64) DEFAULT NULL::character varying,
    state smallint DEFAULT 0
);


ALTER TABLE public.oc_talk_bots_conversation OWNER TO oc_x79;

--
-- Name: oc_talk_bots_conversation_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_bots_conversation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_bots_conversation_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_bots_conversation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_bots_conversation_id_seq OWNED BY public.oc_talk_bots_conversation.id;


--
-- Name: oc_talk_bots_server; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_bots_server (
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    url character varying(4000) NOT NULL,
    url_hash character varying(64) NOT NULL,
    description character varying(4000) DEFAULT NULL::character varying,
    secret character varying(128) NOT NULL,
    error_count bigint DEFAULT 0 NOT NULL,
    last_error_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    last_error_message character varying(4000) DEFAULT NULL::character varying,
    state smallint DEFAULT 0,
    features integer DEFAULT 3 NOT NULL
);


ALTER TABLE public.oc_talk_bots_server OWNER TO oc_x79;

--
-- Name: oc_talk_bots_server_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_bots_server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_bots_server_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_bots_server_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_bots_server_id_seq OWNED BY public.oc_talk_bots_server.id;


--
-- Name: oc_talk_bridges; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_bridges (
    id bigint NOT NULL,
    room_id bigint NOT NULL,
    json_values text NOT NULL,
    enabled smallint DEFAULT 0 NOT NULL,
    pid integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_talk_bridges OWNER TO oc_x79;

--
-- Name: oc_talk_bridges_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_bridges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_bridges_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_bridges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_bridges_id_seq OWNED BY public.oc_talk_bridges.id;


--
-- Name: oc_talk_commands; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_commands (
    id integer NOT NULL,
    app character varying(64) DEFAULT ''::character varying,
    name character varying(64) NOT NULL,
    command character varying(64) NOT NULL,
    script text NOT NULL,
    response integer DEFAULT 1 NOT NULL,
    enabled integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_talk_commands OWNER TO oc_x79;

--
-- Name: oc_talk_commands_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_commands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_commands_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_commands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_commands_id_seq OWNED BY public.oc_talk_commands.id;


--
-- Name: oc_talk_consent; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_consent (
    id bigint NOT NULL,
    token character varying(64) NOT NULL,
    actor_type character varying(64) NOT NULL,
    actor_id character varying(64) NOT NULL,
    date_time timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_talk_consent OWNER TO oc_x79;

--
-- Name: oc_talk_consent_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_consent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_consent_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_consent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_consent_id_seq OWNED BY public.oc_talk_consent.id;


--
-- Name: oc_talk_internalsignaling; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_internalsignaling (
    id bigint NOT NULL,
    sender character varying(512) NOT NULL,
    recipient character varying(512) NOT NULL,
    message text NOT NULL,
    "timestamp" integer NOT NULL
);


ALTER TABLE public.oc_talk_internalsignaling OWNER TO oc_x79;

--
-- Name: oc_talk_internalsignaling_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_internalsignaling_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_internalsignaling_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_internalsignaling_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_internalsignaling_id_seq OWNED BY public.oc_talk_internalsignaling.id;


--
-- Name: oc_talk_invitations; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_invitations (
    id bigint NOT NULL,
    user_id character varying(255) NOT NULL,
    state smallint DEFAULT 0 NOT NULL,
    local_room_id bigint NOT NULL,
    access_token character varying(64) NOT NULL,
    remote_server_url character varying(512) NOT NULL,
    remote_token character varying(32) NOT NULL,
    remote_attendee_id bigint NOT NULL,
    inviter_cloud_id character varying(255) DEFAULT NULL::character varying,
    inviter_display_name character varying(255) DEFAULT NULL::character varying,
    local_cloud_id character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_talk_invitations OWNER TO oc_x79;

--
-- Name: oc_talk_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_invitations_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_invitations_id_seq OWNED BY public.oc_talk_invitations.id;


--
-- Name: oc_talk_poll_votes; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_poll_votes (
    id bigint NOT NULL,
    poll_id bigint NOT NULL,
    room_id bigint NOT NULL,
    actor_type character varying(64) NOT NULL,
    actor_id character varying(64) NOT NULL,
    display_name character varying(255) DEFAULT NULL::character varying,
    option_id integer NOT NULL
);


ALTER TABLE public.oc_talk_poll_votes OWNER TO oc_x79;

--
-- Name: oc_talk_poll_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_poll_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_poll_votes_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_poll_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_poll_votes_id_seq OWNED BY public.oc_talk_poll_votes.id;


--
-- Name: oc_talk_polls; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_polls (
    id bigint NOT NULL,
    room_id bigint NOT NULL,
    question text,
    options text,
    votes text,
    num_voters bigint DEFAULT 0,
    actor_type character varying(64) NOT NULL,
    actor_id character varying(64) NOT NULL,
    display_name character varying(255) DEFAULT NULL::character varying,
    status smallint DEFAULT 0,
    result_mode smallint DEFAULT 0,
    max_votes integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_talk_polls OWNER TO oc_x79;

--
-- Name: oc_talk_polls_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_polls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_polls_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_polls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_polls_id_seq OWNED BY public.oc_talk_polls.id;


--
-- Name: oc_talk_proxy_messages; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_proxy_messages (
    id bigint NOT NULL,
    local_token character varying(32) NOT NULL,
    remote_server_url character varying(512) NOT NULL,
    remote_token character varying(32) NOT NULL,
    remote_message_id bigint NOT NULL,
    actor_type character varying(64) NOT NULL,
    actor_id character varying(64) NOT NULL,
    actor_display_name character varying(255) DEFAULT NULL::character varying,
    message_type character varying(64) NOT NULL,
    system_message character varying(64) DEFAULT NULL::character varying,
    expiration_datetime timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    message text,
    message_parameters text,
    creation_datetime timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    meta_data text
);


ALTER TABLE public.oc_talk_proxy_messages OWNER TO oc_x79;

--
-- Name: oc_talk_proxy_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_proxy_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_proxy_messages_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_proxy_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_proxy_messages_id_seq OWNED BY public.oc_talk_proxy_messages.id;


--
-- Name: oc_talk_reminders; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_reminders (
    id bigint NOT NULL,
    user_id character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    message_id bigint NOT NULL,
    date_time timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_talk_reminders OWNER TO oc_x79;

--
-- Name: oc_talk_reminders_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_reminders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_reminders_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_reminders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_reminders_id_seq OWNED BY public.oc_talk_reminders.id;


--
-- Name: oc_talk_retry_ocm; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_retry_ocm (
    id bigint NOT NULL,
    remote_server character varying(255) NOT NULL,
    num_attempts integer DEFAULT 0 NOT NULL,
    next_retry timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    notification_type character varying(64) NOT NULL,
    resource_type character varying(64) NOT NULL,
    provider_id character varying(64) NOT NULL,
    notification text NOT NULL
);


ALTER TABLE public.oc_talk_retry_ocm OWNER TO oc_x79;

--
-- Name: oc_talk_retry_ocm_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_retry_ocm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_retry_ocm_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_retry_ocm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_retry_ocm_id_seq OWNED BY public.oc_talk_retry_ocm.id;


--
-- Name: oc_talk_rooms; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_rooms (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying,
    token character varying(32) DEFAULT ''::character varying,
    type integer NOT NULL,
    password character varying(255) DEFAULT ''::character varying,
    active_since timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    active_guests integer DEFAULT 0 NOT NULL,
    last_activity timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    last_message bigint DEFAULT 0,
    object_type character varying(64) DEFAULT ''::character varying,
    object_id character varying(64) DEFAULT ''::character varying,
    read_only integer DEFAULT 0 NOT NULL,
    lobby_state integer DEFAULT 0 NOT NULL,
    lobby_timer timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    assigned_hpb integer,
    sip_enabled smallint DEFAULT 0 NOT NULL,
    description text DEFAULT ''::text,
    listable smallint DEFAULT 0,
    call_flag integer DEFAULT 0 NOT NULL,
    default_permissions integer DEFAULT 0 NOT NULL,
    call_permissions integer DEFAULT 0 NOT NULL,
    remote_server character varying(512) DEFAULT NULL::character varying,
    remote_token character varying(32) DEFAULT NULL::character varying,
    message_expiration integer DEFAULT 0 NOT NULL,
    breakout_room_mode integer DEFAULT 0 NOT NULL,
    breakout_room_status integer DEFAULT 0 NOT NULL,
    avatar character varying(24) DEFAULT ''::character varying,
    call_recording integer DEFAULT 0 NOT NULL,
    recording_consent smallint DEFAULT 0 NOT NULL,
    has_federation smallint DEFAULT 0 NOT NULL,
    mention_permissions integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_talk_rooms OWNER TO oc_x79;

--
-- Name: oc_talk_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_rooms_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_rooms_id_seq OWNED BY public.oc_talk_rooms.id;


--
-- Name: oc_talk_sessions; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_talk_sessions (
    id bigint NOT NULL,
    attendee_id bigint NOT NULL,
    session_id character varying(512) NOT NULL,
    in_call integer DEFAULT 0 NOT NULL,
    last_ping integer DEFAULT 0 NOT NULL,
    state smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.oc_talk_sessions OWNER TO oc_x79;

--
-- Name: oc_talk_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_talk_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_talk_sessions_id_seq OWNER TO oc_x79;

--
-- Name: oc_talk_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_talk_sessions_id_seq OWNED BY public.oc_talk_sessions.id;


--
-- Name: oc_taskprocessing_tasks; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_taskprocessing_tasks (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    input text NOT NULL,
    output text,
    status integer DEFAULT 0,
    user_id character varying(64) DEFAULT NULL::character varying,
    app_id character varying(32) DEFAULT ''::character varying NOT NULL,
    custom_id character varying(255) DEFAULT ''::character varying,
    last_updated integer DEFAULT 0,
    completion_expected_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    progress double precision DEFAULT '0'::double precision,
    error_message character varying(4000) DEFAULT NULL::character varying,
    scheduled_at integer,
    started_at integer,
    ended_at integer,
    webhook_uri character varying(4000) DEFAULT NULL::character varying,
    webhook_method character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_taskprocessing_tasks OWNER TO oc_x79;

--
-- Name: oc_taskprocessing_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_taskprocessing_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_taskprocessing_tasks_id_seq OWNER TO oc_x79;

--
-- Name: oc_taskprocessing_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_taskprocessing_tasks_id_seq OWNED BY public.oc_taskprocessing_tasks.id;


--
-- Name: oc_text2image_tasks; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_text2image_tasks (
    id bigint NOT NULL,
    input text NOT NULL,
    status integer DEFAULT 0,
    number_of_images integer DEFAULT 1 NOT NULL,
    user_id character varying(64) DEFAULT NULL::character varying,
    app_id character varying(32) DEFAULT ''::character varying NOT NULL,
    identifier character varying(255) DEFAULT ''::character varying,
    last_updated timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    completion_expected_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_text2image_tasks OWNER TO oc_x79;

--
-- Name: oc_text2image_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_text2image_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_text2image_tasks_id_seq OWNER TO oc_x79;

--
-- Name: oc_text2image_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_text2image_tasks_id_seq OWNED BY public.oc_text2image_tasks.id;


--
-- Name: oc_text_documents; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_text_documents (
    id bigint NOT NULL,
    current_version bigint DEFAULT 0,
    last_saved_version bigint DEFAULT 0,
    last_saved_version_time bigint NOT NULL,
    last_saved_version_etag character varying(64) DEFAULT ''::character varying,
    base_version_etag character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.oc_text_documents OWNER TO oc_x79;

--
-- Name: oc_text_sessions; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_text_sessions (
    id bigint NOT NULL,
    user_id character varying(64) DEFAULT NULL::character varying,
    guest_name character varying(64) DEFAULT NULL::character varying,
    color character varying(7) DEFAULT NULL::character varying,
    token character varying(64) NOT NULL,
    document_id bigint NOT NULL,
    last_contact bigint NOT NULL,
    last_awareness_message text DEFAULT ''::text
);


ALTER TABLE public.oc_text_sessions OWNER TO oc_x79;

--
-- Name: oc_text_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_text_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_text_sessions_id_seq OWNER TO oc_x79;

--
-- Name: oc_text_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_text_sessions_id_seq OWNED BY public.oc_text_sessions.id;


--
-- Name: oc_text_steps; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_text_steps (
    id bigint NOT NULL,
    document_id bigint NOT NULL,
    session_id bigint NOT NULL,
    data text NOT NULL,
    version bigint DEFAULT 0,
    "timestamp" bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_text_steps OWNER TO oc_x79;

--
-- Name: oc_text_steps_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_text_steps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_text_steps_id_seq OWNER TO oc_x79;

--
-- Name: oc_text_steps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_text_steps_id_seq OWNED BY public.oc_text_steps.id;


--
-- Name: oc_textprocessing_tasks; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_textprocessing_tasks (
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    input text NOT NULL,
    output text,
    status integer DEFAULT 0,
    user_id character varying(64) DEFAULT NULL::character varying,
    app_id character varying(32) DEFAULT ''::character varying NOT NULL,
    identifier character varying(255) DEFAULT ''::character varying NOT NULL,
    last_updated integer DEFAULT 0,
    completion_expected_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public.oc_textprocessing_tasks OWNER TO oc_x79;

--
-- Name: oc_textprocessing_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_textprocessing_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_textprocessing_tasks_id_seq OWNER TO oc_x79;

--
-- Name: oc_textprocessing_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_textprocessing_tasks_id_seq OWNED BY public.oc_textprocessing_tasks.id;


--
-- Name: oc_trusted_servers; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_trusted_servers (
    id integer NOT NULL,
    url character varying(512) NOT NULL,
    url_hash character varying(255) DEFAULT ''::character varying NOT NULL,
    token character varying(128) DEFAULT NULL::character varying,
    shared_secret character varying(256) DEFAULT NULL::character varying,
    status integer DEFAULT 2 NOT NULL,
    sync_token character varying(512) DEFAULT NULL::character varying
);


ALTER TABLE public.oc_trusted_servers OWNER TO oc_x79;

--
-- Name: oc_trusted_servers_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_trusted_servers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_trusted_servers_id_seq OWNER TO oc_x79;

--
-- Name: oc_trusted_servers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_trusted_servers_id_seq OWNED BY public.oc_trusted_servers.id;


--
-- Name: oc_twofactor_backupcodes; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_twofactor_backupcodes (
    id bigint NOT NULL,
    user_id character varying(64) DEFAULT ''::character varying NOT NULL,
    code character varying(128) NOT NULL,
    used smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_twofactor_backupcodes OWNER TO oc_x79;

--
-- Name: oc_twofactor_backupcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_twofactor_backupcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_twofactor_backupcodes_id_seq OWNER TO oc_x79;

--
-- Name: oc_twofactor_backupcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_twofactor_backupcodes_id_seq OWNED BY public.oc_twofactor_backupcodes.id;


--
-- Name: oc_twofactor_providers; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_twofactor_providers (
    provider_id character varying(32) NOT NULL,
    uid character varying(64) NOT NULL,
    enabled smallint NOT NULL
);


ALTER TABLE public.oc_twofactor_providers OWNER TO oc_x79;

--
-- Name: oc_user_status; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_user_status (
    id bigint NOT NULL,
    user_id character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    status_timestamp integer NOT NULL,
    is_user_defined boolean,
    message_id character varying(255) DEFAULT NULL::character varying,
    custom_icon character varying(255) DEFAULT NULL::character varying,
    custom_message text,
    clear_at integer,
    is_backup boolean DEFAULT false,
    status_message_timestamp integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_user_status OWNER TO oc_x79;

--
-- Name: oc_user_status_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_user_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_user_status_id_seq OWNER TO oc_x79;

--
-- Name: oc_user_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_user_status_id_seq OWNED BY public.oc_user_status.id;


--
-- Name: oc_user_transfer_owner; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_user_transfer_owner (
    id bigint NOT NULL,
    source_user character varying(64) NOT NULL,
    target_user character varying(64) NOT NULL,
    file_id bigint NOT NULL,
    node_name character varying(255) NOT NULL
);


ALTER TABLE public.oc_user_transfer_owner OWNER TO oc_x79;

--
-- Name: oc_user_transfer_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_user_transfer_owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_user_transfer_owner_id_seq OWNER TO oc_x79;

--
-- Name: oc_user_transfer_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_user_transfer_owner_id_seq OWNED BY public.oc_user_transfer_owner.id;


--
-- Name: oc_users; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_users (
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    displayname character varying(64) DEFAULT NULL::character varying,
    password character varying(255) DEFAULT ''::character varying NOT NULL,
    uid_lower character varying(64) DEFAULT ''::character varying
);


ALTER TABLE public.oc_users OWNER TO oc_x79;

--
-- Name: oc_vcategory; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_vcategory (
    id bigint NOT NULL,
    uid character varying(64) DEFAULT ''::character varying NOT NULL,
    type character varying(64) DEFAULT ''::character varying NOT NULL,
    category character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_vcategory OWNER TO oc_x79;

--
-- Name: oc_vcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_vcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_vcategory_id_seq OWNER TO oc_x79;

--
-- Name: oc_vcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_vcategory_id_seq OWNED BY public.oc_vcategory.id;


--
-- Name: oc_vcategory_to_object; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_vcategory_to_object (
    objid bigint DEFAULT 0 NOT NULL,
    categoryid bigint DEFAULT 0 NOT NULL,
    type character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_vcategory_to_object OWNER TO oc_x79;

--
-- Name: oc_webauthn; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_webauthn (
    id integer NOT NULL,
    uid character varying(64) NOT NULL,
    name character varying(64) NOT NULL,
    public_key_credential_id character varying(512) NOT NULL,
    data text NOT NULL,
    user_verification boolean DEFAULT false
);


ALTER TABLE public.oc_webauthn OWNER TO oc_x79;

--
-- Name: oc_webauthn_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_webauthn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_webauthn_id_seq OWNER TO oc_x79;

--
-- Name: oc_webauthn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_webauthn_id_seq OWNED BY public.oc_webauthn.id;


--
-- Name: oc_webhook_listeners; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_webhook_listeners (
    id bigint NOT NULL,
    app_id character varying(64) DEFAULT NULL::character varying,
    user_id character varying(64) DEFAULT NULL::character varying,
    http_method character varying(32) NOT NULL,
    uri character varying(4000) NOT NULL,
    event character varying(4000) NOT NULL,
    event_filter text,
    user_id_filter character varying(64) DEFAULT NULL::character varying,
    headers text,
    auth_method character varying(16) DEFAULT ''::character varying NOT NULL,
    auth_data text
);


ALTER TABLE public.oc_webhook_listeners OWNER TO oc_x79;

--
-- Name: oc_webhook_listeners_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_webhook_listeners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_webhook_listeners_id_seq OWNER TO oc_x79;

--
-- Name: oc_webhook_listeners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_webhook_listeners_id_seq OWNED BY public.oc_webhook_listeners.id;


--
-- Name: oc_whats_new; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_whats_new (
    id integer NOT NULL,
    version character varying(64) DEFAULT '11'::character varying NOT NULL,
    etag character varying(64) DEFAULT ''::character varying NOT NULL,
    last_check integer DEFAULT 0 NOT NULL,
    data text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.oc_whats_new OWNER TO oc_x79;

--
-- Name: oc_whats_new_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_whats_new_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_whats_new_id_seq OWNER TO oc_x79;

--
-- Name: oc_whats_new_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_whats_new_id_seq OWNED BY public.oc_whats_new.id;


--
-- Name: oc_wopi_assets; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_wopi_assets (
    id integer NOT NULL,
    uid character varying(64) DEFAULT NULL::character varying,
    fileid integer NOT NULL,
    token character varying(64) DEFAULT NULL::character varying,
    "timestamp" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.oc_wopi_assets OWNER TO oc_x79;

--
-- Name: oc_wopi_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_wopi_assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_wopi_assets_id_seq OWNER TO oc_x79;

--
-- Name: oc_wopi_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_wopi_assets_id_seq OWNED BY public.oc_wopi_assets.id;


--
-- Name: oc_wopi_direct; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_wopi_direct (
    id integer NOT NULL,
    token character varying(64) DEFAULT NULL::character varying,
    uid character varying(64) DEFAULT NULL::character varying,
    fileid integer NOT NULL,
    "timestamp" integer DEFAULT 0 NOT NULL,
    template_destination integer,
    template_id integer
);


ALTER TABLE public.oc_wopi_direct OWNER TO oc_x79;

--
-- Name: oc_wopi_direct_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_wopi_direct_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_wopi_direct_id_seq OWNER TO oc_x79;

--
-- Name: oc_wopi_direct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_wopi_direct_id_seq OWNED BY public.oc_wopi_direct.id;


--
-- Name: oc_wopi_locks; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_wopi_locks (
    id character varying(36) NOT NULL,
    valid_by integer NOT NULL,
    file_id integer NOT NULL,
    user_id character varying(64) NOT NULL,
    token_id character varying(36) NOT NULL,
    value character varying(1024) NOT NULL
);


ALTER TABLE public.oc_wopi_locks OWNER TO oc_x79;

--
-- Name: oc_wopi_tokens; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_wopi_tokens (
    id character varying(36) NOT NULL,
    valid_by integer NOT NULL,
    file_id integer NOT NULL,
    user_id character varying(64) NOT NULL,
    value character varying(64) NOT NULL
);


ALTER TABLE public.oc_wopi_tokens OWNER TO oc_x79;

--
-- Name: oc_wopi_wopi; Type: TABLE; Schema: public; Owner: oc_x79
--

CREATE TABLE public.oc_wopi_wopi (
    id integer NOT NULL,
    owner_uid character varying(64) DEFAULT NULL::character varying,
    editor_uid character varying(64) DEFAULT NULL::character varying,
    guest_displayname character varying(64) DEFAULT NULL::character varying,
    fileid integer NOT NULL,
    version integer DEFAULT 0 NOT NULL,
    canwrite boolean DEFAULT false,
    server_host character varying(255) DEFAULT 'localhost'::character varying NOT NULL,
    token character varying(32) DEFAULT ''::character varying NOT NULL,
    expiry integer,
    template_destination integer,
    template_id integer,
    hide_download boolean DEFAULT false,
    direct boolean DEFAULT false,
    is_remote_token boolean DEFAULT false,
    remote_server character varying(255) DEFAULT ''::character varying NOT NULL,
    remote_server_token character varying(32) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.oc_wopi_wopi OWNER TO oc_x79;

--
-- Name: oc_wopi_wopi_id_seq; Type: SEQUENCE; Schema: public; Owner: oc_x79
--

CREATE SEQUENCE public.oc_wopi_wopi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.oc_wopi_wopi_id_seq OWNER TO oc_x79;

--
-- Name: oc_wopi_wopi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oc_x79
--

ALTER SEQUENCE public.oc_wopi_wopi_id_seq OWNED BY public.oc_wopi_wopi.id;


--
-- Name: oc_accounts_data id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_accounts_data ALTER COLUMN id SET DEFAULT nextval('public.oc_accounts_data_id_seq'::regclass);


--
-- Name: oc_activity activity_id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_activity ALTER COLUMN activity_id SET DEFAULT nextval('public.oc_activity_activity_id_seq'::regclass);


--
-- Name: oc_activity_mq mail_id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_activity_mq ALTER COLUMN mail_id SET DEFAULT nextval('public.oc_activity_mq_mail_id_seq'::regclass);


--
-- Name: oc_addressbookchanges id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_addressbookchanges ALTER COLUMN id SET DEFAULT nextval('public.oc_addressbookchanges_id_seq'::regclass);


--
-- Name: oc_addressbooks id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_addressbooks ALTER COLUMN id SET DEFAULT nextval('public.oc_addressbooks_id_seq'::regclass);


--
-- Name: oc_appconfig_ex id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_appconfig_ex ALTER COLUMN id SET DEFAULT nextval('public.oc_appconfig_ex_id_seq'::regclass);


--
-- Name: oc_authorized_groups id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_authorized_groups ALTER COLUMN id SET DEFAULT nextval('public.oc_authorized_groups_id_seq'::regclass);


--
-- Name: oc_authtoken id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_authtoken ALTER COLUMN id SET DEFAULT nextval('public.oc_authtoken_id_seq'::regclass);


--
-- Name: oc_bruteforce_attempts id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_bruteforce_attempts ALTER COLUMN id SET DEFAULT nextval('public.oc_bruteforce_attempts_id_seq'::regclass);


--
-- Name: oc_calendar_appt_bookings id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_appt_bookings ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_appt_bookings_id_seq'::regclass);


--
-- Name: oc_calendar_appt_configs id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_appt_configs ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_appt_configs_id_seq'::regclass);


--
-- Name: oc_calendar_invitations id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_invitations ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_invitations_id_seq'::regclass);


--
-- Name: oc_calendar_reminders id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_reminders ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_reminders_id_seq'::regclass);


--
-- Name: oc_calendar_resources id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_resources ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_resources_id_seq'::regclass);


--
-- Name: oc_calendar_resources_md id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_resources_md ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_resources_md_id_seq'::regclass);


--
-- Name: oc_calendar_rooms id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_rooms ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_rooms_id_seq'::regclass);


--
-- Name: oc_calendar_rooms_md id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_rooms_md ALTER COLUMN id SET DEFAULT nextval('public.oc_calendar_rooms_md_id_seq'::regclass);


--
-- Name: oc_calendarchanges id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendarchanges ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarchanges_id_seq'::regclass);


--
-- Name: oc_calendarobjects id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendarobjects ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarobjects_id_seq'::regclass);


--
-- Name: oc_calendarobjects_props id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendarobjects_props ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarobjects_props_id_seq'::regclass);


--
-- Name: oc_calendars id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendars ALTER COLUMN id SET DEFAULT nextval('public.oc_calendars_id_seq'::regclass);


--
-- Name: oc_calendarsubscriptions id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendarsubscriptions ALTER COLUMN id SET DEFAULT nextval('public.oc_calendarsubscriptions_id_seq'::regclass);


--
-- Name: oc_cards id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_cards ALTER COLUMN id SET DEFAULT nextval('public.oc_cards_id_seq'::regclass);


--
-- Name: oc_cards_properties id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_cards_properties ALTER COLUMN id SET DEFAULT nextval('public.oc_cards_properties_id_seq'::regclass);


--
-- Name: oc_cfg_shares id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_cfg_shares ALTER COLUMN id SET DEFAULT nextval('public.oc_cfg_shares_id_seq'::regclass);


--
-- Name: oc_circles_circle id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_circle ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_circle_id_seq'::regclass);


--
-- Name: oc_circles_member id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_member ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_member_id_seq'::regclass);


--
-- Name: oc_circles_mount id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_mount ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_mount_id_seq'::regclass);


--
-- Name: oc_circles_mountpoint id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_mountpoint ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_mountpoint_id_seq'::regclass);


--
-- Name: oc_circles_remote id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_remote ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_remote_id_seq'::regclass);


--
-- Name: oc_circles_share_lock id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_share_lock ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_share_lock_id_seq'::regclass);


--
-- Name: oc_circles_token id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_token ALTER COLUMN id SET DEFAULT nextval('public.oc_circles_token_id_seq'::regclass);


--
-- Name: oc_collres_collections id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_collres_collections ALTER COLUMN id SET DEFAULT nextval('public.oc_collres_collections_id_seq'::regclass);


--
-- Name: oc_comments id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_comments ALTER COLUMN id SET DEFAULT nextval('public.oc_comments_id_seq'::regclass);


--
-- Name: oc_dav_absence id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_dav_absence ALTER COLUMN id SET DEFAULT nextval('public.oc_dav_absence_id_seq'::regclass);


--
-- Name: oc_dav_cal_proxy id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_dav_cal_proxy ALTER COLUMN id SET DEFAULT nextval('public.oc_dav_cal_proxy_id_seq'::regclass);


--
-- Name: oc_dav_shares id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_dav_shares ALTER COLUMN id SET DEFAULT nextval('public.oc_dav_shares_id_seq'::regclass);


--
-- Name: oc_direct_edit id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_direct_edit ALTER COLUMN id SET DEFAULT nextval('public.oc_direct_edit_id_seq'::regclass);


--
-- Name: oc_directlink id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_directlink ALTER COLUMN id SET DEFAULT nextval('public.oc_directlink_id_seq'::regclass);


--
-- Name: oc_ex_apps id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_apps ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_apps_id_seq'::regclass);


--
-- Name: oc_ex_apps_daemons id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_apps_daemons ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_apps_daemons_id_seq'::regclass);


--
-- Name: oc_ex_apps_routes id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_apps_routes ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_apps_routes_id_seq'::regclass);


--
-- Name: oc_ex_deploy_options id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_deploy_options ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_deploy_options_id_seq'::regclass);


--
-- Name: oc_ex_event_handlers id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_event_handlers ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_event_handlers_id_seq'::regclass);


--
-- Name: oc_ex_occ_commands id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_occ_commands ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_occ_commands_id_seq'::regclass);


--
-- Name: oc_ex_settings_forms id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_settings_forms ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_settings_forms_id_seq'::regclass);


--
-- Name: oc_ex_speech_to_text id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_speech_to_text ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_speech_to_text_id_seq'::regclass);


--
-- Name: oc_ex_speech_to_text_q id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_speech_to_text_q ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_speech_to_text_q_id_seq'::regclass);


--
-- Name: oc_ex_task_processing id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_task_processing ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_task_processing_id_seq'::regclass);


--
-- Name: oc_ex_text_processing id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_text_processing ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_text_processing_id_seq'::regclass);


--
-- Name: oc_ex_text_processing_q id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_text_processing_q ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_text_processing_q_id_seq'::regclass);


--
-- Name: oc_ex_translation id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_translation ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_translation_id_seq'::regclass);


--
-- Name: oc_ex_translation_q id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_translation_q ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_translation_q_id_seq'::regclass);


--
-- Name: oc_ex_ui_files_actions id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_files_actions ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_ui_files_actions_id_seq'::regclass);


--
-- Name: oc_ex_ui_scripts id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_scripts ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_ui_scripts_id_seq'::regclass);


--
-- Name: oc_ex_ui_states id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_states ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_ui_states_id_seq'::regclass);


--
-- Name: oc_ex_ui_styles id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_styles ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_ui_styles_id_seq'::regclass);


--
-- Name: oc_ex_ui_top_menu id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_top_menu ALTER COLUMN id SET DEFAULT nextval('public.oc_ex_ui_top_menu_id_seq'::regclass);


--
-- Name: oc_file_locks id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_file_locks ALTER COLUMN id SET DEFAULT nextval('public.oc_file_locks_id_seq'::regclass);


--
-- Name: oc_filecache fileid; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_filecache ALTER COLUMN fileid SET DEFAULT nextval('public.oc_filecache_fileid_seq'::regclass);


--
-- Name: oc_files_metadata id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_metadata ALTER COLUMN id SET DEFAULT nextval('public.oc_files_metadata_id_seq'::regclass);


--
-- Name: oc_files_metadata_index id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_metadata_index ALTER COLUMN id SET DEFAULT nextval('public.oc_files_metadata_index_id_seq'::regclass);


--
-- Name: oc_files_reminders id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_reminders ALTER COLUMN id SET DEFAULT nextval('public.oc_files_reminders_id_seq'::regclass);


--
-- Name: oc_files_trash auto_id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_trash ALTER COLUMN auto_id SET DEFAULT nextval('public.oc_files_trash_auto_id_seq'::regclass);


--
-- Name: oc_files_versions id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_versions ALTER COLUMN id SET DEFAULT nextval('public.oc_files_versions_id_seq'::regclass);


--
-- Name: oc_flow_checks id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_flow_checks ALTER COLUMN id SET DEFAULT nextval('public.oc_flow_checks_id_seq'::regclass);


--
-- Name: oc_flow_operations id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_flow_operations ALTER COLUMN id SET DEFAULT nextval('public.oc_flow_operations_id_seq'::regclass);


--
-- Name: oc_flow_operations_scope id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_flow_operations_scope ALTER COLUMN id SET DEFAULT nextval('public.oc_flow_operations_scope_id_seq'::regclass);


--
-- Name: oc_jobs id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_jobs ALTER COLUMN id SET DEFAULT nextval('public.oc_jobs_id_seq'::regclass);


--
-- Name: oc_known_users id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_known_users ALTER COLUMN id SET DEFAULT nextval('public.oc_known_users_id_seq'::regclass);


--
-- Name: oc_login_flow_v2 id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_login_flow_v2 ALTER COLUMN id SET DEFAULT nextval('public.oc_login_flow_v2_id_seq'::regclass);


--
-- Name: oc_mail_accounts id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_accounts ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_accounts_id_seq'::regclass);


--
-- Name: oc_mail_aliases id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_aliases ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_aliases_id_seq'::regclass);


--
-- Name: oc_mail_attachments id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_attachments ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_attachments_id_seq'::regclass);


--
-- Name: oc_mail_coll_addresses id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_coll_addresses ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_coll_addresses_id_seq'::regclass);


--
-- Name: oc_mail_internal_address id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_internal_address ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_internal_address_id_seq'::regclass);


--
-- Name: oc_mail_local_messages id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_local_messages ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_local_messages_id_seq'::regclass);


--
-- Name: oc_mail_mailboxes id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_mailboxes ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_mailboxes_id_seq'::regclass);


--
-- Name: oc_mail_message_tags id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_message_tags ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_message_tags_id_seq'::regclass);


--
-- Name: oc_mail_messages id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_messages ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_messages_id_seq'::regclass);


--
-- Name: oc_mail_messages_retention id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_messages_retention ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_messages_retention_id_seq'::regclass);


--
-- Name: oc_mail_messages_snoozed id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_messages_snoozed ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_messages_snoozed_id_seq'::regclass);


--
-- Name: oc_mail_provisionings id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_provisionings ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_provisionings_id_seq'::regclass);


--
-- Name: oc_mail_recipients id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_recipients ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_recipients_id_seq'::regclass);


--
-- Name: oc_mail_smime_certificates id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_smime_certificates ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_smime_certificates_id_seq'::regclass);


--
-- Name: oc_mail_tags id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_tags ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_tags_id_seq'::regclass);


--
-- Name: oc_mail_trusted_senders id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_trusted_senders ALTER COLUMN id SET DEFAULT nextval('public.oc_mail_trusted_senders_id_seq'::regclass);


--
-- Name: oc_mimetypes id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mimetypes ALTER COLUMN id SET DEFAULT nextval('public.oc_mimetypes_id_seq'::regclass);


--
-- Name: oc_mounts id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mounts ALTER COLUMN id SET DEFAULT nextval('public.oc_mounts_id_seq'::regclass);


--
-- Name: oc_notes_meta id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_notes_meta ALTER COLUMN id SET DEFAULT nextval('public.oc_notes_meta_id_seq'::regclass);


--
-- Name: oc_notifications notification_id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.oc_notifications_notification_id_seq'::regclass);


--
-- Name: oc_notifications_pushhash id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_notifications_pushhash ALTER COLUMN id SET DEFAULT nextval('public.oc_notifications_pushhash_id_seq'::regclass);


--
-- Name: oc_notifications_settings id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_notifications_settings ALTER COLUMN id SET DEFAULT nextval('public.oc_notifications_settings_id_seq'::regclass);


--
-- Name: oc_oauth2_access_tokens id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_oauth2_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oc_oauth2_access_tokens_id_seq'::regclass);


--
-- Name: oc_oauth2_clients id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_oauth2_clients ALTER COLUMN id SET DEFAULT nextval('public.oc_oauth2_clients_id_seq'::regclass);


--
-- Name: oc_onlyoffice_filekey id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_onlyoffice_filekey ALTER COLUMN id SET DEFAULT nextval('public.oc_onlyoffice_filekey_id_seq'::regclass);


--
-- Name: oc_onlyoffice_instance id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_onlyoffice_instance ALTER COLUMN id SET DEFAULT nextval('public.oc_onlyoffice_instance_id_seq'::regclass);


--
-- Name: oc_onlyoffice_permissions id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_onlyoffice_permissions ALTER COLUMN id SET DEFAULT nextval('public.oc_onlyoffice_permissions_id_seq'::regclass);


--
-- Name: oc_open_local_editor id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_open_local_editor ALTER COLUMN id SET DEFAULT nextval('public.oc_open_local_editor_id_seq'::regclass);


--
-- Name: oc_photos_albums album_id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_photos_albums ALTER COLUMN album_id SET DEFAULT nextval('public.oc_photos_albums_album_id_seq'::regclass);


--
-- Name: oc_photos_albums_collabs id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_photos_albums_collabs ALTER COLUMN id SET DEFAULT nextval('public.oc_photos_albums_collabs_id_seq'::regclass);


--
-- Name: oc_photos_albums_files album_file_id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_photos_albums_files ALTER COLUMN album_file_id SET DEFAULT nextval('public.oc_photos_albums_files_album_file_id_seq'::regclass);


--
-- Name: oc_preferences_ex id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_preferences_ex ALTER COLUMN id SET DEFAULT nextval('public.oc_preferences_ex_id_seq'::regclass);


--
-- Name: oc_privacy_admins id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_privacy_admins ALTER COLUMN id SET DEFAULT nextval('public.oc_privacy_admins_id_seq'::regclass);


--
-- Name: oc_profile_config id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_profile_config ALTER COLUMN id SET DEFAULT nextval('public.oc_profile_config_id_seq'::regclass);


--
-- Name: oc_properties id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_properties ALTER COLUMN id SET DEFAULT nextval('public.oc_properties_id_seq'::regclass);


--
-- Name: oc_ratelimit_entries id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ratelimit_entries ALTER COLUMN id SET DEFAULT nextval('public.oc_ratelimit_entries_id_seq'::regclass);


--
-- Name: oc_reactions id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_reactions ALTER COLUMN id SET DEFAULT nextval('public.oc_reactions_id_seq'::regclass);


--
-- Name: oc_recent_contact id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_recent_contact ALTER COLUMN id SET DEFAULT nextval('public.oc_recent_contact_id_seq'::regclass);


--
-- Name: oc_richdocuments_assets id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_richdocuments_assets ALTER COLUMN id SET DEFAULT nextval('public.oc_richdocuments_assets_id_seq'::regclass);


--
-- Name: oc_richdocuments_direct id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_richdocuments_direct ALTER COLUMN id SET DEFAULT nextval('public.oc_richdocuments_direct_id_seq'::regclass);


--
-- Name: oc_richdocuments_template id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_richdocuments_template ALTER COLUMN id SET DEFAULT nextval('public.oc_richdocuments_template_id_seq'::regclass);


--
-- Name: oc_richdocuments_wopi id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_richdocuments_wopi ALTER COLUMN id SET DEFAULT nextval('public.oc_richdocuments_wopi_id_seq'::regclass);


--
-- Name: oc_schedulingobjects id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_schedulingobjects ALTER COLUMN id SET DEFAULT nextval('public.oc_schedulingobjects_id_seq'::regclass);


--
-- Name: oc_sec_signatory id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_sec_signatory ALTER COLUMN id SET DEFAULT nextval('public.oc_sec_signatory_id_seq'::regclass);


--
-- Name: oc_share id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_share ALTER COLUMN id SET DEFAULT nextval('public.oc_share_id_seq'::regclass);


--
-- Name: oc_share_external id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_share_external ALTER COLUMN id SET DEFAULT nextval('public.oc_share_external_id_seq'::regclass);


--
-- Name: oc_storages numeric_id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_storages ALTER COLUMN numeric_id SET DEFAULT nextval('public.oc_storages_numeric_id_seq'::regclass);


--
-- Name: oc_storages_credentials id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_storages_credentials ALTER COLUMN id SET DEFAULT nextval('public.oc_storages_credentials_id_seq'::regclass);


--
-- Name: oc_systemtag id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_systemtag ALTER COLUMN id SET DEFAULT nextval('public.oc_systemtag_id_seq'::regclass);


--
-- Name: oc_talk_attachments id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_attachments ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_attachments_id_seq'::regclass);


--
-- Name: oc_talk_attendees id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_attendees ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_attendees_id_seq'::regclass);


--
-- Name: oc_talk_bans id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_bans ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_bans_id_seq'::regclass);


--
-- Name: oc_talk_bots_conversation id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_bots_conversation ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_bots_conversation_id_seq'::regclass);


--
-- Name: oc_talk_bots_server id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_bots_server ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_bots_server_id_seq'::regclass);


--
-- Name: oc_talk_bridges id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_bridges ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_bridges_id_seq'::regclass);


--
-- Name: oc_talk_commands id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_commands ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_commands_id_seq'::regclass);


--
-- Name: oc_talk_consent id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_consent ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_consent_id_seq'::regclass);


--
-- Name: oc_talk_internalsignaling id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_internalsignaling ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_internalsignaling_id_seq'::regclass);


--
-- Name: oc_talk_invitations id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_invitations ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_invitations_id_seq'::regclass);


--
-- Name: oc_talk_poll_votes id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_poll_votes ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_poll_votes_id_seq'::regclass);


--
-- Name: oc_talk_polls id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_polls ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_polls_id_seq'::regclass);


--
-- Name: oc_talk_proxy_messages id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_proxy_messages ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_proxy_messages_id_seq'::regclass);


--
-- Name: oc_talk_reminders id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_reminders ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_reminders_id_seq'::regclass);


--
-- Name: oc_talk_retry_ocm id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_retry_ocm ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_retry_ocm_id_seq'::regclass);


--
-- Name: oc_talk_rooms id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_rooms ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_rooms_id_seq'::regclass);


--
-- Name: oc_talk_sessions id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_sessions ALTER COLUMN id SET DEFAULT nextval('public.oc_talk_sessions_id_seq'::regclass);


--
-- Name: oc_taskprocessing_tasks id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_taskprocessing_tasks ALTER COLUMN id SET DEFAULT nextval('public.oc_taskprocessing_tasks_id_seq'::regclass);


--
-- Name: oc_text2image_tasks id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_text2image_tasks ALTER COLUMN id SET DEFAULT nextval('public.oc_text2image_tasks_id_seq'::regclass);


--
-- Name: oc_text_sessions id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_text_sessions ALTER COLUMN id SET DEFAULT nextval('public.oc_text_sessions_id_seq'::regclass);


--
-- Name: oc_text_steps id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_text_steps ALTER COLUMN id SET DEFAULT nextval('public.oc_text_steps_id_seq'::regclass);


--
-- Name: oc_textprocessing_tasks id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_textprocessing_tasks ALTER COLUMN id SET DEFAULT nextval('public.oc_textprocessing_tasks_id_seq'::regclass);


--
-- Name: oc_trusted_servers id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_trusted_servers ALTER COLUMN id SET DEFAULT nextval('public.oc_trusted_servers_id_seq'::regclass);


--
-- Name: oc_twofactor_backupcodes id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_twofactor_backupcodes ALTER COLUMN id SET DEFAULT nextval('public.oc_twofactor_backupcodes_id_seq'::regclass);


--
-- Name: oc_user_status id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_user_status ALTER COLUMN id SET DEFAULT nextval('public.oc_user_status_id_seq'::regclass);


--
-- Name: oc_user_transfer_owner id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_user_transfer_owner ALTER COLUMN id SET DEFAULT nextval('public.oc_user_transfer_owner_id_seq'::regclass);


--
-- Name: oc_vcategory id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_vcategory ALTER COLUMN id SET DEFAULT nextval('public.oc_vcategory_id_seq'::regclass);


--
-- Name: oc_webauthn id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_webauthn ALTER COLUMN id SET DEFAULT nextval('public.oc_webauthn_id_seq'::regclass);


--
-- Name: oc_webhook_listeners id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_webhook_listeners ALTER COLUMN id SET DEFAULT nextval('public.oc_webhook_listeners_id_seq'::regclass);


--
-- Name: oc_whats_new id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_whats_new ALTER COLUMN id SET DEFAULT nextval('public.oc_whats_new_id_seq'::regclass);


--
-- Name: oc_wopi_assets id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_wopi_assets ALTER COLUMN id SET DEFAULT nextval('public.oc_wopi_assets_id_seq'::regclass);


--
-- Name: oc_wopi_direct id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_wopi_direct ALTER COLUMN id SET DEFAULT nextval('public.oc_wopi_direct_id_seq'::regclass);


--
-- Name: oc_wopi_wopi id; Type: DEFAULT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_wopi_wopi ALTER COLUMN id SET DEFAULT nextval('public.oc_wopi_wopi_id_seq'::regclass);


--
-- Data for Name: oc_accounts; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_accounts (uid, data) FROM stdin;
x79	{"displayname":{"value":"x79","scope":"v2-federated","verified":"0"},"address":{"value":"","scope":"v2-local","verified":"0"},"website":{"value":"","scope":"v2-local","verified":"0"},"email":{"value":null,"scope":"v2-federated","verified":"0"},"avatar":{"scope":"v2-federated"},"phone":{"value":"","scope":"v2-local","verified":"0"},"twitter":{"value":"","scope":"v2-local","verified":"0"},"fediverse":{"value":"","scope":"v2-local","verified":"0"},"organisation":{"value":"","scope":"v2-local"},"role":{"value":"","scope":"v2-local"},"headline":{"value":"","scope":"v2-local"},"biography":{"value":"","scope":"v2-local"},"birthdate":{"value":"","scope":"v2-local"},"profile_enabled":{"value":"1"},"pronouns":{"value":"","scope":"v2-federated"}}
\.


--
-- Data for Name: oc_accounts_data; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_accounts_data (id, uid, name, value) FROM stdin;
1	x79	displayname	x79
2	x79	address	
3	x79	website	
4	x79	email	
5	x79	phone	
6	x79	twitter	
7	x79	fediverse	
8	x79	organisation	
9	x79	role	
10	x79	headline	
11	x79	biography	
12	x79	birthdate	
13	x79	profile_enabled	1
14	x79	pronouns	
\.


--
-- Data for Name: oc_activity; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_activity (activity_id, "timestamp", priority, type, "user", affecteduser, app, subject, subjectparams, message, messageparams, file, link, object_type, object_id) FROM stdin;
1	1748677276	30	file_created	x79	x79	files	created_self	[{"3":"\\/Reasons to use Nextcloud.pdf"}]		[]	/Reasons to use Nextcloud.pdf	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	3
2	1748677276	30	file_changed	x79	x79	files	changed_self	[{"3":"\\/Reasons to use Nextcloud.pdf"}]		[]	/Reasons to use Nextcloud.pdf	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	3
3	1748677276	30	file_created	x79	x79	files	created_self	[{"4":"\\/Templates"}]		[]	/Templates	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	4
4	1748677276	30	file_created	x79	x79	files	created_self	[{"5":"\\/Templates\\/Party invitation.odt"}]		[]	/Templates/Party invitation.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	5
5	1748677276	30	file_changed	x79	x79	files	changed_self	[{"5":"\\/Templates\\/Party invitation.odt"}]		[]	/Templates/Party invitation.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	5
6	1748677276	30	file_created	x79	x79	files	created_self	[{"6":"\\/Templates\\/Elegant.odp"}]		[]	/Templates/Elegant.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	6
7	1748677277	30	file_changed	x79	x79	files	changed_self	[{"6":"\\/Templates\\/Elegant.odp"}]		[]	/Templates/Elegant.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	6
8	1748677277	30	file_created	x79	x79	files	created_self	[{"7":"\\/Templates\\/Venn diagram.whiteboard"}]		[]	/Templates/Venn diagram.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	7
9	1748677277	30	file_changed	x79	x79	files	changed_self	[{"7":"\\/Templates\\/Venn diagram.whiteboard"}]		[]	/Templates/Venn diagram.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	7
10	1748677277	30	file_created	x79	x79	files	created_self	[{"8":"\\/Templates\\/Syllabus.odt"}]		[]	/Templates/Syllabus.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	8
11	1748677277	30	file_changed	x79	x79	files	changed_self	[{"8":"\\/Templates\\/Syllabus.odt"}]		[]	/Templates/Syllabus.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	8
12	1748677277	30	file_created	x79	x79	files	created_self	[{"9":"\\/Templates\\/Business model canvas.ods"}]		[]	/Templates/Business model canvas.ods	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	9
13	1748677277	30	file_changed	x79	x79	files	changed_self	[{"9":"\\/Templates\\/Business model canvas.ods"}]		[]	/Templates/Business model canvas.ods	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	9
14	1748677277	30	file_created	x79	x79	files	created_self	[{"10":"\\/Templates\\/Modern company.odp"}]		[]	/Templates/Modern company.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	10
15	1748677277	30	file_changed	x79	x79	files	changed_self	[{"10":"\\/Templates\\/Modern company.odp"}]		[]	/Templates/Modern company.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	10
16	1748677277	30	file_created	x79	x79	files	created_self	[{"11":"\\/Templates\\/Meeting agenda.whiteboard"}]		[]	/Templates/Meeting agenda.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	11
17	1748677277	30	file_changed	x79	x79	files	changed_self	[{"11":"\\/Templates\\/Meeting agenda.whiteboard"}]		[]	/Templates/Meeting agenda.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	11
18	1748677278	30	file_created	x79	x79	files	created_self	[{"12":"\\/Templates\\/Letter.odt"}]		[]	/Templates/Letter.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	12
19	1748677278	30	file_changed	x79	x79	files	changed_self	[{"12":"\\/Templates\\/Letter.odt"}]		[]	/Templates/Letter.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	12
20	1748677278	30	file_created	x79	x79	files	created_self	[{"13":"\\/Templates\\/Mindmap.odg"}]		[]	/Templates/Mindmap.odg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	13
21	1748677278	30	file_changed	x79	x79	files	changed_self	[{"13":"\\/Templates\\/Mindmap.odg"}]		[]	/Templates/Mindmap.odg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	13
22	1748677278	30	file_created	x79	x79	files	created_self	[{"14":"\\/Templates\\/Sticky notes.whiteboard"}]		[]	/Templates/Sticky notes.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	14
23	1748677278	30	file_changed	x79	x79	files	changed_self	[{"14":"\\/Templates\\/Sticky notes.whiteboard"}]		[]	/Templates/Sticky notes.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	14
24	1748677278	30	file_created	x79	x79	files	created_self	[{"15":"\\/Templates\\/Org chart.odg"}]		[]	/Templates/Org chart.odg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	15
25	1748677278	30	file_changed	x79	x79	files	changed_self	[{"15":"\\/Templates\\/Org chart.odg"}]		[]	/Templates/Org chart.odg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	15
26	1748677278	30	file_created	x79	x79	files	created_self	[{"16":"\\/Templates\\/Business model canvas.odg"}]		[]	/Templates/Business model canvas.odg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	16
27	1748677278	30	file_changed	x79	x79	files	changed_self	[{"16":"\\/Templates\\/Business model canvas.odg"}]		[]	/Templates/Business model canvas.odg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	16
28	1748677279	30	file_created	x79	x79	files	created_self	[{"17":"\\/Templates\\/Flowchart.whiteboard"}]		[]	/Templates/Flowchart.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	17
29	1748677279	30	file_changed	x79	x79	files	changed_self	[{"17":"\\/Templates\\/Flowchart.whiteboard"}]		[]	/Templates/Flowchart.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	17
30	1748677279	30	file_created	x79	x79	files	created_self	[{"18":"\\/Templates\\/Diagram & table.ods"}]		[]	/Templates/Diagram & table.ods	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	18
31	1748677279	30	file_changed	x79	x79	files	changed_self	[{"18":"\\/Templates\\/Diagram & table.ods"}]		[]	/Templates/Diagram & table.ods	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	18
32	1748677279	30	file_created	x79	x79	files	created_self	[{"19":"\\/Templates\\/Product plan.md"}]		[]	/Templates/Product plan.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	19
33	1748677279	30	file_changed	x79	x79	files	changed_self	[{"19":"\\/Templates\\/Product plan.md"}]		[]	/Templates/Product plan.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	19
34	1748677279	30	file_created	x79	x79	files	created_self	[{"20":"\\/Templates\\/Business model canvas.whiteboard"}]		[]	/Templates/Business model canvas.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	20
35	1748677279	30	file_changed	x79	x79	files	changed_self	[{"20":"\\/Templates\\/Business model canvas.whiteboard"}]		[]	/Templates/Business model canvas.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	20
36	1748677279	30	file_created	x79	x79	files	created_self	[{"21":"\\/Templates\\/Flowchart.odg"}]		[]	/Templates/Flowchart.odg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	21
37	1748677279	30	file_changed	x79	x79	files	changed_self	[{"21":"\\/Templates\\/Flowchart.odg"}]		[]	/Templates/Flowchart.odg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	21
38	1748677279	30	file_created	x79	x79	files	created_self	[{"22":"\\/Templates\\/Simple.odp"}]		[]	/Templates/Simple.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	22
39	1748677280	30	file_changed	x79	x79	files	changed_self	[{"22":"\\/Templates\\/Simple.odp"}]		[]	/Templates/Simple.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	22
40	1748677280	30	file_created	x79	x79	files	created_self	[{"23":"\\/Templates\\/Mind map.whiteboard"}]		[]	/Templates/Mind map.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	23
41	1748677280	30	file_changed	x79	x79	files	changed_self	[{"23":"\\/Templates\\/Mind map.whiteboard"}]		[]	/Templates/Mind map.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	23
42	1748677280	30	file_created	x79	x79	files	created_self	[{"24":"\\/Templates\\/Photo book.odt"}]		[]	/Templates/Photo book.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	24
43	1748677280	30	file_changed	x79	x79	files	changed_self	[{"24":"\\/Templates\\/Photo book.odt"}]		[]	/Templates/Photo book.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	24
44	1748677280	30	file_created	x79	x79	files	created_self	[{"25":"\\/Templates\\/Mother's day.odt"}]		[]	/Templates/Mother's day.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	25
45	1748677280	30	file_changed	x79	x79	files	changed_self	[{"25":"\\/Templates\\/Mother's day.odt"}]		[]	/Templates/Mother's day.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	25
46	1748677280	30	file_created	x79	x79	files	created_self	[{"26":"\\/Templates\\/Readme.md"}]		[]	/Templates/Readme.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	26
47	1748677280	30	file_changed	x79	x79	files	changed_self	[{"26":"\\/Templates\\/Readme.md"}]		[]	/Templates/Readme.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	26
48	1748677280	30	file_created	x79	x79	files	created_self	[{"27":"\\/Templates\\/Invoice.odt"}]		[]	/Templates/Invoice.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	27
49	1748677281	30	file_changed	x79	x79	files	changed_self	[{"27":"\\/Templates\\/Invoice.odt"}]		[]	/Templates/Invoice.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	27
50	1748677281	30	file_created	x79	x79	files	created_self	[{"28":"\\/Templates\\/Gotong royong.odp"}]		[]	/Templates/Gotong royong.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	28
51	1748677281	30	file_changed	x79	x79	files	changed_self	[{"28":"\\/Templates\\/Gotong royong.odp"}]		[]	/Templates/Gotong royong.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	28
52	1748677281	30	file_created	x79	x79	files	created_self	[{"29":"\\/Templates\\/Brainstorming.whiteboard"}]		[]	/Templates/Brainstorming.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	29
53	1748677281	30	file_changed	x79	x79	files	changed_self	[{"29":"\\/Templates\\/Brainstorming.whiteboard"}]		[]	/Templates/Brainstorming.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	29
54	1748677281	30	file_created	x79	x79	files	created_self	[{"30":"\\/Templates\\/Meeting notes.md"}]		[]	/Templates/Meeting notes.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	30
55	1748677281	30	file_changed	x79	x79	files	changed_self	[{"30":"\\/Templates\\/Meeting notes.md"}]		[]	/Templates/Meeting notes.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	30
56	1748677281	30	file_created	x79	x79	files	created_self	[{"31":"\\/Templates\\/Kanban board.whiteboard"}]		[]	/Templates/Kanban board.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	31
57	1748677281	30	file_changed	x79	x79	files	changed_self	[{"31":"\\/Templates\\/Kanban board.whiteboard"}]		[]	/Templates/Kanban board.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	31
58	1748677281	30	file_created	x79	x79	files	created_self	[{"32":"\\/Templates\\/Impact effort.whiteboard"}]		[]	/Templates/Impact effort.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	32
59	1748677282	30	file_changed	x79	x79	files	changed_self	[{"32":"\\/Templates\\/Impact effort.whiteboard"}]		[]	/Templates/Impact effort.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	32
60	1748677282	30	file_created	x79	x79	files	created_self	[{"33":"\\/Templates\\/Timeline.whiteboard"}]		[]	/Templates/Timeline.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	33
61	1748677282	30	file_changed	x79	x79	files	changed_self	[{"33":"\\/Templates\\/Timeline.whiteboard"}]		[]	/Templates/Timeline.whiteboard	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	33
62	1748677282	30	file_created	x79	x79	files	created_self	[{"34":"\\/Templates\\/Resume.odt"}]		[]	/Templates/Resume.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	34
63	1748677282	30	file_changed	x79	x79	files	changed_self	[{"34":"\\/Templates\\/Resume.odt"}]		[]	/Templates/Resume.odt	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	34
64	1748677282	30	file_created	x79	x79	files	created_self	[{"35":"\\/Templates\\/Yellow idea.odp"}]		[]	/Templates/Yellow idea.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	35
65	1748677282	30	file_changed	x79	x79	files	changed_self	[{"35":"\\/Templates\\/Yellow idea.odp"}]		[]	/Templates/Yellow idea.odp	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	35
66	1748677282	30	file_created	x79	x79	files	created_self	[{"36":"\\/Templates\\/Expense report.ods"}]		[]	/Templates/Expense report.ods	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	36
67	1748677282	30	file_changed	x79	x79	files	changed_self	[{"36":"\\/Templates\\/Expense report.ods"}]		[]	/Templates/Expense report.ods	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	36
68	1748677282	30	file_created	x79	x79	files	created_self	[{"37":"\\/Templates\\/Timesheet.ods"}]		[]	/Templates/Timesheet.ods	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	37
69	1748677282	30	file_changed	x79	x79	files	changed_self	[{"37":"\\/Templates\\/Timesheet.ods"}]		[]	/Templates/Timesheet.ods	http://192.168.1.8:8080/index.php/apps/files/?dir=/Templates	files	37
70	1748677283	30	file_created	x79	x79	files	created_self	[{"38":"\\/Templates credits.md"}]		[]	/Templates credits.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	38
71	1748677283	30	file_changed	x79	x79	files	changed_self	[{"38":"\\/Templates credits.md"}]		[]	/Templates credits.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	38
72	1748677283	30	file_created	x79	x79	files	created_self	[{"39":"\\/Nextcloud intro.mp4"}]		[]	/Nextcloud intro.mp4	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	39
73	1748677283	30	file_changed	x79	x79	files	changed_self	[{"39":"\\/Nextcloud intro.mp4"}]		[]	/Nextcloud intro.mp4	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	39
74	1748677283	30	file_created	x79	x79	files	created_self	[{"40":"\\/Readme.md"}]		[]	/Readme.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	40
75	1748677283	30	file_changed	x79	x79	files	changed_self	[{"40":"\\/Readme.md"}]		[]	/Readme.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	40
76	1748677283	30	file_created	x79	x79	files	created_self	[{"41":"\\/Nextcloud.png"}]		[]	/Nextcloud.png	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	41
77	1748677283	30	file_changed	x79	x79	files	changed_self	[{"41":"\\/Nextcloud.png"}]		[]	/Nextcloud.png	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	41
78	1748677283	30	file_created	x79	x79	files	created_self	[{"42":"\\/Documents"}]		[]	/Documents	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	42
79	1748677283	30	file_created	x79	x79	files	created_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	http://192.168.1.8:8080/index.php/apps/files/?dir=/Documents	files	43
80	1748677284	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	http://192.168.1.8:8080/index.php/apps/files/?dir=/Documents	files	43
81	1748677284	30	file_created	x79	x79	files	created_self	[{"44":"\\/Documents\\/Example.md"}]		[]	/Documents/Example.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Documents	files	44
82	1748677284	30	file_changed	x79	x79	files	changed_self	[{"44":"\\/Documents\\/Example.md"}]		[]	/Documents/Example.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Documents	files	44
83	1748677284	30	file_created	x79	x79	files	created_self	[{"45":"\\/Documents\\/Readme.md"}]		[]	/Documents/Readme.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Documents	files	45
84	1748677284	30	file_changed	x79	x79	files	changed_self	[{"45":"\\/Documents\\/Readme.md"}]		[]	/Documents/Readme.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Documents	files	45
85	1748677284	30	file_created	x79	x79	files	created_self	[{"46":"\\/Documents\\/Welcome to Nextcloud Hub.docx"}]		[]	/Documents/Welcome to Nextcloud Hub.docx	http://192.168.1.8:8080/index.php/apps/files/?dir=/Documents	files	46
86	1748677284	30	file_changed	x79	x79	files	changed_self	[{"46":"\\/Documents\\/Welcome to Nextcloud Hub.docx"}]		[]	/Documents/Welcome to Nextcloud Hub.docx	http://192.168.1.8:8080/index.php/apps/files/?dir=/Documents	files	46
87	1748677284	30	file_created	x79	x79	files	created_self	[{"47":"\\/Nextcloud Manual.pdf"}]		[]	/Nextcloud Manual.pdf	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	47
88	1748677284	30	file_changed	x79	x79	files	changed_self	[{"47":"\\/Nextcloud Manual.pdf"}]		[]	/Nextcloud Manual.pdf	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	47
89	1748677284	30	file_created	x79	x79	files	created_self	[{"48":"\\/Photos"}]		[]	/Photos	http://192.168.1.8:8080/index.php/apps/files/?dir=/	files	48
90	1748677285	30	file_created	x79	x79	files	created_self	[{"49":"\\/Photos\\/Vineyard.jpg"}]		[]	/Photos/Vineyard.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	49
91	1748677285	30	file_changed	x79	x79	files	changed_self	[{"49":"\\/Photos\\/Vineyard.jpg"}]		[]	/Photos/Vineyard.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	49
92	1748677285	30	file_created	x79	x79	files	created_self	[{"50":"\\/Photos\\/Toucan.jpg"}]		[]	/Photos/Toucan.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	50
93	1748677285	30	file_changed	x79	x79	files	changed_self	[{"50":"\\/Photos\\/Toucan.jpg"}]		[]	/Photos/Toucan.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	50
94	1748677285	30	file_created	x79	x79	files	created_self	[{"51":"\\/Photos\\/Steps.jpg"}]		[]	/Photos/Steps.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	51
95	1748677285	30	file_changed	x79	x79	files	changed_self	[{"51":"\\/Photos\\/Steps.jpg"}]		[]	/Photos/Steps.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	51
96	1748677285	30	file_created	x79	x79	files	created_self	[{"52":"\\/Photos\\/Gorilla.jpg"}]		[]	/Photos/Gorilla.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	52
97	1748677285	30	file_changed	x79	x79	files	changed_self	[{"52":"\\/Photos\\/Gorilla.jpg"}]		[]	/Photos/Gorilla.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	52
98	1748677285	30	file_created	x79	x79	files	created_self	[{"53":"\\/Photos\\/Nextcloud community.jpg"}]		[]	/Photos/Nextcloud community.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	53
99	1748677286	30	file_changed	x79	x79	files	changed_self	[{"53":"\\/Photos\\/Nextcloud community.jpg"}]		[]	/Photos/Nextcloud community.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	53
100	1748677286	30	file_created	x79	x79	files	created_self	[{"54":"\\/Photos\\/Library.jpg"}]		[]	/Photos/Library.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	54
101	1748677286	30	file_changed	x79	x79	files	changed_self	[{"54":"\\/Photos\\/Library.jpg"}]		[]	/Photos/Library.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	54
102	1748677286	30	file_created	x79	x79	files	created_self	[{"55":"\\/Photos\\/Readme.md"}]		[]	/Photos/Readme.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	55
103	1748677286	30	file_changed	x79	x79	files	changed_self	[{"55":"\\/Photos\\/Readme.md"}]		[]	/Photos/Readme.md	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	55
104	1748677286	30	file_created	x79	x79	files	created_self	[{"56":"\\/Photos\\/Birdie.jpg"}]		[]	/Photos/Birdie.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	56
105	1748677286	30	file_changed	x79	x79	files	changed_self	[{"56":"\\/Photos\\/Birdie.jpg"}]		[]	/Photos/Birdie.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	56
106	1748677286	30	file_created	x79	x79	files	created_self	[{"57":"\\/Photos\\/Frog.jpg"}]		[]	/Photos/Frog.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	57
107	1748677286	30	file_changed	x79	x79	files	changed_self	[{"57":"\\/Photos\\/Frog.jpg"}]		[]	/Photos/Frog.jpg	http://192.168.1.8:8080/index.php/apps/files/?dir=/Photos	files	57
108	1748677287	30	calendar	x79	x79	dav	calendar_add_self	{"actor":"x79","calendar":{"id":1,"uri":"personal","name":"Personal"}}		[]			calendar	1
109	1748677287	30	contacts	x79	x79	dav	addressbook_add_self	{"actor":"x79","addressbook":{"id":2,"uri":"contacts","name":"Contacts"}}		[]			addressbook	2
133	1748679340	30	file_created	x79	x79	files	created_self	[{"292":"\\/Notes"}]		[]	/Notes	https://cloud.victorphan.net/apps/files/?dir=/	files	292
134	1748679343	30	file_created	x79	x79	files	created_self	[{"295":"\\/Notes\\/New note.md"}]		[]	/Notes/New note.md	https://cloud.victorphan.net/apps/files/?dir=/Notes	files	295
135	1748679801	30	file_deleted	x79	x79	files	deleted_self	[{"47":"\\/Nextcloud Manual.pdf"}]		[]	/Nextcloud Manual.pdf	https://cloud.victorphan.net/apps/files/?dir=/	files	47
136	1748679801	30	file_deleted	x79	x79	files	deleted_self	[{"39":"\\/Nextcloud intro.mp4"}]		[]	/Nextcloud intro.mp4	https://cloud.victorphan.net/apps/files/?dir=/	files	39
137	1748679801	30	file_deleted	x79	x79	files	deleted_self	[{"40":"\\/Readme.md"}]		[]	/Readme.md	https://cloud.victorphan.net/apps/files/?dir=/	files	40
138	1748679801	30	file_deleted	x79	x79	files	deleted_self	[{"3":"\\/Reasons to use Nextcloud.pdf"}]		[]	/Reasons to use Nextcloud.pdf	https://cloud.victorphan.net/apps/files/?dir=/	files	3
139	1748679801	30	file_deleted	x79	x79	files	deleted_self	[{"41":"\\/Nextcloud.png"}]		[]	/Nextcloud.png	https://cloud.victorphan.net/apps/files/?dir=/	files	41
140	1748679802	30	file_deleted	x79	x79	files	deleted_self	[{"38":"\\/Templates credits.md"}]		[]	/Templates credits.md	https://cloud.victorphan.net/apps/files/?dir=/	files	38
141	1748680493	30	file_created	x79	x79	files	created_self	[{"307":"\\/Talk"}]		[]	/Talk	https://cloud.victorphan.net/apps/files/?dir=/	files	307
142	1748680589	30	security	x79	x79	settings	app_token_created	{"name":"PC (Talk Desktop Client - Windows)"}		[]			app_token	42
143	1748680707	30	security	x79	x79	settings	app_token_created	{"name":"XIAOMI Redmi Note 9 Pro (Nextcloud Talk)"}		[]			app_token	44
144	1748680790	30	file_created	x79	x79	files	created_self	[{"326":"\\/Talk\\/IMG_20250531_141547.jpg"}]		[]	/Talk/IMG_20250531_141547.jpg	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	326
145	1748680818	30	file_created	x79	x79	files	created_self	[{"339":"\\/Talk\\/2025-05-31 15-40-08.jpg"}]		[]	/Talk/2025-05-31 15-40-08.jpg	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	339
146	1748680912	30	security	x79	x79	settings	app_token_created	{"name":"T470 (Talk Desktop Client - Windows)"}		[]			app_token	46
147	1748702880	30	security	x79	x79	settings	app_token_created	{"name":"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/605.1.15 (KHTML, like Gecko)"}		[]			app_token	49
148	1748711746	30	security	x79	x79	settings	app_token_created	{"name":"iPad (Nextcloud Talk)"}		[]			app_token	51
149	1748738902	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
150	1748738935	30	shared	x79	x79	files_sharing	shared_link_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
151	1748738947	30	public_links		x79	files_sharing	public_shared_file_downloaded	["\\/Documents\\/Nextcloud flyer.pdf","66c4b2eab6b49c764c06a4ab3816f374"]		[]	/Documents/Nextcloud flyer.pdf		files	43
152	1748738954	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
153	1748738971	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
154	1748738976	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
155	1748738981	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
156	1748738984	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
157	1748738991	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
158	1748739006	30	public_links		x79	files_sharing	public_shared_file_downloaded	["\\/Documents\\/Nextcloud flyer.pdf","66c4b2eab6b49c764c06a4ab3816f374"]		[]	/Documents/Nextcloud flyer.pdf		files	43
159	1748739017	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
160	1748739031	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
161	1748739113	30	public_links		x79	files_sharing	public_shared_file_downloaded	["\\/Documents\\/Nextcloud flyer.pdf","79d863e5c147dc618dd5ad3f66a9ad8d"]		[]	/Documents/Nextcloud flyer.pdf		files	43
162	1748739122	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
163	1748739150	30	public_links		x79	files_sharing	public_shared_file_downloaded	["\\/Documents\\/Nextcloud flyer.pdf","79d863e5c147dc618dd5ad3f66a9ad8d"]		[]	/Documents/Nextcloud flyer.pdf		files	43
164	1748739178	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
165	1748739186	30	public_links		x79	files_sharing	public_shared_file_downloaded	["\\/Documents\\/Nextcloud flyer.pdf","79d863e5c147dc618dd5ad3f66a9ad8d"]		[]	/Documents/Nextcloud flyer.pdf		files	43
166	1748739196	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
167	1748739665	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
168	1748739677	30	public_links		x79	files_sharing	public_shared_file_downloaded	["\\/Documents\\/Nextcloud flyer.pdf","dd7a51a3153e92fb3a01e35d551916da"]		[]	/Documents/Nextcloud flyer.pdf		files	43
169	1748739687	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
170	1748739696	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
171	1748739698	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
172	1748739699	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
173	1748739713	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
174	1748739716	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
175	1748739718	30	file_changed		x79	files	changed_by	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"},""]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
176	1748851291	30	security	x79	x79	settings	app_token_created	{"name":"IT06 (Talk Desktop Client - Windows)"}		[]			app_token	54
177	1748851346	30	file_created	x79	x79	files	created_self	[{"451":"\\/Talk\\/Nghien cuu khoa hoc_tinhluong.docx"}]		[]	/Talk/Nghien cuu khoa hoc_tinhluong.docx	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	451
178	1748925730	30	file_changed	x79	x79	files	changed_self	[{"43":"\\/Documents\\/Nextcloud flyer.pdf"}]		[]	/Documents/Nextcloud flyer.pdf	https://cloud.victorphan.net/apps/files/?dir=/Documents	files	43
179	1748996737	30	file_created	x79	x79	files	created_self	[{"534":"\\/Talk\\/Backgrounds"}]		[]	/Talk/Backgrounds	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	534
180	1749050623	30	file_created	x79	x79	files	created_self	[{"538":"\\/Talk\\/BT Modal verbs.pdf"}]		[]	/Talk/BT Modal verbs.pdf	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	538
181	1749114619	30	spreed	x79	x79	spreed	call	{"room":4,"users":["x79"],"cloudIds":[],"guests":0,"duration":2427}		[]			room	4
182	1749141940	30	spreed	x79	x79	spreed	call	{"room":4,"users":["x79"],"cloudIds":[],"guests":0,"duration":27266}		[]			room	4
183	1749254767	30	file_created	x79	x79	files	created_self	[{"623":"\\/Talk\\/20250607_070604.png"}]		[]	/Talk/20250607_070604.png	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	623
184	1749266899	30	file_created	x79	x79	files	created_self	[{"633":"\\/Talk\\/20250607_102816.png"}]		[]	/Talk/20250607_102816.png	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	633
185	1749266902	30	file_created	x79	x79	files	created_self	[{"634":"\\/Talk\\/20250607_102821.png"}]		[]	/Talk/20250607_102821.png	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	634
186	1749266906	30	file_created	x79	x79	files	created_self	[{"635":"\\/Talk\\/20250607_102825.png"}]		[]	/Talk/20250607_102825.png	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	635
187	1749454549	30	file_created	x79	x79	files	created_self	[{"660":"\\/Talk\\/twilio_2FA_recovery_code.txt"}]		[]	/Talk/twilio_2FA_recovery_code.txt	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	660
188	1749571211	30	file_created	x79	x79	files	created_self	[{"746":"\\/Talk\\/N\\u1ed9i dung \\u0111\\u1ec1 t\\u00e0i -Th\\u1ea7y nh\\u00e2n.mp4"}]		[]	/Talk/Nội dung đề tài -Thầy nhân.mp4	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	746
189	1749626435	30	file_created	x79	x79	files	created_self	[{"787":"\\/Talk\\/sisvietnam.vn-20250611-071752-587.wpress"}]		[]	/Talk/sisvietnam.vn-20250611-071752-587.wpress	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	787
190	1749655705	30	file_created	x79	x79	files	created_self	[{"818":"\\/Talk\\/1749545599_f3599c42-7d0a-4af7-afba-604bd959496e.jpg"}]		[]	/Talk/1749545599_f3599c42-7d0a-4af7-afba-604bd959496e.jpg	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	818
191	1749655705	30	file_created	x79	x79	files	created_self	[{"821":"\\/Talk\\/1749545599_04d07652-6952-4024-b365-51cef87f0771.jpg"}]		[]	/Talk/1749545599_04d07652-6952-4024-b365-51cef87f0771.jpg	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	821
192	1749655709	30	file_created	x79	x79	files	created_self	[{"843":"\\/Talk\\/1749545599_11c44654-0f2c-4e2e-ba44-f19e613a65c7.jpg"}]		[]	/Talk/1749545599_11c44654-0f2c-4e2e-ba44-f19e613a65c7.jpg	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	843
193	1749655710	30	file_created	x79	x79	files	created_self	[{"847":"\\/Talk\\/1749545599_de366c96-367c-4e59-a014-50cb5498d7ca.jpg"}]		[]	/Talk/1749545599_de366c96-367c-4e59-a014-50cb5498d7ca.jpg	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	847
194	1749655720	30	file_created	x79	x79	files	created_self	[{"870":"\\/Talk\\/1749545599_78f56b6e-0002-452a-9198-280ba4f79f11.jpg"}]		[]	/Talk/1749545599_78f56b6e-0002-452a-9198-280ba4f79f11.jpg	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	870
195	1749657223	30	file_created	x79	x79	files	created_self	[{"885":"\\/Talk\\/2025_06_11 19_39 Office Lens.pdf"}]		[]	/Talk/2025_06_11 19_39 Office Lens.pdf	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	885
196	1749747566	30	file_created	x79	x79	files	created_self	[{"893":"\\/Talk\\/M3325007-Danh T\\u00ednh-Th\\u1ef1c tr\\u1ea1ng v\\u00e0 gi\\u1ea3i ph\\u00e1p \\u1ee9ng d\\u1ee5ng Tr\\u00ed tu\\u1ec7 nh\\u00e2n t\\u1ea1o (Al) trong ho\\u1ea1t \\u0111\\u1ed9ng s\\u1ea3n xu\\u1ea5t l\\u00faa g\\u1ea1o t\\u1ea1i \\u0110\\u1ed3ng b\\u1eb1ng s\\u00f4ng C\\u1eedu Long.doc"}]		[]	/Talk/M3325007-Danh Tính-Thực trạng và giải pháp ứng dụng Trí tuệ nhân tạo (Al) trong hoạt động sản xuất lúa gạo tại Đồng bằng sông Cửu Long.doc	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	893
197	1749749344	30	file_created	x79	x79	files	created_self	[{"922":"\\/Talk\\/M2523001_PhanVoDinhHIen_TH\\u1ef0C TR\\u1ea0NG V\\u00c0 GI\\u1ea2I PH\\u00c1P C\\u1ee6A \\u1ee8NG D\\u1ee4NG TR\\u00cd TU\\u1ec6 NH\\u00c2N T\\u1ea0O TRONG HO\\u1ea0T \\u0110\\u1ed8NG KH\\u00c1M CH\\u1eeeA B\\u1ec6NH T\\u1ea0I B\\u1ec6NH VI\\u1ec6N \\u0110A KHOA QU\\u1ed0C T\\u1ebe SIS C\\u1ea6N TH\\u01a0..pdf"}]		[]	/Talk/M2523001_PhanVoDinhHIen_THỰC TRẠNG VÀ GIẢI PHÁP CỦA ỨNG DỤNG TRÍ TUỆ NHÂN TẠO TRONG HOẠT ĐỘNG KHÁM CHỮA BỆNH TẠI BỆNH VIỆN ĐA KHOA QUỐC TẾ SIS CẦN THƠ..pdf	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	922
198	1749749347	30	file_created	x79	x79	files	created_self	[{"923":"\\/Talk\\/M2523001_TH\\u1ef0C TR\\u1ea0NG V\\u00c0 GI\\u1ea2I PH\\u00c1P C\\u1ee6A \\u1ee8NG D\\u1ee4NG TR\\u00cd TU\\u1ec6 NH\\u00c2N T\\u1ea0O TRONG HO\\u1ea0T \\u0110\\u1ed8NG KH\\u00c1M CH\\u1eeeA B\\u1ec6NH T\\u1ea0I B\\u1ec6NH VI\\u1ec6N \\u0110A KHOA QU\\u1ed0C T\\u1ebe SIS C\\u1ea6N TH\\u01a0..doc"}]		[]	/Talk/M2523001_THỰC TRẠNG VÀ GIẢI PHÁP CỦA ỨNG DỤNG TRÍ TUỆ NHÂN TẠO TRONG HOẠT ĐỘNG KHÁM CHỮA BỆNH TẠI BỆNH VIỆN ĐA KHOA QUỐC TẾ SIS CẦN THƠ..doc	https://cloud.victorphan.net/apps/files/?dir=/Talk	files	923
\.


--
-- Data for Name: oc_activity_mq; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_activity_mq (mail_id, amq_timestamp, amq_latest_send, amq_type, amq_affecteduser, amq_appid, amq_subject, amq_subjectparams, object_type, object_id) FROM stdin;
\.


--
-- Data for Name: oc_addressbookchanges; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_addressbookchanges (id, uri, synctoken, addressbookid, operation, created_at) FROM stdin;
\.


--
-- Data for Name: oc_addressbooks; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_addressbooks (id, principaluri, displayname, uri, description, synctoken) FROM stdin;
1	principals/system/system	system	system	System addressbook which holds all users of this instance	1
2	principals/users/x79	Contacts	contacts	\N	1
\.


--
-- Data for Name: oc_appconfig; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_appconfig (appid, configkey, configvalue, type, lazy) FROM stdin;
core	installedat	1748677249.9743	2	0
core	vendor	nextcloud	2	0
viewer	installed_version	4.0.0	2	0
viewer	types		2	0
viewer	enabled	yes	2	0
support	installed_version	3.0.0	2	0
support	types	session	2	0
support	enabled	yes	2	0
recommendations	installed_version	4.0.0	2	0
recommendations	types		2	0
recommendations	enabled	yes	2	0
federatedfilesharing	installed_version	1.21.0	2	0
federatedfilesharing	types		2	0
federatedfilesharing	enabled	yes	2	0
photos	installed_version	4.0.0-dev.1	2	0
photos	types	dav,authentication	2	0
photos	enabled	yes	2	0
systemtags	installed_version	1.21.1	2	0
systemtags	types	logging	2	0
systemtags	enabled	yes	2	0
contactsinteraction	installed_version	1.12.0	2	0
contactsinteraction	types	dav	2	0
contactsinteraction	enabled	yes	2	0
provisioning_api	installed_version	1.21.0	2	0
provisioning_api	types	prevent_group_restriction	2	0
provisioning_api	enabled	yes	2	0
federation	installed_version	1.21.0	2	0
federation	types	authentication	2	0
federation	enabled	yes	2	0
activity	installed_version	4.0.0	2	0
activity	types	filesystem	2	0
activity	enabled	yes	2	0
circles	installed_version	31.0.0	2	0
circles	types	filesystem,dav	2	0
circles	enabled	yes	2	0
lookup_server_connector	installed_version	1.19.0	2	0
lookup_server_connector	types	authentication	2	0
lookup_server_connector	enabled	yes	2	0
dav	installed_version	1.33.0	2	0
dav	types	filesystem	2	0
dav	enabled	yes	2	0
sharebymail	installed_version	1.21.0	2	0
sharebymail	types	filesystem	2	0
sharebymail	enabled	yes	2	0
updatenotification	installed_version	1.21.0	2	0
updatenotification	types		2	0
updatenotification	enabled	yes	2	0
bruteforcesettings	installed_version	4.0.0	2	0
bruteforcesettings	types		2	0
bruteforcesettings	enabled	yes	2	0
weather_status	installed_version	1.11.0	2	0
weather_status	types		2	0
weather_status	enabled	yes	2	0
dashboard	installed_version	7.11.0	2	0
dashboard	types		2	0
dashboard	enabled	yes	2	0
files_sharing	installed_version	1.23.1	2	0
core	public_files	files_sharing/public.php	2	0
files_sharing	types	filesystem	2	0
files_sharing	enabled	yes	2	0
webhook_listeners	installed_version	1.2.0	2	0
webhook_listeners	types	filesystem	2	0
webhook_listeners	enabled	yes	2	0
files_reminders	installed_version	1.4.0	2	0
files_reminders	types		2	0
files_reminders	enabled	yes	2	0
password_policy	installed_version	3.0.0	2	0
password_policy	types	authentication	2	0
password_policy	enabled	yes	2	0
nextcloud_announcements	installed_version	3.0.0	2	0
nextcloud_announcements	types	logging	2	0
nextcloud_announcements	enabled	yes	2	0
files	installed_version	2.3.1	2	0
files	types	filesystem	2	0
files	enabled	yes	2	0
text	installed_version	5.0.0	2	0
text	types	dav	2	0
text	enabled	yes	2	0
settings	installed_version	1.14.0	2	0
settings	types		2	0
settings	enabled	yes	2	0
user_status	installed_version	1.11.0	2	0
user_status	types		2	0
user_status	enabled	yes	2	0
related_resources	installed_version	2.0.0	2	0
related_resources	types		2	0
related_resources	enabled	yes	2	0
logreader	installed_version	4.0.0	2	0
logreader	types	logging	2	0
logreader	enabled	yes	2	0
serverinfo	installed_version	3.0.0	2	0
serverinfo	types		2	0
serverinfo	enabled	yes	2	0
profile	installed_version	1.0.0	2	0
profile	types		2	0
profile	enabled	yes	2	0
files_versions	installed_version	1.24.0	2	0
files_versions	types	filesystem,dav	2	0
files_versions	enabled	yes	2	0
theming	installed_version	2.6.1	2	0
theming	types	logging	2	0
theming	enabled	yes	2	0
notifications	installed_version	4.0.0	2	0
notifications	types	logging	2	0
notifications	enabled	yes	2	0
survey_client	installed_version	3.0.0	2	0
survey_client	types		2	0
survey_client	enabled	yes	2	0
files_pdfviewer	installed_version	4.0.0	2	0
files_pdfviewer	types		2	0
files_pdfviewer	enabled	yes	2	0
cloud_federation_api	installed_version	1.14.0	2	0
cloud_federation_api	types	filesystem	2	0
cloud_federation_api	enabled	yes	2	0
updatenotification	core	31.0.6.2	4	0
updatenotification	spreed	21.1.0	4	0
files_downloadlimit	installed_version	4.0.0	2	0
files_downloadlimit	types		2	0
files_downloadlimit	enabled	yes	2	0
app_api	installed_version	5.0.2	2	0
app_api	types		2	0
app_api	enabled	yes	2	0
comments	installed_version	1.21.0	2	0
comments	types	logging	2	0
comments	enabled	yes	2	0
privacy	installed_version	3.0.0	2	0
privacy	types		2	0
privacy	enabled	yes	2	0
workflowengine	installed_version	2.13.0	2	0
workflowengine	types	filesystem	2	0
workflowengine	enabled	yes	2	0
twofactor_backupcodes	installed_version	1.20.0	2	0
twofactor_backupcodes	types		2	0
twofactor_backupcodes	enabled	yes	2	0
firstrunwizard	installed_version	4.0.0	2	0
firstrunwizard	types		2	0
firstrunwizard	enabled	yes	2	0
files_trashbin	installed_version	1.21.0	2	0
files_trashbin	types	filesystem,dav	2	0
files_trashbin	enabled	yes	2	0
oauth2	installed_version	1.19.1	2	0
oauth2	types	authentication	2	0
oauth2	enabled	yes	2	0
circles	maintenance_run	0	2	0
spreed	enabled	yes	2	0
core	oc.integritycheck.checker	[]	64	1
calendar	installed_version	5.3.0	2	0
calendar	types		2	0
calendar	enabled	yes	2	0
richdocumentscode	installed_version	25.4.202	2	0
richdocumentscode	types		2	0
richdocumentscode	enabled	yes	2	0
contacts	installed_version	7.1.1	2	0
contacts	types	dav	2	0
contacts	enabled	yes	2	0
mail	installed_version	5.1.1	2	0
mail	types		2	0
mail	enabled	yes	2	0
richdocuments	installed_version	8.6.5	2	0
richdocuments	types	prevent_group_restriction	2	0
onlyoffice	enabled	no	2	0
notes	installed_version	4.12.1	2	0
notes	types		2	0
notes	enabled	yes	2	0
photos	lastPlaceMappedUser	x79	2	0
photos	lastPlaceMappingDone	true	2	0
spreed	signaling_token_privkey_es256	-----BEGIN PRIVATE KEY-----\nMIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgYM0JCbRkj3Lxb2WF\nX/5XVQjURM+qOyKVjBU30rQSoWWhRANCAARQHCfIEug7b9lNpcMi/N9OE5GgnWwt\n68gLV/TM8H8MEPZhTfSx0AhrKEdUwCuxnLfJEO36H7uUbbpzixW5WBmN\n-----END PRIVATE KEY-----\n	2	0
spreed	signaling_token_pubkey_es256	-----BEGIN PUBLIC KEY-----\nMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEUBwnyBLoO2/ZTaXDIvzfThORoJ1s\nLevIC1f0zPB/DBD2YU30sdAIayhHVMArsZy3yRDt+h+7lG26c4sVuVgZjQ==\n-----END PUBLIC KEY-----\n	2	0
core	backgroundjobs_mode	cron	4	0
workflow_pdf_converter	installed_version	2.0.0	2	0
circles	loopback_tmp_scheme	https	2	0
core	lastcron	1749888601	8	0
workflow_pdf_converter	types	filesystem	2	0
workflow_pdf_converter	enabled	yes	2	0
socialsharing_whatsapp	enabled	yes	2	0
richdocuments	wopi_url	https://cloud.victorphan.net/custom_apps/richdocumentscode/proxy.php?req=	2	0
socialsharing_facebook	installed_version	3.3.0	2	0
core	lastupdateResult	{"version":"31.0.6.2","versionstring":"Nextcloud 31.0.6","url":"https:\\/\\/download.nextcloud.com\\/server\\/releases\\/nextcloud-31.0.6.zip","web":"https:\\/\\/docs.nextcloud.com\\/server\\/31\\/admin_manual\\/maintenance\\/upgrade.html","changes":"https:\\/\\/updates.nextcloud.com\\/changelog_server\\/?version=31.0.6","autoupdater":"1","eol":"0"}	2	0
richdocuments	disable_certificate_verification		2	0
rocketchat_nextcloud	enabled	no	2	0
socialsharing_facebook	types		2	0
updatenotification	calendar	5.3.2	4	0
richdocuments	public_wopi_url	https://cloud.victorphan.net	2	0
socialsharing_facebook	enabled	yes	2	0
rocketchat_nextcloud	installed_version	0.9.6	2	0
rocketchat_nextcloud	types	dav	2	0
wopi	installed_version	3.5.11	2	0
nextcloud_announcements	pub_date	Thu, 24 Oct 2019 00:00:00 +0200	2	0
files_mindmap	installed_version	0.0.33	2	0
wopi	types	filesystem,dav,prevent_group_restriction	2	0
serverinfo	cached_count_appdata_files	624	8	0
updatenotification	update_check_errors	0	8	0
updatenotification	mail	5.1.3	4	0
onlyoffice	installed_version	9.9.0	2	0
serverinfo	size_appdata_storage	5285180	16	0
serverinfo	cached_count_storages	2	8	0
wopi	enabled	no	2	0
socialsharing_whatsapp	installed_version	3.3.0	2	0
socialsharing_whatsapp	types		2	0
spreed	installed_version	21.0.4	2	0
spreed	types	dav,prevent_group_restriction	2	0
serverinfo	cached_count_filecache	715	8	0
onlyoffice	types	prevent_group_restriction	2	0
files_rightclick	installed_version	0.15.1	2	0
files_rightclick	types		2	0
cfg_share_links	installed_version	7.0.1	2	0
files_rightclick	enabled	no	2	0
cfg_share_links	types		2	0
cfg_share_links	enabled	yes	2	0
richdocuments	enabled	no	2	0
files_mindmap	types		2	0
files_mindmap	enabled	yes	2	0
core	lastupdatedat	1749886266	8	0
updatenotification	contacts	7.1.3	4	0
circles	maintenance_update	{"3":1749886201,"2":1749888301,"1":1749888601}	2	0
backgroundjob	lastjob	9	2	0
core	files_metadata	{"photos-original_date_time":{"value":null,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-size":{"value":null,"type":"array","etag":"","indexed":false,"editPermission":0},"photos-exif":{"value":null,"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":null,"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":null,"type":"string","etag":"526e1447156203b1871ad25ca7cf2d8e","indexed":false,"editPermission":0}}	64	1
\.


--
-- Data for Name: oc_appconfig_ex; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_appconfig_ex (id, appid, configkey, configvalue, sensitive) FROM stdin;
\.


--
-- Data for Name: oc_authorized_groups; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_authorized_groups (id, group_id, class) FROM stdin;
\.


--
-- Data for Name: oc_authtoken; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_authtoken (id, uid, login_name, password, name, token, type, remember, last_activity, last_check, scope, expires, private_key, public_key, version, password_invalid, password_hash) FROM stdin;
36	x79	x79	XGqqSeELnnlfyl6u5sHgPTfNk0+U9UAXuCc+tvm2jz0FzRDYG7VkjHA24956cctiyKrTYyPNqADvIVvfFv+mTNq/uRa4F0fB9vTYXb56//D3HFNJHP4OVl3K01UR/1S4LX0CbcohS9UdFgLj5H/j8NY+WBuOmrBFXNqSbfGknX+pvq2RrLF6wiNTFbP530FSKPNPJMHHvLr6lTWAEs8Qrv1V0cwDvXLlQQer368LR8wBx90iMbvP797iW8bRm9deBaA77Tnlzr4tyYuBH1zuIfchDQfHcDHDyUoOA10fiOq+A8f3L1/S6iqtbcp5eicN9+3ke7N9lYCCQvjvqDhWVA==	Mozilla/5.0 (Android) Nextcloud-android/3.31.3	2963bb9cef4a03bd7728b60051666c08606fdc1ff9df3f92bb55c39da88e027417fdf8ab0ff540fba4a7e19ca64161641356f1ee3ce26c308f9d7c9a73029431	1	0	1748677968	1748677968	\N	\N	f03683f3620ea06401a7d3f574080280909e1656c3eaef08e4f1ca715908c0c9e4398ed7ea635ada6754389b53aa8310a0d999745fe38471b1f4abc716129c8019ccfcbeda0f1e8e1091dfb8b45e64bea7cdb5d469631ec0e35d08dc790e072a98ed5c7d491301f4e2f5e64fc3012c06ae2a211c10d52495facbff955691dd3d48f40da254d986a75e35da7b7548c0318f964737874aad47749ca6b5bade47a897cc1dfdf08adf0eb8a9427b25b58fcf461a3805c17671401bb0b234a197b4e0cda80d78095d7f55115301475da28299b69b979e2262d1be0a34739d7b82f138eb421f8c63a11c45f4eabb9eaef64b7e8aa03d2d98ddbe40af1a7c0d2e31bba5db143fd24d3604f89976bafb5149a5c002fca19a9487b96a6bbfb87ab80e3e0297d44220f44c6cef8695e286e8acb4cc5e18d3afdcc4f76bcb130ddd26f4199d5def953157f689c325d5c163f5da2f0c2607a0a2d945eda034d90621cf1ec7d5f99db79cb50579f57704a1d493536e74e0b6fe5834dd0fab1eb693290ac7768f09881e4649729353694f2bcb15ad6775d4789d15626431e31260471532e20dac33c5ea9f13c2de8d5e2f86d419349a123694553e05a734278d5b3478a130f222f78e29e169f677d5015f46c60488d745b6959a535c51f9ff4d2784e16273bb8857c9cbd2753d3bed492cc5afbb145288f91a0e12d4d921f8e4e3fb46791eb08ce7f3b7aa9c3ddcd696569a835111ae0263f7533d87c0989bd508f99f6643f66f7ba5af8bfcaee8808c3f1e539b442b901624796aa9734d31a14b5c08642b67fa243f7f94259dd5858a4e6b9989a635d51cc2bf4a8e059b9175b8f65a48aae8bc109ea0ca7c7e5a1cf16c702ec6f5ae9e895e83363bcb9015dd3f87a025e43abe32cb90e240bbcd559469eac6bba6ab61f1098142803a50c190e014f6071cfcc43ecf56e8f6bbff8c99964b7abe21914ab086bc4458278fb079bab7cc5bf80dc6ca54f596b9dfb2c4c7f363e0eb5963bd19f5ee64a9b0b6b22738856ce6cfe5d9050009dd34de52296b33b993b83b3ae7eb268669e73910ec1080177046abc5a27518967e0cc1c90eb696f3d38ac113f08a2b94f81d7347fbe547e36f4f97d6d5887c74caa0c7df08799e643d61655498321381ca6d1b00044ddfdf16664f4ccb7f994aa870ec442b4d21ba64002cb91746f1189028eed678c788ccc87db623af20483028a69e2f5da0ec892cf19a2e93fef46d4a3d9459136e35f2e8549f1d5b41dbf37560fdc2b6119d460149da70ab6b838f07c3912792d8ef3df6dacb384d443a0d259ad858ae183ff8431a4b6e8166781c68379bb6b964b0d6e7b54745786ea3c788e8710c423d1b2e1e36e518e44d540a9e780ed95bd028efdc647cf6eeafd3ccd553c6db24b72a07fa75eb278781587b40c557df72d6ac18704525549e269aac5d72e64726a45dd75b22e2c862642f71066a7ed55c326fcec210f0a04d2b39619c37a71a874995757f15bca4dce7728d51f7d32fef7981dd5d375ec28fee7b8c3ce0f131645c23f77a647b56905e825fa7353618a5478d47f5b1e3263097483b6babdbc5daf80a0ad8439f1e38f8e1042c9e1057f89b81c4edac4c31dfc2e0ea265fd891c2a19312e2b42c470eb6e634a99dbf703be6046759894083e6576aac7739786b435961c949bde9d5fc3a74b7b00946766dcbe366f63f7d1b077da979c1fda908413a9a6d1ab11797f210feb39019baf9bf59dae438458a6828fe9a00d9bb8e22cdf1fcfc834deb38c18a62d5e2987bbd9590478d9b2c2ee78f3fbdbe65a232bb0b2adfb27fdebd0b1c131e6a012d9a433b3750c1bc7aa5b2a58b9e98be7163265c847dc3fa70a6e8fbb483397bf8684512b5561f5359ee9f1e303bd59407d4e4e88e6128b178de6434c86c2c727f4bd6a563b364c4bb8b87eb8ef58fcbcf5ff30d8d06c5ebef531d4752b8929948e6453e2d39d3c6b58901b694ca9fbe0c837a2ebc515c1be7471224cdabfe71c70c6411f985e7ff0e7e45c7a1e4991523ccfe219652b0dd9e156c22143d77f0d9a5dd8596f63438bff78201eb2bfc76706901d0916841df35fedabd275406916294d66a6e010e680e95832776620eb35b4ccfbcce9e715382a4202b0234befa53d2ae44df379185e081c779ed8f41206eb9ca3edbad72da64f4b39c68d8a3a79894ab896b98d3e000d0883c0b925a0fa62b3288b298fcd9f7dd3f73fda2b5b69a3b45e3bd95c74a0c2297d97ed2f1d8187f57acda587ddc6e4470302736c7a73ad3669251f42faa8bb27d4db37910a5c4e6f0cd0afc33b0317fc2fba0f10652644d007bf688f20c91ed8dd9bf22dcaad8f790eb9293241c02031bfa6a3c4cce05266d421aa2b3972aec0ed528a0561f328e85846a29c6015576d3c2|46a8c66421db4f7b6c5aaaf2e95c18e3|30f5f93ca735f562d0bd2e0db8316397b36fd1d60e1c03c27d3bb094ffac95f99df7f564b1874d4704dca22132f98709cdb21716291b2e1788c752171276befa|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1C7mm3z+WeEbamRjNI6U\n6+Yy9J8+cDMgMFjsPUS/iUJXIR7dDnunPdMYUGHn7uhg9In8YWUf2YH3K0NRwCq+\ngCY8oyFblyEmYAsK5eKzfDsalLIRCFmOKeZNAfQvDOmxc9eL/XeIoqJ71Dl3+MD/\nUEn4w+Py//lJ41uMFd6QHMcK4oDD7hEpttHztl+utHGK06wcNdFY3DmMH6nI0h1l\n6Qe9kxwkV0IW4FA4O6UBhJvZnDzGrizgsLPw2z5xzcwDzopWHA4mwZXnd3Im5QLx\nk4eGkMi+ByTI9dO66q0456olc3jhcBIhYxH0FlPEb4NxJ06SS/52aBtlLxD0dk5Y\n6QIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
39	x79	x79	SCzIg4ubA9q70U3xutFlJBsD2TKKBXmUTVd2MjAwYqKfMm9UlOW+cf3Hlr4LVXNfKUPRB4us8vdLEO9UJyPXglN0voD4aLVNZV4MCw+Xhz8OEOcxheGIJKtL87xFd+zzEnn0fk8heNOh7KBEh8ETse9AIjFZbR7bWY1j1B0tlVCnxkS4qlU1ZqMavFHI/DKvVnNHZ+JponibdLWOyBL+GBJUB0qhZ61o7gJ3GSEx5j+jx1gdT/33xGQw+V5pE+gP9WtkIEvRYnKHsPsj+Y3Zhpyh4FIfKTaM3+ckacIj26wTsfvAkHfMbjrhxl0fx4noM5/64jo6+heN4s7Qo4QRPA==	Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36	8af93e82cb574a51d58b2f14eef7ae295c657b9e87fc27b846f3aa6cbe071484ec39e91b2c3cf96a11bc6b90efaf4d55b1da3ca9fa9b30e740c1af5f92554fbd	0	1	1748678536	1748678536	\N	\N	d3c5bbe2f5f73365ed1a2c04052d1440c724b2f59c27bc071e7650b50fbd3e495c98190a1d4533d2f9514d635f9738d7e8c36035221837c40296af45ed626f1b5347c11216c8fdbeb21bc4ffc2c4c5cc032c1cbc6c232c8a47fdad168369c0b2c8de72085fbaf685248ad4128faf14f5660621ff81d894b82c55154258e0f3cd4d919ed726d4a1971031ec6ae521fcb2e04b4d1b174a66897362434ad6ceabfbffc1d70efb5aa46559a5412c5462608ff138ca1617cac1e4bcc37c929e412e02948cf33e65b036f048b3a9b48f97c09e77492f00317bcf9f042067ab9ee4d9abf9d27d2c42e19d18f960c8ee16220542a2b4f8793f1f7a2022d0d4ccf6d6040d8f99db24ec59b33175dc40fce1ce210bf3301505281d1801af6cdf07adbddcf0c2c26777c5e61d23290efc9caaa2f5bd9d0a34a5571105a6f9a487bec054ca488ced9d85f39ac999bb263c04a36f28d15f5f52aff510cf608c904f4be8a68d758a2e83c23aaeb937dac86d5ad34619d1584d0c6dea3bdb015e4f5ee0d452b3a8afe0bdd9198bfc3c74246c4fff0cf77b6375d144b31860ba80f63f8f6fc09b109d3e85f172505b4317940ac6bec3cc45a9baf87021dc39f6fb0ef474d06bb67bea570e82ad4b67ac08315b7731fa14a83ea285574dfb2c9c46a1ce1736a1a563ea417a6fb0d889c7afd65cfb1c71285f1cee2e24a4202a16b9e7353c8bcb6d7967c62a3966f8f77664e0e046bc81bbf9cf60e5306c06e93948ba2fbe28d9c8cc2578942c5ff11392c094721775003b9b82e6be1d8f931cd99495050d212a576edecbc94782c8770c9829b5b9ecbfbd471d56341a3dbc4c5d0efa88d0eadbe1822bd194746cf8d440283ad94b2575f5d0a15e8ed30784660046f501da63d6d083fa3941b7ba60f4da1686471d605c1c89fac1b363cea8e1520bd385ebd25d9f9e19c908e030b86d6f423ad3c0a4afec1a55a468421e95fe98eafa290a179c96b4318e575c0b2cd095f46c87257a70a71b8158a5e68ed7de86e7d7e7c7568c60cf1d693f5bd7f89224cd4fc3e4f4f1f15a23a466c3e0bf6de7f0852d455abc4e0eadc5bf64cd84ea736f01a90027d1dcdcb8dd093f9dd7aa99f214f2435a57bb23790657718db8996ca79faf1bd27192e14a35f4f2b36d10b61b57d885d74afed9534d47fa04ca8f2951d7376953ac660b8b24253edab3a2ae88f1ae1c06252735a67d57ba9e49c332293d8dc698b820edaaa8a026790f2b7aca4061ff479676b962826c6f0261ca2fce73ac000438d196c9da34b2b609d201d4ebf2a6deedcbff6a122a62176dd4976236c29b2ca82ab7e049a7ad408cdd1c9d9be72c4f429de3deaefec6129c0dcd21139ed6db3164b608c89c95aeded7138ea3bca2a2ab785ffb1c49a3fd331f28559a4b7ae01c483ce5d211d6b8dd48f6339bf8b4ab4572af2dfbf25bf6c2c232f370519570eb8d97d9c09e7fd7b550556271c23693374e3f09d2d7e0d90e541e3860f2d0d2d39172052cf783ac1db36edb84809f310ac5cd3c202d923314ac2bfff890d8d9c9b334fdc611dc49768f01c8cfc3b64490bd4d08953a42d483ee54ebdeea265c148aa05c3706e5173d683af3abf39b779672db8cb70a9c5c74091b83b8396744720a291caefad675d3354fa0ad6e2a05cde3e3ab9f1a22475b6f7bf7c0bc091108535ffae2610070807af26e796926ca618925b4429704006412824e3b268c24624dff11dd93ae554e7e672f4526a183eeef7c079d36ed8363eb2b8d05664f80b0f26dacebf665c1552f853684140d2f47651da372b9d7e4b7dbcda8c2c9dfb7dd1c7adbc39d50050c1b8be66288b15866dc15ad89cbcc3b3a8612b09f8ad0c0b340b53187183ab515916f44d2f4ec35881086566b3bfb3b875bbcd10699c699a6b1407d5be5f4a5f12a8d027381662e5877ab243678797e4ac833f7ec0bc66fedfcea5eac602b00b13f2b1ee9e6aee1fd22185ead80d5ccaae40ae8f5baa721fc024b82b892f3bf5c5b7c42a03969471f5fe715e8373a2fb78f0e8f8edf797a9ae5ddb0773dcb82ddc478b9b69868d9961718e1ce3e964d39fc4ca192a157d0261658aa9098d7d79e7913c69884a8b5b24bd034d6bc81ed48ccb14e54f2e2370d0fe03279df3b6a9ca20802b097f01a1fe31cd4b16c75073eeba0ace38dbfa8d8fffb73a951250e0c13ea043a6a4f2f810760e24c5a33a13bffdf00979ee8865dae47ad0794e964082619053d7937ea182a14181f3c62e99a04b1c229039c256820404d9889a5f5a7928d7c6fe4fa838b822dd4a272d79ad6dc263f97f31327f1476ee8423d100a64065bb4ababed2fee605cfce861578818aad329711b0787050889675c4bf3f77a6b46d3ad48de5d99fa08da8f943a097d07834f9d989537afdbee|ea629eb165526d41419d697cb5c9171b|702137e9ab2c32e85f068ce1bb229c1195245dbfb3e6a09015be1f2f4db12d889fbe040593f4393e20468baffc7daf062fdc15e46d63c3c6016aca042df98570|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiegJuU4DU0be7O45EgAN\npqaa0i9S4p/GNrYwYyG4gXFuGxq1cPYFkA3TK/YNvdZanh+g2sEPKlEgjgRdjrUJ\nFNY7aO4/rAzROaEkwVolEUCn+6z/LZHRoLOB82w/tx922KnXPesPoTBKAza6gLAZ\nNfE9jCfFZLFU7GFupFg8mjJfAB377xxbd7BPhE/QQJrNAYk5WJAvksLPpfPfIYmw\n6MEO4weVPMjlhIfb3T9qYo2fNDCZ5S3JAwnBbLI/G7k42Ihb7r7mb8B4N0OR8FvB\n7Lc9Pwt79cgCjPpzr7J2++GVyWTQo3i35acb0SC4nH8dBdocbXDwPasTGEcr8c7V\n4wIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
63	x79	x79	S/O87TW5OkH2iG6mocOqCzXIVfxOoI/BBoR968B/SMbZUJg49QZb90fEKqLNUXymmujNWRW/cQJxVXUwdnATQW34furf9M10XNHVzZDvc5tr7XqgrUHSZAxuPAllhBe47QZT0+F3WnTiB+flmHDsSvPlOCczgs0y9UKlOPpRC9BBwk+f/F1RF/w3+2PCG054hMGMYqbbhc0zneMUvQMRBqyo9XKUuZ8xoipXUty4DkrdvtsoYnFgiJY72KoTWdJnSfjKeWBeNxyffgUk/F7knovkHKRH5f7fT9LmHhZQ55uOtn/OPPWNiF7KT0OJ+OfyPFIjtMwR4tXXSRQrOLfLfw==	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0	44e2d7b2ec82dc1f3b32da231b4f284c1dd3ba002fc2534d96c64576ed5ab95abd89f98b16bacb02dd7c5d85836429b4b47e44f465288a57e42081649262c291	0	1	1749750855	1749750675	\N	\N	a0eae08588b96ffd572c59e75a7a5b7651079a9829a8bfb3c2e4a51cb3c57e7c877127c03fe4fdfbda07c2ebdb00aaa3f94ca39ceed35f7239ed333a7127d8161e254d5b2f3c858d9bf0fc0bd1b66cb8cfa8f9e5462a7e1d2f0ca7d0a22de0d7c05944f1b8840c8eadfae64de59bd492a3735c913f2f5ab2cd1bbadb82d948624907bdd99eb74b8510b083edbb1e4962a5394a627abd2886708253c895ca77cc294ef7658586369c7e255f968a4451e8c646ada9b6a9c9a75acbfaafd0ca304bf55ab96472af82eb2adda4b15fa51e7be3f6556ca4b8ce90fcbf9a2667fc640ad2e51939b931e542c9ab2dfc8eaf2520c7271dec6137d77757771027456811736f1ca45287d2ae2df0ce9f3f5dd38437310db0e6886d5d1cea8bc06ca0a967aeaba72cf6556083451f4a2482b1f1182871e6bd6d103767a3abedc2bf1078c4888a4a6a4cbfbcf8a6961bf5a64bceb077dbcf2a9ecf28b4d71a37b36b15cb5c4d5d4f0977db2e530d9fd30b3839678d629a68a8b74d023e01b56b8976a7f98136c75529fe9b01a7c49bfc4ea34baf507c5f61e58662a9284c1a895d6118e50194d3bdb972e41908573604a26766579b575011745331994ccf13cb23b0180896d6fabbfcfeae764d044b96ccf8a275a4b0b1aea7df18d870afe868501af1b826b6a8f65ab020a4d9def32dd190166a0c194d98acde09b3f3dad1b7098a771adbbef9b96acb659060669b6eb2f378ea98db67644eeb2aedb9894dfef885941ad5bc4f32006a1267c41b854972679b31e9f45a301540e419ceb02a473c852e5a877be2b070543abea2773f63bbc6791c34014b9680ec5a8659f91baa72d0b6b0a02a761b1c4baa66996bcad6faa2ddd3a8035030d436da9ba3ae31d748ee7dba3b2dbb1ecafa4cbc309e64838a8bec0d570a3bb359059a1ee1f83d82bcbcbfe62f2cd5d4f97cb0c9ca6f3ce998b12e994f98612f84fddcb1b99f66a0b2a4155d2c654360dee5292f7859490bf92be5bf5cdb7df759f6a22b7f7f0a8a67708ddaebfb4de1288ba7c73de2d06cc4161f1a2b1bb588d7c3eebc2c537d7234b2484faeba10c0a1ae1cdf2e351598016afbf4a2c21fe768b687aeb510092c6824b3d3b2d0c4e11b97dc1e0eaf90344ed606b1451f97828ec9cfa6795b6e8a3486d53a279a286b70328d1d1ed2c65b0c69e730fc15f8fc8d8a4204fbbb88a4187e7c42d5db8f9c25b88a3e2ef02e8097fa45bc68e4eb14f77db6a1b605e784521253733d826e3448b052990095c6187439be0aa0f51aafd230174220155a57c6b2fe4cf34192d07e4e89d548fbc0e9cd5ce0dc7c6eb3b364cef8b407c1a711795d0a6bf251010946ba88c01c8be3b6b489f1c2acacb7fe1589820ff5283f5741eccfe15aaf828db5d15cad510a9768ec3c767fbafdf47d382f12971eb7d6ae29985865a05090bbe7cd64ce0439efab0bf1fe15f6b52cf36de7066efc29be88074f791569a4d6d123ebc2833b554d2f4bb677b4e04d15530bd0645612b7471d356ed89ad1f96424268a595159bb275614a8a387a78f28de73df56b74c84b6a84bbacd8df00218fc05cfa25aa1a732c8e8cf71e87a635d64e2af6bf04c8eb526fd2b33b822f6301381121f1993a69568b43a96282ed25e5eb1b1c3c09e7d903f86adb2d958772e4da2d89b485f8a4eb09e97025045147374287e7a7e3386561b0bb817fa81a52dc69f2db7f0600493010ebaf862675803c3f90657f2f036b3b0d5c9269c698622e51df42a69838e407251a8b856b10d5368b6c4076b5a27d4f679754230f3ebacc493be051c69efe59a55dbca9d4b4a1f34aee9d2d98fd2f81ce738d635c6fa1a6d9b77a2a29e44aac7e3719532723d9a676116860a82029d32e5021b3ef18480848765e873ed697c7e989763eb3d26713cf3b90369f79ef76b74f889e3b76938074afd0c29fa3d5b2b82720629076580af8eca6270c1cf7f72cf2fd466272f23495b117a94fa36a09088b15e95229bace9d3b122d3f3e1b6ab2cf507cf93b6a55c5ce793b75e07bd0cfef08a5fafdbb790e16615416d48e0086b0fd8f405fdeac316cf1474c2a3c8cfac95e34ebf05215bfce5dbf62242da395cc6cb82fda4db808956cabe81a3b13f24845ac619586ad663a9fd7d92909f50caf91d8b3d07dcf53f0a83f3dc9c349f542e0e7c0032cc0b86cfe5374875b4e5fec46a65f86a08f02d895181b3e0e274d66cad58b030f40a1ac6bdffb237b0edeaeeab73cb25a32834f68dd360bbdeaa084b1296da0d624c6a44ecdb8deb1da1e527c0c83caa66d8ff8b69f080282950a469dbc582cfa8f3a8358621c3badfe0722e34da44a5b9ebadfd310ff42d8193c2ee0f36867f6a492131d1fd162f7b54196bc45d805b6a40302e95028c414b4c6f7d14a06ea7|ce41f0c79985307a3a64e3ca6d2fa932|53f3e8c45a12f5cf2af7cea7d0d466e5dad86045c670af21a40573585939fd87577ebf0cb6c7bd1acdca9537003482bc1b95b5dbd2c9194250d099e1f242920f|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtQ4hfOoadraO6S2SF5ct\npiDWF9/Jj0ie1re3eDASgXHixC4mvynS4xx5RAmf6YOdc+3QFweX7ETzOe8zBPm7\n/XqipCTPqKpK5jvsT99b0nRRavB4bYXMCYcspw8OfciJwrqhq+SVIrzZlz0MJ9g+\n0If+UG4+vIICY98MqL9Mqrr1vbYmKgepVfjoK6+BRoCfE+9d0QUC5AHVw3cy8f6a\nMmumrYPMPs2qPY3861zcBcjQ7pCcVy0cXNeETTRRWZ9jgRg+DtMm70XkCToH/0uZ\nx1IFLHKuAf08B7u48gRa0JP/IguzH4OyA7NDxzuTlMnjzebVNp+eKVW5mTYVRkoz\nfQIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
57	x79	x79	bDlijXPqIfuCe9ffCg0X9QTRlk6ouWu/Zlt83CbDdhlE3aQTa4Y9QE2558GHAH6aVjqKbV3tK/S+y2/iVxFqeYdKqp95Zxa3ppMtwBxP9GRFEf27MUSZpnc3NhNqbtr07sFuX/YcxGTQfiseDDET4UyOR6HLZ0ISxbtiVKUvrg9rXDQw5jHMWN+fBSkm/XTnSh1AZmCIayE4wvk+714soY/2spuxAUN893GoLTvvy4nusV8rKjgbNP4ALiDiLwG9DnLjaA31zNvPsjFG2MiC16iH9NBsnUujCkyukLMFKWQNZYccOTuC1OxxdO/z3QR2rVa8awcFYNdxaTIcZ4qZ3g==	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 AscDesktopEditor/8.3.3…	e6c92b7af497f815743ecc2124ff59d0907f2697458b529af474e46406a67f8b6ff78df38e09110d6af4936f7dfd50684a4b31ffbb09a7a82e3b356d462d5295	0	1	1748933017	1748932887	\N	\N	73fd7ccd19226bc9c285152e633ecf26b076d462d945ac87d30fc42afb2138e3c3107b5b0ccd0d541522724ff5bc6c9c44cf70e5d56bfccacc041f40845e1f25e5b9993b57106b64e31e9e0c80c91e61d28f0dbc2819b2382c98487eda3809ad305d9e46b8616ef6e584379a2825b8c9321f93ec11f1e958d703e6727b2784e91fada7c9fc0fbf2bb0a0670d368c3935d0af2a66ebbd0433547f908ac8ccfa144f9122f624e42feefa0c171079ac27a1616040f74065a362954f9f446a015133fd63096667265aaca3a6969e0b9778a817ef15a09d368b24b182d5cb57396ab3ca6ae2925047ef6c4972393cf0bc7a2a7d6df579dff69419024770d8ca47540eb2e0ed1adbd1104b63de8cecb813154b1d9d864ea3b1da1b876ef531492003b1489227ea16c97a92c90b37f9c0f81b5c154a8c743e395325d32056b4a083911522ea3c3452da8568c414524d664edde7d369989e6f2d23c18d51d7b724b07acb4f3f94462876f082f5647004cd9a788e96da7f423d33eaafc957869d54703ca043aaceb9751a7e8a4c415971db76833be4bb8977fcfa90d4e6dfd13c7b67175223bf1a9e5d8839bf5d2e4a66cba7d5c459fcda5c9cd181f3dc80269e2371265ea8ab9b6640d5c61efbbe572a4500fdeaea233ef65063c886f510c47d693d470608dd44dc3239af922eff191970af7ceafc1c1434ce924f9c472d1d99d650d8e7a4fce3f07313b96037e022a9b4fc27073aa0fbd8d86a77abc364e0022c7094b954aeac57a3cb7d635332bd6c07aeaf786a44db8e036c12b8fc84b889179a86a29fe17b59e1f9af74e6d1d8cafa5975c95d9d2d1a56b8dc893adfa06283801b439234461ef53583cda36ddeafd3af90c6e649e2ee1cadf7a75fc99cb4d7927fb20f27e798f7724fcb8125116d9f3742e9a61c52dd805af7a67bc4b82d7964da725cdbda156928ed4c18a73617a6d71a98372b7e4c4f78c515b4b8e0aba6ef78e8abb3e12fefd637c90c4e115bd0936f4c535d30794a1f4210a99d411164448d917213ee45fcad8cfaaaccf33e58a261d3d2d59ed831589b74d809e610edc129a7efbcae0b7eabe3356242224b61ecc54390b55bfcf5f4699c10e5a216d3fd2151444b8bd93cd3bff52a5f17cba09c6135113a9e5e6ae94b47fea307008d97a9133b49fc536531ce08406298330f42e8e436a24436fb4b40b70e6b0d1f8c933baa26931782c503b505fa8fb57e8c55b8c47f5ee383194d1f82d7b4e5a94dcbfab0d314f31637674e1de5de47e621941767c2c9f9dd031ed8a923cc3e1ce60ece942517623f9723f166b44bf5dbafdac5784a26bf21e4780fbbf0dced21264d7de17b829441ff4e2a5bc858c110ea83611156a3d9077a4c7b9c60b52c38ecec2b6bfd096466875a7693a68ef2c18a2d0de3b3466fd242d4a69234c08027c1fca09117dda3f5a77cb09dd377cddfda728176c6967adab1cdb1e01bb3f721398c41f66dca603d6d9d4642d37dc3caa2d9d3bdbad07916a197a445ffb9c15707a4261428a1633abf324ebd4639a3601df8ad3953d0b88d1041eb33a1638e27115290e5ebf45122a9f264eac15bec683a8c6bee00fec49e15e7159a5d05c6392007e0083ff37c11e9848be31b95d8debf997db9323fce9fe3a2723eee5693019646181766f8a7f4dc990bcc4edb5a666fbfd37d4231139d598b8295c140279ae37ed7c1e2c4513a7286b978325d64bc4c30219f1b340d937fee6ea2702042400bf988168af319baf528ca84b1f872adfcafa86113c8f161e1089c009a13bf7c0f9826bdd087e0c829e98ab731aeabe6729304ff0e1215d092023c1a30ea6611d02aa993664dc3ea834fbc9ddf59403cef5a90c72645e59f1941a06117752f98b52ea19c5a9af4b264e4f8ae86a20ba08da46dd394ba306324bdcf237de2b3b9e4d5b28cf5beaf063f55c0f8a26282b647ae2890623382e8a531866f92da73e764e9f956c8e9b2ed1fde7f6a9458c1e709bc90bd0b22b5c484fc9dcff0f4181de237db33824f3e0173827b8a0b7e56e2abc652ed006b3108a3799ffbd88eae166f9d44a4b6ca62c8c7aec850fb57da89edcb4f4a06567fef39b2da43c7a3feb8bf95ab6b3234937048f50f8e4ef7dca3bd5ffa80937329a50b6b974658289dca32ba8e8614cd4fe43476450fdd3a27acd8c0a3c632d2f3b23710e096e339745260a42b8f4c11d009137fb31726d04fa85457b64bb47e80a9949b0c6b7e68cc69788f8efac84e7ce7d016626dd32f17b379fff72e19753aaec3b38bfb3ce3855fc197e07547c925620f7934ccfe5cbe8e81aeb212f6d88ad15284ab940b3c22beb202c65223749c5ce7bd64e0c8a1c9bfa7bf8aae19e2a44a9e3b02bd992906a41204727b2573bc21c9a6807d583edcb5819d2883|424ff8110dd4c92ef334ab9928f2c0a1|0e9b652f4f5c86bdc3477953717a5fc78175b60cac9224f36777fa8b41c97be0123dcfc69b0ba12518d57148c50bfac5eb605e911148d6b17b94db27ea832bae|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwlC9AN4smk0xIgO+I6DB\nKLIrKcelEbRdU5SFlYpVV1yRcXuVNe1jNc+Qj34VzmlHnzD9qvaCWqUsFAaY5jOT\n+Cbj7HRPR0MQVD1sMNG4huJYbmdnJoeQNor+I0SCVxPpe7BEIr0j17IH5lz2RVGh\n3O4089sKdQUcDs66ihRL4LGmnJvngRShbzxsg0cJcKNFcQl3PaDLw/j6l8avOVD4\nArrRyLYWcGFVFZm5/EIxbofmu0OcuOe/BFkzXAswdt+1TEaPWKfy0BgzmsIt4vz0\nXpi3o9mavf1QkPSaYFZt1Hv/hTA8v0y/gfO9hqzmer+pTY6wAwRsJZjo0lknwkk3\nRwIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
64	x79	x79	hu7F5QlufhPKiMFvO2LoJ6oBOn1nd1axbwFadfieop2mv9BzcPQRgb840BhuDshEL/pPKOhyS3tSBYbVsXx0oz+KsWClUELM4jZpAKucauHLc0thJGyjQVD5HXkWyS45HmPDypEFLandf+RmbkPmQElPpPW6vER/xoM6a8K5pGmKZskY/IJ0ta5PLIq2arMFALKQ1yGN0WHeGVtYUjkuMRdw5yPzGXIq2LaJe4QdnVpSf7JyZfzlOPY1SmaMFYxZbsh96nWd5d/l8311F4aaBhpHKA0U+K9iVHoE2NlvLOoqjpfWF/AJVsSamkq7HPhdpPyseKIdB2lSPQrELYsLGw==	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0	6a22d12038226b5c1014bad84b2f1cbde5ae56ccda876395491d241a22eebd1c9947a4b3bd0c77ee2321162087e11d7c84d3ade81a39e338c4d82b8281b99f52	0	1	1749888070	1749888070	\N	\N	3e1344c54601829e23ad0e4372449e0dff2f6651f426eba1c2f11ae07716783ff4cac5cf57e6d8f7d02aa096b7f34c3f291a58a8d270d85d636bb8f25d152b0630ab18e601f318eb73ef889928e48c978b57e77a8393b51806d2002f2d6000bb6d6372e13ed328efaa376a73865d933a4d7ab9c6449793fef489972c16af44d3d830b4c5e55eed212e7f72ba82d13ef13a5a5179f3979b561c3874e16cea98e62d1bcd5049fbe4bb65da303aaf7bb231639a85e290898c6e255a12f5b5c1d6b588cef9b982582c856a34c8d5f8619b65afc15484850a5941846bed7cdc4d5d5042aba39e36746a3ffa53e469f6cc5a481bd5a6b35c98ac807e9c663a6e198a2171a81e6807204aa716579b806bdad80c270533bd71cb82fb811e47db2c17513ff5beec35079fddd7b64498f6bb7f01f55bff59bd52e0df695bcae827a17ea9c979ac16ceadb118bfc0a79b790070b0d25f01ec7ceb65e1982d70917e381f4e9e7d232078945f0f5c35f68f6601f0a23cad0610b2f0442cfa56b0d3614baa62a6e1b5a7c1791a3faa20b360e180adb726510e216de67e8b65a578b02e524af61063093d127fdac34efd975d8a7ed004f87a0446ba2292ee455117847639e41c5617cf72a8d52a759d31747d090f2333fbbefd051ad6f83cce7967bbfbb39d91b42d42352486202ab4224aecc586dca5b5316248339746a0f248c6c008cd2b163da674678c489aa0d4ce7fa186a3e1a659fae798bec3f2fdf7338630ce3c445e4202b738c67d3f6c85e62b2b7c33d9f4d2e965ee913a54a5cc3f2eb1a66ea1801b0eab1ace45c6b3bfe65350cb02b6a3f1ad4924cb0c0806db6be193e64513e5f25aeeacca0112557af0a1f833864ed678d62d814b57c87d1a533a99513db0efd245b6aa070f7b52cda1ce0cac770fea5301bb005a0a634b7c64f4fecf6e9282c687e6f8fea597099f141176d0f78f75b0c0002d69fe839ac9eb91a46b37b7f4e6b6f9b1b6de3a10a3814e02d4e23598d0a6b4df7112f59f6c3a697d3a15a2a607b46450cff84b49af93c6e10b37c760439d3f5b7f6a427905cd729d1273112fbd9a5e72e345164c5b8c446404a810c275b49e0db6e6a05ef76e5709192cd1701c3b25260fed29010a12e5d530f7177f0ab5de270f3cc8cf8e7ac62844d045f308da1d449d5d8c0f4cf279555a4fc3dca058eb67e7a5e824264dda29d3ba62f7ba838c2a415ac3e6f961f00e30e2a6aa8d46c243688d195f343b5bb3773d429286925a3389ff79377a64e8a9ce77a35e38594934a82daef460b13dd2c7ab4f032997f8db400ee061fcc4eee40ab0f08adbf4522e50d46b22987c258a327104dc1d9fc6bcb2aaa925789931d9ee0de21abb6e77cdbc54987474a2a33480b1948502bb3af063d484cb82e7b0e7360c9fd3ead3d28f912f4879a1c2870374a4c391a00d43fbb07a52ce991d39919107d2775bd4706ef8068dbe6a6b62d0ac72518f67a2182a54f901190321ccdf021109ef556ca315bfff117994d6516f4432b9a7de7b4022e1b8ba37a39deb34de25b66b54c59fa9fddd9e682705458250a8bfff2b4a456aa2028aaeb6a96452028d9502fcfded679e0633873694f7969d8e3a5b5b94e5271d771522c574809f169b854f2c4290b6fe26a3f56eee7e7b71a53e2d751136271efc0d045272dbe1c8654ceb21f959e0b53b71f70690371cfc8ea89df0bab49b8bfdef5fcbbfa13167348252ba6d9e7f6b4104191fef608e0a2b6a4b08830dc76059f3d894525a27b2dc97f365c19599b2c473aa8ca59c86d4866095e621dc55122be38ad0026cbbf6d09d9b0f11e7bb7341b31e8ed154aa27b2faca976326a86f2d536e6db018757666aac698affe0d7db8a3ec4c3bf6a25c40d9ce22dee815b28e70aeabc9de1150164489bdb6c07d53b9ff63d0030d600f11fa6a3881b5f3bb562998c540dbdf0f2ee6aed6b1af769deed62be1ebf4735970f496e37e9ae438340d80c7ae26c29002562da83777e6391f1521d398e6e7427c35e19130a948adf20927dda4f0c22bdfbbda4274f0d10ba55221aa965ac54f4581f2f1bbf94d6a486c9808ac705c03b83202ea83b50edf38b04e21ffbdd087530e88d9b72e3278e71e06aed62cb4c180a41f2ab366d3c69c76b2c8a5f586ab572144c8508ecab9eba0f707d6d0ec1335239e2b2477f19ec7c76854288cb93f9eec4202397b22822038af815cf5af946d69a44fcd56a2224acd1484887440565d8f3e93d200303f7ae57950ea75faeaff6ece95459bc835ee426a0f89d87e67b9a003fc531415d272dd6dc56a511bfa0a491ac42a7c8fb15b75585d6c593e1c34c8d68ec6ac596572dfd72053f37b60c61c70fb54af136453ce80d7df64264afae553d59d76c44e8c89838afa6cfaa19698c5c9|ada7be085b52cce0857bb4e19e7ecc5a|caead75329e44285ff3058af5c46f58b1fa003b91656d6e78e8732689ad85077cd4e0ef51e40d509132b1252eb4dbbc54558496275430be2ef4e79ffbd485cf2|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAzeGtBImiopD/WZWEWa6r\nZyfsOR4noM/cDi4TTQfQUjTqf8i+iTi6S7UlBQaZY27Mayf8BBcXyUqzgPpEUDDn\nKscDLHVWRMWNjrMUC8fHyC50GunW0H3LkWi/2RZq6M5RI2LWw8ubntxxLaB6Zhr8\ni7AU3aI+j+QoPbFA5fRqZqLcHPifZouynA1/teftn3y081qK3eFlRMBFYo+OO/XJ\nFeguNm/9RDz+M2i8azWekHYBsftA0cG1gtMvWb1UKObAIa1NctAB/ZnoUy5tz4Rb\nrnCPfomkaG3eik8UKY94vP03GxUVJmNfA2xQ4a6wNhVyz9aMVTYTTTWd9WxDBEPW\ntwIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
56	x79	x79	ByYdNe4NyK3pgmpFRk/4wA6v/m/ArDttFiHz2kEAIQ4WeDliQaF39924fzoVU3empiaJdC6q/hoNPxv9Oagxys8y8rTCsKK3Hvnj1WQvQS6qSHKiPb6iq5Adnsoe2E2iejsyCxgmqVtb5ESAueiat+aWpM5AJ92njFcyWUVMiVAkO2GY2JHKOMquq4CAvHLytb1nlmR2Hgbz6uWBV5cPlNZUj/13pnYgqD6pcIVAoz1iSOfBzgQ8w1yWR7Li+8f9Ne8blqxmHGWUZFrWBeGCp3I5rUcWt7BR7Hu3AJOQm4jqwFzOpOp6I7IW3WC/bLL8WKtw5Uh+hGgbtlvxNEnObg==	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36	3ffdfad80e99ecc88ab015ce9f5ee72b0e27d08380c62fd2c563f456779a0587f58ef46baeca48c8adce0b8bdf8c9838f8bf86317d8d31f615fe15c61abe5ace	0	1	1748938812	1748938712	\N	\N	c5858424f8c8c35c8894b759a1f6b85612535d1094dc7766717c74a5c82ab4ef2a79274cce5df4029db3e56f0ce7fa95398322a424085c4255bb98809fa6aa2de0ba975ce28673a190a84d1b3c8b69820d327535d6031c260fb71d8efb962256092e4140ca02c45bdce3f35e6df46c4c1246585f14735ccf4c3464f659bf88c6c5f91558e182f399125eb97bff65ccac20cbed80c0de3acf9420c484c40ccb0d65537285e1a6e9a1b4c17fdd2666f43da771e912cc088c5a51ce3f49afeb1d3d12b6d62544951b99ba206c72342cedac1dd83b9680502b934d3e4e933c1c742c55f911ff0d030257b24c0673d3716f487b7a0c838ac02e187104098e7e7bf8347671089b4f6f1624230c1a1dc078e07aebeb7ced2b6c7b72bc06a88ea699d800540160a62d0eda355ab28604a54c2fbd2a2050a7dda67eb5477986e7e9940895fa3f1370606078bc1e2b4fd3a8d0b0da2d8ae19c0e59181943f34b2ce5c549948cd8f2ed7a3b5cf7b3160336bcae64ffa323d610941caa094bed398271731bbee07ca540968ea8f038d5c5e736253763d8cf5723525975efbb123eddfb0b591fe33ac23fc81ebb971447f53325d85d90c1a6772360413346357305bb5ea3e61b3f5c417d798859f2b1d10828063bdf833c9c7631a6ee1084474341c4b5c4a8212adad40f0293edd97b8fc69722276f397312e5fd2421a2b7864548065d89dd91495d7c5c4caef85921fbde7f6dec3e11c0bccd14d093b446bd4aae403dd2883d14e7510a234a4b99daaab8c9ef13b513d3fbb569caedfd2e9b0106b98cc8a528ff7ca93aeecd678ffde67b1dd0b415695c80a2b6f67cef54bf1495299c3880fe461fd611b495b3c99189e578db5d65eebf5d16e75d0a8d84d0fd11049d709b60cd8cf73a9a520495fb622ae5eb2ee73491959acbc715233955efb115a739ba041523b892d45ebcf92300a8ebfadd0e3da9443b3ffe1c6a7f405320cbae30a1c21c8bbb3cd24f676c1f8ce8bb950f34a405930efe516b53d12624701d8684fb24520e3d6c1c3546fc589faeb30aba2d94eecb46b4c1a4353eb25c81950b8f03091817b116f510d8b2018337e521ff5be63b46e0d9a9814627df6aa2c1897b8c4968356ce6935f482bb1f45078310a36521a87228d0ca0bb37a369a0d48af8e34edd2c383435ab372d80c09604a0ed5511ec0a74888ede607d4379cd267c701248a05e0824ae700fab0aaceb28548dc0fb11faceadc5b0c0cb14171dceb27e3c85b5e1f7819b3adbb3b5eabc18a40ab3ecc8f0d1dde770a1c4fe48a14df7d9eb2917665d1feffd2079e4dbf9ac575c8f45c4bc6921eb8ec7b3dd9352192c7fe786f81e462d3665c73c3e81d6c9bd74e64a777df518e0859703b0bb9d1c2b591530e52be9746dfc977550db9a1b28a8e20c88024d2656bcd62920009c4bad92b4687213b9891a50800a3bb9458314a725c004937ccaa55ade611086478865fd69d781ec6848f108f15fd110d4142af295fb3d86bf03333e860e31175210816dcc9d91ec7fcb939f5987fd61551fb6d8fbf8b9de53aebf4c7a31b2900b675131bf26bd59d011cc8e85ccf05edefbbc4e45cbbad292a776cc55add7be3ba2eea1a08b0c672ecba4e611b49f2c1d821623538b8d879432ed66d22d2f58a8939a814147976bd8d5dde6c17d10527acd244ce3472342f6c69efe77114868398555d1abaf726594cc7a891808f5757a4504439b93c8cdeafd959fd84e28e3d3422fa5c787244ac831db1c411db210061bd1d0d8e8891c1868c64a685bf1008859086b70a65c5aac3905a60c8564b1602f2ccd13aee1d210ea019a22e90f507ba0e9a7e81fae4cb43be69b8e9a75ec2125b2f753cf5e27b7fbf8373092a64b4e5f887871dc43d1f147ed6f2d797de7ab915984b3571804d29cd250189e5aeead162d357eb8110a52d8bcd919fd84e0dc9745290305bfc7f97fed0c27205aa59d8af0a3c7f14b2718e90270b800c11f914ca45e8efb5e718de89eea9102289d89643202d5b708049e36bba5f7a774a7c085ca24ef1197b1ebc0621358a0b6cf22b59abe96567bc863b6326201ee05e79bd0e8d878de48b47eb5f61fbf1104cc6d5b56aa3196e49a557040995c9875c5a4266f1d2afe303c42fb6694aaee6aaaba117cf48564e51b1a28d87ebb5dd097251734c748ee4ff71b5a897bf5b5670129b0beb9d240de7bacb7fd88d61653404e0946a5f57fafbad847e38cef37b1a9b28b0b588b6f18c2f4ea176091f23c5711f2a10564f76b0d784b330380e799347cd1c56fefbf379a4264b4be016a2e193b632a23f939751cdc331c760639bd2de1f07c16b691edf6d519bf813bc7c0bd655c3b066bf67809db6880a4145688f4f13533215648080f8cab466f8b47020df80688f674c9|e04e1e81fd4599a2a04a6ae7672c254b|ec8521e46207ee81198a71b179b6ced241fbfb7ed80adaeeb513f4217cdc249400cf47e8b2e67669bad902d1c3629ca5ea0fc06660a5ddb0cec25eb25e188fc8|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoXPCvQ/c4hDBpVl4u2a2\n7RwhQPKX8Q1gqdccOU5dsMGhiaSNnqAQV/9G346Uj0KnOXMpHMR/e1jYC77Dt4hi\nogtXSKr46k+Ohfmb5YBzRgAnI2Pg848NXcbseI12Mppo0HvecroclB9463b3mqlR\nOtukjISqrC3Lqgf1uVd3TscaSIvEBYkGNj65bxSm4PoxtSeqr3MhkSnovv0T1c8n\nvpKGdL2zifgea4oA7wpdtD1A3+03lxBOT42xAWixv2HpA6eIb/Ns/T3xK2xKRSf0\nleNxVU9fupfBs+EAYLSSxQZrVdWP6R68Oi1J8wy7Wba/p9Eva9iivTk+OmuBqpsu\nZwIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
42	x79	x79	iRqtCUOMS9u+IoeFKhHAZV/7lWDuKS5fbEsYGOzDoXaqB8Z18FXfc0dUxN1wtB0OcXWaTQs0V+418SELVAmwsVJdO+o+mk6mNkaETi3WYde8xUvz8y+vbwkkuQQLZER4svo3P90VgCKheoMHLTjWBmo0Px+/xuy0GyWuw5vRKCc8Z+fFxdIk2gNI38VH+bXddYclIpDlZ60J47OLSVJeqvMAqfv6OqLWdqTp4PTFjzuR+P9D+SqkiJCEzaBnZvWGTvlMlYxjSyJB5ZKgXBTC7zFB1LRU6pXeltDZLTfd4wD8KBN1jida2KlNgJimowqcRAawx16MxXv7Q0yVwbLqJA==	PC (Talk Desktop Client - Windows)	9c98a336a53920a409a52e4f7a0d0f262484399842983d322278c1aba04ed86ac887b068fdc2a8d58cdc92058e52999d785c849db6c9028f300a851c039d3beb	1	0	1749691441	1749691441	\N	\N	4fbf878c84de0ae9650c2273df80ce0eb8d3fb7f4ce6dc219e428162965572061dbae16015f7de5b9088096f23e9bd677f66a975a910ce98214ea78e40470a8b5a45aaf0abe84d11a3156d453db734c587bb43397d1dd1e4ee410649fd49ac5156cc5e048b82ac13bd1bc8a1dfc6191aae452584f91f91fcde8c8b8f22f8a503ff1b6349b78c3e4606b2dc45d58e0ea6393644e112efec16c6ac428617f0aceb32aafc755a0744f71905cc1464f204a5c87f8ebb2db23e4e48835ceee9139a6fb3f5afa033b0d29d0b9e9bc071f308b64ed3fabcceb1fc90e4405aa2273daf7350f6b936f838701e19d18cd7e804196933cd1602d3771fffd04b13b5fd68bbb59a9940c43d82b071b628481613726894fc8f5d9ebc696db9294a1545df54f06abf451edf481f2bbc373dba4533a0c68864b39a68f01054a90936ac3315bb291cead0d16f2ba0de16892ea01664ec0e867aca7846132c785c6a849fed1fdb63f7cb42f6f75030c7a210b1e171caaa59352d3699d37f493a915b47b3947fbdf7ddf0dcfd15bbfa5c7678d0c8a6cccd65c95a748925dd32626205d74d923b134720c9468a278b6db1a65883b1dde5afe13494e515b2b4d44171d69d67528471b8900f74b81a19296082556f904989e9db73fa578da976e85225e68d2bafe847fdbe084ea142c26797f3999cfa083732fdefe2bcee8fe318ed8b0f358c9f6e55950e5b98f1c571705d69ebc80bcf0b16b30c60838bf1e6d3be032084a62933d57970fe59525cca2d61960120c6eac71a31013884322a7523d209f53251c547fc353b096c989adc8ffa7ccfc05dc9fe011ac773dadc2c2e8ead3f3db6d4d8c7fab1d4cb19384b632bd1e0f093cb81c57e0924b037ead7e43de887980b1eed16ac115828903bcde045224bbc315ff755cfb3a549d7a9263ef26f6c776df65bdbe13443b0fce47fd1858b985866072605d96f11b1a71d1814128b47cfa3513eb86b3f70d2b10863f61cdb94fc1a58357fbd5f46c0cb3a10d761bd84d2c605a7a28889cef122be17375ac05bb0fd896c0cb35d8f340c3d3c90eba31770f0242893a0b5e4296a169f51e82cffe93fd84f2a8b8a1c0b6f70f8db14a41db8b0f233f7c5dc85787aa9e10e412d3cbcf3be2dfc6f990e892063e08bfdbc68e21216bda2c6af9566398960db2b8ac5904a7a70f0b2a1502e02aed2ec5489958f5e4c742a6c9d6c5cfcc91efee25dae448842de0fb7d42c6ae9ae14b2b2dc9f4079370bc3b5dc8b3737a158d12accd9174427bad60b1511155748d0b3a4f73b38c29d258d4902b7abda7e71f5e49fe3a687a219ae0492efc8b1f1b180a4202ce52d395fbd1cb2485fc083ee767b02503fe985328efb302bb8d8e564d15f1b10fcbabb7c5901723d390e339254ce59ca73ce7f6a635496983e3b8c5591a8616f59a12beba5e22da4d547e795a1d2576a747768630407dc661fb3f5b819e1f3275fe912b367bd08e11e8aece793eeb719516bc2d42ff110d345cdc626f87a3db5fca083bae92d813bb1667217dfea5775e3be42b46c2d929b1eb5d72ece2c2ef9167a3436cd81ece858c1e705aedf14b7474c251be69dd52b72e6490bd1da1efe81d000d80f9e9bee5a078e75176bf3e2a368954deaca5c7a53f6c959c14067f63356f43d0d05d6bf92c781682502446b7ac82cbe0ffe969ba3fcf24519093a19fe6a6913de1c53facea44ca63b49c8de7d7b07e665f4e02700b83b9202cee187a4e4d0edd8b1ef78a294d1e84ab9ff889780b28761d550c9d1e639dd1613bb790e435b64d75c83abb32ba6247b1e4505b2f8f9192d3f354a9aea999b6f37bb0778b10a45571e1d4cd6c7b14d627429977e3fb71062e1e27ef0169498ec8328da93cec664ef1c48473e87a9031928b889a076bbf6f59b9f0e05819bd7445568ad4afc5e51350eda208ca0817db2565c2a707d245bb1d566e6f592569fb3b283c4ca7a901707b2b4983486f69804a45919995c4e2e71034999418fc1cdc96653927f8e59734f5ec4cb69a0891f4361b2b7dbdb44a266a5bb2c4dd70ef65a90265e8f7bea6b9e8bdbe416e3fdd149402dabc8cad218505ba0f9e7458760b5a3f5d9d6d63636510104e45d615b67d1f9b50d4d3713935ff48d579509dba5b14702d2cd6012e7bc5b9882f77954e825d64a30911ce49051f0d20a89642770154742c959dff19ca609d20feb4d344d540e72f4438689728292fb36ae5d0ac49c2fa34ca384d1fce5dfde3668cc33ef2842943061a163bf82478bd38e0d3bdd4f03fbb9df47f47907de0c5da8b376f3a2279ef86c8951b78d4f553ffb047d721b52583fefffbaf53eef703bc70d782b004ea74711e557355270f61b2dad6ea0337e2a11946084b76961f56a1e8ed1e6f7b4676121bb57bbc3da20ee|8982a8a2281484c3f77e7054bab57196|2f8cbf9832823bdad51ee4dd5e5ec7836252a447a9bf9a83f827fec0b4f945e8ab2401c21dfb14a78e2ab3c58ad844ea8871e4e2367abbd90c766271d612b4ee|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqpRQCISgBf19jb7ilC7K\nBLpcofTBmNxRoLvYkBxp3x/+Als5dqvAhH6elcOmj+u4aP+XpbXMdGcyoFM937Uu\nFwXYthBKLVE8nWbCv10th5xl9jdeZjVO3tb0FTS3EX/KQnBPgEvml1IKuiCX7Ay/\nAZrvK8wauOcwyGyYIP/PqLYc2ntzNCVSOFeDx1bQGXMnjQAGvYya6VG7TcAO4YAX\nCCQr6TcQDPCLJpaspIQ1TGhgO6z4EmasnwqhJaXHpW4cU1LDba5vJItF5BLlil+T\nTFoEibMUW5mGJ/AsvuY5+kr5wCBvqOuREQnwngSX8d/jHjMlZubsNyjTRahmjOzw\nBQIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
46	x79	x79	RQqgVzKZEaru5ppA6HlDTqzf8CpJZEuAr5I88VrMD4ElvXhqgY31etLhQyjwGR5rSQSxImzqa3vQg72QDoZnWTb6Uc5cUGFwSf6vttO1zEciK4NBPODT+/db6T4D40FIguUw+dLcaDchlrJsmTiK5A/NSRPrTuSSjqX41F/uoAX8jo/kXNMG4GBjKgmRNfNmaDKzMhTC90KwwuLMZfj5hIx4AlIeetmb1RbYJIkwiT5ABxGmazOUkdHX95VPmN8aswqtb8fYcXLKO8A9f4T34eV7OhBRTSNXV0AYeXA24m2BBWt9xyMDD7RkpeDLX0iHaIX2limnO37ceSwcoDtcTQ==	T470 (Talk Desktop Client - Windows)	083f1611111600ea95ccdb3159f1c7b2b303cc8545f0f754f1524f7a3341dfa3c5847448f58259eeb558e07f781cfe406ba05319aa0a7fe44addf7442c5730ed	1	0	1749750915	1749750915	\N	\N	3a9dc9ff1f4eb8a64b78f1c92f058a203d1238a3059596adaaaee971c6571bf227f11a8ad1e32c39f803066174c440a82db97b0d8d4893214374168ddf42bf9f5d36f30ccaf4dbb9884d92aa0bcb7d51fc19b490b1b87529f421031c7d13d9a7b848d6b8b7150773788a1a530742eb4f6335dff75734f2311a28d3c40cf1b184f5772d3dd678536218931a01e4dd59326f7d77104176729ce794afed0778ac7c5c8055ba7100326688a3ddc3c0279c0a48965467a345239242e679423fe8f2d8d3c5691dea765dc49c21950348019af62b20032be0301b7f37c9032127f4fbe5280b569b4dfbca103551bcdaf78b9301b300bb4514e3734ff39e75cf4f9a2bb74f90a8941a9bc3a7c9076986f36d2a9d6fd017160e3efaf7ffa48662145028294a02bb9e6ae4cbda1d046a243ae6d8325014835c80353e4e46bfe47d9471c2afd2791fd5132036964b3fcdde7e27b1889d8b2a88e609894859011c3b683e30e4e952a554e20105b7c7b216d26cc51342d7a6f3ec4ebf138cdcc49155ab047c53382893c74f1d3e2318622c1b4ddd78aec73f7491829108cd3ccb0dfb3823eac5cefefb1e5d8194bcdf904f73632c1f5d201264cdab781338472fbc62d9e7ee19b45d9440dda0701f87b0667e186d8465afd57f3dccd1545c73b89dfe148843d41b1fef170a9c088f690ceb901fbbab30687157774c517e55f3e6b6e694011e04c0a3381589c22e10ea8579b3f25478409b85c60e81fc11c8c865a08b861176e02f038cbafe15a16c0df0428c1369b5d53a54f15b3d0079e164b1703aacbeb434866d66324439a28b31253eeb906403ce546367759088794d52e04d8135a48ae12f236bc4ff88dcf52d2e7fed26f63f9bbedf2976c9615de860218f40ec74648b039111591ce7d903427e6ebf3d85f020f5a36a3ee60cc20a972c71a1367c5702eb0d43b6748401018761edf978d55b03529347cfdbc4599d0a1236a979b8961ed8c46ca1ab700919a5aacd59d10218758c0d2c161e46f2d6ab80bdef7cc4246408c36e76a94b24d1cd564b27f6efcd3f75981231ecb45fadbb40db47f1f6a67ee87d965c3e4260b086bbdc113a41a44dace784248c1f5b54728bf851ff314185864466e4365558a8c30c62c81c02cdcaf668d1cccd65df4a921ffaa9ddf5a11f9bbac114adb3f1ab4707fb0c259b760df3a590e1564ddd279981144cb65b8f3e1cb37a7253a34c3d5808e9e02b6d449194f90a99607d8f9292a2a3f1d54df7d3c348f3ac0574fda595bb731575892c69c92222f6ca4f93758752cd64c01d744d2a9b06f8ef806d3215e41c20f03378605db3ad4c33f48b7f185ebd52ed3c104d4f44f01244ca4c3f219984de3e5335ff832e6f66d655e3d77101f8eded08de9e0d8f912da924a099e95fd7e97938ecd9ca4aa00b9a5bca014af70df6c1563c8c0402d2f723652ebc107f4b2bc0b098f1c0d9c8ee2d2794a9436294deaeaf26c01836433191c37db7118f3d2d6c89277944abe29024015f4e969a6a303333d3523cb363c9defeb5e45426c6d11fdfa3443e6965b622a8f3c62853ad69688db78346c12769bea5d0280f93e30402b83e00915811df216bab811a6aabf695b0d1c977781cf92c1781f7809d66f10630f448147d525431c6acc05f4413b15c809c895377473d85475735ffa3d45fda8e3fe81e79bf99f2d935008e2b18410491f950aac58e98404130b79ff8a6b91d33687d38c6cec93064b31e164ead1d0ee1b756d64fb604a4748ebe221967cef226a969213b1eab3170455739ee1a89b2d5bdc85f54c799f832d4b1b0fc089a65254f1670b745f98929fbccb93e7658090a15a694a2fe7db69a7f970c1d2ea3e76157ff8ec231c484f938edd885348f2f4c7975d4725de15ecf66535990f4ca6fe414b7d88a59535f9f7928d9bca142f4489e45505c14c0f26a30ec6e42f83163189d713e271d61a48b4834b4179f886688247ef2b30324946ea0e676a0d32bb98fb17f31b6c2ad02d5842ed472b7c28872a1958e15185889e9ca941d95e4d26b8698b75aaae6065e07ffb399f1d7cf474910d47522cbc2714486def3bbd82b93493f82e10f80bb850553eaa3482097c3fb9e77c2ff47a0b84376e531b8d1571b1287a9c800f385d0559eae939e2e45241126e9f58687bac62cc96091c66ba441993e19553168ce7e1a03e0e799049a29857c3d4d3ae3682117da4a295c1fa5abc48122a2a706e22af5fccc8ac36ca23400ee6977813aefefe45ad209a1e99ffd93ae78b54fc6f05fd4e566c7a49ddb21e2314410ac9c28b7a39a441c1aa6043ffef37cb151f4cbebdef6b886136102eedc1b3a8c4d9c0345303e3b6dcbfd30871f165d712378f8a28a055ed00e2fd8e80ffc9e1ac09a9e738fd1f98e0d9fe25376bdc6|3f7e4cc9cc3ff94a07958fe029211f18|5bd3d95b9ba6702dde803e01903d927429570e78f4d375e81bedd898ff1cad11ae0d4936d7038e6370ec9d4580278575080a5a92d7b99085b8cda914ce680b9a|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0+MIzy0oVcQzaB2CkAK/\nneZXga96BZ5xfWJd5CxYsiAjsto8Gk0cop7KeF8QFxVdOSf1rHrXzJqsylnxy3GW\nRuk0/eJjFRTpqYeyA0geefi2pzOPRcWEp6lFs9c3Vju0a+ye1paiMPyaghRXrA2R\nhd06eu9a8m3bNezaGh8JS605r/6taY/4xRf1dDV9Vu752DdJ6z/O/thRTuPgsFv6\n0LUrGZ8LxBoMAM06DDJ6BqlQq3qOIFIJy2DrctNe7hPcdKLDkgA9zupRnf49PLPQ\n9l/ojeqmhD17pAmXvsjJFavP3K5fp8BGiIhg8Vmz/0KRmP9TZgV1LNIG6brUycmN\nrwIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
37	x79	x79	EXyGtI/mEf7Njo3u9/Q7pwnxEHctY570bNa4uh7Qjvpml5ZVMZjA+kFkYWV0Ofm+DCWl939MJzF02YQ5DY0+uFggVYagxA2/h70/AMEfsnyMFclvcnnxV3v1cHax09tDTcm12/3T4WwFm6arBNendyTbrJotJCaNmSCIOb9PnunxLh0kE8dDFz/ug97bwtV7MUZUE04LtuZHY2G5nmYjbeU7dWVJ9Fqr29LKoIdkdw0kfe4hUQzjwHONmSutWfC0LqmHQlcY1CWi3drSqStZZ1MAWQkkmNcectCrafTyj6gZ2fnoF7S4l35RB9lXI8V+dn8cPgWJpGIekLAgiEVocw==	PC (Desktop Client - Windows)	dab3bad5ca11c1c042c720c6569a21f7751f5b0a312bee9095f9b15b2cd22ab32754e69f9e884ff579e215a8944f4553faa508e59352ffd72242893b5aa7f253	1	0	1749002504	1749002313	\N	\N	20a4546669c6c92eafe4c3b5cef3d08f1e066cfdc744f50b7693de6639168558d8e3e8e9c0d094d725a709033efa246cfbcf9e347fb0dbd6b245343df57d925e25c7d2ec0c582113d5a1b8535ce4ab9d714395068cc9534b8919d1d5f5c8c6034776b9d22b61825708081011189311144e1b61e59a49502dbb7d7e988b02ed57e992006ddb31b08e784eb414ada180c0a5680ea400031f4c97e112863cf866e848e7f0e9d8d98cff889d91fa66c56835302dd20f13cb23662698556f444277e7c821b7898fc86936e12a18dd2874166a2627f3e06550514f852aeb388725545d76ebc86de5a72e805721d9096cc0fe0b843498304ffdb3445677b8c78871ffee6eb474920c94350e81bdb8895b248fccc5c89d31f18eb070962fe8f449ca9adf204fc8a9289efbf5758e1dfce2975fdab614c4d29e539f3b962681045a0c53db504b66d82d4915b8143b08c23a5e7d66e5355c546f1fc7a0ab56e7da8436f9eb95916cf2e9592dba1d3218fc7067ed4c9f72a48828ba83f7e79c54f45809b54cf6a97dfc69dd4e31a0908ceb858a46e1d38e6d15a1a57384967c4e4de5ec23741b8a768083ea33ba80ac2ee3eb251a5e5872581ee8e21a657b376ba7742e9b740e819a27976218f1ec3be4b350336c2b66b66bf0926ec8d6197045a34b27d6b1865af2413b5392d78a2b8b95afc7c3d31735f1eba1eef1dfcec5f15e2debe9912e40cbeb1680893718890b12561b83b27dca00b00e77bf2161f7052a0b5f9549f228c164134f7aa2a84e2a4324593df8d21a76945651092b1188f468aaefa9479e53767e056a165532762bb4d84be67ee9cea7928ed7a7ec8d5d639a5ca4c5892ba3b44a55fa5b996362d79c3ebc929e0770fad38f11cac70c2c07103c8026f3de47440f0f29fe265cc4b1520d225b8d13786a2f5e8928369a97c41e2afdefab1efc162ffc49f898a801cbc8f49bc44b60c8fe517b4d3913eae471c86b7f22a4b8fc560cdbf2ecd303d5987eeac3cca7963419590dba9a5ff928b3a9994497a36114cdf66eb34c1e5da092796aca338abcd6f0bfc093b08e51725a78d74f53c54c67eebb13975006639cdb72ba923bfe76134c846ec46bb9a8aec4d772ab27d012ea0e96b25be629762182d407f21a4a72e49eabcc8ae6b15331557da434436dd26194166f946d48c64e549e9e59a6dd84ce67d593777797d9b7119654a6e74b585915237518d74698072b542702059c82102c78cab0ce4309331442571e9e3d748663b45f4bea2eb9cc62fa3ad645e063061615baca3dcf40cee220d279dcfcabb6b9958a3bbaa3b89dd3304682b6cfb294fc6864a34cfa853cb70fe3b13f4365f3911a6ddcbb868dd58922b19648266ed857e5c42386ce3d1f94c777e057a5255294ac8c538de41763f904b5fee60ea33a03076df843449125d9da6f557a7befb0aa6ff770d1dba90334a89f5a0dc300b4d359f55c6419fe553a64bbc1ab93e5f7579f91b6e1ed89d4fee416e78895a2985ac12e82c7d0b2cbd8820fd677aec3c1311a24eecf9e734c04186dc51672b285767e828c0e8d44ce85ece0b2f1c0a4b81eb284f42c1b7a0b20a4b35e054b095f9c7e2adaa90892dab474788ffba904eccc92da4352e89b268a0607059b8d31efdce5857864c18c33d8a68936d097b41ed4a79ba780e9efebb9dc749c4a32da6e7826a01e05bb6ce51f6b22fee1dfc9e0c3d6a88ef1da0b9faf37226dc705fafc2211abea4b9f7fafd6ad2ac7558a2797e064163f5f71e7ebba8edbd40960f71becb602e11c9a2bf90382bd2e2edd1857102c8b4c29ebf61248f1a6d729dca24c0272c390fc0e9ffc2ce7cc8b10aca575ea7f30468177606787312afeceeaa956af98be632f86c66cf03cb6f436484f754e33e6cd8cd2c03f8ebcaad8aa3d6e897bcf891e742b52e02bcbc8183e5e5bfa33f15f031db458cf9d1e39969f87e8b97fa1eeff512e05e93aa0788a532c4192bf4369d3c33d54d8a3ae752ab81fa97a2d389c374bdf4423fe30363f234b7988285aaff90277105b581511b8baf995f57356e892aaf3cac8e08e69a5c9ddd4f76131d47e7b99b0fbb34adb2fdb5bb6272f9a5fffe47e0bdeddb271763e681ffb4debdc38651096fb7e3b42ddc058635174d65d4fdecc9e1ca01b73f2cb668d0fc3eceb4d8a5e2c5cb5b844c4178590f01897f80fb47dbd59e2f62535a920f243fb83c947381ee95c465470b2a9da7ab71ed779c98e2e44e2d19f6c5cee4007b01f10b70c286b088ee43b7800a9a0ee7af30ba519598cb9848e2c76c92224b61c65d2930c99d2542594e2326ffbe48c3e09023c6ca0a92d96571b5e761774ae90ab2cdb1ef8990891966f40829556c17cc9b255ee07d1d38b10326569a6f7a9d874ed56bfbf6e0b16ed0d820b87fa|81f88fe32f6a1bea9f07e28e7e6991d7|d7d90ca2f50eaae3a56e4e95d546e5436ca31e8a4273dd53201fa65ac0802da1db84cc4006b17e19193c250f2270ddea30c05c749371670f9975447683970203|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqd/V899/9Y9eP3QGVhiR\ngp9SL+SJxdKlf7lNlVXgt8ZY7sEeN7z2Dd1B5nYdgyMimHsthZY+PSe8OfZE1z4X\nQPgxiQ7mGKedx3R8UGmq6mSlGRSDCxh5jmn8NFeAfjGYCEipwBIwoGi8lM7Z0GAe\n0eWWSGQCN1XlSao1XZTl5EqLLFsRkQjknM4oI+xCS/VotOajIqAIQlkxKh8XrUFa\n6T6YDSxN2udQtLTBMBPVn3XcBTlcC2U3ZC1AkESY4N4cjxiavpODLKeUbQsJ+2X3\niOZ7Xo0rjk1+76HNkiyWYFBYF580QpdjaYrr4DkaTCT5f81YEtZVk9LGN86Vmjzp\n1wIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
54	x79	x79	DhlR7nZ1cDQ8X5sEIkWusZ55/eDjyoqrIJMZINbudRr6ZrYEVqRVr619MPRiILQH1EBMAjPXveNFEhPRIYzSo4Jg66vLogOWLTQFaaGREp3hc0MpIptxSTv9OT/TkaxR5W0mDGaLUUUGOEv6n7bk4MQ92OsdGOGGiE0Cu05/FDTnN17e3RFjdG+fnVBAj5Mx4/r32lMrG1vxa/o1ngSQjTr4HK7X4bmkeTFmMFZEqo6F1MYAGd0VMplKP8CziAwgk8JHqPw7n9LGyZy4ovLWajVaqPQ1NZLIHk8aUIFwL1ReScodA+xYWALjyLuYewqUuvasMP03P4NT9G6sBErHzw==	IT06 (Talk Desktop Client - Windows)	1d8b3d4e52df466b8776c59d980cc960f709e465e45ad7ac5639e4860870ed70e87fc890fa249ecc47e1b1f3093b062fffd53dbabecf73ef351766be4bf98b8f	1	0	1749888642	1749888393	\N	\N	022cb1e3d04e2bd4ac24dcf02b395b8d61ff5e3fb61f8fd1effa7bc13e1cc6947cf089719668e66b8ff5d1be70f85337926d6edb72d1d692a9b3a2b7d4760ed7eb147e21bd429bf3ea7183af9fea37678aeabccb5385521681fc5838522bd9834d09c42da7832aae0cd5dd46b3ef665dff610c194e88a1626879f135a2b21fd7bc32efcf07246efabbd0804949868e5ef5693fc5ad4a0e52e726bc4ed1d176388985b8c85d0f4a085224bd77275be83970e6504b45a9203e2696e12227cc86bcb82ced841f8ad16df6c24a9c275317c452b4fe13d5e8e40bf7ad60f12c729c448be7f020b5b089707ef9d765f9c4bc96d970f682fadb5e75b9f441c44e45ee18afe36b36aa312c180db5629a17ac17afd64802eb6942a041be9e497cefb29e37b2c4b488a61e34fd89645d297e63210c6fb1f45804af5c35b79035314cec8c71b221302df2445b748d89ca39b2a803c7990f50ef230f711de7cae639b4b25680011be0678ad8f74b071c5b4154b384dcca572b380a3e5566a0c71c9cd4c91a5a7688aede76126da3940adafdf2ef5fd3babae1814f16456870566931ed82cbc9a332f273421070ca14e83afff4f17d1718f2754d9bcef3bbcfb0bfc1d40acc914dbfaf9fd3e1284804567ccf4dcccc36cc18d3cc298aa900f1be00fdc978469d9355d78a5c8fa7633c302e6be050be2215550eea8f4faab53a62ed684e92647d3d6edf2e22fc9fd2de3edc3967a409db3e02a55189a861dba21dfa60715c6d84daffeb47c3c673524e3cb7c3738857d7befe121f86f8c78631f62725afb465bb176f9c17dbf4c01b2f6cb3a394b8705556dbbd6c6e1488595a7361758931a98c9f36259abd63d7d9ebbed7860eadcead2a361aafdd1cc773fe6695e95eac492102ab9104d29d89dd77b3ee7612e85e896f1d5c4f7f0890bc89a7041a2b9a90d705bc8d234a61cd4a3fff1176093a805f60a868da59dd0030597dfa8daeb9f71d427c88779b49b3de3817b52f697ce17c1c1a4660583807f5d26bb23c49db2b830849622b731be83537cb3a10f6524e6bdbcf51fc1468e4a4b321c9db5d18769f58fe5b84bfcfd06ce92814bbca1e1bcc7487468946b38d1437dfa78672194e9a2e0166943202833ab5d59acf429e1b2aaeb87a69570613cb95a301faa55cf8c817829b47848f87c1729eb0a1528d438d1eed9d154e1307c5b756cade8be3c4968d2162f7fda2b688edc560d4885d8a0c71c6bb1c74d55d675c8bb2277575d021fae4aaf0859d6e94ac7345026b82f9463a64e46a0385f479bb6ccf3fdbc78413aa3bccb0d2593ce7a27a0ff116a2d60e05387a565b9b198e099e79945b534b30e3eea66061fe009c29a8c9fc43408b2b9759c228677be8b49e2e1187fee1f09b398c5881983df24d7908d2f774191275486cdcbb4226aa36ac82492ef4c1a01f389a0175988273fb3f80046079ba64609e78124cd66a8da3294e73acf45d97735ffa1f6c51460f291b801a67d6b89b3ec7f7449546bfd079ffe612dc2224b748b9d95a8fe9a27d9c63c33e93faafb93db2829cb3bc5b99bc3c47d205db08b22b14f4d980bc30b4e523ee8d670a738306742171b687144c4acf479138bf795216d73c797a38c71cad0ecf9af64b0c076ee17be942929820e8a5d24bef289b5051090f4ba62181724d90fee4a26ed48971ca22c09963bdfab8c00e10e67c1785c0dd1c38a374e4b2e5490ee99e0469b459b11b1eebe1d73370597563b6e0b54bff0972d65eddac388f93b7ac83814327577ff1db90d5022903776a5ca45f814e9f10725e3e93d6923d7d2201a059e82da4464a41342a7ff7327178c60e8cd5d28c1fac23d148f4ea6bb7427592eb2c67b63724e9abdd42a2bd5cdc40c48a7d01ac69f8ded4f87d27af53719d5afbe49119e3b3b33600e19acf8c475f662991efa1904cadca93f951971b07fe4efd2f321cfb34a9dd48198179ff30e2d8473f761baedf9503c13d5ac8d1bda0d7d53748a6f0cb5563c18aa515000335414623a92b4b0655007fece8e03c3ce3efc0ca87e2f8a3e89ba79cb5afe956676db897fb746729d4fefee499a5353c85c852a643505edcbd6d4b36ae1aafa90ca1977784e1e797ac698d3d9fa5f917873d4b69a8853d87d2380feca65b90eca88558eb59161a410e473afb55259a9132f1cf705e9b59a0d06fdec045da6c22f39f3a0f873d66b2160087d367d3e708e18f382522380e4b427fe0c808a4ebd03b67a69fb14201bf4659be1b15cee678c56acf8f3d487681e8948e873e26bfb9648a921f9b636574156f6d30f929edefe2c50d800fec69b0c2703b6e234ad0d01a78d9c156a6987a6021cc92dd2171b97070cdde6a042e955e7bb7d3e10a25058e7e45d834250ad1c578c5f420b3fac83107621e284f|ffe65b7d3b856d55659dee4a0549cffc|3cb351adb5751d35ea2114eb179252f4a1ca9c09869cee1f7b51c51445a55bccc0321b47b4edfd1365257b1c1a21d6ddf7a6c7de05dd096a35ce2f187774e4c6|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlvQEJ/yUEY6oYhYjk+zh\nJ6JPCh2eiuMyGBa/qg4Ci0p0LpLlgA9rCJt6zo2Nl2mWgboMiv0ifYrXqRjU1gjF\nqy6iJpaeeA1Oq7HBxNdWbbS1Fvs8vStWs1/q2haZf+tsd6765bySdruNB7V5+32F\nslFCroBCscP4q87tkCfJIX6UoCSus/GidVgIVR4Kh2erzqHYPq2KaVAbO3uFmpqD\nOygt6jBQ02zYdZBvmq3MKcMUE7tcGkWtotALByrg2gL1luoAHtBDOqPsgs4frCAe\nfrV4th7qVWETh8CDzHYnWwpf2rW1cEanJrVvpFYVDnWMT7qJwcYh8ptwz8Tsc3Ss\n2wIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
40	x79	x79	FGrRsLi/J3FJYEb87WlWpvGHJPb85POmds7jegTTjoJ4Qu96WggELZOIojSz286zWLON4+MFumDKLP77CgiM5UrIjW0vLxwOYVTH2rTOBqMPWByICvdrR+OAHq2dkRfeOys1yWq8WOQUbORARtz2WDPRUP5BBSL6G20EeEk/bH4qvzMjDRZ470ypVDBlQ1/+hPPdqvJQeyEwzTviH0XDi8qQTANGnxL7WGHBuuBr9f8Kr2jeVMcMoheXxLB1AP5w2aS2HBCQ/ntLAQ6aYucwK2OEcv7IR0Hmsd5zKzqWQZzYpTgTW5anWaRQMcNBORzBOOm5qMuUcRgXkqBDKYNE0Q==	Mozilla/5.0 (Android) Nextcloud-android/3.31.3	8e7a16b92113ea31bdf9e23a6214a7588650a5698737b000b6a56e7a14283e67b537c0f5204424adff26a2c27b40b34d7047b382e1c14df62d4ad2820b34ff34	1	0	1749570237	1749570237	\N	\N	ef87e23bf5afc59b4f1566cb00d0a441b305433ead448621b5f92eafdb06f0cd3c8b52b745b1ff0a0c2d08338b15490a586c7ff476bb7a3a24838ac067542d2b7984834d2abfce005d4bbd386932cae1bb36d56476256e53f70bde99b8a8a5a79d4500d7caf89429e5445343dc7b3a4bd70ff9d02156cecec72b2c47dce7a306b6b287797263f722cc986c9d502350a350bc42540d22750cab73a084f50c228a8608041e6f75332d11eb65866b27bc9f9c8dd944acef80d00656f0f80621c92e338e60826a98ad61534d3ba39fe531e578261e82856a17b24b30684500c02096b5834ab638e96944a94e8744bd1ac6cf9f5525a855e481edf437012cdebbeb4e18a5e5fe092a3fc88e518b66acc369068348175b9958dc5b7a74480c73fa782beb5849b86956a3fdc0c7ac8e5889c122061aa57f1bc3604906c5c61c4384756379795e6e27a73b4891ad2885058f412c28cd287f1fc5eb08536e8e3c8ff479f977d05d4815a648ee667a91eaef4969d98db16cdfa5f7d8406a2f0790215de80513250ca2fd5e2d2d1ebb6fb40bba11daeb68ca6834ddebba7473cc5494602d48b2c80df5381f76782ace4454a721fa0051f64b6bec1d32018b8453cfdbc22a2b3b3f3927c64ea2ba847cfeaaa130b203c5ee5ada04c8db99f40a1a5b0a8ad46ffc0512a8a356de5f87ea0ef44ecc24e50bccee245962d9808c73aaf139bff58d91516d48603a1af48db07fab4bf97fc1ab5b46ca648607eae41b37045d61e04e5cfdd944f6ddfafa066c916e9aed30f44f33ec4cc2c097ed3248229ec19d3a5512b83933e2d7031114c12c69b6460f490c491ef395fa97872eba1688f6198574d786a434a2d387d2913cef61210e61176ac9f96290b0eaf07eb1551a377d9c48da6e6e55fe6bdada529d04579fb1f090d64e1ad45e89bab0a33a0ed2f433523d86f1ced5c5ceb289f0316a5051b0d02f293c25aaccf81ea7c22a6f25efd1356e8bb07e628f693fa3edfcc81c8f3aca221e1c09af3f3a5c14a2ab64fbb4115c3166f41e458e6c0b56db9e83d14521e7027557c0bcead67a3e434fbf3e7f0eb966c33eaaf687493674078ea67932b92ce8968fe20529d426b10ccc6f16155fe2d27fc35feb48ab17eb831dd618f5570feef368ed1321688922de64c204597287968da381c262146a3cf4f914a0c913904326e2aff6d838515e0881440e99ac5ef3b409df746210ca8c39b4280e729109ac640c451c474ccde7935dee59b49c7eb3ad2297798410b9df2a4a50ff48ec0d714eb32aedf2e899f29f755c9fe088e45c9d31d2d86e0ef4e90c1cb04664ac3b9a045fdd2e22d05f22a04bbf95ee3f0c27d7d264756b33163eb8a98c4419b73dc2f3202f72175dd4bc41d5a46092f084126a706eb94dfe04dba4219db9913024af5b36dcdffea12105305b1389eeeac2147a229b41cd5bbf41a0a54ef125d482aa56e458b97a2ae99cc0f4e745356387611dc1d61e1ac39aa1cebf931a3bedc5c703191c2f6a1cabf21db05fb5c8dc650154cc671b3d81cc1057f7f0df0f286b07b07246eac2a39481f2acf185aca415337418044cbc4ac1653cc7d75582708272f6836d9b61bc3dd4bc313c499be8a5634a25b00e722b1aa111dd8d72d653d028ee18253c15a01134bb19c2ecb1ec798bc407537b5a15213cc84b7dbf4f680fdc0102d37e5f6834e8dbd9a26886ceacd86a04fe4a22fab01af864c8e02ecea9b676f7b6e4a992adb53945b87fd12b9c704d63ddc07fd2467b67a79b871a627280e2bb8378b59ac125df1f45d8d33d46ecee8bb3ca9c6923ff843047354837b0001e7dce902f8b0f6db7213ed1a881a046ee0f00798cc25956b6d576f0114e774d30d2ffd3ac882bd07e98e25c9da018d519ac566fe5994e3cddec9075e87c0f803bfe211e54caa801eba4b90aee8dd3dc8b40f7b1f976c936a53745e28cd7392326b13239b65ac23b16a419db09496637ba54ba7ec3b3bfa3b80b1a951b01c6656bd29390f9d957c1e77afbc3c1958282744175af7535242ffe0b23b2dd5fc0dcc223a76c51bee86a6b6503947bbcc0436c398a8509a942d82d3b5d312be9535cbde8b26fa5967ec57bc635c4f647af02f36c3f7f624e7b739fc2bea43cb7c27ad925d62251ed4e875562b5ead8410a6185c89baa81b11a053e662efc779b70cc3e5c818271f432299bbae25791eb1c27cfecf63c16d0307f72d41db6af6fb36b52425264c4d95e6a105d387427a53b57d3f3f3115beae33c38656d7f6ae73e3192a7a882fa22106bb03c3546d6e621c3522bccc2c8372b9755f11a83f6b121f30cbf578f06d8dbf86e788d043a71881bbd71d38a3e75660f760bf218f9263ebc2b172f1c2da707dcfd67d4eb48326ae034d0dcd0675bb8711021526d85256fa5|06589b1fb98e2962eb79b2ffe10ea8c9|f9f10e61517a0a96e562688136d5f77fdcd25b9d3df0a3438f72f437e5b1c09dfe6d362943a212a431b8c199c0434b369b88fa3a6c7bfd91fb2b33c51bedd8c7|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAoVYvNvhN/eosHLJBUTON\nTbWWeVpUkjFm5kUaJ/NGP+ySthAufSB4KJO7V0AYfZ25pIhjb1fkEyho51Wn9TJi\njeaWRm2UrGS2Wn0fQSMEoNrErY60D2ndGfF+v7LNTrp/WJ6tGhw06ggZth05P/VB\nLDzQJhR3OMqlrn41/L8Isyee6xR7/AXgcF4B2HxcQqGwf638dtLUCMXiwSSExs9K\nl8X5V4P6jLPNeH1klNSXc7cwpiRM7mei7LKuqgjBY+/AsZGkjtMrHnRN9kyXOCOC\ncaWASnFIjzKqTnJpognxpW1Frvx4t6O5aCF2fFkAu/FFXseC52tDzy77UzhS/NlE\njQIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
51	x79	x79	AbjZ8mEAR789WAk10YRoqwSwoUxc/dJv1d/XDzZYB/45oepd5XRVmXG6/IqClzfxp4uzFzYfDd4+6ldB5HF0JiFIpgnwOO6bhs4OGzu7tf/0i0QjmhJe1XMY5kxMdWgMNyh9F0i9G7Y1kGuy6vfjzIhuc5ZmVMHbosgOZmau8GsVQS/uqzbaVX3js7ioeBEF3qpD8SsrMoHp/3zxcpFtS3vhqgLnePqeg4q/5MnsC5FE3ypD/pbhjgSoe2TZYXKWRvwkUefK88rnB5wzIlrF98KwiWt/6P4ClqObtpIoyqy2ONM1cbH3OHke9jX2ujJ4EI7mtmieM4uQQHdsWrcXrg==	iPad (Nextcloud Talk)	244c454cea6bd7bc6dec3a6497841fe252a7d6447773e8f34921017369ba64c7629f1b66fe0834ac288991029a187c4f88f22925800085c8530ecf502039040f	1	0	1749643584	1749643584	\N	\N	cbd5d6a7b09d5aaaf8f462cccc212dccd25774ca77be03eb34d9fa22aeed3e171c193e2baabdcde7706f83e3885aefa024af4176c6a2dd21d24add7798398bb7f4de1e31093d4b77852837de4432a48d7937578e436f7c58ad0593510e9185f135e089c03fecff13955bad25b1405149b4db4ffa7b33ad98145d6852bfffe33d48b05d237bbb7f35a414599e5896ae070f8477f7c53d00264967132f85372c630b5043f8713d1d2866e77f10800714dbda853eccc36e8340699fe805daf791c00808674901fc30f44de763185726f5d37b91bf677ca1240bbfd2d42454ed7394419c4fd63710db20bb4fa9f5f82c073082187eceeed1f4a60cb10e7b562f0e3cc54a89b2cd0b121c53fa572af9debb2178e9fb1ecf6cf97ff365b05a9fbcfb0b642e5447c4e969366e39a08433c8b9bdf19a1aeb70eb34b55be91b364cf1c9ebf9e2f6b14d3943c50e571038f7db43966ad50a33e76e037a6b3a9527bc78e525da8d0be4fdeb990553e07c09d8c2807d8c019408b6b6b632bba0aa1f3c215c17702aed46d7b4b7eec4a70e8865655901f2f1e901b249af48c28f70c83e6ec9cd166671d70125e3efd65f4c7f7b9689b642522c0cdafb6f0882ebf00c693f04f0bfea4646cd7cb892a7da293ac20b15c7b544c2f8520240ee65673762e436b5c993d6e94a9f4e422fd7359dc9e6be09fc07dc342c71b838482e62cd063c650988b68282a3e8d4bfdde70daf8204f90cdada52627c36b7b49c2174cec82e307cacb71511b65a2205d8ca69b3b55ce67f7c5bb0ca30050a5a63fd2a50c7252d6c2accc1e5df783dbeaf6239ee9a8c76fdc21c3ad8f41e7c59637da6d2df933dce6ef23f96bde3f4d9008c719b432dd92817507c34c1595280cd5a24b583d1d24b70415e010c4c5b7e6cf6a409b531d89ed2d88705dc143a3f2dd76cfb5fcc65ca886d5391e716b73dfb391c3450f70dc7b4256468aab38f842c2d7ce3df6c24904405a2912e7062d125cf1b9b0203103d93cb0cfb93448a8e5d75c4ba3b2e2b0875e9525b275d8f80a486276a98b7269c81727834ac33a2933768d115d99e01ef536f00dcb6070169e38fe8b82beefa700a7b4b77eee475e408d6f4c0968bd136c7994e59cb3e442b407922a9e16386ba8717f5de3b70d3889bae620b0d6a798b66d12ebe1099528cf5d4b0d813fbd40e0583b3edb169d4274bd51759c870c0c4433664f93fd64bc708eb878641ccca3724ee580f1676264e9473d9dc86b27f0ae94d2cdf0e85e905dbf2cabebc2523647781eb9d857f80291b3e07c28d0a2f65f31c22f2dc7302d1cda2e6e9d2bcd4d475da6da9b142202a34ac6e89b7dd660edcb8217737654549fd016a2414210f7e36d93ee5745aa0a87b76348a95a56df939341505986b5b038864b6b3e92d21cf886690c851713e8503459193459b131a3553356194d8c04c9f8fce911efa0425bca047729c293dd3e4ba21a8980b5252226a9879377fa595f4a12bc8cbcd1a74b2c0d9ead75614f0a0251b7944612a9b9cf8ed9d6061793dd6699eb207ca04e9157e849e3461cc0760220fe9d1e790b192f668006df639ddde6d90d23a0a83db8bf925535910f44f85bee6c8bb46663eb47c9677bd260d37502f7aa834e83f50b191cb41a7d5e9c27b939f3a90a2295eb04c07c98b161a11ad69d9cef9e796dfe393f2cb21a1f546bcea2b337a234898e7d900aa331432a8baaee10916ebd9085bab5ffe0b896d04fdc7a3a98e66e017712149b08f95ed9dc537e92f79c02da3ea7bfe4343e598a63db44b4c99e401dc9e36961f20b94f1a10d2c565cd8adeb8ad791b04fdbb5e49c9df8915f1b0369927efa378dc46d045b5547746775099a80ce50dc810e8942409b9fbeb9c378f90f0a6c99c11e5adaa00da32e9c926f789f2feecbbf1c669d5e505a353a0f573718ae865ddce32176595ca709a1c4bd70c7a8cd9d225077c69485007aa3b79eeb5beca768648434fe07f6b3fc96fe11ab2d3a3b5dd6fe29c5a91b1d1a172d325d363c132a02ae070d3ba1f4508531ea82e52b34a7c1bff46f2205fff7890a9e1dc7cae50277ce25d6a29661ebd71f352892257b998813954c4e868003bba227f49380bf530b2d9db3c7c4ba664bcc37d8b0e7a2297dfa45b27e5075a157d5836b8e10f1eb1442114733f2f946ff55875549e220a556654881a64f107be8f9bb2df55439b28a88c8994b51196793a6b186eca3febf6226f24bc21f1e858c0c516c508956881ffcfe8a8d6abd9cdf19e896fcefe7c68a5530dffa6d7824d31568530c4d3ad72063c485aa32e2094fd1e751c4fd244a7cd771c814c524edf7ce229479817d84e44f0524bf4130d8f164e454ec11b0c19963c84329a9ce52f50f8d6a533b5d3597ad48f687e9392205940e7da3a|bae59751869c18a54d19474beba77dc0|6e63b9d0e1e75b22d7343fe7f7eabbf7153079469eda72d1a3943a6e9c3d08686239fccc24dba4a81bfdbf87d41080c8d436d9659c1aade016508d06309c6939|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmAnXh4LJW9ysRykJZuxl\n+chcuuqjRTd1XhA0zTBWJimSNTk4YfVS/mnSFvhOwHVMGY++OKArcS5dEDriVuLN\nvJtAxxWtUfYiuv2s+T+myE2dqglT+N6tyY60BtmhRT4K4dAEdtXIq6TDWV+5JWFl\nSl6FI9tCsDzRBVnsYYux4U/LsZ1LkpqvWlHJbG9oaNoo6GlA06IcgQr8mXolKpje\nTm1PuTUqxTbl2A+D/XM4+PS7GYBY56cHQ6j+OC6CDPwvkPzaMpqWF8S7alzSP3kZ\njyHNVM0pEOUgGMqDWQda5mBcr9ElRdOHSO7QeMteJVi8EjfwLj3YqcgiUF0MPPgm\n/wIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
49	x79	x79	vDhvJKB9VP2aToIGwRheHHvShrLAtXYNVhM4yZum9TSyZlI3h2b5G4RYXRa/5QgbShHFM2dwokOoSfrHcTs5ANbhPFUWmnAnaDbGWa7Z3U9CpOiEu5MwiiG62p9SyPCp8qpGm3R9LPx7sXvi27Rf0PzDdI+8JNejmBGpZcN8gkrH3YSYUOiFKgVrJP/901z5iV4RkJgJlgqYHEi7jvFTJZGsB06k0UOhY5p4LyyzNAi0Qd/GOQ6JiatFeXWc6ZcNk45fPb2oEWpwbEx5es/vPJWRkx/AKrdGQY5kUvot3n7DKyzRx5cWqPmM6W91Bq0KnahblTnqyWOLjLXNISPbTw==	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko)	2518bf5350277a32bad0661ed1ee867a22eeeba156c032cbe825739e5cf239ce4e246e9cdaebd9a968bd05f0c09780f28c4018f8a5592aed97a80fd43ec9d615	1	0	1748702942	1748702880	\N	\N	1c2458c56ea57167f9dfcc624656723a3548710c47935ba18460bf4b5024d323d441284bd7617ca3666c3baef39214b1b80d347840ffba8c4119ead334672fb013e06508cbfea21e4fefc8364ca06977a693256546bef2c6128984e958943320bf070ba07e65851324d4ef6173b8b04f7084cdbf285e5d0018e602dc7573140bd5abf3f6fba41a8889b0a3235bdb86f7f9fb66a5302f7306c056ad2bc86365857a37b571d176a423ddd5904f1f9d919c4d68c50350667cb846d8ebc8dfd9d4f596d353cb2a74d111508ddd4295517ad1a45619f01e4019930d590048f9e33da316bfaa302b042b4a070a19dc1f1830a6e7fa3725e09a37bb5d6d669759d776ea1687fd2b0fe0b2444bd30d8aba35a0be47cdb988705df604f094f2d6ffb94e372215c67d078c3141979ec3ee1a4f47f150eebcd9b190bc1d94f0f12741e9b4d646055dc6a5136ab123caccbd9ea6addb20218ad14c4d42189ac0eadce00a8f3f3f6c2a72f4148df36473a2dc9ce9ea038e3ff0b8aaf47272c1120051ef944e62403aed19c7c4ec3a2dfae87198ce1b1dc9cd4f4f191859709f63bb015bebbb6de71de7ee0c2ec70b2010f32e08d7331f836e102f1f35231e649c09515a5beedbe2fb4cab4c96e3abf7505a52446eed430783a6a9863a3bbbf1cf387e39d525510bdd03e4b373ae8000c58f9ba8c1e1a307d8834d0a748224e1558bc2fded340f7bfd5e56388ee3db5b6436a054b0dac30af4d0ed560062950103abd5f117956719ff66e6642ce6059422f6bf505f291954d408ecb432d1bd6ab10b3cbdcf81837459ce6603d8ea3bdac1fd3ae822dc5e497675f2bd213ef8f368ee27bcd9043dc89b7aacc488c9fd8621c807fcca5466495aad8bed8edf365a28cfa653bf7c0840d021b5f4edd671cbb0d93b302521d2bce890dcf36c06edafc9cca64354732ed7a227068c1476eaaf985bee29b2bccaef33277fad5acf74227cce943092888890f96487375e7cc3e10dfb7f452f4a7601cf90463d67e62d909591d97d1e6b3c68dcd12d71e1e0e82cdff9ad54641e70a42d99b87cc4e4c45402f54c557daee07db9f6faeef1542946ab807409192b81018d17ef3562a7a8d2fbf3c1c53962ba5fa6dafd4e2f2fd8fec0d802ba6420f99ddd6d608487e8a3e5b76f209e65c475732ed8c4fd7ff8c14bec1f8c3eaf9b3ee26ba65f499d5d0f6e57bd68585eae950f7db8b623958af54f54758b13d68e09c54cf1b3a1ae9895737f3e63a862e5e8ef1d6b1555a668326573db0213b748f10914f0b5f1964518308b2cc9916d57a0798351c4d2573711936be59762aaa5e0d516c28dc4619fd59bc4cd9c6f76ecd7643d745b3f6bf424c8d6073659664eaedc14b160a691b995cc81ca4b6c65d31b31c072daa77302b9eb9828ea165ce585b17ea59feaf88d6d76a3008f0bf02f061da5e580bdbd25898ade610a14a9c8da54d2e50927834c3361609bcec4df604505639d355dec1c22dbf8faa37ce11828291cfe06757290a39c4c0e48a87160ce3f9ded59bd0c4f08c438dce577c1b5b800d384ae3444507ba9ee79e4817f26d6c668bf5f6b2be44f6f9a8d2f7fdeda0fbadc234167300d49e269714cb8555e89a06cfccc3040c2ebf0ad2e947888ac6c2de0074b730b5f6c5432771e4235ff06e86baf4ced7403ca539454d13e111e4b2056263589cd5c834c240dbbfbc83b96208db4a4c07f1f344fdfdc20feb057d02b1ac7e57aa9521720c8d3d3b54af9b160e767b150e673555499af2cb0f2f848d94d55a8422eae5e74b2dcad412a85dbdb99457222c8bec98a060a333bf3bd95b9856468af23604d9ababa8c718ac4b615662302d963da6111a75e9f3ba99b47b9e94a531c34b017baad9b13bc17c54b025822a6a585abf16596ea5624bad779055ecdebdaea12a73d13253cff84c6a688c186e2cc3b4cd5984372ac65e7ca9ca2ff8e09413522d3c98d37aa99bb9ba17c80f4e18b8c203e3a9cb3b9f1085aeb178546f946ce2df719dad9ea30ab8d09ec02a705405d5b89bfe9f48767105b2cca62b5bc9d3fb8a29b29c7ee663a6f1ee8a7fe33109e1a78d918afd0428c2439dd1cb499b4ab5bcad66ad6ca4e49ea4506e760e7e7759f72febbbe020ef795f18b129b46f46e0186915e6e933b3816972444ab94cbab8efcfb3118902799fa8f757534838233cb2fdef3dd87dc8add2f5695764d14b8c15716e651b3e331111863f554ee0e6e232d3c06aeb8dcbf4f26ca012eea95e21b9ef41403693fa6095fb729ab8f969680f63d38e933770d057df74a6050d0ab1725ffabbabb1762ebf33f8ab37183baf2620befedda88be3ea2acc99724a3ec65b252eb0d15c3a6e41d56509eb77a97138a0a1e02dec9c577499161134156bb7aaaea08166351ee076b|9355b0903a8870dadeafdbb808d7674d|4f3a6a62bd0b9e62cce869556df6c6311a53cf0a4abce97df6de6f362b64e91dfa3df2da583e2286ed6d34dce6266a582e596ebe60047960358958752298c574|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxZPUYOUvvg/YxS+YK3xh\n+droX0w0G3178oWgq6bt/TkzE+oDTioIwBC/zCHoRX7q00uC2gwi70XWkfede6Ub\nJdG475cv7ujcydYuEiZOPVpxgmrdzPgLifMzG2tjL54so/+2H8mywHFlpTbdrlnl\nCWLEDF7O162C3vDVskTquT3BMFrREeioQhW1XW+wfGMrFLQpPRFGGR+sliY2777j\nL5yAlzXZuRllRyvFFNID7ppMUxXDDmDwyNMDrhrg/mA26uwC943yK6qQCoYV6Kil\nolc1ZpRSZ5oWIrYFkbdl5eqk9/oum8isgtR08TMbsRjo8LZLQimyaz8aXBb3SRF3\ngQIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
38	x79	x79	qKytxVXnnUxn025PGR68266conceWg95P7Iy4GQR9WiFHlyNdEonGE3CeOKOhUuGamLKOtQyCML3hvDoGh9hbEgmj4/icmdlSpo45jeWW64F/uyfAS7a1eu3Ze8C2NsiFrDoQP4FTyyb5WmIygZia7/f9nwQ2iff0zcMntb+F9sSn28QASwCLKeJJ6pLBigJvvP2kZBo2vVNf1bIfVksALY9W8s6FunScQksWUGDWzNRNugXixKmX18xMstqNk6DJ1z36fAnkQjTLHrpf5r60RAuLrVf4TIVg+zXzZ8z25YlUHwdihBsA/jjzMZ8tn0MhkLF8vMh3DTjiDI0YfgQGw==	PC (Desktop Client - Windows)	b30539ee5849a2516b97d8e09b8587a8e6cd0784ea3963460b491d4590124f2a6f97fe36e860697cd7ef2ebcab7cf3e02dc1ce3f2fa37d9844819bd234ed527e	1	0	1749003329	1749003329	\N	\N	d3f745c3371d3579a03614ab914aa9398f929fce9312edbcd925969b18b6939eeaf9b9289143cd95f615a92af566424eacefb3eb6fe2cee85379fed4f288625c6c6a1485cdee2b0424c7af6d03b569ffc6f17c239bbc8d218feac56374c327f00fdb0cac94dc25e7a2e14bdb0475533f5a57582a51287be2978127063e9838c7eb05db37a9919fb2bce3d1e4dce98cd625025788788fd58fb152f62ebc0913070329935932e966e013a5e51c54ddc9df1127b6fae0023d6687918e16af53a9d39fe18f13f47625da048f30cd4e407f48adfbff136e6ae1851cdef12acf8492290817923bfb48afd027eb9b442abf15e654631df4b75160ab71dc945d93cdbe9eae2a9f63b1d0a8698462e286c45b2ee5d8dd73e88fed97c2f36a47b64c6706e395d3bbf492c08ba2aeec498e07cb07557f2ebe68eec2821cd010b96dedea65a86160ae5f8dd6369a9834437d90b475eae51913541fca5b3862a6850a7fe2a2c4c4f18a60abf7b9104889fd2bb8548c82ec8b2d9349a68d1391b6c0c2f1ed558b72ffb83944ca220af0b0f142e55eb7be2a5e6ee014664a0cafb92b0426c2d4ce0443c62bc85eba1339e7a78cc095fc2c881293f6d0a55eed5c6f330e602ee281d90d05eff688b16a4c9cce9c24c0f6ebc174f7708977925eec3d50812aa805612636cde77d9a5ae02b0454495c601786c831f6a07bff0798168fe3a944e8ff03042facfe641628ba9442ff58fca58cbf6575f8de9f2f32cbfd00b644de50efc05d64bf7820e5ee4a38f7ba0587865e7691f66f171adad04e289ce8387f6fce462f46d91caa51e2b30864733675b335184695c35d7a5741b99bf92d7ed5c18f1a9dab9a3dbb409095af56f922de70fa81f0fbfafc869b1a0c8f12caf0994f9e8b1161eda0448d385cc8bda5046a551eeffce684ae0b0d336f29efb9fc074c7ecaa198d5926e0c927d656b5ffdee7045a63567653c38d818c35f1ef8ec09af2614c466b6b517671bc9251dde9f553c09b289e491c1c049ce6cf5945663d9b5f25afe1c916fee3374b0c3e8c4cfd787227dd2409fe9e71dc9110313f840fe59aeb1d6471ac5d5c3c4706ca5b66f858ad423b9d67a6399c3bfe2b90a07f8e994440d97b9297cf8ecda2299d7735693924772b2d6484bcd01993cd287e135f8f287273236984a683f14a210fd0bbfdeb1ee9694796cf17543ff8030c27b4722154b92b5f570cc134682d72b67628c76e2b352aec435f7be34b6b43cedfa77528b2a35ef16858cbc14348c4112a2970f3f2ce60f35b710aea17f901878c9343135c58a9b3e50f6ac68b4d1283fa11d0306dbf2db7f55245e01962cab91272ac1db89195a333bee4075f6aeca245ad3171039f860df1284c3c83177734a82f60b2074365df67413a6cfa1fc1ed59da7c0b140b7fd92b619ee7dca5a8b874d8d890af61e180336337a182897320f25012bba34d975e9da6d745f853498059b6e0261066dba8d921dc9c6f30066500b49c72009bd0b45ea632e3683c0f5d69ce11f17f05ca85a67f9b3b7aa6c23ad0bb54228c6a450fc91d177495734980d7172da1c902b6c402a13726c3c0bb843827196e98ac11aee51ac0983f8d85ff0ac371d7afcc82c11fef0b4351851cab49a41e0d343f96ed933aa3cec9cdb3a0bfe546e4bb684a15fc23b7c780696c3a6ff8f7c916c27a4f9e92e966226e6e533d638bd77953d12eca9ca72c8ac9508c2e97658ff1b730c871f86e54434335e40bca5dfa75d2d7e545d17216650353e8498170a52bc9d1e4798329792bd6eefb6f99e46a020290d2d3daa965193ae8cfed894c77e8ee05410e0c645b63fe093941a6cb1e63eb7baad9ace17331c6a0a3cbfa6456edf9124a5b6ff6025756c033a8eb6d6b0709483360e9c0df372b084367df5589ab8bbeb2f3d9c509f5d85214ef92e0f7430171d6f634b090c73e38b9ca826425b1c45e479dd71008c0919e8ee55bec5db390f045a837e63123a41558f998ab18dbca55bcc79f613f005c1a122321d3530c0d1144ee6090989d401b8f1f480e2fa686f1ac173173a62b1d68c2fcc7d7149895b81084d1c67cf7a2a7429ea333b30d0aafbdc2070f31f015a0c6e3a222194500b4610106f6a62d7c07fdd540326b82eb8a27cb4c3d03054a8f8c10284048e196064e34e70b8b5fda8346417a8a34ce110e58b4d8e79d47388dc0185c940ff0a67a261c21613c0d15214f913ba2b2c14743ff8f24a51ab5300876c8917eb9a03614719d3f4fc43f7c1d98382d6d5a1fd49678755269e01427fa5a1884477b64c6b9f51468e1dd944787920a7e4c1b9ef81d1e39c7f471b8ad227e3dc840718729991637d0aebbfd50fcaa6f56c1020ef3a7a49b1b03cd01e6c58ea2137a4ab511f543f431b24094c8077317e15c9508db2|4eabd2bd2c62d4cc3a8c4bf5d352afdd|dc46ebb76e791b9fe9acec51eeaf61f1d9e5a5e3811bdf0333c59fee6ac4acb2af0544bbd112ba17ddec4de77f6b2b5ea125af884b6266c57c192289c927bc17|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtz/C/WubijTtZ21dL4Su\nCqOD+dEZpNhe6wk+NTUjri+lvbtybunQy7x8ykRUnHuqY0nxjjZuzr/hYYfuHAYb\n1laTWeIYwdz8ZskNSf7E8/blHZ5RdIhVQ/CdFnPT0EQrqKn91jOepJPpSk4Ne+Q4\nyRpeV06cGYA17SUXaAtnOi51KbUnC9ebSI51GFRofN6kJKnn7xe76xFyMvxY60jE\nIkKmNcc1MCGGSU+bRvg+OGyr+VsZmOnoyaHRzu9u9XubLfVDx5is/RUH5FX2oSF1\nOY2fcHI2bTbeTuV5zjp7T+PA7y4ZEgRXcakW6cIMr5RXTE54/H9hQjzhpIY2Cpt/\nYwIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
44	x79	x79	K66mMaBn+x38Avto61stk+9Ufx/mOHiwNn+ZGz5o9901/kSFjkMpl0GiyPjyQ19XjjdQ9xvCmIeW4vDhqaKTx7GXhKTB2u355gE8tOSyM/aZR7ePW5bZB6GW4h6uDMosh5EgNEP/SIPDVkqXWCs6Na+I+CkZiy3prKo0oKgfxmfCn0I5eXJ4pxvmWvREKTrbPNy7j/0QzHWJfVnpkHeQvJ0UaxI5oHNkCH43HRer27haAFwcIVk4zhlm62nyoRGlm0InSkt2apgPhVwSR+SFauD7vs3yRVsjAzFQR3tV8EVFbxln2e1nJEfEMw7LAxrmFjuu+cR2zVmWAUhsDD5ISg==	XIAOMI Redmi Note 9 Pro (Nextcloud Talk)	e12dad7546b7dfd08804e8f2e3f3a1d62514f537dceacea41c738216f75b9135e6d9b5bf1f39a6dee4583d426d3725c6e4771bac2c603fae9230fe9430855ef6	1	0	1749779454	1749779454	\N	\N	76a8cd29e06aba82e5d5d71e220d7c64a974b20d24575fb63dec2faa40ddacf7e0d2416d1158584174aad84748664f42e878b9aa5ed83abec8e4d754ef4e8be762b5c49e72dc093b224468ad2e3c60cdacbca9777bce2df07ec907551e07c1f249881c6e0bfc840b30a2b2d11324ad0a7cdc182d5f618b2495052e5895a401e3c2a5ba48a868b5669688b1bc567912e87f3d83931626943e683a75a3ce44f82489599762a6b3ed18bd3e8701bde8c1670a51a1df964b16bdc358682d985ecb108550c64406b88aaf8f8c99be75d5ab78bd2fe6c3ebaa1154678d00c8ee3c5ba46dc5301f686c3682baf45662f4966925b6d9d5fdc2526b35524280cbd323ed8fcd077db370041c856aa6a4a9313e3ec09d13bfb4fa90ada49499ac3db60d1bbd41e5c5a532e4153c1ca32d7030d22ecf95b26bef1d7eba272142f2d3059cdab34eec7dc9127d167fb97ec142d13adadcf5722dedea64c5f0be0081653deb1a5d5b5c8bb54cd0dc9accc0c8adba38af696d69db1f8d0cdeddd6519fa6fdcd9d699ddb10db01dc7b3053cff24f5bc1933e1380867314aa6de2c8c7376c32129ec6288f8b94013ec6c3226f141fd6c4e99719f87a35b5a106a000590d82a84142c888e14d0362f6984c5118bb85d81db6aaae82f57daf22bd38a199424103eeb2fdf78fd1f719999095dabd9b5a0d4b102476b371eeb5515e53795870c8e121ba4bac8f805876cfe6e54a5bf44592897ac0390a3185b142f4c00805007ad1e62ac773d822071563132904d619e9fdeb67c55c8e57e91fc4aad5a6bf98b5ee200eadfc836d99a64a713a5d9648cd5ecaadc858e6788dd3c2376e83baa67a9c168b002216155493d1224341843b897b0242d4e95508906f301feb0039f2af93c5790560aab0dbb9f7cd67dd23c9764eab99d686d6ba3fbf725d58f331a68bd61fd2fee39d1c2434ad7fbd3f84996dafe84b1c72897a9f3d5c696f5ea40a7bbfb144b45e5ded5af20cb47859f685de72f73cd819ed636507aab3c11b9fc1dc908330769f2439d1f5328222b0fd6a9ff07be061a0728a61812d3e36f9cf60c85c22dd45b95b8ba67ef2006fc308f638b224dccf1f7cd3ae2c18715a400337a2dab558a55ff62d429bbc166088f0ff6c9d2b952c1d9117ebabc1e37d2bf970e64bc26d45bc76a105de2b891cab1eb102bcba694a916d3e9a5699ba0d09ad6d434019ab2fe614fe4e14f9a310ce584f89c412498090459da1ab078bf3f6178116c6556799eb24f45937c454112cf9c3cd4acde521cd0b1e277dddb2808909057eae7ca6e2cb59069d7f459be674d4e38cab343688ab3ea06476378276673c6b0ab73e52d09778b2a5db17746d284e896595a69915855bdf35fa49757ec9f942ff3bfcac46381bb4ff553b206a545679858efc5ec069c7ff039ce6d59fcc2c08214f58446107cc5308d596dcd8939f8805b0126d0c9a8491ce8d3400763f54541f031a0dedf0f86066e39aeac7b10285af44f63e3358c6a7acc1d0edca25972f4ca9c65d7e9a39eb4aa7b40965935cf921ac33a0cd03b95301cce2d8229e9b93482f52b2f1d94b7e15a491552544cd05eb80c45f7337f3a5116e4671c04895d5c4e0e045729a571f905998d854d37cb2eac0ce82637a07c8d7d0f098d46c40d8fea7841c4c4932bfdae3a60891ebd044d55fc00aa66e813e1e61984714ae8fa93ebd288db1a8302d34045e6343e6dfe7e2c8fef6962a8b71ad6ed5ee5127e2a5184a4b68d9655c89ef77c1cd3994cda557e6fd1cf22f8a12f34c5c7c1ca2787fa100795318f601eb93e71423c809dba148d8176c1ec9dfd1d332a8af4a66f6f6194750dfcf4c7908cd90aafb521c075e65acdcc6d01a9f6cc31ace5b800d6fc101d2b6862de06f1bd00c91a42d259aebecb4e313791eb751a8e6c0e5fe966bc008b8f4156899036799b48b51093d14ecf6e598972e325d3db3f4db22b9cce5ca57e5d30cbf3fb621c0ec8235e09c54c285e469781f9f5678efac94d70583cecb33573a918f0be680204dee86b4427d59f0e12a344cd5ae407f86b3bc6545e27510ad63119f02aca764537939fe6c680882fa4b81c9591340590b14c53295f7803beb70e160c9d1333579bf0952a833efc22a0807955705eb62de4654af7dbc2dc3817f65e43537e7cb52d2d5197b5f77016fbbafcb11151fe4c070d1a3a8e7e1ae7e4c4086c3b2474a68b61534847d4583108b0b17d0112645d3a2c34c928e154978805462671653b54d8b4ae36aa1993fe93f69ab85e9be266e73d43c97ef96362756ed57712b34781a96cf420e7b0e5dc8393acaa0305e263be1e511970c1febc6e5d29ed4537590a01f97c96fa9af0ddeee4d999d870d5b0175a2c682eef1d8518795aabc1c58fa885ca400961207e0eb9b04a8|f7e3e1f97fd19ddf33135dad51034679|e6c076bcb55d8995d4e4b635a547b46564d50314788b73625a8ee965e5da8fb979b9eba9aab416aa2743a5f3c0fa251f3ef49c673756d1b475f0b61ed2678187|3	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAutSg+F1in9U6mib7TRZ0\nc6Te4frvXvL0f1U4WflmQykkAm6WEBY7GEsur61iZnzLraOl9TR/TB1LNUuAU4Fs\n1hao7K9kzWvybqGIL+4QyMcbO9QbMmROPq/PXjR29lGOCok1VBRNKg2COYWI+yBu\nb9pqdgWPvbbktn2XeC1UovmXL8lkoRGCBSxyJ+V57CsUG5ahEJSPWsuRH0p2qq2G\nN60AKWb7oQkZFEJnYnb07Bp6fkZp+uV9KToD53XX4hE904d9qbEx/YCwgp7MaH/r\nr7HObokbj/Qp2u+HsE6KgFVCfgbajXW9DvfEkdrdXsPN8oryiqSswgAdgUUKDMpG\nbQIDAQAB\n-----END PUBLIC KEY-----\n	2	f	3|$argon2id$v=19$m=65536,t=4,p=1$NFhsczBSSTNXNmVEV1owYw$ac2zLDaw2D8NkbP7Akx5K0xj+7ftygyrlcabFUWuCmI
\.


--
-- Data for Name: oc_bruteforce_attempts; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_bruteforce_attempts (id, action, occurred, ip, subnet, metadata) FROM stdin;
1	login	1749747704	172.68.164.158	172.68.164.158/32	{"user":"basketballcantho@gmail.com"}
2	login	1749747718	172.68.164.158	172.68.164.158/32	{"user":"basketballcantho@gmail.com"}
3	login	1749747743	172.68.164.158	172.68.164.158/32	{"user":"basketballcantho@gmail.com"}
\.


--
-- Data for Name: oc_calendar_appt_bookings; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendar_appt_bookings (id, appt_config_id, created_at, token, display_name, description, email, start, "end", timezone, confirmed) FROM stdin;
\.


--
-- Data for Name: oc_calendar_appt_configs; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendar_appt_configs (id, token, name, description, location, visibility, user_id, target_calendar_uri, calendar_freebusy_uris, availability, start, "end", length, increment, preparation_duration, followup_duration, time_before_next_slot, daily_max, future_limit, create_talk_room) FROM stdin;
\.


--
-- Data for Name: oc_calendar_invitations; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendar_invitations (id, uid, recurrenceid, attendee, organizer, sequence, token, expiration) FROM stdin;
\.


--
-- Data for Name: oc_calendar_reminders; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendar_reminders (id, calendar_id, object_id, is_recurring, uid, recurrence_id, is_recurrence_exception, event_hash, alarm_hash, type, is_relative, notification_date, is_repeat_based) FROM stdin;
\.


--
-- Data for Name: oc_calendar_resources; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendar_resources (id, backend_id, resource_id, email, displayname, group_restrictions) FROM stdin;
\.


--
-- Data for Name: oc_calendar_resources_md; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendar_resources_md (id, resource_id, key, value) FROM stdin;
\.


--
-- Data for Name: oc_calendar_rooms; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendar_rooms (id, backend_id, resource_id, email, displayname, group_restrictions) FROM stdin;
\.


--
-- Data for Name: oc_calendar_rooms_md; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendar_rooms_md (id, room_id, key, value) FROM stdin;
\.


--
-- Data for Name: oc_calendarchanges; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendarchanges (id, uri, synctoken, calendarid, operation, calendartype, created_at) FROM stdin;
\.


--
-- Data for Name: oc_calendarobjects; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendarobjects (id, calendardata, uri, calendarid, lastmodified, etag, size, componenttype, firstoccurence, lastoccurence, uid, classification, calendartype, deleted_at) FROM stdin;
\.


--
-- Data for Name: oc_calendarobjects_props; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendarobjects_props (id, calendarid, objectid, name, parameter, value, calendartype) FROM stdin;
\.


--
-- Data for Name: oc_calendars; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendars (id, principaluri, displayname, uri, synctoken, description, calendarorder, calendarcolor, timezone, components, transparent, deleted_at) FROM stdin;
1	principals/users/x79	Personal	personal	1	\N	0	#00679e	\N	VEVENT	0	\N
\.


--
-- Data for Name: oc_calendarsubscriptions; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_calendarsubscriptions (id, uri, principaluri, displayname, refreshrate, calendarorder, calendarcolor, striptodos, stripalarms, stripattachments, lastmodified, synctoken, source) FROM stdin;
\.


--
-- Data for Name: oc_cards; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_cards (id, addressbookid, carddata, uri, lastmodified, etag, size, uid) FROM stdin;
\.


--
-- Data for Name: oc_cards_properties; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_cards_properties (id, addressbookid, cardid, name, value, preferred) FROM stdin;
\.


--
-- Data for Name: oc_cfg_shares; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_cfg_shares (id, full_id, token, node_id) FROM stdin;
\.


--
-- Data for Name: oc_circles_circle; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_circles_circle (id, unique_id, name, display_name, sanitized_name, instance, config, source, settings, description, creation, contact_addressbook, contact_groupname) FROM stdin;
1	4aD3gsuufKlfA2vtJl6ju12klDrcj2E	user:x79:4aD3gsuufKlfA2vtJl6ju12klDrcj2E	x79			1	1	[]		2025-05-31 07:41:16	0	
2	KepJfVbe4zalExyrXF8McYJRjhTUgKD	app:circles:KepJfVbe4zalExyrXF8McYJRjhTUgKD	Circles			8193	10001	[]		2025-05-31 07:41:16	0	
\.


--
-- Data for Name: oc_circles_event; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_circles_event (token, instance, event, result, interface, severity, retry, status, updated, creation) FROM stdin;
\.


--
-- Data for Name: oc_circles_member; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_circles_member (id, single_id, circle_id, member_id, user_id, user_type, instance, invited_by, level, status, note, cached_name, cached_update, contact_id, contact_meta, joined) FROM stdin;
1	KepJfVbe4zalExyrXF8McYJRjhTUgKD	KepJfVbe4zalExyrXF8McYJRjhTUgKD	KepJfVbe4zalExyrXF8McYJRjhTUgKD	circles	10000		\N	9	Member	[]	Circles	2025-05-31 07:41:16		\N	2025-05-31 07:41:16
2	4aD3gsuufKlfA2vtJl6ju12klDrcj2E	4aD3gsuufKlfA2vtJl6ju12klDrcj2E	4aD3gsuufKlfA2vtJl6ju12klDrcj2E	x79	1		KepJfVbe4zalExyrXF8McYJRjhTUgKD	9	Member	[]	x79	2025-05-31 07:41:16		\N	2025-05-31 07:41:16
\.


--
-- Data for Name: oc_circles_membership; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_circles_membership (circle_id, single_id, level, inheritance_first, inheritance_last, inheritance_depth, inheritance_path) FROM stdin;
KepJfVbe4zalExyrXF8McYJRjhTUgKD	KepJfVbe4zalExyrXF8McYJRjhTUgKD	9	KepJfVbe4zalExyrXF8McYJRjhTUgKD	KepJfVbe4zalExyrXF8McYJRjhTUgKD	1	["KepJfVbe4zalExyrXF8McYJRjhTUgKD"]
4aD3gsuufKlfA2vtJl6ju12klDrcj2E	4aD3gsuufKlfA2vtJl6ju12klDrcj2E	9	4aD3gsuufKlfA2vtJl6ju12klDrcj2E	4aD3gsuufKlfA2vtJl6ju12klDrcj2E	1	["4aD3gsuufKlfA2vtJl6ju12klDrcj2E"]
\.


--
-- Data for Name: oc_circles_mount; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_circles_mount (id, mount_id, circle_id, single_id, token, parent, mountpoint, mountpoint_hash) FROM stdin;
\.


--
-- Data for Name: oc_circles_mountpoint; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_circles_mountpoint (id, mount_id, single_id, mountpoint, mountpoint_hash) FROM stdin;
\.


--
-- Data for Name: oc_circles_remote; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_circles_remote (id, type, interface, uid, instance, href, item, creation) FROM stdin;
\.


--
-- Data for Name: oc_circles_share_lock; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_circles_share_lock (id, item_id, circle_id, instance) FROM stdin;
\.


--
-- Data for Name: oc_circles_token; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_circles_token (id, share_id, circle_id, single_id, member_id, token, password, accepted) FROM stdin;
\.


--
-- Data for Name: oc_collres_accesscache; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_collres_accesscache (user_id, collection_id, resource_type, resource_id, access) FROM stdin;
\.


--
-- Data for Name: oc_collres_collections; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_collres_collections (id, name) FROM stdin;
\.


--
-- Data for Name: oc_collres_resources; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_collres_resources (collection_id, resource_type, resource_id) FROM stdin;
\.


--
-- Data for Name: oc_comments; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_comments (id, parent_id, topmost_parent_id, children_count, actor_type, actor_id, message, verb, creation_timestamp, latest_child_timestamp, object_type, object_id, reference_id, reactions, expire_date, meta_data) FROM stdin;
1	0	0	0	guests	system	{"message":"conversation_created","parameters":[]}	system	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
2	0	0	0	guests	changelog	## Welcome to Nextcloud Talk!\nIn this conversation you will be informed about new features available in Nextcloud Talk.	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
3	0	0	0	guests	changelog	## New in Talk 6	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
4	0	0	0	guests	changelog	- Microsoft Edge and Safari can now be used to participate in audio and video calls	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
5	0	0	0	guests	changelog	- One-to-one conversations are now persistent and cannot be turned into group conversations by accident any more. Also when one of the participants leaves the conversation, the conversation is not automatically deleted any more. Only if both participants leave, the conversation is deleted from the server	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
6	0	0	0	guests	changelog	- You can now notify all participants by posting "@all" into the chat	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
7	0	0	0	guests	changelog	- With the "arrow-up" key you can repost your last message	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
8	0	0	0	guests	changelog	- Talk can now have commands, send "/help" as a chat message to see if your administrator configured some	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
9	0	0	0	guests	changelog	- With projects you can create quick links between conversations, files and other items	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
10	0	0	0	guests	changelog	## New in Talk 7	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
11	0	0	0	guests	changelog	- You can now mention guests in the chat	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
12	0	0	0	guests	changelog	- Conversations can now have a lobby. This will allow moderators to join the chat and call already to prepare the meeting, while users and guests have to wait	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
13	0	0	0	guests	changelog	## New in Talk 8	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
14	0	0	0	guests	changelog	- You can now directly reply to messages giving the other users more context what your message is about	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
15	0	0	0	guests	changelog	- Searching for conversations and participants will now also filter your existing conversations, making it much easier to find previous conversations	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
16	0	0	0	guests	changelog	- You can now add custom user groups to conversations when the circles app is installed	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
17	0	0	0	guests	changelog	## New in Talk 9	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
18	0	0	0	guests	changelog	- Check out the new grid and call view	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
19	0	0	0	guests	changelog	- You can now upload and drag'n'drop files directly from your device into the chat	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
20	0	0	0	guests	changelog	- Shared files are now opened directly inside the chat view with the viewer apps	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
21	0	0	0	guests	changelog	## New in Talk 10	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
22	0	0	0	guests	changelog	- You can now search for chats and messages in the unified search in the top bar	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
23	0	0	0	guests	changelog	- Spice up your messages with emojis from the emoji picker	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
24	0	0	0	guests	changelog	- You can now change your camera and microphone while being in a call	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
25	0	0	0	guests	changelog	## New in Talk 11	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
26	0	0	0	guests	changelog	- Give your conversations some context with a description and open it up so logged in users can find it and join themselves	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
27	0	0	0	guests	changelog	- See a read status and send failed messages again	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
28	0	0	0	guests	changelog	- Raise your hand in a call with the R key	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
29	0	0	0	guests	changelog	## New in Talk 12	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
30	0	0	0	guests	changelog	- Join the same conversation and call from multiple devices	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
31	0	0	0	guests	changelog	- Send voice messages and share your location or contact details	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
32	0	0	0	guests	changelog	- Add groups to a conversation and new group members will automatically be added as participants	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
33	0	0	0	guests	changelog	## New in Talk 13	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
34	0	0	0	guests	changelog	- A preview of your audio and video is shown before joining a call	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
35	0	0	0	guests	changelog	- You can now blur your background in the newly designed call view	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
36	0	0	0	guests	changelog	- Moderators can now assign general and individual permissions to participants	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
37	0	0	0	guests	changelog	## New in Talk 14	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
38	0	0	0	guests	changelog	- You can now react to chat messages	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
39	0	0	0	guests	changelog	- In the sidebar you can now find an overview of the latest shared items	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
40	0	0	0	guests	changelog	## New in Talk 15	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
41	0	0	0	guests	changelog	- Use a poll to collect the opinions of others or settle on a date	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
42	0	0	0	guests	changelog	- Configure an expiration time for chat messages	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
43	0	0	0	guests	changelog	- Start calls without notifying others in big conversations. You can send individual call notifications once the call has started.	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
44	0	0	0	guests	changelog	- Send chat messages without notifying the recipients in case it is not urgent	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
45	0	0	0	guests	changelog	## New in Talk 16	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
46	0	0	0	guests	changelog	- Emojis can now be autocompleted by typing a ":"	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
47	0	0	0	guests	changelog	- Link various items using the new smart-picker by typing a "/"	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
48	0	0	0	guests	changelog	- Moderators can now create breakout rooms (requires the High-performance backend)	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
49	0	0	0	guests	changelog	- Calls can now be recorded (requires the High-performance backend)	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
50	0	0	0	guests	changelog	## New in Talk 17\n- Conversations can now have an avatar or emoji as icon\n- Virtual backgrounds are now available in addition to the blurred background in video calls\n- Reactions are now available during calls\n- Typing indicators show which users are currently typing a message\n- Groups can now be mentioned in chats\n- Call recordings are automatically transcribed if a transcription provider app is registered\n- Chat messages can be translated if a translation provider app is registered	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
51	0	0	0	guests	changelog	## New in Talk 17.1\n- **Markdown** can now be used in _chat_ messages\n- Webhooks are now available to implement bots. See the documentation for more information https://nextcloud-talk.readthedocs.io/en/latest/bot-list/\n- Set a reminder on a chat message to be notified later again	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
52	0	0	0	guests	changelog	## New in Talk 18\n- Use the **Note to self** conversation to take notes and share information between your devices\n- Captions allow to send a message with a file at the same time\n- Video of the speaker is now visible while sharing the screen and call reactions are animated	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
53	0	0	0	guests	changelog	## New in Talk 19\n- Messages can now be edited by logged-in authors and moderators for 6 hours\n- Unsent message drafts are now saved in your browser\n- Text chatting can now be done in a federated way with other Talk servers	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
54	0	0	0	guests	changelog	## New in Talk 20\n- Moderators can now ban accounts and guests to prevent them from rejoining a conversation\n- Upcoming calls from linked calendar events and out-of-office replacements are now shown in conversations\n- Calls can now be done in a federated way with other Talk servers (requires the High-performance backend)	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
55	0	0	0	guests	changelog	## New in Talk 20.1\n- Introducing the Nextcloud Talk desktop client for Windows, macOS and Linux: https://nextcloud.com/talk-desktop-install\n- Summarize call recordings and unread messages in chats with the Nextcloud Assistant\n- Improved meetings with recognizing guests invited via their email address, import of participant lists, drafts for polls and downloading call participant lists\n- Archive conversations to stay focused	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
56	0	0	0	guests	changelog	## New in Talk 21\n- Schedule a meeting into your calendar from within a conversation\n- Search for messages of the current conversation directly in the right sidebar\n- See more conversations on a first glance with the new compact list (enable in the Talk settings)	comment	2025-05-31 08:35:04	\N	chat	1	\N	\N	\N	null
106	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"20","metaData":{"mimeType":"application\\/pdf"}}}	object_shared	2025-06-12 17:29:05	\N	chat	4	d4179d4562569195f09095de396fb98e7e85064fbea288ddfabcaac845501006	\N	\N	null
107	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"21","metaData":{"mimeType":"application\\/msword"}}}	object_shared	2025-06-12 17:29:08	\N	chat	4	d97e1bad0bbdbb82b9c7fc316f6b4a46439d1c98cac6e681d2eda71c31888fcb	\N	\N	null
70	0	0	0	users	x79	{"message":"conversation_created","parameters":[]}	system	2025-05-31 08:41:05	\N	chat	4	\N	\N	\N	null
71	0	0	0	users	x79	{"message":"conversation_created","parameters":[]}	system	2025-06-01 00:50:50	\N	chat	5	\N	\N	\N	null
72	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"4","metaData":{"mimeType":"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document"}}}	object_shared	2025-06-02 08:02:27	\N	chat	4	8ea2d8608db383ee1970b651410a2bda492b8f9c907c50220c2ed427b1d21093	\N	\N	null
73	0	0	0	users	x79	https://docs.google.com/document/d/1qiiKi041l0MC2g6bk7TNNNf3K8DUMGvd-DdPCx3q-RA/edit?usp=sharing	comment	2025-06-03 12:40:38	\N	chat	4	0f11f4ce12b79749a69cf31596ce67f23b261111241a0d16eb8ae2eeb85bf4ad	\N	\N	{"can_mention_all":true}
96	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"12","metaData":{"mimeType":"application\\/octet-stream"}}}	object_shared	2025-06-11 07:20:36	\N	chat	4	188e9e3c7c021263bd9cc8478b3315754d9e40e9a86af00fafcf04e425695f0a	\N	\N	null
75	74	74	0	users	x79	{"message":"message_deleted","parameters":{"message":"74"}}	system	2025-06-04 00:25:25	\N	chat	4	\N	\N	\N	null
74	0	0	1	users	x79	{"deleted_by_type":"users","deleted_by_id":"x79","deleted_on":1748996725}	comment_deleted	2025-06-04 00:21:27	2025-06-04 00:25:25	chat	4	4c7fcb60cbe833b0fd841895a764f779eb628130778c07a404357a8036348654	\N	\N	{"can_mention_all":true}
76	0	0	0	users	x79	{"message":"user_removed","parameters":{"user":"x79"}}	system	2025-06-04 04:10:10	\N	chat	1	\N	\N	\N	null
77	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"5","metaData":{"mimeType":"application\\/pdf"}}}	object_shared	2025-06-04 15:23:44	\N	chat	4	\N	\N	\N	null
78	0	0	0	users	x79	{"message":"call_started","parameters":[]}	system	2025-06-05 08:29:52	\N	chat	4	\N	\N	\N	null
79	0	0	0	users	x79	{"message":"call_left","parameters":[]}	system	2025-06-05 09:10:19	\N	chat	4	\N	\N	\N	null
80	0	0	0	users	x79	{"message":"call_ended","parameters":{"users":["x79"],"cloudIds":[],"guests":0,"duration":2427}}	system	2025-06-05 09:10:19	\N	chat	4	\N	\N	\N	null
81	0	0	0	users	x79	{"message":"call_started","parameters":[]}	system	2025-06-05 09:11:14	\N	chat	4	\N	\N	\N	null
82	0	0	0	users	x79	{"message":"call_left","parameters":[]}	system	2025-06-05 16:45:39	\N	chat	4	\N	\N	\N	null
83	0	0	0	guests	system	{"message":"call_ended","parameters":{"users":["x79"],"cloudIds":[],"guests":0,"duration":27266}}	system	2025-06-05 16:45:40	\N	chat	4	\N	\N	\N	null
84	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"6","metaData":{"mimeType":"image\\/png"}}}	object_shared	2025-06-07 00:06:08	\N	chat	4	4fcf927e85e5929e4e93ffb19f773683a050933ea27e96c0753df80a4429cb63	\N	\N	null
85	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"7","metaData":{"mimeType":"image\\/png"}}}	object_shared	2025-06-07 03:28:19	\N	chat	4	90d6cb4f58cf013661cb1eb664af6122b1c76480da9fd31ef6d9d35f537a1266	\N	\N	null
86	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"8","metaData":{"mimeType":"image\\/png"}}}	object_shared	2025-06-07 03:28:23	\N	chat	4	cecc44b7349bfe7d873779006536428ecffc746923be3b954ce941222868999d	\N	\N	null
97	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"13","metaData":{"mimeType":"image\\/jpeg"}}}	object_shared	2025-06-11 15:28:26	\N	chat	4	\N	\N	\N	null
88	87	87	0	users	x79	{"message":"message_deleted","parameters":{"message":"87"}}	system	2025-06-08 09:39:57	\N	chat	4	\N	\N	\N	null
87	0	0	1	users	x79	{"deleted_by_type":"users","deleted_by_id":"x79","deleted_on":1749375597}	comment_deleted	2025-06-07 03:28:27	2025-06-08 09:39:57	chat	4	b04ae919558caa8173309284a719f35388190c95a9e9a7d4379ec5a051ae977b	\N	\N	null
89	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"10","metaData":{"mimeType":"text\\/plain"}}}	object_shared	2025-06-09 07:35:49	\N	chat	4	e65407ccf38039917c7569d2d26d2f28ab26fdb79b9be0f6f2b308958d9e19f4	\N	\N	null
90	0	0	0	users	x79	Hi	comment	2025-06-10 15:45:01	\N	chat	4	f821a6f1572a66b822f0faba5f74831f184ea95cdfa4b5b605ac15b136052114	\N	\N	{"can_mention_all":true}
91	0	0	0	users	x79	{"message":"conversation_created","parameters":[]}	system	2025-06-10 15:51:09	\N	chat	6	\N	\N	\N	null
92	0	0	0	users	x79	hi	comment	2025-06-10 15:51:13	\N	chat	6	bd1dd896c34cf13b0ff16655f52f7f627c69bfaa8f4c954415aebec4dc96864e	\N	\N	{"can_mention_all":true}
93	0	0	0	users	x79	hi	comment	2025-06-10 15:51:26	\N	chat	4	c06e248cca8c788a1a08c84884ca13f683ef8295c6057ef2e78cd0a42612500a	\N	\N	{"can_mention_all":true}
94	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"11","metaData":{"mimeType":"video\\/mp4"}}}	object_shared	2025-06-10 16:00:12	\N	chat	6	553be10995fae6d778ba1372187a93e3b170a2c1ee54327a3e624355d6cd3180	\N	\N	null
95	0	0	0	users	x79	hi	comment	2025-06-11 07:19:20	\N	chat	4	a9a05df8ecb716f8e8d573c48c05e3949c7e066b6e034502694284b87d683ddf	\N	\N	{"can_mention_all":true}
98	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"14","metaData":{"mimeType":"image\\/jpeg"}}}	object_shared	2025-06-11 15:28:27	\N	chat	4	\N	\N	\N	null
99	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"15","metaData":{"mimeType":"image\\/jpeg"}}}	object_shared	2025-06-11 15:28:30	\N	chat	4	\N	\N	\N	null
100	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"16","metaData":{"mimeType":"image\\/jpeg"}}}	object_shared	2025-06-11 15:28:30	\N	chat	4	\N	\N	\N	null
101	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"17","metaData":{"mimeType":"image\\/jpeg"}}}	object_shared	2025-06-11 15:28:41	\N	chat	4	\N	\N	\N	null
102	0	0	0	users	x79	WPS Office: Hoàn thiện bộ công cụ văn phòng với trình soạn thảo PDF\n\n\n2025_06_11 19_39 Office Lens:\nhttps://sg.docworkspace.com/d/sII7664K3ArfypcIG?sa=601.1074\n\nMở trong ỨNG DỤNG:\nhttps://s.wps.com/s4QazRluvKa8	comment	2025-06-11 15:52:34	\N	chat	4	80a0dc07a7da0313e563eda7dfaef6ae3b5cf1bd6516781952970bd9767398e9	\N	\N	{"can_mention_all":true}
103	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"18","metaData":{"mimeType":"application\\/pdf"}}}	object_shared	2025-06-11 15:53:44	\N	chat	4	\N	\N	\N	null
104	0	0	0	users	x79	hi	comment	2025-06-12 16:57:23	\N	chat	4	596c7eabf4c64ddc14a8830cd75267338ee9f6039b8d169c68eb1c57c028c4b4	\N	\N	{"can_mention_all":true}
105	0	0	0	users	x79	{"message":"file_shared","parameters":{"share":"19","metaData":{"mimeType":"application\\/msword"}}}	object_shared	2025-06-12 16:59:26	\N	chat	4	81a0568e57497adb31d55a3feb487a85131b1d19292db5aa736c770f258931a1	\N	\N	null
\.


--
-- Data for Name: oc_comments_read_markers; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_comments_read_markers (user_id, object_type, object_id, marker_datetime) FROM stdin;
\.


--
-- Data for Name: oc_dav_absence; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_dav_absence (id, user_id, first_day, last_day, status, message, replacement_user_id, replacement_user_display_name) FROM stdin;
\.


--
-- Data for Name: oc_dav_cal_proxy; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_dav_cal_proxy (id, owner_id, proxy_id, permissions) FROM stdin;
\.


--
-- Data for Name: oc_dav_shares; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_dav_shares (id, principaluri, type, access, resourceid, publicuri) FROM stdin;
\.


--
-- Data for Name: oc_direct_edit; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_direct_edit (id, editor_id, token, file_id, user_id, share_id, "timestamp", accessed, file_path) FROM stdin;
\.


--
-- Data for Name: oc_directlink; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_directlink (id, user_id, file_id, token, expiration) FROM stdin;
\.


--
-- Data for Name: oc_ex_apps; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_apps (id, appid, version, name, daemon_config_name, port, secret, status, enabled, created_time) FROM stdin;
\.


--
-- Data for Name: oc_ex_apps_daemons; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_apps_daemons (id, name, display_name, accepts_deploy_id, protocol, host, deploy_config) FROM stdin;
\.


--
-- Data for Name: oc_ex_apps_routes; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_apps_routes (id, appid, url, verb, access_level, headers_to_exclude, bruteforce_protection) FROM stdin;
\.


--
-- Data for Name: oc_ex_deploy_options; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_deploy_options (id, appid, type, value) FROM stdin;
\.


--
-- Data for Name: oc_ex_event_handlers; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_event_handlers (id, appid, event_type, event_subtypes, action_handler) FROM stdin;
\.


--
-- Data for Name: oc_ex_occ_commands; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_occ_commands (id, appid, name, description, hidden, arguments, options, usages, execute_handler) FROM stdin;
\.


--
-- Data for Name: oc_ex_settings_forms; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_settings_forms (id, appid, formid, scheme) FROM stdin;
\.


--
-- Data for Name: oc_ex_speech_to_text; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_speech_to_text (id, appid, name, display_name, action_handler) FROM stdin;
\.


--
-- Data for Name: oc_ex_speech_to_text_q; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_speech_to_text_q (id, result, error, finished, created_time) FROM stdin;
\.


--
-- Data for Name: oc_ex_task_processing; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_task_processing (id, app_id, name, display_name, task_type, custom_task_type, provider) FROM stdin;
\.


--
-- Data for Name: oc_ex_text_processing; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_text_processing (id, appid, name, display_name, action_handler, task_type) FROM stdin;
\.


--
-- Data for Name: oc_ex_text_processing_q; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_text_processing_q (id, result, error, finished, created_time) FROM stdin;
\.


--
-- Data for Name: oc_ex_translation; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_translation (id, appid, name, display_name, from_languages, to_languages, action_handler, action_detect_lang) FROM stdin;
\.


--
-- Data for Name: oc_ex_translation_q; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_translation_q (id, result, error, finished, created_time) FROM stdin;
\.


--
-- Data for Name: oc_ex_ui_files_actions; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_ui_files_actions (id, appid, name, display_name, mime, permissions, "order", icon, action_handler, version) FROM stdin;
\.


--
-- Data for Name: oc_ex_ui_scripts; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_ui_scripts (id, appid, type, name, path, after_app_id) FROM stdin;
\.


--
-- Data for Name: oc_ex_ui_states; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_ui_states (id, appid, type, name, key, value) FROM stdin;
\.


--
-- Data for Name: oc_ex_ui_styles; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_ui_styles (id, appid, type, name, path) FROM stdin;
\.


--
-- Data for Name: oc_ex_ui_top_menu; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ex_ui_top_menu (id, appid, name, display_name, icon, admin_required) FROM stdin;
\.


--
-- Data for Name: oc_federated_reshares; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_federated_reshares (share_id, remote_id) FROM stdin;
\.


--
-- Data for Name: oc_file_locks; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_file_locks (id, lock, key, ttl) FROM stdin;
1245	0	files/887ea5418de253e21750a16d421317a9	1749889909
1246	0	files/38d3fc13a505a341da34815c5ccc8b3d	1749889909
1247	0	files/96db13540026554b9f0e876bb0137a6c	1749889909
1248	0	files/7897db4187ca2ece03b8bb0989b96219	1749889909
\.


--
-- Data for Name: oc_filecache; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_filecache (fileid, storage, path, path_hash, parent, name, mimetype, mimepart, size, mtime, storage_mtime, encrypted, unencrypted_size, etag, permissions, checksum) FROM stdin;
125	2	appdata_oc9xft3m2oht/preview/a/6/8/4/e/c	b56f934ba77bfc585f08292633a28c91	123	c	2	1	-1	1748677369	1748677369	0	0	683ab2f93f4c8	31	
479	2	appdata_oc9xft3m2oht/preview/d/6/1	af8d147ea9e8d324392d8d862cabbe2e	235	1	2	1	-1	1748925743	1748925743	0	0	683e7d2f72ede	31	
584	2	appdata_oc9xft3m2oht/preview/6/3	6de9cf8912aa4d8666ca8b9d71592889	246	3	2	1	-1	1749174251	1749174251	0	0	684247ebd95c1	31	
7	1	files/Templates/Venn diagram.whiteboard	71d9f77ebd2c126375fa7170a1c86509	4	Venn diagram.whiteboard	7	3	23359	1748677277	1748677277	0	0	7d64f3d631ca3f76ebe6312f30e5ee54	27	
5	1	files/Templates/Party invitation.odt	439f95f734be87868374b1a5a312c550	4	Party invitation.odt	5	3	868111	1748677276	1748677276	0	0	e334aa11fd2e7650226439547a01f7b2	27	
8	1	files/Templates/Syllabus.odt	03b3147e6dae00674c1d50fe22bb8496	4	Syllabus.odt	5	3	30354	1748677277	1748677277	0	0	e41b68a1e69dd7e3759937048c452b24	27	
6	1	files/Templates/Elegant.odp	f3ec70ed694c0ca215f094b98eb046a7	4	Elegant.odp	6	3	14316	1748677277	1748677277	0	0	37714d605b9cf90381a823c95d9c187e	27	
11	1	files/Templates/Meeting agenda.whiteboard	be213da59b99766ceae11e80093803a9	4	Meeting agenda.whiteboard	7	3	27629	1748677277	1748677277	0	0	e7a8350de36d6c4002af447df04c8afa	27	
58	2		d41d8cd98f00b204e9800998ecf8427e	-1		2	1	5285180	1748677299	1748677299	0	0	683ab2b38423a	23	
9	1	files/Templates/Business model canvas.ods	86c10a47dedf156bf4431cb75e0f76ec	4	Business model canvas.ods	8	3	52843	1748677277	1748677277	0	0	ebdafda7bdcf7a5a8fe9769b46446516	27	
10	1	files/Templates/Modern company.odp	96ad2c06ebb6a79bcdf2f4030421dee3	4	Modern company.odp	6	3	317015	1748677277	1748677277	0	0	33ad354c250bc72b24945fa1c99da20c	27	
12	1	files/Templates/Letter.odt	15545ade0e9863c98f3a5cc0fbf2836a	4	Letter.odt	5	3	15961	1748677278	1748677278	0	0	86641aa0d31d9b3fe1a5f84d1e203c8d	27	
14	1	files/Templates/Sticky notes.whiteboard	72309dacd55c6de379c738caf18d84c4	4	Sticky notes.whiteboard	7	3	45778	1748677278	1748677278	0	0	6366d06cc5fb2e29f16789c9c0ca2138	27	
13	1	files/Templates/Mindmap.odg	74cff798fc1b9634ee45380599b2a6da	4	Mindmap.odg	9	3	13653	1748677278	1748677278	0	0	8695da212174da6c024b7361024d0c8e	27	
15	1	files/Templates/Org chart.odg	fd846bc062b158abb99a75a5b33b53e7	4	Org chart.odg	9	3	13878	1748677278	1748677278	0	0	f5fd8829e26b002a3080b2f701672b75	27	
16	1	files/Templates/Business model canvas.odg	6a8f3e02bdf45c8b0671967969393bcb	4	Business model canvas.odg	9	3	16988	1748677278	1748677278	0	0	c8e714ba2a4441d94a7a732d8acc45c9	27	
17	1	files/Templates/Flowchart.whiteboard	b944a25f1ef13e8e256107178bb28141	4	Flowchart.whiteboard	7	3	31132	1748677279	1748677279	0	0	c6e2e46eae8dd081665fc4247b0a8324	27	
20	1	files/Templates/Business model canvas.whiteboard	1c4e5432621502fa9a668c49b25b81d9	4	Business model canvas.whiteboard	7	3	30290	1748677279	1748677279	0	0	ae867cb38e213b26c7977e6373864468	27	
18	1	files/Templates/Diagram & table.ods	0a89f154655f6d4a0098bc4e6ca87367	4	Diagram & table.ods	8	3	13378	1748677279	1748677279	0	0	ef6a586b4f6128864b439fef687d6297	27	
19	1	files/Templates/Product plan.md	a9fbf58bf31cebb8143f7ad3a5205633	4	Product plan.md	11	10	573	1748677279	1748677279	0	0	0eeb29f5ae81ef9ec3a1dd179e1c5bb3	27	
22	1	files/Templates/Simple.odp	a2c90ff606d31419d699b0b437969c61	4	Simple.odp	6	3	14810	1748677280	1748677280	0	0	947c7fe9c7524e418a51cec989725bb1	27	
21	1	files/Templates/Flowchart.odg	832942849155883ceddc6f3cede21867	4	Flowchart.odg	9	3	11836	1748677279	1748677279	0	0	027e62b73deca4a4d9a29aa8f6327020	27	
24	1	files/Templates/Photo book.odt	ea35993988e2799424fef3ff4f420c24	4	Photo book.odt	5	3	5155877	1748677280	1748677280	0	0	f7cf7cf3ffc09364240058dd50bdc499	27	
23	1	files/Templates/Mind map.whiteboard	27c7b4d83fd3526a42122bcacf5dfbe9	4	Mind map.whiteboard	7	3	35657	1748677280	1748677280	0	0	3f2b56a3e58459d0fa4ce2b29c0c7952	27	
28	1	files/Templates/Gotong royong.odp	14b958f5aafb7cfd703090226f3cbd1b	4	Gotong royong.odp	6	3	3509628	1748677281	1748677281	0	0	bb43e52a8e1a15ba06a9e3b0a4689467	27	
25	1	files/Templates/Mother's day.odt	cb66c617dbb4acc9b534ec095c400b53	4	Mother's day.odt	5	3	340061	1748677280	1748677280	0	0	0c6cb49d9c40fe959055c26235493c04	27	
26	1	files/Templates/Readme.md	71fa2e74ab30f39eed525572ccc3bbec	4	Readme.md	11	10	554	1748677280	1748677280	0	0	930ab49d8229c67d867a862e3482c329	27	
27	1	files/Templates/Invoice.odt	40fdccb51b6c3e3cf20532e06ed5016e	4	Invoice.odt	5	3	17276	1748677281	1748677281	0	0	adf5bfa1b585e76eaca057c30766c8e7	27	
29	1	files/Templates/Brainstorming.whiteboard	aa2d36938cf5c1f41813d1e8bbd3ae00	4	Brainstorming.whiteboard	7	3	30780	1748677281	1748677281	0	0	9569d31e13e1ecfee624641ed9896f07	27	
30	1	files/Templates/Meeting notes.md	c0279758bb570afdcdbc2471b2f16285	4	Meeting notes.md	11	10	326	1748677281	1748677281	0	0	32e998a6ff0177f242a40bbcdbe2b9fb	27	
4	1	files/Templates	530b342d0b8164ff3b4754c2273a453e	2	Templates	2	1	10942115	1748677282	1748677282	0	0	683ab2a2e01cd	31	
308	2	appdata_oc9xft3m2oht/theming/global/0/favIcon-spreed#00679e	21885dcb06ce96f9fe703f331719467d	107	favIcon-spreed#00679e	19	3	90022	1748680504	1748680504	0	0	544c4e30f5b2a96035b181b028d636e2	27	
41	1	files_trashbin/files/Nextcloud.png.d1748679801	00e5d13c2621f6dfc81faacf4eb69542	303	Nextcloud.png.d1748679801	15	14	50598	1748677283	1748677283	0	0	7ce07eb6d792976da2cbe199904ef584	27	
60	2	appdata_oc9xft3m2oht/js	e6f9da512de0d0168edc4163469a4d42	59	js	2	1	0	1748677299	1748677299	0	0	683ab2b38e677	31	
44	1	files/Documents/Example.md	efe0853470dd0663db34818b444328dd	42	Example.md	11	10	1095	1748677284	1748677284	0	0	7c69edd0913d35987e9b29c0cc04d137	27	
31	1	files/Templates/Kanban board.whiteboard	174b2766514fef9a88cbb3076e362b4a	4	Kanban board.whiteboard	7	3	25621	1748677281	1748677281	0	0	b3020e5384098032c3560bf8b128bdb4	27	
126	2	appdata_oc9xft3m2oht/preview/b/5/3/b/3/a/3	fce2cd69433ee9442d94eb52767a5e09	122	3	2	1	-1	1748677369	1748677369	0	0	683ab2f93d5bf	31	
61	2	appdata_oc9xft3m2oht/js/core	93db2f03fa8b466a9eed0afd7f745ad0	60	core	2	1	0	1748677299	1748677299	0	0	683ab2b395224	31	
43	1	files/Documents/Nextcloud flyer.pdf	9c5b4dc7182a7435767708ac3e8d126c	42	Nextcloud flyer.pdf	4	3	1105340	1748925730	1748925730	0	0	0a3271eb5bde1f3d0e4a838d78cadcb1	27	
32	1	files/Templates/Impact effort.whiteboard	071dbd5231cfcb493fa2fcc4a763be05	4	Impact effort.whiteboard	7	3	30671	1748677282	1748677282	0	0	94cc8f744835cf007f2c749a2c3eb71a	27	
62	2	appdata_oc9xft3m2oht/js/core/merged-template-prepend.js	a7aac5e12604d7353f032f211a697eb2	61	merged-template-prepend.js	18	3	11773	1748677299	1748677299	0	0	038c06ef36d88b04489afa1676795e7a	27	
63	2	appdata_oc9xft3m2oht/js/core/merged-template-prepend.js.deps	1c6f2e238d18bc7a81ba83984bc9bcd9	61	merged-template-prepend.js.deps	19	3	246	1748677299	1748677299	0	0	40872287b53fcffc70223b35b66fe89e	27	
39	1	files_trashbin/files/Nextcloud intro.mp4.d1748679801	fc8ee9dc0278b9b7600083812baa8d4b	303	Nextcloud intro.mp4.d1748679801	13	12	3963036	1748677283	1748677283	0	0	18f90fbefdfb4cb741e842a1f17b0903	27	
33	1	files/Templates/Timeline.whiteboard	a009a1620252b19a9307d35de49311e9	4	Timeline.whiteboard	7	3	31325	1748677282	1748677282	0	0	85904811322aeb24227d074a124f7e40	27	
40	1	files_trashbin/files/Readme.md.d1748679801	68b632655341fb48ecdd1d254ff9fcb2	303	Readme.md.d1748679801	11	10	197	1748677283	1748677283	0	0	8e404ada93956f486013b4a6e1f7317a	27	
38	1	files_trashbin/files/Templates credits.md.d1748679802	069b6aa0b1431c738db9991652cb3dd9	303	Templates credits.md.d1748679802	11	10	2403	1748677283	1748677283	0	0	50f56d116115e395b17663e1d1abdb36	27	
481	2	appdata_oc9xft3m2oht/preview/d/6/1/e	c7f3d989aadaa0447636faae78a88af4	479	e	2	1	-1	1748925743	1748925743	0	0	683e7d2f71b79	31	
34	1	files/Templates/Resume.odt	ace8f81202eadb2f0c15ba6ecc2539f5	4	Resume.odt	5	3	39404	1748677282	1748677282	0	0	dc4982828a56c71d8f324319e563018c	27	
35	1	files/Templates/Yellow idea.odp	3a57051288d7b81bef3196a2123f4af5	4	Yellow idea.odp	6	3	81196	1748677282	1748677282	0	0	f8be6b4bab6fa5556c0df359d0ebb8f9	27	
36	1	files/Templates/Expense report.ods	d0a4025621279b95d2f94ff4ec09eab3	4	Expense report.ods	8	3	13441	1748677282	1748677282	0	0	11a9e40c8b9a0d4f95a458c49449ef2f	27	
37	1	files/Templates/Timesheet.ods	cb79c81e41d3c3c77cd31576dc7f1a3a	4	Timesheet.ods	8	3	88394	1748677282	1748677282	0	0	e25e1ca1285665e8d868c8cb22b4f8e7	27	
45	1	files/Documents/Readme.md	51ec9e44357d147dd5c212b850f6910f	42	Readme.md	11	10	136	1748677284	1748677284	0	0	87f2ca0585f9032f5b3b20ec8dce0ae9	27	
46	1	files/Documents/Welcome to Nextcloud Hub.docx	b44cb84f22ceddc4ca2826e026038091	42	Welcome to Nextcloud Hub.docx	16	3	23876	1748677284	1748677284	0	0	e0b03cb531d5890a7623be49872ae748	27	
49	1	files/Photos/Vineyard.jpg	14e5f2670b0817614acd52269d971db8	48	Vineyard.jpg	17	14	427030	1748677285	1748677285	0	0	c0b8b0a930de0e07e9597e4577f732d7	27	
50	1	files/Photos/Toucan.jpg	681d1e78f46a233e12ecfa722cbc2aef	48	Toucan.jpg	17	14	167989	1748677285	1748677285	0	0	9ae76311cdb360dc46f4e82b1fe2ffbc	27	
51	1	files/Photos/Steps.jpg	7b2ca8d05bbad97e00cbf5833d43e912	48	Steps.jpg	17	14	567689	1748677285	1748677285	0	0	43e03c236cdc692a8005ae7d6878fe3b	27	
52	1	files/Photos/Gorilla.jpg	6d5f5956d8ff76a5f290cebb56402789	48	Gorilla.jpg	17	14	474653	1748677285	1748677285	0	0	3f36444fc835b5c5bfa2d8d4977bddb3	27	
54	1	files/Photos/Library.jpg	0b785d02a19fc00979f82f6b54a05805	48	Library.jpg	17	14	2170375	1748677286	1748677286	0	0	0d88b2f8eec458abde3f1b2cc5c46e62	27	
53	1	files/Photos/Nextcloud community.jpg	b9b3caef83a2a1c20354b98df6bcd9d0	48	Nextcloud community.jpg	17	14	797325	1748677285	1748677285	0	0	bd429e032abc40f94695f1e37475cbea	27	
55	1	files/Photos/Readme.md	2a4ac36bb841d25d06d164f291ee97db	48	Readme.md	11	10	150	1748677286	1748677286	0	0	6230ed48d7d3e248b2e8b837cffb5e74	27	
56	1	files/Photos/Birdie.jpg	cd31c7af3a0ec6e15782b5edd2774549	48	Birdie.jpg	17	14	593508	1748677286	1748677286	0	0	1156cc948154ce9352c409551cc02d84	27	
57	1	files/Photos/Frog.jpg	d6219add1a9129ed0c1513af985e2081	48	Frog.jpg	17	14	457744	1748677286	1748677286	0	0	294d83ad3e88027b929e97acafa4e6df	27	
48	1	files/Photos	d01bb67e7b71dd49fd06bad922f521c9	2	Photos	2	1	5656463	1748677286	1748677286	0	0	683ab2a6e17f1	31	
64	2	appdata_oc9xft3m2oht/js/core/merged-template-prepend.js.gzip	5a9a4da2232adceff7d98163055e2eaf	61	merged-template-prepend.js.gzip	20	3	2812	1748677299	1748677299	0	0	81337d0cfa8b452a6daac42c6747763d	27	
363	2	appdata_oc9xft3m2oht/avatar/x79/avatar-dark.64.png	bf4c9f4d3e460eb0a88b06c42ba85fa1	103	avatar-dark.64.png	15	14	1118	1748738874	1748738874	0	0	adfa70a325f6d10fa3002103c4d91652	27	
585	2	appdata_oc9xft3m2oht/preview/6/3/6	32048981edd92807109ab8d559edce34	584	6	2	1	-1	1749174251	1749174251	0	0	684247ebd8acf	31	
127	2	appdata_oc9xft3m2oht/preview/7/2/b/3/2/a	4f63e5e6b528be52baf06ffd79f5da5b	124	a	2	1	-1	1748677369	1748677369	0	0	683ab2f93f2de	31	
265	2	appdata_oc9xft3m2oht/preview/d/6/4/5/9/2/0/40/4096-4096-max.png	fd5a0c53aca9688c11af8400d499c897	249	4096-4096-max.png	15	14	49132	1748677957	1748677957	0	0	602dabaf277518970f3aed396e05bde4	27	
69	2	appdata_oc9xft3m2oht/richdocuments/fonts/EBGaramond-wght.ttf	c009f69f8cd5b5dbfe7f1fac336cb050	68	EBGaramond-wght.ttf	22	3	968340	1748677352	1748677352	0	0	066fe86032bbf10d10caf9814e409011	27	
71	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/EBGaramond-wght.ttf.png	e7ab2557dc04fd9f58003a7a7b686e33	70	EBGaramond-wght.ttf.png	15	14	2323	1748677352	1748677352	0	0	696b632ba3f9c4f566b57cbb79c50b1f	27	
72	2	appdata_oc9xft3m2oht/richdocuments/fonts/Spectral-Regular.ttf	8c2cbd711e42cb027457272c8d82c4b3	68	Spectral-Regular.ttf	22	3	261088	1748677352	1748677352	0	0	fd18f7f9adfba56df826369eb709d643	27	
73	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Spectral-Regular.ttf.png	35dc72ebf7b59fbf1c54353be669ed80	70	Spectral-Regular.ttf.png	15	14	2243	1748677352	1748677352	0	0	a5f56778275952763b923de2447d41cc	27	
74	2	appdata_oc9xft3m2oht/richdocuments/fonts/Comfortaa-wght.ttf	dc208d7be2d791f722446c7baffcd9b2	68	Comfortaa-wght.ttf	22	3	201756	1748677352	1748677352	0	0	170d20641981e0fcb666b94f590a3aae	27	
75	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Comfortaa-wght.ttf.png	6decfb52e80123acb00cd8a41949b6dc	70	Comfortaa-wght.ttf.png	15	14	2611	1748677352	1748677352	0	0	7ad442f31beadda821b34f49e3b39eb7	27	
76	2	appdata_oc9xft3m2oht/richdocuments/fonts/Nunito-wght.ttf	ebdb3979bcec684184b4a18ce6eb6569	68	Nunito-wght.ttf	22	3	276932	1748677352	1748677352	0	0	6784974fe35466f7c392e42458a15203	27	
77	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Nunito-wght.ttf.png	76bd67335cbc9990a13d4aca698e294a	70	Nunito-wght.ttf.png	15	14	2152	1748677352	1748677352	0	0	299d01488c819b746f2d9664a3508e6e	27	
78	2	appdata_oc9xft3m2oht/richdocuments/fonts/Lora-wght.ttf	2be4c1bec3e30f7e1c692ce20c6411cc	68	Lora-wght.ttf	22	3	212196	1748677352	1748677352	0	0	993fff113a480694585e4f68a3506136	27	
79	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Lora-wght.ttf.png	452a831cbc61a52501be0ec26e9479f7	70	Lora-wght.ttf.png	15	14	2686	1748677352	1748677352	0	0	1dd0ea1db1d982314ae8a5eb217e24fd	27	
80	2	appdata_oc9xft3m2oht/richdocuments/fonts/PlayfairDisplay-wght.ttf	fb9a83c480f03b9592e128d9212a1ef8	68	PlayfairDisplay-wght.ttf	22	3	300724	1748677352	1748677352	0	0	ab7155eae6457666279078be660f3084	27	
81	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/PlayfairDisplay-wght.ttf.png	03301787b616031f03f10f68745d71b1	70	PlayfairDisplay-wght.ttf.png	15	14	2528	1748677352	1748677352	0	0	84abfce96f3d3156ac0ef2392c13d724	27	
82	2	appdata_oc9xft3m2oht/richdocuments/fonts/Caveat-wght.ttf	27c0fc4c4f12aaf5ca46112fc925ae81	68	Caveat-wght.ttf	22	3	403648	1748677352	1748677352	0	0	0f79112250cc229aa46fbd5cb3db42b9	27	
83	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Caveat-wght.ttf.png	70352bd4a3132349806c8b5bba8ecb55	70	Caveat-wght.ttf.png	15	14	2020	1748677353	1748677353	0	0	a5094f7325b41c78a1e8cee2497b0113	27	
84	2	appdata_oc9xft3m2oht/richdocuments/fonts/Pacifico-Regular.ttf	0c8dca8ed09bb7a39461604fad18bb6d	68	Pacifico-Regular.ttf	22	3	329380	1748677353	1748677353	0	0	88c8f472e82d8a97dd73772c1348587a	27	
85	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Pacifico-Regular.ttf.png	b73167f09274d6d0e1a1f3cc35b756f4	70	Pacifico-Regular.ttf.png	15	14	2753	1748677353	1748677353	0	0	e2342f31f8a943f412794409a3fae080	27	
86	2	appdata_oc9xft3m2oht/richdocuments/fonts/Roboto-wdtg-wght.ttf	ed019178629587f49efb72e3882514c2	68	Roboto-wdtg-wght.ttf	22	3	489752	1748677353	1748677353	0	0	19cab2dd388e114c87eb53e62fd9dafb	27	
87	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Roboto-wdtg-wght.ttf.png	d5b8cd256b0d637b470f0acae5808f4c	70	Roboto-wdtg-wght.ttf.png	15	14	2184	1748677353	1748677353	0	0	cf8547ce7e3c8a71274d5d4ab4142e55	27	
88	2	appdata_oc9xft3m2oht/richdocuments/fonts/Oswald-wght.ttf	27a15a023b053ae6d5cdbd4cea01d600	68	Oswald-wght.ttf	22	3	172088	1748677353	1748677353	0	0	9377c611c41fd02926ceb81ad47f4751	27	
89	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Oswald-wght.ttf.png	ce6bdb6c53d68af42788a7c0c0ae8206	70	Oswald-wght.ttf.png	15	14	1939	1748677353	1748677353	0	0	aff4495057808e7694c87207b8bc8028	27	
90	2	appdata_oc9xft3m2oht/richdocuments/fonts/Lexend-wght.ttf	d45a3156de98cb33a6b06093313af359	68	Lexend-wght.ttf	22	3	175756	1748677353	1748677353	0	0	262d4aa334d54bafd9877dc11d983ec4	27	
91	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Lexend-wght.ttf.png	e4f214bfd59ba1754a613093bdf36180	70	Lexend-wght.ttf.png	15	14	2314	1748677353	1748677353	0	0	c9fd874a47d37314bdc4730f9336a79c	27	
68	2	appdata_oc9xft3m2oht/richdocuments/fonts	2246bd93b04d81df9d85962e1924653e	67	fonts	2	1	5250476	1748677354	1748677354	0	0	683ab2e8233a7	31	
364	2	appdata_oc9xft3m2oht/preview/d/9	0371edc4c22b5904c9a7f9670d3c5ab3	155	9	2	1	-1	1748738881	1748738881	0	0	683ba341c355e	31	
92	2	appdata_oc9xft3m2oht/richdocuments/fonts/AmaticSC-Bold.ttf	a41c28d004e92ea8dea639649b46d2ea	68	AmaticSC-Bold.ttf	22	3	156180	1748677353	1748677353	0	0	e772404ec90725ce54bf17f6f095f5e8	27	
93	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/AmaticSC-Bold.ttf.png	986db92fd37a6825663c4862472deb7a	70	AmaticSC-Bold.ttf.png	15	14	2306	1748677353	1748677353	0	0	3c27a69929d6063bd14efe062138dc30	27	
100	1	cache	0fea6a13c52b4d4725368f24b045ca84	1	cache	2	1	0	1748677366	1748677366	0	0	683ab2f63a576	31	
94	2	appdata_oc9xft3m2oht/richdocuments/fonts/AmaticSC-Regular.ttf	9f698be81f8b888c685e72e6298a1eb8	68	AmaticSC-Regular.ttf	22	3	151624	1748677353	1748677353	0	0	9d4326d19a6ea2f0a6f3a07b63c79379	27	
95	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/AmaticSC-Regular.ttf.png	09cbb4e4282bf1981ca3e861f1de8135	70	AmaticSC-Regular.ttf.png	15	14	1999	1748677353	1748677353	0	0	d0145d2dbc5faf17e7058adc08612b5d	27	
586	2	appdata_oc9xft3m2oht/preview/6/3/6/4	0d2899c57ea74507018a97d6277b07b4	585	4	2	1	-1	1749174251	1749174251	0	0	684247ebd7e3b	31	
96	2	appdata_oc9xft3m2oht/richdocuments/fonts/Montserrat-wght.ttf	e56d9939366de177dfce25a1a1953264	68	Montserrat-wght.ttf	22	3	744936	1748677353	1748677353	0	0	78f1b2dcd2f9d6057dd3e7c577cc9186	27	
97	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Montserrat-wght.ttf.png	d8b92c0081af71223e62b521f198e806	70	Montserrat-wght.ttf.png	15	14	1937	1748677353	1748677353	0	0	d4e0f944143867d0f498db7a9d191df0	27	
98	2	appdata_oc9xft3m2oht/richdocuments/fonts/Lobster-Regular.ttf	445454120c7a1b272c1de2326a251afe	68	Lobster-Regular.ttf	22	3	406076	1748677354	1748677354	0	0	eb58eca0d6bc81ad8926686531d74700	27	
99	2	appdata_oc9xft3m2oht/richdocuments/font-overviews/Lobster-Regular.ttf.png	3a412b3a9bccb5de2596014645613cca	70	Lobster-Regular.ttf.png	15	14	2709	1748677354	1748677354	0	0	c3be912206154a3fe991aecb5933341e	27	
102	2	appdata_oc9xft3m2oht/avatar	d840d2ae27262ddb65b82f912f86516f	59	avatar	2	1	0	1748677368	1748677368	0	0	683ab2f8c3799	31	
70	2	appdata_oc9xft3m2oht/richdocuments/font-overviews	d5f88e5ab41ea3e07f054ab11a6bfad9	67	font-overviews	2	1	34704	1748677354	1748677354	0	0	683ab2e83f584	31	
104	2	appdata_oc9xft3m2oht/theming	776ae783092a52b1f23625ef1972ffeb	59	theming	2	1	0	1748677369	1748677369	0	0	683ab2f92462b	31	
105	2	appdata_oc9xft3m2oht/preview	cb5ed7795dc7e2eb07c5ba01ef90ac36	59	preview	2	1	0	1748677369	1748677369	0	0	683ab2f92f063	31	
106	2	appdata_oc9xft3m2oht/theming/global	7037b1d671c34f7e64d7d903d28d1ac8	104	global	2	1	0	1748677369	1748677369	0	0	683ab2f933da4	31	
108	2	appdata_oc9xft3m2oht/preview/b	192b848618511044f7259a2e04608e7c	105	b	2	1	-1	1748677369	1748677369	0	0	683ab2f944947	31	
109	2	appdata_oc9xft3m2oht/preview/a	e7c94ee4c241345be3cd2a796f12a9fe	105	a	2	1	-1	1748677369	1748677369	0	0	683ab2f946300	31	
110	2	appdata_oc9xft3m2oht/preview/b/5	4b27f87ef75acfc6c9ee2a944b8a59dc	108	5	2	1	-1	1748677369	1748677369	0	0	683ab2f942a67	31	
111	2	appdata_oc9xft3m2oht/preview/7	485cc4a9e0f36b25b90be096f6e0db32	105	7	2	1	-1	1748677369	1748677369	0	0	683ab2f946cec	31	
112	2	appdata_oc9xft3m2oht/preview/a/6	9cabc3d9b64538c2fd360d6289de0c09	109	6	2	1	-1	1748677369	1748677369	0	0	683ab2f944e98	31	
113	2	appdata_oc9xft3m2oht/preview/b/5/3	8c01d302ffaf5de81488cc431ce8594b	110	3	2	1	-1	1748677369	1748677369	0	0	683ab2f941b54	31	
114	2	appdata_oc9xft3m2oht/preview/7/2	3a8ee775be9a8b2820f76f913cd7980d	111	2	2	1	-1	1748677369	1748677369	0	0	683ab2f945272	31	
115	2	appdata_oc9xft3m2oht/preview/a/6/8	4aee819c15edc5a58c390750e2b4e150	112	8	2	1	-1	1748677369	1748677369	0	0	683ab2f943b2d	31	
116	2	appdata_oc9xft3m2oht/preview/b/5/3/b	d163bb36e1e85e3b2f37759fead5d136	113	b	2	1	-1	1748677369	1748677369	0	0	683ab2f940510	31	
117	2	appdata_oc9xft3m2oht/theming/global/0/icon-core-#00679efiletypes_image.svg	db5fb6c446c042dce76c271fdf6ffc42	107	icon-core-#00679efiletypes_image.svg	34	14	705	1748677369	1748677369	0	0	8eff40651700961bd164d663e9f23362	27	
118	2	appdata_oc9xft3m2oht/preview/7/2/b	94096b8a54abdedca7d1cf1f4acc9371	114	b	2	1	-1	1748677369	1748677369	0	0	683ab2f943fb5	31	
119	2	appdata_oc9xft3m2oht/preview/b/5/3/b/3	46ba69b5b5a61d8f4237aba251a1ca4e	116	3	2	1	-1	1748677369	1748677369	0	0	683ab2f93f4c8	31	
120	2	appdata_oc9xft3m2oht/preview/a/6/8/4	5c0dce10c0d680da362fba0c766de5ce	115	4	2	1	-1	1748677369	1748677369	0	0	683ab2f942514	31	
121	2	appdata_oc9xft3m2oht/preview/7/2/b/3	579a2709cee9d2774b257471d32410ac	118	3	2	1	-1	1748677369	1748677369	0	0	683ab2f942b03	31	
122	2	appdata_oc9xft3m2oht/preview/b/5/3/b/3/a	e9c83ed32f12ea321d7b942f16afd0ad	119	a	2	1	-1	1748677369	1748677369	0	0	683ab2f93e6c0	31	
123	2	appdata_oc9xft3m2oht/preview/a/6/8/4/e	5e5541998c8863307b12322669fd7f5b	120	e	2	1	-1	1748677369	1748677369	0	0	683ab2f941257	31	
124	2	appdata_oc9xft3m2oht/preview/7/2/b/3/2	fee457d30f3de6ae37501df14e48c808	121	2	2	1	-1	1748677369	1748677369	0	0	683ab2f94108a	31	
174	2	appdata_oc9xft3m2oht/avatar/x79/avatar-dark.png	ea258669de035976f0441f9840edd94d	103	avatar-dark.png	15	14	23164	1748677370	1748677370	0	0	3b5b585dc07d9aa6be18f2020f45948a	27	
292	1	files/Notes	bbe65c07ffc1a0867fb4b6e1b78a3951	2	Notes	2	1	0	1748679343	1748679343	0	0	683abaafcc87d	31	
128	2	appdata_oc9xft3m2oht/preview/a/6/8/4/e/c/e	d7479bf64b22b39255a0bc49adbda520	125	e	2	1	-1	1748677369	1748677369	0	0	683ab2f93de95	31	
365	2	appdata_oc9xft3m2oht/preview/d/9/d	45f7c77e42a6164bd48de3a4ab1aef92	364	d	2	1	-1	1748738881	1748738881	0	0	683ba341c272c	31	
788	2	appdata_oc9xft3m2oht/preview/3/6	3c6f6926f4626aae0720aa522907319f	199	6	2	1	-1	1749655675	1749655675	0	0	6849a07b671a0	31	
151	2	appdata_oc9xft3m2oht/preview/a/6/8/4/e/c/e/54/1600-1066-max.jpg	e9b58b5d129c3ffe448261a8958b9a5f	131	1600-1066-max.jpg	17	14	351167	1748677369	1748677369	0	0	51e02ba11c9a41aad067a21d278f17ce	27	
163	2	appdata_oc9xft3m2oht/preview/a/6/8/4/e/c/e/54/256-256-crop.jpg	fe4356de5a1b5c025dabd95575895b7e	131	256-256-crop.jpg	17	14	18029	1748677370	1748677370	0	0	d97ddf224e5788a855dbce016bc655fb	27	
587	2	appdata_oc9xft3m2oht/preview/6/3/6/4/d	8f1f7ba0a34f4dea4a7b0b47bdd07b1a	586	d	2	1	-1	1749174251	1749174251	0	0	684247ebd7586	31	
309	2	appdata_oc9xft3m2oht/spreed	00f7dcc4a2c8c319640fb841013ca7a4	59	spreed	2	1	0	1748680505	1748680505	0	0	683abf38ebbec	31	
366	2	appdata_oc9xft3m2oht/preview/d/9/d/4	dc43f94dd828a1fb985c4beb200b2ede	365	4	2	1	-1	1748738881	1748738881	0	0	683ba341c1d15	31	
311	2	appdata_oc9xft3m2oht/spreed/room-avatar/72ce2raz	8622004687c725415dea1d617353e2e6	310	72ce2raz	2	1	0	1748680505	1748680505	0	0	683abf3906bbb	31	
312	2	appdata_oc9xft3m2oht/spreed/room-avatar/72ce2raz/2X6m4GLZE2jzZSXG.svg	3d6713a6bd7bf7b2eb905fbcc7fb6ac3	311	2X6m4GLZE2jzZSXG.svg	34	14	486	1748680505	1748680505	0	0	2552b8b0566626ecd99f35797d9ccfc3	27	
367	2	appdata_oc9xft3m2oht/preview/d/9/d/4/f	d52ef35f9f1082d1ea331f00a6c0c4d5	366	f	2	1	-1	1748738881	1748738881	0	0	683ba341c0ed3	31	
313	2	appdata_oc9xft3m2oht/spreed/room-avatar/kghusnpu	37676b96b608370581a04a2b09b69fee	310	kghusnpu	2	1	0	1748680505	1748680505	0	0	683abf39155b6	31	
314	2	appdata_oc9xft3m2oht/spreed/room-avatar/kghusnpu/qQJd9aPZZPFswSaP.svg	586cde880f3822cadf3edd83882ec719	313	qQJd9aPZZPFswSaP.svg	34	14	491	1748680505	1748680505	0	0	0fb537d28e22fd3b185bfb9a51fffa77	27	
368	2	appdata_oc9xft3m2oht/preview/d/9/d/4/f/4	e53b4ea8af9508d2d91dc1182282f019	367	4	2	1	-1	1748738881	1748738881	0	0	683ba341bfb92	31	
370	2	appdata_oc9xft3m2oht/preview/d/9/d/4/f/4/9	272304eac63d732ee6a64319143fa644	368	9	2	1	-1	1748738881	1748738881	0	0	683ba341be802	31	
352	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9/5/339/256-256-crop.jpg	6837006315422c4943b8833a0ebe2892	347	256-256-crop.jpg	17	14	11228	1748681003	1748681003	0	0	ede316ccab4ba98ac78ee224a0a2bc75	27	
589	2	appdata_oc9xft3m2oht/preview/6/3/6/4/d/3	dea6609d2fb06fdc81efb7cce95aedd3	587	3	2	1	-1	1749174251	1749174251	0	0	684247ebd68bd	31	
372	2	appdata_oc9xft3m2oht/preview/d/9/d/4/f/4/9/46	330d1c2323bb14c9dafec1eeba802a53	370	46	2	1	0	1748738881	1748738881	0	0	683ba341bd4f0	31	
394	2	appdata_oc9xft3m2oht/theming/global/0/favIcon-files#00679e	d878d5a9ea895698f88376c6c788c462	107	favIcon-files#00679e	19	3	90022	1748738946	1748738946	0	0	b3197bcb83a694a4223818a9958c026e	27	
417	2	appdata_oc9xft3m2oht/preview/5	5924007dc4bbf237f8e81f20de946b35	105	5	2	1	-1	1748739054	1748739054	0	0	683ba3eeb705c	31	
421	2	appdata_oc9xft3m2oht/preview/5/a	b44b00e793970a11c547d30a567aecee	417	a	2	1	-1	1748739054	1748739054	0	0	683ba3eeb5f04	31	
425	2	appdata_oc9xft3m2oht/preview/5/a/4	87e02ac141316fbe7c3e516549e81729	421	4	2	1	-1	1748739054	1748739054	0	0	683ba3eeb4ba4	31	
428	2	appdata_oc9xft3m2oht/preview/5/a/4/b	cc29c95b887df440ee915995cd6ac15a	425	b	2	1	-1	1748739054	1748739054	0	0	683ba3eeb3986	31	
432	2	appdata_oc9xft3m2oht/preview/5/a/4/b/2	2ea273015464076e7d2e7f2cd338ffb3	428	2	2	1	-1	1748739054	1748739054	0	0	683ba3eeb2e72	31	
434	2	appdata_oc9xft3m2oht/preview/5/a/4/b/2/5	e2c6a548928419d6a1f41890abb95688	432	5	2	1	-1	1748739054	1748739054	0	0	683ba3eeb1c5d	31	
435	2	appdata_oc9xft3m2oht/preview/5/a/4/b/2/5/a	e8bffc53cbc4604c95d44efda5a1e077	434	a	2	1	-1	1748929200	1748929200	0	0	683ba3eeb0d5f	31	
442	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683ba28d-92a/3289725285460e73018ab98c443beb37.aW1hZ2UvcG5n.png	3127c445912ce5d2cbd6122b25d4a1cb	441	3289725285460e73018ab98c443beb37.aW1hZ2UvcG5n.png	15	14	314506	1748739414	1748739414	0	0	e3da13d0bbd8856537faba48924f2b1c	27	
483	2	appdata_oc9xft3m2oht/preview/f/c	98ea56b32a662427674802d8e00240e2	165	c	2	1	-1	1748925743	1748925743	0	0	683e7d2f75c6b	31	
486	2	appdata_oc9xft3m2oht/preview/f/c/c	26abd0d90b2a58a83934183f522f92a0	483	c	2	1	-1	1748925743	1748925743	0	0	683e7d2f74c5e	31	
441	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683ba28d-92a	fef316f5c62725f965c69305c9238853	275	683ba28d-92a	2	1	0	1748739424	1748739424	0	0	683ba555290e2	31	
488	2	appdata_oc9xft3m2oht/preview/f/c/c/b	ba0acc6d600677c744277e815b4c2a4b	486	b	2	1	-1	1748925743	1748925743	0	0	683e7d2f73da5	31	
131	2	appdata_oc9xft3m2oht/preview/a/6/8/4/e/c/e/54	c64e63620df169ba0dce999a56219376	128	54	2	1	0	1749174229	1749174229	0	0	683ab2f93b6c7	31	
456	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683e7a49-92a/acffabdbe5148794e282887781da1988.aW1hZ2UvcG5n.png	62e3105df1ad76559ebb878c17a3c4ff	453	acffabdbe5148794e282887781da1988.aW1hZ2UvcG5n.png	15	14	1150887	1748925551	1748925551	0	0	4b525ffaa43236f3fe80a5ea30824491	27	
315	2	appdata_oc9xft3m2oht/theming/global/0/touchIcon-spreed#00679e	1722f3a628bbfa1c8ff644c03f0b64da	107	touchIcon-spreed#00679e	19	3	18418	1748680505	1748680505	0	0	96c05b23695c5563ef3e2ada1957178e	27	
326	1	files/Talk/IMG_20250531_141547.jpg	60f26dd9a30eb5386ae6ae9dc2fc94aa	307	IMG_20250531_141547.jpg	17	14	2320888	1748680790	1748680790	0	0	7a2b24f81410914294471d7be5c095bf	27	
149	2	appdata_oc9xft3m2oht/preview/b/5/3/b/3/a/3/55/4096-4096-max.png	ad83bd2edc601f498898f5134fe6ad8e	129	4096-4096-max.png	15	14	36192	1748677369	1748677369	0	0	895a30333b4c1c940e7a45817d1c5710	27	
180	2	appdata_oc9xft3m2oht/preview/b/5/3/b/3/a/3/55/256-256-crop.png	20b50e57856807fef9ba0db19eed4589	129	256-256-crop.png	15	14	6477	1748677371	1748677371	0	0	63188755f26b9d208122b3dd4b126742	27	
588	2	appdata_oc9xft3m2oht/preview/1/8	5dacda56bc279cd9f00fc4be84fcb4cf	355	8	2	1	-1	1749174251	1749174251	0	0	684247ebdded0	31	
590	2	appdata_oc9xft3m2oht/preview/1/8/2	418c08de28baa8e8f4570113d5be79de	588	2	2	1	-1	1749174251	1749174251	0	0	684247ebdd14c	31	
382	2	appdata_oc9xft3m2oht/preview/6/c/8/3/4/9/c/45	65c3da6ec619edff68d5d164cb938120	379	45	2	1	0	1749570252	1749570252	0	0	683ba341c4186	31	
339	1	files/Talk/2025-05-31 15-40-08.jpg	d4ae30fdcb9854e8de3367ba27576594	307	2025-05-31 15-40-08.jpg	17	14	2911727	1748680817	1748680817	0	0	e5a6c4983124a033b9b7fe1925e68232	27	
895	2	appdata_oc9xft3m2oht/preview/d/5/6	71e80e1b9ea59974e977813dda97cb63	894	6	2	1	-1	1749747759	1749747759	0	0	684b082ff1881	31	
484	2	appdata_oc9xft3m2oht/preview/d/6/1/e/4	8e4670826cd8630e340c6e75a7adb42b	481	4	2	1	-1	1748925743	1748925743	0	0	683e7d2f70e43	31	
487	2	appdata_oc9xft3m2oht/preview/d/6/1/e/4/b	d9be02502d860d1b00409dfdfeaabfea	484	b	2	1	-1	1748925743	1748925743	0	0	683e7d2f6fd24	31	
443	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683ba28d-92a/acffabdbe5148794e282887781da1988.aW1hZ2UvcG5n.png	5a7859c9255e16a233aa503475d46c42	441	acffabdbe5148794e282887781da1988.aW1hZ2UvcG5n.png	15	14	1150887	1748739415	1748739415	0	0	f8b7b8dc88e295a34797a90f7a421d38	27	
406	2	appdata_oc9xft3m2oht/preview/e/4/6/d/e/7/e	0233d900c43e15892068649f3ef57347	405	e	2	1	-1	1748739601	1748739601	0	0	683ba3ee995ad	31	
369	2	appdata_oc9xft3m2oht/preview/6/c	4cb8a81141c8a04b93d1aef254e6964e	246	c	2	1	-1	1748738881	1748738881	0	0	683ba341c8f4d	31	
371	2	appdata_oc9xft3m2oht/preview/6/c/8	68e01df231ca3e0b072b5d6747d6965f	369	8	2	1	-1	1748738881	1748738881	0	0	683ba341c84d7	31	
373	2	appdata_oc9xft3m2oht/preview/6/c/8/3	c1abb5fb9d656304344b5b7934fe81ab	371	3	2	1	-1	1748738881	1748738881	0	0	683ba341c76f0	31	
375	2	appdata_oc9xft3m2oht/preview/6/c/8/3/4	b8aa42cfde1a237a9967ff7a424cec52	373	4	2	1	-1	1748738881	1748738881	0	0	683ba341c68c1	31	
377	2	appdata_oc9xft3m2oht/preview/6/c/8/3/4/9	9d2c46dc24e8d7e229badc1e3c62ac87	375	9	2	1	-1	1748738881	1748738881	0	0	683ba341c5eb8	31	
379	2	appdata_oc9xft3m2oht/preview/6/c/8/3/4/9/c	cc3fd1a580dc1791c9983fd04e6de6dc	377	c	2	1	-1	1748738881	1748738881	0	0	683ba341c52bd	31	
129	2	appdata_oc9xft3m2oht/preview/b/5/3/b/3/a/3/55	fe2d36a1cf2933abd1f429e661028f41	126	55	2	1	0	1749114800	1749114800	0	0	683ab2f93bc4f	31	
385	2	appdata_oc9xft3m2oht/preview/6/c/8/3/4/9/c/45/4096-4096-max.png	a2a8976f1e85a6f71bca489f57aa09e3	382	4096-4096-max.png	15	14	36693	1748738882	1748738882	0	0	1eb2b5106ba0968c608c3821e490001c	27	
387	2	appdata_oc9xft3m2oht/preview/6/c/8/3/4/9/c/45/64-64-crop.png	ae5dabb9e34eb8f798ba27fa0c1bf759	382	64-64-crop.png	15	14	931	1748738883	1748738883	0	0	f1e977f794e45f011e30b8a8f3bc2169	27	
403	2	appdata_oc9xft3m2oht/preview/e/4/6/d	968afd21b5022c40a633152101273a67	402	d	2	1	-1	1748739054	1748739054	0	0	683ba3ee9d234	31	
404	2	appdata_oc9xft3m2oht/preview/e/4/6/d/e	933bbb4fdb60a9c456737e60bc16a7a9	403	e	2	1	-1	1748739054	1748739054	0	0	683ba3ee9bc99	31	
400	2	appdata_oc9xft3m2oht/preview/e	502b1b997a3be48010dc7db7e47350fa	105	e	2	1	-1	1748739054	1748739054	0	0	683ba3eea2610	31	
401	2	appdata_oc9xft3m2oht/preview/e/4	339fdd8705c41e72057bae696b82a3f6	400	4	2	1	-1	1748739054	1748739054	0	0	683ba3eea037d	31	
402	2	appdata_oc9xft3m2oht/preview/e/4/6	8eaf6c2faab4874a2eceee243019ad75	401	6	2	1	-1	1748739054	1748739054	0	0	683ba3ee9e83b	31	
405	2	appdata_oc9xft3m2oht/preview/e/4/6/d/e/7	5835bb57c81dd0334889e446fa6d8b05	404	7	2	1	-1	1748739054	1748739054	0	0	683ba3ee9aaf2	31	
451	1	files/Talk/Nghien cuu khoa hoc_tinhluong.docx	034a377f9f7468d241fdc4322f02664d	307	Nghien cuu khoa hoc_tinhluong.docx	16	3	122609	1748850106	1748850106	0	0	bfec0240818499e6cbd49401a8c87d89	27	
457	2	appdata_oc9xft3m2oht/richdocuments/empty_templates/document.ott	4ca6b5afb6a736f3a02e12f8fc469cf5	317	document.ott	69	3	1288	1748925599	1748925599	0	0	2accad074b74b6cbf39c443977d519ec	27	
458	2	appdata_oc9xft3m2oht/richdocuments/empty_templates/spreadsheet.ots	82d811ef49590a83e2fa0ff6a46ee631	317	spreadsheet.ots	70	3	683	1748925599	1748925599	0	0	f71549e2478a2ff93524b022dc0baedd	27	
459	2	appdata_oc9xft3m2oht/richdocuments/empty_templates/presentation.otp	04e6aaf7c76454b39ca3a153a328167e	317	presentation.otp	71	3	680	1748925599	1748925599	0	0	d00fb0106a87f12bd97d6cee626f16c3	27	
460	2	appdata_oc9xft3m2oht/richdocuments/empty_templates/drawing.otg	535225f71efdfe29bb85ea5792abeeec	317	drawing.otg	72	3	670	1748925599	1748925599	0	0	45d92ce85915fe545b8402f66054dc5a	27	
130	2	appdata_oc9xft3m2oht/preview/7/2/b/3/2/a/1	6911d036987484d06690755854c4b0a3	127	1	2	1	-1	1748677369	1748677369	0	0	683ab2f93de2d	31	
140	2	appdata_oc9xft3m2oht/preview/9/f/6/1/4/0/8/56	153be2ecf32d4c4f9e75d2663fb95797	139	56	2	1	0	1749174229	1749174229	0	0	683ab2f96a10a	31	
591	2	appdata_oc9xft3m2oht/preview/6/3/6/4/d/3/f	e0b1446f2dfed789d74d1ca9a30aaa84	589	f	2	1	-1	1749174251	1749174251	0	0	684247ebd5f18	31	
133	2	appdata_oc9xft3m2oht/preview/9	ed099bb4879a8c0c7bdabd42fc12fd3c	105	9	2	1	-1	1748677369	1748677369	0	0	683ab2f972270	31	
134	2	appdata_oc9xft3m2oht/preview/9/f	f39e05d3b517578e49817d67b772dd67	133	f	2	1	-1	1748677369	1748677369	0	0	683ab2f970fd4	31	
135	2	appdata_oc9xft3m2oht/preview/9/f/6	3f14b320b335104c44d36a9bc4862002	134	6	2	1	-1	1748677369	1748677369	0	0	683ab2f9705a0	31	
136	2	appdata_oc9xft3m2oht/preview/9/f/6/1	41612ea6d7f9cd7a58986fdf2c66501c	135	1	2	1	-1	1748677369	1748677369	0	0	683ab2f96f7c7	31	
137	2	appdata_oc9xft3m2oht/preview/9/f/6/1/4	93f9797c50d3c8e5780013d3dd782e4b	136	4	2	1	-1	1748677369	1748677369	0	0	683ab2f96e71a	31	
138	2	appdata_oc9xft3m2oht/preview/9/f/6/1/4/0	766ebe013484667fa97c1221c4ec35a6	137	0	2	1	-1	1748677369	1748677369	0	0	683ab2f96d959	31	
139	2	appdata_oc9xft3m2oht/preview/9/f/6/1/4/0/8	afa68e2c6338ec2eb7db4e2abb022127	138	8	2	1	-1	1748677369	1748677369	0	0	683ab2f96cedc	31	
132	2	appdata_oc9xft3m2oht/preview/7/2/b/3/2/a/1/57	4b252d3f62c08e0f836dd10c30090495	130	57	2	1	0	1749174229	1749174229	0	0	683ab2f93b64a	31	
141	2	appdata_oc9xft3m2oht/preview/7/2/b/3/2/a/1/57/1600-1067-max.jpg	780f3e6e005fd24195d8d7aad6737762	132	1600-1067-max.jpg	17	14	147631	1748677369	1748677369	0	0	2102c34b8cb17248441654975a70bc1f	27	
142	2	appdata_oc9xft3m2oht/preview/9/a	57d0e577c4f99667d97b6a6122e64d98	133	a	2	1	-1	1748677369	1748677369	0	0	683ab2f9a0627	31	
143	2	appdata_oc9xft3m2oht/preview/9/a/1	90d37bf503cc457e62687cf7f023218d	142	1	2	1	-1	1748677369	1748677369	0	0	683ab2f99f8f9	31	
144	2	appdata_oc9xft3m2oht/preview/9/a/1/1	118033f59b6637bb4b498daa96505d6b	143	1	2	1	-1	1748677369	1748677369	0	0	683ab2f99e74d	31	
145	2	appdata_oc9xft3m2oht/preview/9/a/1/1/5	e0321dcc18303f315d705b8abbe403b3	144	5	2	1	-1	1748677369	1748677369	0	0	683ab2f99d97d	31	
146	2	appdata_oc9xft3m2oht/preview/9/a/1/1/5/8	db3598b061b69671b4113f220759bbe0	145	8	2	1	-1	1748677369	1748677369	0	0	683ab2f99c2ac	31	
147	2	appdata_oc9xft3m2oht/preview/9/a/1/1/5/8/1	18063f51018de19bfa07d563b3da11dc	146	1	2	1	-1	1748677369	1748677369	0	0	683ab2f99b054	31	
150	2	appdata_oc9xft3m2oht/preview/9/f/6/1/4/0/8/56/1600-1067-max.jpg	a2726678c2262fdfa60a47dd31c7fa20	140	1600-1067-max.jpg	17	14	165982	1748677369	1748677369	0	0	c6f8662c56bd761318b2ffe27932ac8b	27	
152	2	appdata_oc9xft3m2oht/preview/7/2/b/3/2/a/1/57/256-256-crop.jpg	235ced498a456c25b7e1d2f86f761fca	132	256-256-crop.jpg	17	14	8563	1748677369	1748677369	0	0	5088629bba8aa7706a1af43955afec7a	27	
153	2	appdata_oc9xft3m2oht/preview/9/a/1/1/5/8/1/52/1600-1067-max.jpg	c9e5bf74447f018cc0dd7c761fcb5bda	148	1600-1067-max.jpg	17	14	232378	1748677370	1748677370	0	0	732a69e548b021e3943b990421efcf18	27	
154	2	appdata_oc9xft3m2oht/preview/9/f/6/1/4/0/8/56/256-256-crop.jpg	2e030b76cebe990f36b9632c1ca4a05f	140	256-256-crop.jpg	17	14	13183	1748677370	1748677370	0	0	6b6bd65b9d2cc5645d3e7b9111192734	27	
155	2	appdata_oc9xft3m2oht/preview/d	62ff682768c0c6f68ef977748a9f1000	105	d	2	1	-1	1748677370	1748677370	0	0	683ab2fa3292b	31	
156	2	appdata_oc9xft3m2oht/preview/d/8	ebffbcb9028a349e263b8dd15ce41625	155	8	2	1	-1	1748677370	1748677370	0	0	683ab2fa31080	31	
157	2	appdata_oc9xft3m2oht/preview/d/8/2	e060051acd8b5f75d814b72226088df1	156	2	2	1	-1	1748677370	1748677370	0	0	683ab2fa2ee40	31	
158	2	appdata_oc9xft3m2oht/preview/d/8/2/c	3544cdb6c2b510f56d52df123d98428b	157	c	2	1	-1	1748677370	1748677370	0	0	683ab2fa2d5d3	31	
159	2	appdata_oc9xft3m2oht/preview/d/8/2/c/8	8e9b41bdae83ddfca9371b62931cef99	158	8	2	1	-1	1748677370	1748677370	0	0	683ab2fa2c821	31	
160	2	appdata_oc9xft3m2oht/preview/d/8/2/c/8/d	176ab11ef3738b4218bd5e2cfe4ca717	159	d	2	1	-1	1748677370	1748677370	0	0	683ab2fa2b40c	31	
161	2	appdata_oc9xft3m2oht/preview/d/8/2/c/8/d/1	55d6205a3b217769c1f0db8128f18bc6	160	1	2	1	-1	1748677370	1748677370	0	0	683ab2fa2a056	31	
164	2	appdata_oc9xft3m2oht/preview/9/a/1/1/5/8/1/52/256-256-crop.jpg	a110f241b1cc7a2bbbf7046d633cd11a	148	256-256-crop.jpg	17	14	13880	1748677370	1748677370	0	0	d5b1275b78a66f4337c7192a92169bc0	27	
165	2	appdata_oc9xft3m2oht/preview/f	8dc56d737371f10cfcd1914dae59511c	105	f	2	1	-1	1748677370	1748677370	0	0	683ab2fa789be	31	
166	2	appdata_oc9xft3m2oht/preview/f/4	1794bbe7aa3618ae4102b3ab761b9693	165	4	2	1	-1	1748677370	1748677370	0	0	683ab2fa78038	31	
167	2	appdata_oc9xft3m2oht/preview/f/4/5	b158dcb0f5f1897b323230b627650255	166	5	2	1	-1	1748677370	1748677370	0	0	683ab2fa76ee0	31	
168	2	appdata_oc9xft3m2oht/preview/f/4/5/7	b5a187d89b88cdc526c780d9b4a8d22d	167	7	2	1	-1	1748677370	1748677370	0	0	683ab2fa75763	31	
169	2	appdata_oc9xft3m2oht/preview/f/4/5/7/c	6c1aaecbb3e105de8ed5f61343b1352b	168	c	2	1	-1	1748677370	1748677370	0	0	683ab2fa73ef1	31	
267	2	appdata_oc9xft3m2oht/text	bc2af79647dba23abbb49cb3e0767792	59	text	2	1	0	1748677957	1748677957	0	0	683ab54586a0e	31	
170	2	appdata_oc9xft3m2oht/preview/f/4/5/7/c/5	1c63aa64380c1fadbb4fe81b71600e44	169	5	2	1	-1	1748677370	1748677370	0	0	683ab2fa735d7	31	
171	2	appdata_oc9xft3m2oht/preview/f/4/5/7/c/5/4	58d1a6103011b2a2a8a6a13ae1afed64	170	4	2	1	-1	1748677370	1748677370	0	0	683ab2fa72749	31	
374	2	appdata_oc9xft3m2oht/preview/f/7	9f4424643dfc125a0619c966b953eee1	165	7	2	1	-1	1748738881	1748738881	0	0	683ba341cc075	31	
592	2	appdata_oc9xft3m2oht/preview/1/8/2/b	deb3f6ce9acb9f4f94265e435cca250e	590	b	2	1	-1	1749174251	1749174251	0	0	684247ebdc942	31	
173	2	appdata_oc9xft3m2oht/theming/global/0/icon-core-#00679efiletypes_text.svg	c4e627cb9b507b7a003895add3e51e79	107	icon-core-#00679efiletypes_text.svg	34	14	299	1748677370	1748677370	0	0	daac60a3b23baa723f1d97776b8a9769	27	
376	2	appdata_oc9xft3m2oht/preview/f/7/1	55e28b00049a28eb3d39d68590e2ef56	374	1	2	1	-1	1748738881	1748738881	0	0	683ba341cb3de	31	
176	2	appdata_oc9xft3m2oht/preview/f/4/5/7/c/5/4/49/1920-1281-max.jpg	de56f0d983c0a6d6518fec54409ceb2b	172	1920-1281-max.jpg	17	14	294390	1748677370	1748677370	0	0	2bf11539dda826fc4e19661bbac85cf2	27	
179	2	appdata_oc9xft3m2oht/preview/f/4/5/7/c/5/4/49/256-256-crop.jpg	d9d5e50845eaaf309a5759dcbb68e734	172	256-256-crop.jpg	17	14	15761	1748677371	1748677371	0	0	1661964a55497f6e13b7a5f51195852a	27	
316	2	appdata_oc9xft3m2oht/richdocuments/templates	3f22fa3ea86fc41e5bdc0491db757e1a	67	templates	2	1	0	1748680507	1748680507	0	0	683abf3b3c1ba	31	
378	2	appdata_oc9xft3m2oht/preview/f/7/1/7	8bab1b21cd582f7143e898e47b5f5bc3	376	7	2	1	-1	1748738881	1748738881	0	0	683ba341ca640	31	
327	2	appdata_oc9xft3m2oht/preview/a/6/6	cb5aec671bad15f9408dad78a5477135	112	6	2	1	-1	1748680792	1748680792	0	0	683ac0586c0dc	31	
328	2	appdata_oc9xft3m2oht/preview/a/6/6/6	97df15640c00e145500210d43a99b2ff	327	6	2	1	-1	1748680792	1748680792	0	0	683ac0586ab7c	31	
329	2	appdata_oc9xft3m2oht/preview/a/6/6/6/5	2e6a446f3a1c830b48b7a17be32cf3b2	328	5	2	1	-1	1748680792	1748680792	0	0	683ac05869652	31	
330	2	appdata_oc9xft3m2oht/preview/a/6/6/6/5/8	2d1f7258db4ad2ff33bae847bda51ddd	329	8	2	1	-1	1748680792	1748680792	0	0	683ac05867e26	31	
331	2	appdata_oc9xft3m2oht/preview/a/6/6/6/5/8/7	b47354d87a9124af3b580a5c56c22e49	330	7	2	1	-1	1748680792	1748680792	0	0	683ac058648b4	31	
380	2	appdata_oc9xft3m2oht/preview/f/7/1/7/7	0016947457d3fe1e1e20fd2d57b5b122	378	7	2	1	-1	1748738881	1748738881	0	0	683ba341c9583	31	
381	2	appdata_oc9xft3m2oht/preview/f/7/1/7/7/1	aded3ee6eeea19006f2f26fe958a6c46	380	1	2	1	-1	1748738881	1748738881	0	0	683ba341c86fd	31	
383	2	appdata_oc9xft3m2oht/preview/f/7/1/7/7/1/6	3baddf69868b84b53b25bc351557dff3	381	6	2	1	-1	1748738881	1748738881	0	0	683ba341c7959	31	
317	2	appdata_oc9xft3m2oht/richdocuments/empty_templates	4a583e56e7440d38239505f613b346cf	67	empty_templates	2	1	0	1748925599	1748925599	0	0	683abf3b40b5f	31	
386	2	appdata_oc9xft3m2oht/preview/f/7/1/7/7/1/6/44/4096-4096-max.png	1604e057e05d08d80c77b158f275cb87	384	4096-4096-max.png	15	14	192888	1748738882	1748738882	0	0	31219c05e507d15259944e21bac7460a	27	
388	2	appdata_oc9xft3m2oht/preview/f/7/1/7/7/1/6/44/64-64-crop.png	e54e0c1e947aa8f0bbb069f3a9277f1f	384	64-64-crop.png	15	14	3668	1748738883	1748738883	0	0	7a3976f2a532cc779652ee8b4c021d35	27	
332	2	appdata_oc9xft3m2oht/preview/a/6/6/6/5/8/7/326	49ba6d11d3f6e9490c0ff7d85dc1ebbc	331	326	2	1	0	1749010212	1749010212	0	0	683ac0585eaa5	31	
347	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9/5/339	904c5f2cfcdf515fac4310a6613badda	346	339	2	1	0	1749010212	1749010212	0	0	683ac074036be	31	
107	2	appdata_oc9xft3m2oht/theming/global/0	c7f498291ff0941dad1360184e17ae83	106	0	2	1	0	1749114799	1749114799	0	0	683ab2f93d545	31	
172	2	appdata_oc9xft3m2oht/preview/f/4/5/7/c/5/4/49	5afc7d86914ee3c193da1ae21478c8f8	171	49	2	1	0	1749174229	1749174229	0	0	683ab2fa7064a	31	
333	2	appdata_oc9xft3m2oht/preview/a/6/6/6/5/8/7/326/3065-4096-max.jpg	7bf199d2741460785a671da2cf54e874	332	3065-4096-max.jpg	17	14	509027	1748680811	1748680811	0	0	b11065e9424ae056676f590986c25056	27	
334	2	appdata_oc9xft3m2oht/preview/a/6/6/6/5/8/7/326/766-1024.jpg	962f73423b6e848437ec421479d8863c	332	766-1024.jpg	17	14	58538	1748680812	1748680812	0	0	b11a75c2f61ab09ebf4ebf783d14e5e7	27	
340	2	appdata_oc9xft3m2oht/preview/0	343dc2c775544400b937b118f67ccc8d	105	0	2	1	-1	1748680820	1748680820	0	0	683ac07412541	31	
341	2	appdata_oc9xft3m2oht/preview/0/4	5a83be106a1a0d08e402286739be9889	340	4	2	1	-1	1748680820	1748680820	0	0	683ac074111d2	31	
342	2	appdata_oc9xft3m2oht/preview/0/4/0	c8c067da77bfaecfb76032744dd0d07e	341	0	2	1	-1	1748680820	1748680820	0	0	683ac0740ffe1	31	
343	2	appdata_oc9xft3m2oht/preview/0/4/0/2	d57d86cbf7e07618c9481a4063fdb217	342	2	2	1	-1	1748680820	1748680820	0	0	683ac0740ec8a	31	
344	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5	46ca8cf28d02588ee687a2fa83599472	343	5	2	1	-1	1748680820	1748680820	0	0	683ac0740dab5	31	
345	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9	91888c206c85764a663d636d992afccf	344	9	2	1	-1	1748680820	1748680820	0	0	683ac0740c447	31	
346	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9/5	35534019641822ec4f0fe08dee0890f0	345	5	2	1	-1	1748680820	1748680820	0	0	683ac07409676	31	
354	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9/5/339/192-256.jpg	8ee99bdb34c5cc109073ec9dbbd4c48c	347	192-256.jpg	17	14	10226	1748681603	1748681603	0	0	f3110b5376705ef822e5799d31b6757b	27	
318	2	appdata_oc9xft3m2oht/core	45f37d2eba239d53749a62529429744d	59	core	2	1	0	1748680511	1748680511	0	0	683abf3fc2460	31	
177	2	appdata_oc9xft3m2oht/avatar/x79/avatar-dark.512.png	12251ee86bd9d1faad9cc2f36f843bb0	103	avatar-dark.512.png	15	14	9535	1748677371	1748677371	0	0	a1b81d908d38af6cf4e67daf2ebef50c	27	
593	2	appdata_oc9xft3m2oht/preview/6/3/6/4/d/3/f/32	d9a4aa65a98ad6628528fc35b93fcdae	591	32	2	1	0	1749174251	1749174251	0	0	684247ebd4d9d	31	
175	2	appdata_oc9xft3m2oht/avatar/x79/generated	d2baa0931d413d8cd20d2e7ec9a0b0ec	103	generated	19	3	0	1748678552	1748678552	0	0	eb18a51a238936f83232833fd3fefe52	27	
604	2	appdata_oc9xft3m2oht/preview/a/5/b/f/c/9	985c2879a480596515be1d7ad1bbc168	602	9	2	1	-1	1749174252	1749174252	0	0	684247ec483bd	31	
320	2	appdata_oc9xft3m2oht/core/opengraph/b84a0b2e1b7dd7d5a40079a3243809b9	74677f1ceb01532607047f0cb7248b14	319	b84a0b2e1b7dd7d5a40079a3243809b9	19	3	63121	1748680512	1748680512	0	0	977d4fc2078090448bad3d18a61fdd65	27	
606	2	appdata_oc9xft3m2oht/preview/a/5/b/f/c/9/e	cc936cc7a14e4f306966118f4b9d2f6a	604	e	2	1	-1	1749174252	1749174252	0	0	684247ec472d7	31	
444	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683ba28d-92a/a65457f45bd7facd2a91f6927e8dce6c.YXVkaW8vd2VibQ==.webm	e1af87e019812d13b2712ccd9cd16426	441	a65457f45bd7facd2a91f6927e8dce6c.YXVkaW8vd2VibQ==.webm	67	12	821961	1748739424	1748739424	0	0	1e9b2b37747171a9e0bbec5a8fb1e6ed	27	
452	2	appdata_oc9xft3m2oht/theming/global/0/icon-core-#00679efiletypes_x-office-document.svg	6f3ac28d4ba3fa336ae468e1acc2ab47	107	icon-core-#00679efiletypes_x-office-document.svg	34	14	304	1748925538	1748925538	0	0	490b57e5d38d6d16652ed029b3d43013	27	
420	2	appdata_oc9xft3m2oht/preview/b/7/b/1/6/e/c	4f57d3a1215c412aba8ecfaff36a19de	416	c	2	1	-1	1748929201	1748929201	0	0	683ba3eeaa1c3	31	
608	2	appdata_oc9xft3m2oht/preview/a/5/b/f/c/9/e/37	6a92daa960aa5e588e40a79e27b2520d	606	37	2	1	0	1749174252	1749174252	0	0	684247ec45f9a	31	
408	2	appdata_oc9xft3m2oht/preview/b/7	e76cae4951a67eab1cfb6806f2df1a17	108	7	2	1	-1	1748739054	1748739054	0	0	683ba3eeb0f2b	31	
409	2	appdata_oc9xft3m2oht/preview/b/7/b	cf5235daf0b155777079570aa7982e7c	408	b	2	1	-1	1748739054	1748739054	0	0	683ba3eeafb14	31	
410	2	appdata_oc9xft3m2oht/preview/b/7/b/1	94ba776126474f4246a6d8eb072cdb30	409	1	2	1	-1	1748739054	1748739054	0	0	683ba3eeae918	31	
413	2	appdata_oc9xft3m2oht/preview/b/7/b/1/6	393a8963ae8fea5ab3d3d22129ca9059	410	6	2	1	-1	1748739054	1748739054	0	0	683ba3eead0c7	31	
416	2	appdata_oc9xft3m2oht/preview/b/7/b/1/6/e	c99125bdcc235355b13d45988fcb43e5	413	e	2	1	-1	1748739054	1748739054	0	0	683ba3eeaba9b	31	
611	2	appdata_oc9xft3m2oht/preview/a/5/b/f/c/9/e/37/328-441-max.png	3c9167ae1696b49607e68e884aeac80f	608	328-441-max.png	15	14	21466	1749174252	1749174252	0	0	c048774b38685c58830767b04689ce84	27	
348	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9/5/339/3000-4000-max.jpg	7a85ac7227d8d57390ea67458ca4da87	347	3000-4000-max.jpg	17	14	1120228	1748680821	1748680821	0	0	4007664dda401421eaff4d1df9bff61a	27	
349	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9/5/339/768-1024.jpg	0b91913b45611f28934dbbaf36aeedc4	347	768-1024.jpg	17	14	96936	1748680823	1748680823	0	0	242e8fb5e91afbf0ccd4993c711c5f3b	27	
355	2	appdata_oc9xft3m2oht/preview/1	d61c93ebdf4715a15295b4f87132ee5b	105	1	2	1	-1	1748681982	1748681982	0	0	683ac4feeb792	31	
356	2	appdata_oc9xft3m2oht/preview/1/7	a93a644df18316a92439d4355797253c	355	7	2	1	-1	1748681982	1748681982	0	0	683ac4feea8a7	31	
357	2	appdata_oc9xft3m2oht/preview/1/7/e	2d7378a411cb433dee946b0c68e0050e	356	e	2	1	-1	1748681982	1748681982	0	0	683ac4fee990c	31	
358	2	appdata_oc9xft3m2oht/preview/1/7/e/6	637396adec16c40d10de1514c1ae06b6	357	6	2	1	-1	1748681982	1748681982	0	0	683ac4fee7f9d	31	
359	2	appdata_oc9xft3m2oht/preview/1/7/e/6/2	ad794d7cd667bfd056804a4fcb801b5f	358	2	2	1	-1	1748681982	1748681982	0	0	683ac4fee697a	31	
360	2	appdata_oc9xft3m2oht/preview/1/7/e/6/2/1	23af48f973ebf2774e7d4c7097b0e93c	359	1	2	1	-1	1748681982	1748681982	0	0	683ac4fee5477	31	
361	2	appdata_oc9xft3m2oht/preview/1/7/e/6/2/1/6	5bbe2f02ebeac35bbaaa2f2b6ed5bf64	360	6	2	1	-1	1748925743	1748925743	0	0	683ac4fee418f	31	
485	2	appdata_oc9xft3m2oht/preview/2/0/5/0/e/0/3/473	2f0386906ec752c8b9a0e606ab1791a5	482	473	2	1	0	1748925743	1748925743	0	0	683e7d2f6386e	31	
492	2	appdata_oc9xft3m2oht/preview/f/c/c/b/6/0	63d75c098177b0862b6f8959f5c8eee7	489	0	2	1	-1	1748925743	1748925743	0	0	683e7d2f71760	31	
613	2	appdata_oc9xft3m2oht/preview/a/5/b/f/c/9/e/37/64-64-crop.png	bc1edf89a37f58951b8b676eb4c50f85	608	64-64-crop.png	15	14	4737	1749174252	1749174252	0	0	a82070b39cc7df3db1f25306295f09a7	27	
384	2	appdata_oc9xft3m2oht/preview/f/7/1/7/7/1/6/44	74605194f8c027956b01762399fa2e20	383	44	2	1	0	1749570252	1749570252	0	0	683ba341c6a0d	31	
495	2	appdata_oc9xft3m2oht/preview/f/c/c/b/6/0/f	7ef73afb5bc80c3dbd1eac0026449581	492	f	2	1	-1	1748929201	1748929201	0	0	683e7d2f6ff8f	31	
319	2	appdata_oc9xft3m2oht/core/opengraph	c913593d64fee1fe162d9ced8fbe34b2	318	opengraph	2	1	0	1748954441	1748954441	0	0	683abf3fc9128	31	
103	2	appdata_oc9xft3m2oht/avatar/x79	c6b892acc426b94327a320ec95a50443	102	x79	2	1	0	1749116853	1749116853	0	0	683ab2f8ccb4b	31	
178	2	appdata_oc9xft3m2oht/preview/d/8/2/c/8/d/1/53/3000-2000-max.jpg	4cb67ffac70601ee20d0f85941d612dc	162	3000-2000-max.jpg	17	14	808212	1748677371	1748677371	0	0	a668612ba063504987c8149c261306a6	27	
594	2	appdata_oc9xft3m2oht/preview/1/8/2/b/e	d66a14ab196df72d94bd0361b99589a7	592	e	2	1	-1	1749174251	1749174251	0	0	684247ebdc195	31	
181	2	appdata_oc9xft3m2oht/preview/d/8/2/c/8/d/1/53/256-256-crop.jpg	7d8cba26bb64d04515f73b22f4c3a662	162	256-256-crop.jpg	17	14	21315	1748677371	1748677371	0	0	4517889d817478b661cc151c46a888e8	27	
182	2	appdata_oc9xft3m2oht/theming/global/0/favIcon-dashboard#00679e	6693e997cd6e87d298b8fd7c16d537e6	107	favIcon-dashboard#00679e	19	3	90022	1748677371	1748677371	0	0	a36e22e4b4363de10387ced711845af2	27	
201	2	appdata_oc9xft3m2oht/preview/3/4/1	e97f68fb6c3de7f17f3b33a26a02a61c	200	1	2	1	-1	1748677524	1748677524	0	0	683ab3941e008	31	
202	2	appdata_oc9xft3m2oht/preview/3/4/1/6	39d6332cd8418918631aa1b5b1d4a83a	201	6	2	1	-1	1748677524	1748677524	0	0	683ab3941cde4	31	
203	2	appdata_oc9xft3m2oht/preview/3/4/1/6/a	2f80411f39b0069f456784616fb5fb29	202	a	2	1	-1	1748677524	1748677524	0	0	683ab3941bc12	31	
204	2	appdata_oc9xft3m2oht/preview/3/4/1/6/a/7	adda53fdd8b8856d7e2999c8594c8710	203	7	2	1	-1	1748677524	1748677524	0	0	683ab3941a4d9	31	
205	2	appdata_oc9xft3m2oht/preview/3/4/1/6/a/7/5	e7f800fed56ebe67d65b2b82af296039	204	5	2	1	-1	1748677524	1748677524	0	0	683ab394173d3	31	
489	2	appdata_oc9xft3m2oht/preview/f/c/c/b/6	8afc781fd90016d76f93d9b9315717cf	488	6	2	1	-1	1748925743	1748925743	0	0	683e7d2f72bf9	31	
207	2	appdata_oc9xft3m2oht/preview/3/4/1/6/a/7/5/41/500-500-max.png	8b789452a21a31aed8f30d159c140e55	206	500-500-max.png	15	14	50545	1748677524	1748677524	0	0	87d02209359cbb6359cf435013140798	27	
208	2	appdata_oc9xft3m2oht/preview/c	9acec39ba1785e98fc0d87dccd4b9120	105	c	2	1	-1	1748677524	1748677524	0	0	683ab394ee3ba	31	
209	2	appdata_oc9xft3m2oht/preview/c/0	12c7aea5a2f57555e4e2c61671c1e0b4	208	0	2	1	-1	1748677524	1748677524	0	0	683ab394ed1ac	31	
210	2	appdata_oc9xft3m2oht/preview/c/0/c	f8a44ee447f7bf5f00b68c2de4a06d41	209	c	2	1	-1	1748677524	1748677524	0	0	683ab394ec066	31	
211	2	appdata_oc9xft3m2oht/preview/c/0/c/7	87f9dff7e2fa9642f894de5c706f0df6	210	7	2	1	-1	1748677524	1748677524	0	0	683ab394eaca5	31	
212	2	appdata_oc9xft3m2oht/preview/c/0/c/7/c	ad84440df6d05672658c324afb43f12c	211	c	2	1	-1	1748677524	1748677524	0	0	683ab394e9b8e	31	
213	2	appdata_oc9xft3m2oht/preview/c/0/c/7/c/7	e1c5c9fdaa0421f610bb55310ec21185	212	7	2	1	-1	1748677524	1748677524	0	0	683ab394e87b8	31	
214	2	appdata_oc9xft3m2oht/preview/c/0/c/7/c/7/6	43233b21d403794f01e1eef9dd5818ce	213	6	2	1	-1	1748677524	1748677524	0	0	683ab394e762c	31	
162	2	appdata_oc9xft3m2oht/preview/d/8/2/c/8/d/1/53	faebb4d42c20758f4883aca42f7b6231	161	53	2	1	0	1749174230	1749174230	0	0	683ab2fa28b5e	31	
896	2	appdata_oc9xft3m2oht/preview/d/5/6/b	2c34e17460a01abbf73bfa5fb8372568	895	b	2	1	-1	1749747759	1749747759	0	0	684b082fef576	31	
216	2	appdata_oc9xft3m2oht/preview/c/0/c/7/c/7/6/50/1600-1067-max.jpg	112e58b3f033ba67a4d2bfc7acec686a	215	1600-1067-max.jpg	17	14	137923	1748677525	1748677525	0	0	11d7c5245006af15f3074cae9f32d655	27	
217	2	appdata_oc9xft3m2oht/preview/2	fca883e55900925eab522dd777b08d2a	105	2	2	1	-1	1748677525	1748677525	0	0	683ab39578cd4	31	
218	2	appdata_oc9xft3m2oht/preview/2/8	cf566f47a09e6f7f565b7da7a0e643ef	217	8	2	1	-1	1748677525	1748677525	0	0	683ab395779ae	31	
219	2	appdata_oc9xft3m2oht/preview/2/8/3	a3f5591f7622bd52203bc23e766a803a	218	3	2	1	-1	1748677525	1748677525	0	0	683ab39576799	31	
220	2	appdata_oc9xft3m2oht/preview/2/8/3/8	b1cb71ff85e545c18a36fd5745e6fe6f	219	8	2	1	-1	1748677525	1748677525	0	0	683ab395752e3	31	
221	2	appdata_oc9xft3m2oht/preview/2/8/3/8/0	1d494d0f1f0cb22520b6087e5811a971	220	0	2	1	-1	1748677525	1748677525	0	0	683ab39574458	31	
222	2	appdata_oc9xft3m2oht/preview/2/8/3/8/0/2	045b4d8dc51bbda2ac9f6b3e464f6363	221	2	2	1	-1	1748677525	1748677525	0	0	683ab3957316e	31	
223	2	appdata_oc9xft3m2oht/preview/2/8/3/8/0/2/3	23ee1deec991d0f3a732906be09bd298	222	3	2	1	-1	1748677525	1748677525	0	0	683ab3957218d	31	
225	2	appdata_oc9xft3m2oht/preview/2/8/3/8/0/2/3/51/1200-1800-max.jpg	a296c6a27842076bbda0b003cf8f7793	224	1200-1800-max.jpg	17	14	207095	1748677525	1748677525	0	0	765ae5a4a4429e87ba35bbb55045d029	27	
226	2	appdata_oc9xft3m2oht/theming/global/0/favIcon-settings#00679e	1aa150ae774a02b97454d1908ffd31e4	107	favIcon-settings#00679e	19	3	90022	1748677529	1748677529	0	0	3539903f19aeef46e3b9ca374ac28498	27	
200	2	appdata_oc9xft3m2oht/preview/3/4	4cde1a9b290c05644f2da9fd362b9517	199	4	2	1	-1	1748677524	1748677524	0	0	683abc6d52d7a	31	
199	2	appdata_oc9xft3m2oht/preview/3	4e1277e3dc0a904ecc97cd1fe1dd0d82	105	3	2	1	-1	1748677524	1748677524	0	0	683abc6d55054	31	
266	2	appdata_oc9xft3m2oht/preview/a/5/7/7/1/b/c/38/4096-4096-max.png	26f8ab10abfa747044e8451d96a250c8	254	4096-4096-max.png	15	14	185668	1748677957	1748677957	0	0	69865a73f1c911bb673f10c0a457b0a9	27	
270	2	appdata_oc9xft3m2oht/preview/a/5/7/7/1/b/c/38/64-64-crop.png	e023911841c4802d403e93eaf0603323	254	64-64-crop.png	15	14	3102	1748677958	1748677958	0	0	3b6123cac11852b4fc6257e88b0e31e5	27	
206	2	appdata_oc9xft3m2oht/preview/3/4/1/6/a/7/5/41	5b4630eec6038d548cfdcf3bbc0d28f1	205	41	2	1	0	1748678581	1748678581	0	0	683ab39415226	31	
228	2	appdata_oc9xft3m2oht/identityproof/app-core-ocm_external	35b3f74f54bd61b2b312dee5b3802822	227	app-core-ocm_external	2	1	0	1748677534	1748677534	0	0	683ab39e60158	31	
229	2	appdata_oc9xft3m2oht/identityproof/app-core-ocm_external/private	717ef10a44a0384537c465434baad527	228	private	19	3	3588	1748677534	1748677534	0	0	19ba795c95ce86c3da14ec3274016bd1	27	
230	2	appdata_oc9xft3m2oht/identityproof/app-core-ocm_external/public	89285f73e67c420f2cdad3e263db715b	228	public	19	3	451	1748677534	1748677534	0	0	5c9a76368cf637fc6cf227af634677af	27	
232	2	appdata_oc9xft3m2oht/theming/global/0/favIcon-core#00679e	c2796c9d9293d3c263fd8ad16d129b59	107	favIcon-core#00679e	19	3	90022	1748677892	1748677892	0	0	c2779045194b5b0486c89ce23c3166a3	27	
233	2	appdata_oc9xft3m2oht/theming/global/0/touchIcon-core#00679e	64dd460c95ef8f1c2067f5e983073d79	107	touchIcon-core#00679e	19	3	22560	1748677934	1748677934	0	0	778ee9059c5c550e571e95495c4a7901	27	
234	2	appdata_oc9xft3m2oht/preview/2/8/3/8/0/2/3/51/256-256-crop.jpg	16dbcabd6c38f3770762031600ce20a1	224	256-256-crop.jpg	17	14	8544	1748677950	1748677950	0	0	d631cd665a922bb365e68d3458a2fd12	27	
236	2	appdata_oc9xft3m2oht/preview/d/6/4	75599605e2b0be5182af0086c2036cf6	235	4	2	1	-1	1748677956	1748677956	0	0	683ab544ac749	31	
238	2	appdata_oc9xft3m2oht/preview/a/5	661e53d7a3a52a5add10f9a85c16106e	109	5	2	1	-1	1748677956	1748677956	0	0	683ab544b2515	31	
239	2	appdata_oc9xft3m2oht/preview/d/6/4/5	7cf04580e135015b6544ceb5a08311ac	236	5	2	1	-1	1748677956	1748677956	0	0	683ab544aaea9	31	
240	2	appdata_oc9xft3m2oht/preview/a/5/7	36b1434d2b3d39c73a2d688e70797993	238	7	2	1	-1	1748677956	1748677956	0	0	683ab544b0896	31	
241	2	appdata_oc9xft3m2oht/preview/d/6/4/5/9	31302ce0be16c458def2a5650c17f9ab	239	9	2	1	-1	1748677956	1748677956	0	0	683ab544a9cc5	31	
242	2	appdata_oc9xft3m2oht/preview/a/5/7/7	0e8224c75816320456f324f38e6c69c2	240	7	2	1	-1	1748677956	1748677956	0	0	683ab544aef00	31	
243	2	appdata_oc9xft3m2oht/preview/d/6/4/5/9/2	18b4b8915fe9647d936f64e28415d911	241	2	2	1	-1	1748677956	1748677956	0	0	683ab544a6efa	31	
235	2	appdata_oc9xft3m2oht/preview/d/6	1f3070caa792efc331e23d4836f9e2b3	155	6	2	1	-1	1748677956	1748677956	0	0	683ab544b030d	31	
244	2	appdata_oc9xft3m2oht/preview/a/5/7/7/1	e02bb3a10bad17cad93942363719603b	242	1	2	1	-1	1748677956	1748677956	0	0	683ab544ad225	31	
245	2	appdata_oc9xft3m2oht/preview/d/6/4/5/9/2/0	a6c17b03c30b68e05699ee2620a0644e	243	0	2	1	-1	1748677956	1748677956	0	0	683ab544a2a98	31	
246	2	appdata_oc9xft3m2oht/preview/6	ccb84d9e3932579f3f540eeb888e07d6	105	6	2	1	-1	1748677956	1748677956	0	0	683ab544bb860	31	
247	2	appdata_oc9xft3m2oht/preview/d/6/7	236c6d0ed37a602ae2b49ab1b70f49ae	235	7	2	1	-1	1748677956	1748677956	0	0	683ab544ad6db	31	
248	2	appdata_oc9xft3m2oht/preview/a/5/7/7/1/b	e9c3f5a29b5de2d5eb409efd7af6cd54	244	b	2	1	-1	1748677956	1748677956	0	0	683ab544abaea	31	
250	2	appdata_oc9xft3m2oht/preview/d/6/7/d	6362c742af1000ae9dd6a1e6b1c46612	247	d	2	1	-1	1748677956	1748677956	0	0	683ab544ab029	31	
251	2	appdata_oc9xft3m2oht/preview/a/5/7/7/1/b/c	424db4a53845d986f951c1691fa577ba	248	c	2	1	-1	1748677956	1748677956	0	0	683ab544aa398	31	
252	2	appdata_oc9xft3m2oht/preview/3/4/1/6/a/7/5/41/64-64-crop.png	6b600d1000cbdfa52197f8920e913fad	206	64-64-crop.png	15	14	3895	1748677956	1748677956	0	0	5f92c1d38b485fd188a687789c17e180	27	
253	2	appdata_oc9xft3m2oht/preview/6/7	96837f3e3d978d53c39f6a20f1f02e75	246	7	2	1	-1	1748677956	1748677956	0	0	683ab544ba39f	31	
255	2	appdata_oc9xft3m2oht/preview/d/6/7/d/8	cc1758c13f834e89884d7e26d924f8b4	250	8	2	1	-1	1748677956	1748677956	0	0	683ab544a9f2f	31	
256	2	appdata_oc9xft3m2oht/preview/6/7/c	702913388a9d90ece7bbbc9c73348475	253	c	2	1	-1	1748677956	1748677956	0	0	683ab544b95fc	31	
257	2	appdata_oc9xft3m2oht/preview/d/6/7/d/8/a	34f65c1567236b095f841a849d881608	255	a	2	1	-1	1748677956	1748677956	0	0	683ab544a680e	31	
258	2	appdata_oc9xft3m2oht/preview/6/7/c/6	04b9772a0434087a5b1eb2081787fd6f	256	6	2	1	-1	1748677956	1748677956	0	0	683ab544b7f5d	31	
259	2	appdata_oc9xft3m2oht/preview/d/6/7/d/8/a/b	04089353975b6aa781333d7e67e9d69e	257	b	2	1	-1	1748677956	1748677956	0	0	683ab544a57f3	31	
260	2	appdata_oc9xft3m2oht/preview/6/7/c/6/a	f48056ab957f84c0d5f12574057320ec	258	a	2	1	-1	1748677956	1748677956	0	0	683ab544b5f96	31	
261	2	appdata_oc9xft3m2oht/preview/d/6/7/d/8/a/b/39	7b2f938220b2c89ccd72e4b60a1cbd14	259	39	2	1	0	1748677956	1748677956	0	0	683ab544a0059	31	
262	2	appdata_oc9xft3m2oht/preview/6/7/c/6/a/1	78f40df8e3ba1d29b20ccd1614e9c33b	260	1	2	1	-1	1748677956	1748677956	0	0	683ab544b4b1a	31	
263	2	appdata_oc9xft3m2oht/preview/6/7/c/6/a/1/e	9aae45f17625cd2b16ee0bd2f8ad56c1	262	e	2	1	-1	1748677956	1748677956	0	0	683ab544b2ec8	31	
264	2	appdata_oc9xft3m2oht/preview/6/7/c/6/a/1/e/47	19bc7d43ff168f93d25ce2e02b222cef	263	47	2	1	0	1748677956	1748677956	0	0	683ab544b0716	31	
254	2	appdata_oc9xft3m2oht/preview/a/5/7/7/1/b/c/38	3d92260b94954d398b642bdd3dde7188	251	38	2	1	0	1748678583	1748678583	0	0	683ab544a91b9	31	
595	2	appdata_oc9xft3m2oht/preview/1/8/2/b/e/0	8e451e45aaf1ecc17485eeb1c09eae91	594	0	2	1	-1	1749174251	1749174251	0	0	684247ebdb556	31	
268	2	appdata_oc9xft3m2oht/text/documents	d3a46952f6ab96eb6cf6a53b1e0e78e7	267	documents	2	1	0	1748677957	1748677957	0	0	683ab545907ad	31	
67	2	appdata_oc9xft3m2oht/richdocuments	f240bb65394a494bb4fc60302604dc7d	59	richdocuments	2	1	5285180	1748925916	1748925916	0	0	683ab2e819fb3	31	
430	2	appdata_oc9xft3m2oht/preview/f/8/c/1/f/2/3	961018a900cab4d1aa7e881ab0b97fca	427	3	2	1	-1	1748739601	1748739601	0	0	683ba3eeb021a	31	
454	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683e7a49-92a/a65457f45bd7facd2a91f6927e8dce6c.YXVkaW8vd2VibQ==.webm	7d8b3274c7e85a4582306ba9aec478c2	453	a65457f45bd7facd2a91f6927e8dce6c.YXVkaW8vd2VibQ==.webm	67	12	821961	1748925551	1748925551	0	0	1be8474b31fc252213ec9639d939588a	27	
453	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683e7a49-92a	2aa51f83a851af5dac8e114a0c0fb582	275	683e7a49-92a	2	1	0	1748925551	1748925551	0	0	683e7c6db3695	31	
473	1	files_versions/Documents/Nextcloud flyer.pdf.v1748739718	6e0a209bb4e1368d7ca685e25c04afaf	390	Nextcloud flyer.pdf.v1748739718	4	3	1101951	1748739718	1748925730	0	0	780e28b3d2cd0c7e6728a93132feb974	27	\N
350	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9/5/339/1024-1365.jpg	64eb01ee1b033b438beb555d0de30ed9	347	1024-1365.jpg	17	14	155731	1748680835	1748680835	0	0	8ddda1e802d4d3f3cbe1f80a4e9ff10d	27	
42	1	files/Documents	0ad78ba05b6961d92f7970b2b3922eca	2	Documents	2	1	1130447	1748925730	1748677284	0	0	683e7d22c2960	31	
493	2	appdata_oc9xft3m2oht/preview/6/7/f/7	487795e1e012cfae4da214f82c8874cf	491	7	2	1	-1	1748925743	1748925743	0	0	683e7d2f78ce5	31	
439	2	appdata_oc9xft3m2oht/theming/global/0/favIcon-mail#00679e	f4bd56352876e7861aa3a477b77f9a6e	107	favIcon-mail#00679e	19	3	90022	1748739409	1748739409	0	0	7c01bdb18728674f61c3953ce67ca11f	27	
496	2	appdata_oc9xft3m2oht/preview/6/7/f/7/f	df16f095e37866c2b5617be9408e85b0	493	f	2	1	-1	1748925743	1748925743	0	0	683e7d2f774ed	31	
498	2	appdata_oc9xft3m2oht/preview/6/7/f/7/f/b	f8627c91717bf596f0c5ad36df9347c9	496	b	2	1	-1	1748925743	1748925743	0	0	683e7d2f76118	31	
101	2	appdata_oc9xft3m2oht/richdocuments/remoteData	1405701252d0df95e250cb5ab79f467b	67	remoteData	2	1	0	1748925901	1748925901	0	0	683ab2f6b37bf	31	
411	2	appdata_oc9xft3m2oht/preview/f/8	0994edaef434778ea2c3f1e67e4cd87c	165	8	2	1	-1	1748739054	1748739054	0	0	683ba3eeb4b9e	31	
390	1	files_versions/Documents	31726c44088c2bcb7763e1f483a37c67	389	Documents	2	1	1101951	1748925901	1748925901	0	0	683e7dcdc86c5	31	
389	1	files_versions	9692aae50022f45f1098646939b287b1	1	files_versions	2	1	1101951	1748925901	1748738902	0	0	683e7dcdc86c5	31	
506	2	appdata_oc9xft3m2oht/richdocuments/systemconfig	1db7d330c85fb08b600cd0a811a8a9a6	67	systemconfig	2	1	0	1748925916	1748925916	0	0	683e7ddc7ba16	31	
507	2	appdata_oc9xft3m2oht/richdocuments/userconfig/x79	ab8e0904b677f86bb29e1f153f7f77ef	505	x79	2	1	0	1748925918	1748925918	0	0	683e7dde4c8a7	31	
414	2	appdata_oc9xft3m2oht/preview/f/8/c	47e2d251f868640f9144c5f7d542f045	411	c	2	1	-1	1748739054	1748739054	0	0	683ba3eeb39f7	31	
418	2	appdata_oc9xft3m2oht/preview/f/8/c/1	4250498b3d3f702190adc218d5f5123b	414	1	2	1	-1	1748739054	1748739054	0	0	683ba3eeb2a53	31	
423	2	appdata_oc9xft3m2oht/preview/f/8/c/1/f	7ac2e98b35dea42537a58f1b3f1c8292	418	f	2	1	-1	1748739054	1748739054	0	0	683ba3eeb2069	31	
427	2	appdata_oc9xft3m2oht/preview/f/8/c/1/f/2	c4e38f3a9159cb4c4a60ea7aa7e32ff3	423	2	2	1	-1	1748739054	1748739054	0	0	683ba3eeb0d94	31	
505	2	appdata_oc9xft3m2oht/richdocuments/userconfig	d54493bbbdd1e86c7a08783d2c339921	67	userconfig	2	1	0	1748925918	1748925918	0	0	683e7ddc7576a	31	
490	2	appdata_oc9xft3m2oht/preview/d/6/1/e/4/b/b	14c526cef391efdde466e20a5cd4c2f3	487	b	2	1	-1	1748929201	1748929201	0	0	683e7d2f6ec1b	31	
499	2	appdata_oc9xft3m2oht/preview/6/7/f/7/f/b/8	55dc0dff00226f6b94163fe8c078d435	498	8	2	1	-1	1748929201	1748929201	0	0	683e7d2f74d0e	31	
504	2	appdata_oc9xft3m2oht/richdocuments/remoteData/capabilities	8d6243101316e616599f6369aa96da56	101	capabilities	19	3	406	1748931002	1748931002	0	0	d5cbf37e2cf088e6b75484924cdc832e	27	
503	2	appdata_oc9xft3m2oht/richdocuments/remoteData/discovery	e447408d3a1da62f839dce5114228f48	101	discovery	19	3	40736	1748931003	1748931003	0	0	3057fc9e5c0338e5f962cd4241ea9639	27	
510	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683e92e5-92a/3289725285460e73018ab98c443beb37.aW1hZ2UvcG5n.png	3b8661e233c657c562ae0ba2b786ba89	508	3289725285460e73018ab98c443beb37.aW1hZ2UvcG5n.png	15	14	314506	1748931629	1748931629	0	0	c1757c83278d5e11c885225aa5ac639e	27	
509	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683e92e5-92a/a65457f45bd7facd2a91f6927e8dce6c.YXVkaW8vd2VibQ==.webm	a357c5485fd19a98cc0f2645521ebc34	508	a65457f45bd7facd2a91f6927e8dce6c.YXVkaW8vd2VibQ==.webm	67	12	821961	1748931629	1748931629	0	0	7f74f4894d19b9523d4e76c9a1a685f2	27	
511	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683e92e5-92a/acffabdbe5148794e282887781da1988.aW1hZ2UvcG5n.png	5bcdc8a2a256142870cfa22dcf7176c6	508	acffabdbe5148794e282887781da1988.aW1hZ2UvcG5n.png	15	14	1150887	1748931630	1748931630	0	0	44076923dec571ff0cf6ee50692045ff	27	
59	2	appdata_oc9xft3m2oht	47f1296469666532e52a0cd2f6698534	58	appdata_oc9xft3m2oht	2	1	5285180	1748932455	1748932455	0	0	683ab2b37cd0a	31	
269	2	appdata_oc9xft3m2oht/preview/d/6/4/5/9/2/0/40/64-64-crop.png	682bac57905f4cc612897ed4e1576704	249	64-64-crop.png	15	14	1243	1748677958	1748677958	0	0	1994dc013e75ed4fb267e9941f803d58	27	
596	2	appdata_oc9xft3m2oht/preview/1/8/2/b/e/0/c	7217de852163a8a173a1e375e3a4142d	595	c	2	1	-1	1749174251	1749174251	0	0	684247ebda9c2	31	
474	2	appdata_oc9xft3m2oht/preview/1/7/e/6/2/1/6/43	53a37ae6db80bb12ffc27494d7abc8be	361	43	2	1	0	1748925743	1748925743	0	0	683e7d2f535ea	31	
491	2	appdata_oc9xft3m2oht/preview/6/7/f	37e3e2ec85411ce494a4208b954e256b	253	f	2	1	-1	1748925743	1748925743	0	0	683e7d2f7a271	31	
272	2	appdata_oc9xft3m2oht/appstore/appapi_apps.json	75c63d64de7bfcb85e4b71bafab4cd6c	65	appapi_apps.json	21	3	78108	1748931625	1748931625	0	0	31d0039d759a682c6db3b1fe19b43000	27	
274	2	appdata_oc9xft3m2oht/appstore/categories.json	c48be6cf2301efc0680564b38a68ef22	65	categories.json	21	3	170863	1748931627	1748931627	0	0	9110cea1d412bd6504ffd03b65497930	27	
286	2	appdata_oc9xft3m2oht/identityproof/user-x79/private	b62232fc02d65068d46fc54c89f8b553	285	private	19	3	3588	1748678552	1748678552	0	0	c7bed0eb4484e03060c23f43fbf503c2	27	
287	2	appdata_oc9xft3m2oht/identityproof/user-x79/public	8d2c405c45a80ae0578912c4a4b30be7	285	public	19	3	451	1748678552	1748678552	0	0	835a111eb58b2f09a352d3b3e4c58e6f	27	
273	2	appdata_oc9xft3m2oht/appstore/discover.json	6ecacfc21b808b9b14b785564400027f	65	discover.json	21	3	7272	1748931627	1748931627	0	0	d5a3e0f6082fa031887a4f64522c5742	27	
278	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683ab37d-92a/a65457f45bd7facd2a91f6927e8dce6c.YXVkaW8vd2VibQ==.webm	28952ade11491314082e81d4d9c04d21	276	a65457f45bd7facd2a91f6927e8dce6c.YXVkaW8vd2VibQ==.webm	67	12	821961	1748678018	1748678018	0	0	f2115fce1711b2ca36d458cd4060e563	27	
392	2	appdata_oc9xft3m2oht/theming/global/0/icon-core-#00679efiletypes_application-pdf.svg	1b06248d2c2518f9c801ee4acdd03caf	107	icon-core-#00679efiletypes_application-pdf.svg	34	14	468	1748738922	1748738922	0	0	0f54c86dc631505072afaeed19187c48	27	
279	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683ab37d-92a/3289725285460e73018ab98c443beb37.aW1hZ2UvcG5n.png	0afdbb271e41e6edeead41dea63dbf6d	276	3289725285460e73018ab98c443beb37.aW1hZ2UvcG5n.png	15	14	314506	1748678019	1748678019	0	0	ed33af4b46182c68ddb5ae31887baeca	27	
275	2	appdata_oc9xft3m2oht/appstore/app-discover-cache	afadccc35d83f8d3cabf4747f26600c4	65	app-discover-cache	2	1	0	1748931628	1748931628	0	0	683abaf60090b	31	
280	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683ab37d-92a/acffabdbe5148794e282887781da1988.aW1hZ2UvcG5n.png	ed2a806c9243ec8de6aa17f604b293ed	276	acffabdbe5148794e282887781da1988.aW1hZ2UvcG5n.png	15	14	1150887	1748678020	1748678020	0	0	8b2b4076d8b204a0bf161386a84909bc	27	
276	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683ab37d-92a	1b00cd73f0ed29e289d33dafaf1f05a1	275	683ab37d-92a	2	1	0	1748678020	1748678020	0	0	683ab581f248a	31	
281	2	appdata_oc9xft3m2oht/theming/global/0/icon-core-#00679efiletypes_file.svg	5242509ba7281a457c2fbf8f5b1855cd	107	icon-core-#00679efiletypes_file.svg	34	14	456	1748678485	1748678485	0	0	581ce3096de9d2fb2a57b035379ae65e	27	
282	2	appdata_oc9xft3m2oht/theming/global/0/icon-core-#00679efiletypes_folder.svg	fbeebd3b746a56da945fe76679397562	107	icon-core-#00679efiletypes_folder.svg	34	14	507	1748678486	1748678486	0	0	0c3ec8a1bb0899cd87eb45cfbf57dbfa	27	
283	2	appdata_oc9xft3m2oht/avatar/x79/avatar.png	0b824f32e66a08ffce7527135800bfe6	103	avatar.png	15	14	23051	1748678552	1748678552	0	0	4961a5074ea260f6961d606d564e25c8	27	
284	2	appdata_oc9xft3m2oht/avatar/x79/avatar.512.png	042c7fe3554662a7f9909a216717217a	103	avatar.512.png	15	14	9551	1748678552	1748678552	0	0	cc6044810d78bb6c5f294590af4257cf	27	
285	2	appdata_oc9xft3m2oht/identityproof/user-x79	933af0c4f9165cb95f0b597b14cb4017	227	user-x79	2	1	0	1748678552	1748678552	0	0	683ab7987c6b0	31	
227	2	appdata_oc9xft3m2oht/identityproof	c45e64d01757408708af851418acb6f5	59	identityproof	2	1	0	1748678552	1748678552	0	0	683ab39e5977d	31	
288	2	appdata_oc9xft3m2oht/preview/3/4/1/6/a/7/5/41/256-256.png	5efec1f24f1fd3589bba6f92c7a9e34b	206	256-256.png	15	14	24388	1748678581	1748678581	0	0	a65af8178aade4245fd7dd5bac6265ed	27	
289	2	appdata_oc9xft3m2oht/preview/d/6/4/5/9/2/0/40/256-256.png	87ddb89f5ff8d4128c5ea15dfba9815f	249	256-256.png	15	14	8782	1748678582	1748678582	0	0	5349acbb6a53ae56823238b40638bb50	27	
249	2	appdata_oc9xft3m2oht/preview/d/6/4/5/9/2/0/40	9717b574e34b8630027bcc1fe04559d4	245	40	2	1	0	1748678582	1748678582	0	0	683ab5449fb93	31	
290	2	appdata_oc9xft3m2oht/preview/a/5/7/7/1/b/c/38/256-256.png	9ddb8fa768176184dd8fb16e385c29eb	254	256-256.png	15	14	31444	1748678583	1748678583	0	0	8bdec268bdaec4b319773b67a4a21694	27	
291	2	appdata_oc9xft3m2oht/theming/global/0/touchIcon-dashboard#00679e	ac452e9b8227d93cc21724eb6593215f	107	touchIcon-dashboard#00679e	19	3	9466	1748679327	1748679327	0	0	92553b16ac0a43e7bd656efbd50f4a8a	27	
293	2	appdata_oc9xft3m2oht/theming/global/0/favIcon-notes#00679e	8d5d37f9513adcb660078354fda1cd3b	107	favIcon-notes#00679e	19	3	90022	1748679340	1748679340	0	0	d31a28f420f7a3a5b67ae6f36f72b58f	27	
294	2	appdata_oc9xft3m2oht/theming/global/0/touchIcon-notes#00679e	74b8840fb62cca10b510ebc21779a755	107	touchIcon-notes#00679e	19	3	7717	1748679340	1748679340	0	0	fcef21cdbc371a7c317bae3322310be2	27	
295	1	files/Notes/New note.md	e000d7d36bbe5c7156a44955961559c0	292	New note.md	11	10	0	1748679343	1748679343	0	0	aa620640758d70046ab404de0116385a	27	
296	2	appdata_oc9xft3m2oht/theming/global/0/touchIcon-settings#00679e	9f1308c62c01a05d39c29172bad6ea1a	107	touchIcon-settings#00679e	19	3	6424	1748679415	1748679415	0	0	8a0503cd7909daf007818b8eae6c67fe	27	
297	2	appdata_oc9xft3m2oht/theming/global/0/favIcon-contacts#00679e	16dc272886b0e3fb3c5449a82471b3a6	107	favIcon-contacts#00679e	19	3	90022	1748679769	1748679769	0	0	272eeda50e32a431a116c091c5af1a7c	27	
298	2	appdata_oc9xft3m2oht/theming/global/0/touchIcon-contacts#00679e	f6861cdd5e047a9ac470a94e3ac7b563	107	touchIcon-contacts#00679e	19	3	15619	1748679770	1748679770	0	0	6f98d48c7e12fe5382639feeda7d3b31	27	
299	2	appdata_oc9xft3m2oht/theming/global/0/favIcon-calendar#00679e	dd3b4f2d362973a59eb6596b24569c00	107	favIcon-calendar#00679e	19	3	90022	1748679776	1748679776	0	0	abcb18d8dbf781a8935847f05a716cdb	27	
300	2	appdata_oc9xft3m2oht/theming/global/0/touchIcon-calendar#00679e	2da1ae548f8c0933bf705a3dfded3f36	107	touchIcon-calendar#00679e	19	3	7539	1748679777	1748679777	0	0	68bafaaeb826e8e55e15018b1245bdb5	27	
301	2	appdata_oc9xft3m2oht/theming/global/0/touchIcon-files#00679e	99d63c3c8f8a9fcea865baf4dc03d3bf	107	touchIcon-files#00679e	19	3	7303	1748679790	1748679790	0	0	641b7346bddefb6bb7651cc1361bc415	27	
597	2	appdata_oc9xft3m2oht/preview/1/8/2/b/e/0/c/33	49d3969ae13aee9ed39a2432bd583da3	596	33	2	1	0	1749174251	1749174251	0	0	684247ebd9a45	31	
615	2	appdata_oc9xft3m2oht/preview/6/e	68b94fb6ee37ffa989683a939a100f11	246	e	2	1	-1	1749174257	1749174257	0	0	684247f1ba029	31	
616	2	appdata_oc9xft3m2oht/preview/6/e/a	1c99bd40067097dac91658b65bd15fc8	615	a	2	1	-1	1749174257	1749174257	0	0	684247f1b8dcd	31	
617	2	appdata_oc9xft3m2oht/preview/6/e/a/9	4a84c60821d381f959d1177f31f7be80	616	9	2	1	-1	1749174257	1749174257	0	0	684247f1b785e	31	
455	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683e7a49-92a/3289725285460e73018ab98c443beb37.aW1hZ2UvcG5n.png	19945812f14a8c1971f888d22d229c6e	453	3289725285460e73018ab98c443beb37.aW1hZ2UvcG5n.png	15	14	314506	1748925551	1748925551	0	0	42cbb14f8128482d9635839108867450	27	
618	2	appdata_oc9xft3m2oht/preview/6/e/a/9/a	01a92dd773631f0e4ed31cc064fb28e8	617	a	2	1	-1	1749174257	1749174257	0	0	684247f1b683a	31	
303	1	files_trashbin/files	3014a771cbe30761f2e9ff3272110dbf	302	files	2	1	18168330	1748679802	1748679802	0	0	683abc7a4755f	31	
305	1	files_trashbin/versions	c639d144d3f1014051e14a98beac5705	302	versions	2	1	0	1748679801	1748679801	0	0	683abc798f40e	31	
440	2	appdata_oc9xft3m2oht/theming/global/0/touchIcon-mail#00679e	aff87512ac0fad47bf2ef2afac389308	107	touchIcon-mail#00679e	19	3	12571	1748739410	1748739410	0	0	2a90538de19c93d5e5a2972caf8c8eb7	27	
475	2	appdata_oc9xft3m2oht/preview/2/0	d149252ca1d674dfa6bc2df1405b95c1	217	0	2	1	-1	1748925743	1748925743	0	0	683e7d2f6c88e	31	
302	1	files_trashbin	fb66dca5f27af6f15c1d1d81e6f8d28b	1	files_trashbin	2	1	18168330	1748679802	1748679801	0	0	683abc7a4755f	31	
306	1	files_trashbin/keys	9195c7cfc1b867f229ac78cc1b6a0be3	302	keys	2	1	0	1748679801	1748679801	0	0	683abc7990fea	31	
47	1	files_trashbin/files/Nextcloud Manual.pdf.d1748679801	629ea06a43c3b69364c6a9115e70125c	303	Nextcloud Manual.pdf.d1748679801	4	3	13175471	1748677284	1748677284	0	0	1b1dffecfd081faa90081162a65df4ad	27	
476	2	appdata_oc9xft3m2oht/preview/2/0/5	d950120214c1f053aa656fddf3b2e68d	475	5	2	1	-1	1748925743	1748925743	0	0	683e7d2f6ab90	31	
477	2	appdata_oc9xft3m2oht/preview/2/0/5/0	5cbcb39856c618ab93de2d91b6da2fb9	476	0	2	1	-1	1748925743	1748925743	0	0	683e7d2f6960b	31	
478	2	appdata_oc9xft3m2oht/preview/2/0/5/0/e	029df1358846d7298c82a448b1caca2e	477	e	2	1	-1	1748925743	1748925743	0	0	683e7d2f68766	31	
480	2	appdata_oc9xft3m2oht/preview/2/0/5/0/e/0	16fa5a3a005334a755b931d30dbc7c44	478	0	2	1	-1	1748925743	1748925743	0	0	683e7d2f66c11	31	
3	1	files_trashbin/files/Reasons to use Nextcloud.pdf.d1748679801	2dbe33e37e97c3a24452760f83c9096d	303	Reasons to use Nextcloud.pdf.d1748679801	4	3	976625	1748677276	1748677276	0	0	44287d1c18a08021841474ad024cdd39	27	
412	2	appdata_oc9xft3m2oht/preview/1/5	b79c4dd19700dd0132bd35d22409e0e6	355	5	2	1	-1	1748739054	1748739054	0	0	683ba3eeb5101	31	
482	2	appdata_oc9xft3m2oht/preview/2/0/5/0/e/0/3	625e0f58fa8356ee30a99c6c44cdf3fc	480	3	2	1	-1	1748925743	1748925743	0	0	683e7d2f65b76	31	
794	2	appdata_oc9xft3m2oht/preview/3/6/2/1/f/1/4	48fdd3266ba9df669411a5f1164801b3	793	4	2	1	-1	1749655675	1749655675	0	0	6849a07b63ba4	31	
351	2	appdata_oc9xft3m2oht/preview/a/6/6/6/5/8/7/326/256-256-crop.jpg	0a001b562de50d8447ce9486038d6be5	332	256-256-crop.jpg	17	14	7670	1748681003	1748681003	0	0	30fd28311bed57e9556a10760ac6cd9c	27	
415	2	appdata_oc9xft3m2oht/preview/1/5/4	3c117d48e526632014d5cb1071d8c32c	412	4	2	1	-1	1748739054	1748739054	0	0	683ba3eeb436c	31	
419	2	appdata_oc9xft3m2oht/preview/1/5/4/3	f18b634c06f1f5e229f6fd1135ba67fa	415	3	2	1	-1	1748739054	1748739054	0	0	683ba3eeb3986	31	
422	2	appdata_oc9xft3m2oht/preview/1/5/4/3/8	1a728732b45226abfcc27725d0c2776d	419	8	2	1	-1	1748739054	1748739054	0	0	683ba3eeb2a53	31	
426	2	appdata_oc9xft3m2oht/preview/1/5/4/3/8/4	c9ea63a8243fcc94ce4239fb332c0c8d	422	4	2	1	-1	1748739054	1748739054	0	0	683ba3eeb1eb1	31	
429	2	appdata_oc9xft3m2oht/preview/1/5/4/3/8/4/3	d5628f48d1566a7d09e61e3177fef15e	426	3	2	1	-1	1748929201	1748929201	0	0	683ba3eeb0d35	31	
508	2	appdata_oc9xft3m2oht/appstore/app-discover-cache/683e92e5-92a	373497139af9774022223698674a48d9	275	683e92e5-92a	2	1	0	1748931630	1748931630	0	0	683e942c242a2	31	
598	2	appdata_oc9xft3m2oht/preview/a/5/b	5527260e88aad41aa617917756c41264	238	b	2	1	-1	1749174252	1749174252	0	0	684247ec4bbe7	31	
512	2	appdata_oc9xft3m2oht/wopi	4b6164dc878e7848319b5f5444d50fd4	59	wopi	2	1	0	1748932455	1748932455	0	0	683e9767a14d3	31	
600	2	appdata_oc9xft3m2oht/preview/a/5/b/f	4f812a01a2cd6593e2d4658ddeac7315	598	f	2	1	-1	1749174252	1749174252	0	0	684247ec4aa71	31	
513	2	appdata_oc9xft3m2oht/wopi/wopi	83cf090f069500e55d8da9fdd349cc0a	512	wopi	2	1	0	1748932455	1748932455	0	0	683e9767ae523	31	
514	2	appdata_oc9xft3m2oht/onlyoffice	a2c4304de50ea6d0530836f04da922c6	59	onlyoffice	2	1	-1	1748932466	1748932466	0	0	683e9772af8f4	31	
602	2	appdata_oc9xft3m2oht/preview/a/5/b/f/c	7e100a51d15e4e2e23e9484db1b34efe	600	c	2	1	-1	1749174252	1749174252	0	0	684247ec496da	31	
516	2	appdata_oc9xft3m2oht/preview/9/4	a851898d868f8442b3e0103a224a2dde	133	4	2	1	-1	1748932466	1748932466	0	0	683e9772b3c6a	31	
517	2	appdata_oc9xft3m2oht/preview/9/4/1	1b1227a6cf27c0f43defe0fe7408c6f0	516	1	2	1	-1	1748932466	1748932466	0	0	683e9772b1710	31	
515	2	appdata_oc9xft3m2oht/onlyoffice/template	b9cc73145bb1965f3e61095dfdd14487	514	template	2	1	0	1748932466	1748932466	0	0	683e9772abad6	31	
518	2	appdata_oc9xft3m2oht/preview/9/4/1/e	1c6962b23cc35bde17bdf9e6e1dc52c6	517	e	2	1	-1	1748932466	1748932466	0	0	683e9772b002f	31	
519	2	appdata_oc9xft3m2oht/preview/9/4/1/e/1	2276d29027cb369cb1abfd70dbc99742	518	1	2	1	-1	1748932466	1748932466	0	0	683e9772aea18	31	
520	2	appdata_oc9xft3m2oht/preview/9/4/1/e/1/a	aeafa45bee46f4455c5b0e3069db493b	519	a	2	1	-1	1748932466	1748932466	0	0	683e9772ac9c5	31	
521	2	appdata_oc9xft3m2oht/preview/9/4/1/e/1/a/a	d7d99573db737bde01f5c278a48ed797	520	a	2	1	-1	1748932466	1748932466	0	0	683e9772abfdf	31	
789	2	appdata_oc9xft3m2oht/preview/3/6/2	f5a31b1a60ed85d8bbb8ed1a1f2a9a94	788	2	2	1	-1	1749655675	1749655675	0	0	6849a07b6ae8f	31	
522	2	appdata_oc9xft3m2oht/preview/9/4/1/e/1/a/a/451	b26d54914fcda7c34c73dd13a45a5d1f	521	451	2	1	0	1748932466	1748932466	0	0	683e9772a95ff	31	
523	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9/5/339/64-64-crop.jpg	129aae2ccb8892165053dba12256fc31	347	64-64-crop.jpg	17	14	1634	1748932488	1748932488	0	0	d063ee18e8a709e96a80a79f2e064caf	27	
524	2	appdata_oc9xft3m2oht/preview/a/6/6/6/5/8/7/326/64-64-crop.jpg	2e037888579341e1942eebc91a78a08b	332	64-64-crop.jpg	17	14	1310	1748932488	1748932488	0	0	9522284218284906c53ecab0dbc6596d	27	
525	2	appdata_oc9xft3m2oht/preview/4	21fa9be35c2422238d95d31e21b92d0b	105	4	2	1	-1	1748932560	1748932560	0	0	683e97d0d83b3	31	
526	2	appdata_oc9xft3m2oht/preview/4/9	e302f13d635b4b382c0bf7aebe39ec6e	525	9	2	1	-1	1748932560	1748932560	0	0	683e97d0d79e8	31	
527	2	appdata_oc9xft3m2oht/preview/4/9/1	4574f96014c1cd4fe442ab951de6addf	526	1	2	1	-1	1748932560	1748932560	0	0	683e97d0d6bd3	31	
528	2	appdata_oc9xft3m2oht/preview/4/9/1/8	7acdb61a5fcb0c2402b1a49305b771fd	527	8	2	1	-1	1748932560	1748932560	0	0	683e97d0d61cd	31	
529	2	appdata_oc9xft3m2oht/preview/4/9/1/8/2	c54c35bc7da7e5e38cb1a5f59f45ecde	528	2	2	1	-1	1748932560	1748932560	0	0	683e97d0d538e	31	
530	2	appdata_oc9xft3m2oht/preview/4/9/1/8/2/f	035d6e2102912a6493dc5ee2a8a3de50	529	f	2	1	-1	1748932560	1748932560	0	0	683e97d0d49f3	31	
531	2	appdata_oc9xft3m2oht/preview/4/9/1/8/2/f/8	713b04bbcc85bd17362e1fb3c45929d4	530	8	2	1	-1	1748932560	1748932560	0	0	683e97d0d3bc6	31	
870	1	files/Talk/1749545599_78f56b6e-0002-452a-9198-280ba4f79f11.jpg	dd8c1cfbd410380c331738b64067ce41	307	1749545599_78f56b6e-0002-452a-9198-280ba4f79f11.jpg	17	14	5302195	1749655720	1749655720	0	0	526e1447156203b1871ad25ca7cf2d8e	27	
532	2	appdata_oc9xft3m2oht/preview/4/9/1/8/2/f/8/295	cb89c477d973674a0d0100b530056fae	531	295	2	1	0	1748932560	1748932560	0	0	683e97d0d2494	31	
534	1	files/Talk/Backgrounds	260ed7a677adeb3c8bb7d8e228442f70	307	Backgrounds	2	1	0	1748996737	1748996737	0	0	683f92816ec98	31	
535	2	appdata_oc9xft3m2oht/avatar/x79/avatar.128.png	014c435b469ff7180b50fcf9436acec3	103	avatar.128.png	15	14	2228	1749002717	1749002717	0	0	a51583651dbfea6d531e34ea6711b933	27	
536	2	appdata_oc9xft3m2oht/preview/a/6/6/6/5/8/7/326/256-342.jpg	3db7f7555230e839dfe39e7c5b39b639	332	256-342.jpg	17	14	10030	1749010212	1749010212	0	0	a9371c925cff0e7fa2e20650e3ecd4f7	27	
537	2	appdata_oc9xft3m2oht/preview/0/4/0/2/5/9/5/339/256-341.jpg	5129716f95207ef915a0eec16bb1c3bf	347	256-341.jpg	17	14	16219	1749010212	1749010212	0	0	97f123a3ce431709bc1374545883fd12	27	
538	1	files/Talk/BT Modal verbs.pdf	71c0ab7bea69d5d4c1b82d79c0a34340	307	BT Modal verbs.pdf	4	3	400089	1749050623	1749050623	0	0	d4071331105c04bc5b5281a148e78309	27	
539	2	appdata_oc9xft3m2oht/preview/7/b	f6215145184e86bd18f8af2f77067c0d	111	b	2	1	-1	1749050625	1749050625	0	0	68406501aa5e5	31	
540	2	appdata_oc9xft3m2oht/preview/7/b/c	3a12b76c4ab998109f10e7b101a421cc	539	c	2	1	-1	1749050625	1749050625	0	0	68406501a9af4	31	
541	2	appdata_oc9xft3m2oht/preview/7/b/c/d	06c06a204c2a2b0d741ff99886e63999	540	d	2	1	-1	1749050625	1749050625	0	0	68406501a8ca6	31	
542	2	appdata_oc9xft3m2oht/preview/7/b/c/d/f	bfda4d0cb74194c1b91a6b5d79e4d7bf	541	f	2	1	-1	1749050625	1749050625	0	0	68406501a8252	31	
543	2	appdata_oc9xft3m2oht/preview/7/b/c/d/f/7	357174352ad4fabeeae181a33c752ea7	542	7	2	1	-1	1749050625	1749050625	0	0	68406501a736b	31	
544	2	appdata_oc9xft3m2oht/preview/7/b/c/d/f/7/5	f070d56ffd3981f44cbc86009d50d97b	543	5	2	1	-1	1749050625	1749050625	0	0	68406501a6864	31	
545	2	appdata_oc9xft3m2oht/preview/7/b/c/d/f/7/5/538	7e312bf1e4ef74385b22577d6a65c634	544	538	2	1	0	1749050625	1749050625	0	0	68406501a4ff5	31	
546	2	appdata_oc9xft3m2oht/preview/e/3	128997b234ca137f8c96f50521c87cfd	400	3	2	1	-1	1749114798	1749114798	0	0	68415fae928b4	31	
547	2	appdata_oc9xft3m2oht/preview/1/9	57450b1876e7472d23aed25c09fd9efa	355	9	2	1	-1	1749114798	1749114798	0	0	68415fae94dc8	31	
548	2	appdata_oc9xft3m2oht/preview/1/9/c	042c6275cdcca394f37c0072d54e3f4a	547	c	2	1	-1	1749114798	1749114798	0	0	68415fae93b29	31	
549	2	appdata_oc9xft3m2oht/preview/e/3/6	759ba7da9e9f08f222aaa2b0a7489584	546	6	2	1	-1	1749114798	1749114798	0	0	68415fae910e8	31	
550	2	appdata_oc9xft3m2oht/preview/1/9/c/a	2ab735ab564e3049f418113a3ce67c51	548	a	2	1	-1	1749114798	1749114798	0	0	68415fae92182	31	
551	2	appdata_oc9xft3m2oht/preview/e/3/6/9	060b6fe3d12f0958a9fe2bef05ac6dd0	549	9	2	1	-1	1749114798	1749114798	0	0	68415fae8f9f7	31	
552	2	appdata_oc9xft3m2oht/preview/1/9/c/a/1	c73d951c0d8ea05cb61387e75a140940	550	1	2	1	-1	1749114798	1749114798	0	0	68415fae91078	31	
553	2	appdata_oc9xft3m2oht/preview/1/9/c/a/1/4	a2565793e484f90cf57147a189de8f77	552	4	2	1	-1	1749114798	1749114798	0	0	68415fae8f83c	31	
554	2	appdata_oc9xft3m2oht/preview/e/3/6/9/8	6b511cb45a43192777fbc344c4a3cea5	551	8	2	1	-1	1749114798	1749114798	0	0	68415fae8e666	31	
555	2	appdata_oc9xft3m2oht/preview/1/9/c/a/1/4/e	8890f1061afcd7306c80565121a9d594	553	e	2	1	-1	1749114798	1749114798	0	0	68415fae8decc	31	
556	2	appdata_oc9xft3m2oht/preview/e/3/6/9/8/5	51468ca8b5cfded461a9d28193a4257a	554	5	2	1	-1	1749114798	1749114798	0	0	68415fae8b417	31	
558	2	appdata_oc9xft3m2oht/preview/e/3/6/9/8/5/3	8c6e2e6ce4839a4eb01d3cea9df3fbf8	556	3	2	1	-1	1749114798	1749114798	0	0	68415fae8814e	31	
557	2	appdata_oc9xft3m2oht/preview/1/9/c/a/1/4/e/36	666fc9b31e1f21af7dfa3274fa2ce0a5	555	36	2	1	0	1749114798	1749114798	0	0	68415fae8ac4c	31	
560	2	appdata_oc9xft3m2oht/preview/4/e	5f08d52a820e6b0b9b22945cff8f276d	525	e	2	1	-1	1749114798	1749114798	0	0	68415faebd20e	31	
561	2	appdata_oc9xft3m2oht/preview/4/e/7	378a808a6ba68316df244aeedf9db637	560	7	2	1	-1	1749114798	1749114798	0	0	68415faebc265	31	
562	2	appdata_oc9xft3m2oht/preview/4/e/7/3	e3e1f96679a7689b29d2fc8431d6c111	561	3	2	1	-1	1749114798	1749114798	0	0	68415faeb9a13	31	
563	2	appdata_oc9xft3m2oht/preview/4/e/7/3/2	702fedee3fcc37b92ac909b9a56bf663	562	2	2	1	-1	1749114798	1749114798	0	0	68415faeb8f7c	31	
564	2	appdata_oc9xft3m2oht/preview/4/e/7/3/2/c	83969d52a056b3ed4b45cea782446367	563	c	2	1	-1	1749114798	1749114798	0	0	68415faeb7a08	31	
565	2	appdata_oc9xft3m2oht/preview/4/e/7/3/2/c/e	ad8796d85917fbaf5795a05133f0f84d	564	e	2	1	-1	1749114798	1749114798	0	0	68415faeb5b01	31	
567	2	appdata_oc9xft3m2oht/preview/1/9/c/a/1/4/e/36/236-255-max.png	654b1d5c84246e7034d6ce576f9e7948	557	236-255-max.png	15	14	4699	1749114798	1749114798	0	0	f8c0fb9d8e609f9ce6574daf1c403797	27	
568	2	appdata_oc9xft3m2oht/preview/e/3/6/9/8/5/3/34/396-512-max.png	3f0c460c418acd84a8808cf1f24bbeee	559	396-512-max.png	15	14	23262	1749114798	1749114798	0	0	361021ed3637fdb4e839b89863a77adf	27	
569	2	appdata_oc9xft3m2oht/preview/1/9/c/a/1/4/e/36/64-64-crop.png	a0d5c6d8571457c5a5d157efd00d6eee	557	64-64-crop.png	15	14	2592	1749114798	1749114798	0	0	a32ef044d0c42bc25f883dce2218d102	27	
570	2	appdata_oc9xft3m2oht/preview/e/3/6/9/8/5/3/34/64-64-crop.png	24eab33ecd1f637d952a4e0c5be23683	559	64-64-crop.png	15	14	3980	1749114799	1749114799	0	0	63b70341089c94543afa936217919927	27	
559	2	appdata_oc9xft3m2oht/preview/e/3/6/9/8/5/3/34	296ece4f10e6fd7e1c1210cfffc9e2e6	558	34	2	1	0	1749114799	1749114799	0	0	68415fae86d5f	31	
571	2	appdata_oc9xft3m2oht/theming/global/0/icon-core-#00679efiletypes_x-office-spreadsheet.svg	1d5e2a7d568475fc68ab563e34dd0b02	107	icon-core-#00679efiletypes_x-office-spreadsheet.svg	34	14	317	1749114799	1749114799	0	0	f5504273cb9fe80d2cfd7c30c1dfcde7	27	
572	2	appdata_oc9xft3m2oht/preview/4/e/7/3/2/c/e/26/4096-4096-max.png	123533dd84fbef98d70d40fcc27a47ff	566	4096-4096-max.png	15	14	112200	1749114800	1749114800	0	0	c21e750f8140d18d48357660dd445f9d	27	
566	2	appdata_oc9xft3m2oht/preview/4/e/7/3/2/c/e/26	ed6f82878e50c81272b1276c858dd03a	565	26	2	1	0	1749114800	1749114800	0	0	68415faeb4439	31	
573	2	appdata_oc9xft3m2oht/preview/b/5/3/b/3/a/3/55/64-64-crop.png	99ca7a88f50346a4df6fb46070dbc6dc	129	64-64-crop.png	15	14	903	1749114800	1749114800	0	0	62d878b817556c876be8c17687042e49	27	
574	2	appdata_oc9xft3m2oht/preview/4/e/7/3/2/c/e/26/64-64-crop.png	f4708bdf85ee521a2e8a0dce55b68a14	566	64-64-crop.png	15	14	2411	1749114800	1749114800	0	0	86164f2898a1751b17f18d0ac53bfa2a	27	
575	2	appdata_oc9xft3m2oht/avatar/x79/avatar.64.png	040ea2e8d7c50a78487f3ca806dfd091	103	avatar.64.png	15	14	1126	1749116853	1749116853	0	0	27da5c40490827173d736356567a0f28	27	
576	2	appdata_oc9xft3m2oht/preview/9/a/1/1/5/8/1/52/64-64-crop.jpg	4f1102c7679036febfb36d256ca5da72	148	64-64-crop.jpg	17	14	1613	1749174229	1749174229	0	0	fdb9a76c9f96eb142d85e0220b22a4a4	27	
148	2	appdata_oc9xft3m2oht/preview/9/a/1/1/5/8/1/52	afd29d6460c3e151f16752d701990f8d	147	52	2	1	0	1749174229	1749174229	0	0	683ab2f994a72	31	
577	2	appdata_oc9xft3m2oht/preview/9/f/6/1/4/0/8/56/64-64-crop.jpg	71323bafe230056e83242410988b9ffe	140	64-64-crop.jpg	17	14	1823	1749174229	1749174229	0	0	8e7c5bdaab588193f7cc330307d5e172	27	
578	2	appdata_oc9xft3m2oht/preview/7/2/b/3/2/a/1/57/64-64-crop.jpg	87032496e0802918707974fd9b99e95d	132	64-64-crop.jpg	17	14	1492	1749174229	1749174229	0	0	bb9b58373f8e9e3b5808c61680b222fc	27	
579	2	appdata_oc9xft3m2oht/preview/a/6/8/4/e/c/e/54/64-64-crop.jpg	8f2e3f99e52fe0b631e85ad2aba4826e	131	64-64-crop.jpg	17	14	1901	1749174229	1749174229	0	0	99713294b1f1d7d93407ab612b820ae3	27	
580	2	appdata_oc9xft3m2oht/preview/c/0/c/7/c/7/6/50/64-64-crop.jpg	19fdcfb9775b78054c42761228c10f35	215	64-64-crop.jpg	17	14	2099	1749174229	1749174229	0	0	d909a1a3182b263d32c1b8bb8083e5b0	27	
215	2	appdata_oc9xft3m2oht/preview/c/0/c/7/c/7/6/50	307aad0ed5aa4c5a4a6dcbc960806820	214	50	2	1	0	1749174229	1749174229	0	0	683ab394e61e1	31	
581	2	appdata_oc9xft3m2oht/preview/2/8/3/8/0/2/3/51/64-64-crop.jpg	fdb262d7a3757df1ec0ee1b5a92fc786	224	64-64-crop.jpg	17	14	1313	1749174229	1749174229	0	0	621ba0d94b4c19b06c0b1cac6f6cff25	27	
582	2	appdata_oc9xft3m2oht/preview/f/4/5/7/c/5/4/49/64-64-crop.jpg	49b0eb926e5d3a82fbac677d8b4d623c	172	64-64-crop.jpg	17	14	1936	1749174229	1749174229	0	0	b7ae50917b2b5344dfe6cca3120c88f8	27	
583	2	appdata_oc9xft3m2oht/preview/d/8/2/c/8/d/1/53/64-64-crop.jpg	afd1d077c049c0940b541590a1022416	162	64-64-crop.jpg	17	14	2201	1749174230	1749174230	0	0	d53a7faf8b126e19a607c9f3202a03a8	27	
599	2	appdata_oc9xft3m2oht/preview/1/c	1eab4bd54ab30314a8fb77a04d9662f1	355	c	2	1	-1	1749174252	1749174252	0	0	684247ec4d0f7	31	
601	2	appdata_oc9xft3m2oht/preview/1/c/3	028bc8a6d719708df49db30ff171df42	599	3	2	1	-1	1749174252	1749174252	0	0	684247ec4bee1	31	
603	2	appdata_oc9xft3m2oht/preview/1/c/3/8	6b93d55653b2935504e924ac6d952c49	601	8	2	1	-1	1749174252	1749174252	0	0	684247ec4acee	31	
605	2	appdata_oc9xft3m2oht/preview/1/c/3/8/3	3402a5c240e5231cd3962791896f0c61	603	3	2	1	-1	1749174252	1749174252	0	0	684247ec4997d	31	
607	2	appdata_oc9xft3m2oht/preview/1/c/3/8/3/c	def0bdb0de64a0dc26cdf7171a82a093	605	c	2	1	-1	1749174252	1749174252	0	0	684247ec48622	31	
609	2	appdata_oc9xft3m2oht/preview/1/c/3/8/3/c/d	b4b81677d2f99b6b6ed8b5329be7227e	607	d	2	1	-1	1749174252	1749174252	0	0	684247ec47547	31	
610	2	appdata_oc9xft3m2oht/preview/1/c/3/8/3/c/d/35	5bbaf851b5d4d21887ff80bc5f35d4d1	609	35	2	1	0	1749174252	1749174252	0	0	684247ec46507	31	
612	2	appdata_oc9xft3m2oht/preview/1/c/3/8/3/c/d/35/512-288-max.png	24075cbbed1e818022665895d63eda2a	610	512-288-max.png	15	14	13279	1749174252	1749174252	0	0	3815e9ec265ec4fcd6b35f413b407326	27	
614	2	appdata_oc9xft3m2oht/preview/1/c/3/8/3/c/d/35/64-64-crop.png	3bb9bd6c3f234d42d7ea9326b79a1d36	610	64-64-crop.png	15	14	2648	1749174252	1749174252	0	0	48bb180862dcacb07f54d8f916e07fc3	27	
619	2	appdata_oc9xft3m2oht/preview/6/e/a/9/a/b	5346651f1e4562ff38bfadc31919b717	618	b	2	1	-1	1749174257	1749174257	0	0	684247f1b5540	31	
620	2	appdata_oc9xft3m2oht/preview/6/e/a/9/a/b/1	1d5851100b69b9e3137b5de8dc9ac26f	619	1	2	1	-1	1749174257	1749174257	0	0	684247f1b222b	31	
621	2	appdata_oc9xft3m2oht/preview/6/e/a/9/a/b/1/29	20ebeba94b2e2c582175b4c48a1affba	620	29	2	1	0	1749174257	1749174257	0	0	684247f1ae3a3	31	
622	2	appdata_oc9xft3m2oht/preview/2/8/3/8/0/2/3/51/1024-1536.jpg	c8f7f2552756db70762aa66421c8334d	224	1024-1536.jpg	17	14	139968	1749174261	1749174261	0	0	47a9318e65f3eb087be46218b2533110	27	
224	2	appdata_oc9xft3m2oht/preview/2/8/3/8/0/2/3/51	61c1c30879e675629c4ea5b6141b5bbc	223	51	2	1	0	1749174261	1749174261	0	0	683ab39570e09	31	
795	2	appdata_oc9xft3m2oht/preview/3/6/2/1/f/1/4/787	c5d1ecde0adc1dc4eb46d7b50c468fd6	794	787	2	1	0	1749655675	1749655675	0	0	6849a07b5d475	31	
871	2	appdata_oc9xft3m2oht/preview/2/2	1c7fb2080749a0e2c48603fde8d88061	217	2	2	1	-1	1749655722	1749655722	0	0	6849a0aab6285	31	
623	1	files/Talk/20250607_070604.png	a4c74b19a18ff4e7fe7123a33bf94a82	307	20250607_070604.png	15	14	749717	1749254764	1749254764	0	0	88fa3a73e077ce0ee57f685603fd1b1c	27	
624	2	appdata_oc9xft3m2oht/preview/a/7	335cf90c90623a1358c38522962193bb	109	7	2	1	-1	1749254769	1749254769	0	0	684382718508b	31	
625	2	appdata_oc9xft3m2oht/preview/a/7/3	abeb9e494c421e799203670b9365c403	624	3	2	1	-1	1749254769	1749254769	0	0	6843827184623	31	
626	2	appdata_oc9xft3m2oht/preview/a/7/3/3	e90349fee4334c868d190b893c310032	625	3	2	1	-1	1749254769	1749254769	0	0	684382718379c	31	
627	2	appdata_oc9xft3m2oht/preview/a/7/3/3/f	5036bcf78d7c934fdd76d7811f6022e5	626	f	2	1	-1	1749254769	1749254769	0	0	6843827182d6a	31	
628	2	appdata_oc9xft3m2oht/preview/a/7/3/3/f/a	5fccb8c46f6abcb286a7063d9f4e8401	627	a	2	1	-1	1749254769	1749254769	0	0	6843827181cfc	31	
2	1	files	45b963397aa40d4a0063e0d85e4fe7a1	1	files	2	1	1197653248	1749749347	1748680493	0	0	684b0e6361b67	31	
66	2	appdata_oc9xft3m2oht/appstore/apps.json	2f0762f1a3f310429d4e37c496e05bf1	65	apps.json	21	3	2779019	1749882404	1749882404	0	0	a6f8d67bd6d5c55944cb4e7d7f76a190	27	
629	2	appdata_oc9xft3m2oht/preview/a/7/3/3/f/a/9	04ca5e352dc8e9a28bfb9ab3af93dbe2	628	9	2	1	-1	1749254769	1749254769	0	0	6843827180e86	31	
657	2	appdata_oc9xft3m2oht/preview/2/6/d/d/0/d/b/633	e7863b05730013d9b57095e925fecd32	656	633	2	1	0	1749748351	1749748351	0	0	6843b1ebece03	31	
648	2	appdata_oc9xft3m2oht/preview/6/a/1/0/b/b/d/635	4d5b31c782c0656e7668223479f0cf80	647	635	2	1	0	1749748351	1749748351	0	0	6843b1ebcf532	31	
631	2	appdata_oc9xft3m2oht/preview/a/7/3/3/f/a/9/623/960-1280-max.png	e227d8ff1c5f53ed0f0c382fbc32f11f	630	960-1280-max.png	15	14	812833	1749254770	1749254770	0	0	e5094412d224605515bcb2766d9ecf4d	27	
630	2	appdata_oc9xft3m2oht/preview/a/7/3/3/f/a/9/623	f47c0045996f9dc7858563ebc0ef2b9c	629	623	2	1	0	1749748351	1749748351	0	0	684382717fb9a	31	
632	2	appdata_oc9xft3m2oht/preview/a/7/3/3/f/a/9/623/256-341.png	0ce99affe0bb9514d66d0462f7d9e818	630	256-341.png	15	14	105857	1749254770	1749254770	0	0	886dd24949f61623f4b23e9f8a1448f4	27	
633	1	files/Talk/20250607_102816.png	cccd03c95d94594b9a7d5f54df6ba365	307	20250607_102816.png	15	14	12409	1749266896	1749266896	0	0	437b19b2009d688991247058ae97b1ca	27	
634	1	files/Talk/20250607_102821.png	6f557700e584eaf918a24530968129bb	307	20250607_102821.png	15	14	9731	1749266901	1749266901	0	0	076bdd7d593e32e3d8f7381904ce7354	27	
635	1	files/Talk/20250607_102825.png	426cc7fcb9a63d00991b4cb91a9c1e53	307	20250607_102825.png	15	14	7895	1749266905	1749266905	0	0	83e664c6e47c440160c5de30271f29b7	27	
636	2	appdata_oc9xft3m2oht/preview/6/7/6	a79b61d950bd53613a413d5d8d95fb78	253	6	2	1	-1	1749266923	1749266923	0	0	6843b1ebe336c	31	
637	2	appdata_oc9xft3m2oht/preview/6/a	9b1a0cd96eeec4a9b2d6702b31acca6b	246	a	2	1	-1	1749266923	1749266923	0	0	6843b1ebe517a	31	
638	2	appdata_oc9xft3m2oht/preview/6/7/6/6	ad39a046cae7e74abeb9258bd08a5500	636	6	2	1	-1	1749266923	1749266923	0	0	6843b1ebe22ad	31	
639	2	appdata_oc9xft3m2oht/preview/6/a/1	987bc895e3c37ecc83c484990a10f186	637	1	2	1	-1	1749266923	1749266923	0	0	6843b1ebe221d	31	
640	2	appdata_oc9xft3m2oht/preview/6/7/6/6/a	869f7d738da23fe9770e5f41845230a3	638	a	2	1	-1	1749266923	1749266923	0	0	6843b1ebe1161	31	
641	2	appdata_oc9xft3m2oht/preview/6/a/1/0	a3f843a91240cc45ad64ce6fa61e1be2	639	0	2	1	-1	1749266923	1749266923	0	0	6843b1ebde9d2	31	
642	2	appdata_oc9xft3m2oht/preview/6/a/1/0/b	49e5bfb57a0313e7262d09d8646558c9	641	b	2	1	-1	1749266923	1749266923	0	0	6843b1ebda928	31	
643	2	appdata_oc9xft3m2oht/preview/6/7/6/6/a/a	bb5c9f2f75d61a86b44536ad2738d3c2	640	a	2	1	-1	1749266923	1749266923	0	0	6843b1ebddb71	31	
644	2	appdata_oc9xft3m2oht/preview/6/a/1/0/b/b	8514a0f753660fd18fdfa7aba7679904	642	b	2	1	-1	1749266923	1749266923	0	0	6843b1ebd8b7b	31	
645	2	appdata_oc9xft3m2oht/preview/6/7/6/6/a/a/2	3e5b9aa047e3e71d54dae099021845e5	643	2	2	1	-1	1749266923	1749266923	0	0	6843b1ebd83ec	31	
647	2	appdata_oc9xft3m2oht/preview/6/a/1/0/b/b/d	26e75a7c600caf806168483a77496a33	644	d	2	1	-1	1749266923	1749266923	0	0	6843b1ebd51bf	31	
649	2	appdata_oc9xft3m2oht/preview/2/6	24f8fd40b9711292c30f523161a20470	217	6	2	1	-1	1749266923	1749266923	0	0	6843b1ec0652d	31	
650	2	appdata_oc9xft3m2oht/preview/2/6/d	ffbf034e5784d8578e7db5859e9a7100	649	d	2	1	-1	1749266923	1749266923	0	0	6843b1ec04ca8	31	
651	2	appdata_oc9xft3m2oht/preview/6/7/6/6/a/a/2/634/752-452-max.png	3976fb76c4412b9146469bd0b30cf6aa	646	752-452-max.png	15	14	9382	1749266924	1749266924	0	0	ba08b307c48eb0b99e7c2677807c7983	27	
652	2	appdata_oc9xft3m2oht/preview/2/6/d/d	14cc9e06616822f7a7f891ade9810dd9	650	d	2	1	-1	1749266923	1749266923	0	0	6843b1ec03e17	31	
653	2	appdata_oc9xft3m2oht/preview/2/6/d/d/0	b928011ea2e7602dbdb196e02f03185d	652	0	2	1	-1	1749266923	1749266923	0	0	6843b1ec01369	31	
654	2	appdata_oc9xft3m2oht/preview/6/a/1/0/b/b/d/635/752-452-max.png	925700a499c0dfef3321a2af7f03c628	648	752-452-max.png	15	14	7375	1749266924	1749266924	0	0	b84a6081c8b9223e7e5c1c2ccaf3829d	27	
655	2	appdata_oc9xft3m2oht/preview/2/6/d/d/0/d	8c01a3720f911dbff326fde348d46933	653	d	2	1	-1	1749266923	1749266923	0	0	6843b1ebf252b	31	
656	2	appdata_oc9xft3m2oht/preview/2/6/d/d/0/d/b	5497a6f4dc22f8b8061896a4f7ca2396	655	b	2	1	-1	1749266923	1749266923	0	0	6843b1ebf018c	31	
658	2	appdata_oc9xft3m2oht/preview/2/6/d/d/0/d/b/633/752-452-max.png	64f1680a0ec30a1071924ff357b0d9f7	657	752-452-max.png	15	14	10092	1749266924	1749266924	0	0	fda4df69455b6969bf8a0766fda06c30	27	
659	2	appdata_oc9xft3m2oht/preview/a/7/3/3/f/a/9/623/768-1024.png	d27fcc1b0cfa6da2de1ff38b38f4f09d	630	768-1024.png	15	14	607566	1749303456	1749303456	0	0	4d5f2c29cd384f14eb85afbf7212466b	27	
660	1	files/Talk/twilio_2FA_recovery_code.txt	e226a0dc691f53e7913ef29b35566c43	307	twilio_2FA_recovery_code.txt	68	10	24	1749454549	1749454549	0	0	e4e972f8858c7a3a211bf887cdc83c63	27	
661	2	appdata_oc9xft3m2oht/preview/6/8	7bb6d0436fb81366509fb8355c743839	246	8	2	1	-1	1749454551	1749454551	0	0	68468ed717bce	31	
662	2	appdata_oc9xft3m2oht/preview/6/8/2	d07aa001276ff7ce2e7537e83eb84c21	661	2	2	1	-1	1749454551	1749454551	0	0	68468ed716a3b	31	
663	2	appdata_oc9xft3m2oht/preview/6/8/2/6	00a6e3aaf8f43041526982d01071e99e	662	6	2	1	-1	1749454551	1749454551	0	0	68468ed715179	31	
664	2	appdata_oc9xft3m2oht/preview/6/8/2/6/4	3e1834db280ab421ce2fa13377aeb766	663	4	2	1	-1	1749454551	1749454551	0	0	68468ed713e88	31	
665	2	appdata_oc9xft3m2oht/preview/6/8/2/6/4/b	97dd26f183101d41cf5c3e14b662d9dd	664	b	2	1	-1	1749454551	1749454551	0	0	68468ed7129e3	31	
666	2	appdata_oc9xft3m2oht/preview/6/8/2/6/4/b/d	6aa494dd7716c2211cebd83b076302a4	665	d	2	1	-1	1749454551	1749454551	0	0	68468ed711759	31	
791	2	appdata_oc9xft3m2oht/preview/3/6/2/1	b2d2fd0ac84344ea1b3e938f3856e6df	789	1	2	1	-1	1749655675	1749655675	0	0	6849a07b6911f	31	
668	2	appdata_oc9xft3m2oht/preview/6/8/2/6/4/b/d/660/4096-4096-max.png	ef02b173a0eaf08ecd91677a69599d2f	667	4096-4096-max.png	15	14	25109	1749454551	1749454551	0	0	e28c8f1d0685ba98760f66fbae207da0	27	
669	2	appdata_oc9xft3m2oht/preview/6/8/2/6/4/b/d/660/1024-1024.png	680f7d43fb7850ab36835820d247efe8	667	1024-1024.png	15	14	20418	1749454552	1749454552	0	0	899ce50753fb515fb4f2fd8b53195e83	27	
670	2	appdata_oc9xft3m2oht/preview/f/7/1/7/7/1/6/44/256-256.png	b5fd9bf000988f28aa5055ba343655ba	384	256-256.png	15	14	34096	1749570252	1749570252	0	0	0554e54216360dfc46762be211139274	27	
671	2	appdata_oc9xft3m2oht/preview/6/c/8/3/4/9/c/45/256-256.png	504fab0c3034cc74fe1939b23a814412	382	256-256.png	15	14	6398	1749570252	1749570252	0	0	7f22dfae307d8c293f4d18d6942ab772	27	
792	2	appdata_oc9xft3m2oht/preview/3/6/2/1/f	e9ce9069958badbf9f9e77d4f85af849	791	f	2	1	-1	1749655675	1749655675	0	0	6849a07b66cdc	31	
672	2	appdata_oc9xft3m2oht/spreed/room-avatar/ttx8py64	53b38353803e8d89719c9a56ec06d1e0	310	ttx8py64	2	1	0	1749570669	1749570669	0	0	6848546d8a7ee	31	
310	2	appdata_oc9xft3m2oht/spreed/room-avatar	d8f6e7d5873a2c81f460b103e710cfa0	309	room-avatar	2	1	0	1749570669	1749570669	0	0	683abf390242e	31	
673	2	appdata_oc9xft3m2oht/spreed/room-avatar/ttx8py64/8nPJ4nJyCarWrM2N.svg	5254535ace8d363f3d5c9aaec8dbb90c	672	8nPJ4nJyCarWrM2N.svg	34	14	486	1749570669	1749570669	0	0	75702d332272945468d7a79e6a245a2a	27	
793	2	appdata_oc9xft3m2oht/preview/3/6/2/1/f/1	064ea52e63850f46fbe5e23e9a534fd4	792	1	2	1	-1	1749655675	1749655675	0	0	6849a07b65320	31	
872	2	appdata_oc9xft3m2oht/preview/2/2/f	50b9f9085c467fc4b7bdab5a3ddb6550	871	f	2	1	-1	1749655722	1749655722	0	0	6849a0aab5324	31	
873	2	appdata_oc9xft3m2oht/preview/2/2/f/b	c3b179f52b5d7674eafc04afa30c6d95	872	b	2	1	-1	1749655722	1749655722	0	0	6849a0aab458f	31	
874	2	appdata_oc9xft3m2oht/preview/2/2/f/b/0	b3a354d7c0ea2de28b12de0c736bedad	873	0	2	1	-1	1749655722	1749655722	0	0	6849a0aab34ed	31	
667	2	appdata_oc9xft3m2oht/preview/6/8/2/6/4/b/d/660	ebf06d1a44bc0c9b846eb36431e6325b	666	660	2	1	0	1749747763	1749747763	0	0	68468ed708c5a	31	
321	1	uploads	5128f35c9b4be13788ba41bdb6d1fc1f	1	uploads	2	1	0	1749657223	1749657223	0	0	6849a68741a57	31	
827	2	appdata_oc9xft3m2oht/preview/4/5	360715b7b9d78dff9331a33a91f58e1f	525	5	2	1	-1	1749655708	1749655708	0	0	6849a09c1b9f0	31	
826	2	appdata_oc9xft3m2oht/preview/f/0	fa9146d3a1a5859fe3eba5f83207540d	165	0	2	1	-1	1749655708	1749655708	0	0	6849a09c1bb3c	31	
829	2	appdata_oc9xft3m2oht/preview/4/5/5	13262e569c9ba0e7f8f8f625c88a7055	827	5	2	1	-1	1749655708	1749655708	0	0	6849a09c1abc1	31	
828	2	appdata_oc9xft3m2oht/preview/f/0/a	da4c82d68c7ff0e89f19712d607c5a9b	826	a	2	1	-1	1749655708	1749655708	0	0	6849a09c1adee	31	
830	2	appdata_oc9xft3m2oht/preview/4/5/5/8	844dc7f88be589f96db66f006e408dd8	829	8	2	1	-1	1749655708	1749655708	0	0	6849a09c19ffc	31	
831	2	appdata_oc9xft3m2oht/preview/f/0/a/d	8e0d2bead979e8dbef9cc702fa89d092	828	d	2	1	-1	1749655708	1749655708	0	0	6849a09c1a220	31	
833	2	appdata_oc9xft3m2oht/preview/4/5/5/8/d	e45e4cae47498b89f936dce014591e07	830	d	2	1	-1	1749655708	1749655708	0	0	6849a09c18f47	31	
832	2	appdata_oc9xft3m2oht/preview/f/0/a/d/c	9817e52976dcee3f1d154d64011bf52e	831	c	2	1	-1	1749655708	1749655708	0	0	6849a09c1940c	31	
834	2	appdata_oc9xft3m2oht/preview/4/5/5/8/d/b	1c88dc6898ae4787ac799d2e88643247	833	b	2	1	-1	1749655708	1749655708	0	0	6849a09c180fd	31	
835	2	appdata_oc9xft3m2oht/preview/f/0/a/d/c/8	f96853f896f18a777d20885d91f74c4e	832	8	2	1	-1	1749655708	1749655708	0	0	6849a09c18490	31	
837	2	appdata_oc9xft3m2oht/preview/f/0/a/d/c/8/8	dfa18dadf2897ef2c173523065facbd6	835	8	2	1	-1	1749655708	1749655708	0	0	6849a09c17b6a	31	
836	2	appdata_oc9xft3m2oht/preview/4/5/5/8/d/b/b	247af4c80bf95960013750a3f0fd7482	834	b	2	1	-1	1749655708	1749655708	0	0	6849a09c1484b	31	
875	2	appdata_oc9xft3m2oht/preview/2/2/f/b/0/c	4fb35d1c0435b3526a84392046205617	874	c	2	1	-1	1749655722	1749655722	0	0	6849a0aab2752	31	
876	2	appdata_oc9xft3m2oht/preview/2/2/f/b/0/c/e	5d131b232aca07eb16cc66df8aa38f70	875	e	2	1	-1	1749655722	1749655722	0	0	6849a0aaae540	31	
878	2	appdata_oc9xft3m2oht/preview/2/2/f/b/0/c/e/870/3000-4000-max.jpg	c16e54c7065a33ae53f15c49c238938e	877	3000-4000-max.jpg	17	14	1172452	1749655723	1749655723	0	0	66aba087013036be50db4ce14c4dedce	27	
879	2	appdata_oc9xft3m2oht/preview/2/2/f/b/0/c/e/870/768-1024.jpg	76a857b2c10f7c0537e72d3e3f0cefe3	877	768-1024.jpg	17	14	94932	1749655724	1749655724	0	0	cec626fc190156156870f44aa3fa08ac	27	
885	1	files/Talk/2025_06_11 19_39 Office Lens.pdf	5193e0036d767f3ff4014b0b3b356627	307	2025_06_11 19_39 Office Lens.pdf	4	3	3184147	1749657223	1749657223	0	0	08478e0aec0774f4c7e5389bdb04d67a	27	
893	1	files/Talk/M3325007-Danh Tính-Thực trạng và giải pháp ứng dụng Trí tuệ nhân tạo (Al) trong hoạt động sản xuất lúa gạo tại Đồng bằng sông Cửu Long.doc	02b477f76f0a58eca894e27ee12a3bca	307	M3325007-Danh Tính-Thực trạng và giải pháp ứng dụng Trí tuệ nhân tạo (Al) trong hoạt động sản xuất lúa gạo tại Đồng bằng sông Cửu Long.doc	73	3	75264	1749706637	1749706637	0	0	1a25dd577a75d7a67834a6a892c6da99	27	
906	2	appdata_oc9xft3m2oht/preview/1/8/5/e/6/5/b/746	3b11b62d50eb63ecec46a9d47c21cf78	904	746	2	1	0	1749747759	1749747759	0	0	684b082ff1703	31	
897	2	appdata_oc9xft3m2oht/preview/1/8/5	9227f8a663935669815411d069792c48	588	5	2	1	-1	1749747759	1749747759	0	0	684b083007302	31	
899	2	appdata_oc9xft3m2oht/preview/1/8/5/e	2c9e3e9d42ac5ed193a860f6033e66f7	897	e	2	1	-1	1749747759	1749747759	0	0	684b083006308	31	
898	2	appdata_oc9xft3m2oht/preview/d/5/6/b/9	15f77a246e4b6607a1c297834e95aa37	896	9	2	1	-1	1749747759	1749747759	0	0	684b082fedbf3	31	
900	2	appdata_oc9xft3m2oht/preview/1/8/5/e/6	a450c60f682e3dec68b136b371a44d94	899	6	2	1	-1	1749747759	1749747759	0	0	684b083004533	31	
847	1	files/Talk/1749545599_de366c96-367c-4e59-a014-50cb5498d7ca.jpg	d4158afd742dd47717d80b5723732f20	307	1749545599_de366c96-367c-4e59-a014-50cb5498d7ca.jpg	17	14	4980602	1749655710	1749655710	0	0	71bc240113e6bd2a25d9ed90be5cdaf2	27	
901	2	appdata_oc9xft3m2oht/preview/d/5/6/b/9/f	9fe97d6e6c425658f8f668755a867c44	898	f	2	1	-1	1749747759	1749747759	0	0	684b082fec962	31	
902	2	appdata_oc9xft3m2oht/preview/d/5/6/b/9/f/c	2b0cd61ffbd767d6c460070058eecd36	901	c	2	1	-1	1749747759	1749747759	0	0	684b082feb027	31	
903	2	appdata_oc9xft3m2oht/preview/1/8/5/e/6/5	ca60aec61172fbdf5f39d8b2ac171ae4	900	5	2	1	-1	1749747759	1749747759	0	0	684b083001a15	31	
818	1	files/Talk/1749545599_f3599c42-7d0a-4af7-afba-604bd959496e.jpg	4d8724f9f938f8cb8f1fc6e617a7c140	307	1749545599_f3599c42-7d0a-4af7-afba-604bd959496e.jpg	17	14	4420761	1749655705	1749655705	0	0	ac0f71d636d76ad8a40bd1f3597ddce5	27	
904	2	appdata_oc9xft3m2oht/preview/1/8/5/e/6/5/b	f5fa584e7d3d51432ffb17229f282198	903	b	2	1	-1	1749747759	1749747759	0	0	684b082ff41bd	31	
821	1	files/Talk/1749545599_04d07652-6952-4024-b365-51cef87f0771.jpg	fd323c31e7e950ae795732dc65767d3b	307	1749545599_04d07652-6952-4024-b365-51cef87f0771.jpg	17	14	4657410	1749655705	1749655705	0	0	854459761dd8b1bf07307af1468b35f0	27	
905	2	appdata_oc9xft3m2oht/preview/d/5/6/b/9/f/c/893	a5501568b9f522938766881e53a821ba	902	893	2	1	0	1749747759	1749747759	0	0	684b082fe8132	31	
907	2	appdata_oc9xft3m2oht/preview/f/0/a/d/c/8/8/818/64-64-crop.jpg	d2e171fd1c8cde165bfe526a265ec369	838	64-64-crop.jpg	17	14	1641	1749747762	1749747762	0	0	1376ca9291baeadbe9515945f198004a	27	
908	2	appdata_oc9xft3m2oht/preview/3/d/8/e/2/8/c/843/64-64-crop.jpg	0a024b3208fcaeb3b77a084a22b38762	855	64-64-crop.jpg	17	14	1740	1749747763	1749747763	0	0	f78f8acb32176fc4f0b6ca4dc26a6358	27	
841	2	appdata_oc9xft3m2oht/preview/f/0/a/d/c/8/8/818/3000-4000-max.jpg	11b42d92e05e616f5eb070d72183596d	838	3000-4000-max.jpg	17	14	772848	1749655708	1749655708	0	0	c6b7b2507e0fbf67ca1c1295665238f0	27	
909	2	appdata_oc9xft3m2oht/preview/4/5/5/8/d/b/b/821/64-64-crop.jpg	d8375dd320e6b30c3ad40b4cd2244144	839	64-64-crop.jpg	17	14	1925	1749747763	1749747763	0	0	188ff467e6017bb6e264218847c6fdde	27	
910	2	appdata_oc9xft3m2oht/preview/6/8/2/6/4/b/d/660/64-64-crop.png	a00a262eb6921e73cf402b7065fcb148	667	64-64-crop.png	15	14	557	1749747763	1749747763	0	0	f0e4a7c8e0780e250691f7ac9ece93cc	27	
846	2	appdata_oc9xft3m2oht/preview/f/0/a/d/c/8/8/818/768-1024.jpg	5febc9ce07447ad91484c6cc0bcf5ed3	838	768-1024.jpg	17	14	56925	1749655710	1749655710	0	0	0c3255a455a062458b07d8cdd84d379f	27	
911	2	appdata_oc9xft3m2oht/preview/2/2/f/b/0/c/e/870/64-64-crop.jpg	61d38cce3c7a26b1e44097d271a620c5	877	64-64-crop.jpg	17	14	1787	1749747764	1749747764	0	0	d8995eba0c007caad87113f7594afbcb	27	
912	2	appdata_oc9xft3m2oht/preview/f/4/5/5/2/6/7/847/256-256-crop.jpg	3e2b7fb3304adf6aaef690c0f12a6358	862	256-256-crop.jpg	17	14	9399	1749747765	1749747765	0	0	847aac4abdc32d65e41a1c783fbb6f69	27	
913	2	appdata_oc9xft3m2oht/preview/f/4/5/5/2/6/7/847/64-64-crop.jpg	e39022c5422f1496515c30e40445b4f9	862	64-64-crop.jpg	17	14	1504	1749747765	1749747765	0	0	f47dfd985bb3acac8ef31f369c2e7a47	27	
855	2	appdata_oc9xft3m2oht/preview/3/d/8/e/2/8/c/843	24a717829b4d76c2b584e6a71ce61e46	854	843	2	1	0	1749747765	1749747765	0	0	6849a09f314c9	31	
838	2	appdata_oc9xft3m2oht/preview/f/0/a/d/c/8/8/818	19014c97b7b39bd0871687dcaef33417	837	818	2	1	0	1749747765	1749747765	0	0	6849a09c12ea3	31	
787	1	files/Talk/sisvietnam.vn-20250611-071752-587.wpress	ed18c7544942607c49884c2c3f3d5357	307	sisvietnam.vn-20250611-071752-587.wpress	19	3	405509973	1749626391	1749626391	0	0	67268859d75226c54ebe4c4b71f3c17c	27	
886	2	appdata_oc9xft3m2oht/preview/0/e	3bd956b0956265d029b57eca583683c8	340	e	2	1	-1	1749657224	1749657224	0	0	6849a688ab1d4	31	
887	2	appdata_oc9xft3m2oht/preview/0/e/f	48c0be739ea801d8749c36bb381cf05b	886	f	2	1	-1	1749657224	1749657224	0	0	6849a688aa7ea	31	
888	2	appdata_oc9xft3m2oht/preview/0/e/f/e	214b3d0aa4e0f7110bb561aed5926cc1	887	e	2	1	-1	1749657224	1749657224	0	0	6849a688a99f4	31	
889	2	appdata_oc9xft3m2oht/preview/0/e/f/e/3	4251da8a32c42428ae73ef457459ebca	888	3	2	1	-1	1749657224	1749657224	0	0	6849a688a8f5c	31	
890	2	appdata_oc9xft3m2oht/preview/0/e/f/e/3/2	f50b69b4f4bc919f4f65680d89fcdd9f	889	2	2	1	-1	1749657224	1749657224	0	0	6849a688a8016	31	
891	2	appdata_oc9xft3m2oht/preview/0/e/f/e/3/2/8	3290582469523272c97b9da000fd28e7	890	8	2	1	-1	1749657224	1749657224	0	0	6849a688a5482	31	
892	2	appdata_oc9xft3m2oht/preview/0/e/f/e/3/2/8/885	bf869d4dc138067c469c883312a5bb67	891	885	2	1	0	1749657224	1749657224	0	0	6849a688a0321	31	
533	2	appdata_oc9xft3m2oht/core/opengraph/1ea91ec81bf7d06cd99fb4ef65818119	7ec6c828291c3d8a2e73fde41c8cf861	319	1ea91ec81bf7d06cd99fb4ef65818119	19	3	161577	1749747442	1749747442	0	0	f7ea37aafc35284fd644e812885879b2	27	
894	2	appdata_oc9xft3m2oht/preview/d/5	76f54d1e1204652cf155f3d9ec7107ac	155	5	2	1	-1	1749747759	1749747759	0	0	684b082ff3f18	31	
862	2	appdata_oc9xft3m2oht/preview/f/4/5/5/2/6/7/847	b140f9472d1c9d698b078e971da46cd4	861	847	2	1	0	1749747765	1749747765	0	0	6849a0a09c1c0	31	
839	2	appdata_oc9xft3m2oht/preview/4/5/5/8/d/b/b/821	ba6bf8ef06ce4e9dec62b36bfcbf9ab0	836	821	2	1	0	1749747765	1749747765	0	0	6849a09c10659	31	
307	1	files/Talk	a12e821edb92901676dee9cfe1487de3	2	Talk	2	1	1179924223	1749749347	1749749347	0	0	684b0e6361b67	31	
842	2	appdata_oc9xft3m2oht/preview/4/5/5/8/d/b/b/821/3000-4000-max.jpg	dfaf5a00840c19e20eec55094e8e7918	839	3000-4000-max.jpg	17	14	774286	1749655708	1749655708	0	0	b6032e0d1d22fabe2c0dd9fd96f3ecde	27	
843	1	files/Talk/1749545599_11c44654-0f2c-4e2e-ba44-f19e613a65c7.jpg	7a4520b3c38c94479c17586fde5c0650	307	1749545599_11c44654-0f2c-4e2e-ba44-f19e613a65c7.jpg	17	14	5230044	1749655709	1749655709	0	0	5efa9416232d47f61883443afa9d493d	27	
746	1	files/Talk/Nội dung đề tài -Thầy nhân.mp4	171bad9ec321226472f40281b88a0a69	307	Nội dung đề tài -Thầy nhân.mp4	13	12	739749585	1749429073	1749429073	0	0	f6ad57324f3220f1ed4d2cc60e19bc1d	27	
1	1		d41d8cd98f00b204e9800998ecf8427e	-1		2	1	-1	1749749347	1748738902	0	0	684b0e6361b67	23	
848	2	appdata_oc9xft3m2oht/preview/4/5/5/8/d/b/b/821/768-1024.jpg	a67613e747ec2cd430e52edcc7162b1c	839	768-1024.jpg	17	14	75366	1749655710	1749655710	0	0	6da66cc71bb418d9994373865981198b	27	
849	2	appdata_oc9xft3m2oht/preview/3/d	086efb62c79d0960ed6d1690c3c7ed29	199	d	2	1	-1	1749655711	1749655711	0	0	6849a09f3da52	31	
850	2	appdata_oc9xft3m2oht/preview/3/d/8	8a2ae798f3bb307e1da7c12505490a25	849	8	2	1	-1	1749655711	1749655711	0	0	6849a09f3c9e1	31	
851	2	appdata_oc9xft3m2oht/preview/3/d/8/e	75354424221d8bf1175295f1e767f5b4	850	e	2	1	-1	1749655711	1749655711	0	0	6849a09f3b50f	31	
852	2	appdata_oc9xft3m2oht/preview/3/d/8/e/2	396ad63c0f304a2cef668f25950a566c	851	2	2	1	-1	1749655711	1749655711	0	0	6849a09f3a414	31	
853	2	appdata_oc9xft3m2oht/preview/3/d/8/e/2/8	2033db51b80e063517b2e46ec04274c5	852	8	2	1	-1	1749655711	1749655711	0	0	6849a09f38ecf	31	
854	2	appdata_oc9xft3m2oht/preview/3/d/8/e/2/8/c	805b049a13fc2f12f3cb47f44c37ebed	853	c	2	1	-1	1749655711	1749655711	0	0	6849a09f35d5c	31	
856	2	appdata_oc9xft3m2oht/preview/3/d/8/e/2/8/c/843/3000-4000-max.jpg	b7a176d4a43c151d9e223633e335936a	855	3000-4000-max.jpg	17	14	1157088	1749655712	1749655712	0	0	076713b6b63f01b260d783ad47494118	27	
858	2	appdata_oc9xft3m2oht/preview/f/4/5/5	78c1b45fa3db940a9a6a28d22e398595	167	5	2	1	-1	1749655712	1749655712	0	0	6849a0a09ed6f	31	
859	2	appdata_oc9xft3m2oht/preview/f/4/5/5/2	9c0cdd8358b8fb4dc6c64f4b7a861ccd	858	2	2	1	-1	1749655712	1749655712	0	0	6849a0a09e522	31	
860	2	appdata_oc9xft3m2oht/preview/f/4/5/5/2/6	9f967967b1d300f2509ad1b877aa16e5	859	6	2	1	-1	1749655712	1749655712	0	0	6849a0a09d8fe	31	
861	2	appdata_oc9xft3m2oht/preview/f/4/5/5/2/6/7	6079ff2d054e9b24d75d58a4bf5dea1f	860	7	2	1	-1	1749655712	1749655712	0	0	6849a0a09d0c3	31	
863	2	appdata_oc9xft3m2oht/preview/3/d/8/e/2/8/c/843/768-1024.jpg	fd921f80bcd78fff39b280ed91941b20	855	768-1024.jpg	17	14	93207	1749655713	1749655713	0	0	ded4f12c5942ef44e0149f3848fc9b2b	27	
864	2	appdata_oc9xft3m2oht/preview/f/4/5/5/2/6/7/847/3000-4000-max.jpg	7d43d732e413c3d51bdc3d8b27c02990	862	3000-4000-max.jpg	17	14	1003360	1749655713	1749655713	0	0	fda790a2c95381879ec77eafb3ddac98	27	
866	2	appdata_oc9xft3m2oht/preview/f/4/5/5/2/6/7/847/768-1024.jpg	7e77b1f8b4a3a91865c311c9da5ec527	862	768-1024.jpg	17	14	71583	1749655715	1749655715	0	0	9a68d71f8d1738f3744d861a1e7e7298	27	
914	2	appdata_oc9xft3m2oht/preview/2/2/f/b/0/c/e/870/256-256-crop.jpg	d9a8e60cb1cd7284ce79ddc12355d341	877	256-256-crop.jpg	17	14	12492	1749747765	1749747765	0	0	075716d9e4ba40056d756cf55e7d4993	27	
877	2	appdata_oc9xft3m2oht/preview/2/2/f/b/0/c/e/870	d4024e0ee8a37bf13aea24ae95016064	876	870	2	1	0	1749747765	1749747765	0	0	6849a0aaa91b9	31	
915	2	appdata_oc9xft3m2oht/preview/3/d/8/e/2/8/c/843/256-256-crop.jpg	1a504f3cc423f811da3990d71c328571	855	256-256-crop.jpg	17	14	12412	1749747765	1749747765	0	0	4d168d9bf7420018d5d3482292b07fbe	27	
916	2	appdata_oc9xft3m2oht/preview/4/5/5/8/d/b/b/821/256-256-crop.jpg	cf41f64c8df264208a366873cb70732f	839	256-256-crop.jpg	17	14	12677	1749747765	1749747765	0	0	30356e9623ac63023fe18a2e81f41901	27	
917	2	appdata_oc9xft3m2oht/preview/f/0/a/d/c/8/8/818/256-256-crop.jpg	6e524923f8b9447c4fe8de4654b83ce2	838	256-256-crop.jpg	17	14	9158	1749747765	1749747765	0	0	39600a737b349cd8098135aea660e947	27	
918	2	appdata_oc9xft3m2oht/preview/6/7/6/6/a/a/2/634/64-64-crop.png	00c10d5642d7424304c474ca7e9920fe	646	64-64-crop.png	15	14	1920	1749748351	1749748351	0	0	a16834c2f910ea06b54328c35cf7ca8e	27	
646	2	appdata_oc9xft3m2oht/preview/6/7/6/6/a/a/2/634	b5aa43d9da1b04ac73c73f3f5de2d593	645	634	2	1	0	1749748351	1749748351	0	0	6843b1ebd0b11	31	
919	2	appdata_oc9xft3m2oht/preview/2/6/d/d/0/d/b/633/64-64-crop.png	2a912b9e38caa7e496e92a5853fa3c32	657	64-64-crop.png	15	14	2361	1749748351	1749748351	0	0	06a0308026abc5bc2ab240e4888b96f8	27	
920	2	appdata_oc9xft3m2oht/preview/6/a/1/0/b/b/d/635/64-64-crop.png	735ba3df33d9c538a424034dd0728a0c	648	64-64-crop.png	15	14	1413	1749748351	1749748351	0	0	92c42c2ef340f2f756803419f0764dbf	27	
921	2	appdata_oc9xft3m2oht/preview/a/7/3/3/f/a/9/623/64-64-crop.png	c8a8ad83260b6d5c89f1c2af1ceffb5d	630	64-64-crop.png	15	14	6678	1749748351	1749748351	0	0	04cd165481e1d1c6dd8f264f4661ac34	27	
922	1	files/Talk/M2523001_PhanVoDinhHIen_THỰC TRẠNG VÀ GIẢI PHÁP CỦA ỨNG DỤNG TRÍ TUỆ NHÂN TẠO TRONG HOẠT ĐỘNG KHÁM CHỮA BỆNH TẠI BỆNH VIỆN ĐA KHOA QUỐC TẾ SIS CẦN THƠ..pdf	3574feb6c10e29f8ae8994b45f80ac91	307	M2523001_PhanVoDinhHIen_THỰC TRẠNG VÀ GIẢI PHÁP CỦA ỨNG DỤNG TRÍ TUỆ NHÂN TẠO TRONG HOẠT ĐỘNG KHÁM CHỮA BỆNH TẠI BỆNH VIỆN ĐA KHOA QUỐC TẾ SIS CẦN THƠ..pdf	4	3	202865	1749749259	1749749259	0	0	02aeefed117c19d35114863b5b099012	27	
923	1	files/Talk/M2523001_THỰC TRẠNG VÀ GIẢI PHÁP CỦA ỨNG DỤNG TRÍ TUỆ NHÂN TẠO TRONG HOẠT ĐỘNG KHÁM CHỮA BỆNH TẠI BỆNH VIỆN ĐA KHOA QUỐC TẾ SIS CẦN THƠ..doc	abbc40bd38877fec629e35e6b3d75873	307	M2523001_THỰC TRẠNG VÀ GIẢI PHÁP CỦA ỨNG DỤNG TRÍ TUỆ NHÂN TẠO TRONG HOẠT ĐỘNG KHÁM CHỮA BỆNH TẠI BỆNH VIỆN ĐA KHOA QUỐC TẾ SIS CẦN THƠ..doc	73	3	76288	1749749292	1749749292	0	0	f36dbd2a59a4dd4d9428990977067d4b	27	
924	2	appdata_oc9xft3m2oht/preview/c/c	e19b056f57a968bf494f6eedf0b87f0c	208	c	2	1	-1	1749779458	1749779458	0	0	684b8402868c2	31	
925	2	appdata_oc9xft3m2oht/preview/c/c/c	cba24cd8ece5adb05fec193b7b0028ae	924	c	2	1	-1	1749779458	1749779458	0	0	684b8402846b7	31	
926	2	appdata_oc9xft3m2oht/preview/c/c/c/0	2e7c71d7a7cd60d7b395c3ee9c6d25e1	925	0	2	1	-1	1749779458	1749779458	0	0	684b84028150e	31	
927	2	appdata_oc9xft3m2oht/preview/c/c/c/0/a	e3bda7d9524e1ea3fcd9f8f2f174a340	926	a	2	1	-1	1749779458	1749779458	0	0	684b8402804ab	31	
928	2	appdata_oc9xft3m2oht/preview/c/c/c/0/a/a	2319e454b304aeaff3ca6c6c90e16c55	927	a	2	1	-1	1749779458	1749779458	0	0	684b84027ee8f	31	
929	2	appdata_oc9xft3m2oht/preview/c/c/c/0/a/a/1	1ed4c83c892f132f681f2456c7a36526	928	1	2	1	-1	1749779458	1749779458	0	0	684b84027daa5	31	
930	2	appdata_oc9xft3m2oht/preview/c/c/c/0/a/a/1/922	0cacfcb1fb65c496103cb70503bd8344	929	922	2	1	0	1749779458	1749779458	0	0	684b84027b79c	31	
931	2	appdata_oc9xft3m2oht/preview/c/4	51aec669b56f3368d32258534a5078b6	208	4	2	1	-1	1749779458	1749779458	0	0	684b8402a3cb6	31	
932	2	appdata_oc9xft3m2oht/preview/c/4/0	0e7c2201193c22303acc9d3247436847	931	0	2	1	-1	1749779458	1749779458	0	0	684b8402a21a8	31	
933	2	appdata_oc9xft3m2oht/preview/c/4/0/1	efaaf8e6856c663afc4633da8b7539b4	932	1	2	1	-1	1749779458	1749779458	0	0	684b8402a0c78	31	
934	2	appdata_oc9xft3m2oht/preview/c/4/0/1/5	096a6a9fd35a8403ae471d3a27fb81de	933	5	2	1	-1	1749779458	1749779458	0	0	684b84029f4b5	31	
935	2	appdata_oc9xft3m2oht/preview/c/4/0/1/5/b	f1a858723046b3bfd3bb8246ea40c52a	934	b	2	1	-1	1749779458	1749779458	0	0	684b84029c296	31	
936	2	appdata_oc9xft3m2oht/preview/c/4/0/1/5/b/7	b4b2a9e5d67f5a42b39617c2a39da67e	935	7	2	1	-1	1749779458	1749779458	0	0	684b84029a9a2	31	
937	2	appdata_oc9xft3m2oht/preview/c/4/0/1/5/b/7/923	49410a3be2d47162000ae48406ec8c23	936	923	2	1	0	1749779458	1749779458	0	0	684b8402985fd	31	
938	2	appdata_oc9xft3m2oht/appstore/future-apps.json	096157881f386ea5f760127b7e4d5fce	65	future-apps.json	21	3	1751274	1749886274	1749886274	0	0	b1d47a8b60339aa6a9408f884e71d59d	27	
65	2	appdata_oc9xft3m2oht/appstore	986b873e722385f0d4213d578e407337	59	appstore	2	1	0	1749886274	1749886274	0	0	683ab2b4bf199	31	
\.


--
-- Data for Name: oc_filecache_extended; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_filecache_extended (fileid, metadata_etag, creation_time, upload_time) FROM stdin;
538	\N	0	1749050623
623	\N	0	1749254767
633	\N	0	1749266898
326	\N	0	1748680790
634	\N	0	1749266902
635	\N	0	1749266906
660	\N	0	1749454549
339	\N	0	1748680817
870	\N	0	1749655720
885	\N	0	1749657223
893	\N	0	1749747565
922	\N	0	1749749344
923	\N	0	1749749347
787	\N	0	1749626435
451	\N	0	1748851346
473	\N	0	1748739718
43	\N	0	1748925730
818	\N	0	1749655705
821	\N	0	1749655705
843	\N	0	1749655709
847	\N	0	1749655710
746	\N	0	1749571211
\.


--
-- Data for Name: oc_files_metadata; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_files_metadata (id, file_id, "json", sync_token, last_update) FROM stdin;
1	39	{"photos-original_date_time":{"value":1748677283,"type":"int","etag":"","indexed":true,"editPermission":0}}	noA6QWh	2025-05-31 07:41:23
4	50	{"photos-original_date_time":{"value":1444907264,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-exif":{"value":{"ExposureTime":"1\\/320","FNumber":"4\\/1","ExposureProgram":3,"ISOSpeedRatings":640,"UndefinedTag__x____":640,"ExifVersion":"0230","DateTimeOriginal":"2015:10:15 11:07:44","DateTimeDigitized":"2015:10:15 11:07:44","ShutterSpeedValue":"27970\\/3361","ApertureValue":"4\\/1","ExposureBiasValue":"1\\/3","MaxApertureValue":"4\\/1","MeteringMode":5,"Flash":16,"FocalLength":"200\\/1","SubSecTimeOriginal":"63","SubSecTimeDigitized":"63","ColorSpace":1,"ExifImageWidth":1600,"ExifImageLength":1067,"FocalPlaneXResolution":"1600\\/1","FocalPlaneYResolution":"1600\\/1","FocalPlaneResolutionUnit":3,"CustomRendered":0,"ExposureMode":0,"WhiteBalance":0,"SceneCaptureType":0,"UndefinedTag__xA___":"000084121f"},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":{"Make":"Canon","Model":"Canon EOS 5D Mark III","Orientation":1,"XResolution":"240\\/1","YResolution":"240\\/1","ResolutionUnit":2,"Software":"Adobe Photoshop Lightroom 6.2.1 (Macintosh)","DateTime":"2015:10:16 14:40:21","Exif_IFD_Pointer":230},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-size":{"value":{"width":1600,"height":1067},"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":"L6CQO}~V4?B,~jQp4XTc00EMi6vo","type":"string","etag":"9ae76311cdb360dc46f4e82b1fe2ffbc","indexed":false,"editPermission":0}}	gLFEBqL	2025-05-31 07:45:25
5	51	{"photos-original_date_time":{"value":1372319469,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-exif":{"value":{"ExposureTime":"1\\/160","FNumber":"4\\/1","ExposureProgram":3,"ISOSpeedRatings":100,"ExifVersion":"0230","DateTimeOriginal":"2013:06:27 07:51:09","DateTimeDigitized":"2013:06:27 07:51:09","ComponentsConfiguration":"","ShutterSpeedValue":"59\\/8","ApertureValue":"4\\/1","ExposureBiasValue":"2\\/3","MaxApertureValue":"4\\/1","MeteringMode":5,"Flash":16,"FocalLength":"45\\/1","SubSecTime":"00","SubSecTimeOriginal":"00","SubSecTimeDigitized":"00","FlashPixVersion":"0100","ColorSpace":1,"ExifImageWidth":1200,"ExifImageLength":1800,"FocalPlaneXResolution":"382423\\/97","FocalPlaneYResolution":"185679\\/47","FocalPlaneResolutionUnit":2,"CustomRendered":0,"ExposureMode":0,"WhiteBalance":0,"SceneCaptureType":0,"UndefinedTag__xA___":"000052602c"},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":{"Make":"Canon","Model":"Canon EOS 5D Mark III","Orientation":1,"XResolution":"72\\/1","YResolution":"72\\/1","ResolutionUnit":2,"Software":"Aperture 3.4.5","DateTime":"2013:06:27 07:51:09","Exif_IFD_Pointer":202},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-size":{"value":{"width":1200,"height":1800},"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":"LZJ$~jNyIqj]u6SPWBoM76s:oJj]","type":"string","etag":"43e03c236cdc692a8005ae7d6878fe3b","indexed":false,"editPermission":0}}	bz2yjcC	2025-05-31 07:45:26
6	52	{"photos-original_date_time":{"value":1341064060,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-exif":{"value":{"ExposureTime":"1\\/640","FNumber":"28\\/5","ExposureProgram":1,"ISOSpeedRatings":12800,"ExifVersion":"0230","DateTimeOriginal":"2012:06:30 13:47:40","DateTimeDigitized":"2012:06:30 13:47:40","ComponentsConfiguration":"","ShutterSpeedValue":"75\\/8","ApertureValue":"5\\/1","ExposureBiasValue":"0\\/1","MaxApertureValue":"6149\\/1087","MeteringMode":5,"Flash":16,"FocalLength":"235\\/1","SubSecTime":"00","SubSecTimeOriginal":"00","SubSecTimeDigitized":"00","FlashPixVersion":"0100","ExifImageWidth":1600,"ExifImageLength":1067,"FocalPlaneXResolution":"382423\\/97","FocalPlaneYResolution":"134321\\/34","FocalPlaneResolutionUnit":2,"CustomRendered":0,"ExposureMode":1,"WhiteBalance":0,"SceneCaptureType":0},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":{"Make":"Canon","Model":"Canon EOS 5D Mark III","Orientation":1,"XResolution":"72\\/1","YResolution":"72\\/1","ResolutionUnit":2,"Software":"Aperture 3.3.1","DateTime":"2012:06:30 13:47:40","Exif_IFD_Pointer":202},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-size":{"value":{"width":1600,"height":1067},"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":"L87_1d~qM|Io%gt7oMxuE1M{%M?b","type":"string","etag":"3f36444fc835b5c5bfa2d8d4977bddb3","indexed":false,"editPermission":0}}	OE3GHyX	2025-05-31 07:45:26
7	53	{"photos-original_date_time":{"value":1748677285,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-size":{"value":{"width":3000,"height":2000},"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":"LKECzlxa8_s..8t6Mwt7~qWAadxu","type":"string","etag":"bd429e032abc40f94695f1e37475cbea","indexed":false,"editPermission":0}}	JEVe5nd	2025-05-31 07:45:27
41	818	{"photos-size":{"value":{"width":3000,"height":4000},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1749655705,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"LIG[.w%M?axw~q%Mt8of-=t8Rjs:","type":"string","etag":"ac0f71d636d76ad8a40bd1f3597ddce5","indexed":false,"editPermission":0}}	HnvaKlV	2025-06-11 15:30:03
42	821	{"photos-size":{"value":{"width":3000,"height":4000},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1749655705,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"LbIXdP%~xaxu8xNHbvni~VtRW?ae","type":"string","etag":"854459761dd8b1bf07307af1468b35f0","indexed":false,"editPermission":0}}	S1SX9qC	2025-06-11 15:30:03
44	847	{"photos-size":{"value":{"width":3000,"height":4000},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1749655710,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"LLIE^WoMoft7~qj]WBj[NFoyf8t7","type":"string","etag":"71bc240113e6bd2a25d9ed90be5cdaf2","indexed":false,"editPermission":0}}	rl6arCc	2025-06-11 15:30:05
2	41	{"photos-original_date_time":{"value":1748677283,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-size":{"value":{"width":500,"height":500},"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":"LKBPq}iu9bfm.TayRlj[04ae-nbI","type":"string","etag":"7ce07eb6d792976da2cbe199904ef584","indexed":false,"editPermission":0}}	N1WQavo	2025-05-31 07:45:24
3	49	{"photos-original_date_time":{"value":1526500980,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-exif":{"value":{"ExposureTime":"10\\/12500","FNumber":"35\\/10","ExposureProgram":3,"ISOSpeedRatings":100,"DateTimeOriginal":"2018:05:16 20:03:00","DateTimeDigitized":"2018:05:16 20:03:00","ExposureBiasValue":"0\\/6","MaxApertureValue":"30\\/10","MeteringMode":5,"LightSource":0,"Flash":16,"FocalLength":"700\\/10","MakerNote":"Nikon","UserComment":"Christoph WurstCC-SA 4.0","SubSecTime":"30","SubSecTimeOriginal":"30","SubSecTimeDigitized":"30","ColorSpace":1,"SensingMethod":2,"FileSource":"","SceneType":"","CustomRendered":0,"ExposureMode":0,"WhiteBalance":0,"DigitalZoomRatio":"1\\/1","FocalLengthIn__mmFilm":70,"SceneCaptureType":0,"GainControl":0,"Contrast":1,"Saturation":0,"Sharpness":1,"SubjectDistanceRange":0},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":{"ImageDescription":"Christoph WurstCC-SA 4.0","Make":"NIKON CORPORATION","Model":"NIKON D610","Orientation":1,"XResolution":"72\\/1","YResolution":"72\\/1","ResolutionUnit":2,"Software":"GIMP 2.10.14","DateTime":"2019:12:10 08:51:16","Artist":"Christoph Wurst                     ","Copyright":"Christoph Wurst                                       ","Exif_IFD_Pointer":402,"GPS_IFD_Pointer":13738,"DateTimeOriginal":"2018:05:16 20:03:00"},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-size":{"value":{"width":1920,"height":1281},"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":"LXCigUWB0ft6~VWB9Gs:-;WBMxof","type":"string","etag":"c0b8b0a930de0e07e9597e4577f732d7","indexed":false,"editPermission":0}}	abIKNi4	2025-05-31 07:45:25
8	54	{"photos-original_date_time":{"value":1341258636,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-exif":{"value":{"ExposureTime":"1\\/80","FNumber":"4\\/1","ExposureProgram":3,"ISOSpeedRatings":400,"ExifVersion":"0230","DateTimeOriginal":"2012:07:02 19:50:36","DateTimeDigitized":"2012:07:02 19:50:36","ComponentsConfiguration":"","ShutterSpeedValue":"51\\/8","ApertureValue":"4\\/1","ExposureBiasValue":"0\\/1","MaxApertureValue":"4\\/1","MeteringMode":5,"Flash":16,"FocalLength":"32\\/1","SubSecTime":"00","SubSecTimeOriginal":"00","SubSecTimeDigitized":"00","FlashPixVersion":"0100","ColorSpace":1,"ExifImageWidth":1600,"ExifImageLength":1066,"FocalPlaneXResolution":"382423\\/97","FocalPlaneYResolution":"185679\\/47","FocalPlaneResolutionUnit":2,"CustomRendered":0,"ExposureMode":0,"WhiteBalance":0,"SceneCaptureType":0},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":{"Make":"Canon","Model":"Canon EOS 5D Mark III","Orientation":1,"XResolution":"72\\/1","YResolution":"72\\/1","ResolutionUnit":2,"Software":"GIMP 2.8.0","DateTime":"2012:07:02 22:06:14","Exif_IFD_Pointer":198},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-size":{"value":{"width":1600,"height":1066},"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":"L4J*xMx]00~qnfoM%Mof9XjFoMD*","type":"string","etag":"0d88b2f8eec458abde3f1b2cc5c46e62","indexed":false,"editPermission":0}}	LOQXwf7	2025-05-31 07:45:27
10	57	{"photos-original_date_time":{"value":1341072915,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-exif":{"value":{"ExposureTime":"1\\/500","FNumber":"28\\/5","ExposureProgram":1,"ISOSpeedRatings":8000,"ExifVersion":"0230","DateTimeOriginal":"2012:06:30 16:15:15","DateTimeDigitized":"2012:06:30 16:15:15","ComponentsConfiguration":"","ShutterSpeedValue":"9\\/1","ApertureValue":"5\\/1","ExposureBiasValue":"0\\/1","MaxApertureValue":"6149\\/1087","MeteringMode":5,"Flash":16,"FocalLength":"280\\/1","SubSecTime":"00","SubSecTimeOriginal":"00","SubSecTimeDigitized":"00","FlashPixVersion":"0100","ColorSpace":1,"ExifImageWidth":1600,"ExifImageLength":1067,"FocalPlaneXResolution":"382423\\/97","FocalPlaneYResolution":"134321\\/34","FocalPlaneResolutionUnit":2,"CustomRendered":0,"ExposureMode":1,"WhiteBalance":0,"SceneCaptureType":0},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":{"Make":"Canon","Model":"Canon EOS 5D Mark III","Orientation":1,"XResolution":"72\\/1","YResolution":"72\\/1","ResolutionUnit":2,"Software":"Aperture 3.3.1","DateTime":"2012:06:30 16:15:15","Exif_IFD_Pointer":202},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-size":{"value":{"width":1600,"height":1067},"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":"LRFEu.MxI[Ip~AR*WDj@Iqj[xZxY","type":"string","etag":"294d83ad3e88027b929e97acafa4e6df","indexed":false,"editPermission":0}}	ty5ZMM7	2025-05-31 07:45:28
9	56	{"photos-original_date_time":{"value":1341059531,"type":"int","etag":"","indexed":true,"editPermission":0},"photos-exif":{"value":{"ExposureTime":"1\\/125","FNumber":"28\\/5","ExposureProgram":3,"ISOSpeedRatings":320,"UndefinedTag__x____":320,"ExifVersion":"0230","DateTimeOriginal":"2012:06:30 12:32:11","DateTimeDigitized":"2012:06:30 12:32:11","ComponentsConfiguration":"","ShutterSpeedValue":"7\\/1","ApertureValue":"5\\/1","ExposureBiasValue":"0\\/1","MaxApertureValue":"189284\\/33461","MeteringMode":5,"Flash":16,"FocalLength":"280\\/1","SubSecTime":"83","SubSecTimeOriginal":"83","SubSecTimeDigitized":"83","FlashPixVersion":"0100","ColorSpace":1,"ExifImageWidth":1600,"ExifImageLength":1067,"FocalPlaneXResolution":"1920000\\/487","FocalPlaneYResolution":"320000\\/81","FocalPlaneResolutionUnit":2,"CustomRendered":0,"ExposureMode":0,"WhiteBalance":0,"SceneCaptureType":0,"UndefinedTag__xA___":"0000000000"},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":{"Make":"Canon","Model":"Canon EOS 5D Mark III","Orientation":1,"XResolution":"72\\/1","YResolution":"72\\/1","ResolutionUnit":2,"DateTime":"2012:06:30 12:32:11","Exif_IFD_Pointer":174},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-size":{"value":{"width":1600,"height":1067},"type":"array","etag":"","indexed":false,"editPermission":0},"blurhash":{"value":"LKINpnRO4:RP_NnNIoV[%zRPNH%1","type":"string","etag":"1156cc948154ce9352c409551cc02d84","indexed":false,"editPermission":0}}	tqpHaRQ	2025-05-31 07:45:27
34	326	{"photos-exif":{"value":{"ISOSpeedRatings":332,"ExposureProgram":2,"UndefinedTag__xA___":"163","FNumber":"189\\/100","ExposureTime":"1\\/50","UndefinedTag__x___A":"","UndefinedTag__x____":0,"SensingMethod":1,"SubSecTimeDigitized":"506","SubSecTimeOriginal":"506","SubSecTime":"506","FocalLength":"5430\\/1000","Flash":16,"LightSource":21,"MeteringMode":2,"SceneCaptureType":0,"InteroperabilityOffset":5387,"FocalLengthIn__mmFilm":25,"MaxApertureValue":"183\\/100","DateTimeDigitized":"2025:05:31 14:15:47","ExposureBiasValue":"0\\/6","ExifImageLength":3472,"WhiteBalance":0,"DateTimeOriginal":"2025:05:31 14:15:47","BrightnessValue":"89\\/100","ExifImageWidth":4640,"ExposureMode":0,"ApertureValue":"183\\/100","ComponentsConfiguration":"","ColorSpace":1,"SceneType":"","ShutterSpeedValue":"5643\\/1000","ExifVersion":"0220","FlashPixVersion":"0100"},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":{"ImageWidth":4640,"Model":"Redmi Note 9 Pro","ImageLength":3472,"Orientation":6,"DateTime":"2025:05:31 14:15:47","YCbCrPositioning":1,"Exif_IFD_Pointer":218,"ResolutionUnit":2,"GPS_IFD_Pointer":5417,"XResolution":"72\\/1","YResolution":"72\\/1","Make":"Xiaomi"},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-size":{"value":{"width":3472,"height":4640},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1748700947,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"L2K-wWMe00_2Y+_L?uof00IT?]M{","type":"string","etag":"7a2b24f81410914294471d7be5c095bf","indexed":false,"editPermission":0}}	K7vVFEF	2025-05-31 08:40:03
35	339	{"photos-exif":{"value":{"ExifVersion":"0220","ApertureValue":"183\\/100","SceneType":"","ExposureBiasValue":"0\\/6","ExposureProgram":2,"ColorSpace":1,"MaxApertureValue":"183\\/100","ExifImageLength":3000,"BrightnessValue":"-1\\/100","DateTimeOriginal":"2025:05:31 15:40:09","FlashPixVersion":"0100","SubSecTimeOriginal":"532392","WhiteBalance":0,"InteroperabilityOffset":702,"ExposureMode":0,"ExposureTime":"1\\/33","Flash":16,"SubSecTime":"559","FNumber":"189\\/100","ExifImageWidth":4000,"ISOSpeedRatings":203,"ComponentsConfiguration":"","FocalLengthIn__mmFilm":25,"SubSecTimeDigitized":"532392","DateTimeDigitized":"2025:05:31 15:40:09","ShutterSpeedValue":"5058\\/1000","MeteringMode":1,"FocalLength":"5430\\/1000","SceneCaptureType":0,"LightSource":21,"SensingMethod":1},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-ifd0":{"value":{"YResolution":"72\\/1","XResolution":"72\\/1","ImageWidth":4000,"Model":"Redmi Note 9 Pro","ImageLength":3000,"Make":"Xiaomi","YCbCrPositioning":1,"Exif_IFD_Pointer":206,"Orientation":6,"ResolutionUnit":2,"DateTime":"2025:05:31 15:40:09"},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-size":{"value":{"width":3000,"height":4000},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1748706009,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"LHCj2}-;9FWBaJM{D%ay~pt7IUWB","type":"string","etag":"e5a6c4983124a033b9b7fe1925e68232","indexed":false,"editPermission":0}}	TH8WXsP	2025-05-31 08:45:03
36	623	{"photos-size":{"value":{"width":960,"height":1280},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1749254764,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"L5C$ly~902yD1T4:~8n+0gD%w@RP","type":"string","etag":"88fa3a73e077ce0ee57f685603fd1b1c","indexed":false,"editPermission":0}}	r7UMw4J	2025-06-07 00:10:02
37	633	{"photos-size":{"value":{"width":752,"height":452},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1749266896,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"LBSPX}_2_1kE~oM|Roxt%FRnNLt5","type":"string","etag":"437b19b2009d688991247058ae97b1ca","indexed":false,"editPermission":0}}	ogCPoTu	2025-06-07 03:30:02
38	634	{"photos-size":{"value":{"width":752,"height":452},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1749266901,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"LIS6SwRn^*~o-;a|ofof~U%LD+9H","type":"string","etag":"076bdd7d593e32e3d8f7381904ce7354","indexed":false,"editPermission":0}}	JsOVu3o	2025-06-07 03:30:02
39	635	{"photos-size":{"value":{"width":752,"height":452},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1749266905,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"LPR{+2E3xt~o?HxaWVM|xp%1WEIV","type":"string","etag":"83e664c6e47c440160c5de30271f29b7","indexed":false,"editPermission":0}}	1BDQI32	2025-06-07 03:30:03
40	746	{"photos-original_date_time":{"value":1749429073,"type":"int","etag":"","indexed":true,"editPermission":0}}	J6fEnwK	2025-06-10 16:00:12
43	843	{"photos-size":{"value":{"width":3000,"height":4000},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1749655709,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"LAGS7P~qWA%M00M{D%D%00IUoMM_","type":"string","etag":"5efa9416232d47f61883443afa9d493d","indexed":false,"editPermission":0}}	B6UkW6n	2025-06-11 15:30:04
45	870	{"photos-size":{"value":{"width":3000,"height":4000},"type":"array","etag":"","indexed":false,"editPermission":0},"photos-original_date_time":{"value":1749655720,"type":"int","etag":"","indexed":true,"editPermission":0},"blurhash":{"value":"L5F6IMBZ-r~900#4VtOu00A24.R3","type":"string","etag":"526e1447156203b1871ad25ca7cf2d8e","indexed":false,"editPermission":0}}	HoEYuAT	2025-06-11 15:30:06
\.


--
-- Data for Name: oc_files_metadata_index; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_files_metadata_index (id, file_id, meta_key, meta_value_string, meta_value_int) FROM stdin;
1	39	photos-original_date_time	\N	1748677283
34	41	photos-original_date_time	\N	1748677283
35	49	photos-original_date_time	\N	1526500980
36	50	photos-original_date_time	\N	1444907264
37	51	photos-original_date_time	\N	1372319469
38	52	photos-original_date_time	\N	1341064060
39	53	photos-original_date_time	\N	1748677285
40	54	photos-original_date_time	\N	1341258636
41	56	photos-original_date_time	\N	1341059531
42	57	photos-original_date_time	\N	1341072915
68	326	photos-original_date_time	\N	1748700947
70	339	photos-original_date_time	\N	1748706009
72	623	photos-original_date_time	\N	1749254764
76	633	photos-original_date_time	\N	1749266896
77	634	photos-original_date_time	\N	1749266901
78	635	photos-original_date_time	\N	1749266905
79	746	photos-original_date_time	\N	1749429073
85	818	photos-original_date_time	\N	1749655705
86	821	photos-original_date_time	\N	1749655705
87	843	photos-original_date_time	\N	1749655709
88	847	photos-original_date_time	\N	1749655710
89	870	photos-original_date_time	\N	1749655720
\.


--
-- Data for Name: oc_files_reminders; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_files_reminders (id, user_id, file_id, due_date, updated_at, created_at, notified) FROM stdin;
\.


--
-- Data for Name: oc_files_trash; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_files_trash (auto_id, id, "user", "timestamp", location, type, mime, deleted_by) FROM stdin;
1	Nextcloud.png	x79	1748679801	.	\N	\N	x79
2	Nextcloud Manual.pdf	x79	1748679801	.	\N	\N	x79
3	Readme.md	x79	1748679801	.	\N	\N	x79
4	Reasons to use Nextcloud.pdf	x79	1748679801	.	\N	\N	x79
5	Nextcloud intro.mp4	x79	1748679801	.	\N	\N	x79
6	Templates credits.md	x79	1748679802	.	\N	\N	x79
\.


--
-- Data for Name: oc_files_versions; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_files_versions (id, file_id, "timestamp", size, mimetype, metadata) FROM stdin;
22	25	1748677280	340061	5	{"author":"x79"}
2	5	1748677276	868111	5	{"author":"x79"}
92	623	1749254764	749717	15	{"author":"x79"}
3	6	1748677277	14316	6	{"author":"x79"}
23	26	1748677280	554	11	{"author":"x79"}
4	7	1748677277	23359	7	{"author":"x79"}
48	53	1748677285	797325	17	{"author":"x79"}
5	8	1748677277	30354	5	{"author":"x79"}
24	27	1748677281	17276	5	{"author":"x79"}
6	9	1748677277	52843	8	{"author":"x79"}
7	10	1748677277	317015	6	{"author":"x79"}
25	28	1748677281	3509628	6	{"author":"x79"}
8	11	1748677277	27629	7	{"author":"x79"}
9	12	1748677278	15961	5	{"author":"x79"}
26	29	1748677281	30780	7	{"author":"x79"}
10	13	1748677278	13653	9	{"author":"x79"}
11	14	1748677278	45778	7	{"author":"x79"}
27	30	1748677281	326	11	{"author":"x79"}
12	15	1748677278	13878	9	{"author":"x79"}
13	16	1748677278	16988	9	{"author":"x79"}
93	633	1749266896	12409	15	{"author":"x79"}
28	31	1748677281	25621	7	{"author":"x79"}
14	17	1748677279	31132	7	{"author":"x79"}
49	54	1748677286	2170375	17	{"author":"x79"}
15	18	1748677279	13378	8	{"author":"x79"}
29	32	1748677282	30671	7	{"author":"x79"}
16	19	1748677279	573	11	{"author":"x79"}
40	44	1748677284	1095	11	{"author":"x79"}
17	20	1748677279	30290	7	{"author":"x79"}
30	33	1748677282	31325	7	{"author":"x79"}
18	21	1748677279	11836	9	{"author":"x79"}
19	22	1748677280	14810	6	{"author":"x79"}
20	23	1748677280	35657	7	{"author":"x79"}
31	34	1748677282	39404	5	{"author":"x79"}
21	24	1748677280	5155877	5	{"author":"x79"}
41	45	1748677284	136	11	{"author":"x79"}
32	35	1748677282	81196	6	{"author":"x79"}
50	55	1748677286	150	11	{"author":"x79"}
33	36	1748677282	13441	8	{"author":"x79"}
42	46	1748677284	23876	16	{"author":"x79"}
34	37	1748677282	88394	8	{"author":"x79"}
94	634	1749266901	9731	15	{"author":"x79"}
51	56	1748677286	593508	17	{"author":"x79"}
44	49	1748677285	427030	17	{"author":"x79"}
45	50	1748677285	167989	17	{"author":"x79"}
52	57	1748677286	457744	17	{"author":"x79"}
46	51	1748677285	567689	17	{"author":"x79"}
67	295	1748679343	0	11	{"author":"x79"}
47	52	1748677285	474653	17	{"author":"x79"}
68	326	1748680790	2320888	17	{"author":"x79"}
69	339	1748680817	2911727	17	{"author":"x79"}
95	635	1749266905	7895	15	{"author":"x79"}
96	660	1749454549	24	68	{"author":"x79"}
86	43	1748739718	1101951	4	[]
87	451	1748850106	122609	16	{"author":"x79"}
88	43	1748925730	1105340	4	{"author":"x79"}
91	538	1749050623	400089	4	{"author":"x79"}
97	746	1749429073	739749585	13	{"author":"x79"}
98	787	1749626391	405509973	19	{"author":"x79"}
99	818	1749655705	4420761	17	{"author":"x79"}
100	821	1749655705	4657410	17	{"author":"x79"}
101	843	1749655709	5230044	17	{"author":"x79"}
102	847	1749655710	4980602	17	{"author":"x79"}
103	870	1749655720	5302195	17	{"author":"x79"}
104	885	1749657223	3184147	4	{"author":"x79"}
105	893	1749706637	75264	73	{"author":"x79"}
106	922	1749749259	202865	4	{"author":"x79"}
107	923	1749749292	76288	73	{"author":"x79"}
\.


--
-- Data for Name: oc_flow_checks; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_flow_checks (id, class, operator, value, hash) FROM stdin;
\.


--
-- Data for Name: oc_flow_operations; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_flow_operations (id, class, name, checks, operation, entity, events) FROM stdin;
\.


--
-- Data for Name: oc_flow_operations_scope; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_flow_operations_scope (id, operation_id, type, value) FROM stdin;
\.


--
-- Data for Name: oc_group_admin; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_group_admin (gid, uid) FROM stdin;
\.


--
-- Data for Name: oc_group_user; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_group_user (gid, uid) FROM stdin;
admin	x79
\.


--
-- Data for Name: oc_groups; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_groups (gid, displayname) FROM stdin;
admin	admin
\.


--
-- Data for Name: oc_jobs; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_jobs (id, class, argument, last_run, last_checked, reserved_at, execution_duration, argument_hash, time_sensitive) FROM stdin;
175	OCA\\Talk\\BackgroundJob\\ExpireSignalingMessage	null	1749888301	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
35	OCA\\AppAPI\\BackgroundJob\\ExAppInitStatusCheckJob	null	1749888600	1749888600	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
13	OCA\\DAV\\BackgroundJob\\EventReminderJob	null	1749888301	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
33	OCA\\Notifications\\BackgroundJob\\GenerateUserSettings	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
24	OCA\\Files\\BackgroundJob\\ScanFiles	null	1749888301	1749888901	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
1	OCA\\Support\\BackgroundJobs\\CheckSubscription	null	1749888301	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
36	OCA\\AppAPI\\BackgroundJob\\ProvidersAICleanUpJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
22	OCA\\FilesReminders\\BackgroundJob\\ScheduledNotifications	null	1749888600	1749888600	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
38	OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash	null	1749888302	1749890102	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
34	OCA\\Notifications\\BackgroundJob\\SendNotificationMails	null	1749888601	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
16	OCA\\UpdateNotification\\BackgroundJob\\UpdateAvailableNotifications	null	1749882302	1749968702	0	102	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
40	OC\\Authentication\\Token\\TokenCleanupJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
9	OCA\\Circles\\Cron\\Maintenance	null	1749888601	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
30	OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob	null	1749888600	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
3	OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
19	OCA\\Files_Sharing\\SharesReminderJob	null	1749886201	1749889801	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
4	OCA\\Federation\\SyncJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
25	OCA\\Files\\BackgroundJob\\DeleteOrphanedItems	null	1749886201	1749889801	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
12	OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
18	OCA\\Files_Sharing\\ExpireSharesJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
20	OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
14	OCA\\DAV\\BackgroundJob\\CalendarRetentionJob	null	1749882404	1749904004	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
23	OCA\\NextcloudAnnouncements\\Cron\\Crawler	null	1749882405	1749971025	0	1	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
172	OCA\\Talk\\BackgroundJob\\CheckMatterbridges	null	1749888301	1749889201	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
42	OC\\Preview\\BackgroundCleanupJob	null	1749886200	1749889800	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
31	OCA\\ServerInfo\\Jobs\\UpdateStorageStats	null	1749882302	1749893102	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
8	OCA\\Activity\\BackgroundJob\\RemoveFormerActivitySettings	null	1749882302	1749968702	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
17	OCA\\Files_Sharing\\DeleteOrphanedSharesJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
11	OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob	null	1749886201	1749889801	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
171	OCA\\Talk\\BackgroundJob\\CheckHostedSignalingServer	null	1749886201	1749889801	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
10	OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
7	OCA\\Activity\\BackgroundJob\\DigestMail	null	1749886201	1749889801	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
21	OCA\\FilesReminders\\BackgroundJob\\CleanUpReminders	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
44	OC\\User\\BackgroundJobs\\CleanupDeletedUsers	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
39	OCA\\OAuth2\\BackgroundJob\\CleanupExpiredAuthorizationCode	null	1748677522	1749909902	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
37	OCA\\WorkflowEngine\\BackgroundJobs\\Rotate	null	1749882302	1749893102	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
6	OCA\\Activity\\BackgroundJob\\ExpireActivities	null	1749882302	1749968702	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
179	OCA\\Talk\\BackgroundJob\\RemoveEmptyRooms	null	1749888301	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
32	OCA\\Files_Versions\\BackgroundJob\\ExpireVersions	null	1749888600	1749888600	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
177	OCA\\Talk\\BackgroundJob\\MaximumCallDuration	null	1749888600	1749888600	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
178	OCA\\Talk\\BackgroundJob\\Reminder	null	1749888600	1749888600	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
41	OC\\Log\\Rotate	null	1749888600	1749888600	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
181	OCA\\Talk\\BackgroundJob\\RetryNotificationsJob	null	1749888600	1749888600	0	1	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
180	OCA\\Talk\\BackgroundJob\\ResetAssignedSignalingServer	null	1749888301	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
176	OCA\\Talk\\BackgroundJob\\LockInactiveRooms	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
29	OCA\\Text\\Cron\\Cleanup	null	1749888301	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
26	OCA\\Files\\BackgroundJob\\CleanupFileLocks	null	1749888302	1749888602	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
100	OCA\\Mail\\BackgroundJob\\OutboxWorkerJob	null	1749888302	1749888602	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
5	OCA\\Activity\\BackgroundJob\\EmailNotification	null	1749888601	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
174	OCA\\Talk\\BackgroundJob\\ExpireChatMessages	null	1749888302	1749888602	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
104	OCA\\Mail\\BackgroundJob\\WakeJob	null	1749888601	1749888601	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
102	OCA\\Mail\\BackgroundJob\\DraftsJob	null	1749888302	1749888602	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
27	OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens	null	1749888302	1749889202	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
98	OCA\\Contacts\\Cron\\SocialUpdateRegistration	null	1749887701	1750060801	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
101	OCA\\Mail\\BackgroundJob\\IMipMessageJob	null	1749886201	1749889801	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	1
28	OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor	null	1749882404	1749925604	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
2	OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
103	OCA\\Mail\\BackgroundJob\\TrashRetentionJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
97	OCA\\Calendar\\BackgroundJob\\CleanUpOutdatedBookingsJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
99	OCA\\Mail\\BackgroundJob\\CleanupJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
15	OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
43	OC\\TextProcessing\\RemoveOldTasksBackgroundJob	null	1749882404	1749968804	0	0	74234e98afe7498fb5daf1f36ac2d78acc339464f950703b8c019892f982b90b	0
\.


--
-- Data for Name: oc_known_users; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_known_users (id, known_to, known_user) FROM stdin;
\.


--
-- Data for Name: oc_login_flow_v2; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_login_flow_v2 (id, "timestamp", started, poll_token, login_token, public_key, private_key, client_name, login_name, server, app_password) FROM stdin;
2	1748678169	0	eb9f4c944197387c22dcadcdb18348563ed376037a455d6987acc500115c1c1610499ba249aea833892a46aec7c15c75b65499715c496f5c9aecf2801173e8bc	3xa0jKWqH2bf8rtVT18kqu2UE07NEBW8Slfnw1VSSGzUSC34QYkRiWhqGK6kZcKivHwcaGYDg2D93ZcTimSu8ItV7ESp8cr2OvQFEh2rL0DiEn0F7ejjHrx9BcKLCQqX	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjNiJSoeDALjdW7Mf+vqa\nxv1Xpa/AOr3v9ralas3hFzDRcKe99DgsT1ca82DcyGswzn8HanHoaYTluGy+Hzsk\n4AakpP27b2lp+na4UnVIRPj1vMwaCfnSnNxmpSit+AO8MyNdZMuVQdhVM3uZaeTH\nWnhl0zGKDdn0At51h/9Rs8midktJ5+YtZIYB5t6ylvyiSEX5WK3xLzRBtAgIOySG\nnXgCz8CyPAA4aUHRJvudj1HrfhY9eD45wxIjdxd7udP9SS1r6qhJ6JTekGqQtj3J\nOxCV6+RmUsjUn42hV4JvxldInIplQ/jJmsFax9HKyPeM/woRZsq8rQaIWNHP/AKG\n7QIDAQAB\n-----END PUBLIC KEY-----\n	e1de8f28bb6cd1377482c8603782f93f7f3045d4e9699ac59989ebc15109347da2bfb86abfb9eec611738f7f7d29ef9b6bc28355a0143a2923eb1b9ad321e0b0d0244e31649048c7539c377831295a02ffaa108f83f6d551c784bb292b1a85615c2dfaa9edd6b7a5c79054426a2828b8d13f55e777c93a9b4400f263899776cf71e7011d7790edcd966e065d18f4450e0d851413ca814451e010b95fec3ac0e4066bd0f54477c551aa155622d31c43748fc20cdbd4dded116a2c06762ad5e05b2f98d719e94a962c3fefa546559377e50cc6055b9b5fb64ea316f527394e3dd87a98ca45c2bdaaec4ceceb46723b4fb3a3f72785f5b8a25de04f33bc6452b9ef8dcb2d9ea425c70ffb326dccfbe26c35774fdb6c88d4ac6a9db84b696b99cfa91ca429a1262537a2b85fbc47fcd69055dfa661ec0d39091a045f6d781974db95a76002a40a3fceacf43ac9e5c82d4300120273a3cbf0aed6e56ac69efb0e9e169964a699c98bfc4cfdf9e0a2ecbf47bcd160541c3e4288f2b10e4857356ffb822455319b211244daa70e9b0e4cb7a0523a1a997cd0ab249a7b0a45f87ec66e2918e3875025b60650ca153bcd5bd1c1aec6916711f63ff9393c95f088d5d9d5badc621b955e06ce1437a9995418ce47ca58d48fe5e06f813eae609201b31881e99262863c7afad76cf3e33ac61b91c4b007a5f805d4f9cc94027f9ed76f88707c513c2f0d3e42c17e94877de5f9603dd3b761d0d30673e6b1bf8bf37bc0ea971a59cf6896dcfd0d12f6ab6b66cf97637f4832f886183b88d48cc5ce975a0789431ebf4fb5f7f4cef6f2d98a7fa25de5523d8bae2d330fcd9b69934b2bcea4d6a2281561fd29e634d202c21b82e81a713c4040aa45505ba8c750de6933d739d24e4444bcbd1123a4cc2cd517a73e49ecdc1a4ad2d99c33c35bf0fbd16dbb09663dc45100fa6476ce7adab45c013182000eb7ed67d6e837ae2240a9529b374b529f551093df6a14309728d3fabeb1d2b99a78a0c9ddb4084d15644004b4f83e2c1baba038ef415fa5c0a39e292a265dfdddb7042b2ec98c1664b26e46f9b8a313734e759ae193d9209d75742845fb4c123507bba2d167158bea30e6341e74afdc3e4ea8af396aca5c2e90185490a02b05778b29b45b22d626172157bc9124b1d0c8907411121233e9a890d20480b465fea271440da708710d6f81fa6717735e13bf279914509c9e532d31b976a531ffcd10ca7ae9b410df1c8da8d85c5af3c628cecdfb7addeb61c3407a40fe623fca76bc0e2d0d86d33dfd4ee939b41fb63f6ef3eaf4e7631ad83688a32c9c3d3b9fefa8a2fbd096aeeb2982154b770f89a0bfa38aa0b0c6691289191fc8907c93be36c3d4e0cc74fc625b54a457a949a11b9a2ffb8db0f60b3655a2395ea81d110d2ea0743dcc76989064f0286c08dc847c34286bcd59014b93628398d38fe40b99e4e0a84d61c9d23b3ced49543b0f6d553cca2e880c3463e2be9c2b722d0d6504708bfd46a90e2ae3db3507713764caed69e23cfedbc24ae94a2314325683b14aadf047372b51adce546101b4876a496becd9d105735ed14bac2d45c593266f575a3be0c76180c97383f6e87b77045611498562e8ceb6eb4d94d53870e25bbc5c475189830c2533a2ca30aa4f14c7e7bdd03d0e9dacba5cb58f1074840abda867341eee467e8132c1402b74b67c139cfa2dd6531bf081c7e399e59e6d6236aa6bd5964a20f20a76b188fbb9d9d4bd7b38653af9244a46435211b80201ea25f6146f4e9aa897150d9467b0b033e510be54552ab57010962ce38fa5b7761def6450b4152429caa92227cb4a068c5e27b6fc2ac2ce19567f9247ae780de7919ebcf39c93e09f6a5f3bdf1cdb850558850c43c7c3f5018a94a79e74e76edc9bc6b23260e6c41b64d4308fbddd22b7d2c43c833c3be0186e3b67e27223770a52b4eeb4909e3a425a2a48139a075aaffb85b9545982dc5292a6216c80d707d1a22889822f316c226b0382f54a815b2e3318b82a34ea8c9ad51f7b280ed88796ae559179fd372271f6103c73e16541832a68a69665fc83eeb4ba08704167bea8482306aeda0fb7ebefc51fa5ac54ae5af7e3647035e364dd9f2dad539247a65b24267f945da70e112f0294ce061d8c1dca333a4bf54eff80000cf25b9582a19263d3020ae3bc06563ea27eee128b75e831e7d542ef4f3ef63f232ba9262579c3443a7fb7c384414f5eae6191d78316cc813b276dafc96e5df7c3c310c42e645fbe75213f828b30562b6081ff9d189ecc2c0fc4335c21ea099da94e407f4422c7caa67a7b66b2c148924d95983f1104fe5179b8a59da747d7eb3fcee2119cda994c6e69fb7582215e7b290708b9fd246c8acac76d3d0d4fb2a22a7544f24f13b02c9381da91e7|0321461206c249672f8eb7fe4b22b48d|f05d7f09ddfc84f0d6a7c25358e15a8941d5f6c8e9b89917b5ef6a2c317d8a5a49c2bf3f63eadf76cae5ef0296223bb1cbee31fa47fd77952d3c1cefce89df9c|3	PC (Desktop Client - Windows)	\N	\N	\N
3	1748678392	0	d906e74e791894593e85fcb10fc91c70b9cc7131e7cad6680d15f08802816d398355057028ac334905f09c474b28163cf6d85a72bff9e8a57117e851b3aac93c	u1aL981SYJ10W7KAKPTEXgoNXupews9P15RUT1nXFuDPKFEHVGM2Gv3DHWxj4uoTCBhU4Z03v76afcNcOD146PAFw2OqoM7ERWFxcB0LmZuHbRFfdtTelDQsXDft8LtL	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt+mABdM57z+xVkb7dN/L\nrcPrt6JU+3uHEGyP06DNVr+nV1ppmKHi6o+NdCF0KvtNRnI8gIWkC7HU3JALsVOz\nALzFhECWOn3fP9ydvMFiv71FWV8kLhZjerM5LZqFUKen+2yULQCZchtAJzJZSH4s\n9OqVZkMBPbDVeiu/nPDJ05nEffrUZy23ffDO7BoQC3hvmYTldbryxZwHhHOnT/nx\nvONgf6sl5xgDDqfqGnCwUrcQcVl8FF928r9se9+wq1xSueZu5LKt9A3UBZTBtRvE\ng8xjo42yzQR1CDTFuk1jtiWpQzUN6ThZy1jeI9hu8nByN0gnwh3xQ7tlLcC3S3xA\nPQIDAQAB\n-----END PUBLIC KEY-----\n	47365fd67b74c4ce26213a71415366ea9af613f2f3b1eae8389555d1d7f66487076076ea76bfa2fb9f01577737e0ef78821bd979cec206052a066af32939681f03abecb0a213bc6cb1e04995902fb363c243fad08bb662b12d56451f97ead504f651b30b4b52a554cd5cc1708ebc563eb38c356c6e6c4ae4ff0f9fa5c3554220f620f90e2ecfe9c388beb156f39ee71987fecfa069a693e326597a63c43c8ee14a0eb01287143928a86014663ec255cafd9c5bad00e88229cf753a308df9c37ddd35d354ab2e586b4fe20bebfaf4e3c7e8c45bd70c38ae256a679fa60538478776e3b890458a0de4b729511043f442d267d5626221abad795f170e7fd403c8646f8dc68cbbf581d3e5d6c10f78d7164b66336f3be5c0a7dd3ca58ac676cfe7626f7af6502f293f5935cdb414c5bd958d3b9fbe50a75da800be0792d1c17c85c2f6d587a1e9aad7e1007ab5ed7163977d3e581dee4b1ca02db0d09449c0c6f676256144724106673189e077f404b762f85556c235643e088f2d8dcff5d77e3f2a6eb9081dc4ea4a97e1d55b69e828320144d8747067f65a6b2908d5e6b234884447b77045fdf309fb1b9c839a38e75a5d0cf2b32fe3abffc1574ec4fd7a2224464e8f263df5040e25b670d8ef11fcc5a3b817ff087c9c08df8d62e7a2030df72b45244799b68f5e297536709894102ca5071446c1291cf6898cac662b8d739ba1dd8390ec7d2f3144bbfd4b75c533ad71c42f4185a086097c2983f73234246dd3a58e0bf69911c7933a9b2579d7b35fe78d403bebc6df6430fbc6a1244a5d43abfee4e6f0bead88c4f6887925db7baa141f8f56ef460b2567c49f72b95398f870627ff276d37832ca3032c59bd670e26101598b72276bc6dcc9faa65f5f927da9f1c4c2a1f54e8ba38a37bd48a4adce36839d593e6f14644ba1af403a5a10a147c7aca955f390899791f85bf827a1ca460b04563b4bf09068187176982f176bb1f7da92347cf9ab593d9320948dadb8248427fc67853cf714a4c4c78754a432522a51ee3735547d01ecaa4e8a6e0af5f75ccac21e67b13977cb83db8a5c30012c8314eaeeb0d5c51c9384e1f33e72a16ec6e9db90b551cafaf1839aa3a51c17bb4d286b66e7203288b6959aeac2e8c4e6d2195bbd7857cf4158949f0a05a40d5461068770a440a16ecb4ee20acde9c7fef3dbafbed15499655a1395a337b11c5a03e0014f1bbb88c7ef6f4ef2dadd3f56340f5156482f0229a0d41ce17e01976c03988011771993d1deee710d77211eaf56425d9219c47c31dec757547052a0ce4fcb5343ff44e014489f20c06c244112f4ec005e8813b09143b495ed3528a77e191ecb5f329ab6500fc78f51032def5ffa3950dbb66715332e39cadfa544b76d3830240fc16824cbb156abdf4f79dc0117d62d71f453878d345988bb3f8b736a273e162cfcf3866aadd4a3065ddf4790c1fdda7abe1704f4465ab5819405a716b69488c82a92b804a5f8b4156ad1da820bb8ddcd94d2dcdf98673120bedf680383e16ce3ff79999fd1570a5850e32dfd3f18600e0f13e661a18c2aee8e7583ed51b62c57602fef37c767bf36d3bcda63c1a3cd4207a985d7d04f32112f64260d6485550bcf43e95dee7ab11a83a26946093e00f1c534dc1bd9cbc1cdfb49c4a09ce798602af69bbe2ea1fa48221b8e3d8e89ba015afbb210808309de945561843b3140869d469f1102ba7ef3c0097225133d9cb67889d50a9b2aaa604848e7792ebc5bac765f83bc9bbd86dc2b12fa50e84465b7db40d14d139b7a093024edd4a3d9b9ce548a62be204873a889f98dcf3d0388fd6295b0a95fc97b9e0d975187715d98b402ac05fc811045d8fb51685dd86c1800172ef0d81d408be8652996d6b73508a16d49953d3d1e072ebb08af33be1f423d047f0fba93a9a80395830f776144dc8d51fa2820ff6a77bb7f51642e9c063c2f6b7e6f3e64486733bcf061070627ce80cf805bb185c0da55c1a51529f3a92587097667547b6137652b06c3c99e1fc375ced52b9ae7d62d346b509251da43dc40975d1f9a94619190b38f83da6bb3c6a10be3c430c1cde1322b0e8f2e8ed5d18ea676360f5e7c2e29672aea641bf3a2fa4be1fd26e5dc7afd3afd81fcaf12c530446c1fb77056012d51c04eb97a99b93c944768e31526c47fdd5af4e7db7ce400f2388189740e9112c2412bec3d07755125bb9440f070913877989d7bd3e7e7acf8a139065f3c11ebc112caaa5685f2acc15c99ab3fa6df9877ec0ee1411e1d5b8625ca6bca7fbab9aad2f6fd9b4c01bbf859b04b795fdfe9e232668edbb0603a687650f5e89faa9c1463f591580f62babd080166c44ef5440d00eb76ed71bc0cc1e87fdfd093939034bcdb21d08e03fbe984944ea3c5880b912ad6b8|48fc34408ab674854ab360408dc0c351|2fc6468b48eef05f2cb47b998b343faea3457749d08a76cd84791625cdd537b9df3c47ce1ea4a6f6d8592640552cbbca8d3ea3338ece04656321d3e0d056c1df|3	curl/8.14.0	\N	\N	\N
\.


--
-- Data for Name: oc_mail_accounts; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_accounts (id, user_id, name, email, inbound_host, inbound_port, inbound_ssl_mode, inbound_user, inbound_password, outbound_host, outbound_port, outbound_ssl_mode, outbound_user, outbound_password, signature, last_mailbox_sync, editor_mode, "order", show_subscribed_only, personal_namespace, drafts_mailbox_id, sent_mailbox_id, trash_mailbox_id, sieve_enabled, sieve_host, sieve_port, sieve_ssl_mode, sieve_user, sieve_password, provisioning_id, signature_above_quote, signature_mode, auth_method, archive_mailbox_id, oauth_refresh_token, oauth_token_ttl, oauth_access_token, smime_certificate_id, junk_mailbox_id, quota_percentage, trash_retention_days, snooze_mailbox_id, search_body, ooo_follows_system, debug) FROM stdin;
\.


--
-- Data for Name: oc_mail_aliases; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_aliases (id, account_id, name, alias, signature, signature_mode, smime_certificate_id) FROM stdin;
\.


--
-- Data for Name: oc_mail_attachments; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_attachments (id, local_message_id, user_id, file_name, created_at, mime_type) FROM stdin;
\.


--
-- Data for Name: oc_mail_coll_addresses; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_coll_addresses (id, user_id, email, display_name) FROM stdin;
\.


--
-- Data for Name: oc_mail_internal_address; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_internal_address (id, address, type, user_id) FROM stdin;
\.


--
-- Data for Name: oc_mail_local_messages; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_local_messages (id, type, account_id, alias_id, send_at, subject, html, in_reply_to_message_id, failed, editor_body, updated_at, smime_sign, smime_certificate_id, smime_encrypt, status, raw, request_mdn, pgp_mime, body_plain, body_html) FROM stdin;
\.


--
-- Data for Name: oc_mail_mailboxes; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_mailboxes (id, name, account_id, attributes, delimiter, messages, unseen, selectable, special_use, sync_new_lock, sync_changed_lock, sync_vanished_lock, sync_new_token, sync_changed_token, sync_vanished_token, sync_in_background, my_acls, shared, name_hash) FROM stdin;
\.


--
-- Data for Name: oc_mail_message_tags; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_message_tags (id, imap_message_id, tag_id) FROM stdin;
\.


--
-- Data for Name: oc_mail_messages; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_messages (id, uid, message_id, mailbox_id, subject, sent_at, flag_answered, flag_deleted, flag_draft, flag_flagged, flag_seen, flag_forwarded, flag_junk, flag_notjunk, flag_attachments, flag_important, structure_analyzed, preview_text, updated_at, "references", in_reply_to, thread_root_id, flag_mdnsent, imip_message, imip_processed, imip_error, encrypted, mentions_me, summary) FROM stdin;
\.


--
-- Data for Name: oc_mail_messages_retention; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_messages_retention (id, known_since, mailbox_id, uid) FROM stdin;
\.


--
-- Data for Name: oc_mail_messages_snoozed; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_messages_snoozed (id, snoozed_until, src_mailbox_id, mailbox_id, uid) FROM stdin;
\.


--
-- Data for Name: oc_mail_provisionings; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_provisionings (id, provisioning_domain, email_template, imap_user, imap_host, imap_port, imap_ssl_mode, smtp_user, smtp_host, smtp_port, smtp_ssl_mode, sieve_enabled, sieve_user, sieve_host, sieve_port, sieve_ssl_mode, ldap_aliases_provisioning, ldap_aliases_attribute, master_password_enabled, master_password) FROM stdin;
\.


--
-- Data for Name: oc_mail_recipients; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_recipients (id, local_message_id, message_id, type, label, email) FROM stdin;
\.


--
-- Data for Name: oc_mail_smime_certificates; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_smime_certificates (id, user_id, email_address, certificate, private_key) FROM stdin;
\.


--
-- Data for Name: oc_mail_tags; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_tags (id, user_id, imap_label, display_name, color, is_default_tag) FROM stdin;
\.


--
-- Data for Name: oc_mail_trusted_senders; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mail_trusted_senders (id, email, user_id, type) FROM stdin;
\.


--
-- Data for Name: oc_migrations; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_migrations (app, version) FROM stdin;
core	13000Date20170705121758
core	13000Date20170718121200
core	13000Date20170814074715
core	13000Date20170919121250
core	13000Date20170926101637
core	14000Date20180129121024
core	14000Date20180404140050
core	14000Date20180516101403
core	14000Date20180518120534
core	14000Date20180522074438
core	14000Date20180626223656
core	14000Date20180710092004
core	14000Date20180712153140
core	15000Date20180926101451
core	15000Date20181015062942
core	15000Date20181029084625
core	16000Date20190207141427
core	16000Date20190212081545
core	16000Date20190427105638
core	16000Date20190428150708
core	17000Date20190514105811
core	18000Date20190920085628
core	18000Date20191014105105
core	18000Date20191204114856
core	19000Date20200211083441
core	20000Date20201109081915
core	20000Date20201109081918
core	20000Date20201109081919
core	20000Date20201111081915
core	21000Date20201120141228
core	21000Date20201202095923
core	21000Date20210119195004
core	21000Date20210309185126
core	21000Date20210309185127
core	22000Date20210216080825
core	23000Date20210721100600
core	23000Date20210906132259
core	23000Date20210930122352
core	23000Date20211203110726
core	23000Date20211213203940
core	24000Date20211210141942
core	24000Date20211213081506
core	24000Date20211213081604
core	24000Date20211222112246
core	24000Date20211230140012
core	24000Date20220131153041
core	24000Date20220202150027
core	24000Date20220404230027
core	24000Date20220425072957
core	25000Date20220515204012
core	25000Date20220602190540
core	25000Date20220905140840
core	25000Date20221007010957
core	27000Date20220613163520
core	27000Date20230309104325
core	27000Date20230309104802
core	28000Date20230616104802
core	28000Date20230728104802
core	28000Date20230803221055
core	28000Date20230906104802
core	28000Date20231004103301
core	28000Date20231103104802
core	28000Date20231126110901
core	28000Date20240828142927
core	29000Date20231126110901
core	29000Date20231213104850
core	29000Date20240124132201
core	29000Date20240124132202
core	29000Date20240131122720
core	30000Date20240429122720
core	30000Date20240708160048
core	30000Date20240717111406
core	30000Date20240814180800
core	30000Date20240815080800
core	30000Date20240906095113
core	31000Date20240101084401
core	31000Date20240814184402
core	31000Date20250213102442
federatedfilesharing	1010Date20200630191755
federatedfilesharing	1011Date20201120125158
photos	20000Date20220727125801
photos	20001Date20220830131446
photos	20003Date20221102170153
photos	20003Date20221103094628
photos	30000Date20240417075405
systemtags	31000Date20241018063111
systemtags	31000Date20241114171300
contactsinteraction	010000Date20200304152605
federation	1010Date20200630191302
activity	2006Date20170808154933
activity	2006Date20170808155040
activity	2006Date20170919095939
activity	2007Date20181107114613
activity	2008Date20181011095117
activity	2010Date20190416112817
activity	2011Date20201006132544
activity	2011Date20201006132545
activity	2011Date20201006132546
activity	2011Date20201006132547
activity	2011Date20201207091915
circles	0022Date20220526111723
circles	0022Date20220526113601
circles	0022Date20220703115023
circles	0023Date20211216113101
circles	0024Date20220203123901
circles	0024Date20220203123902
circles	0024Date20220317190331
circles	0028Date20230705222601
circles	0031Date20241105133904
dav	1004Date20170825134824
dav	1004Date20170919104507
dav	1004Date20170924124212
dav	1004Date20170926103422
dav	1005Date20180413093149
dav	1005Date20180530124431
dav	1006Date20180619154313
dav	1006Date20180628111625
dav	1008Date20181030113700
dav	1008Date20181105104826
dav	1008Date20181105104833
dav	1008Date20181105110300
dav	1008Date20181105112049
dav	1008Date20181114084440
dav	1011Date20190725113607
dav	1011Date20190806104428
dav	1012Date20190808122342
dav	1016Date20201109085907
dav	1017Date20210216083742
dav	1018Date20210312100735
dav	1024Date20211221144219
dav	1025Date20240308063933
dav	1027Date20230504122946
dav	1029Date20221114151721
dav	1029Date20231004091403
dav	1030Date20240205103243
dav	1031Date20240610134258
updatenotification	011901Date20240305120000
files_sharing	11300Date20201120141438
files_sharing	21000Date20201223143245
files_sharing	22000Date20210216084241
files_sharing	24000Date20220208195521
files_sharing	24000Date20220404142216
files_sharing	31000Date20240821142813
webhook_listeners	1000Date20240527153425
webhook_listeners	1001Date20240716184935
files_reminders	10000Date20230725162149
files	2003Date20241021095629
files	11301Date20191205150729
files	12101Date20221011153334
text	010000Date20190617184535
text	030001Date20200402075029
text	030201Date20201116110353
text	030201Date20201116123153
text	030501Date20220202101853
text	030701Date20230207131313
text	030901Date20231114150437
text	040100Date20240611165300
user_status	0001Date20200602134824
user_status	0002Date20200902144824
user_status	1000Date20201111130204
user_status	1003Date20210809144824
user_status	1008Date20230921144701
files_versions	1020Date20221114144058
theming	2006Date20240905111627
notifications	2004Date20190107135757
notifications	2010Date20210218082811
notifications	2010Date20210218082855
notifications	2011Date20210930134607
notifications	2011Date20220826074907
files_downloadlimit	000000Date20210910094923
app_api	1000Date202305221555
app_api	1004Date202311061844
app_api	1005Date202312271744
app_api	1006Date202401011308
app_api	1007Date202401111030
app_api	1008Date202401121205
app_api	2000Date20240120094952
app_api	2005Date20240209094951
app_api	2200Date20240216164351
app_api	2201Date20240221124152
app_api	2203Date20240325124149
app_api	2204Date20240401104001
app_api	2204Date20240403125002
app_api	2205Date20240411124836
app_api	2206Date20240502145029
app_api	2207Date20240502145029
app_api	2700Date20240515092246
app_api	2800Date20240710220000
app_api	2800Date20240711080316
app_api	3000Date20240715170800
app_api	3000Date20240807085759
app_api	3100Date20240822080316
app_api	3200Date20240905080316
app_api	5000Date20241120135411
app_api	5000Date20250109163201
app_api	032001Date20250115164140
privacy	100Date20190217131943
workflowengine	2000Date20190808074233
workflowengine	2200Date20210805101925
twofactor_backupcodes	1002Date20170607104347
twofactor_backupcodes	1002Date20170607113030
twofactor_backupcodes	1002Date20170919123342
twofactor_backupcodes	1002Date20170926101419
twofactor_backupcodes	1002Date20180821043638
files_trashbin	1010Date20200630192639
files_trashbin	1020Date20240403003535
oauth2	010401Date20181207190718
oauth2	010402Date20190107124745
oauth2	011601Date20230522143227
oauth2	011602Date20230613160650
oauth2	011603Date20230620111039
oauth2	011901Date20240829164356
calendar	2040Date20210908101001
calendar	3000Date20211109132439
calendar	3010Date20220111090252
calendar	4050Date20230614163505
mail	0100Date20180825194217
mail	0110Date20180825195812
mail	0110Date20180825201241
mail	0130Date20190408134101
mail	0156Date20190828140357
mail	0161Date20190902103559
mail	0161Date20190902103701
mail	0161Date20190902114635
mail	0180Date20190927124207
mail	0190Date20191118160843
mail	0210Date20191212144925
mail	1020Date20191002091034
mail	1020Date20191002091035
mail	1020Date20200206134751
mail	1030Date20200228105714
mail	1040Date20200422130220
mail	1040Date20200422142920
mail	1040Date20200506111214
mail	1040Date20200515080614
mail	1040Date20200529124657
mail	1050Date20200624101359
mail	1050Date20200831124954
mail	1050Date20200921141700
mail	1050Date20200923180030
mail	1060Date20201015084952
mail	1080Date20201119084820
mail	1080Date20210108093802
mail	1090Date20210127160127
mail	1090Date20210216154409
mail	1096Date20210407150016
mail	1100Date20210304143008
mail	1100Date20210317164707
mail	1100Date20210326103929
mail	1100Date20210409091311
mail	1100Date20210419080523
mail	1100Date20210419121734
mail	1100Date20210421113423
mail	1100Date20210512142306
mail	1101Date20210616141806
mail	1105Date20210922104324
mail	1110Date20210908114229
mail	1115Date20211216144446
mail	1120Date20220223094709
mail	1124Date20220531094751
mail	1124Date20220601084530
mail	1130Date20220412111833
mail	1130Date20220520062301
mail	1140Date20220628174152
mail	1140Date20220701103556
mail	1140Date20220808203258
mail	1140Date20221027171138
mail	1140Date20221113205737
mail	1140Date20221206162029
mail	2000Date20220908130842
mail	2010Date20221002201527
mail	2020Date20221103140538
mail	2100Date20221013143851
mail	2300Date20221205160349
mail	2300Date20221215143450
mail	2300Date20221216115727
mail	2300Date20230120085320
mail	2300Date20230127093733
mail	2300Date20230214104736
mail	2300Date20230221170502
mail	3000Date20230301152454
mail	3001Date20230307113544
mail	3300Date20230706140531
mail	3300Date20230801124717
mail	3400Date20230807300513
mail	3400Date20230814160451
mail	3400Date20230818160236
mail	3400Date20230819161945
mail	3400Date20230823153943
mail	3400Date20230907103114
mail	3500Date20231005091430
mail	3500Date20231009102414
mail	3500Date20231114180656
mail	3500Date20231115182612
mail	3500Date20231115184458
mail	3600Date20240205180726
mail	3600Date20240220134813
mail	3600Date20240227172825
mail	3700Date20240430115406
mail	3700Date20240506161400
mail	3800Date20240628163133
mail	4000Date20240716172702
mail	4001Date20241009140707
mail	4100Date20240916174827
mail	4100Date20241021091352
mail	4100Date20241209000000
mail	4200Date20241210000000
mail	4200Date20241210000001
mail	5000Date20250405000000
richdocuments	2060Date20200302131958
richdocuments	2060Date20200302132145
richdocuments	30704Date20200626072306
richdocuments	30709Date20201111104147
richdocuments	30717Date20210310164901
richdocuments	50200Date20211220212457
notes	3005Date20200528204430
notes	3005Date20200528204431
rocketchat_nextcloud	000905Date20211203123456
spreed	2000Date20170707093535
spreed	2000Date20171026140256
spreed	2000Date20171026140257
spreed	2001Date20170707115443
spreed	2001Date20170913104501
spreed	2001Date20170921145301
spreed	2001Date20170929092606
spreed	2001Date20171009132424
spreed	2001Date20171026134605
spreed	2001Date20171026141336
spreed	2001Date20171031102049
spreed	2001Date20180103144447
spreed	2001Date20180103150836
spreed	3002Date20180319104030
spreed	3003Date20180707222130
spreed	3003Date20180718112436
spreed	3003Date20180718133519
spreed	3003Date20180720162342
spreed	3003Date20180722152733
spreed	3003Date20180722152849
spreed	3003Date20180730080327
spreed	4099Date20181001123058
spreed	5099Date20190121102337
spreed	5099Date20190319134820
spreed	6099Date20190627172429
spreed	7000Date20190717141457
spreed	7000Date20190724121136
spreed	7000Date20190724121137
spreed	8000Date20200331144101
spreed	8000Date20200402124456
spreed	8000Date20200407073807
spreed	8000Date20200407115318
spreed	10000Date20200819121721
spreed	10000Date20201012144235
spreed	10000Date20201015134000
spreed	10000Date20201015143852
spreed	10000Date20201015150000
spreed	11000Date20200922161218
spreed	11000Date20201011082810
spreed	11000Date20201201102528
spreed	11000Date20201204110210
spreed	11000Date20201209142525
spreed	11000Date20201209142526
spreed	11001Date20210211111527
spreed	11001Date20210212105406
spreed	12000Date20210217134030
spreed	12000Date20210401124139
spreed	12000Date20210528100404
spreed	13000Date20210625232111
spreed	13000Date20210901164235
spreed	13000Date20210921142733
spreed	13000Date20211007192733
spreed	14000Date20211203132513
spreed	14000Date20220217115327
spreed	14000Date20220328153054
spreed	14000Date20220330141647
spreed	15000Date20220427183026
spreed	15000Date20220503121308
spreed	15000Date20220506005058
spreed	16000Date20221110151714
spreed	16000Date20221116163301
spreed	16000Date20221208013745
spreed	16000Date20230502145340
spreed	18000Date20230504205823
spreed	18000Date20230808120823
spreed	18000Date20230821112014
spreed	18000Date20230824123939
spreed	18000Date20230920182747
spreed	18000Date20230928131717
spreed	18000Date20231005091416
spreed	18000Date20231018065816
spreed	18000Date20231024141626
spreed	18000Date20231024141627
spreed	19000Date20240212155937
spreed	19000Date20240214095011
spreed	19000Date20240227084313
spreed	19000Date20240305115243
spreed	19000Date20240312105627
spreed	19000Date20240313134926
spreed	19000Date20240416104656
spreed	19000Date20240709183938
spreed	20000Date20240621150333
spreed	20000Date20240621150334
spreed	20000Date20240621150335
spreed	20000Date20240623123938
spreed	20000Date20240716190335
spreed	20000Date20240717180417
spreed	20000Date20240718031959
spreed	21000Date20240919222538
wopi	0001Date20191003214420
wopi	030407Date20191220160355
wopi	030408Date20191220160721
wopi	030409Date20191221160721
wopi	030508Date20211021034331
onlyoffice	070000Date20210417111111
onlyoffice	070400Date20220607111111
onlyoffice	070400Date20220929111111
cfg_share_links	000000Date20211213143000
cfg_share_links	010200Date20220325222100
\.


--
-- Data for Name: oc_mimetypes; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mimetypes (id, mimetype) FROM stdin;
1	httpd
2	httpd/unix-directory
3	application
4	application/pdf
5	application/vnd.oasis.opendocument.text
6	application/vnd.oasis.opendocument.presentation
7	application/vnd.excalidraw+json
8	application/vnd.oasis.opendocument.spreadsheet
9	application/vnd.oasis.opendocument.graphics
10	text
11	text/markdown
12	video
13	video/mp4
14	image
15	image/png
16	application/vnd.openxmlformats-officedocument.wordprocessingml.document
17	image/jpeg
18	application/javascript
19	application/octet-stream
20	application/gzip
21	application/json
22	application/font-sfnt
34	image/svg+xml
67	video/webm
68	text/plain
69	application/vnd.oasis.opendocument.text-template
70	application/vnd.oasis.opendocument.spreadsheet-template
71	application/vnd.oasis.opendocument.presentation-template
72	application/vnd.oasis.opendocument.graphics-template
73	application/msword
\.


--
-- Data for Name: oc_mounts; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_mounts (id, storage_id, root_id, user_id, mount_point, mount_id, mount_provider_class) FROM stdin;
1	1	1	x79	/x79/	\N	OC\\Files\\Mount\\LocalHomeMountProvider
\.


--
-- Data for Name: oc_notes_meta; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_notes_meta (id, file_id, user_id, last_update, etag, content_etag, file_etag) FROM stdin;
1	295	x79	1748679343	ba7e469ca5af4e7afaf8c9c2730c5d7b	d41d8cd98f00b204e9800998ecf8427e	aa620640758d70046ab404de0116385a
\.


--
-- Data for Name: oc_notifications; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_notifications (notification_id, app, "user", "timestamp", object_type, object_id, subject, subject_parameters, message, message_parameters, link, icon, actions) FROM stdin;
\.


--
-- Data for Name: oc_notifications_pushhash; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_notifications_pushhash (id, uid, token, deviceidentifier, devicepublickey, devicepublickeyhash, pushtokenhash, proxyserver, apptype) FROM stdin;
1	x79	40	2JcRBH1nScJEYNirXRFd8kUmeCyzMsVcV9in6zVIDYei7lxW+Rg5GzT7X9bw0PlkBvb3m/O0Lq903OqxDWvaEQ==	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA14nmMN9R5dnVtEA+uZr3\nxJAa8pHR9cagd8QxxraNacuRTNLvF9ypcAfunIW6BvK9v+CGHl7c3S+9uU4CHr0O\nL38NXfcEL2wCHsLFK0E2cVf3H0pPEO30L5MNkIFvl9hSEPEeK3KubgcPeeGde27L\n+fKoeBUFbfurNOGBclfvFrS4ho5M01jzEa1/RfXWMv1HqIKX2LBK5IkKjvraoObp\nsUrUKd6XPo7D50sY3BP4iuuzW18+R6tg2Okw0sSRNo4aw7iAz25IyzLEPIIsas1M\nAlPTB6M2o7dozzOE8ctyTaQPb1wZosATMLMO4zjzBNavU0+KVHywzcqtQ2TdPiF4\n8wIDAQAB\n-----END PUBLIC KEY-----\n	2a9bd30107eeb7e4e15f132351044e3aa11996b83b8025ff612f20b7c19ebb6c59476fbb3df22bad5f359290419dfb92872313447fba860a07363445c99acf15	66f1c419714b5cd9c5ea32419d60b75276027dc47fe7145d59f02d046af2e0d2cacbe9167af2a01b66ffec5fe682cebfe37c67b235fb8a87bbd541f4c51d9d50	https://push-notifications.nextcloud.com	nextcloud
3	x79	51	dAIbImwFA8KHZuyHOybkLZVYdbJ/nc1tvU1mU59GvXtQR0tioVno6+gYQKeWYMFA9rZnAlC5ovvTQFt3Fg84xQ==	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0hyqTZX1DlF1Y8g/P9ML\ns33RWY+MT0Hagh1YJU4iF9EAA3qztSHdzJpw2auFm/2fQ2TvzRIQSO2pwYIY/Svo\n2rTytepqSnkTTfukIZipySSslsJJ+agCjNPNicC4on+mF/m0xjDAfNdR57DCHIZH\nMW9Cfs08Dak6v1V0PFHngQTBoA8wYMkln+/MD4VD3rqBLlO7HtYWIqE3chjEm0yl\n1tS6wZITXLFakyHoJn6hqdcdQchVYGy7Uo1bZiwnUaG/ZuXyH4ABGpzRG18t/68U\nzEy+rXnmjogwCFqYyE9Eb2HjeJNGeLgAtFOqQOG02IqMKl0/sAbgV1FA3B/Wdrdl\n9QIDAQAB\n-----END PUBLIC KEY-----\n	5578903ffc8a9112b9411130f2475fdcede0d1f76dcead373cf00eb2edff089f93b33ac1eabfc9a20896f630cd45d6c1a2dcd2d830d0e0f134e1e19189f9f74d	72f0e03964dc0cd26456bf566393e60c2394a21a44df9eca4d964c40276c69c0b2d097406bd5ba466eae199087ea6cbdc0cac35855f6c460cbc70c1ebd0edcab	https://push-notifications.nextcloud.com	talk
2	x79	44	N0Hv87lDIkzCcbExgbgtcaH/vSmXBOnpnq+VMuY2VgUxAZMFVk/dC2Olh6Y1Nsf/FpouuweoG1PA5/B1fMmxKQ==	-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1EpBQKJ7QGImM22Ts80R\ncQ1+I3WKjbFyMjAHyF2IRVe6DyVHksUwKzBIMfrnwyMHZ9KFDJiPwgNAAk8b55Bo\n3AwnIXGT6nWdghlzDUH8Z7gIEDIraFWZXV6J/Tpz9k4bL8KnlTfTwttpSvIvW9vu\nihDXprFxfBsMBPFpAAzp7eizH5jdWjy1fWGACfqih9SZnqjUTQXvI/P/gwBjHKpy\nOmAWCZE28MwD5Ss+QgKQ1ms1xrwCGOpgm4Ud9QoDkvFJEFz35AS/8IfzVJPdaJWv\nFsRXxErYcjRSYJgSURGzBNcJ5bJ4EIn550B5gddLjvaHRME/jHKdtbE6o4xTTTyc\ncQIDAQAB\n-----END PUBLIC KEY-----	0f8d145f54396d8b5919e171ef62d3e71a8dd67becf755a48ef08d9e174f29e02f06ebda0c20534b5af0d85fa9dc000923bc0d6a573d6f945b765f25a0645190	bd8ad0b0c54f32d66d3c122ae454274290ef57dbffe791125855de378aab50c0ba1be38390c66e7c95d1c3493b7a1f283a97245c06e105b46b011f1b34e8c955	https://push-notifications.nextcloud.com	talk
\.


--
-- Data for Name: oc_notifications_settings; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_notifications_settings (id, user_id, batch_time, last_send_id, next_send_time) FROM stdin;
1	x79	0	0	0
\.


--
-- Data for Name: oc_oauth2_access_tokens; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_oauth2_access_tokens (id, token_id, client_id, hashed_code, encrypted_token, code_created_at, token_count) FROM stdin;
\.


--
-- Data for Name: oc_oauth2_clients; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_oauth2_clients (id, name, redirect_uri, client_identifier, secret) FROM stdin;
\.


--
-- Data for Name: oc_onlyoffice_filekey; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_onlyoffice_filekey (id, file_id, key, lock, fs) FROM stdin;
1	43	oc9xft3m2oht_D1D6BE8A-E85E-4E7F-95E5-50E3EE9A6B87	0	0
2	451	oc9xft3m2oht_1FA12855-C2BB-40EE-A01B-97337A78C5B0	0	0
\.


--
-- Data for Name: oc_onlyoffice_instance; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_onlyoffice_instance (id, remote, expire, status) FROM stdin;
\.


--
-- Data for Name: oc_onlyoffice_permissions; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_onlyoffice_permissions (id, share_id, permissions) FROM stdin;
\.


--
-- Data for Name: oc_open_local_editor; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_open_local_editor (id, user_id, path_hash, expiration_time, token) FROM stdin;
\.


--
-- Data for Name: oc_photos_albums; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_photos_albums (album_id, name, "user", created, location, last_added_photo) FROM stdin;
\.


--
-- Data for Name: oc_photos_albums_collabs; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_photos_albums_collabs (id, album_id, collaborator_id, collaborator_type) FROM stdin;
\.


--
-- Data for Name: oc_photos_albums_files; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_photos_albums_files (album_file_id, album_id, file_id, added, owner) FROM stdin;
\.


--
-- Data for Name: oc_preferences; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_preferences (userid, appid, configkey, configvalue, lazy, type, flags, indexed) FROM stdin;
x79	login	firstLogin	1748677275	0	0	0	
x79	activity	configured	yes	0	0	0	
x79	notifications	sound_notification	no	0	0	0	
x79	notifications	sound_talk	no	0	0	0	
x79	password_policy	failedLoginAttempts	0	0	0	0	
x79	core	lang	en_GB	0	1	0	
x79	core	templateDirectory	Templates/	0	0	0	
x79	dashboard	firstRun	0	0	0	0	
x79	firstrunwizard	apphint	19	0	0	0	
x79	notes	settings	{"notesPath":"Notes"}	0	0	0	
x79	avatar	generated	true	0	0	0	
x79	firstrunwizard	show	31.0.5	0	0	0	
x79	core	timezone	Asia/Bangkok	0	0	0	
x79	login_token	lqUSGXvKnRghvGI0+2WDLguUI2ofx0Id	1748678534	0	0	0	
x79	spreed	changelog	55	0	0	0	
x79	spreed	samples_created	2025-05-31T08:35:05+00:00	0	0	0	
x79	spreed	signaling_ticket_secret	cTjc4oZXQtN9QOC2PSEGqCiS/8XO9cEKPA8FOmdtvETPhJODVnwz2WYhaMdLUF1A65yJuk40BFTEezQ6CJ17RBNk89U7E7VOFt4gKULlC0wnsODD2fY+c8IL0XrfNLGLo0225nraq7Uy9erECa37E/EYUIaRs3yz6K2hB+r8OgdPzq9M8dwaodqT+JdXvRrJ7B+QtedOwqk7TuGhQhX45sq0eQ51TQeI5p46cMSmoq49grJY5DAxuBCExKSsCsg	0	0	0	
x79	login_token	R9312FuAQI2DJsu3CIOwefMULm0fjAMZ	1748680581	0	0	0	
x79	login_token	5Isbi71ncC6kBGA2y+I9At0tnqPiFk1Y	1748680702	0	0	0	
x79	login_token	rB2A/hcyZIprvsGGzSsOu+gNCa1bfI+N	1748680906	0	0	0	
x79	login_token	cPNbG0/pQyXRDXj+X42xZYFAMs+YBPJ/	1748702881	0	0	0	
x79	login_token	duPLeIweEHNoudsrR0h3b5lboTwmfFnf	1748711742	0	0	0	
x79	spreed	note_to_self	6	0	0	0	
x79	login_token	9hiPCwJupi1/sFFh9CLT6bKhRzOjuPMu	1748851286	0	0	0	
x79	login_token	goVoOl4CymNQebEcJ5Sp5XWGpsk4ptEt	1748932780	0	0	0	
x79	login_token	he/eQ12fr3+Zzxfy+Hm0jhyYosq1G16W	1748932888	0	0	0	
x79	login_token	uL11eRkbiHbIHZ+0JL3e8Y6xGA6L7gTF	1749748242	0	0	0	
x79	login_token	M4GePZsPpP0ERHTlylj9jLvsR8Fn61HM	1749886246	0	0	0	
x79	login	lastLogin	1749886248	0	0	0	
x79	files	lastSeenQuotaUsage	0.67	0	0	0	
\.


--
-- Data for Name: oc_preferences_ex; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_preferences_ex (id, userid, appid, configkey, configvalue) FROM stdin;
\.


--
-- Data for Name: oc_privacy_admins; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_privacy_admins (id, displayname) FROM stdin;
\.


--
-- Data for Name: oc_profile_config; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_profile_config (id, user_id, config) FROM stdin;
\.


--
-- Data for Name: oc_properties; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_properties (id, userid, propertypath, propertyname, propertyvalue, valuetype) FROM stdin;
\.


--
-- Data for Name: oc_ratelimit_entries; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_ratelimit_entries (id, hash, delete_after) FROM stdin;
61	74caae5aecfbbf5dd7d22da5746761fdea5f933dd6e4a1dba39cc07714f3329773f87d35b67939320c2134806ece8bef850de89ec3a5dd9b8929854a378ac320	2025-06-12 17:39:05
62	74caae5aecfbbf5dd7d22da5746761fdea5f933dd6e4a1dba39cc07714f3329773f87d35b67939320c2134806ece8bef850de89ec3a5dd9b8929854a378ac320	2025-06-12 17:39:07
\.


--
-- Data for Name: oc_reactions; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_reactions (id, parent_id, message_id, actor_type, actor_id, reaction) FROM stdin;
1	62	63	guests	sample	😍
2	62	64	guests	sample	👍
\.


--
-- Data for Name: oc_recent_contact; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_recent_contact (id, actor_uid, uid, email, federated_cloud_id, card, last_contact) FROM stdin;
\.


--
-- Data for Name: oc_richdocuments_assets; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_richdocuments_assets (id, uid, fileid, token, "timestamp") FROM stdin;
\.


--
-- Data for Name: oc_richdocuments_direct; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_richdocuments_direct (id, token, uid, fileid, "timestamp", template_destination, template_id, share, initiator_host, initiator_token) FROM stdin;
\.


--
-- Data for Name: oc_richdocuments_template; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_richdocuments_template (id, userid, fileid, templateid, "timestamp") FROM stdin;
\.


--
-- Data for Name: oc_richdocuments_wopi; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_richdocuments_wopi (id, owner_uid, editor_uid, guest_displayname, fileid, version, canwrite, server_host, token, expiry, template_destination, template_id, hide_download, direct, remote_server, remote_server_token, share, token_type) FROM stdin;
1	x79	x79	\N	-1	25	t	https://cloud.victorphan.net/	TDl5iRXnreMxLZwXAkJ0fX69zk4Gu3MA	1748961600	\N	0	f	f			\N	5
2	x79	x79	\N	-1	25	t	https://cloud.victorphan.net/	pyFCSPHPL4yYiqeNiujPuULZBF96e0uS	1748961880	\N	0	f	f			\N	5
3	x79	x79	\N	-1	25	t	https://cloud.victorphan.net/	2sC65OFlVrzxjFIU1Llvjbi1l6MzPkVB	1748961893	\N	0	f	f			\N	5
4	x79	x79	\N	451	0	t	https://cloud.victorphan.net/	0clzyCyV3mMKeSJKip0kBW9uvUHbvm9a	1748961915	\N	0	f	f			\N	0
5	x79	x79	\N	-1	25	t	https://cloud.victorphan.net/	93zI9PT9grRrUa3ZWZ3apNw61aNNnODk	1748961916	\N	0	f	f			\N	5
6	x79	x79	\N	-1	25	t	https://cloud.victorphan.net/	k2k78PqCd5Xij0qSmZ11GGe6OeZireCL	1748961916	\N	0	f	f			\N	5
7	x79	x79	\N	-1	25	t	https://cloud.victorphan.net/	lya4J5EwQV4GzyoyNwMX7mLowznGwyBP	1748961917	\N	0	f	f			\N	5
8	x79	x79	\N	-1	25	t	https://cloud.victorphan.net/	t4D3gPpiF4PQfYUODV1mAWMn2BOZ4ygD	1748961918	\N	0	f	f			\N	5
9	x79	x79	\N	-1	25	t	https://cloud.victorphan.net/	45eXUhY6X3EMgW9H0P84Gn6lc9DTfeZp	1748961918	\N	0	f	f			\N	5
\.


--
-- Data for Name: oc_rocket_file_chats; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_rocket_file_chats (file_id, chat_id, created) FROM stdin;
\.


--
-- Data for Name: oc_rocket_users; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_rocket_users (nc_user_id, rc_user_id, rc_token, rc_current_channel_id, rc_uuid_password) FROM stdin;
\.


--
-- Data for Name: oc_schedulingobjects; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_schedulingobjects (id, principaluri, calendardata, uri, lastmodified, etag, size) FROM stdin;
\.


--
-- Data for Name: oc_sec_signatory; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_sec_signatory (id, key_id_sum, key_id, host, provider_id, account, public_key, metadata, type, status, creation, last_updated) FROM stdin;
\.


--
-- Data for Name: oc_share; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_share (id, share_type, share_with, password, uid_owner, uid_initiator, parent, item_type, item_source, item_target, file_source, file_target, permissions, stime, accepted, expiration, token, mail_send, share_name, password_by_talk, note, hide_download, label, attributes, password_expiration_time, reminder_sent) FROM stdin;
3	3	\N	\N	x79	x79	\N	file	43	\N	43	/Nextcloud flyer.pdf	19	1748738935	0	\N	2fiGJRX3oXxTjNW	0	\N	f		0		\N	\N	f
4	10	gq55enwr	\N	x79	x79	\N	file	451	\N	451	/{TALK_PLACEHOLDER}/Nghien cuu khoa hoc_tinhluong.docx	19	1748851347	0	\N	zgzLyW8ZADL2a3c	0	\N	f	\N	0	\N	\N	\N	f
5	10	gq55enwr	\N	x79	x79	\N	file	538	\N	538	/{TALK_PLACEHOLDER}/BT Modal verbs.pdf	19	1749050624	0	\N	d8Z8sfSSrR65e7Z	0	\N	f	\N	0	\N	\N	\N	f
6	10	gq55enwr	\N	x79	x79	\N	file	623	\N	623	/{TALK_PLACEHOLDER}/20250607_070604.png	19	1749254768	0	\N	rTEieKbEyHbJeeD	0	\N	f	\N	0	\N	\N	\N	f
7	10	gq55enwr	\N	x79	x79	\N	file	633	\N	633	/{TALK_PLACEHOLDER}/20250607_102816.png	19	1749266899	0	\N	q4dgH6zsfdxjAsB	0	\N	f	\N	0	\N	\N	\N	f
8	10	gq55enwr	\N	x79	x79	\N	file	634	\N	634	/{TALK_PLACEHOLDER}/20250607_102821.png	19	1749266903	0	\N	TTtWeJ6nSbTaddK	0	\N	f	\N	0	\N	\N	\N	f
10	10	gq55enwr	\N	x79	x79	\N	file	660	\N	660	/{TALK_PLACEHOLDER}/twilio_2FA_recovery_code.txt	19	1749454549	0	\N	dtdsborA9jdd6c6	0	\N	f	\N	0	\N	\N	\N	f
11	10	ttx8py64	\N	x79	x79	\N	file	746	\N	746	/{TALK_PLACEHOLDER}/Nội dung đề tài -Thầy nhân.mp4	19	1749571212	0	\N	APrrfLxgPSmzY6t	0	\N	f	\N	0	\N	\N	\N	f
12	10	gq55enwr	\N	x79	x79	\N	file	787	\N	787	/{TALK_PLACEHOLDER}/sisvietnam.vn-20250611-071752-587.wpress	19	1749626436	0	\N	95aTJAJBd6ZGJyy	0	\N	f	\N	0	\N	\N	\N	f
13	10	gq55enwr	\N	x79	x79	\N	file	818	\N	818	/{TALK_PLACEHOLDER}/1749545599_f3599c42-7d0a-4af7-afba-604bd959496e.jpg	19	1749655706	0	\N	dCcZjbEC2NRqArP	0	\N	f	\N	0	\N	\N	\N	f
14	10	gq55enwr	\N	x79	x79	\N	file	821	\N	821	/{TALK_PLACEHOLDER}/1749545599_04d07652-6952-4024-b365-51cef87f0771.jpg	19	1749655707	0	\N	gHceX3rgDF4ypsM	0	\N	f	\N	0	\N	\N	\N	f
15	10	gq55enwr	\N	x79	x79	\N	file	843	\N	843	/{TALK_PLACEHOLDER}/1749545599_11c44654-0f2c-4e2e-ba44-f19e613a65c7.jpg	19	1749655710	0	\N	sfYtBmxAq5tRGoy	0	\N	f	\N	0	\N	\N	\N	f
16	10	gq55enwr	\N	x79	x79	\N	file	847	\N	847	/{TALK_PLACEHOLDER}/1749545599_de366c96-367c-4e59-a014-50cb5498d7ca.jpg	19	1749655710	0	\N	ZG5Q88gCNcLtBtx	0	\N	f	\N	0	\N	\N	\N	f
17	10	gq55enwr	\N	x79	x79	\N	file	870	\N	870	/{TALK_PLACEHOLDER}/1749545599_78f56b6e-0002-452a-9198-280ba4f79f11.jpg	19	1749655721	0	\N	XaeSBq9aBgc9ynD	0	\N	f	\N	0	\N	\N	\N	f
18	10	gq55enwr	\N	x79	x79	\N	file	885	\N	885	/{TALK_PLACEHOLDER}/2025_06_11 19_39 Office Lens.pdf	19	1749657224	0	\N	t7AWxkBkrRZBCX7	0	\N	f	\N	0	\N	\N	\N	f
19	10	gq55enwr	\N	x79	x79	\N	file	893	\N	893	/{TALK_PLACEHOLDER}/M3325007-Danh Tính-Thực trạng và giải pháp ứng dụng Trí tuệ nhân tạo (Al) trong hoạt động sản xuất lúa gạo tại Đồng bằng sông Cửu Long.doc	19	1749747566	0	\N	xceQGkHN7SKbF8W	0	\N	f	\N	0	\N	\N	\N	f
20	10	gq55enwr	\N	x79	x79	\N	file	922	\N	922	/{TALK_PLACEHOLDER}/M2523001_PhanVoDinhHIen_THỰC TRẠNG VÀ GIẢI PHÁP CỦA ỨNG DỤNG TRÍ TUỆ NHÂN TẠO TRONG HOẠT ĐỘNG KHÁM CHỮA BỆNH TẠI BỆNH VIỆN ĐA KHOA QUỐC TẾ SIS CẦN THƠ..pdf	19	1749749345	0	\N	ssoscQ6ZgFG5ELw	0	\N	f	\N	0	\N	\N	\N	f
21	10	gq55enwr	\N	x79	x79	\N	file	923	\N	923	/{TALK_PLACEHOLDER}/M2523001_THỰC TRẠNG VÀ GIẢI PHÁP CỦA ỨNG DỤNG TRÍ TUỆ NHÂN TẠO TRONG HOẠT ĐỘNG KHÁM CHỮA BỆNH TẠI BỆNH VIỆN ĐA KHOA QUỐC TẾ SIS CẦN THƠ..doc	19	1749749348	0	\N	kr4WnXYYN3gtWtW	0	\N	f	\N	0	\N	\N	\N	f
\.


--
-- Data for Name: oc_share_external; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_share_external (id, parent, share_type, remote, remote_id, share_token, password, name, owner, "user", mountpoint, mountpoint_hash, accepted) FROM stdin;
\.


--
-- Data for Name: oc_shares_limits; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_shares_limits (id, "limit", downloads) FROM stdin;
\.


--
-- Data for Name: oc_storages; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_storages (numeric_id, id, available, last_checked) FROM stdin;
1	home::x79	1	\N
2	local::/var/www/html/data/	1	\N
\.


--
-- Data for Name: oc_storages_credentials; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_storages_credentials (id, "user", identifier, credentials) FROM stdin;
\.


--
-- Data for Name: oc_systemtag; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_systemtag (id, name, visibility, editable, etag, color) FROM stdin;
\.


--
-- Data for Name: oc_systemtag_group; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_systemtag_group (systemtagid, gid) FROM stdin;
\.


--
-- Data for Name: oc_systemtag_object_mapping; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_systemtag_object_mapping (objectid, objecttype, systemtagid) FROM stdin;
\.


--
-- Data for Name: oc_talk_attachments; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_attachments (id, room_id, message_id, message_time, object_type, actor_type, actor_id) FROM stdin;
3	4	72	1748851347	file	users	x79
4	4	77	1749050624	file	users	x79
5	4	84	1749254768	media	users	x79
6	4	85	1749266899	media	users	x79
7	4	86	1749266903	media	users	x79
9	4	89	1749454549	file	users	x79
10	6	94	1749571212	media	users	x79
11	4	96	1749626436	file	users	x79
12	4	97	1749655706	media	users	x79
13	4	98	1749655707	media	users	x79
14	4	99	1749655710	media	users	x79
15	4	100	1749655710	media	users	x79
16	4	101	1749655721	media	users	x79
17	4	103	1749657224	file	users	x79
18	4	105	1749747566	file	users	x79
19	4	106	1749749345	file	users	x79
20	4	107	1749749348	file	users	x79
\.


--
-- Data for Name: oc_talk_attendees; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_attendees (id, room_id, actor_type, actor_id, display_name, pin, participant_type, favorite, notification_level, last_joined_call, last_read_message, last_mention_message, read_privacy, access_token, remote_id, last_mention_direct, permissions, notification_calls, phone_number, call_id, invited_cloud_id, state, unread_messages, last_attendee_activity, archived) FROM stdin;
4	4	users	x79	x79	\N	1	f	0	1749114674	107	0	0	\N	\N	0	0	1			\N	0	0	1749749348	f
5	6	users	x79	x79	\N	1	t	0	0	94	0	0	\N	\N	0	0	1			\N	0	0	1749571213	f
\.


--
-- Data for Name: oc_talk_bans; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_bans (id, moderator_actor_type, moderator_actor_id, moderator_displayname, banned_actor_type, banned_actor_id, banned_displayname, room_id, banned_time, internal_note) FROM stdin;
\.


--
-- Data for Name: oc_talk_bots_conversation; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_bots_conversation (id, bot_id, token, state) FROM stdin;
\.


--
-- Data for Name: oc_talk_bots_server; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_bots_server (id, name, url, url_hash, description, secret, error_count, last_error_date, last_error_message, state, features) FROM stdin;
\.


--
-- Data for Name: oc_talk_bridges; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_bridges (id, room_id, json_values, enabled, pid) FROM stdin;
\.


--
-- Data for Name: oc_talk_commands; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_commands (id, app, name, command, script, response, enabled) FROM stdin;
\.


--
-- Data for Name: oc_talk_consent; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_consent (id, token, actor_type, actor_id, date_time) FROM stdin;
\.


--
-- Data for Name: oc_talk_internalsignaling; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_internalsignaling (id, sender, recipient, message, "timestamp") FROM stdin;
\.


--
-- Data for Name: oc_talk_invitations; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_invitations (id, user_id, state, local_room_id, access_token, remote_server_url, remote_token, remote_attendee_id, inviter_cloud_id, inviter_display_name, local_cloud_id) FROM stdin;
\.


--
-- Data for Name: oc_talk_poll_votes; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_poll_votes (id, poll_id, room_id, actor_type, actor_id, display_name, option_id) FROM stdin;
\.


--
-- Data for Name: oc_talk_polls; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_polls (id, room_id, question, options, votes, num_voters, actor_type, actor_id, display_name, status, result_mode, max_votes) FROM stdin;
\.


--
-- Data for Name: oc_talk_proxy_messages; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_proxy_messages (id, local_token, remote_server_url, remote_token, remote_message_id, actor_type, actor_id, actor_display_name, message_type, system_message, expiration_datetime, message, message_parameters, creation_datetime, meta_data) FROM stdin;
\.


--
-- Data for Name: oc_talk_reminders; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_reminders (id, user_id, token, message_id, date_time) FROM stdin;
\.


--
-- Data for Name: oc_talk_retry_ocm; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_retry_ocm (id, remote_server, num_attempts, next_retry, notification_type, resource_type, provider_id, notification) FROM stdin;
\.


--
-- Data for Name: oc_talk_rooms; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_rooms (id, name, token, type, password, active_since, active_guests, last_activity, last_message, object_type, object_id, read_only, lobby_state, lobby_timer, assigned_hpb, sip_enabled, description, listable, call_flag, default_permissions, call_permissions, remote_server, remote_token, message_expiration, breakout_room_mode, breakout_room_status, avatar, call_recording, recording_consent, has_federation, mention_permissions) FROM stdin;
5	Nextcloud flyer.pdf	5xizea62	3		\N	0	2025-06-01 00:50:50	71	file	43	0	0	\N	\N	0		0	0	0	0	\N	\N	0	0	0		0	0	0	0
6	Note to self	ttx8py64	6		\N	0	2025-06-10 16:00:12	94	note_to_self	x79	0	0	\N	\N	0	A place for your private notes, thoughts and ideas	0	0	0	0	\N	\N	0	0	0	8nPJ4nJyCarWrM2N.svg	0	0	0	0
1	x79	rom4u6kw	4		\N	0	2025-06-04 04:10:10	76			1	0	\N	\N	0		0	0	0	0	\N	\N	0	0	0		0	0	0	0
4	File tranfers	gq55enwr	2		\N	0	2025-06-12 17:29:08	107			0	0	\N	\N	0		0	0	0	0	\N	\N	0	0	0		0	0	0	0
\.


--
-- Data for Name: oc_talk_sessions; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_talk_sessions (id, attendee_id, session_id, in_call, last_ping, state) FROM stdin;
19	3	yLxawW/efsbMPBer0QtUshOkmCWoP3bBIK5hpLXjycsTXgOgJlZbcIe4H4DkLZxQMg6VnVWSj6mvR2p17RmWd9kl36jKD+XXx4xWkQdChqVyMKkYLrY2mXa6MiBx9JwvH20HM0lqtu35UU9E5abZAA/DcV1QQNJftrYlKxA3hdoviShCzIcmzLYtUUFOumBBAUhIgDGCtem+bCor3T02U6lnhE081Q3phHK6mBHs1ttTuNVxsL3CweaoxsE9ssR	0	1748852493	0
70	4	BVQCW4QmJvIsPyDNzXTUE3o5088oPKtrgGpfZ6CLBFExSL35dK75BTJqFZjvYDXe+ThRY/oOU2TqMNPq5/GXxEps+SIwhU3b5iHPdlYEae3QnaOTbNSEDkuV3PoWkbod8zKmBeiZ9PwhLjOtrpxuLpz5BAJx4gpxutBbOjoaDATUD5oa1zRc7aO+OXBQz61bcZX1///YtCPrg7nFSoaoINzMqz+ZCafQMZ/fgC4vejBN54VTDutQkmGC2u5uK3d	0	1749803111	0
\.


--
-- Data for Name: oc_taskprocessing_tasks; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_taskprocessing_tasks (id, type, input, output, status, user_id, app_id, custom_id, last_updated, completion_expected_at, progress, error_message, scheduled_at, started_at, ended_at, webhook_uri, webhook_method) FROM stdin;
\.


--
-- Data for Name: oc_text2image_tasks; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_text2image_tasks (id, input, status, number_of_images, user_id, app_id, identifier, last_updated, completion_expected_at) FROM stdin;
\.


--
-- Data for Name: oc_text_documents; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_text_documents (id, current_version, last_saved_version, last_saved_version_time, last_saved_version_etag, base_version_etag) FROM stdin;
\.


--
-- Data for Name: oc_text_sessions; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_text_sessions (id, user_id, guest_name, color, token, document_id, last_contact, last_awareness_message) FROM stdin;
\.


--
-- Data for Name: oc_text_steps; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_text_steps (id, document_id, session_id, data, version, "timestamp") FROM stdin;
\.


--
-- Data for Name: oc_textprocessing_tasks; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_textprocessing_tasks (id, type, input, output, status, user_id, app_id, identifier, last_updated, completion_expected_at) FROM stdin;
\.


--
-- Data for Name: oc_trusted_servers; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_trusted_servers (id, url, url_hash, token, shared_secret, status, sync_token) FROM stdin;
\.


--
-- Data for Name: oc_twofactor_backupcodes; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_twofactor_backupcodes (id, user_id, code, used) FROM stdin;
\.


--
-- Data for Name: oc_twofactor_providers; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_twofactor_providers (provider_id, uid, enabled) FROM stdin;
backup_codes	x79	0
\.


--
-- Data for Name: oc_user_status; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_user_status (id, user_id, status, status_timestamp, is_user_defined, message_id, custom_icon, custom_message, clear_at, is_backup, status_message_timestamp) FROM stdin;
1	x79	online	1749888113	f	\N	\N	\N	\N	f	0
\.


--
-- Data for Name: oc_user_transfer_owner; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_user_transfer_owner (id, source_user, target_user, file_id, node_name) FROM stdin;
\.


--
-- Data for Name: oc_users; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_users (uid, displayname, password, uid_lower) FROM stdin;
x79	\N	3|$argon2id$v=19$m=65536,t=4,p=1$czV1SVFCSUFFUW5raFhQRw$ifIl4VS5oRzZ1/MkrHTa6oKHKHxBHRRRkHXWKKTGoQ0	x79
\.


--
-- Data for Name: oc_vcategory; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_vcategory (id, uid, type, category) FROM stdin;
\.


--
-- Data for Name: oc_vcategory_to_object; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_vcategory_to_object (objid, categoryid, type) FROM stdin;
\.


--
-- Data for Name: oc_webauthn; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_webauthn (id, uid, name, public_key_credential_id, data, user_verification) FROM stdin;
\.


--
-- Data for Name: oc_webhook_listeners; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_webhook_listeners (id, app_id, user_id, http_method, uri, event, event_filter, user_id_filter, headers, auth_method, auth_data) FROM stdin;
\.


--
-- Data for Name: oc_whats_new; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_whats_new (id, version, etag, last_check, data) FROM stdin;
1	31.0.6	d41d8cd98f00b204e9800998ecf8427e	1749886267	[]
\.


--
-- Data for Name: oc_wopi_assets; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_wopi_assets (id, uid, fileid, token, "timestamp") FROM stdin;
\.


--
-- Data for Name: oc_wopi_direct; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_wopi_direct (id, token, uid, fileid, "timestamp", template_destination, template_id) FROM stdin;
\.


--
-- Data for Name: oc_wopi_locks; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_wopi_locks (id, valid_by, file_id, user_id, token_id, value) FROM stdin;
\.


--
-- Data for Name: oc_wopi_tokens; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_wopi_tokens (id, valid_by, file_id, user_id, value) FROM stdin;
\.


--
-- Data for Name: oc_wopi_wopi; Type: TABLE DATA; Schema: public; Owner: oc_x79
--

COPY public.oc_wopi_wopi (id, owner_uid, editor_uid, guest_displayname, fileid, version, canwrite, server_host, token, expiry, template_destination, template_id, hide_download, direct, is_remote_token, remote_server, remote_server_token) FROM stdin;
\.


--
-- Name: oc_accounts_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_accounts_data_id_seq', 33, true);


--
-- Name: oc_activity_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_activity_activity_id_seq', 198, true);


--
-- Name: oc_activity_mq_mail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_activity_mq_mail_id_seq', 1, false);


--
-- Name: oc_addressbookchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_addressbookchanges_id_seq', 1, false);


--
-- Name: oc_addressbooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_addressbooks_id_seq', 33, true);


--
-- Name: oc_appconfig_ex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_appconfig_ex_id_seq', 1, false);


--
-- Name: oc_authorized_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_authorized_groups_id_seq', 1, false);


--
-- Name: oc_authtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_authtoken_id_seq', 64, true);


--
-- Name: oc_bruteforce_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_bruteforce_attempts_id_seq', 3, true);


--
-- Name: oc_calendar_appt_bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendar_appt_bookings_id_seq', 1, false);


--
-- Name: oc_calendar_appt_configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendar_appt_configs_id_seq', 1, false);


--
-- Name: oc_calendar_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendar_invitations_id_seq', 1, false);


--
-- Name: oc_calendar_reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendar_reminders_id_seq', 1, false);


--
-- Name: oc_calendar_resources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendar_resources_id_seq', 1, false);


--
-- Name: oc_calendar_resources_md_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendar_resources_md_id_seq', 1, false);


--
-- Name: oc_calendar_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendar_rooms_id_seq', 1, false);


--
-- Name: oc_calendar_rooms_md_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendar_rooms_md_id_seq', 1, false);


--
-- Name: oc_calendarchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendarchanges_id_seq', 1, false);


--
-- Name: oc_calendarobjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendarobjects_id_seq', 1, false);


--
-- Name: oc_calendarobjects_props_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendarobjects_props_id_seq', 1, false);


--
-- Name: oc_calendars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendars_id_seq', 33, true);


--
-- Name: oc_calendarsubscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_calendarsubscriptions_id_seq', 1, false);


--
-- Name: oc_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_cards_id_seq', 1, false);


--
-- Name: oc_cards_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_cards_properties_id_seq', 1, false);


--
-- Name: oc_cfg_shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_cfg_shares_id_seq', 1, false);


--
-- Name: oc_circles_circle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_circles_circle_id_seq', 33, true);


--
-- Name: oc_circles_member_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_circles_member_id_seq', 33, true);


--
-- Name: oc_circles_mount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_circles_mount_id_seq', 1, false);


--
-- Name: oc_circles_mountpoint_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_circles_mountpoint_id_seq', 1, false);


--
-- Name: oc_circles_remote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_circles_remote_id_seq', 1, false);


--
-- Name: oc_circles_share_lock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_circles_share_lock_id_seq', 1, false);


--
-- Name: oc_circles_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_circles_token_id_seq', 1, false);


--
-- Name: oc_collres_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_collres_collections_id_seq', 1, false);


--
-- Name: oc_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_comments_id_seq', 107, true);


--
-- Name: oc_dav_absence_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_dav_absence_id_seq', 1, false);


--
-- Name: oc_dav_cal_proxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_dav_cal_proxy_id_seq', 1, false);


--
-- Name: oc_dav_shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_dav_shares_id_seq', 1, false);


--
-- Name: oc_direct_edit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_direct_edit_id_seq', 1, false);


--
-- Name: oc_directlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_directlink_id_seq', 1, false);


--
-- Name: oc_ex_apps_daemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_apps_daemons_id_seq', 1, false);


--
-- Name: oc_ex_apps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_apps_id_seq', 1, false);


--
-- Name: oc_ex_apps_routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_apps_routes_id_seq', 1, false);


--
-- Name: oc_ex_deploy_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_deploy_options_id_seq', 1, false);


--
-- Name: oc_ex_event_handlers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_event_handlers_id_seq', 1, false);


--
-- Name: oc_ex_occ_commands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_occ_commands_id_seq', 1, false);


--
-- Name: oc_ex_settings_forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_settings_forms_id_seq', 1, false);


--
-- Name: oc_ex_speech_to_text_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_speech_to_text_id_seq', 1, false);


--
-- Name: oc_ex_speech_to_text_q_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_speech_to_text_q_id_seq', 1, false);


--
-- Name: oc_ex_task_processing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_task_processing_id_seq', 1, false);


--
-- Name: oc_ex_text_processing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_text_processing_id_seq', 1, false);


--
-- Name: oc_ex_text_processing_q_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_text_processing_q_id_seq', 1, false);


--
-- Name: oc_ex_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_translation_id_seq', 1, false);


--
-- Name: oc_ex_translation_q_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_translation_q_id_seq', 1, false);


--
-- Name: oc_ex_ui_files_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_ui_files_actions_id_seq', 1, false);


--
-- Name: oc_ex_ui_scripts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_ui_scripts_id_seq', 1, false);


--
-- Name: oc_ex_ui_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_ui_states_id_seq', 1, false);


--
-- Name: oc_ex_ui_styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_ui_styles_id_seq', 1, false);


--
-- Name: oc_ex_ui_top_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ex_ui_top_menu_id_seq', 1, false);


--
-- Name: oc_file_locks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_file_locks_id_seq', 1256, true);


--
-- Name: oc_filecache_fileid_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_filecache_fileid_seq', 938, true);


--
-- Name: oc_files_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_files_metadata_id_seq', 45, true);


--
-- Name: oc_files_metadata_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_files_metadata_index_id_seq', 89, true);


--
-- Name: oc_files_reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_files_reminders_id_seq', 1, false);


--
-- Name: oc_files_trash_auto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_files_trash_auto_id_seq', 6, true);


--
-- Name: oc_files_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_files_versions_id_seq', 107, true);


--
-- Name: oc_flow_checks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_flow_checks_id_seq', 1, false);


--
-- Name: oc_flow_operations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_flow_operations_id_seq', 1, false);


--
-- Name: oc_flow_operations_scope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_flow_operations_scope_id_seq', 1, false);


--
-- Name: oc_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_jobs_id_seq', 224, true);


--
-- Name: oc_known_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_known_users_id_seq', 1, false);


--
-- Name: oc_login_flow_v2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_login_flow_v2_id_seq', 6, true);


--
-- Name: oc_mail_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_accounts_id_seq', 1, false);


--
-- Name: oc_mail_aliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_aliases_id_seq', 1, false);


--
-- Name: oc_mail_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_attachments_id_seq', 1, false);


--
-- Name: oc_mail_coll_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_coll_addresses_id_seq', 1, false);


--
-- Name: oc_mail_internal_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_internal_address_id_seq', 1, false);


--
-- Name: oc_mail_local_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_local_messages_id_seq', 1, false);


--
-- Name: oc_mail_mailboxes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_mailboxes_id_seq', 1, false);


--
-- Name: oc_mail_message_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_message_tags_id_seq', 1, false);


--
-- Name: oc_mail_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_messages_id_seq', 1, false);


--
-- Name: oc_mail_messages_retention_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_messages_retention_id_seq', 1, false);


--
-- Name: oc_mail_messages_snoozed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_messages_snoozed_id_seq', 1, false);


--
-- Name: oc_mail_provisionings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_provisionings_id_seq', 1, false);


--
-- Name: oc_mail_recipients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_recipients_id_seq', 1, false);


--
-- Name: oc_mail_smime_certificates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_smime_certificates_id_seq', 1, false);


--
-- Name: oc_mail_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_tags_id_seq', 1, false);


--
-- Name: oc_mail_trusted_senders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mail_trusted_senders_id_seq', 1, false);


--
-- Name: oc_mimetypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mimetypes_id_seq', 73, true);


--
-- Name: oc_mounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_mounts_id_seq', 33, true);


--
-- Name: oc_notes_meta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_notes_meta_id_seq', 1, true);


--
-- Name: oc_notifications_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_notifications_notification_id_seq', 41, true);


--
-- Name: oc_notifications_pushhash_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_notifications_pushhash_id_seq', 3, true);


--
-- Name: oc_notifications_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_notifications_settings_id_seq', 33, true);


--
-- Name: oc_oauth2_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_oauth2_access_tokens_id_seq', 1, false);


--
-- Name: oc_oauth2_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_oauth2_clients_id_seq', 1, false);


--
-- Name: oc_onlyoffice_filekey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_onlyoffice_filekey_id_seq', 2, true);


--
-- Name: oc_onlyoffice_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_onlyoffice_instance_id_seq', 1, false);


--
-- Name: oc_onlyoffice_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_onlyoffice_permissions_id_seq', 1, false);


--
-- Name: oc_open_local_editor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_open_local_editor_id_seq', 1, false);


--
-- Name: oc_photos_albums_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_photos_albums_album_id_seq', 1, false);


--
-- Name: oc_photos_albums_collabs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_photos_albums_collabs_id_seq', 1, false);


--
-- Name: oc_photos_albums_files_album_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_photos_albums_files_album_file_id_seq', 1, false);


--
-- Name: oc_preferences_ex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_preferences_ex_id_seq', 1, false);


--
-- Name: oc_privacy_admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_privacy_admins_id_seq', 1, false);


--
-- Name: oc_profile_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_profile_config_id_seq', 1, false);


--
-- Name: oc_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_properties_id_seq', 1, false);


--
-- Name: oc_ratelimit_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_ratelimit_entries_id_seq', 62, true);


--
-- Name: oc_reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_reactions_id_seq', 2, true);


--
-- Name: oc_recent_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_recent_contact_id_seq', 1, false);


--
-- Name: oc_richdocuments_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_richdocuments_assets_id_seq', 1, false);


--
-- Name: oc_richdocuments_direct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_richdocuments_direct_id_seq', 1, false);


--
-- Name: oc_richdocuments_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_richdocuments_template_id_seq', 1, false);


--
-- Name: oc_richdocuments_wopi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_richdocuments_wopi_id_seq', 9, true);


--
-- Name: oc_schedulingobjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_schedulingobjects_id_seq', 1, false);


--
-- Name: oc_sec_signatory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_sec_signatory_id_seq', 1, false);


--
-- Name: oc_share_external_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_share_external_id_seq', 1, false);


--
-- Name: oc_share_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_share_id_seq', 21, true);


--
-- Name: oc_storages_credentials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_storages_credentials_id_seq', 1, false);


--
-- Name: oc_storages_numeric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_storages_numeric_id_seq', 33, true);


--
-- Name: oc_systemtag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_systemtag_id_seq', 1, false);


--
-- Name: oc_talk_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_attachments_id_seq', 20, true);


--
-- Name: oc_talk_attendees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_attendees_id_seq', 5, true);


--
-- Name: oc_talk_bans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_bans_id_seq', 1, false);


--
-- Name: oc_talk_bots_conversation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_bots_conversation_id_seq', 1, false);


--
-- Name: oc_talk_bots_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_bots_server_id_seq', 1, false);


--
-- Name: oc_talk_bridges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_bridges_id_seq', 1, false);


--
-- Name: oc_talk_commands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_commands_id_seq', 1, false);


--
-- Name: oc_talk_consent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_consent_id_seq', 1, false);


--
-- Name: oc_talk_internalsignaling_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_internalsignaling_id_seq', 247, true);


--
-- Name: oc_talk_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_invitations_id_seq', 1, false);


--
-- Name: oc_talk_poll_votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_poll_votes_id_seq', 1, false);


--
-- Name: oc_talk_polls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_polls_id_seq', 1, false);


--
-- Name: oc_talk_proxy_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_proxy_messages_id_seq', 1, false);


--
-- Name: oc_talk_reminders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_reminders_id_seq', 1, false);


--
-- Name: oc_talk_retry_ocm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_retry_ocm_id_seq', 1, false);


--
-- Name: oc_talk_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_rooms_id_seq', 6, true);


--
-- Name: oc_talk_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_talk_sessions_id_seq', 71, true);


--
-- Name: oc_taskprocessing_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_taskprocessing_tasks_id_seq', 1, false);


--
-- Name: oc_text2image_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_text2image_tasks_id_seq', 1, false);


--
-- Name: oc_text_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_text_sessions_id_seq', 24, true);


--
-- Name: oc_text_steps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_text_steps_id_seq', 1, false);


--
-- Name: oc_textprocessing_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_textprocessing_tasks_id_seq', 1, false);


--
-- Name: oc_trusted_servers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_trusted_servers_id_seq', 1, false);


--
-- Name: oc_twofactor_backupcodes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_twofactor_backupcodes_id_seq', 1, false);


--
-- Name: oc_user_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_user_status_id_seq', 35, true);


--
-- Name: oc_user_transfer_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_user_transfer_owner_id_seq', 1, false);


--
-- Name: oc_vcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_vcategory_id_seq', 1, false);


--
-- Name: oc_webauthn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_webauthn_id_seq', 1, false);


--
-- Name: oc_webhook_listeners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_webhook_listeners_id_seq', 1, false);


--
-- Name: oc_whats_new_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_whats_new_id_seq', 1, true);


--
-- Name: oc_wopi_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_wopi_assets_id_seq', 1, false);


--
-- Name: oc_wopi_direct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_wopi_direct_id_seq', 1, false);


--
-- Name: oc_wopi_wopi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oc_x79
--

SELECT pg_catalog.setval('public.oc_wopi_wopi_id_seq', 1, false);


--
-- Name: oc_accounts_data oc_accounts_data_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_accounts_data
    ADD CONSTRAINT oc_accounts_data_pkey PRIMARY KEY (id);


--
-- Name: oc_accounts oc_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_accounts
    ADD CONSTRAINT oc_accounts_pkey PRIMARY KEY (uid);


--
-- Name: oc_activity_mq oc_activity_mq_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_activity_mq
    ADD CONSTRAINT oc_activity_mq_pkey PRIMARY KEY (mail_id);


--
-- Name: oc_activity oc_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_activity
    ADD CONSTRAINT oc_activity_pkey PRIMARY KEY (activity_id);


--
-- Name: oc_addressbookchanges oc_addressbookchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_addressbookchanges
    ADD CONSTRAINT oc_addressbookchanges_pkey PRIMARY KEY (id);


--
-- Name: oc_addressbooks oc_addressbooks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_addressbooks
    ADD CONSTRAINT oc_addressbooks_pkey PRIMARY KEY (id);


--
-- Name: oc_appconfig_ex oc_appconfig_ex_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_appconfig_ex
    ADD CONSTRAINT oc_appconfig_ex_pkey PRIMARY KEY (id);


--
-- Name: oc_appconfig oc_appconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_appconfig
    ADD CONSTRAINT oc_appconfig_pkey PRIMARY KEY (appid, configkey);


--
-- Name: oc_authorized_groups oc_authorized_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_authorized_groups
    ADD CONSTRAINT oc_authorized_groups_pkey PRIMARY KEY (id);


--
-- Name: oc_authtoken oc_authtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_authtoken
    ADD CONSTRAINT oc_authtoken_pkey PRIMARY KEY (id);


--
-- Name: oc_bruteforce_attempts oc_bruteforce_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_bruteforce_attempts
    ADD CONSTRAINT oc_bruteforce_attempts_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_appt_bookings oc_calendar_appt_bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_appt_bookings
    ADD CONSTRAINT oc_calendar_appt_bookings_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_appt_configs oc_calendar_appt_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_appt_configs
    ADD CONSTRAINT oc_calendar_appt_configs_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_invitations oc_calendar_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_invitations
    ADD CONSTRAINT oc_calendar_invitations_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_reminders oc_calendar_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_reminders
    ADD CONSTRAINT oc_calendar_reminders_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_resources_md oc_calendar_resources_md_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_resources_md
    ADD CONSTRAINT oc_calendar_resources_md_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_resources oc_calendar_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_resources
    ADD CONSTRAINT oc_calendar_resources_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_rooms_md oc_calendar_rooms_md_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_rooms_md
    ADD CONSTRAINT oc_calendar_rooms_md_pkey PRIMARY KEY (id);


--
-- Name: oc_calendar_rooms oc_calendar_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendar_rooms
    ADD CONSTRAINT oc_calendar_rooms_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarchanges oc_calendarchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendarchanges
    ADD CONSTRAINT oc_calendarchanges_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarobjects oc_calendarobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendarobjects
    ADD CONSTRAINT oc_calendarobjects_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarobjects_props oc_calendarobjects_props_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendarobjects_props
    ADD CONSTRAINT oc_calendarobjects_props_pkey PRIMARY KEY (id);


--
-- Name: oc_calendars oc_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendars
    ADD CONSTRAINT oc_calendars_pkey PRIMARY KEY (id);


--
-- Name: oc_calendarsubscriptions oc_calendarsubscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_calendarsubscriptions
    ADD CONSTRAINT oc_calendarsubscriptions_pkey PRIMARY KEY (id);


--
-- Name: oc_cards oc_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_cards
    ADD CONSTRAINT oc_cards_pkey PRIMARY KEY (id);


--
-- Name: oc_cards_properties oc_cards_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_cards_properties
    ADD CONSTRAINT oc_cards_properties_pkey PRIMARY KEY (id);


--
-- Name: oc_cfg_shares oc_cfg_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_cfg_shares
    ADD CONSTRAINT oc_cfg_shares_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_circle oc_circles_circle_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_circle
    ADD CONSTRAINT oc_circles_circle_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_event oc_circles_event_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_event
    ADD CONSTRAINT oc_circles_event_pkey PRIMARY KEY (token, instance);


--
-- Name: oc_circles_member oc_circles_member_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_member
    ADD CONSTRAINT oc_circles_member_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_membership oc_circles_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_membership
    ADD CONSTRAINT oc_circles_membership_pkey PRIMARY KEY (single_id, circle_id);


--
-- Name: oc_circles_mount oc_circles_mount_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_mount
    ADD CONSTRAINT oc_circles_mount_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_mountpoint oc_circles_mountpoint_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_mountpoint
    ADD CONSTRAINT oc_circles_mountpoint_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_remote oc_circles_remote_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_remote
    ADD CONSTRAINT oc_circles_remote_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_share_lock oc_circles_share_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_share_lock
    ADD CONSTRAINT oc_circles_share_lock_pkey PRIMARY KEY (id);


--
-- Name: oc_circles_token oc_circles_token_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_circles_token
    ADD CONSTRAINT oc_circles_token_pkey PRIMARY KEY (id);


--
-- Name: oc_collres_accesscache oc_collres_accesscache_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_collres_accesscache
    ADD CONSTRAINT oc_collres_accesscache_pkey PRIMARY KEY (user_id, collection_id, resource_type, resource_id);


--
-- Name: oc_collres_collections oc_collres_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_collres_collections
    ADD CONSTRAINT oc_collres_collections_pkey PRIMARY KEY (id);


--
-- Name: oc_collres_resources oc_collres_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_collres_resources
    ADD CONSTRAINT oc_collres_resources_pkey PRIMARY KEY (collection_id, resource_type, resource_id);


--
-- Name: oc_comments oc_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_comments
    ADD CONSTRAINT oc_comments_pkey PRIMARY KEY (id);


--
-- Name: oc_comments_read_markers oc_comments_read_markers_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_comments_read_markers
    ADD CONSTRAINT oc_comments_read_markers_pkey PRIMARY KEY (user_id, object_type, object_id);


--
-- Name: oc_dav_absence oc_dav_absence_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_dav_absence
    ADD CONSTRAINT oc_dav_absence_pkey PRIMARY KEY (id);


--
-- Name: oc_dav_cal_proxy oc_dav_cal_proxy_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_dav_cal_proxy
    ADD CONSTRAINT oc_dav_cal_proxy_pkey PRIMARY KEY (id);


--
-- Name: oc_dav_shares oc_dav_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_dav_shares
    ADD CONSTRAINT oc_dav_shares_pkey PRIMARY KEY (id);


--
-- Name: oc_direct_edit oc_direct_edit_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_direct_edit
    ADD CONSTRAINT oc_direct_edit_pkey PRIMARY KEY (id);


--
-- Name: oc_directlink oc_directlink_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_directlink
    ADD CONSTRAINT oc_directlink_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_apps_daemons oc_ex_apps_daemons_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_apps_daemons
    ADD CONSTRAINT oc_ex_apps_daemons_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_apps oc_ex_apps_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_apps
    ADD CONSTRAINT oc_ex_apps_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_apps_routes oc_ex_apps_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_apps_routes
    ADD CONSTRAINT oc_ex_apps_routes_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_deploy_options oc_ex_deploy_options_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_deploy_options
    ADD CONSTRAINT oc_ex_deploy_options_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_event_handlers oc_ex_event_handlers_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_event_handlers
    ADD CONSTRAINT oc_ex_event_handlers_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_occ_commands oc_ex_occ_commands_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_occ_commands
    ADD CONSTRAINT oc_ex_occ_commands_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_settings_forms oc_ex_settings_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_settings_forms
    ADD CONSTRAINT oc_ex_settings_forms_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_speech_to_text oc_ex_speech_to_text_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_speech_to_text
    ADD CONSTRAINT oc_ex_speech_to_text_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_speech_to_text_q oc_ex_speech_to_text_q_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_speech_to_text_q
    ADD CONSTRAINT oc_ex_speech_to_text_q_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_task_processing oc_ex_task_processing_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_task_processing
    ADD CONSTRAINT oc_ex_task_processing_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_text_processing oc_ex_text_processing_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_text_processing
    ADD CONSTRAINT oc_ex_text_processing_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_text_processing_q oc_ex_text_processing_q_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_text_processing_q
    ADD CONSTRAINT oc_ex_text_processing_q_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_translation oc_ex_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_translation
    ADD CONSTRAINT oc_ex_translation_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_translation_q oc_ex_translation_q_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_translation_q
    ADD CONSTRAINT oc_ex_translation_q_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_ui_files_actions oc_ex_ui_files_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_files_actions
    ADD CONSTRAINT oc_ex_ui_files_actions_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_ui_scripts oc_ex_ui_scripts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_scripts
    ADD CONSTRAINT oc_ex_ui_scripts_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_ui_states oc_ex_ui_states_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_states
    ADD CONSTRAINT oc_ex_ui_states_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_ui_styles oc_ex_ui_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_styles
    ADD CONSTRAINT oc_ex_ui_styles_pkey PRIMARY KEY (id);


--
-- Name: oc_ex_ui_top_menu oc_ex_ui_top_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ex_ui_top_menu
    ADD CONSTRAINT oc_ex_ui_top_menu_pkey PRIMARY KEY (id);


--
-- Name: oc_federated_reshares oc_federated_reshares_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_federated_reshares
    ADD CONSTRAINT oc_federated_reshares_pkey PRIMARY KEY (share_id);


--
-- Name: oc_file_locks oc_file_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_file_locks
    ADD CONSTRAINT oc_file_locks_pkey PRIMARY KEY (id);


--
-- Name: oc_filecache_extended oc_filecache_extended_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_filecache_extended
    ADD CONSTRAINT oc_filecache_extended_pkey PRIMARY KEY (fileid);


--
-- Name: oc_filecache oc_filecache_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_filecache
    ADD CONSTRAINT oc_filecache_pkey PRIMARY KEY (fileid);


--
-- Name: oc_files_metadata_index oc_files_metadata_index_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_metadata_index
    ADD CONSTRAINT oc_files_metadata_index_pkey PRIMARY KEY (id);


--
-- Name: oc_files_metadata oc_files_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_metadata
    ADD CONSTRAINT oc_files_metadata_pkey PRIMARY KEY (id);


--
-- Name: oc_files_reminders oc_files_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_reminders
    ADD CONSTRAINT oc_files_reminders_pkey PRIMARY KEY (id);


--
-- Name: oc_files_trash oc_files_trash_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_trash
    ADD CONSTRAINT oc_files_trash_pkey PRIMARY KEY (auto_id);


--
-- Name: oc_files_versions oc_files_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_files_versions
    ADD CONSTRAINT oc_files_versions_pkey PRIMARY KEY (id);


--
-- Name: oc_flow_checks oc_flow_checks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_flow_checks
    ADD CONSTRAINT oc_flow_checks_pkey PRIMARY KEY (id);


--
-- Name: oc_flow_operations oc_flow_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_flow_operations
    ADD CONSTRAINT oc_flow_operations_pkey PRIMARY KEY (id);


--
-- Name: oc_flow_operations_scope oc_flow_operations_scope_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_flow_operations_scope
    ADD CONSTRAINT oc_flow_operations_scope_pkey PRIMARY KEY (id);


--
-- Name: oc_group_admin oc_group_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_group_admin
    ADD CONSTRAINT oc_group_admin_pkey PRIMARY KEY (gid, uid);


--
-- Name: oc_group_user oc_group_user_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_group_user
    ADD CONSTRAINT oc_group_user_pkey PRIMARY KEY (gid, uid);


--
-- Name: oc_groups oc_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_groups
    ADD CONSTRAINT oc_groups_pkey PRIMARY KEY (gid);


--
-- Name: oc_jobs oc_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_jobs
    ADD CONSTRAINT oc_jobs_pkey PRIMARY KEY (id);


--
-- Name: oc_known_users oc_known_users_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_known_users
    ADD CONSTRAINT oc_known_users_pkey PRIMARY KEY (id);


--
-- Name: oc_login_flow_v2 oc_login_flow_v2_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_login_flow_v2
    ADD CONSTRAINT oc_login_flow_v2_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_accounts oc_mail_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_accounts
    ADD CONSTRAINT oc_mail_accounts_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_aliases oc_mail_aliases_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_aliases
    ADD CONSTRAINT oc_mail_aliases_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_attachments oc_mail_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_attachments
    ADD CONSTRAINT oc_mail_attachments_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_coll_addresses oc_mail_coll_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_coll_addresses
    ADD CONSTRAINT oc_mail_coll_addresses_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_internal_address oc_mail_internal_address_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_internal_address
    ADD CONSTRAINT oc_mail_internal_address_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_local_messages oc_mail_local_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_local_messages
    ADD CONSTRAINT oc_mail_local_messages_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_mailboxes oc_mail_mailboxes_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_mailboxes
    ADD CONSTRAINT oc_mail_mailboxes_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_message_tags oc_mail_message_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_message_tags
    ADD CONSTRAINT oc_mail_message_tags_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_messages oc_mail_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_messages
    ADD CONSTRAINT oc_mail_messages_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_messages_retention oc_mail_messages_retention_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_messages_retention
    ADD CONSTRAINT oc_mail_messages_retention_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_messages_snoozed oc_mail_messages_snoozed_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_messages_snoozed
    ADD CONSTRAINT oc_mail_messages_snoozed_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_provisionings oc_mail_provisionings_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_provisionings
    ADD CONSTRAINT oc_mail_provisionings_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_recipients oc_mail_recipients_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_recipients
    ADD CONSTRAINT oc_mail_recipients_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_smime_certificates oc_mail_smime_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_smime_certificates
    ADD CONSTRAINT oc_mail_smime_certificates_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_tags oc_mail_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_tags
    ADD CONSTRAINT oc_mail_tags_pkey PRIMARY KEY (id);


--
-- Name: oc_mail_trusted_senders oc_mail_trusted_senders_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_trusted_senders
    ADD CONSTRAINT oc_mail_trusted_senders_pkey PRIMARY KEY (id);


--
-- Name: oc_migrations oc_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_migrations
    ADD CONSTRAINT oc_migrations_pkey PRIMARY KEY (app, version);


--
-- Name: oc_mimetypes oc_mimetypes_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mimetypes
    ADD CONSTRAINT oc_mimetypes_pkey PRIMARY KEY (id);


--
-- Name: oc_mounts oc_mounts_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mounts
    ADD CONSTRAINT oc_mounts_pkey PRIMARY KEY (id);


--
-- Name: oc_notes_meta oc_notes_meta_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_notes_meta
    ADD CONSTRAINT oc_notes_meta_pkey PRIMARY KEY (id);


--
-- Name: oc_notifications oc_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_notifications
    ADD CONSTRAINT oc_notifications_pkey PRIMARY KEY (notification_id);


--
-- Name: oc_notifications_pushhash oc_notifications_pushhash_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_notifications_pushhash
    ADD CONSTRAINT oc_notifications_pushhash_pkey PRIMARY KEY (id);


--
-- Name: oc_notifications_settings oc_notifications_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_notifications_settings
    ADD CONSTRAINT oc_notifications_settings_pkey PRIMARY KEY (id);


--
-- Name: oc_oauth2_access_tokens oc_oauth2_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_oauth2_access_tokens
    ADD CONSTRAINT oc_oauth2_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oc_oauth2_clients oc_oauth2_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_oauth2_clients
    ADD CONSTRAINT oc_oauth2_clients_pkey PRIMARY KEY (id);


--
-- Name: oc_onlyoffice_filekey oc_onlyoffice_filekey_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_onlyoffice_filekey
    ADD CONSTRAINT oc_onlyoffice_filekey_pkey PRIMARY KEY (id);


--
-- Name: oc_onlyoffice_instance oc_onlyoffice_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_onlyoffice_instance
    ADD CONSTRAINT oc_onlyoffice_instance_pkey PRIMARY KEY (id);


--
-- Name: oc_onlyoffice_permissions oc_onlyoffice_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_onlyoffice_permissions
    ADD CONSTRAINT oc_onlyoffice_permissions_pkey PRIMARY KEY (id);


--
-- Name: oc_open_local_editor oc_open_local_editor_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_open_local_editor
    ADD CONSTRAINT oc_open_local_editor_pkey PRIMARY KEY (id);


--
-- Name: oc_photos_albums_collabs oc_photos_albums_collabs_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_photos_albums_collabs
    ADD CONSTRAINT oc_photos_albums_collabs_pkey PRIMARY KEY (id);


--
-- Name: oc_photos_albums_files oc_photos_albums_files_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_photos_albums_files
    ADD CONSTRAINT oc_photos_albums_files_pkey PRIMARY KEY (album_file_id);


--
-- Name: oc_photos_albums oc_photos_albums_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_photos_albums
    ADD CONSTRAINT oc_photos_albums_pkey PRIMARY KEY (album_id);


--
-- Name: oc_preferences_ex oc_preferences_ex_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_preferences_ex
    ADD CONSTRAINT oc_preferences_ex_pkey PRIMARY KEY (id);


--
-- Name: oc_preferences oc_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_preferences
    ADD CONSTRAINT oc_preferences_pkey PRIMARY KEY (userid, appid, configkey);


--
-- Name: oc_privacy_admins oc_privacy_admins_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_privacy_admins
    ADD CONSTRAINT oc_privacy_admins_pkey PRIMARY KEY (id);


--
-- Name: oc_profile_config oc_profile_config_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_profile_config
    ADD CONSTRAINT oc_profile_config_pkey PRIMARY KEY (id);


--
-- Name: oc_properties oc_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_properties
    ADD CONSTRAINT oc_properties_pkey PRIMARY KEY (id);


--
-- Name: oc_ratelimit_entries oc_ratelimit_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_ratelimit_entries
    ADD CONSTRAINT oc_ratelimit_entries_pkey PRIMARY KEY (id);


--
-- Name: oc_reactions oc_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_reactions
    ADD CONSTRAINT oc_reactions_pkey PRIMARY KEY (id);


--
-- Name: oc_recent_contact oc_recent_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_recent_contact
    ADD CONSTRAINT oc_recent_contact_pkey PRIMARY KEY (id);


--
-- Name: oc_richdocuments_assets oc_richdocuments_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_richdocuments_assets
    ADD CONSTRAINT oc_richdocuments_assets_pkey PRIMARY KEY (id);


--
-- Name: oc_richdocuments_direct oc_richdocuments_direct_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_richdocuments_direct
    ADD CONSTRAINT oc_richdocuments_direct_pkey PRIMARY KEY (id);


--
-- Name: oc_richdocuments_template oc_richdocuments_template_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_richdocuments_template
    ADD CONSTRAINT oc_richdocuments_template_pkey PRIMARY KEY (id);


--
-- Name: oc_richdocuments_wopi oc_richdocuments_wopi_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_richdocuments_wopi
    ADD CONSTRAINT oc_richdocuments_wopi_pkey PRIMARY KEY (id);


--
-- Name: oc_rocket_file_chats oc_rocket_file_chats_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_rocket_file_chats
    ADD CONSTRAINT oc_rocket_file_chats_pkey PRIMARY KEY (file_id);


--
-- Name: oc_rocket_users oc_rocket_users_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_rocket_users
    ADD CONSTRAINT oc_rocket_users_pkey PRIMARY KEY (nc_user_id);


--
-- Name: oc_schedulingobjects oc_schedulingobjects_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_schedulingobjects
    ADD CONSTRAINT oc_schedulingobjects_pkey PRIMARY KEY (id);


--
-- Name: oc_sec_signatory oc_sec_signatory_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_sec_signatory
    ADD CONSTRAINT oc_sec_signatory_pkey PRIMARY KEY (id);


--
-- Name: oc_share_external oc_share_external_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_share_external
    ADD CONSTRAINT oc_share_external_pkey PRIMARY KEY (id);


--
-- Name: oc_share oc_share_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_share
    ADD CONSTRAINT oc_share_pkey PRIMARY KEY (id);


--
-- Name: oc_shares_limits oc_shares_limits_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_shares_limits
    ADD CONSTRAINT oc_shares_limits_pkey PRIMARY KEY (id);


--
-- Name: oc_storages_credentials oc_storages_credentials_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_storages_credentials
    ADD CONSTRAINT oc_storages_credentials_pkey PRIMARY KEY (id);


--
-- Name: oc_storages oc_storages_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_storages
    ADD CONSTRAINT oc_storages_pkey PRIMARY KEY (numeric_id);


--
-- Name: oc_systemtag_group oc_systemtag_group_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_systemtag_group
    ADD CONSTRAINT oc_systemtag_group_pkey PRIMARY KEY (gid, systemtagid);


--
-- Name: oc_systemtag_object_mapping oc_systemtag_object_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_systemtag_object_mapping
    ADD CONSTRAINT oc_systemtag_object_mapping_pkey PRIMARY KEY (objecttype, objectid, systemtagid);


--
-- Name: oc_systemtag oc_systemtag_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_systemtag
    ADD CONSTRAINT oc_systemtag_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_attachments oc_talk_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_attachments
    ADD CONSTRAINT oc_talk_attachments_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_attendees oc_talk_attendees_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_attendees
    ADD CONSTRAINT oc_talk_attendees_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_bans oc_talk_bans_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_bans
    ADD CONSTRAINT oc_talk_bans_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_bots_conversation oc_talk_bots_conversation_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_bots_conversation
    ADD CONSTRAINT oc_talk_bots_conversation_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_bots_server oc_talk_bots_server_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_bots_server
    ADD CONSTRAINT oc_talk_bots_server_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_bridges oc_talk_bridges_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_bridges
    ADD CONSTRAINT oc_talk_bridges_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_commands oc_talk_commands_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_commands
    ADD CONSTRAINT oc_talk_commands_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_consent oc_talk_consent_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_consent
    ADD CONSTRAINT oc_talk_consent_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_internalsignaling oc_talk_internalsignaling_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_internalsignaling
    ADD CONSTRAINT oc_talk_internalsignaling_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_invitations oc_talk_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_invitations
    ADD CONSTRAINT oc_talk_invitations_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_poll_votes oc_talk_poll_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_poll_votes
    ADD CONSTRAINT oc_talk_poll_votes_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_polls oc_talk_polls_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_polls
    ADD CONSTRAINT oc_talk_polls_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_proxy_messages oc_talk_proxy_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_proxy_messages
    ADD CONSTRAINT oc_talk_proxy_messages_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_reminders oc_talk_reminders_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_reminders
    ADD CONSTRAINT oc_talk_reminders_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_retry_ocm oc_talk_retry_ocm_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_retry_ocm
    ADD CONSTRAINT oc_talk_retry_ocm_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_rooms oc_talk_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_rooms
    ADD CONSTRAINT oc_talk_rooms_pkey PRIMARY KEY (id);


--
-- Name: oc_talk_sessions oc_talk_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_talk_sessions
    ADD CONSTRAINT oc_talk_sessions_pkey PRIMARY KEY (id);


--
-- Name: oc_taskprocessing_tasks oc_taskprocessing_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_taskprocessing_tasks
    ADD CONSTRAINT oc_taskprocessing_tasks_pkey PRIMARY KEY (id);


--
-- Name: oc_text2image_tasks oc_text2image_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_text2image_tasks
    ADD CONSTRAINT oc_text2image_tasks_pkey PRIMARY KEY (id);


--
-- Name: oc_text_documents oc_text_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_text_documents
    ADD CONSTRAINT oc_text_documents_pkey PRIMARY KEY (id);


--
-- Name: oc_text_sessions oc_text_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_text_sessions
    ADD CONSTRAINT oc_text_sessions_pkey PRIMARY KEY (id);


--
-- Name: oc_text_steps oc_text_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_text_steps
    ADD CONSTRAINT oc_text_steps_pkey PRIMARY KEY (id);


--
-- Name: oc_textprocessing_tasks oc_textprocessing_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_textprocessing_tasks
    ADD CONSTRAINT oc_textprocessing_tasks_pkey PRIMARY KEY (id);


--
-- Name: oc_trusted_servers oc_trusted_servers_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_trusted_servers
    ADD CONSTRAINT oc_trusted_servers_pkey PRIMARY KEY (id);


--
-- Name: oc_twofactor_backupcodes oc_twofactor_backupcodes_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_twofactor_backupcodes
    ADD CONSTRAINT oc_twofactor_backupcodes_pkey PRIMARY KEY (id);


--
-- Name: oc_twofactor_providers oc_twofactor_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_twofactor_providers
    ADD CONSTRAINT oc_twofactor_providers_pkey PRIMARY KEY (provider_id, uid);


--
-- Name: oc_user_status oc_user_status_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_user_status
    ADD CONSTRAINT oc_user_status_pkey PRIMARY KEY (id);


--
-- Name: oc_user_transfer_owner oc_user_transfer_owner_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_user_transfer_owner
    ADD CONSTRAINT oc_user_transfer_owner_pkey PRIMARY KEY (id);


--
-- Name: oc_users oc_users_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_users
    ADD CONSTRAINT oc_users_pkey PRIMARY KEY (uid);


--
-- Name: oc_vcategory oc_vcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_vcategory
    ADD CONSTRAINT oc_vcategory_pkey PRIMARY KEY (id);


--
-- Name: oc_vcategory_to_object oc_vcategory_to_object_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_vcategory_to_object
    ADD CONSTRAINT oc_vcategory_to_object_pkey PRIMARY KEY (categoryid, objid, type);


--
-- Name: oc_webauthn oc_webauthn_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_webauthn
    ADD CONSTRAINT oc_webauthn_pkey PRIMARY KEY (id);


--
-- Name: oc_webhook_listeners oc_webhook_listeners_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_webhook_listeners
    ADD CONSTRAINT oc_webhook_listeners_pkey PRIMARY KEY (id);


--
-- Name: oc_whats_new oc_whats_new_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_whats_new
    ADD CONSTRAINT oc_whats_new_pkey PRIMARY KEY (id);


--
-- Name: oc_wopi_assets oc_wopi_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_wopi_assets
    ADD CONSTRAINT oc_wopi_assets_pkey PRIMARY KEY (id);


--
-- Name: oc_wopi_direct oc_wopi_direct_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_wopi_direct
    ADD CONSTRAINT oc_wopi_direct_pkey PRIMARY KEY (id);


--
-- Name: oc_wopi_locks oc_wopi_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_wopi_locks
    ADD CONSTRAINT oc_wopi_locks_pkey PRIMARY KEY (id);


--
-- Name: oc_wopi_tokens oc_wopi_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_wopi_tokens
    ADD CONSTRAINT oc_wopi_tokens_pkey PRIMARY KEY (id);


--
-- Name: oc_wopi_wopi oc_wopi_wopi_pkey; Type: CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_wopi_wopi
    ADD CONSTRAINT oc_wopi_wopi_pkey PRIMARY KEY (id);


--
-- Name: ac_lazy_i; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ac_lazy_i ON public.oc_appconfig USING btree (lazy);


--
-- Name: accounts_data_name; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX accounts_data_name ON public.oc_accounts_data USING btree (name);


--
-- Name: accounts_data_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX accounts_data_uid ON public.oc_accounts_data USING btree (uid);


--
-- Name: accounts_data_value; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX accounts_data_value ON public.oc_accounts_data USING btree (value);


--
-- Name: activity_filter; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX activity_filter ON public.oc_activity USING btree (affecteduser, type, app, "timestamp");


--
-- Name: activity_filter_by; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX activity_filter_by ON public.oc_activity USING btree (affecteduser, "user", "timestamp");


--
-- Name: activity_object; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX activity_object ON public.oc_activity USING btree (object_type, object_id);


--
-- Name: activity_user_time; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX activity_user_time ON public.oc_activity USING btree (affecteduser, "timestamp");


--
-- Name: addressbook_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX addressbook_index ON public.oc_addressbooks USING btree (principaluri, uri);


--
-- Name: addressbookid_synctoken; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX addressbookid_synctoken ON public.oc_addressbookchanges USING btree (addressbookid, synctoken);


--
-- Name: admindel_groupid_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX admindel_groupid_idx ON public.oc_authorized_groups USING btree (group_id);


--
-- Name: album_collabs_uniq_collab; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX album_collabs_uniq_collab ON public.oc_photos_albums_collabs USING btree (album_id, collaborator_id, collaborator_type);


--
-- Name: amp_latest_send_time; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX amp_latest_send_time ON public.oc_activity_mq USING btree (amq_latest_send);


--
-- Name: amp_timestamp_time; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX amp_timestamp_time ON public.oc_activity_mq USING btree (amq_timestamp);


--
-- Name: amp_user; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX amp_user ON public.oc_activity_mq USING btree (amq_affecteduser);


--
-- Name: appconfig_ex__configkey; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX appconfig_ex__configkey ON public.oc_appconfig_ex USING btree (configkey);


--
-- Name: appconfig_ex__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX appconfig_ex__idx ON public.oc_appconfig_ex USING btree (appid, configkey);


--
-- Name: authtoken_last_activity_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX authtoken_last_activity_idx ON public.oc_authtoken USING btree (last_activity);


--
-- Name: authtoken_token_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX authtoken_token_index ON public.oc_authtoken USING btree (token);


--
-- Name: authtoken_uid_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX authtoken_uid_index ON public.oc_authtoken USING btree (uid);


--
-- Name: bruteforce_attempts_ip; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX bruteforce_attempts_ip ON public.oc_bruteforce_attempts USING btree (ip);


--
-- Name: bruteforce_attempts_subnet; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX bruteforce_attempts_subnet ON public.oc_bruteforce_attempts USING btree (subnet);


--
-- Name: cal_appt_bk_token_uniq_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX cal_appt_bk_token_uniq_idx ON public.oc_calendar_appt_bookings USING btree (token);


--
-- Name: cal_appt_token_uniq_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX cal_appt_token_uniq_idx ON public.oc_calendar_appt_configs USING btree (token);


--
-- Name: calendar_invitation_tokens; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_invitation_tokens ON public.oc_calendar_invitations USING btree (token);


--
-- Name: calendar_reminder_objid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_reminder_objid ON public.oc_calendar_reminders USING btree (object_id);


--
-- Name: calendar_reminder_uidrec; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_reminder_uidrec ON public.oc_calendar_reminders USING btree (uid, recurrence_id);


--
-- Name: calendar_resources_bkdrsc; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_resources_bkdrsc ON public.oc_calendar_resources USING btree (backend_id, resource_id);


--
-- Name: calendar_resources_email; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_resources_email ON public.oc_calendar_resources USING btree (email);


--
-- Name: calendar_resources_md_idk; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_resources_md_idk ON public.oc_calendar_resources_md USING btree (resource_id, key);


--
-- Name: calendar_resources_name; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_resources_name ON public.oc_calendar_resources USING btree (displayname);


--
-- Name: calendar_rooms_bkdrsc; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_rooms_bkdrsc ON public.oc_calendar_rooms USING btree (backend_id, resource_id);


--
-- Name: calendar_rooms_email; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_rooms_email ON public.oc_calendar_rooms USING btree (email);


--
-- Name: calendar_rooms_md_idk; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_rooms_md_idk ON public.oc_calendar_rooms_md USING btree (room_id, key);


--
-- Name: calendar_rooms_name; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendar_rooms_name ON public.oc_calendar_rooms USING btree (displayname);


--
-- Name: calendarobject_calid_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendarobject_calid_index ON public.oc_calendarobjects_props USING btree (calendarid, calendartype);


--
-- Name: calendarobject_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendarobject_index ON public.oc_calendarobjects_props USING btree (objectid, calendartype);


--
-- Name: calendarobject_name_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendarobject_name_index ON public.oc_calendarobjects_props USING btree (name, calendartype);


--
-- Name: calendarobject_value_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calendarobject_value_index ON public.oc_calendarobjects_props USING btree (value, calendartype);


--
-- Name: calendars_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX calendars_index ON public.oc_calendars USING btree (principaluri, uri);


--
-- Name: calid_type_synctoken; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calid_type_synctoken ON public.oc_calendarchanges USING btree (calendarid, calendartype, synctoken);


--
-- Name: calobj_clssfction_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX calobj_clssfction_index ON public.oc_calendarobjects USING btree (classification);


--
-- Name: calobjects_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX calobjects_index ON public.oc_calendarobjects USING btree (calendarid, calendartype, uri);


--
-- Name: cals_princ_del_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX cals_princ_del_idx ON public.oc_calendars USING btree (principaluri, deleted_at);


--
-- Name: calsub_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX calsub_index ON public.oc_calendarsubscriptions USING btree (principaluri, uri);


--
-- Name: card_contactid_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX card_contactid_index ON public.oc_cards_properties USING btree (cardid);


--
-- Name: card_name_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX card_name_index ON public.oc_cards_properties USING btree (name);


--
-- Name: card_value_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX card_value_index ON public.oc_cards_properties USING btree (value);


--
-- Name: cards_abiduri; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX cards_abiduri ON public.oc_cards USING btree (addressbookid, uri);


--
-- Name: cards_prop_abid_name_value; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX cards_prop_abid_name_value ON public.oc_cards_properties USING btree (addressbookid, name, value);


--
-- Name: category_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX category_index ON public.oc_vcategory USING btree (category);


--
-- Name: cfg_shares_full_id; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX cfg_shares_full_id ON public.oc_cfg_shares USING btree (full_id);


--
-- Name: cfg_shares_node_id; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX cfg_shares_node_id ON public.oc_cfg_shares USING btree (node_id);


--
-- Name: cfg_shares_token; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX cfg_shares_token ON public.oc_cfg_shares USING btree (token);


--
-- Name: circles_member_cisi; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX circles_member_cisi ON public.oc_circles_member USING btree (circle_id, single_id);


--
-- Name: circles_member_cisiuiutil; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX circles_member_cisiuiutil ON public.oc_circles_member USING btree (circle_id, single_id, user_id, user_type, instance, level);


--
-- Name: circles_membership_ifilci; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX circles_membership_ifilci ON public.oc_circles_membership USING btree (inheritance_first, inheritance_last, circle_id);


--
-- Name: circles_mount_cimipt; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX circles_mount_cimipt ON public.oc_circles_mount USING btree (circle_id, mount_id, parent, token);


--
-- Name: circles_mountpoint_ms; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX circles_mountpoint_ms ON public.oc_circles_mountpoint USING btree (mount_id, single_id);


--
-- Name: collres_user_res; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX collres_user_res ON public.oc_collres_accesscache USING btree (user_id, resource_type, resource_id);


--
-- Name: comment_reaction; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX comment_reaction ON public.oc_reactions USING btree (reaction);


--
-- Name: comment_reaction_parent_id; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX comment_reaction_parent_id ON public.oc_reactions USING btree (parent_id);


--
-- Name: comment_reaction_unique; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX comment_reaction_unique ON public.oc_reactions USING btree (parent_id, actor_type, actor_id, reaction);


--
-- Name: comments_actor_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX comments_actor_index ON public.oc_comments USING btree (actor_type, actor_id);


--
-- Name: comments_marker_object_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX comments_marker_object_index ON public.oc_comments_read_markers USING btree (object_type, object_id);


--
-- Name: comments_object_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX comments_object_index ON public.oc_comments USING btree (object_type, object_id, creation_timestamp);


--
-- Name: comments_parent_id_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX comments_parent_id_index ON public.oc_comments USING btree (parent_id);


--
-- Name: comments_topmost_parent_id_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX comments_topmost_parent_id_idx ON public.oc_comments USING btree (topmost_parent_id);


--
-- Name: dav_absence_uid_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX dav_absence_uid_idx ON public.oc_dav_absence USING btree (user_id);


--
-- Name: dav_cal_proxy_ipid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX dav_cal_proxy_ipid ON public.oc_dav_cal_proxy USING btree (proxy_id);


--
-- Name: dav_cal_proxy_uidx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX dav_cal_proxy_uidx ON public.oc_dav_cal_proxy USING btree (owner_id, proxy_id, permissions);


--
-- Name: dav_shares_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX dav_shares_index ON public.oc_dav_shares USING btree (principaluri, resourceid, type, publicuri);


--
-- Name: dav_shares_resourceid_access; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX dav_shares_resourceid_access ON public.oc_dav_shares USING btree (resourceid, access);


--
-- Name: dav_shares_resourceid_type; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX dav_shares_resourceid_type ON public.oc_dav_shares USING btree (resourceid, type);


--
-- Name: deploy_options__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX deploy_options__idx ON public.oc_ex_deploy_options USING btree (appid, type);


--
-- Name: direct_edit_timestamp; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX direct_edit_timestamp ON public.oc_direct_edit USING btree ("timestamp");


--
-- Name: directlink_expiration_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX directlink_expiration_idx ON public.oc_directlink USING btree (expiration);


--
-- Name: directlink_token_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX directlink_token_idx ON public.oc_directlink USING btree (token);


--
-- Name: dname; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX dname ON public.oc_circles_circle USING btree (display_name);


--
-- Name: ex_apps__appid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ex_apps__appid ON public.oc_ex_apps USING btree (appid);


--
-- Name: ex_apps_c_port__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ex_apps_c_port__idx ON public.oc_ex_apps USING btree (daemon_config_name, port);


--
-- Name: ex_apps_daemons__name; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ex_apps_daemons__name ON public.oc_ex_apps_daemons USING btree (name);


--
-- Name: ex_apps_routes_appid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ex_apps_routes_appid ON public.oc_ex_apps_routes USING btree (appid);


--
-- Name: ex_event_handlers__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ex_event_handlers__idx ON public.oc_ex_event_handlers USING btree (appid, event_type);


--
-- Name: ex_occ_commands__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ex_occ_commands__idx ON public.oc_ex_occ_commands USING btree (appid, name);


--
-- Name: ex_settings_forms__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ex_settings_forms__idx ON public.oc_ex_settings_forms USING btree (appid, formid);


--
-- Name: ex_translation__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ex_translation__idx ON public.oc_ex_translation USING btree (appid, name);


--
-- Name: ex_ui_files_actions__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ex_ui_files_actions__idx ON public.oc_ex_ui_files_actions USING btree (appid, name);


--
-- Name: expire_date; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX expire_date ON public.oc_comments USING btree (expire_date);


--
-- Name: f_meta_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX f_meta_index ON public.oc_files_metadata_index USING btree (file_id, meta_key, meta_value_string);


--
-- Name: f_meta_index_i; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX f_meta_index_i ON public.oc_files_metadata_index USING btree (file_id, meta_key, meta_value_int);


--
-- Name: fce_ctime_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fce_ctime_idx ON public.oc_filecache_extended USING btree (creation_time);


--
-- Name: fce_utime_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fce_utime_idx ON public.oc_filecache_extended USING btree (upload_time);


--
-- Name: file_id_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX file_id_index ON public.oc_onlyoffice_filekey USING btree (file_id);


--
-- Name: file_source_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX file_source_index ON public.oc_share USING btree (file_source);


--
-- Name: files_meta_fileid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX files_meta_fileid ON public.oc_files_metadata USING btree (file_id);


--
-- Name: files_versions_uniq_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX files_versions_uniq_index ON public.oc_files_versions USING btree (file_id, "timestamp");


--
-- Name: flow_unique_hash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX flow_unique_hash ON public.oc_flow_checks USING btree (hash);


--
-- Name: flow_unique_scope; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX flow_unique_scope ON public.oc_flow_operations_scope USING btree (operation_id, type, value);


--
-- Name: fs_mtime; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fs_mtime ON public.oc_filecache USING btree (mtime);


--
-- Name: fs_name_hash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fs_name_hash ON public.oc_filecache USING btree (name);


--
-- Name: fs_parent; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fs_parent ON public.oc_filecache USING btree (parent);


--
-- Name: fs_parent_name_hash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fs_parent_name_hash ON public.oc_filecache USING btree (parent, name);


--
-- Name: fs_size; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fs_size ON public.oc_filecache USING btree (size);


--
-- Name: fs_storage_mimepart; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fs_storage_mimepart ON public.oc_filecache USING btree (storage, mimepart);


--
-- Name: fs_storage_mimetype; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fs_storage_mimetype ON public.oc_filecache USING btree (storage, mimetype);


--
-- Name: fs_storage_path_hash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX fs_storage_path_hash ON public.oc_filecache USING btree (storage, path_hash);


--
-- Name: fs_storage_size; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX fs_storage_size ON public.oc_filecache USING btree (storage, size, fileid);


--
-- Name: group_admin_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX group_admin_uid ON public.oc_group_admin USING btree (uid);


--
-- Name: gu_uid_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX gu_uid_index ON public.oc_group_user USING btree (uid);


--
-- Name: id_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX id_index ON public.oc_files_trash USING btree (id);


--
-- Name: idx_25c66a49e7a1254a; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_25c66a49e7a1254a ON public.oc_circles_member USING btree (contact_id);


--
-- Name: idx_38ce0470a64fab3c; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_38ce0470a64fab3c ON public.oc_ex_translation_q USING btree (finished);


--
-- Name: idx_4d5afeca5f37a13b; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_4d5afeca5f37a13b ON public.oc_direct_edit USING btree (token);


--
-- Name: idx_6c63d3ad31594979; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_6c63d3ad31594979 ON public.oc_mail_attachments USING btree (local_message_id);


--
-- Name: idx_6f1a533454177093; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_6f1a533454177093 ON public.oc_talk_bans USING btree (room_id);


--
-- Name: idx_715db7e31594979; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_715db7e31594979 ON public.oc_mail_recipients USING btree (local_message_id);


--
-- Name: idx_8195f5484230b1de; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_8195f5484230b1de ON public.oc_circles_circle USING btree (instance);


--
-- Name: idx_8195f5485f8a7f73; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_8195f5485f8a7f73 ON public.oc_circles_circle USING btree (source);


--
-- Name: idx_8195f548c317b362; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_8195f548c317b362 ON public.oc_circles_circle USING btree (sanitized_name);


--
-- Name: idx_8195f548d48a2f7c; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_8195f548d48a2f7c ON public.oc_circles_circle USING btree (config);


--
-- Name: idx_8fc816eae7c1d92b; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_8fc816eae7c1d92b ON public.oc_circles_membership USING btree (single_id);


--
-- Name: idx_c1e06c58a64fab3c; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_c1e06c58a64fab3c ON public.oc_ex_speech_to_text_q USING btree (finished);


--
-- Name: idx_cb97986aa64fab3c; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_cb97986aa64fab3c ON public.oc_ex_text_processing_q USING btree (finished);


--
-- Name: idx_f94ef8334f8e741; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_f94ef8334f8e741 ON public.oc_circles_remote USING btree (href);


--
-- Name: idx_f94ef83539b0606; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX idx_f94ef83539b0606 ON public.oc_circles_remote USING btree (uid);


--
-- Name: initiator_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX initiator_index ON public.oc_share USING btree (uid_initiator);


--
-- Name: item_share_type_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX item_share_type_index ON public.oc_share USING btree (item_type, share_type);


--
-- Name: job_argument_hash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX job_argument_hash ON public.oc_jobs USING btree (class, argument_hash);


--
-- Name: job_class_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX job_class_index ON public.oc_jobs USING btree (class);


--
-- Name: job_lastcheck_reserved; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX job_lastcheck_reserved ON public.oc_jobs USING btree (last_checked, reserved_at);


--
-- Name: jobs_time_sensitive; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX jobs_time_sensitive ON public.oc_jobs USING btree (time_sensitive);


--
-- Name: ku_known_to; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ku_known_to ON public.oc_known_users USING btree (known_to);


--
-- Name: ku_known_user; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ku_known_user ON public.oc_known_users USING btree (known_user);


--
-- Name: last_active; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX last_active ON public.oc_talk_rooms USING btree (last_activity);


--
-- Name: lock_key_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX lock_key_index ON public.oc_file_locks USING btree (key);


--
-- Name: lock_ttl_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX lock_ttl_index ON public.oc_file_locks USING btree (ttl);


--
-- Name: login_token; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX login_token ON public.oc_login_flow_v2 USING btree (login_token);


--
-- Name: mail_attach_userid_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_attach_userid_index ON public.oc_mail_attachments USING btree (user_id);


--
-- Name: mail_coll_addr_email_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_coll_addr_email_index ON public.oc_mail_coll_addresses USING btree (email);


--
-- Name: mail_coll_addr_userid_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_coll_addr_userid_index ON public.oc_mail_coll_addresses USING btree (user_id);


--
-- Name: mail_internal_address_uniq; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX mail_internal_address_uniq ON public.oc_mail_internal_address USING btree (address, user_id);


--
-- Name: mail_mb_account_id_name_hash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX mail_mb_account_id_name_hash ON public.oc_mail_mailboxes USING btree (account_id, name_hash);


--
-- Name: mail_messages_id_flags; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_messages_id_flags ON public.oc_mail_messages USING btree (mailbox_id, flag_important, flag_deleted, flag_seen);


--
-- Name: mail_messages_id_flags2; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_messages_id_flags2 ON public.oc_mail_messages USING btree (mailbox_id, flag_deleted, flag_flagged);


--
-- Name: mail_messages_mb_id_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_messages_mb_id_uid ON public.oc_mail_messages USING btree (mailbox_id, uid);


--
-- Name: mail_messages_msgid_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_messages_msgid_idx ON public.oc_mail_messages USING btree (message_id);


--
-- Name: mail_msg_imap_id_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_msg_imap_id_idx ON public.oc_mail_message_tags USING btree (imap_message_id);


--
-- Name: mail_msg_retention_mbuid_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX mail_msg_retention_mbuid_idx ON public.oc_mail_messages_retention USING btree (mailbox_id, uid);


--
-- Name: mail_msg_snoozed_mbuid_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX mail_msg_snoozed_mbuid_idx ON public.oc_mail_messages_snoozed USING btree (mailbox_id, uid);


--
-- Name: mail_msg_tags_usr_lbl_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX mail_msg_tags_usr_lbl_idx ON public.oc_mail_tags USING btree (user_id, imap_label);


--
-- Name: mail_provsng_dm_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX mail_provsng_dm_idx ON public.oc_mail_provisionings USING btree (provisioning_domain);


--
-- Name: mail_recipient_email_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_recipient_email_idx ON public.oc_mail_recipients USING btree (email);


--
-- Name: mail_recipient_msg_id_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_recipient_msg_id_idx ON public.oc_mail_recipients USING btree (message_id);


--
-- Name: mail_smime_certs_uid_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_smime_certs_uid_idx ON public.oc_mail_smime_certificates USING btree (user_id);


--
-- Name: mail_trusted_sender_uniq; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX mail_trusted_sender_uniq ON public.oc_mail_trusted_senders USING btree (email, user_id);


--
-- Name: mail_trusted_senders_type; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_trusted_senders_type ON public.oc_mail_trusted_senders USING btree (type);


--
-- Name: mail_userid_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mail_userid_index ON public.oc_mail_accounts USING btree (user_id);


--
-- Name: mimetype_id_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX mimetype_id_index ON public.oc_mimetypes USING btree (mimetype);


--
-- Name: mount_user_storage; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mount_user_storage ON public.oc_mounts USING btree (storage_id, user_id);


--
-- Name: mounts_class_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mounts_class_index ON public.oc_mounts USING btree (mount_provider_class);


--
-- Name: mounts_mount_id_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mounts_mount_id_index ON public.oc_mounts USING btree (mount_id);


--
-- Name: mounts_root_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mounts_root_index ON public.oc_mounts USING btree (root_id);


--
-- Name: mounts_storage_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mounts_storage_index ON public.oc_mounts USING btree (storage_id);


--
-- Name: mounts_user_root_path_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX mounts_user_root_path_index ON public.oc_mounts USING btree (user_id, root_id, mount_point);


--
-- Name: mp_sid_hash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX mp_sid_hash ON public.oc_circles_mountpoint USING btree (single_id, mountpoint_hash);


--
-- Name: notes_meta_file_id_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX notes_meta_file_id_index ON public.oc_notes_meta USING btree (file_id);


--
-- Name: notes_meta_file_user_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX notes_meta_file_user_index ON public.oc_notes_meta USING btree (file_id, user_id);


--
-- Name: notes_meta_user_id_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX notes_meta_user_id_index ON public.oc_notes_meta USING btree (user_id);


--
-- Name: notset_nextsend; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX notset_nextsend ON public.oc_notifications_settings USING btree (next_send_time);


--
-- Name: notset_user; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX notset_user ON public.oc_notifications_settings USING btree (user_id);


--
-- Name: oauth2_access_client_id_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX oauth2_access_client_id_idx ON public.oc_oauth2_access_tokens USING btree (client_id);


--
-- Name: oauth2_access_hash_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX oauth2_access_hash_idx ON public.oc_oauth2_access_tokens USING btree (hashed_code);


--
-- Name: oauth2_client_id_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX oauth2_client_id_idx ON public.oc_oauth2_clients USING btree (client_identifier);


--
-- Name: oauth2_tk_c_created_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX oauth2_tk_c_created_idx ON public.oc_oauth2_access_tokens USING btree (token_count, code_created_at);


--
-- Name: objects_in_room; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX objects_in_room ON public.oc_talk_attachments USING btree (room_id, object_type);


--
-- Name: oc_notifications_app; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX oc_notifications_app ON public.oc_notifications USING btree (app);


--
-- Name: oc_notifications_object; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX oc_notifications_object ON public.oc_notifications USING btree (object_type, object_id);


--
-- Name: oc_notifications_timestamp; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX oc_notifications_timestamp ON public.oc_notifications USING btree ("timestamp");


--
-- Name: oc_notifications_user; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX oc_notifications_user ON public.oc_notifications USING btree ("user");


--
-- Name: oc_npushhash_di; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX oc_npushhash_di ON public.oc_notifications_pushhash USING btree (deviceidentifier);


--
-- Name: oc_npushhash_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX oc_npushhash_uid ON public.oc_notifications_pushhash USING btree (uid, token);


--
-- Name: onlyoffice_remote_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX onlyoffice_remote_index ON public.oc_onlyoffice_instance USING btree (remote);


--
-- Name: openlocal_user_path_token; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX openlocal_user_path_token ON public.oc_open_local_editor USING btree (user_id, path_hash, token);


--
-- Name: owner_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX owner_index ON public.oc_share USING btree (uid_owner);


--
-- Name: pa_user; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX pa_user ON public.oc_photos_albums USING btree ("user");


--
-- Name: paf_album_file; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX paf_album_file ON public.oc_photos_albums_files USING btree (album_id, file_id);


--
-- Name: paf_folder; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX paf_folder ON public.oc_photos_albums_files USING btree (album_id);


--
-- Name: parent_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX parent_index ON public.oc_share USING btree (parent);


--
-- Name: poll_token; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX poll_token ON public.oc_login_flow_v2 USING btree (poll_token);


--
-- Name: preferences_ex__configkey; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX preferences_ex__configkey ON public.oc_preferences_ex USING btree (configkey);


--
-- Name: preferences_ex__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX preferences_ex__idx ON public.oc_preferences_ex USING btree (userid, appid, configkey);


--
-- Name: prefs_app_key_ind_fl_i; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX prefs_app_key_ind_fl_i ON public.oc_preferences USING btree (appid, configkey, indexed, flags);


--
-- Name: prefs_uid_lazy_i; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX prefs_uid_lazy_i ON public.oc_preferences USING btree (userid, lazy);


--
-- Name: profile_config_user_id_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX profile_config_user_id_idx ON public.oc_profile_config USING btree (user_id);


--
-- Name: properties_path_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX properties_path_index ON public.oc_properties USING btree (userid, propertypath);


--
-- Name: properties_pathonly_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX properties_pathonly_index ON public.oc_properties USING btree (propertypath);


--
-- Name: ratelimit_delete_after; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ratelimit_delete_after ON public.oc_ratelimit_entries USING btree (delete_after);


--
-- Name: ratelimit_hash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ratelimit_hash ON public.oc_ratelimit_entries USING btree (hash);


--
-- Name: rd_assets_timestamp_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX rd_assets_timestamp_idx ON public.oc_richdocuments_assets USING btree ("timestamp");


--
-- Name: rd_assets_token_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX rd_assets_token_idx ON public.oc_richdocuments_assets USING btree (token);


--
-- Name: rd_direct_timestamp_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX rd_direct_timestamp_idx ON public.oc_richdocuments_direct USING btree ("timestamp");


--
-- Name: rd_direct_token_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX rd_direct_token_idx ON public.oc_richdocuments_direct USING btree (token);


--
-- Name: rd_session_token_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX rd_session_token_idx ON public.oc_text_sessions USING btree (token);


--
-- Name: rd_steps_did_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX rd_steps_did_idx ON public.oc_text_steps USING btree (document_id);


--
-- Name: rd_steps_version_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX rd_steps_version_idx ON public.oc_text_steps USING btree (version);


--
-- Name: rd_t_user_file; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX rd_t_user_file ON public.oc_richdocuments_template USING btree (userid, fileid);


--
-- Name: rd_wopi_token_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX rd_wopi_token_idx ON public.oc_richdocuments_wopi USING btree (token);


--
-- Name: recent_contact_actor_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX recent_contact_actor_uid ON public.oc_recent_contact USING btree (actor_uid);


--
-- Name: recent_contact_email; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX recent_contact_email ON public.oc_recent_contact USING btree (email);


--
-- Name: recent_contact_fed_id; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX recent_contact_fed_id ON public.oc_recent_contact USING btree (federated_cloud_id);


--
-- Name: recent_contact_id_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX recent_contact_id_uid ON public.oc_recent_contact USING btree (id, actor_uid);


--
-- Name: recent_contact_last_contact; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX recent_contact_last_contact ON public.oc_recent_contact USING btree (last_contact);


--
-- Name: recent_contact_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX recent_contact_uid ON public.oc_recent_contact USING btree (uid);


--
-- Name: reminders_uniq_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX reminders_uniq_idx ON public.oc_files_reminders USING btree (user_id, file_id, due_date);


--
-- Name: remote_id; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX remote_id ON public.oc_talk_rooms USING btree (remote_server, remote_token);


--
-- Name: schedulobj_lastmodified_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX schedulobj_lastmodified_idx ON public.oc_schedulingobjects USING btree (lastmodified);


--
-- Name: schedulobj_principuri_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX schedulobj_principuri_index ON public.oc_schedulingobjects USING btree (principaluri);


--
-- Name: sec_sig_key; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX sec_sig_key ON public.oc_sec_signatory USING btree (key_id_sum, provider_id);


--
-- Name: sec_sig_unic; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX sec_sig_unic ON public.oc_sec_signatory USING btree (provider_id, host, account);


--
-- Name: sh_external_mp; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX sh_external_mp ON public.oc_share_external USING btree ("user", mountpoint_hash);


--
-- Name: share_id_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX share_id_index ON public.oc_onlyoffice_permissions USING btree (share_id);


--
-- Name: share_with_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX share_with_index ON public.oc_share USING btree (share_with);


--
-- Name: sicisimit; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX sicisimit ON public.oc_circles_token USING btree (share_id, circle_id, single_id, member_id, token);


--
-- Name: speech_to_text__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX speech_to_text__idx ON public.oc_ex_speech_to_text USING btree (appid, name);


--
-- Name: stocred_ui; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX stocred_ui ON public.oc_storages_credentials USING btree ("user", identifier);


--
-- Name: stocred_user; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX stocred_user ON public.oc_storages_credentials USING btree ("user");


--
-- Name: storages_id_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX storages_id_index ON public.oc_storages USING btree (id);


--
-- Name: systag_by_objectid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX systag_by_objectid ON public.oc_systemtag_object_mapping USING btree (objectid);


--
-- Name: systag_by_tagid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX systag_by_tagid ON public.oc_systemtag_object_mapping USING btree (systemtagid, objecttype);


--
-- Name: systag_objecttype; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX systag_objecttype ON public.oc_systemtag_object_mapping USING btree (objecttype);


--
-- Name: t2i_tasks_status; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX t2i_tasks_status ON public.oc_text2image_tasks USING btree (status);


--
-- Name: t2i_tasks_uid_appid_ident; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX t2i_tasks_uid_appid_ident ON public.oc_text2image_tasks USING btree (user_id, app_id, identifier);


--
-- Name: t2i_tasks_updated; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX t2i_tasks_updated ON public.oc_text2image_tasks USING btree (last_updated);


--
-- Name: ta_actor; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ta_actor ON public.oc_talk_attendees USING btree (actor_type, actor_id);


--
-- Name: ta_ident; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ta_ident ON public.oc_talk_attendees USING btree (room_id, actor_type, actor_id);


--
-- Name: ta_roompin; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ta_roompin ON public.oc_talk_attendees USING btree (room_id, pin);


--
-- Name: tag_ident; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX tag_ident ON public.oc_systemtag USING btree (name, visibility, editable);


--
-- Name: talk_bots_convo_token; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_bots_convo_token ON public.oc_talk_bots_conversation USING btree (token, state);


--
-- Name: talk_bots_convo_uniq; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX talk_bots_convo_uniq ON public.oc_talk_bots_conversation USING btree (bot_id, token);


--
-- Name: talk_bots_server_secret; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX talk_bots_server_secret ON public.oc_talk_bots_server USING btree (secret);


--
-- Name: talk_bots_server_state; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_bots_server_state ON public.oc_talk_bots_server USING btree (state);


--
-- Name: talk_bots_server_urlhash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX talk_bots_server_urlhash ON public.oc_talk_bots_server USING btree (url_hash);


--
-- Name: talk_fedinv_lri; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_fedinv_lri ON public.oc_talk_invitations USING btree (local_room_id);


--
-- Name: talk_fedinv_remote; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX talk_fedinv_remote ON public.oc_talk_invitations USING btree (remote_server_url, remote_attendee_id);


--
-- Name: talk_pcm_remote; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX talk_pcm_remote ON public.oc_talk_proxy_messages USING btree (remote_server_url, remote_token, remote_message_id);


--
-- Name: talk_pmc_local; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_pmc_local ON public.oc_talk_proxy_messages USING btree (local_token);


--
-- Name: talk_poll_room; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_poll_room ON public.oc_talk_polls USING btree (room_id);


--
-- Name: talk_poll_vote; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_poll_vote ON public.oc_talk_poll_votes USING btree (poll_id, actor_type, actor_id);


--
-- Name: talk_reccons_actor; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_reccons_actor ON public.oc_talk_consent USING btree (actor_id, actor_type);


--
-- Name: talk_reccons_token; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_reccons_token ON public.oc_talk_consent USING btree (token);


--
-- Name: talk_reminder_exectime; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_reminder_exectime ON public.oc_talk_reminders USING btree (date_time);


--
-- Name: talk_reminder_user_msg; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX talk_reminder_user_msg ON public.oc_talk_reminders USING btree (user_id, message_id);


--
-- Name: talk_retry_ocm_next; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_retry_ocm_next ON public.oc_talk_retry_ocm USING btree (next_retry);


--
-- Name: talk_room_bans; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX talk_room_bans ON public.oc_talk_bans USING btree (banned_actor_type, banned_actor_id, room_id);


--
-- Name: talk_user_state; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_user_state ON public.oc_talk_invitations USING btree (user_id, state);


--
-- Name: talk_vote_room; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX talk_vote_room ON public.oc_talk_poll_votes USING btree (room_id);


--
-- Name: task_processing_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX task_processing_idx ON public.oc_ex_task_processing USING btree (app_id, name, task_type);


--
-- Name: taskp_tasks_status_type; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX taskp_tasks_status_type ON public.oc_taskprocessing_tasks USING btree (status, type);


--
-- Name: taskp_tasks_uid_appid_cid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX taskp_tasks_uid_appid_cid ON public.oc_taskprocessing_tasks USING btree (user_id, app_id, custom_id);


--
-- Name: taskp_tasks_updated; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX taskp_tasks_updated ON public.oc_taskprocessing_tasks USING btree (last_updated);


--
-- Name: tbr_room_id; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX tbr_room_id ON public.oc_talk_bridges USING btree (room_id);


--
-- Name: text_processing__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX text_processing__idx ON public.oc_ex_text_processing USING btree (appid, name);


--
-- Name: textstep_session; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX textstep_session ON public.oc_text_steps USING btree (session_id);


--
-- Name: timestamp; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX "timestamp" ON public.oc_login_flow_v2 USING btree ("timestamp");


--
-- Name: timestamp_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX timestamp_index ON public.oc_files_trash USING btree ("timestamp");


--
-- Name: tis_recipient_time; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX tis_recipient_time ON public.oc_talk_internalsignaling USING btree (recipient, "timestamp");


--
-- Name: token_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX token_index ON public.oc_share USING btree (token);


--
-- Name: tp_tasks_status_type_nonunique; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX tp_tasks_status_type_nonunique ON public.oc_textprocessing_tasks USING btree (status, type);


--
-- Name: tp_tasks_uid_appid_ident; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX tp_tasks_uid_appid_ident ON public.oc_textprocessing_tasks USING btree (user_id, app_id, identifier);


--
-- Name: tp_tasks_updated; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX tp_tasks_updated ON public.oc_textprocessing_tasks USING btree (last_updated);


--
-- Name: tr_listable; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX tr_listable ON public.oc_talk_rooms USING btree (listable);


--
-- Name: tr_room_token; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX tr_room_token ON public.oc_talk_rooms USING btree (token);


--
-- Name: ts_attendee_id; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ts_attendee_id ON public.oc_talk_sessions USING btree (attendee_id);


--
-- Name: ts_docid_lastcontact; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ts_docid_lastcontact ON public.oc_text_sessions USING btree (document_id, last_contact);


--
-- Name: ts_in_call; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ts_in_call ON public.oc_talk_sessions USING btree (in_call);


--
-- Name: ts_last_ping; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ts_last_ping ON public.oc_talk_sessions USING btree (last_ping);


--
-- Name: ts_lastcontact; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX ts_lastcontact ON public.oc_text_sessions USING btree (last_contact);


--
-- Name: ts_session; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ts_session ON public.oc_talk_sessions USING btree (session_id);


--
-- Name: twofactor_backupcodes_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX twofactor_backupcodes_uid ON public.oc_twofactor_backupcodes USING btree (user_id);


--
-- Name: twofactor_providers_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX twofactor_providers_uid ON public.oc_twofactor_providers USING btree (uid);


--
-- Name: type_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX type_index ON public.oc_vcategory USING btree (type);


--
-- Name: ui_script__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ui_script__idx ON public.oc_ex_ui_scripts USING btree (appid, type, name, path);


--
-- Name: ui_state__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ui_state__idx ON public.oc_ex_ui_states USING btree (appid, type, name, key);


--
-- Name: ui_style__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ui_style__idx ON public.oc_ex_ui_styles USING btree (appid, type, name, path);


--
-- Name: ui_top_menu__idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX ui_top_menu__idx ON public.oc_ex_ui_top_menu USING btree (appid, name);


--
-- Name: uid_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX uid_index ON public.oc_vcategory USING btree (uid);


--
-- Name: uniq_337f52f8126f525e70ee2ff6; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX uniq_337f52f8126f525e70ee2ff6 ON public.oc_circles_share_lock USING btree (item_id, circle_id);


--
-- Name: uniq_8195f548e3c68343; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX uniq_8195f548e3c68343 ON public.oc_circles_circle USING btree (unique_id);


--
-- Name: uniq_f94ef834230b1de; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX uniq_f94ef834230b1de ON public.oc_circles_remote USING btree (instance);


--
-- Name: url_hash; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX url_hash ON public.oc_trusted_servers USING btree (url_hash);


--
-- Name: user_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX user_index ON public.oc_files_trash USING btree ("user");


--
-- Name: user_status_clr_ix; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX user_status_clr_ix ON public.oc_user_status USING btree (clear_at);


--
-- Name: user_status_iud_ix; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX user_status_iud_ix ON public.oc_user_status USING btree (is_user_defined, status);


--
-- Name: user_status_mtstmp_ix; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX user_status_mtstmp_ix ON public.oc_user_status USING btree (status_message_timestamp);


--
-- Name: user_status_tstmp_ix; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX user_status_tstmp_ix ON public.oc_user_status USING btree (status_timestamp);


--
-- Name: user_status_uid_ix; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX user_status_uid_ix ON public.oc_user_status USING btree (user_id);


--
-- Name: user_uid_lower; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX user_uid_lower ON public.oc_users USING btree (uid_lower);


--
-- Name: vcategory_objectd_index; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX vcategory_objectd_index ON public.oc_vcategory_to_object USING btree (objid, type);


--
-- Name: version; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX version ON public.oc_whats_new USING btree (version);


--
-- Name: version_etag_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX version_etag_idx ON public.oc_whats_new USING btree (version, etag);


--
-- Name: webauthn_publickeycredentialid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX webauthn_publickeycredentialid ON public.oc_webauthn USING btree (public_key_credential_id);


--
-- Name: webauthn_uid; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX webauthn_uid ON public.oc_webauthn USING btree (uid);


--
-- Name: wopi_assets_timestamp_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX wopi_assets_timestamp_idx ON public.oc_wopi_assets USING btree ("timestamp");


--
-- Name: wopi_assets_token_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX wopi_assets_token_idx ON public.oc_wopi_assets USING btree (token);


--
-- Name: wopi_direct_timestamp_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX wopi_direct_timestamp_idx ON public.oc_wopi_direct USING btree ("timestamp");


--
-- Name: wopi_direct_token_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX wopi_direct_token_idx ON public.oc_wopi_direct USING btree (token);


--
-- Name: wopi_locks_file_id; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX wopi_locks_file_id ON public.oc_wopi_locks USING btree (file_id);


--
-- Name: wopi_locks_valid_by; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX wopi_locks_valid_by ON public.oc_wopi_locks USING btree (valid_by);


--
-- Name: wopi_tokens_file_id; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX wopi_tokens_file_id ON public.oc_wopi_tokens USING btree (value);


--
-- Name: wopi_tokens_valid_by; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE INDEX wopi_tokens_valid_by ON public.oc_wopi_tokens USING btree (valid_by);


--
-- Name: wopi_wopi_token_idx; Type: INDEX; Schema: public; Owner: oc_x79
--

CREATE UNIQUE INDEX wopi_wopi_token_idx ON public.oc_wopi_wopi USING btree (token);


--
-- Name: oc_mail_attachments attachment_local_message; Type: FK CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_attachments
    ADD CONSTRAINT attachment_local_message FOREIGN KEY (local_message_id) REFERENCES public.oc_mail_local_messages(id) ON DELETE CASCADE;


--
-- Name: oc_mail_recipients recipient_local_message; Type: FK CONSTRAINT; Schema: public; Owner: oc_x79
--

ALTER TABLE ONLY public.oc_mail_recipients
    ADD CONSTRAINT recipient_local_message FOREIGN KEY (local_message_id) REFERENCES public.oc_mail_local_messages(id) ON DELETE CASCADE;


--
-- Name: DATABASE nextcloud; Type: ACL; Schema: -; Owner: nextcloud
--

REVOKE CONNECT,TEMPORARY ON DATABASE nextcloud FROM PUBLIC;
GRANT CONNECT ON DATABASE nextcloud TO oc_x79;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT CREATE ON SCHEMA public TO oc_x79;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.5 (Debian 17.5-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

