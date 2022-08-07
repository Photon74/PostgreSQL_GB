--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_user_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_user_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities (id, name, creator_user_id, created_at) FROM stdin;
1	Ornare Lectus Justo PC	42	2022-11-01 10:06:30
2	Proin Vel Nisl Incorporated	89	2022-04-17 04:52:59
3	Eu Eros Nam LLC	13	2022-10-26 06:02:34
4	Duis Risus Industries	24	2021-09-24 05:36:02
5	Adipiscing Limited	60	2022-03-18 02:04:24
6	Ac Ipsum Phasellus Corp.	65	2022-07-18 08:13:09
7	Aliquet LLC	4	2023-01-18 11:40:07
8	Consectetuer Institute	55	2021-09-13 09:31:24
9	Tempor LLP	77	2023-07-09 02:25:50
10	Ut Ipsum LLP	66	2023-04-03 04:18:31
11	Sed Congue Foundation	99	2022-09-10 10:46:10
12	Parturient Associates	92	2023-08-03 07:33:50
13	Augue Id Foundation	21	2023-03-13 07:18:40
14	Risus Inc.	52	2023-06-27 07:47:56
15	Condimentum Eget Industries	28	2022-12-27 11:30:23
16	Diam LLP	98	2021-08-16 01:52:55
17	In Consequat Incorporated	4	2021-12-10 04:57:16
18	Ipsum Corporation	67	2023-05-26 02:27:59
19	Mollis Non Associates	26	2023-05-22 01:12:33
20	Enim Commodo Hendrerit Inc.	19	2021-10-18 12:08:01
21	Metus Industries	82	2023-06-25 12:38:13
22	Tincidunt Aliquam Consulting	4	2023-03-30 08:14:29
23	Consequat Nec LLP	28	2023-05-08 07:00:33
24	Fusce Dolor Incorporated	86	2023-03-12 11:18:05
25	Magna LLP	3	2022-03-31 04:01:31
26	Morbi Ltd	79	2023-07-28 09:08:54
27	Ridiculus Mus Institute	61	2022-08-22 10:13:58
28	Pellentesque Habitant Corporation	91	2021-12-26 05:24:21
29	Ut Tincidunt Vehicula Inc.	42	2022-03-18 04:36:16
30	Pretium Et Foundation	71	2022-04-28 09:05:58
31	Maecenas Malesuada Limited	55	2022-02-15 04:19:35
32	Lorem Auctor Quis Limited	63	2021-11-05 03:50:07
33	Vestibulum Accumsan Industries	26	2023-07-14 06:37:03
34	Dui Nec Consulting	8	2023-05-10 02:40:11
35	Sollicitudin Commodo Ipsum Foundation	34	2021-09-12 07:27:20
36	Leo In Company	21	2022-12-02 07:40:32
37	Donec LLP	37	2022-04-06 07:45:20
38	Orci Associates	82	2023-03-21 08:33:33
39	A LLP	34	2022-08-01 12:51:51
40	Lorem Fringilla Limited	69	2023-06-12 10:16:43
41	Urna Nunc Associates	32	2021-08-15 04:18:01
42	Sit PC	28	2021-11-30 09:45:59
43	Vitae LLC	24	2022-09-14 03:12:32
44	A Enim Suspendisse Limited	59	2023-07-02 04:37:28
45	Euismod Urna Corp.	55	2022-07-09 01:15:50
46	Arcu Limited	51	2023-01-29 08:59:58
47	Vitae Velit Corporation	22	2021-12-25 07:46:24
48	Tellus Lorem Ltd	25	2022-06-24 03:43:49
49	Non Foundation	71	2022-08-28 11:35:15
50	Adipiscing Elit Incorporated	28	2021-12-19 01:04:59
51	Pharetra Ut Inc.	21	2023-01-01 08:42:28
52	Diam Corp.	29	2022-03-08 07:27:54
53	Augue Eu Associates	56	2022-05-29 05:37:48
54	Euismod PC	61	2021-10-07 09:24:53
55	At Iaculis Quis Associates	97	2021-08-16 12:18:30
56	Mi Lorem Ltd	81	2021-10-22 10:13:39
57	Bibendum Fermentum Industries	25	2022-12-18 02:08:21
58	Dolor Sit Ltd	32	2022-04-26 11:07:06
59	Mi Tempor Lorem Foundation	94	2023-07-29 06:26:25
60	Arcu Sed Institute	71	2022-12-23 08:35:43
61	Faucibus LLP	72	2023-07-02 09:15:45
62	Ultrices Corp.	22	2021-11-19 01:39:15
63	Mauris Blandit Mattis LLP	48	2022-10-22 05:39:07
64	In LLP	80	2021-10-01 04:56:57
65	Elementum At Institute	66	2021-08-25 08:52:46
66	Est PC	54	2022-07-16 09:54:52
67	Ac Corp.	86	2022-08-23 08:02:05
68	Tempor Arcu Inc.	23	2021-10-19 10:19:14
69	Donec Dignissim PC	24	2023-04-17 06:23:50
70	Placerat Velit Institute	74	2023-06-11 10:17:21
71	Nascetur Ridiculus Institute	36	2023-05-31 02:07:18
72	Augue Ac Foundation	80	2023-03-03 02:09:13
73	Feugiat Placerat Industries	66	2021-11-04 03:52:16
74	Eu Ultrices Limited	86	2023-07-26 06:43:49
75	Et Commodo Foundation	95	2023-05-09 07:51:55
76	Fusce Mollis Duis LLC	48	2022-03-16 01:01:00
77	Diam Nunc Consulting	79	2023-08-05 04:26:11
78	Placerat Eget Corp.	12	2021-11-21 09:08:23
79	Parturient Montes Associates	43	2022-04-06 01:19:04
80	Pellentesque Massa Lobortis LLC	5	2021-08-14 01:48:25
81	Ut Industries	19	2023-04-27 11:10:36
82	Fermentum Vel LLC	30	2023-02-13 05:04:44
83	Mi PC	71	2022-11-20 10:59:50
84	Eu Augue LLC	84	2023-05-19 01:04:28
85	Magnis Dis Parturient Institute	99	2022-04-27 11:27:38
86	Gravida Sit Amet Associates	83	2022-12-06 03:35:02
87	Pharetra Quisque Industries	28	2023-02-17 01:29:46
88	Nunc Sollicitudin Industries	57	2023-07-31 12:59:36
89	Tempor Foundation	31	2022-09-24 02:27:37
90	Quisque Tincidunt Foundation	5	2023-07-16 05:45:24
91	Molestie Industries	54	2022-08-23 06:00:39
92	Elit Erat Vitae LLP	7	2021-09-29 12:08:00
93	Hendrerit Foundation	32	2021-10-08 03:29:07
94	Viverra Maecenas Iaculis Inc.	57	2021-08-20 07:33:40
95	Molestie Limited	89	2023-06-29 04:32:21
96	Orci Consectetuer Associates	57	2022-11-14 01:17:28
97	Magna Cras PC	1	2022-04-21 10:58:44
98	Mauris A Nunc Limited	28	2023-02-22 11:28:19
99	Mauris Associates	21	2022-02-08 11:07:11
100	Placerat Eget LLP	85	2022-06-24 12:59:52
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
13	40	2022-12-10 03:14:54
86	28	2023-07-20 09:06:45
7	2	2022-08-18 07:20:55
49	95	2022-07-12 10:57:37
44	72	2023-04-12 02:36:01
69	99	2023-02-19 01:00:01
64	22	2023-02-09 01:53:01
9	38	2022-11-01 08:36:40
61	45	2023-04-17 09:49:42
8	99	2022-09-28 08:34:11
39	41	2021-09-24 12:14:55
41	86	2021-09-15 07:20:59
6	15	2022-04-16 05:32:59
43	62	2022-06-15 07:50:07
29	31	2021-12-08 08:59:32
41	68	2022-07-17 07:48:23
96	9	2021-08-10 12:16:52
80	18	2023-07-28 07:15:12
8	61	2021-08-13 04:42:04
59	81	2023-02-27 03:56:04
3	71	2022-07-04 10:28:22
57	55	2022-02-13 10:59:51
74	57	2023-07-20 02:14:24
17	56	2022-04-05 11:23:21
81	48	2021-11-14 06:06:05
75	40	2022-10-18 05:36:53
61	70	2022-05-04 10:19:14
99	54	2022-01-12 04:25:39
82	34	2023-08-05 12:51:01
76	22	2021-11-11 06:13:37
95	68	2023-07-08 06:10:07
6	93	2023-03-05 12:36:57
4	61	2022-09-08 09:10:10
23	29	2022-06-29 04:59:35
81	92	2022-07-31 03:19:02
23	47	2022-11-26 05:32:27
79	94	2021-12-14 02:46:47
7	81	2023-01-27 04:01:02
40	82	2022-02-07 02:23:09
58	82	2023-05-13 12:36:01
67	8	2023-03-29 11:50:30
35	43	2022-09-02 07:04:24
93	75	2022-02-08 11:49:46
56	34	2022-04-11 06:53:58
29	83	2022-11-16 04:23:25
98	41	2023-01-25 09:59:07
2	39	2023-01-20 09:23:11
96	96	2022-11-17 09:26:11
9	39	2022-10-21 06:34:08
15	89	2022-01-23 08:45:17
49	19	2022-05-19 01:59:38
91	8	2022-04-09 07:39:19
28	61	2023-07-03 06:28:16
80	44	2022-02-13 02:56:26
63	97	2023-07-21 03:27:19
6	76	2022-06-16 12:20:47
15	24	2023-07-12 08:32:22
24	49	2021-12-26 03:25:56
31	90	2022-01-11 11:13:46
66	26	2022-06-09 09:42:59
3	69	2022-03-19 07:34:57
42	93	2022-02-27 04:02:49
88	75	2022-05-01 06:57:49
72	23	2022-06-08 08:45:57
71	53	2021-11-20 02:16:59
60	78	2023-04-07 02:33:08
41	13	2021-11-25 01:41:38
33	55	2022-07-01 08:53:24
19	20	2022-06-17 09:13:43
68	27	2023-03-06 01:09:46
47	79	2023-07-25 03:03:32
48	50	2023-05-10 05:57:38
94	23	2021-10-21 10:21:39
65	7	2022-07-17 01:49:32
33	47	2022-12-15 03:56:59
87	6	2022-05-22 03:12:47
96	82	2023-06-21 02:33:58
82	73	2021-09-17 05:02:30
50	55	2021-09-11 12:26:14
28	91	2022-02-12 02:39:06
34	52	2021-11-20 02:31:21
62	81	2022-06-26 06:24:00
93	28	2021-10-13 07:03:40
44	73	2021-12-13 11:45:01
99	31	2022-02-24 04:46:04
60	86	2022-07-11 04:25:23
62	35	2023-05-31 08:09:49
34	6	2023-05-29 07:19:28
96	60	2023-01-16 08:58:18
78	85	2022-06-27 01:47:55
14	35	2021-10-22 09:53:39
98	31	2021-08-24 11:03:34
26	89	2023-06-16 06:41:42
46	36	2023-02-12 08:54:09
3	24	2023-03-02 10:20:59
56	90	2022-06-17 11:58:24
84	77	2022-08-08 04:37:56
9	61	2023-03-30 01:08:13
74	73	2021-12-03 07:40:52
23	51	2022-01-01 07:02:59
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	88	2	2	2023-07-07 10:11:30	2023-05-26 10:30:44
2	7	2	1	2022-04-04 09:28:34	2022-06-24 05:44:13
3	4	8	2	2021-08-22 05:19:54	2023-07-17 10:11:55
4	20	1	2	2021-09-28 04:58:17	2022-12-04 12:46:39
5	9	7	2	2022-07-08 04:06:26	2022-06-30 02:38:41
6	54	10	1	2023-02-15 09:03:16	2023-07-17 07:17:57
7	84	8	1	2022-02-23 11:06:45	2022-02-07 06:08:19
8	10	8	2	2021-11-20 04:38:04	2022-06-10 06:42:27
9	83	9	1	2023-05-03 04:47:21	2022-06-18 12:36:24
10	84	5	2	2022-12-08 09:33:12	2022-01-09 05:00:27
11	25	2	1	2022-10-09 06:59:11	2022-07-28 08:31:52
12	14	9	2	2022-09-26 04:43:45	2022-11-21 05:19:36
13	39	10	1	2023-04-10 03:59:53	2023-06-04 02:00:22
14	20	4	2	2022-01-11 09:49:49	2021-08-16 01:42:31
15	84	9	1	2023-07-29 10:30:15	2022-08-16 09:33:13
16	15	6	2	2022-12-07 11:01:43	2022-02-23 02:22:07
17	19	3	1	2022-09-10 03:13:45	2021-10-11 05:29:35
18	29	2	1	2023-03-02 09:26:24	2022-06-24 07:56:40
19	72	9	1	2022-09-17 10:05:35	2021-08-12 10:39:42
20	63	9	1	2023-06-07 01:35:27	2022-02-25 04:45:31
21	15	5	2	2022-05-18 10:58:53	2022-12-17 07:32:26
22	87	3	2	2023-03-17 08:04:45	2022-08-05 08:31:47
23	80	8	1	2022-02-26 04:06:43	2022-07-27 01:54:05
24	94	2	1	2023-03-01 09:23:40	2023-07-19 12:36:00
25	23	8	1	2022-08-04 07:31:53	2023-06-07 04:48:56
26	45	4	2	2023-07-15 08:19:10	2022-10-27 08:17:58
27	33	7	2	2023-02-21 05:55:03	2022-12-01 01:03:47
28	18	6	1	2022-01-09 01:20:04	2023-07-11 03:17:10
29	36	6	2	2022-02-21 10:15:37	2021-10-21 04:55:25
30	94	5	1	2022-12-01 12:11:10	2021-10-23 12:21:05
31	10	10	2	2023-02-05 05:29:00	2023-01-02 08:53:18
32	9	1	1	2022-10-31 09:37:38	2023-03-04 08:47:14
33	87	6	2	2022-12-15 09:53:13	2022-03-22 07:02:14
34	39	5	1	2022-04-07 01:05:43	2022-11-20 11:46:41
35	12	10	2	2023-01-17 05:01:52	2021-09-25 05:09:02
36	36	4	1	2022-09-22 04:05:40	2022-05-30 10:23:42
37	87	9	2	2022-07-27 10:40:00	2023-04-23 06:42:16
38	89	1	2	2021-10-27 04:32:33	2022-03-26 09:05:46
39	55	2	2	2023-06-01 08:57:28	2022-01-04 11:54:09
40	47	5	2	2022-05-08 04:39:41	2023-07-18 09:21:09
41	27	10	1	2022-09-21 12:31:31	2023-06-19 12:42:25
42	84	9	1	2022-05-10 07:26:08	2022-07-24 05:30:15
43	86	5	2	2021-08-07 08:29:35	2023-05-03 08:06:16
44	63	5	2	2022-08-20 01:14:58	2023-02-02 02:57:29
45	69	8	2	2022-10-25 02:32:18	2022-04-29 12:31:34
46	2	8	2	2021-08-18 04:17:12	2022-11-13 06:31:22
47	48	9	2	2021-10-04 08:14:41	2021-12-03 12:26:36
48	68	2	1	2022-08-07 10:05:36	2023-02-26 11:22:37
49	91	8	1	2022-04-23 12:59:19	2022-09-01 01:36:25
50	97	3	2	2021-12-14 07:42:24	2023-05-14 10:10:42
51	72	7	2	2022-05-24 04:45:30	2023-06-01 03:45:05
52	41	3	2	2021-10-19 07:28:08	2023-07-03 11:29:33
53	59	2	2	2023-04-25 11:21:34	2022-09-18 01:57:58
54	47	9	1	2022-12-27 07:16:52	2021-08-18 03:59:55
55	2	2	1	2022-06-24 01:51:23	2021-10-07 12:59:01
56	18	5	1	2022-09-21 08:26:53	2021-08-07 05:40:48
57	47	9	2	2021-10-14 12:42:51	2022-11-11 04:16:14
58	70	9	1	2023-03-24 10:37:55	2021-10-14 07:25:53
59	70	5	2	2022-01-19 12:27:12	2022-02-08 10:36:53
60	52	5	2	2022-02-19 12:11:50	2022-08-05 06:31:46
61	65	3	2	2022-10-17 07:28:35	2022-02-27 08:39:58
62	87	8	1	2022-12-28 07:13:01	2023-02-24 07:30:05
63	32	9	1	2021-11-01 10:52:14	2022-07-28 04:28:11
64	95	1	1	2023-01-20 02:29:25	2022-07-28 09:58:08
65	68	6	1	2022-07-15 06:06:37	2022-09-03 02:14:31
66	3	9	1	2022-10-03 04:56:41	2022-11-03 11:41:11
67	7	5	2	2023-03-10 01:40:13	2023-02-01 05:33:57
68	65	7	2	2023-07-08 11:13:50	2021-09-27 07:18:31
69	99	2	2	2022-05-26 03:49:02	2023-06-14 04:52:05
70	45	7	2	2023-04-08 03:56:30	2022-08-11 11:08:46
71	33	4	2	2022-08-20 02:07:19	2022-01-29 01:32:48
72	47	7	1	2021-08-17 12:21:23	2021-08-16 03:42:44
73	87	8	1	2022-09-07 05:31:05	2022-11-18 11:36:15
74	81	8	2	2022-06-27 01:07:05	2021-10-13 01:02:31
75	63	7	1	2022-07-31 12:46:23	2023-06-25 02:13:06
76	73	2	1	2021-11-16 03:17:30	2023-04-26 06:37:16
77	69	3	2	2023-06-14 01:48:36	2021-11-24 02:05:15
78	1	4	2	2022-12-16 01:21:23	2023-02-12 06:17:43
79	48	6	2	2023-01-08 05:04:40	2023-04-05 11:42:25
80	76	4	1	2023-03-23 12:54:17	2023-07-08 08:03:40
81	42	2	2	2023-04-18 11:48:02	2023-02-21 07:23:41
82	49	8	2	2023-04-30 07:37:08	2023-05-26 11:53:53
83	83	4	1	2023-05-02 01:40:27	2022-08-30 02:39:20
84	36	6	1	2023-05-05 01:21:19	2022-07-29 08:52:30
85	64	1	2	2021-11-13 06:18:16	2021-12-05 01:00:26
86	65	3	2	2022-09-16 01:36:28	2022-03-04 01:06:32
87	39	5	1	2021-08-28 09:33:49	2021-09-18 07:52:29
88	74	4	1	2022-08-21 06:30:32	2022-10-09 01:05:15
89	94	8	2	2022-03-07 10:55:43	2023-03-07 11:33:02
90	84	8	1	2023-04-01 12:09:13	2021-09-07 05:27:15
91	54	6	1	2022-03-11 09:16:41	2023-04-27 05:06:07
92	70	2	1	2022-12-22 07:34:51	2023-05-05 01:26:28
93	68	9	2	2022-08-08 08:43:41	2023-01-28 12:41:32
94	72	2	1	2022-10-24 10:40:48	2021-10-17 02:39:39
95	35	8	2	2023-07-26 03:20:29	2022-07-20 05:27:30
96	97	9	1	2022-08-17 08:36:02	2022-11-08 01:00:25
97	24	1	2	2022-10-12 05:52:52	2023-07-31 10:02:54
98	4	2	2	2022-10-16 02:08:36	2022-09-28 12:10:04
99	75	2	1	2021-12-01 01:45:45	2023-01-05 09:05:31
100	2	7	1	2023-07-14 09:42:55	2023-03-17 08:39:01
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	принято
2	отвергнуто
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	88	9	venenatis lacus. Etiam bibendum fermentum metus. Aenean	f	f	2022-10-07 10:07:37
2	16	4	nec, imperdiet nec, leo. Morbi neque	f	t	2023-06-13 06:46:37
3	73	3	egestas nunc sed libero. Proin sed turpis nec	t	f	2023-01-25 06:56:41
4	61	6	risus. Nunc ac sem ut dolor dapibus gravida.	f	f	2021-12-02 02:31:22
5	57	6	non, hendrerit id, ante. Nunc mauris sapien, cursus	t	f	2022-11-11 01:20:29
6	50	2	euismod in, dolor. Fusce feugiat. Lorem	t	f	2022-11-20 02:21:43
7	94	10	molestie in, tempus eu, ligula. Aenean euismod mauris eu	t	f	2022-11-14 06:34:03
8	29	9	amet, dapibus id, blandit at, nisi.	t	t	2022-07-05 04:14:12
9	65	7	malesuada vel, venenatis vel, faucibus id, libero. Donec	t	t	2022-06-04 05:08:52
10	83	4	erat nonummy ultricies ornare, elit elit fermentum	t	t	2023-05-05 12:26:17
11	2	1	molestie pharetra nibh. Aliquam ornare, libero at auctor ullamcorper,	t	t	2022-01-07 07:09:06
12	66	3	magna. Nam ligula elit, pretium et,	f	t	2023-03-05 07:31:15
13	91	9	auctor odio a purus. Duis elementum,	f	f	2022-05-04 12:10:45
14	20	6	enim diam vel arcu. Curabitur ut odio vel est tempor	f	f	2022-01-20 11:04:37
15	26	9	Curae Phasellus ornare. Fusce mollis.	t	t	2022-11-24 09:15:27
16	3	10	arcu. Vestibulum ante ipsum primis in faucibus orci luctus et	t	t	2023-05-15 04:44:53
17	68	4	id sapien. Cras dolor dolor, tempus non, lacinia at, iaculis	t	t	2023-02-08 08:37:28
18	79	10	a purus. Duis elementum, dui quis accumsan convallis,	f	f	2022-12-14 05:52:24
19	25	3	elit, dictum eu, eleifend nec, malesuada ut, sem.	t	t	2021-08-28 06:21:17
20	12	6	Mauris blandit enim consequat purus. Maecenas libero	t	f	2022-08-10 06:06:31
21	3	2	magnis dis parturient montes, nascetur ridiculus mus. Donec	f	f	2023-04-08 04:37:59
22	43	6	purus mauris a nunc. In at pede.	f	t	2021-12-26 10:15:02
23	64	4	consectetuer mauris id sapien. Cras dolor dolor, tempus non,	f	t	2023-05-06 10:53:16
24	83	7	sodales elit erat vitae risus. Duis	t	f	2022-03-23 03:58:13
25	7	2	dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare,	t	f	2022-07-16 07:16:02
26	29	10	dolor dolor, tempus non, lacinia at, iaculis	t	t	2023-07-13 06:17:07
27	74	4	eget magna. Suspendisse tristique neque venenatis lacus. Etiam	f	t	2022-03-08 10:49:21
28	73	3	nunc ac mattis ornare, lectus ante dictum	f	f	2023-02-05 05:30:35
29	60	4	tincidunt aliquam arcu. Aliquam ultrices iaculis	t	t	2023-06-30 06:49:17
30	16	9	quam. Pellentesque habitant morbi tristique	f	t	2022-07-09 07:24:39
31	5	8	adipiscing ligula. Aenean gravida nunc sed pede. Cum	t	t	2023-01-19 12:17:51
32	92	7	Donec feugiat metus sit amet ante. Vivamus	f	f	2022-07-05 01:57:41
33	41	6	non, vestibulum nec, euismod in, dolor. Fusce feugiat.	t	f	2022-04-17 07:55:10
34	32	5	euismod est arcu ac orci. Ut semper pretium neque. Morbi	f	t	2023-02-18 11:24:26
35	67	7	augue eu tellus. Phasellus elit pede, malesuada vel, venenatis	t	f	2023-05-25 03:01:27
36	9	7	id sapien. Cras dolor dolor, tempus	f	t	2023-04-15 03:29:48
37	30	4	orci, in consequat enim diam vel arcu. Curabitur ut odio	f	f	2022-06-04 03:19:17
38	72	7	Morbi non sapien molestie orci tincidunt adipiscing. Mauris molestie	f	f	2023-04-08 07:35:30
39	82	6	posuere, enim nisl elementum purus,	t	f	2022-05-22 07:38:54
40	93	6	Sed auctor odio a purus. Duis elementum, dui quis	t	f	2022-10-14 12:36:50
41	58	4	arcu. Vestibulum ante ipsum primis in faucibus	f	t	2023-05-25 01:11:00
42	20	9	semper tellus id nunc interdum feugiat. Sed	t	t	2021-08-28 01:42:51
43	65	4	non enim. Mauris quis turpis vitae purus gravida sagittis.	f	t	2022-11-20 10:24:09
44	69	5	Suspendisse commodo tincidunt nibh. Phasellus nulla.	t	f	2022-09-07 07:51:56
45	21	5	Integer vitae nibh. Donec est mauris, rhoncus	f	t	2021-09-12 06:50:00
46	38	4	tincidunt vehicula risus. Nulla eget metus eu	t	f	2022-11-30 01:24:09
47	10	7	In ornare sagittis felis. Donec	t	t	2023-05-10 11:24:27
48	18	7	Curabitur massa. Vestibulum accumsan neque et nunc. Quisque ornare	t	t	2021-11-05 08:15:10
49	10	8	at risus. Nunc ac sem ut dolor	t	t	2021-08-08 12:27:11
50	90	2	vitae erat vel pede blandit	t	t	2023-02-22 06:32:24
51	80	4	hendrerit. Donec porttitor tellus non magna. Nam ligula	t	t	2022-02-07 11:51:59
52	14	5	lacinia at, iaculis quis, pede. Praesent eu	t	f	2022-05-04 01:46:01
53	46	1	dignissim pharetra. Nam ac nulla. In tincidunt congue	f	f	2022-10-09 01:53:18
54	28	2	sagittis. Duis gravida. Praesent eu nulla at sem molestie sodales.	t	t	2023-04-07 10:34:57
55	13	4	Proin non massa non ante bibendum	f	t	2022-05-11 04:15:53
56	13	9	et magnis dis parturient montes, nascetur ridiculus	f	t	2022-07-06 04:09:22
57	88	1	ornare egestas ligula. Nullam feugiat placerat velit. Quisque varius.	t	t	2022-11-21 03:36:34
58	76	5	orci, in consequat enim diam vel arcu. Curabitur ut	t	t	2022-01-01 09:41:43
59	58	1	cursus. Nunc mauris elit, dictum eu, eleifend nec, malesuada	f	f	2021-12-14 12:36:00
60	41	9	mollis vitae, posuere at, velit.	t	f	2023-06-24 10:24:08
61	47	3	dapibus rutrum, justo. Praesent luctus. Curabitur egestas nunc	t	f	2023-07-14 04:56:10
62	18	10	eleifend egestas. Sed pharetra, felis	f	f	2021-09-07 09:30:36
63	87	1	Ut tincidunt vehicula risus. Nulla eget metus	t	t	2023-01-06 06:31:48
64	35	7	non, cursus non, egestas a, dui. Cras pellentesque.	f	t	2023-01-04 02:21:17
65	37	9	molestie sodales. Mauris blandit enim consequat purus.	t	t	2023-07-23 07:20:35
66	15	3	urna. Ut tincidunt vehicula risus. Nulla eget metus	t	t	2023-03-25 05:20:56
67	17	8	Donec sollicitudin adipiscing ligula. Aenean gravida nunc sed	f	f	2023-01-13 06:32:12
68	57	4	dictum eleifend, nunc risus varius orci,	f	t	2023-03-20 11:01:40
69	20	2	felis. Nulla tempor augue ac ipsum. Phasellus	t	f	2022-12-25 03:33:22
70	10	2	magna tellus faucibus leo, in lobortis tellus	t	t	2023-03-23 11:49:32
71	55	2	Nunc laoreet lectus quis massa. Mauris	t	f	2022-11-06 11:00:46
72	76	7	velit in aliquet lobortis, nisi nibh	t	t	2023-02-06 07:51:56
73	60	10	dolor elit, pellentesque a, facilisis non, bibendum sed, est.	f	f	2022-01-02 03:30:51
74	65	5	adipiscing. Mauris molestie pharetra nibh. Aliquam	t	f	2023-02-07 04:42:25
75	51	6	nec luctus felis purus ac tellus. Suspendisse	t	t	2022-08-29 10:54:34
76	93	7	mollis. Duis sit amet diam eu dolor egestas rhoncus.	t	f	2022-11-18 05:47:58
77	17	6	ullamcorper. Duis at lacus. Quisque purus sapien, gravida non,	f	f	2023-02-15 05:41:52
78	97	9	metus. In lorem. Donec elementum, lorem ut aliquam iaculis, lacus	t	f	2022-10-15 02:46:37
79	98	4	velit. Cras lorem lorem, luctus ut, pellentesque eget,	t	f	2023-05-20 04:54:52
80	51	3	elementum, dui quis accumsan convallis,	t	f	2021-11-10 07:41:36
81	46	2	magna nec quam. Curabitur vel lectus. Cum sociis	t	f	2022-11-09 03:16:18
82	26	7	magna a tortor. Nunc commodo auctor velit.	t	t	2021-11-06 07:17:27
83	55	5	penatibus et magnis dis parturient montes, nascetur ridiculus mus.	t	f	2022-05-07 10:32:22
84	37	2	lobortis quis, pede. Suspendisse dui. Fusce	f	t	2022-10-10 04:50:41
85	4	5	gravida sagittis. Duis gravida. Praesent	f	f	2022-04-05 02:10:52
86	74	5	nulla vulputate dui, nec tempus mauris	t	f	2022-10-03 08:42:14
87	29	9	lectus quis massa. Mauris vestibulum, neque sed dictum	t	t	2022-04-30 06:43:51
88	87	2	purus. Duis elementum, dui quis accumsan	t	f	2022-11-20 10:11:41
89	57	6	montes, nascetur ridiculus mus. Donec dignissim magna a tortor.	f	f	2022-12-12 10:08:34
90	46	2	tincidunt dui augue eu tellus. Phasellus elit	f	t	2023-04-21 09:32:34
91	12	9	nulla magna, malesuada vel, convallis in, cursus et,	t	t	2023-02-07 01:10:32
92	31	9	ridiculus mus. Donec dignissim magna a tortor.	t	f	2023-01-05 06:45:52
93	23	8	rutrum non, hendrerit id, ante. Nunc mauris sapien, cursus in,	t	t	2022-05-13 11:09:44
94	1	9	nunc risus varius orci, in	t	t	2022-12-27 08:21:24
95	49	1	ipsum. Curabitur consequat, lectus sit amet luctus vulputate, nisi sem	t	f	2023-02-08 11:44:08
96	42	9	nec ligula consectetuer rhoncus. Nullam velit	t	t	2021-09-18 05:41:00
97	52	6	magnis dis parturient montes, nascetur ridiculus mus. Proin	f	f	2022-03-18 10:58:58
98	52	2	dolor dapibus gravida. Aliquam tincidunt, nunc ac	t	t	2022-03-11 10:21:51
99	62	2	Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	f	t	2022-01-12 03:43:16
100	87	2	placerat eget, venenatis a, magna. Lorem ipsum dolor sit	f	t	2023-06-06 01:47:39
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.photo (id, url, owner_user_id, description, uploaded_at, size) FROM stdin;
1	https://guardian.co.uk/en-us?q=test	4	Phasellus vitae mauris sit	2022-12-25 10:51:28	147
2	https://cnn.com/fr?gi=100	6	adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero	2022-09-08 02:01:01	852
3	https://pinterest.com/sub/cars?search=1&q=de	7	non, vestibulum nec, euismod in, dolor. Fusce feugiat.	2021-08-14 06:36:06	751
4	http://facebook.com/en-ca?ad=115	2	fames ac turpis egestas. Aliquam fringilla cursus	2022-06-25 03:29:23	591
5	http://baidu.com/sub?page=1&offset=1	9	dolor. Nulla semper tellus id nunc interdum feugiat. Sed nec	2022-05-16 10:27:24	724
6	https://baidu.com/site?q=test	3	vitae, sodales at, velit. Pellentesque ultricies dignissim lacus.	2022-09-04 02:11:33	27
7	https://twitter.com/user/110?q=11	6	vitae diam. Proin dolor. Nulla	2022-12-07 09:09:34	206
8	https://ebay.com/en-us?q=11	3	gravida. Praesent eu nulla	2022-05-29 06:35:57	270
9	http://ebay.com/one?ad=115	2	ullamcorper. Duis cursus, diam	2022-09-19 01:42:44	723
10	https://youtube.com/user/110?p=8	4	Class aptent taciti sociosqu ad litora torquent per conubia	2023-07-28 01:07:17	283
11	http://nytimes.com/site?search=1&q=de	3	cursus non, egestas a, dui. Cras pellentesque. Sed dictum. Proin	2022-11-07 07:37:11	753
12	http://pinterest.com/one?page=1&offset=1	8	blandit. Nam nulla magna, malesuada vel, convallis in,	2023-05-12 08:03:15	545
13	http://zoom.us/fr?q=0	7	lorem eu metus. In lorem. Donec elementum, lorem ut	2022-12-30 05:51:07	635
14	http://pinterest.com/en-us?p=8	6	neque sed dictum	2022-10-13 02:23:17	215
15	http://reddit.com/settings?q=test	5	Integer in magna.	2022-05-02 10:15:44	515
16	https://guardian.co.uk/one?search=1	7	nunc. In	2022-07-10 04:12:30	252
17	https://zoom.us/sub?client=g	5	adipiscing elit. Etiam laoreet, libero et tristique pellentesque,	2022-09-26 05:20:37	99
18	https://twitter.com/site?q=11	8	senectus et netus et malesuada fames ac turpis egestas.	2022-02-25 12:08:34	911
19	http://nytimes.com/group/9?ad=115	5	consectetuer adipiscing elit. Etiam laoreet,	2022-08-16 07:02:42	530
20	http://nytimes.com/site?search=1	7	iaculis, lacus pede	2023-06-12 09:16:10	244
21	http://youtube.com/user/110?search=1&q=de	5	sem eget massa. Suspendisse eleifend. Cras sed leo. Cras	2022-10-02 04:01:27	193
22	http://baidu.com/fr?p=8	5	Sed dictum. Proin eget	2023-05-01 07:22:51	989
23	https://guardian.co.uk/site?g=1	7	Quisque	2021-08-19 05:39:12	772
24	https://whatsapp.com/en-ca?k=0	4	malesuada ut, sem. Nulla interdum.	2021-11-24 01:11:24	220
25	https://wikipedia.org/user/110?q=4	6	vestibulum lorem, sit amet ultricies sem magna nec	2023-04-18 02:27:15	807
26	http://guardian.co.uk/settings?k=0	5	enim, condimentum eget, volutpat ornare, facilisis eget,	2021-10-26 06:37:43	633
27	https://google.com/group/9?q=4	6	est, mollis non,	2023-07-15 10:32:26	335
28	https://yahoo.com/user/110?ad=115	3	pede, malesuada	2023-03-12 09:31:50	116
29	https://bbc.co.uk/en-ca?g=1	2	facilisis vitae,	2022-01-16 10:18:25	31
30	http://bbc.co.uk/one?q=11	8	erat	2023-07-01 04:40:53	751
31	https://cnn.com/site?ab=441&aad=2	5	sed pede nec ante blandit viverra. Donec	2022-09-05 06:58:42	904
32	http://naver.com/user/110?search=1&q=de	1	dolor elit, pellentesque a,	2021-09-30 04:52:23	896
33	https://instagram.com/sub/cars?p=8	2	eu nulla	2022-11-15 08:24:10	486
34	https://guardian.co.uk/one?p=8	9	arcu. Sed eu nibh vulputate mauris sagittis placerat. Cras	2023-02-15 12:15:30	700
35	http://netflix.com/user/110?q=0	7	erat	2022-05-22 03:05:14	452
36	https://facebook.com/sub?str=se	6	ac urna. Ut tincidunt vehicula risus. Nulla eget metus	2023-04-17 03:45:25	106
37	http://cnn.com/fr?ad=115	2	fringilla ornare	2022-04-12 03:36:39	678
38	https://walmart.com/en-us?search=1&q=de	1	Quisque ornare tortor at risus. Nunc ac sem ut	2022-09-29 05:21:42	231
39	http://cnn.com/sub?str=se	8	cursus vestibulum. Mauris magna. Duis dignissim tempor	2021-09-10 08:47:23	712
40	http://nytimes.com/one?gi=100	7	nascetur ridiculus mus. Proin vel nisl. Quisque fringilla euismod	2021-12-08 08:03:36	930
41	http://baidu.com/settings?client=g	4	lacus. Aliquam rutrum lorem ac	2022-02-23 11:41:12	239
42	https://wikipedia.org/fr?search=1	6	mollis non, cursus non,	2023-05-31 12:01:19	186
43	http://baidu.com/sub?p=8	9	interdum enim non nisi. Aenean	2022-09-22 05:02:46	260
44	http://baidu.com/sub/cars?q=test	9	vitae mauris sit	2022-07-07 02:43:07	353
45	http://zoom.us/group/9?g=1	4	dictum placerat,	2023-01-13 02:53:41	924
46	http://reddit.com/settings?p=8	3	risus. Quisque libero lacus, varius et, euismod	2022-01-11 12:27:02	423
47	http://naver.com/en-ca?q=test	6	facilisis, magna tellus	2023-06-05 02:34:02	713
48	http://cnn.com/sub/cars?q=4	3	nunc. Quisque ornare tortor at risus. Nunc ac sem ut	2023-08-05 06:02:22	394
49	http://zoom.us/fr?ab=441&aad=2	4	ac mi eleifend egestas. Sed pharetra, felis eget varius	2023-04-21 03:42:19	98
50	http://walmart.com/one?q=test	2	risus. In mi pede, nonummy ut,	2023-04-18 07:20:02	383
51	https://youtube.com/one?str=se	7	vitae erat vel pede blandit congue. In	2022-01-08 02:11:05	581
52	http://netflix.com/site?g=1	5	urna. Nullam lobortis quam a felis ullamcorper	2023-03-18 11:55:26	32
53	http://reddit.com/fr?g=1	2	fringilla est. Mauris eu turpis. Nulla aliquet.	2021-11-07 06:08:43	953
54	https://yahoo.com/one?p=8	8	Nunc lectus pede, ultrices a, auctor non, feugiat nec,	2022-05-08 03:18:31	276
55	http://yahoo.com/sub?g=1	1	ac libero	2022-10-26 06:03:45	434
56	https://zoom.us/sub?ab=441&aad=2	3	vel, convallis in, cursus et, eros. Proin ultrices. Duis volutpat	2023-03-29 08:27:55	320
57	https://wikipedia.org/user/110?gi=100	8	blandit	2022-08-19 12:08:08	398
58	https://reddit.com/en-ca?q=test	4	lobortis quam a felis	2023-05-22 07:22:50	918
59	https://walmart.com/en-ca?ab=441&aad=2	3	eget mollis lectus pede et risus.	2022-01-17 05:19:07	167
60	https://twitter.com/sub?q=test	3	libero mauris, aliquam eu, accumsan sed, facilisis	2021-11-12 10:58:04	511
61	https://wikipedia.org/user/110?q=test	3	risus a ultricies adipiscing,	2023-02-10 08:05:00	519
62	http://facebook.com/settings?client=g	3	risus quis diam luctus lobortis. Class aptent	2023-03-06 03:36:30	253
63	https://youtube.com/user/110?gi=100	8	est arcu ac orci. Ut semper pretium neque. Morbi	2022-04-16 10:56:30	199
64	https://youtube.com/en-us?p=8	2	sociis natoque penatibus et magnis dis parturient montes, nascetur	2021-10-15 01:19:47	304
65	http://zoom.us/en-ca?client=g	4	erat nonummy ultricies ornare, elit elit fermentum risus, at	2022-09-23 06:38:36	790
66	https://nytimes.com/sub/cars?p=8	3	netus et malesuada fames ac turpis egestas.	2022-05-26 07:11:35	847
67	http://wikipedia.org/en-ca?q=11	5	vulputate dui, nec	2021-09-18 11:38:58	771
68	http://nytimes.com/en-ca?q=4	1	dolor. Fusce feugiat. Lorem	2023-07-01 05:54:50	944
69	https://instagram.com/en-us?q=0	10	ac mattis velit justo nec ante. Maecenas mi	2022-06-23 04:11:37	554
70	http://whatsapp.com/en-us?g=1	1	Fusce aliquet magna	2022-07-15 10:01:27	333
71	http://pinterest.com/en-ca?g=1	5	Pellentesque ultricies dignissim lacus. Aliquam rutrum lorem ac	2022-11-01 11:47:46	395
72	https://netflix.com/site?g=1	8	montes, nascetur ridiculus mus. Proin vel arcu	2021-08-25 02:27:06	875
73	https://cnn.com/group/9?q=test	2	Integer id	2023-01-25 08:37:24	928
74	http://bbc.co.uk/group/9?search=1	10	Cras pellentesque. Sed dictum. Proin eget odio.	2021-10-27 04:35:13	662
75	https://facebook.com/sub/cars?gi=100	8	risus. Duis a	2023-02-05 12:30:00	629
76	https://twitter.com/sub/cars?search=1&q=de	10	suscipit, est ac facilisis facilisis,	2023-05-04 09:44:06	535
77	http://ebay.com/en-ca?str=se	3	interdum. Sed	2022-03-14 04:02:28	137
78	http://zoom.us/settings?search=1&q=de	7	convallis est, vitae sodales nisi	2022-10-13 03:27:36	869
79	https://wikipedia.org/sub?g=1	9	Nulla semper tellus id nunc interdum	2022-12-30 09:28:48	10
80	http://youtube.com/en-us?g=1	3	ligula. Donec luctus aliquet odio. Etiam ligula	2022-09-01 04:21:36	730
81	https://ebay.com/sub?str=se	3	Pellentesque	2022-05-26 08:18:38	150
82	https://walmart.com/group/9?q=4	7	erat neque non quam. Pellentesque	2021-08-12 09:16:32	35
83	http://baidu.com/group/9?q=4	10	tellus justo sit amet nulla. Donec non justo. Proin	2022-06-22 05:25:24	393
84	https://bbc.co.uk/group/9?ad=115	5	Suspendisse sagittis. Nullam vitae	2021-08-18 07:36:44	214
85	https://whatsapp.com/settings?q=4	3	laoreet, libero	2022-01-05 06:06:28	152
86	https://bbc.co.uk/user/110?p=8	8	Cras dictum	2021-12-23 02:48:53	482
87	https://twitter.com/settings?q=4	7	quis, pede. Praesent eu dui. Cum sociis natoque penatibus et	2022-06-26 09:27:53	829
88	https://facebook.com/site?page=1&offset=1	3	metus. Aliquam	2022-06-25 08:52:17	215
89	http://zoom.us/sub/cars?ad=115	5	vitae semper egestas, urna justo faucibus lectus,	2022-05-03 06:57:26	209
90	http://wikipedia.org/group/9?q=0	3	ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu. Vestibulum	2022-12-11 09:16:10	15
91	http://wikipedia.org/site?client=g	8	nulla. In tincidunt congue turpis. In condimentum.	2022-01-05 03:50:22	960
92	http://twitter.com/fr?q=11	7	risus odio, auctor vitae, aliquet nec, imperdiet nec, leo.	2022-04-29 09:56:46	643
93	https://ebay.com/user/110?ab=441&aad=2	9	dui, nec tempus mauris erat eget	2021-11-03 06:54:32	691
94	http://zoom.us/sub/cars?q=0	10	in aliquet lobortis, nisi nibh	2023-04-10 10:10:09	202
95	http://instagram.com/settings?ad=115	7	augue scelerisque mollis. Phasellus libero mauris, aliquam eu,	2023-02-13 06:53:37	313
96	http://walmart.com/user/110?ab=441&aad=2	4	auctor, velit eget laoreet posuere, enim nisl elementum purus,	2022-02-21 07:49:51	123
97	http://youtube.com/en-us?ad=115	9	ultrices. Duis volutpat nunc sit amet	2022-01-10 05:52:53	622
98	https://cnn.com/en-us?search=1&q=de	8	libero. Integer in magna. Phasellus dolor elit, pellentesque	2022-05-09 07:23:22	70
99	http://reddit.com/en-us?ad=115	8	molestie arcu. Sed eu nibh vulputate mauris sagittis	2023-03-07 01:24:53	182
100	http://facebook.com/fr?ad=115	2	Vestibulum accumsan neque et nunc. Quisque ornare tortor at	2023-02-25 03:56:47	681
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Rhea	Mcdowell	mcdowell_rhea6329@example.ru	+72166118588	11	2022-09-22 06:44:16
2	Guinevere	Irwin	i-guinevere76@example.org	+70151475727	87	2021-12-21 02:15:43
3	Amelia	Cole	c.amelia6114@example.ru	+74493457574	47	2022-03-29 02:38:08
4	Zane	Craft	craft_zane@example.com	+70651548291	39	2023-08-04 09:29:16
5	Ulla	Branch	branchulla@example.ru	+76610652044	81	2022-01-11 04:40:52
6	Bertha	Cooper	bertha.cooper4931@example.ru	+73366380703	34	2022-05-13 08:38:03
7	Maryam	Kemp	kemp.maryam@example.ru	+76972822288	57	2022-01-12 04:50:20
8	Amos	Pope	a.pope4060@example.org	+71658321235	81	2023-07-16 05:28:05
9	Buckminster	Boyle	b_boyle@example.org	+79355562514	84	2023-05-15 10:04:31
10	Dorothy	Weaver	dweaver6757@example.org	+75351725442	47	2023-02-19 05:07:27
11	Caesar	Murphy	murphy-caesar@example.org	+72474963028	81	2022-03-05 11:46:50
12	Alvin	Nielsen	a.nielsen3574@example.org	+71951443581	80	2022-03-01 06:18:49
13	Beck	Soto	b-soto5166@example.ru	+74535852586	53	2022-05-14 05:52:09
14	Avram	Clark	clark_avram@example.org	+74836617506	96	2023-01-01 12:28:20
15	Theodore	Wilson	t-wilson3185@example.org	+75365125449	69	2022-08-21 08:39:02
16	Frances	Wyatt	w_frances@example.org	+74428287804	27	2022-07-15 11:14:13
17	Finn	Sanchez	f-sanchez@example.org	+72554959033	61	2022-05-02 12:48:50
18	Xenos	Walter	walter-xenos8016@example.ru	+72302816210	37	2022-03-18 07:03:07
19	Jennifer	Vargas	vargas_jennifer@example.org	+73028896268	42	2023-03-21 10:47:28
20	Channing	Gillespie	c.gillespie@example.com	+70431032354	68	2023-05-09 05:42:34
21	Acton	Clark	clarkacton@example.com	+71480734321	100	2023-06-15 03:41:31
22	Colleen	Cobb	c-cobb@example.org	+74606315172	1	2023-01-31 10:00:57
23	Cullen	Weiss	weiss.cullen@example.com	+71873515760	51	2022-07-15 02:12:56
24	Abbot	Grimes	abbot-grimes@example.ru	+72022984532	20	2022-01-02 03:15:21
25	Madonna	Marks	m_marks@example.org	+73601756247	5	2023-01-24 09:23:16
26	Eve	Hunter	eve_hunter6680@example.ru	+76669404831	69	2023-04-27 11:56:22
27	Abdul	Compton	abdulcompton3544@example.org	+77972185093	61	2023-02-17 06:36:05
28	Driscoll	Mays	driscoll-mays@example.ru	+75216170338	82	2022-08-17 03:19:09
29	Jennifer	Sears	jsears@example.ru	+72628744771	28	2022-03-09 03:24:52
30	Guy	Parsons	guy_parsons9087@example.com	+78608754411	100	2022-02-12 03:58:57
31	Kelsey	Mcdonald	kelsey.mcdonald@example.com	+75218321242	60	2023-02-06 07:53:23
32	Zahir	Neal	nealzahir@example.com	+74543012958	77	2022-06-26 01:35:41
33	Levi	Reynolds	reynoldslevi@example.org	+73654664378	45	2022-12-17 10:50:47
34	Slade	Mcgowan	mcgowanslade@example.org	+74578737225	59	2022-11-08 07:02:40
35	Amos	Terry	terryamos7760@example.ru	+73566113856	49	2023-01-22 08:33:48
36	Walker	Strong	wstrong1777@example.com	+78553255747	71	2022-01-07 01:43:02
37	Pamela	Mcintyre	m.pamela7962@example.org	+73015664106	53	2022-07-12 01:37:50
38	Tad	Orr	tad-orr@example.ru	+76802816164	34	2021-09-01 11:45:27
39	Beatrice	Madden	madden_beatrice@example.org	+70328298132	4	2022-04-17 04:53:10
40	Gil	Sloan	g.sloan@example.com	+79525745368	65	2022-11-11 08:13:03
41	Yen	Jacobson	jacobson.yen3821@example.org	+78230236642	94	2022-03-11 11:59:41
42	Christen	Mcdaniel	christen-mcdaniel5371@example.com	+75131337375	97	2023-08-01 10:47:36
43	Charles	Bridges	charles_bridges1071@example.org	+76094272258	11	2022-04-11 08:37:48
44	Hakeem	Crosby	crosby_hakeem@example.ru	+74015450913	73	2022-08-27 10:51:55
45	Shelby	Walsh	swalsh@example.org	+73033679916	26	2022-12-22 07:19:36
46	Lenore	Morrison	m_lenore6116@example.org	+74573467044	64	2022-07-14 01:31:45
47	Dante	Aguirre	aguirre-dante@example.com	+74741481538	4	2023-04-01 12:27:02
48	Julian	Larson	jlarson9231@example.com	+75429174162	45	2022-12-18 11:45:13
49	Callum	Hernandez	hernandez.callum@example.com	+75318288476	42	2023-02-03 05:51:44
50	Colt	Pacheco	colt.pacheco6392@example.com	+75127845752	32	2022-06-01 09:08:51
51	Yvette	Williams	ywilliams7862@example.com	+77397600799	5	2022-03-31 10:41:28
52	Kamal	Wilder	wilder.kamal4980@example.ru	+70147281576	70	2022-07-13 11:49:22
53	Aladdin	Hamilton	aladdin-hamilton4888@example.org	+71145353287	95	2023-06-24 12:44:03
54	Erasmus	Peck	peckerasmus5312@example.ru	+70754234377	46	2022-09-26 07:00:02
55	Vincent	Ford	ford_vincent8546@example.com	+70177762421	39	2022-12-18 03:45:44
56	Denise	Monroe	d.monroe8475@example.com	+76216816833	49	2022-08-30 07:10:53
57	Celeste	Moody	moodyceleste@example.org	+76444521846	3	2021-08-07 02:42:51
58	Aidan	Bennett	abennett@example.com	+72336753432	91	2021-08-07 11:27:42
59	Clarke	Mcguire	mcguire.clarke5098@example.org	+73390729762	40	2022-01-03 04:56:59
60	Brielle	Mosley	mosley_brielle@example.com	+74478223188	7	2022-01-08 10:19:47
61	Winifred	Alvarado	w.alvarado@example.org	+74338787107	95	2023-02-12 03:41:46
62	Penelope	Charles	p-charles5512@example.org	+72907700438	4	2021-10-12 07:18:27
63	Mollie	Mueller	m_mollie4132@example.com	+74863703809	19	2023-05-30 03:26:04
64	Odysseus	Herman	odysseus-herman@example.org	+73677376530	80	2023-04-10 02:04:35
65	Irma	Terry	t-irma109@example.com	+77285189958	38	2022-11-08 07:04:35
66	Armand	Wheeler	wheeler_armand@example.ru	+70848627727	34	2022-05-01 07:06:20
67	Marshall	Bell	bell_marshall8518@example.org	+79412236525	83	2023-02-22 04:23:45
68	Gloria	Valentine	valentine_gloria8685@example.ru	+75884725263	14	2023-05-12 04:34:27
69	Lawrence	Boone	l.boone@example.ru	+72733408175	99	2021-10-21 01:10:13
70	Keely	Dyer	dkeely6542@example.org	+77043722415	72	2022-08-06 11:09:03
71	Jolie	Decker	j.decker6472@example.ru	+78863245767	86	2022-06-22 07:33:54
72	Holmes	Finley	hfinley111@example.com	+71386257765	78	2022-01-20 09:54:47
73	Jaden	Ortega	j_ortega@example.com	+72547336162	83	2022-07-05 02:51:13
74	Rhona	Maldonado	mrhona@example.com	+75161272170	64	2021-10-30 02:58:41
75	Stella	Weeks	w-stella@example.ru	+74942213383	61	2021-12-30 11:32:29
76	Hollee	Franco	franco.hollee780@example.com	+75258614631	38	2023-01-11 03:35:35
77	Liberty	Cunningham	cliberty7139@example.ru	+77062912896	45	2022-05-20 06:36:53
78	Amelia	Oneil	amelia.oneil@example.org	+72135654416	19	2021-11-17 01:02:03
79	Chancellor	Lott	l_chancellor6053@example.ru	+78621135753	47	2022-03-23 07:57:48
80	Allistair	Floyd	floydallistair1642@example.ru	+71178284978	78	2022-08-18 12:45:27
81	Benjamin	Lyons	benjamin_lyons8199@example.ru	+74242977573	91	2022-04-27 05:41:50
82	Roth	Gilliam	gilliamroth7658@example.com	+73131614157	10	2023-01-26 03:52:53
83	Leroy	Ortiz	lortiz2552@example.ru	+72694056986	56	2021-09-13 03:28:03
84	Kieran	Stein	s-kieran@example.org	+72675786788	41	2022-02-07 06:30:39
85	Kaitlin	Benson	k-benson2536@example.org	+76363464347	12	2022-12-10 03:07:19
86	Daniel	Gilmore	d_gilmore@example.com	+76345015734	8	2022-08-19 01:59:24
87	Sybill	Chen	sybill.chen4140@example.ru	+74773713199	88	2022-01-02 12:22:29
88	Gail	Hammond	hgail9259@example.ru	+79257295570	20	2022-10-09 02:42:15
89	Caleb	Gaines	gaines.caleb@example.org	+70385619313	43	2022-01-14 07:21:41
90	Preston	Fulton	pfulton9022@example.com	+72027163471	54	2023-03-16 01:29:12
91	Kylee	Rivas	rivas.kylee1248@example.ru	+75575249345	76	2023-01-19 03:43:34
92	Leslie	Campos	lcampos@example.ru	+73963232453	83	2023-05-13 09:47:02
93	Hayfa	Cortez	c-hayfa@example.com	+71483420620	27	2023-03-14 11:08:19
94	Aurora	Bowman	aurora-bowman1043@example.org	+74244111254	89	2023-06-09 01:22:54
95	Burton	Phelps	b.phelps@example.com	+73120114713	70	2023-03-29 02:04:43
96	Dolan	Holden	holdendolan4575@example.org	+78556820562	23	2023-03-30 01:40:35
97	Finn	Mathis	m.finn@example.com	+71735588583	24	2022-10-17 10:23:16
98	Hayden	Lancaster	h-lancaster@example.org	+70763674362	7	2021-08-11 09:06:47
99	Hashim	Pruitt	h-pruitt@example.com	+74907878755	92	2022-03-01 11:39:04
100	Macon	Forbes	forbes_macon@example.com	+71355418635	66	2023-03-30 07:15:45
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, url, owner_user_id, description, uploaded_at, size) FROM stdin;
1	https://zoom.us/user/110?gi=100	6	fringilla cursus purus. Nullam scelerisque	2022-03-23 11:04:59	741
2	https://naver.com/site?client=g	4	Nulla interdum. Curabitur	2021-10-19 12:56:58	672
3	http://netflix.com/en-ca?str=se	2	Duis gravida. Praesent eu	2022-03-03 02:58:39	823
4	https://wikipedia.org/settings?search=1&q=de	7	dictum ultricies ligula. Nullam enim. Sed nulla ante,	2022-12-12 11:53:40	615
5	http://baidu.com/one?ad=115	3	arcu. Curabitur	2023-06-23 07:08:38	493
6	https://facebook.com/fr?g=1	7	ut, sem. Nulla	2022-04-25 05:12:15	349
7	http://nytimes.com/en-ca?page=1&offset=1	2	dolor sit amet, consectetuer	2023-08-04 06:08:44	690
8	http://nytimes.com/settings?q=0	7	a, dui.	2023-04-08 11:15:44	704
9	http://netflix.com/group/9?str=se	4	mi fringilla mi lacinia mattis. Integer eu lacus.	2021-08-26 03:30:54	493
10	http://nytimes.com/site?ab=441&aad=2	7	orci luctus et ultrices posuere cubilia Curae	2022-12-22 02:28:02	350
11	https://facebook.com/one?q=0	2	diam eu dolor	2022-06-10 05:05:19	826
12	http://yahoo.com/group/9?p=8	3	Donec feugiat metus sit amet ante.	2023-07-13 11:09:08	236
13	https://pinterest.com/sub?q=0	4	erat semper rutrum. Fusce dolor	2022-05-06 11:14:56	414
14	http://google.com/sub/cars?ab=441&aad=2	2	eu arcu. Morbi sit	2021-11-03 10:32:58	826
15	http://yahoo.com/one?client=g	5	rutrum. Fusce	2022-11-28 08:41:23	184
16	https://naver.com/en-us?page=1&offset=1	8	ut, molestie in, tempus eu, ligula. Aenean	2022-11-01 12:25:43	629
17	https://naver.com/user/110?q=test	8	Morbi neque tellus, imperdiet non, vestibulum nec, euismod in,	2022-01-01 07:49:42	75
18	http://reddit.com/site?search=1	2	conubia nostra, per inceptos hymenaeos. Mauris ut	2022-03-26 06:48:06	53
19	http://wikipedia.org/user/110?q=test	2	lorem, sit amet ultricies sem magna nec	2022-04-01 07:19:27	276
20	http://twitter.com/one?q=0	5	lectus, a sollicitudin orci sem eget	2022-07-10 10:22:05	861
21	https://pinterest.com/one?q=4	8	malesuada fames ac turpis egestas. Fusce aliquet magna a	2022-05-22 05:49:00	607
22	https://cnn.com/group/9?str=se	10	Nullam vitae diam. Proin dolor. Nulla	2022-01-10 05:52:54	671
23	https://yahoo.com/sub/cars?q=0	6	augue malesuada malesuada.	2021-10-17 07:17:43	437
24	https://nytimes.com/sub?search=1&q=de	5	interdum. Curabitur dictum.	2021-09-17 10:31:39	755
25	http://wikipedia.org/settings?client=g	5	tincidunt dui augue eu tellus. Phasellus	2022-01-14 04:10:49	366
26	https://walmart.com/sub?q=4	10	justo nec	2022-05-01 07:30:47	118
27	https://whatsapp.com/group/9?q=11	5	magna nec quam.	2022-11-28 11:43:32	776
28	https://yahoo.com/sub?q=test	4	Morbi accumsan laoreet ipsum. Curabitur consequat, lectus sit amet	2023-02-22 01:07:33	893
29	http://walmart.com/site?q=test	6	amet, dapibus id, blandit at, nisi. Cum sociis	2023-01-27 05:36:51	840
30	http://google.com/sub/cars?search=1	1	varius orci,	2023-02-08 06:11:48	895
31	https://walmart.com/settings?ad=115	3	Cras eu	2022-02-23 10:14:36	131
32	https://instagram.com/user/110?g=1	4	purus sapien, gravida	2022-12-17 12:23:06	410
33	http://google.com/sub/cars?g=1	4	Sed et libero.	2021-08-26 06:56:27	100
34	http://baidu.com/settings?ab=441&aad=2	2	vulputate velit eu sem.	2021-10-08 07:25:19	305
35	http://ebay.com/en-ca?k=0	3	a ultricies adipiscing, enim	2022-01-21 09:00:17	634
36	http://wikipedia.org/site?q=4	9	In ornare	2022-11-17 04:24:40	729
37	http://instagram.com/one?k=0	3	justo eu arcu. Morbi sit	2022-05-08 03:08:37	707
38	https://youtube.com/one?page=1&offset=1	5	tellus eu augue porttitor interdum.	2021-09-13 02:45:18	317
39	http://nytimes.com/fr?k=0	9	nisi a odio semper	2022-05-07 12:31:04	33
40	https://naver.com/sub/cars?search=1	2	rhoncus id, mollis nec, cursus a, enim.	2021-10-09 06:40:49	159
41	http://netflix.com/settings?page=1&offset=1	5	Sed eu eros. Nam consequat dolor	2023-07-06 04:00:38	389
42	https://ebay.com/sub/cars?str=se	9	condimentum. Donec	2023-04-10 07:40:03	128
43	https://zoom.us/one?search=1	8	accumsan laoreet ipsum. Curabitur consequat, lectus sit	2022-10-09 11:06:38	138
44	https://naver.com/en-ca?q=11	8	cursus purus. Nullam scelerisque	2022-08-30 06:47:43	738
45	https://naver.com/user/110?gi=100	8	suscipit nonummy. Fusce fermentum fermentum arcu.	2021-11-06 03:31:02	729
46	https://pinterest.com/en-us?client=g	4	porta elit, a feugiat tellus	2022-04-14 08:26:53	397
47	http://guardian.co.uk/sub?q=4	5	vulputate, nisi sem semper erat, in consectetuer ipsum	2023-05-18 07:21:49	516
48	http://yahoo.com/sub/cars?q=11	10	Nunc pulvinar arcu et pede. Nunc	2023-01-03 08:34:48	444
49	http://facebook.com/sub?ad=115	8	posuere vulputate, lacus.	2023-02-09 09:19:25	197
50	http://google.com/one?gi=100	2	ornare egestas ligula. Nullam feugiat	2022-10-30 04:15:07	817
51	https://reddit.com/site?ad=115	2	nisl sem, consequat nec,	2023-01-11 04:50:18	84
52	https://netflix.com/user/110?ad=115	8	tincidunt adipiscing. Mauris molestie pharetra nibh. Aliquam ornare, libero at	2022-11-21 12:54:24	410
53	https://ebay.com/en-ca?search=1	6	enim diam	2021-09-15 12:19:55	483
54	http://instagram.com/fr?search=1	5	neque sed sem egestas blandit. Nam	2023-03-06 07:14:15	818
55	https://netflix.com/sub?gi=100	4	Sed dictum. Proin	2023-01-09 08:10:56	519
56	http://yahoo.com/group/9?q=0	1	Duis gravida. Praesent eu nulla at sem molestie sodales.	2022-07-16 10:19:36	984
57	http://bbc.co.uk/en-ca?gi=100	3	Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh	2022-03-10 11:32:02	897
58	https://yahoo.com/en-us?ad=115	5	Duis volutpat nunc sit amet metus.	2022-03-28 08:26:13	880
59	https://instagram.com/one?str=se	1	augue ut lacus.	2023-05-26 08:44:05	687
60	https://walmart.com/site?search=1	5	est, congue a, aliquet	2023-08-05 12:55:29	888
61	http://walmart.com/one?q=4	2	dolor	2023-07-31 07:31:42	589
62	http://pinterest.com/settings?q=0	7	in, dolor. Fusce feugiat. Lorem ipsum dolor	2021-09-22 07:32:55	371
63	http://instagram.com/site?search=1	10	ornare. Fusce mollis. Duis sit amet	2022-06-19 01:03:23	757
64	https://instagram.com/one?q=11	2	mauris sapien, cursus in, hendrerit consectetuer, cursus et, magna.	2023-03-16 02:13:34	352
65	http://facebook.com/user/110?q=test	2	Nam porttitor scelerisque neque.	2022-01-28 08:36:28	889
66	https://pinterest.com/site?q=0	7	nulla magna,	2021-08-06 10:02:02	340
67	http://youtube.com/en-ca?k=0	9	Aenean massa. Integer vitae	2022-05-12 09:46:25	891
68	https://zoom.us/sub/cars?search=1&q=de	10	nulla vulputate dui, nec tempus mauris	2023-02-03 05:23:56	853
69	https://google.com/settings?g=1	4	tristique senectus et netus et malesuada fames	2022-07-11 01:25:03	572
70	https://walmart.com/settings?p=8	8	lacinia vitae, sodales at, velit. Pellentesque ultricies	2021-08-13 02:15:08	414
71	http://naver.com/one?q=4	7	amet, risus. Donec nibh	2023-05-18 01:05:42	754
72	http://yahoo.com/fr?q=test	5	malesuada fringilla est. Mauris	2023-07-22 07:46:33	385
73	https://naver.com/settings?client=g	7	sit amet lorem semper auctor. Mauris vel turpis.	2022-01-03 09:45:14	953
74	http://youtube.com/fr?q=4	7	libero lacus, varius et, euismod et, commodo at, libero.	2022-11-20 01:51:08	351
75	https://facebook.com/sub?k=0	5	et pede. Nunc sed orci	2022-09-09 06:45:04	345
76	https://cnn.com/fr?q=4	2	consequat enim diam vel arcu. Curabitur ut	2022-05-31 09:11:14	151
77	http://naver.com/site?search=1&q=de	2	amet nulla. Donec non	2022-05-16 06:19:28	31
78	http://facebook.com/en-us?q=test	6	nec metus facilisis lorem tristique	2022-08-25 05:16:56	285
79	http://bbc.co.uk/fr?q=11	2	quis urna. Nunc quis arcu	2023-07-11 08:49:39	372
80	http://naver.com/group/9?g=1	6	venenatis vel, faucibus	2023-01-25 07:32:24	756
81	https://instagram.com/settings?ab=441&aad=2	2	euismod enim. Etiam gravida	2022-12-06 09:35:44	566
82	https://wikipedia.org/en-us?q=test	4	Nulla eu	2023-08-03 07:45:31	343
83	http://youtube.com/group/9?q=11	8	vulputate, posuere vulputate, lacus. Cras	2023-05-09 07:29:35	844
84	https://wikipedia.org/user/110?ab=441&aad=2	3	In nec orci. Donec nibh. Quisque nonummy	2023-04-18 09:21:23	453
85	http://walmart.com/fr?search=1&q=de	3	Cum sociis natoque penatibus	2022-02-21 09:41:36	733
86	http://facebook.com/sub?gi=100	3	Nunc sollicitudin commodo ipsum.	2022-07-20 12:44:57	751
87	http://twitter.com/settings?ad=115	4	rutrum magna. Cras convallis convallis dolor. Quisque tincidunt pede	2021-12-05 03:38:39	164
88	http://naver.com/group/9?client=g	1	mus. Aenean eget magna. Suspendisse tristique	2021-10-10 01:01:02	421
89	https://ebay.com/sub/cars?p=8	8	odio. Phasellus at augue id ante dictum	2022-03-08 03:27:58	512
90	https://wikipedia.org/sub/cars?search=1&q=de	2	ligula. Nullam enim.	2022-09-08 10:49:10	702
91	https://ebay.com/settings?q=4	3	ipsum	2022-09-03 02:27:42	943
92	https://netflix.com/settings?str=se	5	ligula eu enim.	2022-06-17 01:01:08	688
93	https://yahoo.com/en-ca?client=g	6	feugiat placerat velit.	2022-03-04 05:34:06	38
94	http://facebook.com/en-us?k=0	8	eu, accumsan sed, facilisis vitae, orci.	2022-04-21 01:18:06	505
95	http://wikipedia.org/en-ca?q=11	4	lacus, varius et, euismod et, commodo	2022-10-30 05:22:41	977
96	https://youtube.com/fr?k=0	3	ligula. Nullam feugiat placerat velit.	2021-12-07 01:02:56	616
97	https://yahoo.com/settings?ad=115	2	semper auctor. Mauris vel turpis. Aliquam adipiscing lobortis risus.	2023-02-23 12:29:02	139
98	http://nytimes.com/fr?g=1	9	odio. Aliquam vulputate ullamcorper	2022-05-21 08:13:44	376
99	http://twitter.com/sub/cars?ab=441&aad=2	8	Suspendisse ac metus vitae velit egestas lacinia. Sed congue, elit	2021-10-06 09:37:42	788
100	https://whatsapp.com/sub/cars?str=se	5	tortor, dictum eu, placerat eget, venenatis	2023-06-26 02:07:58	61
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 100, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 100, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 2, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 100, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 100, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

