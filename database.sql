--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account; Type: TABLE; Schema: public; Owner: konradc
--

CREATE TABLE account (
    id integer NOT NULL,
    client_id integer NOT NULL,
    account_number character varying(50),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    utility character varying(50),
    account_type character varying(50),
    CONSTRAINT account_types CHECK (((account_type)::text = ANY ((ARRAY['commercial'::character varying, 'residential'::character varying])::text[]))),
    CONSTRAINT utility_types CHECK (((utility)::text = ANY ((ARRAY['pepco'::character varying, 'duke_energy'::character varying, 'dominion'::character varying])::text[])))
);


ALTER TABLE account OWNER TO konradc;

--
-- Name: account_id_seq; Type: SEQUENCE; Schema: public; Owner: konradc
--

CREATE SEQUENCE account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_id_seq OWNER TO konradc;

--
-- Name: account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: konradc
--

ALTER SEQUENCE account_id_seq OWNED BY account.id;


--
-- Name: arcadia; Type: TABLE; Schema: public; Owner: arcadia
--

CREATE TABLE arcadia (
    id integer NOT NULL,
    text character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE arcadia OWNER TO arcadia;

--
-- Name: arcadia_id_seq; Type: SEQUENCE; Schema: public; Owner: arcadia
--

CREATE SEQUENCE arcadia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE arcadia_id_seq OWNER TO arcadia;

--
-- Name: arcadia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arcadia
--

ALTER SEQUENCE arcadia_id_seq OWNED BY arcadia.id;


--
-- Name: bill; Type: TABLE; Schema: public; Owner: konradc
--

CREATE TABLE bill (
    id integer NOT NULL,
    account_id integer NOT NULL,
    start_date date,
    end_date date,
    usage integer,
    charges numeric,
    status character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT status_types CHECK (((status)::text = ANY ((ARRAY['paid'::character varying, 'unpaid'::character varying])::text[])))
);


ALTER TABLE bill OWNER TO konradc;

--
-- Name: bill_id_seq; Type: SEQUENCE; Schema: public; Owner: konradc
--

CREATE SEQUENCE bill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bill_id_seq OWNER TO konradc;

--
-- Name: bill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: konradc
--

ALTER SEQUENCE bill_id_seq OWNED BY bill.id;


--
-- Name: client; Type: TABLE; Schema: public; Owner: konradc
--

CREATE TABLE client (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    is_active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE client OWNER TO konradc;

--
-- Name: user; Type: TABLE; Schema: public; Owner: arcadia
--

CREATE TABLE "user" (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "user" OWNER TO arcadia;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: arcadia
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO arcadia;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: arcadia
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: konradc
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO konradc;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: konradc
--

ALTER SEQUENCE users_id_seq OWNED BY client.id;


--
-- Name: account id; Type: DEFAULT; Schema: public; Owner: konradc
--

ALTER TABLE ONLY account ALTER COLUMN id SET DEFAULT nextval('account_id_seq'::regclass);


--
-- Name: arcadia id; Type: DEFAULT; Schema: public; Owner: arcadia
--

ALTER TABLE ONLY arcadia ALTER COLUMN id SET DEFAULT nextval('arcadia_id_seq'::regclass);


--
-- Name: bill id; Type: DEFAULT; Schema: public; Owner: konradc
--

ALTER TABLE ONLY bill ALTER COLUMN id SET DEFAULT nextval('bill_id_seq'::regclass);


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: konradc
--

ALTER TABLE ONLY client ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: arcadia
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: konradc
--

COPY account (id, client_id, account_number, updated_at, created_at, utility, account_type) FROM stdin;
1	1	2349-23422	\N	\N	pepco	residential
2	2	43332234	\N	\N	duke_energy	commercial
3	2	86940293	\N	\N	duke_energy	residential
4	3	9565-434-43534	\N	\N	dominion	residential
5	3	9565-430-54933	\N	\N	dominion	residential
6	4	8654-35434	\N	\N	pepco	commercial
7	5	9566-938-21493	\N	\N	dominion	residential
\.


--
-- Name: account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: konradc
--

SELECT pg_catalog.setval('account_id_seq', 1, false);


--
-- Data for Name: arcadia; Type: TABLE DATA; Schema: public; Owner: arcadia
--

COPY arcadia (id, text, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: arcadia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arcadia
--

SELECT pg_catalog.setval('arcadia_id_seq', 1, false);


--
-- Data for Name: bill; Type: TABLE DATA; Schema: public; Owner: konradc
--

COPY bill (id, account_id, start_date, end_date, usage, charges, status, created_at, updated_at) FROM stdin;
1	1	2018-01-15	2018-02-16	638	76.74	paid	\N	\N
2	1	2018-02-17	2017-03-17	575	65.11	paid	\N	\N
3	1	2018-03-18	2017-04-15	677	85.89	paid	\N	\N
4	1	2018-04-16	2017-05-17	926	106.56	paid	\N	\N
5	1	2018-05-18	2017-06-17	1045	141.92	unpaid	\N	\N
6	2	2017-12-08	2018-01-07	229	28.44	paid	\N	\N
7	2	2018-01-08	2018-02-07	301	35.51	paid	\N	\N
8	2	2018-02-08	2018-03-07	280	31.99	paid	\N	\N
9	2	2018-03-08	2018-04-07	324	36.75	paid	\N	\N
10	2	2018-04-08	2018-05-07	219	27.47	unpaid	\N	\N
11	3	2017-12-08	2018-01-07	92	10.53	paid	\N	\N
12	3	2018-01-08	2018-02-07	427	55.38	paid	\N	\N
13	3	2018-02-08	2018-03-07	344	40.00	paid	\N	\N
14	3	2018-03-08	2018-04-07	331	38.85	paid	\N	\N
15	3	2018-04-08	2018-05-07	210	26.25	unpaid	\N	\N
16	4	2018-04-15	2018-06-17	1527	240.18	unpaid	\N	\N
17	5	2018-02-10	2018-03-09	834	113.98	paid	\N	\N
18	5	2018-03-10	2018-04-10	785	94.68	paid	\N	\N
19	5	2018-04-11	2018-05-09	815	99.23	paid	\N	\N
20	5	2018-05-10	2018-06-11	1123	157.32	paid	\N	\N
21	6	2017-09-02	2017-10-01	345	47.34	paid	\N	\N
22	6	2017-10-02	2017-11-01	642	91.60	paid	\N	\N
23	6	2017-11-02	2017-12-01	934	128.93	paid	\N	\N
24	7	2017-11-24	2017-12-22	152	28.14	paid	\N	\N
25	7	2017-12-23	2018-01-21	113	15.82	paid	\N	\N
26	7	2018-01-22	2018-02-23	127	18.11	paid	\N	\N
27	7	2018-02-24	2018-03-24	112	13.19	paid	\N	\N
28	7	2018-03-25	2018-04-22	465	52.22	paid	\N	\N
29	7	2018-04-23	2018-05-24	523	61.03	paid	\N	\N
30	7	2018-05-25	2018-06-24	545	67.57	unpaid	\N	\N
\.


--
-- Name: bill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: konradc
--

SELECT pg_catalog.setval('bill_id_seq', 1, false);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: konradc
--

COPY client (id, first_name, last_name, email, is_active, created_at, updated_at) FROM stdin;
2	John	Johnson	john.johnson@yahoo.com	f	\N	\N
3	Sam	Andrews	sam1234@msn.com	t	\N	\N
4	Matthew	Freeman	mfreeman@gmail.com	f	\N	\N
5	Natalie	Berry	natberry@hotmail.com	t	\N	\N
1	Mary	Smith	mary.smith@gmail.com	t	\N	2018-09-06 20:12:24.559
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: arcadia
--

COPY "user" (id, email, password, "createdAt", "updatedAt") FROM stdin;
1	email@example.com	$2a$13$CYsmb2/n/YtXa6lG7ApZLeTBnXZLVsPh.nqD36n2CU7Ie5zQJCDH.	2018-09-06 22:25:33.341-04	2018-09-06 22:25:33.341-04
\.


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: arcadia
--

SELECT pg_catalog.setval('user_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: konradc
--

SELECT pg_catalog.setval('users_id_seq', 8, true);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: konradc
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);


--
-- Name: arcadia arcadia_pkey; Type: CONSTRAINT; Schema: public; Owner: arcadia
--

ALTER TABLE ONLY arcadia
    ADD CONSTRAINT arcadia_pkey PRIMARY KEY (id);


--
-- Name: bill bill_pkey; Type: CONSTRAINT; Schema: public; Owner: konradc
--

ALTER TABLE ONLY bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (id);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: arcadia
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: arcadia
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: client users_pkey; Type: CONSTRAINT; Schema: public; Owner: konradc
--

ALTER TABLE ONLY client
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: account account_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konradc
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_client_id_fkey FOREIGN KEY (client_id) REFERENCES client(id);


--
-- Name: bill bill_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: konradc
--

ALTER TABLE ONLY bill
    ADD CONSTRAINT bill_account_id_fkey FOREIGN KEY (account_id) REFERENCES account(id);


--
-- PostgreSQL database dump complete
--

