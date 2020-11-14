--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg100+1)
-- Dumped by pg_dump version 12.4

-- Started on 2020-11-14 20:02:56 UTC

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
-- TOC entry 643 (class 1247 OID 24583)
-- Name: coordinate; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.coordinate AS (
	x real,
	y real
);


ALTER TYPE public.coordinate OWNER TO postgres;

--
-- TOC entry 655 (class 1247 OID 24620)
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
-- TOC entry 205 (class 1259 OID 16408)
-- Name: gardens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gardens (
    garden_id bigint NOT NULL,
    user_id bigint NOT NULL,
    coords public.coordinate
);


ALTER TABLE public.gardens OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16406)
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
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 204
-- Name: gardens_garden_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gardens_garden_id_seq OWNED BY public.gardens.garden_id;


--
-- TOC entry 208 (class 1259 OID 24594)
-- Name: plant_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_types (
    plant_type_id bigint NOT NULL,
    name text NOT NULL,
    water_value real NOT NULL,
    soil_type text NOT NULL
);


ALTER TABLE public.plant_types OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24592)
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
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 207
-- Name: plant_types_plant_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plant_types_plant_type_id_seq OWNED BY public.plant_types.plant_type_id;


--
-- TOC entry 209 (class 1259 OID 24603)
-- Name: plants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants (
    avg_sun real,
    plant_count integer,
    garden_id bigint NOT NULL,
    plant_type_id bigint NOT NULL
);


ALTER TABLE public.plants OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 24623)
-- Name: rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rules (
    rule_id bigint NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    days public.days
);


ALTER TABLE public.rules OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 24621)
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
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 211
-- Name: rules_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rules_rule_id_seq OWNED BY public.rules.rule_id;


--
-- TOC entry 213 (class 1259 OID 24632)
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedules (
    garden_id bigint NOT NULL,
    rule_id bigint NOT NULL
);


ALTER TABLE public.schedules OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 24658)
-- Name: soil_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soil_data (
    garden_id bigint NOT NULL,
    p real NOT NULL,
    n real NOT NULL,
    k real NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.soil_data OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16389)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    firstname text NOT NULL,
    middlename text,
    lastname text,
    user_id bigint NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16395)
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
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 203
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 214 (class 1259 OID 24650)
-- Name: weather_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weather_data (
    date_recieved timestamp with time zone NOT NULL,
    temp real,
    temp_min real,
    temp_max real,
    humidity real,
    precip real,
    garden_id bigint NOT NULL
);


ALTER TABLE public.weather_data OWNER TO postgres;

--
-- TOC entry 2824 (class 2604 OID 16411)
-- Name: gardens garden_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gardens ALTER COLUMN garden_id SET DEFAULT nextval('public.gardens_garden_id_seq'::regclass);


--
-- TOC entry 2825 (class 2604 OID 24597)
-- Name: plant_types plant_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_types ALTER COLUMN plant_type_id SET DEFAULT nextval('public.plant_types_plant_type_id_seq'::regclass);


--
-- TOC entry 2826 (class 2604 OID 24626)
-- Name: rules rule_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules ALTER COLUMN rule_id SET DEFAULT nextval('public.rules_rule_id_seq'::regclass);


--
-- TOC entry 2823 (class 2604 OID 16397)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 2830 (class 2606 OID 16413)
-- Name: gardens gardens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gardens
    ADD CONSTRAINT gardens_pkey PRIMARY KEY (garden_id);


--
-- TOC entry 2832 (class 2606 OID 24602)
-- Name: plant_types plant_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_types
    ADD CONSTRAINT plant_types_pkey PRIMARY KEY (plant_type_id);


--
-- TOC entry 2834 (class 2606 OID 24607)
-- Name: plants plants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (garden_id, plant_type_id);


--
-- TOC entry 2836 (class 2606 OID 24631)
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (rule_id);


--
-- TOC entry 2838 (class 2606 OID 24636)
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (garden_id, rule_id);


--
-- TOC entry 2828 (class 2606 OID 16405)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2841 (class 2606 OID 24613)
-- Name: plants garden_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT garden_id FOREIGN KEY (garden_id) REFERENCES public.gardens(garden_id);


--
-- TOC entry 2842 (class 2606 OID 24637)
-- Name: schedules garden_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT garden_id FOREIGN KEY (garden_id) REFERENCES public.gardens(garden_id);


--
-- TOC entry 2844 (class 2606 OID 24653)
-- Name: weather_data garden_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.weather_data
    ADD CONSTRAINT garden_id FOREIGN KEY (garden_id) REFERENCES public.gardens(garden_id);


--
-- TOC entry 2845 (class 2606 OID 24661)
-- Name: soil_data garden_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soil_data
    ADD CONSTRAINT garden_id FOREIGN KEY (garden_id) REFERENCES public.gardens(garden_id);


--
-- TOC entry 2840 (class 2606 OID 24608)
-- Name: plants plant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plant_id FOREIGN KEY (plant_type_id) REFERENCES public.plant_types(plant_type_id);


--
-- TOC entry 2843 (class 2606 OID 24642)
-- Name: schedules rule_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT rule_id FOREIGN KEY (garden_id) REFERENCES public.rules(rule_id);


--
-- TOC entry 2839 (class 2606 OID 24587)
-- Name: gardens user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gardens
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;


-- Completed on 2020-11-14 20:02:56 UTC

--
-- PostgreSQL database dump complete
--
