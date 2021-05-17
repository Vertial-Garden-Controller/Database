--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-17 05:13:55 UTC

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
-- TOC entry 204 (class 1259 OID 16391)
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
-- TOC entry 205 (class 1259 OID 16397)
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
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 205
-- Name: plant_types_plant_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plant_types_plant_type_id_seq OWNED BY public.plant_types.plant_type_id;


--
-- TOC entry 206 (class 1259 OID 16399)
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
-- TOC entry 207 (class 1259 OID 16406)
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
-- TOC entry 208 (class 1259 OID 16413)
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
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 208
-- Name: rules_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rules_rule_id_seq OWNED BY public.rules.rule_id;


--
-- TOC entry 209 (class 1259 OID 16415)
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
-- TOC entry 210 (class 1259 OID 16422)
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
    last_modified date,
    garden_size integer DEFAULT 100,
    precip real DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16431)
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
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 212 (class 1259 OID 16433)
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
-- TOC entry 2815 (class 2604 OID 16439)
-- Name: plant_types plant_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_types ALTER COLUMN plant_type_id SET DEFAULT nextval('public.plant_types_plant_type_id_seq'::regclass);


--
-- TOC entry 2818 (class 2604 OID 16440)
-- Name: rules rule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules ALTER COLUMN rule_id SET DEFAULT nextval('public.rules_rule_id_seq'::regclass);


--
-- TOC entry 2823 (class 2604 OID 16441)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 2969 (class 0 OID 16391)
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
-- TOC entry 2971 (class 0 OID 16399)
-- Dependencies: 206
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants (plant_count, plant_type_id, date_created, last_modified, email) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 16406)
-- Dependencies: 207
-- Data for Name: rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rules (rule_id, start_time, end_time, days, date_created, last_modified, email) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 16415)
-- Dependencies: 209
-- Data for Name: sensor_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor_data (humidity, temperature, moisture, light, date_created, email) FROM stdin;
97.69	78.86	59.26	6.16	2021-04-17 04:40:38.325082+00	barrinjo@oregonstate.edu
34.76	87.39	70.62	88.82	2021-04-18 04:40:38.325082+00	barrinjo@oregonstate.edu
74.86	32.1	11.14	26.05	2021-04-19 04:40:38.325082+00	barrinjo@oregonstate.edu
77.6	2.37	70.65	63.8	2021-04-20 04:40:38.325082+00	barrinjo@oregonstate.edu
4.98	58.98	18.09	14.11	2021-04-21 04:40:38.325082+00	barrinjo@oregonstate.edu
3	46	45	76	2021-02-24 00:07:43+00	barrinjo@oregonstate.edu
49	78	71	73	2021-06-16 18:46:53+00	barrinjo@oregonstate.edu
63	94	39	65	2021-01-07 19:07:24+00	barrinjo@oregonstate.edu
93	94	8	30	2021-05-22 03:11:56+00	barrinjo@oregonstate.edu
78	91	86	91	2020-12-10 00:44:37+00	barrinjo@oregonstate.edu
14	86	16	100	2020-09-30 16:33:29+00	barrinjo@oregonstate.edu
60	2	74	37	2020-05-21 14:22:37+00	barrinjo@oregonstate.edu
49	49	32	51	2020-06-04 08:44:59+00	barrinjo@oregonstate.edu
98	3	22	44	2021-12-11 15:44:38+00	barrinjo@oregonstate.edu
35	60	96	51	2021-02-19 17:40:24+00	barrinjo@oregonstate.edu
28	57	40	28	2022-03-23 13:36:47+00	barrinjo@oregonstate.edu
77	15	36	56	2020-10-18 12:10:06+00	barrinjo@oregonstate.edu
99	77	38	69	2020-06-07 23:49:33+00	barrinjo@oregonstate.edu
100	58	59	40	2022-03-11 06:46:37+00	barrinjo@oregonstate.edu
9	51	78	95	2020-07-20 02:35:45+00	barrinjo@oregonstate.edu
8	98	52	67	2022-05-10 17:46:08+00	barrinjo@oregonstate.edu
16	93	22	29	2021-06-08 06:36:09+00	barrinjo@oregonstate.edu
1	19	93	97	2020-09-13 02:00:37+00	barrinjo@oregonstate.edu
67	20	12	31	2021-09-26 20:52:16+00	barrinjo@oregonstate.edu
38	46	95	52	2022-01-02 19:12:01+00	barrinjo@oregonstate.edu
81	10	19	18	2021-07-03 07:16:10+00	barrinjo@oregonstate.edu
86	90	36	28	2021-11-24 00:46:26+00	barrinjo@oregonstate.edu
90	20	35	72	2020-09-23 01:23:24+00	barrinjo@oregonstate.edu
63	8	64	29	2020-06-09 09:03:19+00	barrinjo@oregonstate.edu
19	70	80	59	2021-11-21 01:36:55+00	barrinjo@oregonstate.edu
7	73	19	81	2020-08-06 18:32:28+00	barrinjo@oregonstate.edu
66	20	69	1	2021-04-18 15:49:55+00	barrinjo@oregonstate.edu
55	78	73	82	2021-09-06 18:33:59+00	barrinjo@oregonstate.edu
30	25	2	59	2021-10-23 05:03:29+00	barrinjo@oregonstate.edu
5	45	34	79	2022-04-10 08:50:11+00	barrinjo@oregonstate.edu
84	99	36	58	2020-07-14 10:25:28+00	barrinjo@oregonstate.edu
31	8	73	14	2022-04-26 06:58:07+00	barrinjo@oregonstate.edu
19	64	97	68	2020-09-24 08:43:14+00	barrinjo@oregonstate.edu
72	47	8	93	2021-04-07 08:58:07+00	barrinjo@oregonstate.edu
59	23	35	74	2022-01-30 11:30:26+00	barrinjo@oregonstate.edu
11	60	27	18	2020-12-26 08:28:32+00	barrinjo@oregonstate.edu
52	8	30	79	2021-02-01 09:42:35+00	barrinjo@oregonstate.edu
98	45	61	48	2022-01-02 16:46:42+00	barrinjo@oregonstate.edu
40	69	59	87	2022-05-02 09:53:27+00	barrinjo@oregonstate.edu
42	48	97	62	2021-11-23 07:21:17+00	barrinjo@oregonstate.edu
74	40	62	18	2022-04-25 02:37:54+00	barrinjo@oregonstate.edu
14	52	72	100	2021-09-24 08:17:11+00	barrinjo@oregonstate.edu
100	78	95	96	2020-10-25 22:11:48+00	barrinjo@oregonstate.edu
43	93	55	94	2022-01-28 01:01:08+00	barrinjo@oregonstate.edu
65	69	76	44	2021-07-20 02:07:56+00	barrinjo@oregonstate.edu
33	85	3	32	2021-11-28 12:22:26+00	barrinjo@oregonstate.edu
49	6	75	94	2021-12-16 16:06:23+00	barrinjo@oregonstate.edu
78	82	52	23	2021-03-29 17:59:46+00	barrinjo@oregonstate.edu
29	66	73	48	2021-01-31 08:23:18+00	barrinjo@oregonstate.edu
59	15	95	81	2021-10-19 18:59:37+00	barrinjo@oregonstate.edu
69	49	65	71	2021-06-25 15:03:46+00	barrinjo@oregonstate.edu
76	37	20	50	2021-07-16 08:59:21+00	barrinjo@oregonstate.edu
95	89	80	98	2020-07-11 06:54:59+00	barrinjo@oregonstate.edu
18	15	8	69	2021-07-15 18:45:27+00	barrinjo@oregonstate.edu
3	45	34	27	2021-07-28 20:25:03+00	barrinjo@oregonstate.edu
75	96	29	82	2021-12-14 20:29:53+00	barrinjo@oregonstate.edu
35	57	20	32	2021-08-03 06:45:17+00	barrinjo@oregonstate.edu
59	33	75	40	2021-07-15 02:16:53+00	barrinjo@oregonstate.edu
55	75	3	30	2021-08-13 21:58:31+00	barrinjo@oregonstate.edu
96	70	22	11	2020-06-09 05:29:22+00	barrinjo@oregonstate.edu
3	61	78	35	2022-05-04 06:18:44+00	barrinjo@oregonstate.edu
61	19	15	73	2020-06-25 17:31:29+00	barrinjo@oregonstate.edu
93	67	57	56	2021-01-30 08:35:11+00	barrinjo@oregonstate.edu
13	77	78	52	2021-05-08 09:58:25+00	barrinjo@oregonstate.edu
20	47	37	77	2021-05-07 18:50:54+00	barrinjo@oregonstate.edu
84	33	50	7	2021-09-01 02:55:49+00	barrinjo@oregonstate.edu
11	22	10	66	2020-07-03 10:44:23+00	barrinjo@oregonstate.edu
82	17	71	19	2021-11-12 12:02:31+00	barrinjo@oregonstate.edu
27	89	17	57	2021-12-22 01:16:12+00	barrinjo@oregonstate.edu
41	29	74	34	2021-03-22 18:41:04+00	barrinjo@oregonstate.edu
65	77	49	49	2021-11-27 14:10:06+00	barrinjo@oregonstate.edu
25	43	20	55	2020-12-31 06:02:19+00	barrinjo@oregonstate.edu
50	72	77	54	2022-04-05 18:48:03+00	barrinjo@oregonstate.edu
20	5	36	40	2021-08-14 16:07:36+00	barrinjo@oregonstate.edu
24	21	35	8	2021-12-15 03:37:01+00	barrinjo@oregonstate.edu
77	36	13	99	2020-11-13 16:49:27+00	barrinjo@oregonstate.edu
74	56	56	78	2022-01-27 00:50:01+00	barrinjo@oregonstate.edu
9	40	13	9	2021-10-29 14:40:35+00	barrinjo@oregonstate.edu
42	94	79	44	2020-09-02 12:51:57+00	barrinjo@oregonstate.edu
65	62	88	48	2020-08-25 19:17:32+00	barrinjo@oregonstate.edu
82	46	27	22	2021-05-27 00:39:40+00	barrinjo@oregonstate.edu
5	96	18	18	2021-04-12 10:57:56+00	barrinjo@oregonstate.edu
5	77	32	19	2022-04-18 11:04:00+00	barrinjo@oregonstate.edu
90	79	10	47	2021-01-07 11:34:28+00	barrinjo@oregonstate.edu
84	3	65	87	2020-11-11 21:06:59+00	barrinjo@oregonstate.edu
23	44	55	28	2021-05-29 03:46:30+00	barrinjo@oregonstate.edu
48	3	83	3	2020-12-25 02:32:37+00	barrinjo@oregonstate.edu
24	19	10	67	2022-03-28 02:44:53+00	barrinjo@oregonstate.edu
60	12	52	65	2021-05-11 01:20:48+00	barrinjo@oregonstate.edu
42	56	19	72	2020-07-07 04:03:05+00	barrinjo@oregonstate.edu
24	35	62	13	2020-09-06 10:07:25+00	barrinjo@oregonstate.edu
23	74	56	9	2020-09-02 03:03:22+00	barrinjo@oregonstate.edu
6	28	52	9	2021-01-17 16:46:24+00	barrinjo@oregonstate.edu
58	93	53	17	2021-05-05 01:25:08+00	barrinjo@oregonstate.edu
50	86	27	52	2020-09-03 05:02:58+00	barrinjo@oregonstate.edu
52	56	10	55	2021-08-20 10:48:32+00	barrinjo@oregonstate.edu
40	73	89	81	2021-04-18 14:30:49+00	barrinjo@oregonstate.edu
85	89	34	49	2021-06-02 03:58:10+00	barrinjo@oregonstate.edu
17	76	100	83	2020-05-29 08:46:22+00	barrinjo@oregonstate.edu
87	73	15	24	2021-06-04 09:59:58+00	barrinjo@oregonstate.edu
24	13	98	49	2021-05-13 02:40:48+00	jbarringer1999@gmail.com
76	91	58	87	2021-08-25 17:54:19+00	jbarringer1999@gmail.com
60	36	7	89	2020-08-09 19:50:25+00	jbarringer1999@gmail.com
38	43	73	52	2020-05-30 20:48:41+00	jbarringer1999@gmail.com
90	93	31	14	2020-06-18 10:17:32+00	jbarringer1999@gmail.com
69	32	61	53	2021-06-08 09:38:15+00	jbarringer1999@gmail.com
63	52	24	69	2021-11-06 09:59:08+00	jbarringer1999@gmail.com
5	59	89	11	2021-11-14 12:35:36+00	jbarringer1999@gmail.com
51	37	34	43	2021-10-06 15:14:43+00	jbarringer1999@gmail.com
33	33	66	55	2022-04-06 05:27:10+00	jbarringer1999@gmail.com
36	32	100	34	2021-09-11 09:10:21+00	jbarringer1999@gmail.com
91	33	7	30	2021-10-29 05:04:21+00	jbarringer1999@gmail.com
65	17	84	91	2021-09-28 16:20:29+00	jbarringer1999@gmail.com
6	65	7	33	2022-01-16 09:25:41+00	jbarringer1999@gmail.com
14	25	90	49	2020-06-05 22:05:22+00	jbarringer1999@gmail.com
30	2	95	19	2021-12-01 22:46:36+00	jbarringer1999@gmail.com
73	19	23	86	2021-02-15 05:01:07+00	jbarringer1999@gmail.com
23	27	90	78	2022-02-19 15:38:18+00	jbarringer1999@gmail.com
59	5	34	84	2021-08-19 04:51:37+00	jbarringer1999@gmail.com
26	37	57	80	2021-03-31 00:28:11+00	jbarringer1999@gmail.com
18	44	40	34	2020-12-24 03:30:10+00	maxokazaki@gmail.com
16	2	28	6	2020-06-16 02:37:32+00	maxokazaki@gmail.com
43	10	33	36	2020-09-01 23:53:32+00	maxokazaki@gmail.com
27	4	38	6	2021-05-07 15:41:20+00	maxokazaki@gmail.com
27	39	27	7	2020-09-08 09:18:38+00	maxokazaki@gmail.com
34	45	39	48	2020-08-12 19:29:05+00	maxokazaki@gmail.com
33	38	23	50	2020-08-17 05:06:06+00	maxokazaki@gmail.com
26	48	32	28	2020-05-27 15:54:23+00	maxokazaki@gmail.com
22	44	8	5	2021-04-30 14:58:48+00	maxokazaki@gmail.com
10	17	14	14	2020-09-01 20:16:58+00	maxokazaki@gmail.com
27	39	32	37	2021-05-02 13:49:55+00	maxokazaki@gmail.com
11	28	28	14	2020-12-02 04:46:05+00	maxokazaki@gmail.com
9	47	36	50	2020-07-22 11:33:21+00	maxokazaki@gmail.com
37	14	11	23	2021-05-08 18:28:59+00	maxokazaki@gmail.com
33	34	41	12	2020-09-24 05:51:00+00	maxokazaki@gmail.com
46	2	2	12	2020-10-03 23:35:22+00	maxokazaki@gmail.com
28	43	26	41	2021-01-10 15:22:00+00	maxokazaki@gmail.com
19	47	13	21	2020-10-04 04:43:04+00	maxokazaki@gmail.com
32	50	18	21	2020-09-07 14:34:08+00	maxokazaki@gmail.com
44	28	16	36	2021-05-03 19:58:59+00	maxokazaki@gmail.com
27	47	20	16	2021-04-22 09:09:27+00	maxokazaki@gmail.com
34	44	42	5	2021-01-08 02:30:41+00	maxokazaki@gmail.com
21	8	14	6	2020-07-09 17:38:07+00	maxokazaki@gmail.com
22	24	30	28	2021-01-20 00:26:44+00	maxokazaki@gmail.com
36	14	23	48	2020-11-28 02:35:11+00	maxokazaki@gmail.com
39	32	4	15	2020-08-22 01:53:49+00	maxokazaki@gmail.com
40	47	38	6	2020-09-11 02:11:31+00	maxokazaki@gmail.com
8	13	50	35	2021-04-09 04:30:36+00	maxokazaki@gmail.com
31	38	46	44	2021-01-12 13:15:57+00	maxokazaki@gmail.com
43	40	7	44	2020-11-21 00:12:20+00	maxokazaki@gmail.com
4	41	19	24	2021-05-03 02:51:39+00	maxokazaki@gmail.com
22	20	3	5	2021-04-13 02:12:26+00	maxokazaki@gmail.com
37	27	1	38	2020-06-10 07:32:58+00	maxokazaki@gmail.com
16	32	37	30	2020-09-17 20:40:17+00	maxokazaki@gmail.com
48	30	38	25	2020-11-20 22:23:06+00	maxokazaki@gmail.com
17	41	3	40	2020-12-06 15:32:37+00	maxokazaki@gmail.com
3	19	26	49	2020-09-19 17:59:44+00	maxokazaki@gmail.com
50	22	24	46	2021-02-05 19:31:44+00	maxokazaki@gmail.com
9	36	45	25	2020-10-16 04:29:47+00	maxokazaki@gmail.com
26	2	47	17	2020-09-06 07:35:28+00	maxokazaki@gmail.com
36	30	24	45	2021-03-18 16:05:00+00	maxokazaki@gmail.com
39	5	25	46	2020-12-16 04:34:58+00	maxokazaki@gmail.com
9	20	45	44	2020-06-11 12:00:50+00	maxokazaki@gmail.com
14	33	7	13	2020-07-20 14:19:07+00	maxokazaki@gmail.com
14	19	18	11	2021-04-12 04:59:33+00	maxokazaki@gmail.com
15	29	49	15	2021-03-07 04:01:32+00	maxokazaki@gmail.com
30	50	7	12	2021-04-01 13:06:42+00	maxokazaki@gmail.com
22	1	50	45	2021-01-28 10:30:09+00	maxokazaki@gmail.com
2	39	18	49	2021-04-01 07:32:25+00	maxokazaki@gmail.com
27	40	39	33	2021-04-14 15:41:45+00	maxokazaki@gmail.com
93	53	92	79	2020-10-16 18:19:27+00	maxokazaki7@gmail.com
71	99	78	94	2020-12-02 05:23:22+00	maxokazaki7@gmail.com
86	93	67	94	2021-03-24 16:13:50+00	maxokazaki7@gmail.com
56	59	71	61	2020-06-02 05:50:48+00	maxokazaki7@gmail.com
66	59	88	70	2021-04-18 21:01:01+00	maxokazaki7@gmail.com
82	90	98	99	2020-06-14 19:12:37+00	maxokazaki7@gmail.com
69	89	53	95	2020-05-19 00:02:31+00	maxokazaki7@gmail.com
85	98	78	60	2021-03-09 22:29:08+00	maxokazaki7@gmail.com
64	88	72	71	2021-01-11 23:46:23+00	maxokazaki7@gmail.com
57	66	54	72	2021-02-15 12:58:37+00	maxokazaki7@gmail.com
53	61	85	80	2020-09-28 02:02:18+00	maxokazaki7@gmail.com
72	80	81	98	2020-08-26 15:11:32+00	maxokazaki7@gmail.com
50	51	79	73	2020-09-11 19:45:43+00	maxokazaki7@gmail.com
89	55	86	90	2021-02-26 00:57:42+00	maxokazaki7@gmail.com
52	93	55	55	2020-07-04 08:52:39+00	maxokazaki7@gmail.com
62	82	77	74	2020-10-14 00:44:36+00	maxokazaki7@gmail.com
64	74	100	81	2020-12-05 14:27:13+00	maxokazaki7@gmail.com
65	60	76	54	2020-09-29 03:08:43+00	maxokazaki7@gmail.com
61	89	90	71	2020-06-21 15:58:08+00	maxokazaki7@gmail.com
83	71	70	54	2020-05-22 15:48:26+00	maxokazaki7@gmail.com
80	66	81	91	2021-04-24 02:11:56+00	maxokazaki7@gmail.com
70	80	51	68	2021-03-25 02:21:17+00	maxokazaki7@gmail.com
80	53	99	85	2020-12-12 03:20:38+00	maxokazaki7@gmail.com
50	87	86	81	2020-12-28 12:28:13+00	maxokazaki7@gmail.com
70	77	93	64	2021-01-04 00:54:39+00	maxokazaki7@gmail.com
77	75	64	71	2021-02-22 13:46:52+00	maxokazaki7@gmail.com
86	54	62	63	2021-03-24 15:48:51+00	maxokazaki7@gmail.com
52	54	83	77	2020-11-13 03:04:19+00	maxokazaki7@gmail.com
56	94	55	96	2020-08-18 19:59:24+00	maxokazaki7@gmail.com
86	89	64	79	2021-02-25 03:47:30+00	maxokazaki7@gmail.com
51	60	64	68	2021-03-02 13:34:47+00	maxokazaki7@gmail.com
81	66	98	80	2020-11-14 03:14:41+00	maxokazaki7@gmail.com
57	59	58	75	2020-11-06 01:10:51+00	maxokazaki7@gmail.com
70	52	66	98	2021-03-13 14:16:12+00	maxokazaki7@gmail.com
64	81	69	66	2021-03-08 09:23:39+00	maxokazaki7@gmail.com
83	85	80	99	2021-04-09 04:05:17+00	maxokazaki7@gmail.com
87	91	52	59	2020-06-16 12:52:35+00	maxokazaki7@gmail.com
61	96	71	65	2020-07-13 07:50:50+00	maxokazaki7@gmail.com
81	92	83	88	2021-04-14 15:52:25+00	maxokazaki7@gmail.com
86	90	56	95	2021-04-14 17:39:02+00	maxokazaki7@gmail.com
78	79	87	84	2020-10-02 05:48:20+00	maxokazaki7@gmail.com
77	67	66	94	2020-11-01 13:42:53+00	maxokazaki7@gmail.com
63	60	95	91	2021-03-24 09:56:34+00	maxokazaki7@gmail.com
72	89	82	89	2020-09-19 19:11:17+00	maxokazaki7@gmail.com
66	90	68	67	2020-06-29 22:41:34+00	maxokazaki7@gmail.com
60	66	71	61	2020-08-15 12:26:16+00	maxokazaki7@gmail.com
81	52	73	55	2020-06-22 18:27:44+00	maxokazaki7@gmail.com
58	55	86	82	2020-05-17 15:27:11+00	maxokazaki7@gmail.com
90	81	63	66	2020-05-26 01:27:07+00	maxokazaki7@gmail.com
57	83	51	81	2020-11-08 02:02:51+00	maxokazaki7@gmail.com
\.


--
-- TOC entry 2975 (class 0 OID 16422)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (firstname, middlename, lastname, user_id, email, password, date_created, last_modified, garden_size, precip) FROM stdin;
Joshua	David	Barringer	1	jbarringer1999@gmail.com	youre_smart	2021-04-21 04:29:13.223984+00	2021-05-16	250	0
Garden		Member	3	barrinjo@oregonstate.edu	0Auth-user-no-pass	2021-05-16 20:21:32.713997+00	2021-05-16	500	0.546
Max		Okazaki	2	maxokazaki@gmail.com	0Auth-user-no-pass	2021-05-15 19:36:18.862197+00	\N	\N	0
Max		Okazaki	4	maxokazaki7@gmail.com	0Auth-user-no-pass	2021-05-17 05:09:40.79612+00	\N	\N	0
\.


--
-- TOC entry 2977 (class 0 OID 16433)
-- Dependencies: 212
-- Data for Name: weather_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather_data (date_recieved, temp, temp_min, temp_max, humidity, precip, email) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 205
-- Name: plant_types_plant_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_types_plant_type_id_seq', 10, true);


--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 208
-- Name: rules_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rules_rule_id_seq', 1, false);


--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- TOC entry 2835 (class 2606 OID 16443)
-- Name: users no_email_dupes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT no_email_dupes UNIQUE (email);


--
-- TOC entry 2825 (class 2606 OID 16445)
-- Name: plant_types plant_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_types
    ADD CONSTRAINT plant_types_pkey PRIMARY KEY (plant_type_id);


--
-- TOC entry 2827 (class 2606 OID 16447)
-- Name: plants plants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (email, plant_type_id);


--
-- TOC entry 2829 (class 2606 OID 16449)
-- Name: rules rule_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rule_id UNIQUE (rule_id);


--
-- TOC entry 2831 (class 2606 OID 16451)
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (rule_id);


--
-- TOC entry 2833 (class 2606 OID 16453)
-- Name: sensor_data sensor_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_data
    ADD CONSTRAINT sensor_data_pkey PRIMARY KEY (date_created);


--
-- TOC entry 2837 (class 2606 OID 16455)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2841 (class 2606 OID 16456)
-- Name: sensor_data email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_data
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;


--
-- TOC entry 2840 (class 2606 OID 16461)
-- Name: rules email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;


--
-- TOC entry 2838 (class 2606 OID 16466)
-- Name: plants email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;


--
-- TOC entry 2842 (class 2606 OID 16471)
-- Name: weather_data email; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT email FOREIGN KEY (email) REFERENCES public.users(email) NOT VALID;


--
-- TOC entry 2839 (class 2606 OID 16476)
-- Name: plants plant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plant_id FOREIGN KEY (plant_type_id) REFERENCES public.plant_types(plant_type_id);


-- Completed on 2021-05-17 05:13:55 UTC

--
-- PostgreSQL database dump complete
--

