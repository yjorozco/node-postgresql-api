--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.24
-- Dumped by pg_dump version 9.3.24
-- Started on 2019-09-22 23:07:49

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 16635)
-- Name: project; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.project (
    id integer NOT NULL,
    name text NOT NULL,
    priority integer NOT NULL,
    description text,
    deliverydate date NOT NULL,
    CONSTRAINT project_name_check CHECK ((name <> ''::text))
);


ALTER TABLE public.project OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16633)
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO postgres;

--
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 171
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- TOC entry 174 (class 1259 OID 16667)
-- Name: tasks; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    name text NOT NULL,
    done boolean,
    projectid integer,
    CONSTRAINT tasks_name_check CHECK ((name <> ''::text))
);


ALTER TABLE public.tasks OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16665)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO postgres;

--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 173
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- TOC entry 1831 (class 2604 OID 16638)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- TOC entry 1833 (class 2604 OID 16670)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- TOC entry 1948 (class 0 OID 16635)
-- Dependencies: 172
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project (id, name, priority, description, deliverydate) FROM stdin;
1	make a web app	1	using javascript	2019-05-12
2	make an app	1	using dart	2019-05-13
3	make a web app	2	using c++	2019-05-14
\.


--
-- TOC entry 1962 (class 0 OID 0)
-- Dependencies: 171
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_id_seq', 3, true);


--
-- TOC entry 1950 (class 0 OID 16667)
-- Dependencies: 174
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks (id, name, done, projectid) FROM stdin;
1	download Vuejs	f	1
2	Create UI WEB	f	1
3	Download flutter	f	2
4	Desing UI	f	2
\.


--
-- TOC entry 1963 (class 0 OID 0)
-- Dependencies: 173
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tasks_id_seq', 4, true);


--
-- TOC entry 1836 (class 2606 OID 16664)
-- Name: id_project; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT id_project PRIMARY KEY (id);


--
-- TOC entry 1838 (class 2606 OID 16681)
-- Name: id_tasks; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT id_tasks PRIMARY KEY (id);


--
-- TOC entry 1839 (class 2606 OID 16675)
-- Name: tasks_projectid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.project(id);


--
-- TOC entry 1958 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-09-22 23:07:51

--
-- PostgreSQL database dump complete
--

