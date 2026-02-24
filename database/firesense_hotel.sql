--
-- PostgreSQL database dump
--

\restrict Pm9pwQUVq8eBvfCgKwnxdwNysyhKvOgNi67DZsGAqyJBDLrTiKeWeQkxUAXZ2X4

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-22 14:04:00

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 16485)
-- Name: alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alert (
    id integer NOT NULL,
    equipment_id integer,
    alert_type character varying(50),
    severity character varying(20),
    message text,
    created_at timestamp without time zone,
    is_read boolean,
    is_resolved boolean,
    resolved_at timestamp without time zone,
    resolved_by integer,
    read_at timestamp without time zone,
    read_by integer
);


ALTER TABLE public.alert OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16484)
-- Name: alert_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alert_id_seq OWNER TO postgres;

--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 229
-- Name: alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alert_id_seq OWNED BY public.alert.id;


--
-- TOC entry 234 (class 1259 OID 16529)
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_messages (
    id integer NOT NULL,
    room_id integer NOT NULL,
    user_id integer NOT NULL,
    message text NOT NULL,
    attachment_url character varying(500),
    attachment_name character varying(200),
    created_at timestamp without time zone,
    is_edited boolean,
    edited_at timestamp without time zone
);


ALTER TABLE public.chat_messages OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16528)
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_messages_id_seq OWNER TO postgres;

--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 233
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_messages_id_seq OWNED BY public.chat_messages.id;


--
-- TOC entry 236 (class 1259 OID 16552)
-- Name: chat_read_receipts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_read_receipts (
    id integer NOT NULL,
    message_id integer NOT NULL,
    user_id integer NOT NULL,
    read_at timestamp without time zone
);


ALTER TABLE public.chat_read_receipts OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16551)
-- Name: chat_read_receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_read_receipts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_read_receipts_id_seq OWNER TO postgres;

--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 235
-- Name: chat_read_receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_read_receipts_id_seq OWNED BY public.chat_read_receipts.id;


--
-- TOC entry 232 (class 1259 OID 16510)
-- Name: chat_rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_rooms (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    room_type character varying(50),
    equipment_id integer,
    created_at timestamp without time zone,
    created_by integer,
    is_active boolean
);


ALTER TABLE public.chat_rooms OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16509)
-- Name: chat_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_rooms_id_seq OWNER TO postgres;

--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 231
-- Name: chat_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_rooms_id_seq OWNED BY public.chat_rooms.id;


--
-- TOC entry 224 (class 1259 OID 16420)
-- Name: equipment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment (
    id integer NOT NULL,
    equipment_id character varying(50),
    equipment_type character varying(100) NOT NULL,
    serial_number character varying(100),
    manufacturer character varying(100),
    model character varying(100),
    install_year integer NOT NULL,
    install_date date,
    last_service_date date NOT NULL,
    next_service_date date,
    service_interval_months integer,
    location character varying(200),
    floor character varying(50),
    zone character varying(100),
    near_emergency_exit boolean,
    condition character varying(50),
    status character varying(20),
    usage_level character varying(20),
    daily_exposure_hours integer,
    humidity_level character varying(20),
    temperature_avg integer,
    coastal_exposure boolean,
    certification_status character varying(50),
    last_audit_score integer,
    notes text,
    created_at timestamp without time zone,
    created_by integer
);


ALTER TABLE public.equipment OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16419)
-- Name: equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipment_id_seq OWNER TO postgres;

--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 223
-- Name: equipment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipment_id_seq OWNED BY public.equipment.id;


--
-- TOC entry 222 (class 1259 OID 16404)
-- Name: hotel_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel_settings (
    id integer NOT NULL,
    hotel_name character varying(200) NOT NULL,
    city character varying(100),
    province character varying(100),
    address character varying(500),
    phone character varying(20),
    email character varying(120),
    website character varying(200),
    star_rating integer,
    total_rooms integer,
    hotel_type character varying(100),
    logo_url character varying(500),
    updated_at timestamp without time zone,
    updated_by integer
);


ALTER TABLE public.hotel_settings OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16403)
-- Name: hotel_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotel_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hotel_settings_id_seq OWNER TO postgres;

--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 221
-- Name: hotel_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotel_settings_id_seq OWNED BY public.hotel_settings.id;


--
-- TOC entry 226 (class 1259 OID 16440)
-- Name: maintenance_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.maintenance_record (
    id integer NOT NULL,
    record_id character varying(50),
    equipment_id integer NOT NULL,
    user_id integer,
    maintenance_date date NOT NULL,
    maintenance_type character varying(50),
    technician_name character varying(100),
    technician_company character varying(200),
    issues_found text,
    actions_taken text,
    parts_replaced text,
    cost_lkr double precision,
    duration_hours double precision,
    next_service_date date,
    status character varying(20),
    notes text,
    created_at timestamp without time zone
);


ALTER TABLE public.maintenance_record OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16439)
-- Name: maintenance_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.maintenance_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maintenance_record_id_seq OWNER TO postgres;

--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 225
-- Name: maintenance_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.maintenance_record_id_seq OWNED BY public.maintenance_record.id;


--
-- TOC entry 228 (class 1259 OID 16464)
-- Name: predictions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.predictions (
    id integer NOT NULL,
    equipment_id integer,
    user_id integer,
    risk_level character varying(20) NOT NULL,
    risk_score integer,
    prediction_date timestamp without time zone,
    summary text,
    status character varying(20)
);


ALTER TABLE public.predictions OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16463)
-- Name: predictions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.predictions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.predictions_id_seq OWNER TO postgres;

--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 227
-- Name: predictions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.predictions_id_seq OWNED BY public.predictions.id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(80) NOT NULL,
    password character varying(120) NOT NULL,
    role character varying(20) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(20),
    date_joined timestamp without time zone,
    status character varying(20)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4901 (class 2604 OID 16488)
-- Name: alert id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert ALTER COLUMN id SET DEFAULT nextval('public.alert_id_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 16532)
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_messages_id_seq'::regclass);


--
-- TOC entry 4904 (class 2604 OID 16555)
-- Name: chat_read_receipts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_read_receipts ALTER COLUMN id SET DEFAULT nextval('public.chat_read_receipts_id_seq'::regclass);


--
-- TOC entry 4902 (class 2604 OID 16513)
-- Name: chat_rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_rooms ALTER COLUMN id SET DEFAULT nextval('public.chat_rooms_id_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 16423)
-- Name: equipment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment ALTER COLUMN id SET DEFAULT nextval('public.equipment_id_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 16407)
-- Name: hotel_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_settings ALTER COLUMN id SET DEFAULT nextval('public.hotel_settings_id_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 16443)
-- Name: maintenance_record id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_record ALTER COLUMN id SET DEFAULT nextval('public.maintenance_record_id_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 16467)
-- Name: predictions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predictions ALTER COLUMN id SET DEFAULT nextval('public.predictions_id_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 16393)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5102 (class 0 OID 16485)
-- Dependencies: 230
-- Data for Name: alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alert (id, equipment_id, alert_type, severity, message, created_at, is_read, is_resolved, resolved_at, resolved_by, read_at, read_by) FROM stdin;
1	2	High Risk Equipment	High	Fire Extinguisher at kitchen has HIGH RISK (Score: 95%). Immediate attention required!	2026-02-21 19:01:45.861612	f	f	\N	\N	\N	\N
2	2	Service Overdue	Critical	Fire Extinguisher at kitchen is 2959 days overdue for service!	2026-02-21 19:01:45.863724	f	f	\N	\N	\N	\N
\.


--
-- TOC entry 5106 (class 0 OID 16529)
-- Dependencies: 234
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_messages (id, room_id, user_id, message, attachment_url, attachment_name, created_at, is_edited, edited_at) FROM stdin;
1	3	3	hello	\N	\N	2026-02-21 18:54:10.821434	f	\N
2	2	3	hello	\N	\N	2026-02-21 18:54:18.983334	f	\N
3	1	3	hello1	\N	\N	2026-02-21 18:54:26.668335	f	\N
4	1	2	hi2	\N	\N	2026-02-21 18:55:03.610598	f	\N
5	2	2	test123	\N	\N	2026-02-21 18:55:12.84695	f	\N
6	3	2	test456	\N	\N	2026-02-21 18:55:24.407311	f	\N
7	3	1	123	\N	\N	2026-02-21 18:56:09.290104	f	\N
8	2	1	dddg	\N	\N	2026-02-21 18:56:22.661358	f	\N
9	1	1	hello	\N	\N	2026-02-21 18:56:31.982082	f	\N
10	3	1	hello	\N	\N	2026-02-22 04:55:05.024892	f	\N
11	3	1	hello	\N	\N	2026-02-22 04:55:14.613803	f	\N
12	1	2	hello	\N	\N	2026-02-22 05:25:13.13624	f	\N
13	3	2	hello	\N	\N	2026-02-22 05:32:31.492295	f	\N
14	3	2	hello	\N	\N	2026-02-22 05:49:57.43741	f	\N
\.


--
-- TOC entry 5108 (class 0 OID 16552)
-- Dependencies: 236
-- Data for Name: chat_read_receipts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_read_receipts (id, message_id, user_id, read_at) FROM stdin;
1	3	2	2026-02-21 18:54:53.848782
2	2	2	2026-02-21 18:55:05.37134
3	1	2	2026-02-21 18:55:14.822591
4	1	1	2026-02-21 18:55:43.203797
5	6	1	2026-02-21 18:55:43.465189
6	2	1	2026-02-21 18:56:12.102694
7	5	1	2026-02-21 18:56:12.361009
8	3	1	2026-02-21 18:56:26.564365
9	4	1	2026-02-21 18:56:26.56557
10	6	3	2026-02-21 18:56:58.54513
11	7	3	2026-02-21 18:56:58.789529
12	5	3	2026-02-21 18:57:08.372477
13	8	3	2026-02-21 18:57:08.610752
14	4	3	2026-02-21 18:57:10.657451
15	9	3	2026-02-21 18:57:10.765812
16	7	2	2026-02-22 04:56:10.959197
17	10	2	2026-02-22 04:56:11.21484
18	11	2	2026-02-22 04:56:11.215611
19	8	2	2026-02-22 05:24:58.408516
20	9	2	2026-02-22 05:25:00.084753
21	10	3	2026-02-22 05:33:04.958158
22	11	3	2026-02-22 05:33:05.0379
23	13	3	2026-02-22 05:33:05.038653
24	13	1	2026-02-22 05:50:56.62471
25	14	1	2026-02-22 05:50:56.626522
26	14	3	2026-02-22 05:51:32.302875
\.


--
-- TOC entry 5104 (class 0 OID 16510)
-- Dependencies: 232
-- Data for Name: chat_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_rooms (id, name, room_type, equipment_id, created_at, created_by, is_active) FROM stdin;
1	General Discussion	general	\N	2026-02-21 18:40:05.509181	1	t
2	Maintenance Team	general	\N	2026-02-21 18:40:05.509184	1	t
3	Urgent Issues	general	\N	2026-02-21 18:40:05.509186	1	t
\.


--
-- TOC entry 5096 (class 0 OID 16420)
-- Dependencies: 224
-- Data for Name: equipment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment (id, equipment_id, equipment_type, serial_number, manufacturer, model, install_year, install_date, last_service_date, next_service_date, service_interval_months, location, floor, zone, near_emergency_exit, condition, status, usage_level, daily_exposure_hours, humidity_level, temperature_avg, coastal_exposure, certification_status, last_audit_score, notes, created_at, created_by) FROM stdin;
1	FE000001	Fire Extinguisher	25268	firebee	asd	2026	2026-02-02	2026-02-21	\N	6	Resturant		zone A	t	Good	ACTIVE	Medium	8		22	f	Valid	\N		2026-02-21 18:59:17.543352	1
2	FE000002	Fire Extinguisher	12345	xinomi	kjh	2015	2015-02-22	2026-02-22	\N	6	kitchen	5th Floor	zone c	t	Poor	ACTIVE	High	\N		\N	f	Valid	20		2026-02-21 19:01:33.953019	1
\.


--
-- TOC entry 5094 (class 0 OID 16404)
-- Dependencies: 222
-- Data for Name: hotel_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel_settings (id, hotel_name, city, province, address, phone, email, website, star_rating, total_rooms, hotel_type, logo_url, updated_at, updated_by) FROM stdin;
1	Amaya Hills	kandy	Central	\N	\N	\N	\N	5	100	City Hotel	\N	2026-02-21 18:40:04.715052	\N
\.


--
-- TOC entry 5098 (class 0 OID 16440)
-- Dependencies: 226
-- Data for Name: maintenance_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.maintenance_record (id, record_id, equipment_id, user_id, maintenance_date, maintenance_type, technician_name, technician_company, issues_found, actions_taken, parts_replaced, cost_lkr, duration_hours, next_service_date, status, notes, created_at) FROM stdin;
1	\N	1	1	2026-02-21	Routine Inspection	sameera 	lanka safty				0	0	\N	COMPLETED		2026-02-22 03:55:48.257938
2	\N	2	1	2026-02-22	Routine Inspection	gayan silva	lanka safty				0	0	\N	COMPLETED		2026-02-22 04:00:27.815899
3	\N	2	1	2026-02-22	Routine Inspection	gayan silva	lanka safty				0	0	\N	COMPLETED		2026-02-22 04:04:34.39701
\.


--
-- TOC entry 5100 (class 0 OID 16464)
-- Dependencies: 228
-- Data for Name: predictions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.predictions (id, equipment_id, user_id, risk_level, risk_score, prediction_date, summary, status) FROM stdin;
1	1	1	Low	8	2026-02-22 04:23:49.506266	Risk Score: 8% | Age: 0 years | Condition: Good	ACTIVE
2	2	1	Medium	55	2026-02-22 04:23:59.024592	Risk Score: 55% | Age: 11 years | Condition: Poor	ACTIVE
\.


--
-- TOC entry 5092 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, role, email, phone, date_joined, status) FROM stdin;
1	admin	$2b$12$IJE4uouKVK1uKwroYGG4N.sbkrZMPbT.z4OVI4pXvCSW.44ZwCapS	Admin	admin@firesense.com	0771234567	2026-02-21 18:40:05.498089	ACTIVE
3	tech1	$2b$12$GHzr5cKKF584PMY1bQ7mDecy9dKwxXLIhf/TbGBot8pMggunzIbgy	Technician	tech1@firesense.com	0771234569	2026-02-21 18:40:05.498096	ACTIVE
2	manager	$2b$12$aeuNUYeUxqQiCH4xkvOaJeqxnMbYCGWYdWgIBQHKShstFSWDockFa	Manager	manager@firesense.com	0771234568	2026-02-21 18:40:05.498095	ACTIVE
\.


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 229
-- Name: alert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alert_id_seq', 2, true);


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 233
-- Name: chat_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_messages_id_seq', 14, true);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 235
-- Name: chat_read_receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_read_receipts_id_seq', 26, true);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 231
-- Name: chat_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_rooms_id_seq', 3, true);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 223
-- Name: equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipment_id_seq', 2, true);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 221
-- Name: hotel_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotel_settings_id_seq', 1, true);


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 225
-- Name: maintenance_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.maintenance_record_id_seq', 3, true);


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 227
-- Name: predictions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.predictions_id_seq', 2, true);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- TOC entry 4922 (class 2606 OID 16493)
-- Name: alert alert_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_pkey PRIMARY KEY (id);


--
-- TOC entry 4926 (class 2606 OID 16540)
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- TOC entry 4928 (class 2606 OID 16560)
-- Name: chat_read_receipts chat_read_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_read_receipts
    ADD CONSTRAINT chat_read_receipts_pkey PRIMARY KEY (id);


--
-- TOC entry 4924 (class 2606 OID 16517)
-- Name: chat_rooms chat_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_rooms
    ADD CONSTRAINT chat_rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 4912 (class 2606 OID 16433)
-- Name: equipment equipment_equipment_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_equipment_id_key UNIQUE (equipment_id);


--
-- TOC entry 4914 (class 2606 OID 16431)
-- Name: equipment equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_pkey PRIMARY KEY (id);


--
-- TOC entry 4910 (class 2606 OID 16413)
-- Name: hotel_settings hotel_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_settings
    ADD CONSTRAINT hotel_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 4916 (class 2606 OID 16450)
-- Name: maintenance_record maintenance_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_record
    ADD CONSTRAINT maintenance_record_pkey PRIMARY KEY (id);


--
-- TOC entry 4918 (class 2606 OID 16452)
-- Name: maintenance_record maintenance_record_record_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_record
    ADD CONSTRAINT maintenance_record_record_id_key UNIQUE (record_id);


--
-- TOC entry 4920 (class 2606 OID 16473)
-- Name: predictions predictions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_pkey PRIMARY KEY (id);


--
-- TOC entry 4906 (class 2606 OID 16400)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4908 (class 2606 OID 16402)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4935 (class 2606 OID 16494)
-- Name: alert alert_equipment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(id);


--
-- TOC entry 4936 (class 2606 OID 16504)
-- Name: alert alert_read_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_read_by_fkey FOREIGN KEY (read_by) REFERENCES public.users(id);


--
-- TOC entry 4937 (class 2606 OID 16499)
-- Name: alert alert_resolved_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_resolved_by_fkey FOREIGN KEY (resolved_by) REFERENCES public.users(id);


--
-- TOC entry 4940 (class 2606 OID 16541)
-- Name: chat_messages chat_messages_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.chat_rooms(id);


--
-- TOC entry 4941 (class 2606 OID 16546)
-- Name: chat_messages chat_messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4942 (class 2606 OID 16561)
-- Name: chat_read_receipts chat_read_receipts_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_read_receipts
    ADD CONSTRAINT chat_read_receipts_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.chat_messages(id);


--
-- TOC entry 4943 (class 2606 OID 16566)
-- Name: chat_read_receipts chat_read_receipts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_read_receipts
    ADD CONSTRAINT chat_read_receipts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4938 (class 2606 OID 16523)
-- Name: chat_rooms chat_rooms_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_rooms
    ADD CONSTRAINT chat_rooms_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 4939 (class 2606 OID 16518)
-- Name: chat_rooms chat_rooms_equipment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_rooms
    ADD CONSTRAINT chat_rooms_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(id);


--
-- TOC entry 4930 (class 2606 OID 16434)
-- Name: equipment equipment_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment
    ADD CONSTRAINT equipment_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- TOC entry 4929 (class 2606 OID 16414)
-- Name: hotel_settings hotel_settings_updated_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_settings
    ADD CONSTRAINT hotel_settings_updated_by_fkey FOREIGN KEY (updated_by) REFERENCES public.users(id);


--
-- TOC entry 4931 (class 2606 OID 16453)
-- Name: maintenance_record maintenance_record_equipment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_record
    ADD CONSTRAINT maintenance_record_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(id);


--
-- TOC entry 4932 (class 2606 OID 16458)
-- Name: maintenance_record maintenance_record_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.maintenance_record
    ADD CONSTRAINT maintenance_record_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4933 (class 2606 OID 16474)
-- Name: predictions predictions_equipment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_equipment_id_fkey FOREIGN KEY (equipment_id) REFERENCES public.equipment(id);


--
-- TOC entry 4934 (class 2606 OID 16479)
-- Name: predictions predictions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.predictions
    ADD CONSTRAINT predictions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2026-02-22 14:04:00

--
-- PostgreSQL database dump complete
--

\unrestrict Pm9pwQUVq8eBvfCgKwnxdwNysyhKvOgNi67DZsGAqyJBDLrTiKeWeQkxUAXZ2X4

