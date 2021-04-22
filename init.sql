--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-22 00:20:55 UTC

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
-- TOC entry 548 (class 1247 OID 16387)
-- Name: coordinate; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.coordinate AS (
	x real,
	y real
);


ALTER TYPE public.coordinate OWNER TO postgres;

--
-- TOC entry 551 (class 1247 OID 16390)
-- Name: days; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.days AS (
	mon boolean,
	tue boolean,
	wed boolean,
	thu boolean,
	fri boolean,
	sat boolean,
	sun boolean
);


ALTER TYPE public.days OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 16391)
-- Name: gardens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gardens (
    garden_id integer NOT NULL,
    coords public.coordinate,
    zip_code integer,
    date_created timestamp with time zone DEFAULT now() NOT NULL,
    last_modified date,
    email text NOT NULL
);


ALTER TABLE public.gardens OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16398)
-- Name: gardens_garden_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gardens_garden_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gardens_garden_id_seq OWNER TO postgres;

--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 205
-- Name: gardens_garden_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gardens_garden_id_seq OWNED BY public.gardens.garden_id;


--
-- TOC entry 206 (class 1259 OID 16400)
-- Name: plant_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_types (
    plant_type_id integer NOT NULL,
    name text NOT NULL,
    gallons_per_week real NOT NULL,
    early_stage boolean
);


ALTER TABLE public.plant_types OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16406)
-- Name: plant_types_plant_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plant_types_plant_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plant_types_plant_type_id_seq OWNER TO postgres;

--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 207
-- Name: plant_types_plant_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plant_types_plant_type_id_seq OWNED BY public.plant_types.plant_type_id;


--
-- TOC entry 208 (class 1259 OID 16408)
-- Name: plants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants (
    plant_count integer,
    garden_id integer NOT NULL,
    plant_type_id integer NOT NULL,
    date_created timestamp with time zone DEFAULT now() NOT NULL,
    last_modified date
);


ALTER TABLE public.plants OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16412)
-- Name: rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rules (
    rule_id integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    days public.days,
    date_created timestamp with time zone DEFAULT now() NOT NULL,
    last_modified date,
    garden_id integer NOT NULL
);


ALTER TABLE public.rules OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16419)
-- Name: rules_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rules_rule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rules_rule_id_seq OWNER TO postgres;

--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 210
-- Name: rules_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rules_rule_id_seq OWNED BY public.rules.rule_id;


--
-- TOC entry 211 (class 1259 OID 16421)
-- Name: sensor_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor_data (
    garden_id integer NOT NULL,
    humidity real NOT NULL,
    temperature real NOT NULL,
    moisture real NOT NULL,
    light real NOT NULL,
    date_created timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sensor_data OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16425)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    firstname text NOT NULL,
    middlename text,
    lastname text,
    user_id integer NOT NULL,
    email text NOT NULL,
    password text,
    date_created timestamp with time zone DEFAULT now() NOT NULL,
    last_modified date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16432)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 213
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 214 (class 1259 OID 16434)
-- Name: weather_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weather_data (
    date_recieved timestamp with time zone NOT NULL,
    temp real,
    temp_min real,
    temp_max real,
    humidity real,
    precip real,
    garden_id integer NOT NULL
);


ALTER TABLE public.weather_data OWNER TO postgres;

--
-- TOC entry 2820 (class 2604 OID 16437)
-- Name: gardens garden_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gardens ALTER COLUMN garden_id SET DEFAULT nextval('public.gardens_garden_id_seq'::regclass);


--
-- TOC entry 2821 (class 2604 OID 16438)
-- Name: plant_types plant_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_types ALTER COLUMN plant_type_id SET DEFAULT nextval('public.plant_types_plant_type_id_seq'::regclass);


--
-- TOC entry 2824 (class 2604 OID 16439)
-- Name: rules rule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules ALTER COLUMN rule_id SET DEFAULT nextval('public.rules_rule_id_seq'::regclass);


--
-- TOC entry 2827 (class 2604 OID 16440)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 2974 (class 0 OID 16391)
-- Dependencies: 204
-- Data for Name: gardens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gardens (garden_id, coords, zip_code, date_created, last_modified, email) FROM stdin;
1	(78.8765,48.8761)	97330	2021-04-21 04:34:03.290038+00	\N	jbarringer1999@gmail.com
2	(48.8761,78.8765)	97031	2021-04-21 04:36:19.96024+00	\N	jbarringer1999@gmail.com
\.


--
-- TOC entry 2976 (class 0 OID 16400)
-- Dependencies: 206
-- Data for Name: plant_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_types (plant_type_id, name, gallons_per_week, early_stage) FROM stdin;
1	Carrot	1	f
2	Corn	2	t
3	Lettuce	2	f
4	Squash	1	f
5	Tomato	2	t
\.


--
-- TOC entry 2978 (class 0 OID 16408)
-- Dependencies: 208
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants (plant_count, garden_id, plant_type_id, date_created, last_modified) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 16412)
-- Dependencies: 209
-- Data for Name: rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rules (rule_id, start_time, end_time, days, date_created, last_modified, garden_id) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 16421)
-- Dependencies: 211
-- Data for Name: sensor_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor_data (garden_id, humidity, temperature, moisture, light, date_created) FROM stdin;
1	4.98	58.98	18.09	14.11	2021-04-21 04:40:38.325082+00
1	77.6	2.37	70.65	63.8	2021-04-20 04:40:38.325082+00
1	74.86	32.1	11.14	26.05	2021-04-19 04:40:38.325082+00
1	34.76	87.39	70.62	88.82	2021-04-18 04:40:38.325082+00
1	97.69	78.86	59.26	6.16	2021-04-17 04:40:38.325082+00
\.


--
-- TOC entry 2982 (class 0 OID 16425)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (firstname, middlename, lastname, user_id, email, password, date_created, last_modified) FROM stdin;
Joshua	David	Barringer	1	jbarringer1999@gmail.com	youre_smart	2021-04-21 04:29:13.223984+00	\N
Test		User	2	test_email@gmail.com	password8	2021-04-21 04:29:52.180072+00	\N
\.


--
-- TOC entry 2984 (class 0 OID 16434)
-- Dependencies: 214
-- Data for Name: weather_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather_data (date_recieved, temp, temp_min, temp_max, humidity, precip, garden_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 205
-- Name: gardens_garden_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gardens_garden_id_seq', 2, true);


--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 207
-- Name: plant_types_plant_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_types_plant_type_id_seq', 5, true);


--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 210
-- Name: rules_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rules_rule_id_seq', 1, false);


--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 213
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- TOC entry 2829 (class 2606 OID 16442)
-- Name: gardens gardens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gardens
    ADD CONSTRAINT gardens_pkey PRIMARY KEY (garden_id);


--
-- TOC entry 2839 (class 2606 OID 16444)
-- Name: users no_email_dupes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT no_email_dupes UNIQUE (email);


--
-- TOC entry 2831 (class 2606 OID 16446)
-- Name: plant_types plant_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_types
    ADD CONSTRAINT plant_types_pkey PRIMARY KEY (plant_type_id);


--
-- TOC entry 2833 (class 2606 OID 16448)
-- Name: plants plants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (garden_id, plant_type_id);


--
-- TOC entry 2835 (class 2606 OID 16450)
-- Name: rules rule_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rule_id UNIQUE (rule_id);


--
-- TOC entry 2837 (class 2606 OID 16452)
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (rule_id);


--
-- TOC entry 2841 (class 2606 OID 16454)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2842 (class 2606 OID 16455)
-- Name: gardens email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gardens
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;


--
-- TOC entry 2843 (class 2606 OID 16460)
-- Name: plants garden_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT garden_id FOREIGN KEY (garden_id) REFERENCES public.gardens(garden_id);


--
-- TOC entry 2847 (class 2606 OID 16465)
-- Name: weather_data garden_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT garden_id FOREIGN KEY (garden_id) REFERENCES public.gardens(garden_id);


--
-- TOC entry 2846 (class 2606 OID 16470)
-- Name: sensor_data garden_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_data
    ADD CONSTRAINT garden_id FOREIGN KEY (garden_id) REFERENCES public.gardens(garden_id);


--
-- TOC entry 2844 (class 2606 OID 16475)
-- Name: plants plant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plant_id FOREIGN KEY (plant_type_id) REFERENCES public.plant_types(plant_type_id);


--
-- TOC entry 2845 (class 2606 OID 16480)
-- Name: rules rules_garden_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_garden_id_fkey FOREIGN KEY (garden_id) REFERENCES public.gardens(garden_id) NOT VALID;


-- Completed on 2021-04-22 00:20:55 UTC

--
-- PostgreSQL database dump complete
--

