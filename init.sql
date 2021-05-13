--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-13 03:42:34 UTC

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
-- TOC entry 546 (class 1247 OID 16387)
-- Name: coordinate; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.coordinate AS (
	x real,
	y real
);


ALTER TYPE public.coordinate OWNER TO postgres;

--
-- TOC entry 549 (class 1247 OID 16390)
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
-- TOC entry 204 (class 1259 OID 16400)
-- Name: plant_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_types (
    plant_type_id integer NOT NULL,
    name text NOT NULL,
    gallons_per_week real NOT NULL,
    early_stage boolean,
    flavor text
);


ALTER TABLE public.plant_types OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16406)
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
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 205
-- Name: plant_types_plant_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plant_types_plant_type_id_seq OWNED BY public.plant_types.plant_type_id;


--
-- TOC entry 206 (class 1259 OID 16408)
-- Name: plants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants (
    plant_count integer,
    plant_type_id integer NOT NULL,
    date_created timestamp with time zone DEFAULT now() NOT NULL,
    last_modified date,
    email text NOT NULL
);


ALTER TABLE public.plants OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16412)
-- Name: rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rules (
    rule_id integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL,
    days public.days,
    date_created timestamp with time zone DEFAULT now() NOT NULL,
    last_modified date,
    email text NOT NULL
);


ALTER TABLE public.rules OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16419)
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
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 208
-- Name: rules_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rules_rule_id_seq OWNED BY public.rules.rule_id;


--
-- TOC entry 209 (class 1259 OID 16421)
-- Name: sensor_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor_data (
    humidity real NOT NULL,
    temperature real NOT NULL,
    moisture real NOT NULL,
    light real NOT NULL,
    date_created timestamp with time zone DEFAULT now() NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.sensor_data OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16425)
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
-- TOC entry 211 (class 1259 OID 16432)
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
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 212 (class 1259 OID 16434)
-- Name: weather_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weather_data (
    date_recieved timestamp with time zone NOT NULL,
    temp real,
    temp_min real,
    temp_max real,
    humidity real,
    precip real,
    email text NOT NULL
);


ALTER TABLE public.weather_data OWNER TO postgres;

--
-- TOC entry 2815 (class 2604 OID 16438)
-- Name: plant_types plant_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_types ALTER COLUMN plant_type_id SET DEFAULT nextval('public.plant_types_plant_type_id_seq'::regclass);


--
-- TOC entry 2818 (class 2604 OID 16439)
-- Name: rules rule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules ALTER COLUMN rule_id SET DEFAULT nextval('public.rules_rule_id_seq'::regclass);


--
-- TOC entry 2821 (class 2604 OID 16440)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 2967 (class 0 OID 16400)
-- Dependencies: 204
-- Data for Name: plant_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_types (plant_type_id, name, gallons_per_week, early_stage, flavor) FROM stdin;
1	Carrot	1	f	Carrots are a long-lasting root vegetable that can be grown in many climates.  Carrots are easy to grow as long as they are planted in loose, sandy soil during the cooler periods of the growing season
2	Corn	2	t	Sweet corn is an annual crop that produces ears of yellow, white, or bi-colored kernels. A long, frost-free growing season is necessary for growing corn.
3	Lettuce	2	f	Lettuce is cool-season crop that grows best in the spring and fall in most regions. Plant in the spring, starting two weeks before frost.
4	Squash	1	f	Because winter squash requires a long growing season (generally from 75 to 100 frost-free days), the seeds are generally planted by late May in northern locations to early July in extremely southern states.
5	Tomato	2	t	Tomatoes can not be started too early in the ground as they are a tender warm-season crop that can not bear frost. In most regions, the soil is not warm enough to plant tomatoes outdoors until late spring and early summer.
6	Beets	1	t	They are a great choice for northern gardeners because they can survive frost and near-freezing temperatures. This also makes them great as a fall crop.
7	Cabbage	2	f	Cabbage only likes cool temperatures and it can be a magnet for some types of garden pests. Rotating the cabbage crop every few years avoids buildup of soilborne diseases
8	Broccoli	1.5	f	Broccoli is cool-season crop, so it should be started in late winter or early spring (depending on your climate) for an early summer crop, or in mid- to late summer for a fall crop.
9	Onion	0.5	f	Onions can be planted in both the spring and fall seasons, depending on where you live. Generally speaking, plant onion sets outdoors when the weather is cool—not cold.
10	Potato	2	f	In Northern regions, some gardeners will plant the first crop of early-maturing potatoes in early to mid-April, 6 to 8 weeks before the average last frost date or as soon as the soil can be worked.
\.


--
-- TOC entry 2969 (class 0 OID 16408)
-- Dependencies: 206
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants (plant_count, plant_type_id, date_created, last_modified, email) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 16412)
-- Dependencies: 207
-- Data for Name: rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rules (rule_id, start_time, end_time, days, date_created, last_modified, email) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 16421)
-- Dependencies: 209
-- Data for Name: sensor_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor_data (humidity, temperature, moisture, light, date_created, email) FROM stdin;
4.98	58.98	18.09	14.11	2021-04-21 04:40:38.325082+00	jbarringer1999@gmail.com
77.6	2.37	70.65	63.8	2021-04-20 04:40:38.325082+00	jbarringer1999@gmail.com
74.86	32.1	11.14	26.05	2021-04-19 04:40:38.325082+00	jbarringer1999@gmail.com
34.76	87.39	70.62	88.82	2021-04-18 04:40:38.325082+00	jbarringer1999@gmail.com
97.69	78.86	59.26	6.16	2021-04-17 04:40:38.325082+00	jbarringer1999@gmail.com
\.


--
-- TOC entry 2973 (class 0 OID 16425)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (firstname, middlename, lastname, user_id, email, password, date_created, last_modified) FROM stdin;
Joshua	David	Barringer	1	jbarringer1999@gmail.com	youre_smart	2021-04-21 04:29:13.223984+00	\N
Test		User	2	test_email@gmail.com	password8	2021-04-21 04:29:52.180072+00	\N
\.


--
-- TOC entry 2975 (class 0 OID 16434)
-- Dependencies: 212
-- Data for Name: weather_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather_data (date_recieved, temp, temp_min, temp_max, humidity, precip, email) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 205
-- Name: plant_types_plant_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_types_plant_type_id_seq', 10, true);


--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 208
-- Name: rules_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rules_rule_id_seq', 1, false);


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 2, true);


--
-- TOC entry 2833 (class 2606 OID 16444)
-- Name: users no_email_dupes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT no_email_dupes UNIQUE (email);


--
-- TOC entry 2823 (class 2606 OID 16446)
-- Name: plant_types plant_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_types
    ADD CONSTRAINT plant_types_pkey PRIMARY KEY (plant_type_id);


--
-- TOC entry 2825 (class 2606 OID 16530)
-- Name: plants plants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (email, plant_type_id);


--
-- TOC entry 2827 (class 2606 OID 16450)
-- Name: rules rule_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rule_id UNIQUE (rule_id);


--
-- TOC entry 2829 (class 2606 OID 16452)
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (rule_id);


--
-- TOC entry 2831 (class 2606 OID 16502)
-- Name: sensor_data sensor_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_data
    ADD CONSTRAINT sensor_data_pkey PRIMARY KEY (date_created);


--
-- TOC entry 2835 (class 2606 OID 16454)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2839 (class 2606 OID 16503)
-- Name: sensor_data email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_data
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;


--
-- TOC entry 2838 (class 2606 OID 16508)
-- Name: rules email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;


--
-- TOC entry 2837 (class 2606 OID 16516)
-- Name: plants email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;


--
-- TOC entry 2840 (class 2606 OID 16524)
-- Name: weather_data email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;


--
-- TOC entry 2836 (class 2606 OID 16475)
-- Name: plants plant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plant_id FOREIGN KEY (plant_type_id) REFERENCES public.plant_types(plant_type_id);


-- Completed on 2021-05-13 03:42:34 UTC

--
-- PostgreSQL database dump complete
--

