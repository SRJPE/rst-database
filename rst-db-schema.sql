--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Debian 12.11-1.pgdg110+1)
-- Dumped by pg_dump version 12.11 (Debian 12.11-1.pgdg110+1)

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
-- Name: states_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.states_enum AS ENUM (
    'CA',
    'OR',
    'WA'
);


ALTER TYPE public.states_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: agency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agency (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.agency OWNER TO postgres;

--
-- Name: body_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.body_part (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.body_part OWNER TO postgres;

--
-- Name: catch_raw; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catch_raw (
    catch_raw_id integer NOT NULL,
    program_id integer,
    trap_visit_id integer,
    taxon_code character varying(50),
    capture_run_code character varying(50),
    capture_run_code_method character varying(50),
    final_run_class character varying(100),
    final_run_class_method character varying(100),
    fish_origin_code character varying(50),
    life_stage_code character varying(50),
    fork_length numeric,
    total_length numeric,
    weight numeric,
    num_fish_caught integer,
    is_random boolean,
    release_id integer,
    comments character varying(500),
    data_sheet_number integer,
    data_recorder character varying(50),
    data_recorder_agency character varying(100),
    creation_at timestamp without time zone,
    updated_at timestamp without time zone,
    qc_completed boolean,
    qc_time timestamp without time zone,
    qc_comments character varying(100)
);


ALTER TABLE public.catch_raw OWNER TO postgres;

--
-- Name: catch_raw_catch_raw_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.catch_raw ALTER COLUMN catch_raw_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.catch_raw_catch_raw_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: fish_origin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_origin (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.fish_origin OWNER TO postgres;

--
-- Name: fish_processed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fish_processed (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.fish_processed OWNER TO postgres;

--
-- Name: life_stage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.life_stage (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.life_stage OWNER TO postgres;

--
-- Name: light_condition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.light_condition (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.light_condition OWNER TO postgres;

--
-- Name: mark_applied; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mark_applied (
    id integer NOT NULL,
    program_id integer,
    release_id integer,
    applied_mark_type character varying(50),
    applied_mark_color character varying(50),
    applied_mark_pos_id character varying(50),
    comments character varying(500),
    data_recorder character varying(50),
    data_recorder_agency character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    qc_done boolean,
    qc_done_at timestamp without time zone,
    qc_comments character varying(500)
);


ALTER TABLE public.mark_applied OWNER TO postgres;

--
-- Name: mark_applied_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mark_applied ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.mark_applied_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mark_color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mark_color (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.mark_color OWNER TO postgres;

--
-- Name: mark_existing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mark_existing (
    id integer NOT NULL,
    program_id integer,
    mark_type_code character varying(50),
    mark_color_code character varying(50),
    mark_position_id integer,
    mark_existing_id integer,
    mark_additional_code character varying(50),
    data_recorder character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    qc_completed boolean,
    qc_completed_at timestamp without time zone,
    qc_comments character varying(500)
);


ALTER TABLE public.mark_existing OWNER TO postgres;

--
-- Name: mark_existing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mark_existing ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.mark_existing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mark_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mark_type (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.mark_type OWNER TO postgres;

--
-- Name: project_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project_description (
    id integer NOT NULL,
    project_name character varying(20),
    project_desc character varying(50),
    main_contact_name character varying(100),
    main_contact_agency_id integer,
    main_contact_telephone character varying(50),
    main_contact_email character varying(100),
    address_one character varying(250),
    address_two character varying(250),
    city character varying(50),
    state public.states_enum,
    zip character varying(20),
    data_contact_name character varying(100),
    data_contact_telephone character varying(50),
    data_contact_email character varying(100),
    initial_date_year integer,
    comments character varying(500),
    active_id integer,
    data_recorder character varying(50),
    data_recorder_agency character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.project_description OWNER TO postgres;

--
-- Name: project_description_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.project_description ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.project_description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: release; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.release (
    id integer NOT NULL,
    program_id integer,
    release_purpose_code character varying(50),
    source_of_fish_site_id integer,
    release_site_id integer,
    time_of_check timestamp without time zone,
    num_fish_dead_at_handling integer,
    num_fish_dead_at_holding integer,
    num_fish_released integer,
    released_at timestamp without time zone,
    release_light_condition character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.release OWNER TO postgres;

--
-- Name: release_fish; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.release_fish (
    id integer NOT NULL,
    program_id integer,
    release_id integer,
    fork_length numeric,
    weight numeric,
    time_marked timestamp without time zone,
    comments character varying(500),
    data_sheet_number integer,
    data_recorder character varying(50),
    data_recorder_agency character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    qc_done boolean,
    qc_done_at timestamp without time zone,
    qc_comments character varying(500)
);


ALTER TABLE public.release_fish OWNER TO postgres;

--
-- Name: release_fish_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.release_fish ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.release_fish_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: release_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.release ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.release_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: release_purpose; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.release_purpose (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.release_purpose OWNER TO postgres;

--
-- Name: run; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.run (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.run OWNER TO postgres;

--
-- Name: run_code_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.run_code_method (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.run_code_method OWNER TO postgres;

--
-- Name: sample_gear; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sample_gear (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sample_gear OWNER TO postgres;

--
-- Name: site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site (
    id integer NOT NULL,
    site_name character varying(50),
    data_recorder character varying(50),
    data_recorder_agency character varying(100),
    site_abbrv character varying(50),
    start_operation_date date,
    end_operation_date date,
    stream_name character varying(100),
    river_mile numeric,
    trib_leads_to character varying(50),
    state public.states_enum,
    raw_x_coord numeric,
    raw_y_coord numeric,
    raw_coord_system character varying(50),
    raw_coord_method character varying(50),
    raw_datum character varying(50),
    raw_projection character varying(50),
    x_coord numeric,
    y_coord numeric,
    coord_system character varying(50),
    coord_method character varying(50),
    datum character varying(50),
    projection character varying(50),
    usgs_station_num character varying(15),
    comments character varying(500),
    active_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.site OWNER TO postgres;

--
-- Name: site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.site ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: taxon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxon (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.taxon OWNER TO postgres;

--
-- Name: trap_functionality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trap_functionality (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.trap_functionality OWNER TO postgres;

--
-- Name: trap_visit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trap_visit (
    id integer NOT NULL,
    program_id integer,
    visit_type_code character varying(50),
    trap_visit_time timestamp without time zone,
    fish_processed_code character varying(50),
    crew_id character varying(50),
    sample_gear_code character varying(50),
    trap_in_thalweg boolean,
    trap_functioning_code character varying(50),
    counter_at_end integer,
    rpm_revolution_at_start integer,
    rpm_revolution_at_end integer,
    in_half_cone_configuration boolean,
    debris_volume_code character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    qc_completed boolean,
    qc_completed_at timestamp without time zone,
    comments character varying(100)
);


ALTER TABLE public.trap_visit OWNER TO postgres;

--
-- Name: trap_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.trap_visit ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.trap_visit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: visit_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.visit_type (
    code character varying(50) NOT NULL,
    description character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.visit_type OWNER TO postgres;

--
-- Data for Name: agency; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agency (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: body_part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.body_part (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: catch_raw; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catch_raw (catch_raw_id, program_id, trap_visit_id, taxon_code, capture_run_code, capture_run_code_method, final_run_class, final_run_class_method, fish_origin_code, life_stage_code, fork_length, total_length, weight, num_fish_caught, is_random, release_id, comments, data_sheet_number, data_recorder, data_recorder_agency, creation_at, updated_at, qc_completed, qc_time, qc_comments) FROM stdin;
\.


--
-- Data for Name: fish_origin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_origin (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: fish_processed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fish_processed (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: life_stage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.life_stage (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: light_condition; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.light_condition (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mark_applied; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mark_applied (id, program_id, release_id, applied_mark_type, applied_mark_color, applied_mark_pos_id, comments, data_recorder, data_recorder_agency, created_at, updated_at, qc_done, qc_done_at, qc_comments) FROM stdin;
\.


--
-- Data for Name: mark_color; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mark_color (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mark_existing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mark_existing (id, program_id, mark_type_code, mark_color_code, mark_position_id, mark_existing_id, mark_additional_code, data_recorder, created_at, updated_at, qc_completed, qc_completed_at, qc_comments) FROM stdin;
\.


--
-- Data for Name: mark_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mark_type (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: project_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project_description (id, project_name, project_desc, main_contact_name, main_contact_agency_id, main_contact_telephone, main_contact_email, address_one, address_two, city, state, zip, data_contact_name, data_contact_telephone, data_contact_email, initial_date_year, comments, active_id, data_recorder, data_recorder_agency, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: release; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.release (id, program_id, release_purpose_code, source_of_fish_site_id, release_site_id, time_of_check, num_fish_dead_at_handling, num_fish_dead_at_holding, num_fish_released, released_at, release_light_condition, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: release_fish; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.release_fish (id, program_id, release_id, fork_length, weight, time_marked, comments, data_sheet_number, data_recorder, data_recorder_agency, created_at, updated_at, qc_done, qc_done_at, qc_comments) FROM stdin;
\.


--
-- Data for Name: release_purpose; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.release_purpose (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: run; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.run (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: run_code_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.run_code_method (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sample_gear; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sample_gear (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site (id, site_name, data_recorder, data_recorder_agency, site_abbrv, start_operation_date, end_operation_date, stream_name, river_mile, trib_leads_to, state, raw_x_coord, raw_y_coord, raw_coord_system, raw_coord_method, raw_datum, raw_projection, x_coord, y_coord, coord_system, coord_method, datum, projection, usgs_station_num, comments, active_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: taxon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxon (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: trap_functionality; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trap_functionality (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: trap_visit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trap_visit (id, program_id, visit_type_code, trap_visit_time, fish_processed_code, crew_id, sample_gear_code, trap_in_thalweg, trap_functioning_code, counter_at_end, rpm_revolution_at_start, rpm_revolution_at_end, in_half_cone_configuration, debris_volume_code, created_at, updated_at, qc_completed, qc_completed_at, comments) FROM stdin;
\.


--
-- Data for Name: visit_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.visit_type (code, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: catch_raw_catch_raw_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.catch_raw_catch_raw_id_seq', 1, false);


--
-- Name: mark_applied_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mark_applied_id_seq', 1, false);


--
-- Name: mark_existing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mark_existing_id_seq', 1, false);


--
-- Name: project_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_description_id_seq', 1, false);


--
-- Name: release_fish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.release_fish_id_seq', 1, false);


--
-- Name: release_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.release_id_seq', 1, false);


--
-- Name: site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_id_seq', 1, false);


--
-- Name: trap_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trap_visit_id_seq', 1, false);


--
-- Name: agency agency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agency
    ADD CONSTRAINT agency_pkey PRIMARY KEY (code);


--
-- Name: body_part body_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.body_part
    ADD CONSTRAINT body_part_pkey PRIMARY KEY (code);


--
-- Name: catch_raw catch_raw_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_pkey PRIMARY KEY (catch_raw_id);


--
-- Name: fish_origin fish_origin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_origin
    ADD CONSTRAINT fish_origin_pkey PRIMARY KEY (code);


--
-- Name: fish_processed fish_processed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fish_processed
    ADD CONSTRAINT fish_processed_pkey PRIMARY KEY (code);


--
-- Name: life_stage life_stage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.life_stage
    ADD CONSTRAINT life_stage_pkey PRIMARY KEY (code);


--
-- Name: light_condition light_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.light_condition
    ADD CONSTRAINT light_condition_pkey PRIMARY KEY (code);


--
-- Name: mark_applied mark_applied_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_applied
    ADD CONSTRAINT mark_applied_pkey PRIMARY KEY (id);


--
-- Name: mark_color mark_color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_color
    ADD CONSTRAINT mark_color_pkey PRIMARY KEY (code);


--
-- Name: mark_existing mark_existing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_existing
    ADD CONSTRAINT mark_existing_pkey PRIMARY KEY (id);


--
-- Name: mark_type mark_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_type
    ADD CONSTRAINT mark_type_pkey PRIMARY KEY (code);


--
-- Name: project_description project_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_description
    ADD CONSTRAINT project_description_pkey PRIMARY KEY (id);


--
-- Name: release_fish release_fish_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_fish
    ADD CONSTRAINT release_fish_pkey PRIMARY KEY (id);


--
-- Name: release release_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_pkey PRIMARY KEY (id);


--
-- Name: release_purpose release_purpose_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_purpose
    ADD CONSTRAINT release_purpose_pkey PRIMARY KEY (code);


--
-- Name: run_code_method run_code_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.run_code_method
    ADD CONSTRAINT run_code_method_pkey PRIMARY KEY (code);


--
-- Name: run run_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.run
    ADD CONSTRAINT run_pkey PRIMARY KEY (code);


--
-- Name: sample_gear sample_gear_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sample_gear
    ADD CONSTRAINT sample_gear_pkey PRIMARY KEY (code);


--
-- Name: site site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_pkey PRIMARY KEY (id);


--
-- Name: taxon taxon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxon
    ADD CONSTRAINT taxon_pkey PRIMARY KEY (code);


--
-- Name: trap_functionality trap_functionality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trap_functionality
    ADD CONSTRAINT trap_functionality_pkey PRIMARY KEY (code);


--
-- Name: trap_visit trap_visit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trap_visit
    ADD CONSTRAINT trap_visit_pkey PRIMARY KEY (id);


--
-- Name: visit_type visit_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.visit_type
    ADD CONSTRAINT visit_type_pkey PRIMARY KEY (code);


--
-- Name: catch_raw catch_raw_capture_run_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_capture_run_code_fkey FOREIGN KEY (capture_run_code) REFERENCES public.run(code);


--
-- Name: catch_raw catch_raw_capture_run_code_method_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_capture_run_code_method_fkey FOREIGN KEY (capture_run_code_method) REFERENCES public.run_code_method(code);


--
-- Name: catch_raw catch_raw_data_recorder_agency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_data_recorder_agency_fkey FOREIGN KEY (data_recorder_agency) REFERENCES public.agency(code);


--
-- Name: catch_raw catch_raw_final_run_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_final_run_class_fkey FOREIGN KEY (final_run_class) REFERENCES public.run(code);


--
-- Name: catch_raw catch_raw_final_run_class_method_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_final_run_class_method_fkey FOREIGN KEY (final_run_class_method) REFERENCES public.run_code_method(code);


--
-- Name: catch_raw catch_raw_fish_origin_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_fish_origin_code_fkey FOREIGN KEY (fish_origin_code) REFERENCES public.fish_origin(code);


--
-- Name: catch_raw catch_raw_life_stage_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_life_stage_code_fkey FOREIGN KEY (life_stage_code) REFERENCES public.life_stage(code);


--
-- Name: catch_raw catch_raw_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.project_description(id);


--
-- Name: catch_raw catch_raw_taxon_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_taxon_code_fkey FOREIGN KEY (taxon_code) REFERENCES public.taxon(code);


--
-- Name: catch_raw catch_raw_trap_visit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catch_raw
    ADD CONSTRAINT catch_raw_trap_visit_id_fkey FOREIGN KEY (trap_visit_id) REFERENCES public.trap_visit(id);


--
-- Name: mark_applied mark_applied_applied_mark_color_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_applied
    ADD CONSTRAINT mark_applied_applied_mark_color_fkey FOREIGN KEY (applied_mark_color) REFERENCES public.mark_color(code);


--
-- Name: mark_applied mark_applied_applied_mark_pos_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_applied
    ADD CONSTRAINT mark_applied_applied_mark_pos_id_fkey FOREIGN KEY (applied_mark_pos_id) REFERENCES public.body_part(code);


--
-- Name: mark_applied mark_applied_applied_mark_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_applied
    ADD CONSTRAINT mark_applied_applied_mark_type_fkey FOREIGN KEY (applied_mark_type) REFERENCES public.mark_type(code);


--
-- Name: mark_applied mark_applied_data_recorder_agency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_applied
    ADD CONSTRAINT mark_applied_data_recorder_agency_fkey FOREIGN KEY (data_recorder_agency) REFERENCES public.agency(code);


--
-- Name: mark_applied mark_applied_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_applied
    ADD CONSTRAINT mark_applied_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.project_description(id);


--
-- Name: mark_applied mark_applied_release_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_applied
    ADD CONSTRAINT mark_applied_release_id_fkey FOREIGN KEY (release_id) REFERENCES public.release(id);


--
-- Name: mark_existing mark_existing_mark_color_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_existing
    ADD CONSTRAINT mark_existing_mark_color_code_fkey FOREIGN KEY (mark_color_code) REFERENCES public.mark_color(code);


--
-- Name: mark_existing mark_existing_mark_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_existing
    ADD CONSTRAINT mark_existing_mark_type_code_fkey FOREIGN KEY (mark_type_code) REFERENCES public.mark_type(code);


--
-- Name: mark_existing mark_existing_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark_existing
    ADD CONSTRAINT mark_existing_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.project_description(id);


--
-- Name: project_description project_description_data_recorder_agency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project_description
    ADD CONSTRAINT project_description_data_recorder_agency_fkey FOREIGN KEY (data_recorder_agency) REFERENCES public.agency(code);


--
-- Name: release_fish release_fish_data_recorder_agency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_fish
    ADD CONSTRAINT release_fish_data_recorder_agency_fkey FOREIGN KEY (data_recorder_agency) REFERENCES public.agency(code);


--
-- Name: release_fish release_fish_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_fish
    ADD CONSTRAINT release_fish_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.project_description(id);


--
-- Name: release_fish release_fish_release_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release_fish
    ADD CONSTRAINT release_fish_release_id_fkey FOREIGN KEY (release_id) REFERENCES public.release(id);


--
-- Name: release release_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.project_description(id);


--
-- Name: release release_release_light_condition_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_release_light_condition_fkey FOREIGN KEY (release_light_condition) REFERENCES public.light_condition(code);


--
-- Name: release release_release_purpose_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_release_purpose_code_fkey FOREIGN KEY (release_purpose_code) REFERENCES public.release_purpose(code);


--
-- Name: release release_release_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_release_site_id_fkey FOREIGN KEY (release_site_id) REFERENCES public.site(id);


--
-- Name: release release_source_of_fish_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.release
    ADD CONSTRAINT release_source_of_fish_site_id_fkey FOREIGN KEY (source_of_fish_site_id) REFERENCES public.site(id);


--
-- Name: site site_data_recorder_agency_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site
    ADD CONSTRAINT site_data_recorder_agency_fkey FOREIGN KEY (data_recorder_agency) REFERENCES public.agency(code);


--
-- Name: trap_visit trap_visit_fish_processed_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trap_visit
    ADD CONSTRAINT trap_visit_fish_processed_code_fkey FOREIGN KEY (fish_processed_code) REFERENCES public.fish_processed(code);


--
-- Name: trap_visit trap_visit_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trap_visit
    ADD CONSTRAINT trap_visit_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.project_description(id);


--
-- Name: trap_visit trap_visit_sample_gear_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trap_visit
    ADD CONSTRAINT trap_visit_sample_gear_code_fkey FOREIGN KEY (sample_gear_code) REFERENCES public.sample_gear(code);


--
-- Name: trap_visit trap_visit_trap_functioning_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trap_visit
    ADD CONSTRAINT trap_visit_trap_functioning_code_fkey FOREIGN KEY (trap_functioning_code) REFERENCES public.trap_functionality(code);


--
-- Name: trap_visit trap_visit_visit_type_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trap_visit
    ADD CONSTRAINT trap_visit_visit_type_code_fkey FOREIGN KEY (visit_type_code) REFERENCES public.visit_type(code);


--
-- PostgreSQL database dump complete
--

