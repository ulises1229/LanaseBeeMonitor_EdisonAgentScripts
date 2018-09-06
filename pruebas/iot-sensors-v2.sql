--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

-- Started on 2018-01-12 10:56:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 182 (class 1259 OID 58129)
-- Name: agent_pk_id_agent_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE agent_pk_id_agent_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agent_pk_id_agent_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 58264)
-- Name: agent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE agent (
    pk_id_agent integer DEFAULT nextval('agent_pk_id_agent_seq'::regclass) NOT NULL,
    model character varying(50) NOT NULL,
    serial_number character varying(50) NOT NULL,
    fk_id_brand integer NOT NULL,
    fk_id_site integer NOT NULL
);


ALTER TABLE agent OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 58131)
-- Name: alert_pk_id_alert_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alert_pk_id_alert_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alert_pk_id_alert_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 58321)
-- Name: alert; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE alert (
    pk_id_alert integer DEFAULT nextval('alert_pk_id_alert_seq'::regclass) NOT NULL,
    priority character varying(20) NOT NULL,
    alert_state smallint NOT NULL,
    fk_id_agent integer NOT NULL,
    fk_id_observation integer NOT NULL
);


ALTER TABLE alert OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 58427)
-- Name: bee_control_pk_id_bee_control_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bee_control_pk_id_bee_control_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bee_control_pk_id_bee_control_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 58300)
-- Name: bee_control; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bee_control (
    pk_id_bee_control integer DEFAULT nextval('bee_control_pk_id_bee_control_seq'::regclass) NOT NULL,
    control_date timestamp with time zone NOT NULL,
    fk_id_bee integer NOT NULL,
    fk_id_sensor_rfid integer NOT NULL
);


ALTER TABLE bee_control OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 58127)
-- Name: bees_pk_id_bees_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bees_pk_id_bees_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bees_pk_id_bees_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 58272)
-- Name: bees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE bees (
    pk_id_bee integer DEFAULT nextval('bees_pk_id_bees_seq'::regclass) NOT NULL,
    fk_id_agent integer NOT NULL
);


ALTER TABLE bees OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 58133)
-- Name: brand_pk_id_brand_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE brand_pk_id_brand_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brand_pk_id_brand_seq OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 58163)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE brand (
    pk_id_brand integer DEFAULT nextval('brand_pk_id_brand_seq'::regclass) NOT NULL,
    brand character varying(50) NOT NULL
);


ALTER TABLE brand OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 58135)
-- Name: city_pk_id_city_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE city_pk_id_city_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE city_pk_id_city_seq OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 58233)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE city (
    pk_id_city integer DEFAULT nextval('city_pk_id_city_seq'::regclass) NOT NULL,
    city_name character varying(150) NOT NULL,
    fk_id_state integer NOT NULL
);


ALTER TABLE city OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 58137)
-- Name: country_pk_id_country_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE country_pk_id_country_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE country_pk_id_country_seq OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 58169)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE country (
    pk_id_country integer DEFAULT nextval('country_pk_id_country_seq'::regclass) NOT NULL,
    country_code character(2) NOT NULL,
    country_name character varying(150) NOT NULL,
    phone_code integer NOT NULL
);


ALTER TABLE country OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 58139)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_seq OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 58176)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE migrations (
    id integer DEFAULT nextval('migrations_id_seq'::regclass) NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 58141)
-- Name: observation_pk_id_observation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE observation_pk_id_observation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE observation_pk_id_observation_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 58309)
-- Name: observation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE observation (
    pk_id_observation integer DEFAULT nextval('observation_pk_id_observation_seq'::regclass) NOT NULL,
    observation_value character varying NOT NULL,
    observation_date date NOT NULL,
    fk_id_agent integer NOT NULL,
    fk_id_sensor integer
);


ALTER TABLE observation OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 58182)
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE password_resets OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 58143)
-- Name: sensor_pk_id_sensor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sensor_pk_id_sensor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sensor_pk_id_sensor_seq OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 58280)
-- Name: sensor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sensor (
    pk_id_sensor integer DEFAULT nextval('sensor_pk_id_sensor_seq'::regclass) NOT NULL,
    sensor_state boolean NOT NULL,
    installation_date date NOT NULL,
    descryption text NOT NULL,
    port character varying(30) NOT NULL,
    min_value double precision NOT NULL,
    max_value double precision NOT NULL,
    fk_id_sensor_type integer NOT NULL,
    fk_id_agent integer NOT NULL
);


ALTER TABLE sensor OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 58145)
-- Name: sensor_rfid_pk_id_sensor_rfid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sensor_rfid_pk_id_sensor_rfid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sensor_rfid_pk_id_sensor_rfid_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 58293)
-- Name: sensor_rfid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sensor_rfid (
    pk_id_sensor_rfid integer DEFAULT nextval('sensor_rfid_pk_id_sensor_rfid_seq'::regclass) NOT NULL,
    fk_id_agent integer NOT NULL
);


ALTER TABLE sensor_rfid OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 58149)
-- Name: sensor_type_pk_id_sensor_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sensor_type_pk_id_sensor_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sensor_type_pk_id_sensor_type_seq OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 58192)
-- Name: sensor_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sensor_type (
    pk_id_sensor_type integer DEFAULT nextval('sensor_type_pk_id_sensor_type_seq'::regclass) NOT NULL,
    sensor_type character varying(20) NOT NULL,
    fk_id_unit integer NOT NULL,
    communication_protocol character varying(20) NOT NULL
);


ALTER TABLE sensor_type OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 58151)
-- Name: site_pk_id_site_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE site_pk_id_site_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE site_pk_id_site_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 58251)
-- Name: site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE site (
    pk_id_site integer DEFAULT nextval('site_pk_id_site_seq'::regclass) NOT NULL,
    description text NOT NULL,
    site_date date NOT NULL,
    fk_id_user integer NOT NULL,
    fk_id_ubication integer NOT NULL
);


ALTER TABLE site OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 58153)
-- Name: state_pk_id_state_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE state_pk_id_state_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE state_pk_id_state_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 58200)
-- Name: state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE state (
    pk_id_state integer DEFAULT nextval('state_pk_id_state_seq'::regclass) NOT NULL,
    state_name character varying(150) NOT NULL,
    fk_id_country integer NOT NULL
);


ALTER TABLE state OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 58155)
-- Name: ubication_pk_id_ubication_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ubication_pk_id_ubication_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ubication_pk_id_ubication_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 58242)
-- Name: ubication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ubication (
    pk_id_ubication integer DEFAULT nextval('ubication_pk_id_ubication_seq'::regclass) NOT NULL,
    address character varying(100),
    latitude character varying(35) NOT NULL,
    longitude character varying(35) NOT NULL,
    fk_id_city integer NOT NULL
);


ALTER TABLE ubication OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 58444)
-- Name: units_pk_id_unit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE units_pk_id_unit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE units_pk_id_unit_seq OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 58436)
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE units (
    pk_id_unit integer DEFAULT nextval('units_pk_id_unit_seq'::regclass) NOT NULL,
    unit character varying NOT NULL,
    symbol character varying
);


ALTER TABLE units OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 58157)
-- Name: user_level_pk_id_user_level_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_level_pk_id_user_level_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_level_pk_id_user_level_seq OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 58212)
-- Name: user_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_level (
    pk_id_user_level integer DEFAULT nextval('user_level_pk_id_user_level_seq'::regclass) NOT NULL,
    user_level character varying(45) NOT NULL
);


ALTER TABLE user_level OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 58220)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    pk_id_user integer NOT NULL,
    username character varying(100) NOT NULL,
    user_fullname character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying NOT NULL,
    telephone character varying(20) NOT NULL,
    fk_id_user_level integer DEFAULT 1 NOT NULL,
    remember_token character varying(100),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN users.remember_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN users.remember_token IS 'campo creado y usado por laravel';


--
-- TOC entry 203 (class 1259 OID 58218)
-- Name: users_pk_id_user_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_pk_id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_pk_id_user_seq OWNER TO postgres;

--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 203
-- Name: users_pk_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_pk_id_user_seq OWNED BY users.pk_id_user;


--
-- TOC entry 2099 (class 2604 OID 58223)
-- Name: pk_id_user; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN pk_id_user SET DEFAULT nextval('users_pk_id_user_seq'::regclass);


--
-- TOC entry 2327 (class 0 OID 58264)
-- Dependencies: 208
-- Data for Name: agent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agent (pk_id_agent, model, serial_number, fk_id_brand, fk_id_site) FROM stdin;
1	EDISON	EDISON-1	1	1
\.


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 182
-- Name: agent_pk_id_agent_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('agent_pk_id_agent_seq', 1, true);


--
-- TOC entry 2333 (class 0 OID 58321)
-- Dependencies: 214
-- Data for Name: alert; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alert (pk_id_alert, priority, alert_state, fk_id_agent, fk_id_observation) FROM stdin;
\.


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 183
-- Name: alert_pk_id_alert_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alert_pk_id_alert_seq', 1, false);


--
-- TOC entry 2331 (class 0 OID 58300)
-- Dependencies: 212
-- Data for Name: bee_control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bee_control (pk_id_bee_control, control_date, fk_id_bee, fk_id_sensor_rfid) FROM stdin;
\.


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 215
-- Name: bee_control_pk_id_bee_control_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bee_control_pk_id_bee_control_seq', 1, false);


--
-- TOC entry 2328 (class 0 OID 58272)
-- Dependencies: 209
-- Data for Name: bees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bees (pk_id_bee, fk_id_agent) FROM stdin;
1	1
\.


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 181
-- Name: bees_pk_id_bees_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bees_pk_id_bees_seq', 1, true);


--
-- TOC entry 2315 (class 0 OID 58163)
-- Dependencies: 196
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY brand (pk_id_brand, brand) FROM stdin;
1	INTEL
2	AMD
3	ARDUINO
4	NVIDIA
\.


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 184
-- Name: brand_pk_id_brand_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('brand_pk_id_brand_seq', 4, true);


--
-- TOC entry 2324 (class 0 OID 58233)
-- Dependencies: 205
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY city (pk_id_city, city_name, fk_id_state) FROM stdin;
1	Bombuflat	1
2	Garacharma	1
3	Port Blair	1
4	Rangat	1
5	Addanki	2
6	Adivivaram	2
7	Adoni	2
8	Aganampudi	2
9	Ajjaram	2
10	Akividu	2
11	Akkarampalle	2
12	Akkayapalle	2
13	Akkireddipalem	2
14	Alampur	2
15	Amalapuram	2
16	Amudalavalasa	2
17	Amur	2
18	Anakapalle	2
19	Anantapur	2
20	Andole	2
21	Atmakur	2
22	Attili	2
23	Avanigadda	2
24	Badepalli	2
25	Badvel	2
26	Balapur	2
27	Bandarulanka	2
28	Banganapalle	2
29	Bapatla	2
30	Bapulapadu	2
31	Belampalli	2
32	Bestavaripeta	2
33	Betamcherla	2
34	Bhattiprolu	2
35	Bhimavaram	2
36	Bhimunipatnam	2
37	Bobbili	2
38	Bombuflat	2
39	Bommuru	2
40	Bugganipalle	2
41	Challapalle	2
42	Chandur	2
43	Chatakonda	2
44	Chemmumiahpet	2
45	Chidiga	2
46	Chilakaluripet	2
47	Chimakurthy	2
48	Chinagadila	2
49	Chinagantyada	2
50	Chinnachawk	2
51	Chintalavalasa	2
52	Chipurupalle	2
53	Chirala	2
54	Chittoor	2
55	Chodavaram	2
56	Choutuppal	2
57	Chunchupalle	2
58	Cuddapah	2
59	Cumbum	2
60	Darnakal	2
61	Dasnapur	2
62	Dauleshwaram	2
63	Dharmavaram	2
64	Dhone	2
65	Dommara Nandyal	2
66	Dowlaiswaram	2
67	East Godavari Dist.	2
68	Eddumailaram	2
69	Edulapuram	2
70	Ekambara kuppam	2
71	Eluru	2
72	Enikapadu	2
73	Fakirtakya	2
74	Farrukhnagar	2
75	Gaddiannaram	2
76	Gajapathinagaram	2
77	Gajularega	2
78	Gajuvaka	2
79	Gannavaram	2
80	Garacharma	2
81	Garimellapadu	2
82	Giddalur	2
83	Godavarikhani	2
84	Gopalapatnam	2
85	Gopalur	2
86	Gorrekunta	2
87	Gudivada	2
88	Gudur	2
89	Guntakal	2
90	Guntur	2
91	Guti	2
92	Hindupur	2
93	Hukumpeta	2
94	Ichchapuram	2
95	Isnapur	2
96	Jaggayyapeta	2
97	Jallaram Kamanpur	2
98	Jammalamadugu	2
99	Jangampalli	2
100	Jarjapupeta	2
101	Kadiri	2
102	Kaikalur	2
103	Kakinada	2
104	Kallur	2
105	Kalyandurg	2
106	Kamalapuram	2
107	Kamareddi	2
108	Kanapaka	2
109	Kanigiri	2
110	Kanithi	2
111	Kankipadu	2
112	Kantabamsuguda	2
113	Kanuru	2
114	Karnul	2
115	Katheru	2
116	Kavali	2
117	Kazipet	2
118	Khanapuram Haveli	2
119	Kodar	2
120	Kollapur	2
121	Kondapalem	2
122	Kondapalle	2
123	Kondukur	2
124	Kosgi	2
125	Kothavalasa	2
126	Kottapalli	2
127	Kovur	2
128	Kovurpalle	2
129	Kovvur	2
130	Krishna	2
131	Kuppam	2
132	Kurmannapalem	2
133	Kurnool	2
134	Lakshettipet	2
135	Lalbahadur Nagar	2
136	Machavaram	2
137	Macherla	2
138	Machilipatnam	2
139	Madanapalle	2
140	Madaram	2
141	Madhuravada	2
142	Madikonda	2
143	Madugule	2
144	Mahabubnagar	2
145	Mahbubabad	2
146	Malkajgiri	2
147	Mamilapalle	2
148	Mancheral	2
149	Mandapeta	2
150	Mandasa	2
151	Mangalagiri	2
152	Manthani	2
153	Markapur	2
154	Marturu	2
155	Metpalli	2
156	Mindi	2
157	Mirpet	2
158	Moragudi	2
159	Mothugudam	2
160	Nagari	2
161	Nagireddipalle	2
162	Nandigama	2
163	Nandikotkur	2
164	Nandyal	2
165	Narasannapeta	2
166	Narasapur	2
167	Narasaraopet	2
168	Narayanavanam	2
169	Narsapur	2
170	Narsingi	2
171	Narsipatnam	2
172	Naspur	2
173	Nathayyapalem	2
174	Nayudupeta	2
175	Nelimaria	2
176	Nellore	2
177	Nidadavole	2
178	Nuzvid	2
179	Omerkhan daira	2
180	Ongole	2
181	Osmania University	2
182	Pakala	2
183	Palakole	2
184	Palakurthi	2
185	Palasa	2
186	Palempalle	2
187	Palkonda	2
188	Palmaner	2
189	Pamur	2
190	Panjim	2
191	Papampeta	2
192	Parasamba	2
193	Parvatipuram	2
194	Patancheru	2
195	Payakaraopet	2
196	Pedagantyada	2
197	Pedana	2
198	Peddapuram	2
199	Pendurthi	2
200	Penugonda	2
201	Penukonda	2
202	Phirangipuram	2
203	Pithapuram	2
204	Ponnur	2
205	Port Blair	2
206	Pothinamallayyapalem	2
207	Prakasam	2
208	Prasadampadu	2
209	Prasantinilayam	2
210	Proddatur	2
211	Pulivendla	2
212	Punganuru	2
213	Puttur	2
214	Qutubullapur	2
215	Rajahmundry	2
216	Rajamahendri	2
217	Rajampet	2
218	Rajendranagar	2
219	Rajoli	2
220	Ramachandrapuram	2
221	Ramanayyapeta	2
222	Ramapuram	2
223	Ramarajupalli	2
224	Ramavarappadu	2
225	Rameswaram	2
226	Rampachodavaram	2
227	Ravulapalam	2
228	Rayachoti	2
229	Rayadrug	2
230	Razam	2
231	Razole	2
232	Renigunta	2
233	Repalle	2
234	Rishikonda	2
235	Salur	2
236	Samalkot	2
237	Sattenapalle	2
238	Seetharampuram	2
239	Serilungampalle	2
240	Shankarampet	2
241	Shar	2
242	Singarayakonda	2
243	Sirpur	2
244	Sirsilla	2
245	Sompeta	2
246	Sriharikota	2
247	Srikakulam	2
248	Srikalahasti	2
249	Sriramnagar	2
250	Sriramsagar	2
251	Srisailam	2
252	Srisailamgudem Devasthanam	2
253	Sulurpeta	2
254	Suriapet	2
255	Suryaraopet	2
256	Tadepalle	2
257	Tadepalligudem	2
258	Tadpatri	2
259	Tallapalle	2
260	Tanuku	2
261	Tekkali	2
262	Tenali	2
263	Tigalapahad	2
264	Tiruchanur	2
265	Tirumala	2
266	Tirupati	2
267	Tirvuru	2
268	Trimulgherry	2
269	Tuni	2
270	Turangi	2
271	Ukkayapalli	2
272	Ukkunagaram	2
273	Uppal Kalan	2
274	Upper Sileru	2
275	Uravakonda	2
276	Vadlapudi	2
277	Vaparala	2
278	Vemalwada	2
279	Venkatagiri	2
280	Venkatapuram	2
281	Vepagunta	2
282	Vetapalem	2
283	Vijayapuri	2
284	Vijayapuri South	2
285	Vijayawada	2
286	Vinukonda	2
287	Visakhapatnam	2
288	Vizianagaram	2
289	Vuyyuru	2
290	Wanparti	2
291	West Godavari Dist.	2
292	Yadagirigutta	2
293	Yarada	2
294	Yellamanchili	2
295	Yemmiganur	2
296	Yenamalakudru	2
297	Yendada	2
298	Yerraguntla	2
299	Along	3
300	Basar	3
301	Bondila	3
302	Changlang	3
303	Daporijo	3
304	Deomali	3
305	Itanagar	3
306	Jairampur	3
307	Khonsa	3
308	Naharlagun	3
309	Namsai	3
310	Pasighat	3
311	Roing	3
312	Seppa	3
313	Tawang	3
314	Tezu	3
315	Ziro	3
316	Abhayapuri	4
317	Ambikapur	4
318	Amguri	4
319	Anand Nagar	4
320	Badarpur	4
321	Badarpur Railway Town	4
322	Bahbari Gaon	4
323	Bamun Sualkuchi	4
324	Barbari	4
325	Barpathar	4
326	Barpeta	4
327	Barpeta Road	4
328	Basugaon	4
329	Bihpuria	4
330	Bijni	4
331	Bilasipara	4
332	Biswanath Chariali	4
333	Bohori	4
334	Bokajan	4
335	Bokokhat	4
336	Bongaigaon	4
337	Bongaigaon Petro-chemical Town	4
338	Borgolai	4
339	Chabua	4
340	Chandrapur Bagicha	4
341	Chapar	4
342	Chekonidhara	4
343	Choto Haibor	4
344	Dergaon	4
345	Dharapur	4
346	Dhekiajuli	4
347	Dhemaji	4
348	Dhing	4
349	Dhubri	4
350	Dhuburi	4
351	Dibrugarh	4
352	Digboi	4
353	Digboi Oil Town	4
354	Dimaruguri	4
355	Diphu	4
356	Dispur	4
357	Doboka	4
358	Dokmoka	4
359	Donkamokan	4
360	Duliagaon	4
361	Duliajan	4
362	Duliajan No.1	4
363	Dum Duma	4
364	Durga Nagar	4
365	Gauripur	4
366	Goalpara	4
367	Gohpur	4
368	Golaghat	4
369	Golakganj	4
370	Gossaigaon	4
371	Guwahati	4
372	Haflong	4
373	Hailakandi	4
374	Hamren	4
375	Hauli	4
376	Hauraghat	4
377	Hojai	4
378	Jagiroad	4
379	Jagiroad Paper Mill	4
380	Jogighopa	4
381	Jonai Bazar	4
382	Jorhat	4
383	Kampur Town	4
384	Kamrup	4
385	Kanakpur	4
386	Karimganj	4
387	Kharijapikon	4
388	Kharupetia	4
389	Kochpara	4
390	Kokrajhar	4
391	Kumar Kaibarta Gaon	4
392	Lakhimpur	4
393	Lakhipur	4
394	Lala	4
395	Lanka	4
396	Lido Tikok	4
397	Lido Town	4
398	Lumding	4
399	Lumding Railway Colony	4
400	Mahur	4
401	Maibong	4
402	Majgaon	4
403	Makum	4
404	Mangaldai	4
405	Mankachar	4
406	Margherita	4
407	Mariani	4
408	Marigaon	4
409	Moran	4
410	Moranhat	4
411	Nagaon	4
412	Naharkatia	4
413	Nalbari	4
414	Namrup	4
415	Naubaisa Gaon	4
416	Nazira	4
417	New Bongaigaon Railway Colony	4
418	Niz-Hajo	4
419	North Guwahati	4
420	Numaligarh	4
421	Palasbari	4
422	Panchgram	4
423	Pathsala	4
424	Raha	4
425	Rangapara	4
426	Rangia	4
427	Salakati	4
428	Sapatgram	4
429	Sarthebari	4
430	Sarupathar	4
431	Sarupathar Bengali	4
432	Senchoagaon	4
433	Sibsagar	4
434	Silapathar	4
435	Silchar	4
436	Silchar Part-X	4
437	Sonari	4
438	Sorbhog	4
439	Sualkuchi	4
440	Tangla	4
441	Tezpur	4
442	Tihu	4
443	Tinsukia	4
444	Titabor	4
445	Udalguri	4
446	Umrangso	4
447	Uttar Krishnapur Part-I	4
448	Amarpur	5
449	Ara	5
450	Araria	5
451	Areraj	5
452	Asarganj	5
453	Aurangabad	5
454	Bagaha	5
455	Bahadurganj	5
456	Bairgania	5
457	Bakhtiyarpur	5
458	Banka	5
459	Banmankhi	5
460	Bar Bigha	5
461	Barauli	5
462	Barauni Oil Township	5
463	Barh	5
464	Barhiya	5
465	Bariapur	5
466	Baruni	5
467	Begusarai	5
468	Behea	5
469	Belsand	5
470	Bettiah	5
471	Bhabua	5
472	Bhagalpur	5
473	Bhimnagar	5
474	Bhojpur	5
475	Bihar	5
476	Bihar Sharif	5
477	Bihariganj	5
478	Bikramganj	5
479	Birpur	5
480	Bodh Gaya	5
481	Buxar	5
482	Chakia	5
483	Chanpatia	5
484	Chhapra	5
485	Chhatapur	5
486	Colgong	5
487	Dalsingh Sarai	5
488	Darbhanga	5
489	Daudnagar	5
490	Dehri	5
491	Dhaka	5
492	Dighwara	5
493	Dinapur	5
494	Dinapur Cantonment	5
495	Dumra	5
496	Dumraon	5
497	Fatwa	5
498	Forbesganj	5
499	Gaya	5
500	Gazipur	5
501	Ghoghardiha	5
502	Gogri Jamalpur	5
503	Gopalganj	5
504	Habibpur	5
505	Hajipur	5
506	Hasanpur	5
507	Hazaribagh	5
508	Hilsa	5
509	Hisua	5
510	Islampur	5
511	Jagdispur	5
512	Jahanabad	5
513	Jamalpur	5
514	Jamhaur	5
515	Jamui	5
516	Janakpur Road	5
517	Janpur	5
518	Jaynagar	5
519	Jha Jha	5
520	Jhanjharpur	5
521	Jogbani	5
522	Kanti	5
523	Kasba	5
524	Kataiya	5
525	Katihar	5
526	Khagaria	5
527	Khagaul	5
528	Kharagpur	5
529	Khusrupur	5
530	Kishanganj	5
531	Koath	5
532	Koilwar	5
533	Lakhisarai	5
534	Lalganj	5
535	Lauthaha	5
536	Madhepura	5
537	Madhubani	5
538	Maharajganj	5
539	Mahnar Bazar	5
540	Mairwa	5
541	Makhdumpur	5
542	Maner	5
543	Manihari	5
544	Marhaura	5
545	Masaurhi	5
546	Mirganj	5
547	Mohiuddinagar	5
548	Mokama	5
549	Motihari	5
550	Motipur	5
551	Munger	5
552	Murliganj	5
553	Muzaffarpur	5
554	Nabinagar	5
555	Narkatiaganj	5
556	Nasriganj	5
557	Natwar	5
558	Naugachhia	5
559	Nawada	5
560	Nirmali	5
561	Nokha	5
562	Paharpur	5
563	Patna	5
564	Phulwari	5
565	Piro	5
566	Purnia	5
567	Pusa	5
568	Rafiganj	5
569	Raghunathpur	5
570	Rajgir	5
571	Ramnagar	5
572	Raxaul	5
573	Revelganj	5
574	Rusera	5
575	Sagauli	5
576	Saharsa	5
577	Samastipur	5
578	Sasaram	5
579	Shahpur	5
580	Shaikhpura	5
581	Sherghati	5
582	Shivhar	5
583	Silao	5
584	Sitamarhi	5
585	Siwan	5
586	Sonepur	5
587	Sultanganj	5
588	Supaul	5
589	Teghra	5
590	Tekari	5
591	Thakurganj	5
592	Vaishali	5
593	Waris Aliganj	5
594	Chandigarh	6
595	Ahiwara	7
596	Akaltara	7
597	Ambagarh Chauki	7
598	Ambikapur	7
599	Arang	7
600	Bade Bacheli	7
601	Bagbahara	7
602	Baikunthpur	7
603	Balod	7
604	Baloda	7
605	Baloda Bazar	7
606	Banarsi	7
607	Basna	7
608	Bemetra	7
609	Bhanpuri	7
610	Bhatapara	7
611	Bhatgaon	7
612	Bhilai	7
613	Bilaspur	7
614	Bilha	7
615	Birgaon	7
616	Bodri	7
617	Champa	7
618	Charcha	7
619	Charoda	7
620	Chhuikhadan	7
621	Chirmiri	7
622	Dantewada	7
623	Deori	7
624	Dhamdha	7
625	Dhamtari	7
626	Dharamjaigarh	7
627	Dipka	7
628	Doman Hill Colliery	7
629	Dongargaon	7
630	Dongragarh	7
631	Durg	7
632	Frezarpur	7
633	Gandai	7
634	Gariaband	7
635	Gaurela	7
636	Gelhapani	7
637	Gharghoda	7
638	Gidam	7
639	Gobra Nawapara	7
640	Gogaon	7
641	Hatkachora	7
642	Jagdalpur	7
643	Jamui	7
644	Jashpurnagar	7
645	Jhagrakhand	7
646	Kanker	7
647	Katghora	7
648	Kawardha	7
649	Khairagarh	7
650	Khamhria	7
651	Kharod	7
652	Kharsia	7
653	Khonga Pani	7
654	Kirandu	7
655	Kirandul	7
656	Kohka	7
657	Kondagaon	7
658	Korba	7
659	Korea	7
660	Koria Block	7
661	Kota	7
662	Kumhari	7
663	Kumud Katta	7
664	Kurasia	7
665	Kurud	7
666	Lingiyadih	7
667	Lormi	7
668	Mahasamund	7
669	Mahendragarh	7
670	Mehmand	7
671	Mongra	7
672	Mowa	7
673	Mungeli	7
674	Nailajanjgir	7
675	Namna Kalan	7
676	Naya Baradwar	7
677	Pandariya	7
678	Patan	7
679	Pathalgaon	7
680	Pendra	7
681	Phunderdihari	7
682	Pithora	7
683	Raigarh	7
684	Raipur	7
685	Rajgamar	7
686	Rajhara	7
687	Rajnandgaon	7
688	Ramanuj Ganj	7
689	Ratanpur	7
690	Sakti	7
691	Saraipali	7
692	Sarajpur	7
693	Sarangarh	7
694	Shivrinarayan	7
695	Simga	7
696	Sirgiti	7
697	Takhatpur	7
698	Telgaon	7
699	Tildanewra	7
700	Urla	7
701	Vishrampur	7
702	Amli	8
703	Silvassa	8
704	Daman	9
705	Diu	9
706	Delhi	10
707	New Delhi	10
708	Aldona	11
709	Altinho	11
710	Aquem	11
711	Arpora	11
712	Bambolim	11
713	Bandora	11
714	Bardez	11
715	Benaulim	11
716	Betora	11
717	Bicholim	11
718	Calapor	11
719	Candolim	11
720	Caranzalem	11
721	Carapur	11
722	Chicalim	11
723	Chimbel	11
724	Chinchinim	11
725	Colvale	11
726	Corlim	11
727	Cortalim	11
728	Cuncolim	11
729	Curchorem	11
730	Curti	11
731	Davorlim	11
732	Dona Paula	11
733	Goa	11
734	Guirim	11
735	Jua	11
736	Kalangat	11
737	Kankon	11
738	Kundaim	11
739	Loutulim	11
740	Madgaon	11
741	Mapusa	11
742	Margao	11
743	Margaon	11
744	Miramar	11
745	Morjim	11
746	Mormugao	11
747	Navelim	11
748	Pale	11
749	Panaji	11
750	Parcem	11
751	Parra	11
752	Penha de Franca	11
753	Pernem	11
754	Pilerne	11
755	Pissurlem	11
756	Ponda	11
757	Porvorim	11
758	Quepem	11
759	Queula	11
760	Raia	11
761	Reis Magos	11
762	Salcette	11
763	Saligao	11
764	Sancoale	11
765	Sanguem	11
766	Sanquelim	11
767	Sanvordem	11
768	Sao Jose-de-Areal	11
769	Sattari	11
770	Serula	11
771	Sinquerim	11
772	Siolim	11
773	Taleigao	11
774	Tivim	11
775	Valpoi	11
776	Varca	11
777	Vasco	11
778	Verna	11
779	Abrama	12
780	Adalaj	12
781	Adityana	12
782	Advana	12
783	Ahmedabad	12
784	Ahwa	12
785	Alang	12
786	Ambaji	12
787	Ambaliyasan	12
788	Amod	12
789	Amreli	12
790	Amroli	12
791	Anand	12
792	Andada	12
793	Anjar	12
794	Anklav	12
795	Ankleshwar	12
796	Anklesvar INA	12
797	Antaliya	12
798	Arambhada	12
799	Asarma	12
800	Atul	12
801	Babra	12
802	Bag-e-Firdosh	12
803	Bagasara	12
804	Bahadarpar	12
805	Bajipura	12
806	Bajva	12
807	Balasinor	12
808	Banaskantha	12
809	Bansda	12
810	Bantva	12
811	Bardoli	12
812	Barwala	12
813	Bayad	12
814	Bechar	12
815	Bedi	12
816	Beyt	12
817	Bhachau	12
818	Bhanvad	12
819	Bharuch	12
820	Bharuch INA	12
821	Bhavnagar	12
822	Bhayavadar	12
823	Bhestan	12
824	Bhuj	12
825	Bilimora	12
826	Bilkha	12
827	Billimora	12
828	Bodakdev	12
829	Bodeli	12
830	Bopal	12
831	Boria	12
832	Boriavi	12
833	Borsad	12
834	Botad	12
835	Cambay	12
836	Chaklasi	12
837	Chala	12
838	Chalala	12
839	Chalthan	12
840	Chanasma	12
841	Chandisar	12
842	Chandkheda	12
843	Chanod	12
844	Chaya	12
845	Chenpur	12
846	Chhapi	12
847	Chhaprabhatha	12
848	Chhatral	12
849	Chhota Udepur	12
850	Chikhli	12
851	Chiloda	12
852	Chorvad	12
853	Chotila	12
854	Dabhoi	12
855	Dadara	12
856	Dahod	12
857	Dakor	12
858	Damnagar	12
859	Deesa	12
860	Delvada	12
861	Devgadh Baria	12
862	Devsar	12
863	Dhandhuka	12
864	Dhanera	12
865	Dhangdhra	12
866	Dhansura	12
867	Dharampur	12
868	Dhari	12
869	Dhola	12
870	Dholka	12
871	Dholka Rural	12
872	Dhoraji	12
873	Dhrangadhra	12
874	Dhrol	12
875	Dhuva	12
876	Dhuwaran	12
877	Digvijaygram	12
878	Disa	12
879	Dungar	12
880	Dungarpur	12
881	Dungra	12
882	Dwarka	12
883	Flelanganj	12
884	GSFC Complex	12
885	Gadhda	12
886	Gandevi	12
887	Gandhidham	12
888	Gandhinagar	12
889	Gariadhar	12
890	Ghogha	12
891	Godhra	12
892	Gondal	12
893	Hajira INA	12
894	Halol	12
895	Halvad	12
896	Hansot	12
897	Harij	12
898	Himatnagar	12
899	Ichchhapor	12
900	Idar	12
901	Jafrabad	12
902	Jalalpore	12
903	Jambusar	12
904	Jamjodhpur	12
905	Jamnagar	12
906	Jasdan	12
907	Jawaharnagar	12
908	Jetalsar	12
909	Jetpur	12
910	Jodiya	12
911	Joshipura	12
912	Junagadh	12
913	Kadi	12
914	Kadodara	12
915	Kalavad	12
916	Kali	12
917	Kaliawadi	12
918	Kalol	12
919	Kalol INA	12
920	Kandla	12
921	Kanjari	12
922	Kanodar	12
923	Kapadwanj	12
924	Karachiya	12
925	Karamsad	12
926	Karjan	12
927	Kathial	12
928	Kathor	12
929	Katpar	12
930	Kavant	12
931	Keshod	12
932	Kevadiya	12
933	Khambhaliya	12
934	Khambhat	12
935	Kharaghoda	12
936	Khed Brahma	12
937	Kheda	12
938	Kheralu	12
939	Kodinar	12
940	Kosamba	12
941	Kundla	12
942	Kutch	12
943	Kutiyana	12
944	Lakhtar	12
945	Lalpur	12
946	Lambha	12
947	Lathi	12
948	Limbdi	12
949	Limla	12
950	Lunavada	12
951	Madhapar	12
952	Maflipur	12
953	Mahemdavad	12
954	Mahudha	12
955	Mahuva	12
956	Mahuvar	12
957	Makarba	12
958	Makarpura	12
959	Makassar	12
960	Maktampur	12
961	Malia	12
962	Malpur	12
963	Manavadar	12
964	Mandal	12
965	Mandvi	12
966	Mangrol	12
967	Mansa	12
968	Meghraj	12
969	Mehsana	12
970	Mendarla	12
971	Mithapur	12
972	Modasa	12
973	Mogravadi	12
974	Morbi	12
975	Morvi	12
976	Mundra	12
977	Nadiad	12
978	Naliya	12
979	Nanakvada	12
980	Nandej	12
981	Nandesari	12
982	Nandesari INA	12
983	Naroda	12
984	Navagadh	12
985	Navagam Ghed	12
986	Navsari	12
987	Ode	12
988	Okaf	12
989	Okha	12
990	Olpad	12
991	Paddhari	12
992	Padra	12
993	Palanpur	12
994	Palej	12
995	Pali	12
996	Palitana	12
997	Paliyad	12
998	Pandesara	12
999	Panoli	12
1000	Pardi	12
1001	Parnera	12
1002	Parvat	12
1003	Patan	12
1004	Patdi	12
1005	Petlad	12
1006	Petrochemical Complex	12
1007	Porbandar	12
1008	Prantij	12
1009	Radhanpur	12
1010	Raiya	12
1011	Rajkot	12
1012	Rajpipla	12
1013	Rajula	12
1014	Ramod	12
1015	Ranavav	12
1016	Ranoli	12
1017	Rapar	12
1018	Sahij	12
1019	Salaya	12
1020	Sanand	12
1021	Sankheda	12
1022	Santrampur	12
1023	Saribujrang	12
1024	Sarigam INA	12
1025	Sayan	12
1026	Sayla	12
1027	Shahpur	12
1028	Shahwadi	12
1029	Shapar	12
1030	Shivrajpur	12
1031	Siddhapur	12
1032	Sidhpur	12
1033	Sihor	12
1034	Sika	12
1035	Singarva	12
1036	Sinor	12
1037	Sojitra	12
1038	Sola	12
1039	Songadh	12
1040	Suraj Karadi	12
1041	Surat	12
1042	Surendranagar	12
1043	Talaja	12
1044	Talala	12
1045	Talod	12
1046	Tankara	12
1047	Tarsali	12
1048	Thangadh	12
1049	Tharad	12
1050	Thasra	12
1051	Udyognagar	12
1052	Ukai	12
1053	Umbergaon	12
1054	Umbergaon INA	12
1055	Umrala	12
1056	Umreth	12
1057	Un	12
1058	Una	12
1059	Unjha	12
1060	Upleta	12
1061	Utran	12
1062	Uttarsanda	12
1063	V.U. Nagar	12
1064	V.V. Nagar	12
1065	Vadia	12
1066	Vadla	12
1067	Vadnagar	12
1068	Vadodara	12
1069	Vaghodia INA	12
1070	Valbhipur	12
1071	Vallabh Vidyanagar	12
1072	Valsad	12
1073	Valsad INA	12
1074	Vanthali	12
1075	Vapi	12
1076	Vapi INA	12
1077	Vartej	12
1078	Vasad	12
1079	Vasna Borsad INA	12
1080	Vaso	12
1081	Veraval	12
1082	Vidyanagar	12
1083	Vijalpor	12
1084	Vijapur	12
1085	Vinchhiya	12
1086	Vinzol	12
1087	Virpur	12
1088	Visavadar	12
1089	Visnagar	12
1090	Vyara	12
1091	Wadhwan	12
1092	Waghai	12
1093	Waghodia	12
1094	Wankaner	12
1095	Zalod	12
1096	Ambala	13
1097	Ambala Cantt	13
1098	Asan Khurd	13
1099	Asandh	13
1100	Ateli	13
1101	Babiyal	13
1102	Bahadurgarh	13
1103	Ballabgarh	13
1104	Barwala	13
1105	Bawal	13
1106	Bawani Khera	13
1107	Beri	13
1108	Bhiwani	13
1109	Bilaspur	13
1110	Buria	13
1111	Charkhi Dadri	13
1112	Chhachhrauli	13
1113	Chita	13
1114	Dabwali	13
1115	Dharuhera	13
1116	Dundahera	13
1117	Ellenabad	13
1118	Farakhpur	13
1119	Faridabad	13
1120	Farrukhnagar	13
1121	Fatehabad	13
1122	Firozpur Jhirka	13
1123	Gannaur	13
1124	Ghraunda	13
1125	Gohana	13
1126	Gurgaon	13
1127	Haileymandi	13
1128	Hansi	13
1129	Hasanpur	13
1130	Hathin	13
1131	Hisar	13
1132	Hissar	13
1133	Hodal	13
1134	Indri	13
1135	Jagadhri	13
1136	Jakhal Mandi	13
1137	Jhajjar	13
1138	Jind	13
1139	Julana	13
1140	Kaithal	13
1141	Kalanur	13
1142	Kalanwali	13
1143	Kalayat	13
1144	Kalka	13
1145	Kanina	13
1146	Kansepur	13
1147	Kardhan	13
1148	Karnal	13
1149	Kharkhoda	13
1150	Kheri Sampla	13
1151	Kundli	13
1152	Kurukshetra	13
1153	Ladrawan	13
1154	Ladwa	13
1155	Loharu	13
1156	Maham	13
1157	Mahendragarh	13
1158	Mustafabad	13
1159	Nagai Chaudhry	13
1160	Narayangarh	13
1161	Narnaul	13
1162	Narnaund	13
1163	Narwana	13
1164	Nilokheri	13
1165	Nuh	13
1166	Palwal	13
1167	Panchkula	13
1168	Panipat	13
1169	Panipat Taraf Ansar	13
1170	Panipat Taraf Makhdum Zadgan	13
1171	Panipat Taraf Rajputan	13
1172	Pehowa	13
1173	Pinjaur	13
1174	Punahana	13
1175	Pundri	13
1176	Radaur	13
1177	Raipur Rani	13
1178	Rania	13
1179	Ratiya	13
1180	Rewari	13
1181	Rohtak	13
1182	Ropar	13
1183	Sadauri	13
1184	Safidon	13
1185	Samalkha	13
1186	Sankhol	13
1187	Sasauli	13
1188	Shahabad	13
1189	Sirsa	13
1190	Siwani	13
1191	Sohna	13
1192	Sonipat	13
1193	Sukhrali	13
1194	Taoru	13
1195	Taraori	13
1196	Tauru	13
1197	Thanesar	13
1198	Tilpat	13
1199	Tohana	13
1200	Tosham	13
1201	Uchana	13
1202	Uklana Mandi	13
1203	Uncha Siwana	13
1204	Yamunanagar	13
1205	Arki	14
1206	Baddi	14
1207	Bakloh	14
1208	Banjar	14
1209	Bhota	14
1210	Bhuntar	14
1211	Bilaspur	14
1212	Chamba	14
1213	Chaupal	14
1214	Chuari Khas	14
1215	Dagshai	14
1216	Dalhousie	14
1217	Dalhousie Cantonment	14
1218	Damtal	14
1219	Daulatpur	14
1220	Dera Gopipur	14
1221	Dhalli	14
1222	Dharamshala	14
1223	Gagret	14
1224	Ghamarwin	14
1225	Hamirpur	14
1226	Jawala Mukhi	14
1227	Jogindarnagar	14
1228	Jubbal	14
1229	Jutogh	14
1230	Kala Amb	14
1231	Kalpa	14
1232	Kangra	14
1233	Kasauli	14
1234	Kot Khai	14
1235	Kullu	14
1236	Kulu	14
1237	Manali	14
1238	Mandi	14
1239	Mant Khas	14
1240	Mehatpur Basdehra	14
1241	Nadaun	14
1242	Nagrota	14
1243	Nahan	14
1244	Naina Devi	14
1245	Nalagarh	14
1246	Narkanda	14
1247	Nurpur	14
1248	Palampur	14
1249	Pandoh	14
1250	Paonta Sahib	14
1251	Parwanoo	14
1252	Parwanu	14
1253	Rajgarh	14
1254	Rampur	14
1255	Rawalsar	14
1256	Rohru	14
1257	Sabathu	14
1258	Santokhgarh	14
1259	Sarahan	14
1260	Sarka Ghat	14
1261	Seoni	14
1262	Shimla	14
1263	Sirmaur	14
1264	Solan	14
1265	Solon	14
1266	Sundarnagar	14
1267	Sundernagar	14
1268	Talai	14
1269	Theog	14
1270	Tira Sujanpur	14
1271	Una	14
1272	Yol	14
1273	Achabal	15
1274	Akhnur	15
1275	Anantnag	15
1276	Arnia	15
1277	Awantipora	15
1278	Badami Bagh	15
1279	Bandipur	15
1280	Banihal	15
1281	Baramula	15
1282	Baramulla	15
1283	Bari Brahmana	15
1284	Bashohli	15
1285	Batote	15
1286	Bhaderwah	15
1287	Bijbiara	15
1288	Billawar	15
1289	Birwah	15
1290	Bishna	15
1291	Budgam	15
1292	Charari Sharief	15
1293	Chenani	15
1294	Doda	15
1295	Duru-Verinag	15
1296	Gandarbat	15
1297	Gho Manhasan	15
1298	Gorah Salathian	15
1299	Gulmarg	15
1300	Hajan	15
1301	Handwara	15
1302	Hiranagar	15
1303	Jammu	15
1304	Jammu Cantonment	15
1305	Jammu Tawi	15
1306	Jourian	15
1307	Kargil	15
1308	Kathua	15
1309	Katra	15
1310	Khan Sahib	15
1311	Khour	15
1312	Khrew	15
1313	Kishtwar	15
1314	Kud	15
1315	Kukernag	15
1316	Kulgam	15
1317	Kunzer	15
1318	Kupwara	15
1319	Lakhenpur	15
1320	Leh	15
1321	Magam	15
1322	Mattan	15
1323	Naushehra	15
1324	Pahalgam	15
1325	Pampore	15
1326	Parole	15
1327	Pattan	15
1328	Pulwama	15
1329	Punch	15
1330	Qazigund	15
1331	Rajauri	15
1332	Ramban	15
1333	Ramgarh	15
1334	Ramnagar	15
1335	Ranbirsingh Pora	15
1336	Reasi	15
1337	Rehambal	15
1338	Samba	15
1339	Shupiyan	15
1340	Sopur	15
1341	Srinagar	15
1342	Sumbal	15
1343	Sunderbani	15
1344	Talwara	15
1345	Thanamandi	15
1346	Tral	15
1347	Udhampur	15
1348	Uri	15
1349	Vijaypur	15
1350	Adityapur	16
1351	Amlabad	16
1352	Angarpathar	16
1353	Ara	16
1354	Babua Kalan	16
1355	Bagbahra	16
1356	Baliapur	16
1357	Baliari	16
1358	Balkundra	16
1359	Bandhgora	16
1360	Barajamda	16
1361	Barhi	16
1362	Barka Kana	16
1363	Barki Saraiya	16
1364	Barughutu	16
1365	Barwadih	16
1366	Basaria	16
1367	Basukinath	16
1368	Bermo	16
1369	Bhagatdih	16
1370	Bhaurah	16
1371	Bhojudih	16
1372	Bhuli	16
1373	Bokaro	16
1374	Borio Bazar	16
1375	Bundu	16
1376	Chaibasa	16
1377	Chaitudih	16
1378	Chakradharpur	16
1379	Chakulia	16
1380	Chandaur	16
1381	Chandil	16
1382	Chandrapura	16
1383	Chas	16
1384	Chatra	16
1385	Chhatatanr	16
1386	Chhotaputki	16
1387	Chiria	16
1388	Chirkunda	16
1389	Churi	16
1390	Daltenganj	16
1391	Danguwapasi	16
1392	Dari	16
1393	Deoghar	16
1394	Deorikalan	16
1395	Devghar	16
1396	Dhanbad	16
1397	Dhanwar	16
1398	Dhaunsar	16
1399	Dugda	16
1400	Dumarkunda	16
1401	Dumka	16
1402	Egarkunr	16
1403	Gadhra	16
1404	Garwa	16
1405	Ghatsila	16
1406	Ghorabandha	16
1407	Gidi	16
1408	Giridih	16
1409	Gobindpur	16
1410	Godda	16
1411	Godhar	16
1412	Golphalbari	16
1413	Gomoh	16
1414	Gua	16
1415	Gumia	16
1416	Gumla	16
1417	Haludbani	16
1418	Hazaribag	16
1419	Hesla	16
1420	Husainabad	16
1421	Isri	16
1422	Jadugora	16
1423	Jagannathpur	16
1424	Jamadoba	16
1425	Jamshedpur	16
1426	Jamtara	16
1427	Jarangdih	16
1428	Jaridih	16
1429	Jasidih	16
1430	Jena	16
1431	Jharia	16
1432	Jharia Khas	16
1433	Jhinkpani	16
1434	Jhumri Tilaiya	16
1435	Jorapokhar	16
1436	Jugsalai	16
1437	Kailudih	16
1438	Kalikapur	16
1439	Kandra	16
1440	Kanke	16
1441	Katras	16
1442	Kedla	16
1443	Kenduadih	16
1444	Kharkhari	16
1445	Kharsawan	16
1446	Khelari	16
1447	Khunti	16
1448	Kiri Buru	16
1449	Kiriburu	16
1450	Kodarma	16
1451	Kuju	16
1452	Kurpania	16
1453	Kustai	16
1454	Lakarka	16
1455	Lapanga	16
1456	Latehar	16
1457	Lohardaga	16
1458	Loiya	16
1459	Loyabad	16
1460	Madhupur	16
1461	Mahesh Mundi	16
1462	Maithon	16
1463	Malkera	16
1464	Mango	16
1465	Manoharpur	16
1466	Marma	16
1467	Meghahatuburu Forest village	16
1468	Mera	16
1469	Meru	16
1470	Mihijam	16
1471	Mugma	16
1472	Muri	16
1473	Mushabani	16
1474	Nagri Kalan	16
1475	Netarhat	16
1476	Nirsa	16
1477	Noamundi	16
1478	Okni	16
1479	Orla	16
1480	Pakaur	16
1481	Palamau	16
1482	Palawa	16
1483	Panchet	16
1484	Panrra	16
1485	Paratdih	16
1486	Pathardih	16
1487	Patratu	16
1488	Phusro	16
1489	Pondar Kanali	16
1490	Rajmahal	16
1491	Ramgarh	16
1492	Ranchi	16
1493	Ray	16
1494	Rehla	16
1495	Religara	16
1496	Rohraband	16
1497	Sahibganj	16
1498	Sahnidih	16
1499	Saraidhela	16
1500	Saraikela	16
1501	Sarjamda	16
1502	Saunda	16
1503	Sewai	16
1504	Sijhua	16
1505	Sijua	16
1506	Simdega	16
1507	Sindari	16
1508	Sinduria	16
1509	Sini	16
1510	Sirka	16
1511	Siuliban	16
1512	Surubera	16
1513	Tati	16
1514	Tenudam	16
1515	Tisra	16
1516	Topa	16
1517	Topchanchi	16
1518	Adityanagar	17
1519	Adityapatna	17
1520	Afzalpur	17
1521	Ajjampur	17
1522	Aland	17
1523	Almatti Sitimani	17
1524	Alnavar	17
1525	Alur	17
1526	Ambikanagara	17
1527	Anekal	17
1528	Ankola	17
1529	Annigeri	17
1530	Arkalgud	17
1531	Arsikere	17
1532	Athni	17
1533	Aurad	17
1534	Badagavettu	17
1535	Badami	17
1536	Bagalkot	17
1537	Bagepalli	17
1538	Bailhongal	17
1539	Baindur	17
1540	Bajala	17
1541	Bajpe	17
1542	Banavar	17
1543	Bangarapet	17
1544	Bankapura	17
1545	Bannur	17
1546	Bantwal	17
1547	Basavakalyan	17
1548	Basavana Bagevadi	17
1549	Belagula	17
1550	Belakavadiq	17
1551	Belgaum	17
1552	Belgaum Cantonment	17
1553	Bellary	17
1554	Belluru	17
1555	Beltangadi	17
1556	Belur	17
1557	Belvata	17
1558	Bengaluru	17
1559	Bhadravati	17
1560	Bhalki	17
1561	Bhatkal	17
1562	Bhimarayanagudi	17
1563	Bhogadi	17
1564	Bidar	17
1565	Bijapur	17
1566	Bilgi	17
1567	Birur	17
1568	Bommanahalli	17
1569	Bommasandra	17
1570	Byadgi	17
1571	Byatarayanapura	17
1572	Chakranagar Colony	17
1573	Challakere	17
1574	Chamrajnagar	17
1575	Chamundi Betta	17
1576	Channagiri	17
1577	Channapatna	17
1578	Channarayapatna	17
1579	Chickballapur	17
1580	Chik Ballapur	17
1581	Chikkaballapur	17
1582	Chikmagalur	17
1583	Chiknayakanhalli	17
1584	Chikodi	17
1585	Chincholi	17
1586	Chintamani	17
1587	Chitaguppa	17
1588	Chitapur	17
1589	Chitradurga	17
1590	Coorg	17
1591	Dandeli	17
1592	Dargajogihalli	17
1593	Dasarahalli	17
1594	Davangere	17
1595	Devadurga	17
1596	Devagiri	17
1597	Devanhalli	17
1598	Dharwar	17
1599	Dhupdal	17
1600	Dod Ballapur	17
1601	Donimalai	17
1602	Gadag	17
1603	Gajendragarh	17
1604	Ganeshgudi	17
1605	Gangawati	17
1606	Gangoli	17
1607	Gauribidanur	17
1608	Gokak	17
1609	Gokak Falls	17
1610	Gonikoppal	17
1611	Gorur	17
1612	Gottikere	17
1613	Gubbi	17
1614	Gudibanda	17
1615	Gulbarga	17
1616	Guledgudda	17
1617	Gundlupet	17
1618	Gurmatkal	17
1619	Haliyal	17
1620	Hangal	17
1621	Harihar	17
1622	Harpanahalli	17
1623	Hassan	17
1624	Hatti	17
1625	Hatti Gold Mines	17
1626	Haveri	17
1627	Hebbagodi	17
1628	Hebbalu	17
1629	Hebri	17
1630	Heggadadevanakote	17
1631	Herohalli	17
1632	Hidkal	17
1633	Hindalgi	17
1634	Hirekerur	17
1635	Hiriyur	17
1636	Holalkere	17
1637	Hole Narsipur	17
1638	Homnabad	17
1639	Honavar	17
1640	Honnali	17
1641	Hosakote	17
1642	Hosanagara	17
1643	Hosangadi	17
1644	Hosdurga	17
1645	Hoskote	17
1646	Hospet	17
1647	Hubli	17
1648	Hukeri	17
1649	Hunasagi	17
1650	Hunasamaranahalli	17
1651	Hungund	17
1652	Hunsur	17
1653	Huvina Hadagalli	17
1654	Ilkal	17
1655	Indi	17
1656	Jagalur	17
1657	Jamkhandi	17
1658	Jevargi	17
1659	Jog Falls	17
1660	Kabini Colony	17
1661	Kadur	17
1662	Kalghatgi	17
1663	Kamalapuram	17
1664	Kampli	17
1665	Kanakapura	17
1666	Kangrali BK	17
1667	Kangrali KH	17
1668	Kannur	17
1669	Karkala	17
1670	Karwar	17
1671	Kemminja	17
1672	Kengeri	17
1673	Kerur	17
1674	Khanapur	17
1675	Kodigenahalli	17
1676	Kodiyal	17
1677	Kodlipet	17
1678	Kolar	17
1679	Kollegal	17
1680	Konanakunte	17
1681	Konanur	17
1682	Konnur	17
1683	Koppa	17
1684	Koppal	17
1685	Koratagere	17
1686	Kotekara	17
1687	Kothnur	17
1688	Kotturu	17
1689	Krishnapura	17
1690	Krishnarajanagar	17
1691	Krishnarajapura	17
1692	Krishnarajasagara	17
1693	Krishnarajpet	17
1694	Kudchi	17
1695	Kudligi	17
1696	Kudremukh	17
1697	Kumsi	17
1698	Kumta	17
1699	Kundapura	17
1700	Kundgol	17
1701	Kunigal	17
1702	Kurgunta	17
1703	Kushalnagar	17
1704	Kushtagi	17
1705	Kyathanahalli	17
1706	Lakshmeshwar	17
1707	Lingsugur	17
1708	Londa	17
1709	Maddur	17
1710	Madhugiri	17
1711	Madikeri	17
1712	Magadi	17
1713	Magod Falls	17
1714	Mahadeswara Hills	17
1715	Mahadevapura	17
1716	Mahalingpur	17
1717	Maisuru	17
1718	Maisuru Cantonment	17
1719	Malavalli	17
1720	Mallar	17
1721	Malpe	17
1722	Malur	17
1723	Manchenahalli	17
1724	Mandya	17
1725	Mangalore	17
1726	Mangaluru	17
1727	Manipal	17
1728	Manvi	17
1729	Maski	17
1730	Mastikatte Colony	17
1731	Mayakonda	17
1732	Melukote	17
1733	Molakalmuru	17
1734	Mudalgi	17
1735	Mudbidri	17
1736	Muddebihal	17
1737	Mudgal	17
1738	Mudhol	17
1739	Mudigere	17
1740	Mudushedde	17
1741	Mulbagal	17
1742	Mulgund	17
1743	Mulki	17
1744	Mulur	17
1745	Mundargi	17
1746	Mundgod	17
1747	Munirabad	17
1748	Munnur	17
1749	Murudeshwara	17
1750	Mysore	17
1751	Nagamangala	17
1752	Nanjangud	17
1753	Naragund	17
1754	Narasimharajapura	17
1755	Naravi	17
1756	Narayanpur	17
1757	Naregal	17
1758	Navalgund	17
1759	Nelmangala	17
1760	Nipani	17
1761	Nitte	17
1762	Nyamati	17
1763	Padu	17
1764	Pandavapura	17
1765	Pattanagere	17
1766	Pavagada	17
1767	Piriyapatna	17
1768	Ponnampet	17
1769	Puttur	17
1770	Rabkavi	17
1771	Raichur	17
1772	Ramanagaram	17
1773	Ramdurg	17
1774	Ranibennur	17
1775	Raybag	17
1776	Robertsonpet	17
1777	Ron	17
1778	Sadalgi	17
1779	Sagar	17
1780	Sakleshpur	17
1781	Saligram	17
1782	Sandur	17
1783	Sanivarsante	17
1784	Sankeshwar	17
1785	Sargur	17
1786	Sathyamangala	17
1787	Saundatti Yellamma	17
1788	Savanur	17
1789	Sedam	17
1790	Shahabad	17
1791	Shahabad A.C.C.	17
1792	Shahapur	17
1793	Shahpur	17
1794	Shaktinagar	17
1795	Shiggaon	17
1796	Shikarpur	17
1797	Shimoga	17
1798	Shirhatti	17
1799	Shorapur	17
1800	Shravanabelagola	17
1801	Shrirangapattana	17
1802	Siddapur	17
1803	Sidlaghatta	17
1804	Sindgi	17
1805	Sindhnur	17
1806	Sira	17
1807	Sirakoppa	17
1808	Sirsi	17
1809	Siruguppa	17
1810	Someshwar	17
1811	Somvarpet	17
1812	Sorab	17
1813	Sringeri	17
1814	Srinivaspur	17
1815	Sulya	17
1816	Suntikopa	17
1817	Talikota	17
1818	Tarikera	17
1819	Tekkalakota	17
1820	Terdal	17
1821	Thokur	17
1822	Thumbe	17
1823	Tiptur	17
1824	Tirthahalli	17
1825	Tirumakudal Narsipur	17
1826	Tonse	17
1827	Tumkur	17
1828	Turuvekere	17
1829	Udupi	17
1830	Ullal	17
1831	Uttarahalli	17
1832	Venkatapura	17
1833	Vijayapura	17
1834	Virarajendrapet	17
1835	Wadi	17
1836	Wadi A.C.C.	17
1837	Yadgir	17
1838	Yelahanka	17
1839	Yelandur	17
1840	Yelbarga	17
1841	Yellapur	17
1842	Yenagudde	17
1843	Adimaly	19
1844	Adoor	19
1845	Adur	19
1846	Akathiyur	19
1847	Alangad	19
1848	Alappuzha	19
1849	Aluva	19
1850	Ancharakandy	19
1851	Angamaly	19
1852	Aroor	19
1853	Arukutti	19
1854	Attingal	19
1855	Avinissery	19
1856	Azhikode North	19
1857	Azhikode South	19
1858	Azhiyur	19
1859	Balussery	19
1860	Bangramanjeshwar	19
1861	Beypur	19
1862	Brahmakulam	19
1863	Chala	19
1864	Chalakudi	19
1865	Changanacheri	19
1866	Chauwara	19
1867	Chavakkad	19
1868	Chelakkara	19
1869	Chelora	19
1870	Chendamangalam	19
1871	Chengamanad	19
1872	Chengannur	19
1873	Cheranallur	19
1874	Cheriyakadavu	19
1875	Cherthala	19
1876	Cherukunnu	19
1877	Cheruthazham	19
1878	Cheruvannur	19
1879	Cheruvattur	19
1880	Chevvur	19
1881	Chirakkal	19
1882	Chittur	19
1883	Chockli	19
1884	Churnikkara	19
1885	Dharmadam	19
1886	Edappal	19
1887	Edathala	19
1888	Elayavur	19
1889	Elur	19
1890	Eranholi	19
1891	Erattupetta	19
1892	Ernakulam	19
1893	Eruvatti	19
1894	Ettumanoor	19
1895	Feroke	19
1896	Guruvayur	19
1897	Haripad	19
1898	Hosabettu	19
1899	Idukki	19
1900	Iringaprom	19
1901	Irinjalakuda	19
1902	Iriveri	19
1903	Kadachira	19
1904	Kadalundi	19
1905	Kadamakkudy	19
1906	Kadirur	19
1907	Kadungallur	19
1908	Kakkodi	19
1909	Kalady	19
1910	Kalamassery	19
1911	Kalliasseri	19
1912	Kalpetta	19
1913	Kanhangad	19
1914	Kanhirode	19
1915	Kanjikkuzhi	19
1916	Kanjikode	19
1917	Kanjirappalli	19
1918	Kannadiparamba	19
1919	Kannangad	19
1920	Kannapuram	19
1921	Kannur	19
1922	Kannur Cantonment	19
1923	Karunagappally	19
1924	Karuvamyhuruthy	19
1925	Kasaragod	19
1926	Kasargod	19
1927	Kattappana	19
1928	Kayamkulam	19
1929	Kedamangalam	19
1930	Kochi	19
1931	Kodamthuruthu	19
1932	Kodungallur	19
1933	Koduvally	19
1934	Koduvayur	19
1935	Kokkothamangalam	19
1936	Kolazhy	19
1937	Kollam	19
1938	Komalapuram	19
1939	Koothattukulam	19
1940	Koratty	19
1941	Kothamangalam	19
1942	Kottarakkara	19
1943	Kottayam	19
1944	Kottayam Malabar	19
1945	Kottuvally	19
1946	Koyilandi	19
1947	Kozhikode	19
1948	Kudappanakunnu	19
1949	Kudlu	19
1950	Kumarakom	19
1951	Kumily	19
1952	Kunnamangalam	19
1953	Kunnamkulam	19
1954	Kurikkad	19
1955	Kurkkanchery	19
1956	Kuthuparamba	19
1957	Kuttakulam	19
1958	Kuttikkattur	19
1959	Kuttur	19
1960	Malappuram	19
1961	Mallappally	19
1962	Manjeri	19
1963	Manjeshwar	19
1964	Mannancherry	19
1965	Mannar	19
1966	Mannarakkat	19
1967	Maradu	19
1968	Marathakkara	19
1969	Marutharod	19
1970	Mattannur	19
1971	Mavelikara	19
1972	Mavilayi	19
1973	Mavur	19
1974	Methala	19
1975	Muhamma	19
1976	Mulavukad	19
1977	Mundakayam	19
1978	Munderi	19
1979	Munnar	19
1980	Muthakunnam	19
1981	Muvattupuzha	19
1982	Muzhappilangad	19
1983	Nadapuram	19
1984	Nadathara	19
1985	Narath	19
1986	Nattakam	19
1987	Nedumangad	19
1988	Nenmenikkara	19
1989	New Mahe	19
1990	Neyyattinkara	19
1991	Nileshwar	19
1992	Olavanna	19
1993	Ottapalam	19
1994	Ottappalam	19
1995	Paduvilayi	19
1996	Palai	19
1997	Palakkad	19
1998	Palayad	19
1999	Palissery	19
2000	Pallikkunnu	19
2001	Paluvai	19
2002	Panniyannur	19
2003	Pantalam	19
2004	Panthiramkavu	19
2005	Panur	19
2006	Pappinisseri	19
2007	Parassala	19
2008	Paravur	19
2009	Pathanamthitta	19
2010	Pathanapuram	19
2011	Pathiriyad	19
2012	Pattambi	19
2013	Pattiom	19
2014	Pavaratty	19
2015	Payyannur	19
2016	Peermade	19
2017	Perakam	19
2018	Peralasseri	19
2019	Peringathur	19
2020	Perinthalmanna	19
2021	Perole	19
2022	Perumanna	19
2023	Perumbaikadu	19
2024	Perumbavoor	19
2025	Pinarayi	19
2026	Piravam	19
2027	Ponnani	19
2028	Pottore	19
2029	Pudukad	19
2030	Punalur	19
2031	Puranattukara	19
2032	Puthunagaram	19
2033	Puthuppariyaram	19
2034	Puzhathi	19
2035	Ramanattukara	19
2036	Shoranur	19
2037	Sultans Battery	19
2038	Sulthan Bathery	19
2039	Talipparamba	19
2040	Thaikkad	19
2041	Thalassery	19
2042	Thannirmukkam	19
2043	Theyyalingal	19
2044	Thiruvalla	19
2045	Thiruvananthapuram	19
2046	Thiruvankulam	19
2047	Thodupuzha	19
2048	Thottada	19
2049	Thrippunithura	19
2050	Thrissur	19
2051	Tirur	19
2052	Udma	19
2053	Vadakara	19
2054	Vaikam	19
2055	Valapattam	19
2056	Vallachira	19
2057	Varam	19
2058	Varappuzha	19
2059	Varkala	19
2060	Vayalar	19
2061	Vazhakkala	19
2062	Venmanad	19
2063	Villiappally	19
2064	Wayanad	19
2065	Agethi	20
2066	Amini	20
2067	Androth Island	20
2068	Kavaratti	20
2069	Minicoy	20
2070	Agar	21
2071	Ajaigarh	21
2072	Akoda	21
2073	Akodia	21
2074	Alampur	21
2075	Alirajpur	21
2076	Alot	21
2077	Amanganj	21
2078	Amarkantak	21
2079	Amarpatan	21
2080	Amarwara	21
2081	Ambada	21
2082	Ambah	21
2083	Amla	21
2084	Amlai	21
2085	Anjad	21
2086	Antri	21
2087	Anuppur	21
2088	Aron	21
2089	Ashoknagar	21
2090	Ashta	21
2091	Babai	21
2092	Bada Malhera	21
2093	Badagaon	21
2094	Badagoan	21
2095	Badarwas	21
2096	Badawada	21
2097	Badi	21
2098	Badkuhi	21
2099	Badnagar	21
2100	Badnawar	21
2101	Badod	21
2102	Badoda	21
2103	Badra	21
2104	Bagh	21
2105	Bagli	21
2106	Baihar	21
2107	Baikunthpur	21
2108	Bakswaha	21
2109	Balaghat	21
2110	Baldeogarh	21
2111	Bamaniya	21
2112	Bamhani	21
2113	Bamor	21
2114	Bamora	21
2115	Banda	21
2116	Bangawan	21
2117	Bansatar Kheda	21
2118	Baraily	21
2119	Barela	21
2120	Barghat	21
2121	Bargi	21
2122	Barhi	21
2123	Barigarh	21
2124	Barwaha	21
2125	Barwani	21
2126	Basoda	21
2127	Begamganj	21
2128	Beohari	21
2129	Berasia	21
2130	Betma	21
2131	Betul	21
2132	Betul Bazar	21
2133	Bhainsdehi	21
2134	Bhamodi	21
2135	Bhander	21
2136	Bhanpura	21
2137	Bharveli	21
2138	Bhaurasa	21
2139	Bhavra	21
2140	Bhedaghat	21
2141	Bhikangaon	21
2142	Bhilakhedi	21
2143	Bhind	21
2144	Bhitarwar	21
2145	Bhopal	21
2146	Bhuibandh	21
2147	Biaora	21
2148	Bijawar	21
2149	Bijeypur	21
2150	Bijrauni	21
2151	Bijuri	21
2152	Bilaua	21
2153	Bilpura	21
2154	Bina Railway Colony	21
2155	Bina-Etawa	21
2156	Birsinghpur	21
2157	Boda	21
2158	Budhni	21
2159	Burhanpur	21
2160	Burhar	21
2161	Chachaura Binaganj	21
2162	Chakghat	21
2163	Chandameta Butar	21
2164	Chanderi	21
2165	Chandia	21
2166	Chandla	21
2167	Chaurai Khas	21
2168	Chhatarpur	21
2169	Chhindwara	21
2170	Chhota Chhindwara	21
2171	Chichli	21
2172	Chitrakut	21
2173	Churhat	21
2174	Daboh	21
2175	Dabra	21
2176	Damoh	21
2177	Damua	21
2178	Datia	21
2179	Deodara	21
2180	Deori	21
2181	Deori Khas	21
2182	Depalpur	21
2183	Devendranagar	21
2184	Devhara	21
2185	Dewas	21
2186	Dhamnod	21
2187	Dhana	21
2188	Dhanpuri	21
2189	Dhar	21
2190	Dharampuri	21
2191	Dighawani	21
2192	Diken	21
2193	Dindori	21
2194	Dola	21
2195	Dumar Kachhar	21
2196	Dungariya Chhapara	21
2197	Gadarwara	21
2198	Gairatganj	21
2199	Gandhi Sagar Hydel Colony	21
2200	Ganjbasoda	21
2201	Garhakota	21
2202	Garhi Malhara	21
2203	Garoth	21
2204	Gautapura	21
2205	Ghansor	21
2206	Ghuwara	21
2207	Gogaon	21
2208	Gogapur	21
2209	Gohad	21
2210	Gormi	21
2211	Govindgarh	21
2212	Guna	21
2213	Gurh	21
2214	Gwalior	21
2215	Hanumana	21
2216	Harda	21
2217	Harpalpur	21
2218	Harrai	21
2219	Harsud	21
2220	Hatod	21
2221	Hatpipalya	21
2222	Hatta	21
2223	Hindoria	21
2224	Hirapur	21
2225	Hoshangabad	21
2226	Ichhawar	21
2227	Iklehra	21
2228	Indergarh	21
2229	Indore	21
2230	Isagarh	21
2231	Itarsi	21
2232	Jabalpur	21
2233	Jabalpur Cantonment	21
2234	Jabalpur G.C.F	21
2235	Jaisinghnagar	21
2236	Jaithari	21
2237	Jaitwara	21
2238	Jamai	21
2239	Jaora	21
2240	Jatachhapar	21
2241	Jatara	21
2242	Jawad	21
2243	Jawar	21
2244	Jeronkhalsa	21
2245	Jhabua	21
2246	Jhundpura	21
2247	Jiran	21
2248	Jirapur	21
2249	Jobat	21
2250	Joura	21
2251	Kailaras	21
2252	Kaimur	21
2253	Kakarhati	21
2254	Kalichhapar	21
2255	Kanad	21
2256	Kannod	21
2257	Kantaphod	21
2258	Kareli	21
2259	Karera	21
2260	Kari	21
2261	Karnawad	21
2262	Karrapur	21
2263	Kasrawad	21
2264	Katangi	21
2265	Katni	21
2266	Kelhauri	21
2267	Khachrod	21
2268	Khajuraho	21
2269	Khamaria	21
2270	Khand	21
2271	Khandwa	21
2272	Khaniyadhana	21
2273	Khargapur	21
2274	Khargone	21
2275	Khategaon	21
2276	Khetia	21
2277	Khilchipur	21
2278	Khirkiya	21
2279	Khujner	21
2280	Khurai	21
2281	Kolaras	21
2282	Kotar	21
2283	Kothi	21
2284	Kotma	21
2285	Kukshi	21
2286	Kumbhraj	21
2287	Kurwai	21
2288	Lahar	21
2289	Lakhnadon	21
2290	Lateri	21
2291	Laundi	21
2292	Lidhora Khas	21
2293	Lodhikheda	21
2294	Loharda	21
2295	Machalpur	21
2296	Madhogarh	21
2297	Maharajpur	21
2298	Maheshwar	21
2299	Mahidpur	21
2300	Maihar	21
2301	Majholi	21
2302	Makronia	21
2303	Maksi	21
2304	Malaj Khand	21
2305	Malanpur	21
2306	Malhargarh	21
2307	Manasa	21
2308	Manawar	21
2309	Mandav	21
2310	Mandideep	21
2311	Mandla	21
2312	Mandleshwar	21
2313	Mandsaur	21
2314	Manegaon	21
2315	Mangawan	21
2316	Manglaya Sadak	21
2317	Manpur	21
2318	Mau	21
2319	Mauganj	21
2320	Meghnagar	21
2321	Mehara Gaon	21
2322	Mehgaon	21
2323	Mhaugaon	21
2324	Mhow	21
2325	Mihona	21
2326	Mohgaon	21
2327	Morar	21
2328	Morena	21
2329	Morwa	21
2330	Multai	21
2331	Mundi	21
2332	Mungaoli	21
2333	Murwara	21
2334	Nagda	21
2335	Nagod	21
2336	Nagri	21
2337	Naigarhi	21
2338	Nainpur	21
2339	Nalkheda	21
2340	Namli	21
2341	Narayangarh	21
2342	Narsimhapur	21
2343	Narsingarh	21
2344	Narsinghpur	21
2345	Narwar	21
2346	Nasrullaganj	21
2347	Naudhia	21
2348	Naugaon	21
2349	Naurozabad	21
2350	Neemuch	21
2351	Nepa Nagar	21
2352	Neuton Chikhli Kalan	21
2353	Nimach	21
2354	Niwari	21
2355	Obedullaganj	21
2356	Omkareshwar	21
2357	Orachha	21
2358	Ordinance Factory Itarsi	21
2359	Pachmarhi	21
2360	Pachmarhi Cantonment	21
2361	Pachore	21
2362	Palchorai	21
2363	Palda	21
2364	Palera	21
2365	Pali	21
2366	Panagar	21
2367	Panara	21
2368	Pandaria	21
2369	Pandhana	21
2370	Pandhurna	21
2371	Panna	21
2372	Pansemal	21
2373	Parasia	21
2374	Pasan	21
2375	Patan	21
2376	Patharia	21
2377	Pawai	21
2378	Petlawad	21
2379	Phuph Kalan	21
2380	Pichhore	21
2381	Pipariya	21
2382	Pipliya Mandi	21
2383	Piploda	21
2384	Pithampur	21
2385	Polay Kalan	21
2386	Porsa	21
2387	Prithvipur	21
2388	Raghogarh	21
2389	Rahatgarh	21
2390	Raisen	21
2391	Rajakhedi	21
2392	Rajgarh	21
2393	Rajnagar	21
2394	Rajpur	21
2395	Rampur Baghelan	21
2396	Rampur Naikin	21
2397	Rampura	21
2398	Ranapur	21
2399	Ranipura	21
2400	Ratangarh	21
2401	Ratlam	21
2402	Ratlam Kasba	21
2403	Rau	21
2404	Rehli	21
2405	Rehti	21
2406	Rewa	21
2407	Sabalgarh	21
2408	Sagar	21
2409	Sagar Cantonment	21
2410	Sailana	21
2411	Sanawad	21
2412	Sanchi	21
2413	Sanwer	21
2414	Sarangpur	21
2415	Sardarpur	21
2416	Sarni	21
2417	Satai	21
2418	Satna	21
2419	Satwas	21
2420	Sausar	21
2421	Sehore	21
2422	Semaria	21
2423	Sendhwa	21
2424	Seondha	21
2425	Seoni	21
2426	Seoni Malwa	21
2427	Sethia	21
2428	Shahdol	21
2429	Shahgarh	21
2430	Shahpur	21
2431	Shahpura	21
2432	Shajapur	21
2433	Shamgarh	21
2434	Sheopur	21
2435	Shivpuri	21
2436	Shujalpur	21
2437	Sidhi	21
2438	Sihora	21
2439	Singolo	21
2440	Singrauli	21
2441	Sinhasa	21
2442	Sirgora	21
2443	Sirmaur	21
2444	Sironj	21
2445	Sitamau	21
2446	Sohagpur	21
2447	Sonkatch	21
2448	Soyatkalan	21
2449	Suhagi	21
2450	Sultanpur	21
2451	Susner	21
2452	Suthaliya	21
2453	Tal	21
2454	Talen	21
2455	Tarana	21
2456	Taricharkalan	21
2457	Tekanpur	21
2458	Tendukheda	21
2459	Teonthar	21
2460	Thandia	21
2461	Tikamgarh	21
2462	Timarni	21
2463	Tirodi	21
2464	Udaipura	21
2465	Ujjain	21
2466	Ukwa	21
2467	Umaria	21
2468	Unchahara	21
2469	Unhel	21
2470	Vehicle Factory Jabalpur	21
2471	Vidisha	21
2472	Vijayraghavgarh	21
2473	Waraseoni	21
2474	Achalpur	22
2475	Aheri	22
2476	Ahmadnagar Cantonment	22
2477	Ahmadpur	22
2478	Ahmednagar	22
2479	Ajra	22
2480	Akalkot	22
2481	Akkalkuwa	22
2482	Akola	22
2483	Akot	22
2484	Alandi	22
2485	Alibag	22
2486	Allapalli	22
2487	Alore	22
2488	Amalner	22
2489	Ambad	22
2490	Ambajogai	22
2491	Ambernath	22
2492	Ambivali Tarf Wankhal	22
2493	Amgaon	22
2494	Amravati	22
2495	Anjangaon	22
2496	Arvi	22
2497	Ashta	22
2498	Ashti	22
2499	Aurangabad	22
2500	Aurangabad Cantonment	22
2501	Ausa	22
2502	Babhulgaon	22
2503	Badlapur	22
2504	Balapur	22
2505	Ballarpur	22
2506	Baramati	22
2507	Barshi	22
2508	Basmat	22
2509	Beed	22
2510	Bhadravati	22
2511	Bhagur	22
2512	Bhandara	22
2513	Bhigvan	22
2514	Bhingar	22
2515	Bhiwandi	22
2516	Bhokhardan	22
2517	Bhor	22
2518	Bhosari	22
2519	Bhum	22
2520	Bhusawal	22
2521	Bid	22
2522	Biloli	22
2523	Birwadi	22
2524	Boisar	22
2525	Bop Khel	22
2526	Brahmapuri	22
2527	Budhgaon	22
2528	Buldana	22
2529	Buldhana	22
2530	Butibori	22
2531	Chakan	22
2532	Chalisgaon	22
2533	Chandrapur	22
2534	Chandur	22
2535	Chandur Bazar	22
2536	Chandvad	22
2537	Chicholi	22
2538	Chikhala	22
2539	Chikhaldara	22
2540	Chikhli	22
2541	Chinchani	22
2542	Chinchwad	22
2543	Chiplun	22
2544	Chopda	22
2545	Dabhol	22
2546	Dahance	22
2547	Dahanu	22
2548	Daharu	22
2549	Dapoli Camp	22
2550	Darwa	22
2551	Daryapur	22
2552	Dattapur	22
2553	Daund	22
2554	Davlameti	22
2555	Deglur	22
2556	Dehu Road	22
2557	Deolali	22
2558	Deolali Pravara	22
2559	Deoli	22
2560	Desaiganj	22
2561	Deulgaon Raja	22
2562	Dewhadi	22
2563	Dharangaon	22
2564	Dharmabad	22
2565	Dharur	22
2566	Dhatau	22
2567	Dhule	22
2568	Digdoh	22
2569	Diglur	22
2570	Digras	22
2571	Dombivli	22
2572	Dondaicha	22
2573	Dudhani	22
2574	Durgapur	22
2575	Dyane	22
2576	Edandol	22
2577	Eklahare	22
2578	Faizpur	22
2579	Fekari	22
2580	Gadchiroli	22
2581	Gadhinghaj	22
2582	Gandhi Nagar	22
2583	Ganeshpur	22
2584	Gangakher	22
2585	Gangapur	22
2586	Gevrai	22
2587	Ghatanji	22
2588	Ghoti	22
2589	Ghugus	22
2590	Ghulewadi	22
2591	Godoli	22
2592	Gondia	22
2593	Guhagar	22
2594	Hadgaon	22
2595	Harnai Beach	22
2596	Hinganghat	22
2597	Hingoli	22
2598	Hupari	22
2599	Ichalkaranji	22
2600	Igatpuri	22
2601	Indapur	22
2602	Jaisinghpur	22
2603	Jalgaon	22
2604	Jalna	22
2605	Jamkhed	22
2606	Jawhar	22
2607	Jaysingpur	22
2608	Jejuri	22
2609	Jintur	22
2610	Junnar	22
2611	Kabnur	22
2612	Kagal	22
2613	Kalamb	22
2614	Kalamnuri	22
2615	Kalas	22
2616	Kalmeshwar	22
2617	Kalundre	22
2618	Kalyan	22
2619	Kamthi	22
2620	Kamthi Cantonment	22
2621	Kandari	22
2622	Kandhar	22
2623	Kandri	22
2624	Kandri II	22
2625	Kanhan	22
2626	Kankavli	22
2627	Kannad	22
2628	Karad	22
2629	Karanja	22
2630	Karanje Tarf	22
2631	Karivali	22
2632	Karjat	22
2633	Karmala	22
2634	Kasara Budruk	22
2635	Katai	22
2636	Katkar	22
2637	Katol	22
2638	Kegaon	22
2639	Khadkale	22
2640	Khadki	22
2641	Khamgaon	22
2642	Khapa	22
2643	Kharadi	22
2644	Kharakvasla	22
2645	Khed	22
2646	Kherdi	22
2647	Khoni	22
2648	Khopoli	22
2649	Khuldabad	22
2650	Kinwat	22
2651	Kodoli	22
2652	Kolhapur	22
2653	Kon	22
2654	Kondumal	22
2655	Kopargaon	22
2656	Kopharad	22
2657	Koradi	22
2658	Koregaon	22
2659	Korochi	22
2660	Kudal	22
2661	Kundaim	22
2662	Kundalwadi	22
2663	Kurandvad	22
2664	Kurduvadi	22
2665	Kusgaon Budruk	22
2666	Lanja	22
2667	Lasalgaon	22
2668	Latur	22
2669	Loha	22
2670	Lohegaon	22
2671	Lonar	22
2672	Lonavala	22
2673	Madhavnagar	22
2674	Mahabaleshwar	22
2675	Mahad	22
2676	Mahadula	22
2677	Maindargi	22
2678	Majalgaon	22
2679	Malegaon	22
2680	Malgaon	22
2681	Malkapur	22
2682	Malwan	22
2683	Manadur	22
2684	Manchar	22
2685	Mangalvedhe	22
2686	Mangrul Pir	22
2687	Manmad	22
2688	Manor	22
2689	Mansar	22
2690	Manwath	22
2691	Mapuca	22
2692	Matheran	22
2693	Mehkar	22
2694	Mhasla	22
2695	Mhaswad	22
2696	Mira Bhayandar	22
2697	Miraj	22
2698	Mohpa	22
2699	Mohpada	22
2700	Moram	22
2701	Morshi	22
2702	Mowad	22
2703	Mudkhed	22
2704	Mukhed	22
2705	Mul	22
2706	Mulshi	22
2707	Mumbai	22
2708	Murbad	22
2709	Murgud	22
2710	Murtijapur	22
2711	Murud	22
2712	Nachane	22
2713	Nagardeole	22
2714	Nagothane	22
2715	Nagpur	22
2716	Nakoda	22
2717	Nalasopara	22
2718	Naldurg	22
2719	Nanded	22
2720	Nandgaon	22
2721	Nandura	22
2722	Nandurbar	22
2723	Narkhed	22
2724	Nashik	22
2725	Navapur	22
2726	Navi Mumbai	22
2727	Navi Mumbai Panvel	22
2728	Neral	22
2729	Nigdi	22
2730	Nilanga	22
2731	Nildoh	22
2732	Nimbhore	22
2733	Ojhar	22
2734	Osmanabad	22
2735	Pachgaon	22
2736	Pachora	22
2737	Padagha	22
2738	Paithan	22
2739	Palghar	22
2740	Pali	22
2741	Panchgani	22
2742	Pandhakarwada	22
2743	Pandharpur	22
2744	Panhala	22
2745	Panvel	22
2746	Paranda	22
2747	Parbhani	22
2748	Parli	22
2749	Parola	22
2750	Partur	22
2751	Pasthal	22
2752	Patan	22
2753	Pathardi	22
2754	Pathri	22
2755	Patur	22
2756	Pawni	22
2757	Pen	22
2758	Pethumri	22
2759	Phaltan	22
2760	Pimpri	22
2761	Poladpur	22
2762	Pulgaon	22
2763	Pune	22
2764	Pune Cantonment	22
2765	Purna	22
2766	Purushottamnagar	22
2767	Pusad	22
2768	Rahimatpur	22
2769	Rahta Pimplas	22
2770	Rahuri	22
2771	Raigad	22
2772	Rajapur	22
2773	Rajgurunagar	22
2774	Rajur	22
2775	Rajura	22
2776	Ramtek	22
2777	Ratnagiri	22
2778	Ravalgaon	22
2779	Raver	22
2780	Revadanda	22
2781	Risod	22
2782	Roha Ashtami	22
2783	Sakri	22
2784	Sandor	22
2785	Sangamner	22
2786	Sangli	22
2787	Sangole	22
2788	Sasti	22
2789	Sasvad	22
2790	Satana	22
2791	Satara	22
2792	Savantvadi	22
2793	Savda	22
2794	Savner	22
2795	Sawari Jawharnagar	22
2796	Selu	22
2797	Shahada	22
2798	Shahapur	22
2799	Shegaon	22
2800	Shelar	22
2801	Shendurjana	22
2802	Shirdi	22
2803	Shirgaon	22
2804	Shirpur	22
2805	Shirur	22
2806	Shirwal	22
2807	Shivatkar	22
2808	Shrigonda	22
2809	Shrirampur	22
2810	Shrirampur Rural	22
2811	Sillewada	22
2812	Sillod	22
2813	Sindhudurg	22
2814	Sindi	22
2815	Sindi Turf Hindnagar	22
2816	Sindkhed Raja	22
2817	Singnapur	22
2818	Sinnar	22
2819	Sirur	22
2820	Sitasawangi	22
2821	Solapur	22
2822	Sonai	22
2823	Sonegaon	22
2824	Soyagaon	22
2825	Srivardhan	22
2826	Surgana	22
2827	Talegaon Dabhade	22
2828	Taloda	22
2829	Taloja	22
2830	Talwade	22
2831	Tarapur	22
2832	Tasgaon	22
2833	Tathavade	22
2834	Tekadi	22
2835	Telhara	22
2836	Thane	22
2837	Tirira	22
2838	Totaladoh	22
2839	Trimbak	22
2840	Tuljapur	22
2841	Tumsar	22
2842	Uchgaon	22
2843	Udgir	22
2844	Ulhasnagar	22
2845	Umarga	22
2846	Umarkhed	22
2847	Umarsara	22
2848	Umbar Pada Nandade	22
2849	Umred	22
2850	Umri Pragane Balapur	22
2851	Uran	22
2852	Uran Islampur	22
2853	Utekhol	22
2854	Vada	22
2855	Vadgaon	22
2856	Vadgaon Kasba	22
2857	Vaijapur	22
2858	Vanvadi	22
2859	Varangaon	22
2860	Vasai	22
2861	Vasantnagar	22
2862	Vashind	22
2863	Vengurla	22
2864	Virar	22
2865	Visapur	22
2866	Vite	22
2867	Vithalwadi	22
2868	Wadi	22
2869	Waghapur	22
2870	Wai	22
2871	Wajegaon	22
2872	Walani	22
2873	Wanadongri	22
2874	Wani	22
2875	Wardha	22
2876	Warora	22
2877	Warthi	22
2878	Warud	22
2879	Washim	22
2880	Yaval	22
2881	Yavatmal	22
2882	Yeola	22
2883	Yerkheda	22
2884	Andro	23
2885	Bijoy Govinda	23
2886	Bishnupur	23
2887	Churachandpur	23
2888	Heriok	23
2889	Imphal	23
2890	Jiribam	23
2891	Kakching	23
2892	Kakching Khunou	23
2893	Khongman	23
2894	Kumbi	23
2895	Kwakta	23
2896	Lamai	23
2897	Lamjaotongba	23
2898	Lamshang	23
2899	Lilong	23
2900	Mayang Imphal	23
2901	Moirang	23
2902	Moreh	23
2903	Nambol	23
2904	Naoriya Pakhanglakpa	23
2905	Ningthoukhong	23
2906	Oinam	23
2907	Porompat	23
2908	Samurou	23
2909	Sekmai Bazar	23
2910	Senapati	23
2911	Sikhong Sekmai	23
2912	Sugnu	23
2913	Thongkhong Laxmi Bazar	23
2914	Thoubal	23
2915	Torban	23
2916	Wangjing	23
2917	Wangoi	23
2918	Yairipok	23
2919	Baghmara	24
2920	Cherrapunji	24
2921	Jawai	24
2922	Madanrting	24
2923	Mairang	24
2924	Mawlai	24
2925	Nongmynsong	24
2926	Nongpoh	24
2927	Nongstoin	24
2928	Nongthymmai	24
2929	Pynthorumkhrah	24
2930	Resubelpara	24
2931	Shillong	24
2932	Shillong Cantonment	24
2933	Tura	24
2934	Williamnagar	24
2935	Aizawl	25
2936	Bairabi	25
2937	Biate	25
2938	Champhai	25
2939	Darlawn	25
2940	Hnahthial	25
2941	Kawnpui	25
2942	Khawhai	25
2943	Khawzawl	25
2944	Kolasib	25
2945	Lengpui	25
2946	Lunglei	25
2947	Mamit	25
2948	North Vanlaiphai	25
2949	Saiha	25
2950	Sairang	25
2951	Saitul	25
2952	Serchhip	25
2953	Thenzawl	25
2954	Tlabung	25
2955	Vairengte	25
2956	Zawlnuam	25
2957	Chumukedima	26
2958	Dimapur	26
2959	Kohima	26
2960	Mokokchung	26
2961	Mon	26
2962	Phek	26
2963	Tuensang	26
2964	Wokha	26
2965	Zunheboto	26
2966	Anandapur	29
2967	Angul	29
2968	Aska	29
2969	Athgarh	29
2970	Athmallik	29
2971	Balagoda	29
2972	Balangir	29
2973	Balasore	29
2974	Baleshwar	29
2975	Balimeta	29
2976	Balugaon	29
2977	Banapur	29
2978	Bangura	29
2979	Banki	29
2980	Banposh	29
2981	Barbil	29
2982	Bargarh	29
2983	Baripada	29
2984	Barpali	29
2985	Basudebpur	29
2986	Baudh	29
2987	Belagachhia	29
2988	Belaguntha	29
2989	Belpahar	29
2990	Berhampur	29
2991	Bhadrak	29
2992	Bhanjanagar	29
2993	Bhawanipatna	29
2994	Bhuban	29
2995	Bhubaneswar	29
2996	Binika	29
2997	Birmitrapur	29
2998	Bishama Katek	29
2999	Bolangir	29
3000	Brahmapur	29
3001	Brajrajnagar	29
3002	Buguda	29
3003	Burla	29
3004	Byasanagar	29
3005	Champua	29
3006	Chandapur	29
3007	Chandbali	29
3008	Chandili	29
3009	Charibatia	29
3010	Chatrapur	29
3011	Chikitigarh	29
3012	Chitrakonda	29
3013	Choudwar	29
3014	Cuttack	29
3015	Dadhapatna	29
3016	Daitari	29
3017	Damanjodi	29
3018	Deogarh	29
3019	Deracolliery	29
3020	Dhamanagar	29
3021	Dhenkanal	29
3022	Digapahandi	29
3023	Dungamal	29
3024	Fertilizer Corporation of Indi	29
3025	Ganjam	29
3026	Ghantapada	29
3027	Gopalpur	29
3028	Gudari	29
3029	Gunupur	29
3030	Hatibandha	29
3031	Hinjilikatu	29
3032	Hirakud	29
3033	Jagatsinghapur	29
3034	Jajpur	29
3035	Jalda	29
3036	Jaleswar	29
3037	Jatni	29
3038	Jaypur	29
3039	Jeypore	29
3040	Jharsuguda	29
3041	Jhumpura	29
3042	Joda	29
3043	Junagarh	29
3044	Kamakhyanagar	29
3045	Kantabanji	29
3046	Kantilo	29
3047	Karanja	29
3048	Kashinagara	29
3049	Kataka	29
3050	Kavisuryanagar	29
3051	Kendrapara	29
3052	Kendujhar	29
3053	Keonjhar	29
3054	Kesinga	29
3055	Khaliapali	29
3056	Khalikote	29
3057	Khandaparha	29
3058	Kharhial	29
3059	Kharhial Road	29
3060	Khatiguda	29
3061	Khurda	29
3062	Kochinda	29
3063	Kodala	29
3064	Konark	29
3065	Koraput	29
3066	Kotaparh	29
3067	Lanjigarh	29
3068	Lattikata	29
3069	Makundapur	29
3070	Malkangiri	29
3071	Mukhiguda	29
3072	Nabarangpur	29
3073	Nalco	29
3074	Naurangapur	29
3075	Nayagarh	29
3076	Nilagiri	29
3077	Nimaparha	29
3078	Nuapada	29
3079	Nuapatna	29
3080	OCL Industrialship	29
3081	Padampur	29
3082	Paradip	29
3083	Paradwip	29
3084	Parlakimidi	29
3085	Patamundai	29
3086	Patnagarh	29
3087	Phulabani	29
3088	Pipili	29
3089	Polasara	29
3090	Pratapsasan	29
3091	Puri	29
3092	Purushottampur	29
3093	Rairangpur	29
3094	Raj Gangpur	29
3095	Rambha	29
3096	Raurkela	29
3097	Raurkela Civil Township	29
3098	Rayagada	29
3099	Redhakhol	29
3100	Remuna	29
3101	Rengali	29
3102	Rourkela	29
3103	Sambalpur	29
3104	Sinapali	29
3105	Sonepur	29
3106	Sorada	29
3107	Soro	29
3108	Sunabeda	29
3109	Sundargarh	29
3110	Talcher	29
3111	Talcher Thermal Power Station 	29
3112	Tarabha	29
3113	Tensa	29
3114	Titlagarh	29
3115	Udala	29
3116	Udayagiri	29
3117	Umarkot	29
3118	Vikrampur	29
3119	Ariankuppam	31
3120	Karaikal	31
3121	Kurumbapet	31
3122	Mahe	31
3123	Ozhukarai	31
3124	Pondicherry	31
3125	Villianur	31
3126	Yanam	31
3127	Abohar	32
3128	Adampur	32
3129	Ahmedgarh	32
3130	Ajnala	32
3131	Akalgarh	32
3132	Alawalpur	32
3133	Amloh	32
3134	Amritsar	32
3135	Amritsar Cantonment	32
3136	Anandpur Sahib	32
3137	Badhni Kalan	32
3138	Bagh Purana	32
3139	Balachaur	32
3140	Banaur	32
3141	Banga	32
3142	Banur	32
3143	Baretta	32
3144	Bariwala	32
3145	Barnala	32
3146	Bassi Pathana	32
3147	Batala	32
3148	Bathinda	32
3149	Begowal	32
3150	Behrampur	32
3151	Bhabat	32
3152	Bhadur	32
3153	Bhankharpur	32
3154	Bharoli Kalan	32
3155	Bhawanigarh	32
3156	Bhikhi	32
3157	Bhikhiwind	32
3158	Bhisiana	32
3159	Bhogpur	32
3160	Bhuch	32
3161	Bhulath	32
3162	Budha Theh	32
3163	Budhlada	32
3164	Chima	32
3165	Chohal	32
3166	Dasuya	32
3167	Daulatpur	32
3168	Dera Baba Nanak	32
3169	Dera Bassi	32
3170	Dhanaula	32
3171	Dharam Kot	32
3172	Dhariwal	32
3173	Dhilwan	32
3174	Dhuri	32
3175	Dinanagar	32
3176	Dirba	32
3177	Doraha	32
3178	Faridkot	32
3179	Fateh Nangal	32
3180	Fatehgarh Churian	32
3181	Fatehgarh Sahib	32
3182	Fazilka	32
3183	Firozpur	32
3184	Firozpur Cantonment	32
3185	Gardhiwala	32
3186	Garhshankar	32
3187	Ghagga	32
3188	Ghanaur	32
3189	Giddarbaha	32
3190	Gobindgarh	32
3191	Goniana	32
3192	Goraya	32
3193	Gurdaspur	32
3194	Guru Har Sahai	32
3195	Hajipur	32
3196	Handiaya	32
3197	Hariana	32
3198	Hoshiarpur	32
3199	Hussainpur	32
3200	Jagraon	32
3201	Jaitu	32
3202	Jalalabad	32
3203	Jalandhar	32
3204	Jalandhar Cantonment	32
3205	Jandiala	32
3206	Jugial	32
3207	Kalanaur	32
3208	Kapurthala	32
3209	Karoran	32
3210	Kartarpur	32
3211	Khamanon	32
3212	Khanauri	32
3213	Khanna	32
3214	Kharar	32
3215	Khem Karan	32
3216	Kot Fatta	32
3217	Kot Isa Khan	32
3218	Kot Kapura	32
3219	Kotkapura	32
3220	Kurali	32
3221	Lalru	32
3222	Lehra Gaga	32
3223	Lodhian Khas	32
3224	Longowal	32
3225	Ludhiana	32
3226	Machhiwara	32
3227	Mahilpur	32
3228	Majitha	32
3229	Makhu	32
3230	Malaut	32
3231	Malerkotla	32
3232	Maloud	32
3233	Mandi Gobindgarh	32
3234	Mansa	32
3235	Maur	32
3236	Moga	32
3237	Mohali	32
3238	Moonak	32
3239	Morinda	32
3240	Mukerian	32
3241	Muktsar	32
3242	Mullanpur Dakha	32
3243	Mullanpur Garibdas	32
3244	Munak	32
3245	Muradpura	32
3246	Nabha	32
3247	Nakodar	32
3248	Nangal	32
3249	Nawashahr	32
3250	Naya Nangal	32
3251	Nehon	32
3252	Nurmahal	32
3253	Pathankot	32
3254	Patiala	32
3255	Patti	32
3256	Pattran	32
3257	Payal	32
3258	Phagwara	32
3259	Phillaur	32
3260	Qadian	32
3261	Rahon	32
3262	Raikot	32
3263	Raja Sansi	32
3264	Rajpura	32
3265	Ram Das	32
3266	Raman	32
3267	Rampura	32
3268	Rayya	32
3269	Rupnagar	32
3270	Rurki Kasba	32
3271	Sahnewal	32
3272	Samana	32
3273	Samrala	32
3274	Sanaur	32
3275	Sangat	32
3276	Sangrur	32
3277	Sansarpur	32
3278	Sardulgarh	32
3279	Shahkot	32
3280	Sham Churasi	32
3281	Shekhpura	32
3282	Sirhind	32
3283	Sri Hargobindpur	32
3284	Sujanpur	32
3285	Sultanpur Lodhi	32
3286	Sunam	32
3287	Talwandi Bhai	32
3288	Talwara	32
3289	Tappa	32
3290	Tarn Taran	32
3291	Urmar Tanda	32
3292	Zira	32
3293	Zirakpur	32
3294	Abu Road	33
3295	Ajmer	33
3296	Aklera	33
3297	Alwar	33
3298	Amet	33
3299	Antah	33
3300	Anupgarh	33
3301	Asind	33
3302	Bagar	33
3303	Bagru	33
3304	Bahror	33
3305	Bakani	33
3306	Bali	33
3307	Balotra	33
3308	Bandikui	33
3309	Banswara	33
3310	Baran	33
3311	Bari	33
3312	Bari Sadri	33
3313	Barmer	33
3314	Basi	33
3315	Basni Belima	33
3316	Baswa	33
3317	Bayana	33
3318	Beawar	33
3319	Begun	33
3320	Bhadasar	33
3321	Bhadra	33
3322	Bhalariya	33
3323	Bharatpur	33
3324	Bhasawar	33
3325	Bhawani Mandi	33
3326	Bhawri	33
3327	Bhilwara	33
3328	Bhindar	33
3329	Bhinmal	33
3330	Bhiwadi	33
3331	Bijoliya Kalan	33
3332	Bikaner	33
3333	Bilara	33
3334	Bissau	33
3335	Borkhera	33
3336	Budhpura	33
3337	Bundi	33
3338	Chatsu	33
3339	Chechat	33
3340	Chhabra	33
3341	Chhapar	33
3342	Chhipa Barod	33
3343	Chhoti Sadri	33
3344	Chirawa	33
3345	Chittaurgarh	33
3346	Chittorgarh	33
3347	Chomun	33
3348	Churu	33
3349	Daosa	33
3350	Dariba	33
3351	Dausa	33
3352	Deoli	33
3353	Deshnok	33
3354	Devgarh	33
3355	Devli	33
3356	Dhariawad	33
3357	Dhaulpur	33
3358	Dholpur	33
3359	Didwana	33
3360	Dig	33
3361	Dungargarh	33
3362	Dungarpur	33
3363	Falna	33
3364	Fatehnagar	33
3365	Fatehpur	33
3366	Gajsinghpur	33
3367	Galiakot	33
3368	Ganganagar	33
3369	Gangapur	33
3370	Goredi Chancha	33
3371	Gothra	33
3372	Govindgarh	33
3373	Gulabpura	33
3374	Hanumangarh	33
3375	Hindaun	33
3376	Indragarh	33
3377	Jahazpur	33
3378	Jaipur	33
3379	Jaisalmer	33
3380	Jaiselmer	33
3381	Jaitaran	33
3382	Jalore	33
3383	Jhalawar	33
3384	Jhalrapatan	33
3385	Jhunjhunun	33
3386	Jobner	33
3387	Jodhpur	33
3388	Kaithun	33
3389	Kaman	33
3390	Kankroli	33
3391	Kanor	33
3392	Kapasan	33
3393	Kaprain	33
3394	Karanpura	33
3395	Karauli	33
3396	Kekri	33
3397	Keshorai Patan	33
3398	Kesrisinghpur	33
3399	Khairthal	33
3400	Khandela	33
3401	Khanpur	33
3402	Kherli	33
3403	Kherliganj	33
3404	Kherwara Chhaoni	33
3405	Khetri	33
3406	Kiranipura	33
3407	Kishangarh	33
3408	Kishangarh Ranwal	33
3409	Kolvi Rajendrapura	33
3410	Kot Putli	33
3411	Kota	33
3412	Kuchaman	33
3413	Kuchera	33
3414	Kumbhalgarh	33
3415	Kumbhkot	33
3416	Kumher	33
3417	Kushalgarh	33
3418	Lachhmangarh	33
3419	Ladnun	33
3420	Lakheri	33
3421	Lalsot	33
3422	Losal	33
3423	Madanganj	33
3424	Mahu Kalan	33
3425	Mahwa	33
3426	Makrana	33
3427	Malpura	33
3428	Mandal	33
3429	Mandalgarh	33
3430	Mandawar	33
3431	Mandwa	33
3432	Mangrol	33
3433	Manohar Thana	33
3434	Manoharpur	33
3435	Marwar	33
3436	Merta	33
3437	Modak	33
3438	Mount Abu	33
3439	Mukandgarh	33
3440	Mundwa	33
3441	Nadbai	33
3442	Naenwa	33
3443	Nagar	33
3444	Nagaur	33
3445	Napasar	33
3446	Naraina	33
3447	Nasirabad	33
3448	Nathdwara	33
3449	Nawa	33
3450	Nawalgarh	33
3451	Neem Ka Thana	33
3452	Neemrana	33
3453	Newa Talai	33
3454	Nimaj	33
3455	Nimbahera	33
3456	Niwai	33
3457	Nohar	33
3458	Nokha	33
3459	One SGM	33
3460	Padampur	33
3461	Pali	33
3462	Partapur	33
3463	Parvatsar	33
3464	Pasoond	33
3465	Phalna	33
3466	Phalodi	33
3467	Phulera	33
3468	Pilani	33
3469	Pilibanga	33
3470	Pindwara	33
3471	Pipalia Kalan	33
3472	Pipar	33
3473	Pirawa	33
3474	Pokaran	33
3475	Pratapgarh	33
3476	Pushkar	33
3477	Raipur	33
3478	Raisinghnagar	33
3479	Rajakhera	33
3480	Rajaldesar	33
3481	Rajgarh	33
3482	Rajsamand	33
3483	Ramganj Mandi	33
3484	Ramgarh	33
3485	Rani	33
3486	Raniwara	33
3487	Ratan Nagar	33
3488	Ratangarh	33
3489	Rawatbhata	33
3490	Rawatsar	33
3491	Rikhabdev	33
3492	Ringas	33
3493	Sadri	33
3494	Sadulshahar	33
3495	Sagwara	33
3496	Salumbar	33
3497	Sambhar	33
3498	Samdari	33
3499	Sanchor	33
3500	Sangariya	33
3501	Sangod	33
3502	Sardarshahr	33
3503	Sarwar	33
3504	Satal Kheri	33
3505	Sawai Madhopur	33
3506	Sewan Kalan	33
3507	Shahpura	33
3508	Sheoganj	33
3509	Sikar	33
3510	Sirohi	33
3511	Siwana	33
3512	Sogariya	33
3513	Sojat	33
3514	Sojat Road	33
3515	Sri Madhopur	33
3516	Sriganganagar	33
3517	Sujangarh	33
3518	Suket	33
3519	Sumerpur	33
3520	Sunel	33
3521	Surajgarh	33
3522	Suratgarh	33
3523	Swaroopganj	33
3524	Takhatgarh	33
3525	Taranagar	33
3526	Three STR	33
3527	Tijara	33
3528	Toda Bhim	33
3529	Toda Raisingh	33
3530	Todra	33
3531	Tonk	33
3532	Udaipur	33
3533	Udpura	33
3534	Uniara	33
3535	Vanasthali	33
3536	Vidyavihar	33
3537	Vijainagar	33
3538	Viratnagar	33
3539	Wer	33
3540	Gangtok	34
3541	Gezing	34
3542	Jorethang	34
3543	Mangan	34
3544	Namchi	34
3545	Naya Bazar	34
3546	No City	34
3547	Rangpo	34
3548	Sikkim	34
3549	Singtam	34
3550	Upper Tadong	34
3551	Abiramam	35
3552	Achampudur	35
3553	Acharapakkam	35
3554	Acharipallam	35
3555	Achipatti	35
3556	Adikaratti	35
3557	Adiramapattinam	35
3558	Aduturai	35
3559	Adyar	35
3560	Agaram	35
3561	Agasthiswaram	35
3562	Akkaraipettai	35
3563	Alagappapuram	35
3564	Alagapuri	35
3565	Alampalayam	35
3566	Alandur	35
3567	Alanganallur	35
3568	Alangayam	35
3569	Alangudi	35
3570	Alangulam	35
3571	Alanthurai	35
3572	Alapakkam	35
3573	Allapuram	35
3574	Alur	35
3575	Alwar Tirunagari	35
3576	Alwarkurichi	35
3577	Ambasamudram	35
3578	Ambur	35
3579	Ammainaickanur	35
3580	Ammaparikuppam	35
3581	Ammapettai	35
3582	Ammavarikuppam	35
3583	Ammur	35
3584	Anaimalai	35
3585	Anaiyur	35
3586	Anakaputhur	35
3587	Ananthapuram	35
3588	Andanappettai	35
3589	Andipalayam	35
3590	Andippatti	35
3591	Anjugramam	35
3592	Annamalainagar	35
3593	Annavasal	35
3594	Annur	35
3595	Anthiyur	35
3596	Appakudal	35
3597	Arachalur	35
3598	Arakandanallur	35
3599	Arakonam	35
3600	Aralvaimozhi	35
3601	Arani	35
3602	Arani Road	35
3603	Arantangi	35
3604	Arasiramani	35
3605	Aravakurichi	35
3606	Aravankadu	35
3607	Arcot	35
3608	Arimalam	35
3609	Ariyalur	35
3610	Ariyappampalayam	35
3611	Ariyur	35
3612	Arni	35
3613	Arulmigu Thirumuruganpundi	35
3614	Arumanai	35
3615	Arumbavur	35
3616	Arumuganeri	35
3617	Aruppukkottai	35
3618	Ashokapuram	35
3619	Athani	35
3620	Athanur	35
3621	Athimarapatti	35
3622	Athipattu	35
3623	Athur	35
3624	Attayyampatti	35
3625	Attur	35
3626	Auroville	35
3627	Avadattur	35
3628	Avadi	35
3629	Avalpundurai	35
3630	Avaniapuram	35
3631	Avinashi	35
3632	Ayakudi	35
3633	Ayanadaippu	35
3634	Aygudi	35
3635	Ayothiapattinam	35
3636	Ayyalur	35
3637	Ayyampalayam	35
3638	Ayyampettai	35
3639	Azhagiapandiapuram	35
3640	Balakrishnampatti	35
3641	Balakrishnapuram	35
3642	Balapallam	35
3643	Balasamudram	35
3644	Bargur	35
3645	Belur	35
3646	Berhatty	35
3647	Bhavani	35
3648	Bhawanisagar	35
3649	Bhuvanagiri	35
3650	Bikketti	35
3651	Bodinayakkanur	35
3652	Brahmana Periya Agraharam	35
3653	Buthapandi	35
3654	Buthipuram	35
3655	Chatrapatti	35
3656	Chembarambakkam	35
3657	Chengalpattu	35
3658	Chengam	35
3659	Chennai	35
3660	Chennasamudram	35
3661	Chennimalai	35
3662	Cheranmadevi	35
3663	Cheruvanki	35
3664	Chetpet	35
3665	Chettiarpatti	35
3666	Chettipalaiyam	35
3667	Chettipalayam Cantonment	35
3668	Chettithangal	35
3669	Cheyur	35
3670	Cheyyar	35
3671	Chidambaram	35
3672	Chinalapatti	35
3673	Chinna Anuppanadi	35
3674	Chinna Salem	35
3675	Chinnakkampalayam	35
3676	Chinnammanur	35
3677	Chinnampalaiyam	35
3678	Chinnasekkadu	35
3679	Chinnavedampatti	35
3680	Chitlapakkam	35
3681	Chittodu	35
3682	Cholapuram	35
3683	Coimbatore	35
3684	Coonoor	35
3685	Courtalam	35
3686	Cuddalore	35
3687	Dalavaipatti	35
3688	Darasuram	35
3689	Denkanikottai	35
3690	Desur	35
3691	Devadanapatti	35
3692	Devakkottai	35
3693	Devakottai	35
3694	Devanangurichi	35
3695	Devarshola	35
3696	Devasthanam	35
3697	Dhalavoipuram	35
3698	Dhali	35
3699	Dhaliyur	35
3700	Dharapadavedu	35
3701	Dharapuram	35
3702	Dharmapuri	35
3703	Dindigul	35
3704	Dusi	35
3705	Edaganasalai	35
3706	Edaikodu	35
3707	Edakalinadu	35
3708	Elathur	35
3709	Elayirampannai	35
3710	Elumalai	35
3711	Eral	35
3712	Eraniel	35
3713	Eriodu	35
3714	Erode	35
3715	Erumaipatti	35
3716	Eruvadi	35
3717	Ethapur	35
3718	Ettaiyapuram	35
3719	Ettimadai	35
3720	Ezhudesam	35
3721	Ganapathipuram	35
3722	Gandhi Nagar	35
3723	Gangaikondan	35
3724	Gangavalli	35
3725	Ganguvarpatti	35
3726	Gingi	35
3727	Gopalasamudram	35
3728	Gopichettipalaiyam	35
3729	Gudalur	35
3730	Gudiyattam	35
3731	Guduvanchery	35
3732	Gummidipoondi	35
3733	Hanumanthampatti	35
3734	Harur	35
3735	Harveypatti	35
3736	Highways	35
3737	Hosur	35
3738	Hubbathala	35
3739	Huligal	35
3740	Idappadi	35
3741	Idikarai	35
3742	Ilampillai	35
3743	Ilanji	35
3744	Iluppaiyurani	35
3745	Iluppur	35
3746	Inam Karur	35
3747	Injambakkam	35
3748	Irugur	35
3749	Jaffrabad	35
3750	Jagathala	35
3751	Jalakandapuram	35
3752	Jalladiampet	35
3753	Jambai	35
3754	Jayankondam	35
3755	Jolarpet	35
3756	Kadambur	35
3757	Kadathur	35
3758	Kadayal	35
3759	Kadayampatti	35
3760	Kadayanallur	35
3761	Kadiapatti	35
3762	Kalakkad	35
3763	Kalambur	35
3764	Kalapatti	35
3765	Kalappanaickenpatti	35
3766	Kalavai	35
3767	Kalinjur	35
3768	Kaliyakkavilai	35
3769	Kallakkurichi	35
3770	Kallakudi	35
3771	Kallidaikurichchi	35
3772	Kallukuttam	35
3773	Kallupatti	35
3774	Kalpakkam	35
3775	Kalugumalai	35
3776	Kamayagoundanpatti	35
3777	Kambainallur	35
3778	Kambam	35
3779	Kamuthi	35
3780	Kanadukathan	35
3781	Kanakkampalayam	35
3782	Kanam	35
3783	Kanchipuram	35
3784	Kandanur	35
3785	Kangayam	35
3786	Kangayampalayam	35
3787	Kangeyanallur	35
3788	Kaniyur	35
3789	Kanjikoil	35
3790	Kannadendal	35
3791	Kannamangalam	35
3792	Kannampalayam	35
3793	Kannankurichi	35
3794	Kannapalaiyam	35
3795	Kannivadi	35
3796	Kanyakumari	35
3797	Kappiyarai	35
3798	Karaikkudi	35
3799	Karamadai	35
3800	Karambakkam	35
3801	Karambakkudi	35
3802	Kariamangalam	35
3803	Kariapatti	35
3804	Karugampattur	35
3805	Karumandi Chellipalayam	35
3806	Karumathampatti	35
3807	Karumbakkam	35
3808	Karungal	35
3809	Karunguzhi	35
3810	Karuppur	35
3811	Karur	35
3812	Kasipalaiyam	35
3813	Kasipalayam G	35
3814	Kathirvedu	35
3815	Kathujuganapalli	35
3816	Katpadi	35
3817	Kattivakkam	35
3818	Kattumannarkoil	35
3819	Kattupakkam	35
3820	Kattuputhur	35
3821	Kaveripakkam	35
3822	Kaveripattinam	35
3823	Kavundampalaiyam	35
3824	Kavundampalayam	35
3825	Kayalpattinam	35
3826	Kayattar	35
3827	Kelamangalam	35
3828	Kelambakkam	35
3829	Kembainaickenpalayam	35
3830	Kethi	35
3831	Kilakarai	35
3832	Kilampadi	35
3833	Kilkulam	35
3834	Kilkunda	35
3835	Killiyur	35
3836	Killlai	35
3837	Kilpennathur	35
3838	Kilvelur	35
3839	Kinathukadavu	35
3840	Kiramangalam	35
3841	Kiranur	35
3842	Kiripatti	35
3843	Kizhapavur	35
3844	Kmarasamipatti	35
3845	Kochadai	35
3846	Kodaikanal	35
3847	Kodambakkam	35
3848	Kodavasal	35
3849	Kodumudi	35
3850	Kolachal	35
3851	Kolappalur	35
3852	Kolathupalayam	35
3853	Kolathur	35
3854	Kollankodu	35
3855	Kollankoil	35
3856	Komaralingam	35
3857	Komarapalayam	35
3858	Kombai	35
3859	Konakkarai	35
3860	Konavattam	35
3861	Kondalampatti	35
3862	Konganapuram	35
3863	Koradacheri	35
3864	Korampallam	35
3865	Kotagiri	35
3866	Kothinallur	35
3867	Kottaiyur	35
3868	Kottakuppam	35
3869	Kottaram	35
3870	Kottivakkam	35
3871	Kottur	35
3872	Kovilpatti	35
3873	Koyampattur	35
3874	Krishnagiri	35
3875	Krishnarayapuram	35
3876	Krishnasamudram	35
3877	Kuchanur	35
3878	Kuhalur	35
3879	Kulasekarappattinam	35
3880	Kulasekarapuram	35
3881	Kulithalai	35
3882	Kumarapalaiyam	35
3883	Kumarapalayam	35
3884	Kumarapuram	35
3885	Kumbakonam	35
3886	Kundrathur	35
3887	Kuniyamuthur	35
3888	Kunnathur	35
3889	Kunur	35
3890	Kuraikundu	35
3891	Kurichi	35
3892	Kurinjippadi	35
3893	Kurudampalaiyam	35
3894	Kurumbalur	35
3895	Kuthalam	35
3896	Kuthappar	35
3897	Kuttalam	35
3898	Kuttanallur	35
3899	Kuzhithurai	35
3900	Labbaikudikadu	35
3901	Lakkampatti	35
3902	Lalgudi	35
3903	Lalpet	35
3904	Llayangudi	35
3905	Madambakkam	35
3906	Madanur	35
3907	Madathukulam	35
3908	Madhavaram	35
3909	Madippakkam	35
3910	Madukkarai	35
3911	Madukkur	35
3912	Madurai	35
3913	Maduranthakam	35
3914	Maduravoyal	35
3915	Mahabalipuram	35
3916	Makkinanpatti	35
3917	Mallamuppampatti	35
3918	Mallankinaru	35
3919	Mallapuram	35
3920	Mallasamudram	35
3921	Mallur	35
3922	Mamallapuram	35
3923	Mamsapuram	35
3924	Manachanallur	35
3925	Manali	35
3926	Manalmedu	35
3927	Manalurpet	35
3928	Manamadurai	35
3929	Manapakkam	35
3930	Manapparai	35
3931	Manavalakurichi	35
3932	Mandaikadu	35
3933	Mandapam	35
3934	Mangadu	35
3935	Mangalam	35
3936	Mangalampet	35
3937	Manimutharu	35
3938	Mannargudi	35
3939	Mappilaiurani	35
3940	Maraimalai Nagar	35
3941	Marakkanam	35
3942	Maramangalathupatti	35
3943	Marandahalli	35
3944	Markayankottai	35
3945	Marudur	35
3946	Marungur	35
3947	Masinigudi	35
3948	Mathigiri	35
3949	Mattur	35
3950	Mayiladuthurai	35
3951	Mecheri	35
3952	Melacheval	35
3953	Melachokkanathapuram	35
3954	Melagaram	35
3955	Melamadai	35
3956	Melamaiyur	35
3957	Melanattam	35
3958	Melathiruppanthuruthi	35
3959	Melattur	35
3960	Melmananbedu	35
3961	Melpattampakkam	35
3962	Melur	35
3963	Melvisharam	35
3964	Mettupalayam	35
3965	Mettur	35
3966	Meyyanur	35
3967	Milavittan	35
3968	Minakshipuram	35
3969	Minambakkam	35
3970	Minjur	35
3971	Modakurichi	35
3972	Mohanur	35
3973	Mopperipalayam	35
3974	Mudalur	35
3975	Mudichur	35
3976	Mudukulathur	35
3977	Mukasipidariyur	35
3978	Mukkudal	35
3979	Mulagumudu	35
3980	Mulakaraipatti	35
3981	Mulanur	35
3982	Mullakkadu	35
3983	Muruganpalayam	35
3984	Musiri	35
3985	Muthupet	35
3986	Muthur	35
3987	Muttayyapuram	35
3988	Muttupet	35
3989	Muvarasampettai	35
3990	Myladi	35
3991	Mylapore	35
3992	Nadukkuthagai	35
3993	Naduvattam	35
3994	Nagapattinam	35
3995	Nagavakulam	35
3996	Nagercoil	35
3997	Nagojanahalli	35
3998	Nallampatti	35
3999	Nallur	35
4000	Namagiripettai	35
4001	Namakkal	35
4002	Nambiyur	35
4003	Nambutalai	35
4004	Nandambakkam	35
4005	Nandivaram	35
4006	Nangavalli	35
4007	Nangavaram	35
4008	Nanguneri	35
4009	Nanjikottai	35
4010	Nannilam	35
4011	Naranammalpuram	35
4012	Naranapuram	35
4013	Narasimhanaickenpalayam	35
4014	Narasingapuram	35
4015	Narasojipatti	35
4016	Naravarikuppam	35
4017	Nasiyanur	35
4018	Natham	35
4019	Nathampannai	35
4020	Natrampalli	35
4021	Nattam	35
4022	Nattapettai	35
4023	Nattarasankottai	35
4024	Navalpattu	35
4025	Nazarethpettai	35
4026	Nazerath	35
4027	Neikkarapatti	35
4028	Neiyyur	35
4029	Nellikkuppam	35
4030	Nelliyalam	35
4031	Nemili	35
4032	Nemilicheri	35
4033	Neripperichal	35
4034	Nerkunram	35
4035	Nerkuppai	35
4036	Nerunjipettai	35
4037	Neykkarappatti	35
4038	Neyveli	35
4039	Nidamangalam	35
4040	Nilagiri	35
4041	Nilakkottai	35
4042	Nilankarai	35
4043	Odaipatti	35
4044	Odaiyakulam	35
4045	Oddanchatram	35
4046	Odugathur	35
4047	Oggiyamduraipakkam	35
4048	Olagadam	35
4049	Omalur	35
4050	Ooty	35
4051	Orathanadu	35
4052	Othakadai	35
4053	Othakalmandapam	35
4054	Ottapparai	35
4055	Pacode	35
4056	Padaividu	35
4057	Padianallur	35
4058	Padirikuppam	35
4059	Padmanabhapuram	35
4060	Padririvedu	35
4061	Palaganangudy	35
4062	Palaimpatti	35
4063	Palakkodu	35
4064	Palamedu	35
4065	Palani	35
4066	Palani Chettipatti	35
4067	Palavakkam	35
4068	Palavansathu	35
4069	Palayakayal	35
4070	Palayam	35
4071	Palayamkottai	35
4072	Palladam	35
4073	Pallapalayam	35
4074	Pallapatti	35
4075	Pallattur	35
4076	Pallavaram	35
4077	Pallikaranai	35
4078	Pallikonda	35
4079	Pallipalaiyam	35
4080	Pallipalaiyam Agraharam	35
4081	Pallipattu	35
4082	Pammal	35
4083	Panagudi	35
4084	Panaimarathupatti	35
4085	Panapakkam	35
4086	Panboli	35
4087	Pandamangalam	35
4088	Pannaikadu	35
4089	Pannaipuram	35
4090	Pannuratti	35
4091	Panruti	35
4092	Papanasam	35
4093	Pappankurichi	35
4094	Papparapatti	35
4095	Pappireddipatti	35
4096	Paramakkudi	35
4097	Paramankurichi	35
4098	Paramathi	35
4099	Parangippettai	35
4100	Paravai	35
4101	Pasur	35
4102	Pathamadai	35
4103	Pattinam	35
4104	Pattiviranpatti	35
4105	Pattukkottai	35
4106	Pazhugal	35
4107	Pennadam	35
4108	Pennagaram	35
4109	Pennathur	35
4110	Peraiyur	35
4111	Peralam	35
4112	Perambalur	35
4113	Peranamallur	35
4114	Peravurani	35
4115	Periyakodiveri	35
4116	Periyakulam	35
4117	Periyanayakkanpalaiyam	35
4118	Periyanegamam	35
4119	Periyapatti	35
4120	Periyasemur	35
4121	Pernambut	35
4122	Perumagalur	35
4123	Perumandi	35
4124	Perumuchi	35
4125	Perundurai	35
4126	Perungalathur	35
4127	Perungudi	35
4128	Perungulam	35
4129	Perur	35
4130	Perur Chettipalaiyam	35
4131	Pethampalayam	35
4132	Pethanaickenpalayam	35
4133	Pillanallur	35
4134	Pirkankaranai	35
4135	Polichalur	35
4136	Pollachi	35
4137	Polur	35
4138	Ponmani	35
4139	Ponnamaravathi	35
4140	Ponnampatti	35
4141	Ponneri	35
4142	Porur	35
4143	Pothanur	35
4144	Pothatturpettai	35
4145	Pudukadai	35
4146	Pudukkottai Cantonment	35
4147	Pudukottai	35
4148	Pudupalaiyam Aghraharam	35
4149	Pudupalayam	35
4150	Pudupatti	35
4151	Pudupattinam	35
4152	Pudur	35
4153	Puduvayal	35
4154	Pulambadi	35
4155	Pulampatti	35
4156	Puliyampatti	35
4157	Puliyankudi	35
4158	Puliyur	35
4159	Pullampadi	35
4160	Puluvapatti	35
4161	Punamalli	35
4162	Punjai Puliyampatti	35
4163	Punjai Thottakurichi	35
4164	Punjaipugalur	35
4165	Puthalam	35
4166	Putteri	35
4167	Puvalur	35
4168	Puzhal	35
4169	Puzhithivakkam	35
4170	Rajapalayam	35
4171	Ramanathapuram	35
4172	Ramapuram	35
4173	Rameswaram	35
4174	Ranipet	35
4175	Rasipuram	35
4176	Rayagiri	35
4177	Rithapuram	35
4178	Rosalpatti	35
4179	Rudravathi	35
4180	Sadayankuppam	35
4181	Saint Thomas Mount	35
4182	Salangapalayam	35
4183	Salem	35
4184	Samalapuram	35
4185	Samathur	35
4186	Sambavar Vadagarai	35
4187	Sankaramanallur	35
4188	Sankarankoil	35
4189	Sankarapuram	35
4190	Sankari	35
4191	Sankarnagar	35
4192	Saravanampatti	35
4193	Sarcarsamakulam	35
4194	Sathiyavijayanagaram	35
4195	Sathuvachari	35
4196	Sathyamangalam	35
4197	Sattankulam	35
4198	Sattur	35
4199	Sayalgudi	35
4200	Sayapuram	35
4201	Seithur	35
4202	Sembakkam	35
4203	Semmipalayam	35
4204	Sennirkuppam	35
4205	Senthamangalam	35
4206	Sentharapatti	35
4207	Senur	35
4208	Sethiathoppu	35
4209	Sevilimedu	35
4210	Sevugampatti	35
4211	Shenbakkam	35
4212	Shencottai	35
4213	Shenkottai	35
4214	Sholavandan	35
4215	Sholinganallur	35
4216	Sholingur	35
4217	Sholur	35
4218	Sikkarayapuram	35
4219	Singampuneri	35
4220	Singanallur	35
4221	Singaperumalkoil	35
4222	Sirapalli	35
4223	Sirkali	35
4224	Sirugamani	35
4225	Sirumugai	35
4226	Sithayankottai	35
4227	Sithurajapuram	35
4228	Sivaganga	35
4229	Sivagiri	35
4230	Sivakasi	35
4231	Sivanthipuram	35
4232	Sivur	35
4233	Soranjeri	35
4234	South Kannanur	35
4235	South Kodikulam	35
4236	Srimushnam	35
4237	Sriperumpudur	35
4238	Sriramapuram	35
4239	Srirangam	35
4240	Srivaikuntam	35
4241	Srivilliputtur	35
4242	Suchindram	35
4243	Suliswaranpatti	35
4244	Sulur	35
4245	Sundarapandiam	35
4246	Sundarapandiapuram	35
4247	Surampatti	35
4248	Surandai	35
4249	Suriyampalayam	35
4250	Swamimalai	35
4251	TNPL Pugalur	35
4252	Tambaram	35
4253	Taramangalam	35
4254	Tattayyangarpettai	35
4255	Tayilupatti	35
4256	Tenkasi	35
4257	Thadikombu	35
4258	Thakkolam	35
4259	Thalainayar	35
4260	Thalakudi	35
4261	Thamaraikulam	35
4262	Thammampatti	35
4263	Thanjavur	35
4264	Thanthoni	35
4265	Tharangambadi	35
4266	Thedavur	35
4267	Thenambakkam	35
4268	Thengampudur	35
4269	Theni	35
4270	Theni Allinagaram	35
4271	Thenkarai	35
4272	Thenthamaraikulam	35
4273	Thenthiruperai	35
4274	Thesur	35
4275	Thevaram	35
4276	Thevur	35
4277	Thiagadurgam	35
4278	Thiagarajar Colony	35
4279	Thingalnagar	35
4280	Thiruchirapalli	35
4281	Thirukarungudi	35
4282	Thirukazhukundram	35
4283	Thirumalayampalayam	35
4284	Thirumazhisai	35
4285	Thirunagar	35
4286	Thirunageswaram	35
4287	Thirunindravur	35
4288	Thirunirmalai	35
4289	Thiruparankundram	35
4290	Thiruparappu	35
4291	Thiruporur	35
4292	Thiruppanandal	35
4293	Thirupuvanam	35
4294	Thiruthangal	35
4295	Thiruthuraipundi	35
4296	Thiruvaivaru	35
4297	Thiruvalam	35
4298	Thiruvarur	35
4299	Thiruvattaru	35
4300	Thiruvenkatam	35
4301	Thiruvennainallur	35
4302	Thiruvithankodu	35
4303	Thisayanvilai	35
4304	Thittacheri	35
4305	Thondamuthur	35
4306	Thorapadi	35
4307	Thottipalayam	35
4308	Thottiyam	35
4309	Thudiyalur	35
4310	Thuthipattu	35
4311	Thuvakudi	35
4312	Timiri	35
4313	Tindivanam	35
4314	Tinnanur	35
4315	Tiruchchendur	35
4316	Tiruchengode	35
4317	Tirukkalukkundram	35
4318	Tirukkattuppalli	35
4319	Tirukkoyilur	35
4320	Tirumangalam	35
4321	Tirumullaivasal	35
4322	Tirumuruganpundi	35
4323	Tirunageswaram	35
4324	Tirunelveli	35
4325	Tirupathur	35
4326	Tirupattur	35
4327	Tiruppuvanam	35
4328	Tirupur	35
4329	Tirusulam	35
4330	Tiruttani	35
4331	Tiruvallur	35
4332	Tiruvannamalai	35
4333	Tiruverambur	35
4334	Tiruverkadu	35
4335	Tiruvethipuram	35
4336	Tiruvidaimarudur	35
4337	Tiruvottiyur	35
4338	Tittakudi	35
4339	Tondi	35
4340	Turaiyur	35
4341	Tuticorin	35
4342	Udagamandalam	35
4343	Udagamandalam Valley	35
4344	Udankudi	35
4345	Udayarpalayam	35
4346	Udumalaipettai	35
4347	Udumalpet	35
4348	Ullur	35
4349	Ulundurpettai	35
4350	Unjalaur	35
4351	Unnamalaikadai	35
4352	Uppidamangalam	35
4353	Uppiliapuram	35
4354	Urachikkottai	35
4355	Urapakkam	35
4356	Usilampatti	35
4357	Uthangarai	35
4358	Uthayendram	35
4359	Uthiramerur	35
4360	Uthukkottai	35
4361	Uttamapalaiyam	35
4362	Uttukkuli	35
4363	Vadakarai Kizhpadugai	35
4364	Vadakkanandal	35
4365	Vadakku Valliyur	35
4366	Vadalur	35
4367	Vadamadurai	35
4368	Vadavalli	35
4369	Vadipatti	35
4370	Vadugapatti	35
4371	Vaithiswarankoil	35
4372	Valangaiman	35
4373	Valasaravakkam	35
4374	Valavanur	35
4375	Vallam	35
4376	Valparai	35
4377	Valvaithankoshtam	35
4378	Vanavasi	35
4379	Vandalur	35
4380	Vandavasi	35
4381	Vandiyur	35
4382	Vaniputhur	35
4383	Vaniyambadi	35
4384	Varadarajanpettai	35
4385	Varadharajapuram	35
4386	Vasudevanallur	35
4387	Vathirairuppu	35
4388	Vattalkundu	35
4389	Vazhapadi	35
4390	Vedapatti	35
4391	Vedaranniyam	35
4392	Vedasandur	35
4393	Velampalaiyam	35
4394	Velankanni	35
4395	Vellakinar	35
4396	Vellakoil	35
4397	Vellalapatti	35
4398	Vellalur	35
4399	Vellanur	35
4400	Vellimalai	35
4401	Vellore	35
4402	Vellottamparappu	35
4403	Velluru	35
4404	Vengampudur	35
4405	Vengathur	35
4406	Vengavasal	35
4407	Venghatur	35
4408	Venkarai	35
4409	Vennanthur	35
4410	Veppathur	35
4411	Verkilambi	35
4412	Vettaikaranpudur	35
4413	Vettavalam	35
4414	Vijayapuri	35
4415	Vikramasingapuram	35
4416	Vikravandi	35
4417	Vilangudi	35
4418	Vilankurichi	35
4419	Vilapakkam	35
4420	Vilathikulam	35
4421	Vilavur	35
4422	Villukuri	35
4423	Villupuram	35
4424	Viraganur	35
4425	Virakeralam	35
4426	Virakkalpudur	35
4427	Virapandi	35
4428	Virapandi Cantonment	35
4429	Virappanchatram	35
4430	Viravanallur	35
4431	Virudambattu	35
4432	Virudhachalam	35
4433	Virudhunagar	35
4434	Virupakshipuram	35
4435	Viswanatham	35
4436	Vriddhachalam	35
4437	Walajabad	35
4438	Walajapet	35
4439	Wellington	35
4440	Yercaud	35
4441	Zamin Uthukuli	35
4442	Achampet	36
4443	Adilabad	36
4444	Armoor	36
4445	Asifabad	36
4446	Badepally	36
4447	Banswada	36
4448	Bellampalli	36
4449	Bhadrachalam	36
4450	Bhainsa	36
4451	Bhongir	36
4452	Bhupalpally	36
4453	Bodhan	36
4454	Bollaram	36
4455	Devarkonda	36
4456	Farooqnagar	36
4457	Gadwal	36
4458	Gajwel	36
4459	Ghatkesar	36
4460	Hyderabad	36
4461	Jagtial	36
4462	Jangaon	36
4463	Kagaznagar	36
4464	Kalwakurthy	36
4465	Kamareddy	36
4466	Karimnagar	36
4467	Khammam	36
4468	Kodada	36
4469	Koratla	36
4470	Kottagudem	36
4471	Kyathampalle	36
4472	Madhira	36
4473	Mahabubabad	36
4474	Mahbubnagar	36
4475	Mancherial	36
4476	Mandamarri	36
4477	Manuguru	36
4478	Medak	36
4479	Medchal	36
4480	Miryalaguda	36
4481	Nagar Karnul	36
4482	Nakrekal	36
4483	Nalgonda	36
4484	Narayanpet	36
4485	Narsampet	36
4486	Nirmal	36
4487	Nizamabad	36
4488	Palwancha	36
4489	Peddapalli	36
4490	Ramagundam	36
4491	Ranga Reddy district	36
4492	Sadasivpet	36
4493	Sangareddy	36
4494	Sarapaka	36
4495	Sathupalle	36
4496	Secunderabad	36
4497	Siddipet	36
4498	Singapur	36
4499	Sircilla	36
4500	Suryapet	36
4501	Tandur	36
4502	Vemulawada	36
4503	Vikarabad	36
4504	Wanaparthy	36
4505	Warangal	36
4506	Yellandu	36
4507	Zahirabad	36
4508	Agartala	37
4509	Amarpur	37
4510	Ambassa	37
4511	Badharghat	37
4512	Belonia	37
4513	Dharmanagar	37
4514	Gakulnagar	37
4515	Gandhigram	37
4516	Indranagar	37
4517	Jogendranagar	37
4518	Kailasahar	37
4519	Kamalpur	37
4520	Kanchanpur	37
4521	Khowai	37
4522	Kumarghat	37
4523	Kunjaban	37
4524	Narsingarh	37
4525	Pratapgarh	37
4526	Ranir Bazar	37
4527	Sabrum	37
4528	Sonamura	37
4529	Teliamura	37
4530	Udaipur	37
4531	Achhalda	38
4532	Achhnera	38
4533	Adari	38
4534	Afzalgarh	38
4535	Agarwal Mandi	38
4536	Agra	38
4537	Agra Cantonment	38
4538	Ahraura	38
4539	Ailum	38
4540	Air Force Area	38
4541	Ajhuwa	38
4542	Akbarpur	38
4543	Alapur	38
4544	Aliganj	38
4545	Aligarh	38
4546	Allahabad	38
4547	Allahabad Cantonment	38
4548	Allahganj	38
4549	Amanpur	38
4550	Ambahta	38
4551	Amethi	38
4552	Amila	38
4553	Amilo	38
4554	Aminagar Sarai	38
4555	Aminagar Urf Bhurbaral	38
4556	Amraudha	38
4557	Amroha	38
4558	Anandnagar	38
4559	Anpara	38
4560	Antu	38
4561	Anupshahr	38
4562	Aonla	38
4563	Armapur Estate	38
4564	Ashokpuram	38
4565	Ashrafpur Kichhauchha	38
4566	Atarra	38
4567	Atasu	38
4568	Atrauli	38
4569	Atraulia	38
4570	Auraiya	38
4571	Aurangabad	38
4572	Aurangabad Bangar	38
4573	Auras	38
4574	Awagarh	38
4575	Ayodhya	38
4576	Azamgarh	38
4577	Azizpur	38
4578	Azmatgarh	38
4579	Babarpur Ajitmal	38
4580	Baberu	38
4581	Babina	38
4582	Babrala	38
4583	Babugarh	38
4584	Bachhiowan	38
4585	Bachhraon	38
4586	Bad	38
4587	Badaun	38
4588	Baghpat	38
4589	Bah	38
4590	Bahadurganj	38
4591	Baheri	38
4592	Bahjoi	38
4593	Bahraich	38
4594	Bahsuma	38
4595	Bahua	38
4596	Bajna	38
4597	Bakewar	38
4598	Bakiabad	38
4599	Baldeo	38
4600	Ballia	38
4601	Balrampur	38
4602	Banat	38
4603	Banda	38
4604	Bangarmau	38
4605	Banki	38
4606	Bansdih	38
4607	Bansgaon	38
4608	Bansi	38
4609	Barabanki	38
4610	Baragaon	38
4611	Baraut	38
4612	Bareilly	38
4613	Bareilly Cantonment	38
4614	Barhalganj	38
4615	Barhani	38
4616	Barhapur	38
4617	Barkhera	38
4618	Barsana	38
4619	Barva Sagar	38
4620	Barwar	38
4621	Basti	38
4622	Begumabad Budhana	38
4623	Behat	38
4624	Behta Hajipur	38
4625	Bela	38
4626	Belthara	38
4627	Beniganj	38
4628	Beswan	38
4629	Bewar	38
4630	Bhadarsa	38
4631	Bhadohi	38
4632	Bhagwantnagar	38
4633	Bharatganj	38
4634	Bhargain	38
4635	Bharthana	38
4636	Bharuhana	38
4637	Bharwari	38
4638	Bhatni Bazar	38
4639	Bhatpar Rani	38
4640	Bhawan Bahadurnagar	38
4641	Bhinga	38
4642	Bhojpur Dharampur	38
4643	Bhokarhedi	38
4644	Bhongaon	38
4645	Bhulepur	38
4646	Bidhuna	38
4647	Bighapur	38
4648	Bijnor	38
4649	Bijpur	38
4650	Bikapur	38
4651	Bilari	38
4652	Bilaspur	38
4653	Bilgram	38
4654	Bilhaur	38
4655	Bilram	38
4656	Bilrayaganj	38
4657	Bilsanda	38
4658	Bilsi	38
4659	Bindki	38
4660	Bisalpur	38
4661	Bisanda Buzurg	38
4662	Bisauli	38
4663	Bisharatganj	38
4664	Bisokhar	38
4665	Biswan	38
4666	Bithur	38
4667	Budaun	38
4668	Bugrasi	38
4669	Bulandshahar	38
4670	Burhana	38
4671	Chail	38
4672	Chak Imam Ali	38
4673	Chakeri	38
4674	Chakia	38
4675	Chandauli	38
4676	Chandausi	38
4677	Chandpur	38
4678	Charkhari	38
4679	Charthawal	38
4680	Chaumuhan	38
4681	Chhaprauli	38
4682	Chhara Rafatpur	38
4683	Chharprauli	38
4684	Chhata	38
4685	Chhatari	38
4686	Chhibramau	38
4687	Chhutmalpur	38
4688	Chilkana Sultanpur	38
4689	Chirgaon	38
4690	Chit Baragaon	38
4691	Chitrakut Dham	38
4692	Chopan	38
4693	Choubepur Kalan	38
4694	Chunar	38
4695	Churk Ghurma	38
4696	Colonelganj	38
4697	Dadri	38
4698	Dalmau	38
4699	Dankaur	38
4700	Dariyabad	38
4701	Dasna	38
4702	Dataganj	38
4703	Daurala	38
4704	Dayal Bagh	38
4705	Deoband	38
4706	Deoranian	38
4707	Deoria	38
4708	Dewa	38
4709	Dhampur	38
4710	Dhanauha	38
4711	Dhanauli	38
4712	Dhanaura	38
4713	Dharoti Khurd	38
4714	Dhauratanda	38
4715	Dhaurhra	38
4716	Dibai	38
4717	Dibiyapur	38
4718	Dildarnagar Fatehpur	38
4719	Do Ghat	38
4720	Dohrighat	38
4721	Dostpur	38
4722	Dudhinagar	38
4723	Dulhipur	38
4724	Dundwaraganj	38
4725	Ekdil	38
4726	Erich	38
4727	Etah	38
4728	Etawah	38
4729	Faizabad	38
4730	Faizabad Cantonment	38
4731	Faizganj	38
4732	Farah	38
4733	Faridnagar	38
4734	Faridpur	38
4735	Faridpur Cantonment	38
4736	Fariha	38
4737	Farrukhabad	38
4738	Fatehabad	38
4739	Fatehganj Pashchimi	38
4740	Fatehganj Purvi	38
4741	Fatehgarh	38
4742	Fatehpur	38
4743	Fatehpur Chaurasi	38
4744	Fatehpur Sikri	38
4745	Firozabad	38
4746	Gajraula	38
4747	Ganga Ghat	38
4748	Gangapur	38
4749	Gangoh	38
4750	Ganj Muradabad	38
4751	Garautha	38
4752	Garhi Pukhta	38
4753	Garhmukteshwar	38
4754	Gaura Barahaj	38
4755	Gauri Bazar	38
4756	Gausganj	38
4757	Gawan	38
4758	Ghatampur	38
4759	Ghaziabad	38
4760	Ghazipur	38
4761	Ghiror	38
4762	Ghorawal	38
4763	Ghosi	38
4764	Ghosia Bazar	38
4765	Ghughuli	38
4766	Gohand	38
4767	Gokul	38
4768	Gola Bazar	38
4769	Gola Gokarannath	38
4770	Gonda	38
4771	Gopamau	38
4772	Gopiganj	38
4773	Gorakhpur	38
4774	Gosainganj	38
4775	Govardhan	38
4776	Greater Noida	38
4777	Gulaothi	38
4778	Gulariya	38
4779	Gulariya Bhindara	38
4780	Gunnaur	38
4781	Gursahaiganj	38
4782	Gursarai	38
4783	Gyanpur	38
4784	Hafizpur	38
4785	Haidergarh	38
4786	Haldaur	38
4787	Hamirpur	38
4788	Handia	38
4789	Hapur	38
4790	Hardoi	38
4791	Harduaganj	38
4792	Hargaon	38
4793	Hariharpur	38
4794	Harraiya	38
4795	Hasanpur	38
4796	Hasayan	38
4797	Hastinapur	38
4798	Hata	38
4799	Hathras	38
4800	Hyderabad	38
4801	Ibrahimpur	38
4802	Iglas	38
4803	Ikauna	38
4804	Iltifatganj Bazar	38
4805	Indian Telephone Industry Mank	38
4806	Islamnagar	38
4807	Itaunja	38
4808	Itimadpur	38
4809	Jagner	38
4810	Jahanabad	38
4811	Jahangirabad	38
4812	Jahangirpur	38
4813	Jais	38
4814	Jaithara	38
4815	Jalalabad	38
4816	Jalali	38
4817	Jalalpur	38
4818	Jalaun	38
4819	Jalesar	38
4820	Jamshila	38
4821	Jangipur	38
4822	Jansath	38
4823	Jarwal	38
4824	Jasrana	38
4825	Jaswantnagar	38
4826	Jatari	38
4827	Jaunpur	38
4828	Jewar	38
4829	Jhalu	38
4830	Jhansi	38
4831	Jhansi Cantonment	38
4832	Jhansi Railway Settlement	38
4833	Jhinjhak	38
4834	Jhinjhana	38
4835	Jhusi	38
4836	Jhusi Kohna	38
4837	Jiyanpur	38
4838	Joya	38
4839	Jyoti Khuria	38
4840	Jyotiba Phule Nagar	38
4841	Kabrai	38
4842	Kachhauna Patseni	38
4843	Kachhla	38
4844	Kachhwa	38
4845	Kadaura	38
4846	Kadipur	38
4847	Kailashpur	38
4848	Kaimganj	38
4849	Kairana	38
4850	Kakgaina	38
4851	Kakod	38
4852	Kakori	38
4853	Kakrala	38
4854	Kalinagar	38
4855	Kalpi	38
4856	Kamalganj	38
4857	Kampil	38
4858	Kandhla	38
4859	Kandwa	38
4860	Kannauj	38
4861	Kanpur	38
4862	Kant	38
4863	Kanth	38
4864	Kaptanganj	38
4865	Karaon	38
4866	Karari	38
4867	Karhal	38
4868	Karnawal	38
4869	Kasganj	38
4870	Katariya	38
4871	Katghar Lalganj	38
4872	Kathera	38
4873	Katra	38
4874	Katra Medniganj	38
4875	Kauriaganj	38
4876	Kemri	38
4877	Kerakat	38
4878	Khadda	38
4879	Khaga	38
4880	Khailar	38
4881	Khair	38
4882	Khairabad	38
4883	Khairagarh	38
4884	Khalilabad	38
4885	Khamaria	38
4886	Khanpur	38
4887	Kharela	38
4888	Khargupur	38
4889	Khariya	38
4890	Kharkhoda	38
4891	Khatauli	38
4892	Khatauli Rural	38
4893	Khekra	38
4894	Kheri	38
4895	Kheta Sarai	38
4896	Khudaganj	38
4897	Khurja	38
4898	Khutar	38
4899	Kiraoli	38
4900	Kiratpur	38
4901	Kishanpur	38
4902	Kishni	38
4903	Kithaur	38
4904	Koiripur	38
4905	Konch	38
4906	Kopaganj	38
4907	Kora Jahanabad	38
4908	Korwa	38
4909	Kosi Kalan	38
4910	Kota	38
4911	Kotra	38
4912	Kotwa	38
4913	Kulpahar	38
4914	Kunda	38
4915	Kundarki	38
4916	Kunwargaon	38
4917	Kurara	38
4918	Kurawali	38
4919	Kursath	38
4920	Kurthi Jafarpur	38
4921	Kushinagar	38
4922	Kusmara	38
4923	Laharpur	38
4924	Lakhimpur	38
4925	Lakhna	38
4926	Lalganj	38
4927	Lalitpur	38
4928	Lar	38
4929	Lawar	38
4930	Ledwa Mahuwa	38
4931	Lohta	38
4932	Loni	38
4933	Lucknow	38
4934	Machhlishahr	38
4935	Madhoganj	38
4936	Madhogarh	38
4937	Maghar	38
4938	Mahaban	38
4939	Maharajganj	38
4940	Mahmudabad	38
4941	Mahoba	38
4942	Maholi	38
4943	Mahona	38
4944	Mahroni	38
4945	Mailani	38
4946	Mainpuri	38
4947	Majhara Pipar Ehatmali	38
4948	Majhauli Raj	38
4949	Malihabad	38
4950	Mallanwam	38
4951	Mandawar	38
4952	Manikpur	38
4953	Maniyar	38
4954	Manjhanpur	38
4955	Mankapur	38
4956	Marehra	38
4957	Mariahu	38
4958	Maruadih	38
4959	Maswasi	38
4960	Mataundh	38
4961	Mathu	38
4962	Mathura	38
4963	Mathura Cantonment	38
4964	Mau	38
4965	Mau Aima	38
4966	Maudaha	38
4967	Mauranipur	38
4968	Maurawan	38
4969	Mawana	38
4970	Meerut	38
4971	Mehnagar	38
4972	Mehndawal	38
4973	Mendu	38
4974	Milak	38
4975	Miranpur	38
4976	Mirat	38
4977	Mirat Cantonment	38
4978	Mirganj	38
4979	Mirzapur	38
4980	Misrikh	38
4981	Modinagar	38
4982	Mogra Badshahpur	38
4983	Mohan	38
4984	Mohanpur	38
4985	Mohiuddinpur	38
4986	Moradabad	38
4987	Moth	38
4988	Mubarakpur	38
4989	Mughal Sarai	38
4990	Mughal Sarai Railway Settlemen	38
4991	Muhammadabad	38
4992	Muhammadi	38
4993	Mukrampur Khema	38
4994	Mundia	38
4995	Mundora	38
4996	Muradnagar	38
4997	Mursan	38
4998	Musafirkhana	38
4999	Muzaffarnagar	38
5000	Nadigaon	38
5001	Nagina	38
5002	Nagram	38
5003	Nai Bazar	38
5004	Nainana Jat	38
5005	Najibabad	38
5006	Nakur	38
5007	Nanaunta	38
5008	Nandgaon	38
5009	Nanpara	38
5010	Naraini	38
5011	Narauli	38
5012	Naraura	38
5013	Naugawan Sadat	38
5014	Nautanwa	38
5015	Nawabganj	38
5016	Nichlaul	38
5017	Nidhauli Kalan	38
5018	Nihtaur	38
5019	Nindaura	38
5020	Niwari	38
5021	Nizamabad	38
5022	Noida	38
5023	Northern Railway Colony	38
5024	Nurpur	38
5025	Nyoria Husenpur	38
5026	Nyotini	38
5027	Obra	38
5028	Oel Dhakwa	38
5029	Orai	38
5030	Oran	38
5031	Ordinance Factory Muradnagar	38
5032	Pachperwa	38
5033	Padrauna	38
5034	Pahasu	38
5035	Paintepur	38
5036	Pali	38
5037	Palia Kalan	38
5038	Parasi	38
5039	Parichha	38
5040	Parichhatgarh	38
5041	Parsadepur	38
5042	Patala	38
5043	Patiyali	38
5044	Patti	38
5045	Pawayan	38
5046	Phalauda	38
5047	Phaphund	38
5048	Phulpur	38
5049	Phulwaria	38
5050	Pihani	38
5051	Pilibhit	38
5052	Pilkana	38
5053	Pilkhuwa	38
5054	Pinahat	38
5055	Pipalsana Chaudhari	38
5056	Pipiganj	38
5057	Pipraich	38
5058	Pipri	38
5059	Pratapgarh	38
5060	Pukhrayan	38
5061	Puranpur	38
5062	Purdil Nagar	38
5063	Purqazi	38
5064	Purwa	38
5065	Qasimpur	38
5066	Rabupura	38
5067	Radha Kund	38
5068	Rae Bareilly	38
5069	Raja Ka Rampur	38
5070	Rajapur	38
5071	Ramkola	38
5072	Ramnagar	38
5073	Rampur	38
5074	Rampur Bhawanipur	38
5075	Rampur Karkhana	38
5076	Rampur Maniharan	38
5077	Rampura	38
5078	Ranipur	38
5079	Rashidpur Garhi	38
5080	Rasra	38
5081	Rasulabad	38
5082	Rath	38
5083	Raya	38
5084	Renukut	38
5085	Reoti	38
5086	Richha	38
5087	Risia Bazar	38
5088	Rithora	38
5089	Robertsganj	38
5090	Roza	38
5091	Rudarpur	38
5092	Rudauli	38
5093	Rudayan	38
5094	Rura	38
5095	Rustamnagar Sahaspur	38
5096	Sabatwar	38
5097	Sadabad	38
5098	Sadat	38
5099	Safipur	38
5100	Sahanpur	38
5101	Saharanpur	38
5102	Sahaspur	38
5103	Sahaswan	38
5104	Sahawar	38
5105	Sahibabad	38
5106	Sahjanwa	38
5107	Sahpau	38
5108	Saidpur	38
5109	Sainthal	38
5110	Saiyadraja	38
5111	Sakhanu	38
5112	Sakit	38
5113	Salarpur Khadar	38
5114	Salimpur	38
5115	Salon	38
5116	Sambhal	38
5117	Sambhawali	38
5118	Samdhan	38
5119	Samthar	38
5120	Sandi	38
5121	Sandila	38
5122	Sarai Mir	38
5123	Sarai akil	38
5124	Sarauli	38
5125	Sardhana	38
5126	Sarila	38
5127	Sarsawan	38
5128	Sasni	38
5129	Satrikh	38
5130	Saunkh	38
5131	Saurikh	38
5132	Seohara	38
5133	Sewal Khas	38
5134	Sewarhi	38
5135	Shahabad	38
5136	Shahganj	38
5137	Shahi	38
5138	Shahjahanpur	38
5139	Shahjahanpur Cantonment	38
5140	Shahpur	38
5141	Shamli	38
5142	Shamsabad	38
5143	Shankargarh	38
5144	Shergarh	38
5145	Sherkot	38
5146	Shikarpur	38
5147	Shikohabad	38
5148	Shisgarh	38
5149	Shivdaspur	38
5150	Shivli	38
5151	Shivrajpur	38
5152	Shohratgarh	38
5153	Siddhanur	38
5154	Siddharthnagar	38
5155	Sidhauli	38
5156	Sidhpura	38
5157	Sikandarabad	38
5158	Sikandarpur	38
5159	Sikandra	38
5160	Sikandra Rao	38
5161	Singahi Bhiraura	38
5162	Sirathu	38
5163	Sirsa	38
5164	Sirsaganj	38
5165	Sirsi	38
5166	Sisauli	38
5167	Siswa Bazar	38
5168	Sitapur	38
5169	Siyana	38
5170	Som	38
5171	Sonbhadra	38
5172	Soron	38
5173	Suar	38
5174	Sukhmalpur Nizamabad	38
5175	Sultanpur	38
5176	Sumerpur	38
5177	Suriyawan	38
5178	Swamibagh	38
5179	Tajpur	38
5180	Talbahat	38
5181	Talgram	38
5182	Tambaur	38
5183	Tanda	38
5184	Tatarpur Lallu	38
5185	Tetribazar	38
5186	Thakurdwara	38
5187	Thana Bhawan	38
5188	Thiriya Nizamat Khan	38
5189	Tikaitnagar	38
5190	Tikri	38
5191	Tilhar	38
5192	Tindwari	38
5193	Tirwaganj	38
5194	Titron	38
5195	Tori Fatehpur	38
5196	Tulsipur	38
5197	Tundla	38
5198	Tundla Kham	38
5199	Tundla Railway Colony	38
5200	Ugu	38
5201	Ujhani	38
5202	Ujhari	38
5203	Umri	38
5204	Umri Kalan	38
5205	Un	38
5206	Unchahar	38
5207	Unnao	38
5208	Usaihat	38
5209	Usawan	38
5210	Utraula	38
5211	Varanasi	38
5212	Varanasi Cantonment	38
5213	Vijaigarh	38
5214	Vrindavan	38
5215	Wazirganj	38
5216	Zafarabad	38
5217	Zaidpur	38
5218	Zamania	38
5219	Almora	39
5220	Almora Cantonment	39
5221	Badrinathpuri	39
5222	Bageshwar	39
5223	Bah Bazar	39
5224	Banbasa	39
5225	Bandia	39
5226	Barkot	39
5227	Bazpur	39
5228	Bhim Tal	39
5229	Bhowali	39
5230	Chakrata	39
5231	Chamba	39
5232	Chamoli and Gopeshwar	39
5233	Champawat	39
5234	Clement Town	39
5235	Dehra Dun Cantonment	39
5236	Dehradun	39
5237	Dehrakhas	39
5238	Devaprayag	39
5239	Dhaluwala	39
5240	Dhandera	39
5241	Dharchula	39
5242	Dharchula Dehat	39
5243	Didihat	39
5244	Dineshpur	39
5245	Doiwala	39
5246	Dugadda	39
5247	Dwarahat	39
5248	Gadarpur	39
5249	Gangotri	39
5250	Gauchar	39
5251	Haldwani	39
5252	Haridwar	39
5253	Herbertpur	39
5254	Jaspur	39
5255	Jhabrera	39
5256	Joshimath	39
5257	Kachnal Gosain	39
5258	Kaladungi	39
5259	Kalagarh	39
5260	Karnaprayang	39
5261	Kashipur	39
5262	Kashirampur	39
5263	Kausani	39
5264	Kedarnath	39
5265	Kelakhera	39
5266	Khatima	39
5267	Kichha	39
5268	Kirtinagar	39
5269	Kotdwara	39
5270	Laksar	39
5271	Lalkuan	39
5272	Landaura	39
5273	Landhaura Cantonment	39
5274	Lensdaun	39
5275	Logahat	39
5276	Mahua Dabra Haripura	39
5277	Mahua Kheraganj	39
5278	Manglaur	39
5279	Masuri	39
5280	Mohanpur Mohammadpur	39
5281	Muni Ki Reti	39
5282	Nagla	39
5283	Nainital	39
5284	Nainital Cantonment	39
5285	Nandaprayang	39
5286	Narendranagar	39
5287	Pauri	39
5288	Pithoragarh	39
5289	Pratitnagar	39
5290	Raipur	39
5291	Raiwala	39
5292	Ramnagar	39
5293	Ranikhet	39
5294	Ranipur	39
5295	Rishikesh	39
5296	Rishikesh Cantonment	39
5297	Roorkee	39
5298	Rudraprayag	39
5299	Rudrapur	39
5300	Rurki	39
5301	Rurki Cantonment	39
5302	Shaktigarh	39
5303	Sitarganj	39
5304	Srinagar	39
5305	Sultanpur	39
5306	Tanakpur	39
5307	Tehri	39
5308	Udham Singh Nagar	39
5309	Uttarkashi	39
5310	Vikasnagar	39
5311	Virbhadra	39
5312	24 Parganas (n)	41
5313	24 Parganas (s)	41
5314	Adra	41
5315	Ahmadpur	41
5316	Aiho	41
5317	Aistala	41
5318	Alipur Duar	41
5319	Alipur Duar Railway Junction	41
5320	Alpur	41
5321	Amalhara	41
5322	Amkula	41
5323	Amlagora	41
5324	Amodghata	41
5325	Amtala	41
5326	Andul	41
5327	Anksa	41
5328	Ankurhati	41
5329	Anup Nagar	41
5330	Arambagh	41
5331	Argari	41
5332	Arsha	41
5333	Asansol	41
5334	Ashoknagar Kalyangarh	41
5335	Aurangabad	41
5336	Bablari Dewanganj	41
5337	Badhagachhi	41
5338	Baduria	41
5339	Baghdogra	41
5340	Bagnan	41
5341	Bagra	41
5342	Bagula	41
5343	Baharampur	41
5344	Bahirgram	41
5345	Bahula	41
5346	Baidyabati	41
5347	Bairatisal	41
5348	Baj Baj	41
5349	Bakreswar	41
5350	Balaram Pota	41
5351	Balarampur	41
5352	Bali Chak	41
5353	Ballavpur	41
5354	Bally	41
5355	Balurghat	41
5356	Bamunari	41
5357	Banarhat Tea Garden	41
5358	Bandel	41
5359	Bangaon	41
5360	Bankra	41
5361	Bankura	41
5362	Bansbaria	41
5363	Banshra	41
5364	Banupur	41
5365	Bara Bamonia	41
5366	Barakpur	41
5367	Barakpur Cantonment	41
5368	Baranagar	41
5369	Barasat	41
5370	Barddhaman	41
5371	Barijhati	41
5372	Barjora	41
5373	Barrackpore	41
5374	Baruihuda	41
5375	Baruipur	41
5376	Barunda	41
5377	Basirhat	41
5378	Baska	41
5379	Begampur	41
5380	Beldanga	41
5381	Beldubi	41
5382	Belebathan	41
5383	Beliator	41
5384	Bhadreswar	41
5385	Bhandardaha	41
5386	Bhangar Raghunathpur	41
5387	Bhangri Pratham Khanda	41
5388	Bhanowara	41
5389	Bhatpara	41
5390	Bholar Dabri	41
5391	Bidhannagar	41
5392	Bidyadharpur	41
5393	Biki Hakola	41
5394	Bilandapur	41
5395	Bilpahari	41
5396	Bipra Noapara	41
5397	Birlapur	41
5398	Birnagar	41
5399	Bisarpara	41
5400	Bishnupur	41
5401	Bolpur	41
5402	Bongaon	41
5403	Bowali	41
5404	Burdwan	41
5405	Canning	41
5406	Cart Road	41
5407	Chachanda	41
5408	Chak Bankola	41
5409	Chak Enayetnagar	41
5410	Chak Kashipur	41
5411	Chakalampur	41
5412	Chakbansberia	41
5413	Chakdaha	41
5414	Chakpara	41
5415	Champahati	41
5416	Champdani	41
5417	Chamrail	41
5418	Chandannagar	41
5419	Chandpur	41
5420	Chandrakona	41
5421	Chapari	41
5422	Chapui	41
5423	Char Brahmanagar	41
5424	Char Maijdia	41
5425	Charka	41
5426	Chata Kalikapur	41
5427	Chauhati	41
5428	Checha Khata	41
5429	Chelad	41
5430	Chhora	41
5431	Chikrand	41
5432	Chittaranjan	41
5433	Contai	41
5434	Cooch Behar	41
5435	Dainhat	41
5436	Dakshin Baguan	41
5437	Dakshin Jhapardaha	41
5438	Dakshin Rajyadharpur	41
5439	Dakshin Raypur	41
5440	Dalkola	41
5441	Dalurband	41
5442	Darap Pur	41
5443	Darjiling	41
5444	Daulatpur	41
5445	Debipur	41
5446	Defahat	41
5447	Deora	41
5448	Deulia	41
5449	Dhakuria	41
5450	Dhandadihi	41
5451	Dhanyakuria	41
5452	Dharmapur	41
5453	Dhatri Gram	41
5454	Dhuilya	41
5455	Dhulagari	41
5456	Dhulian	41
5457	Dhupgari	41
5458	Dhusaripara	41
5459	Diamond Harbour	41
5460	Digha	41
5461	Dignala	41
5462	Dinhata	41
5463	Dubrajpur	41
5464	Dumjor	41
5465	Durgapur	41
5466	Durllabhganj	41
5467	Egra	41
5468	Eksara	41
5469	Falakata	41
5470	Farakka	41
5471	Fatellapur	41
5472	Fort Gloster	41
5473	Gabberia	41
5474	Gadigachha	41
5475	Gairkata	41
5476	Gangarampur	41
5477	Garalgachha	41
5478	Garbeta Amlagora	41
5479	Garhbeta	41
5480	Garshyamnagar	41
5481	Garui	41
5482	Garulia	41
5483	Gayespur	41
5484	Ghatal	41
5485	Ghorsala	41
5486	Goaljan	41
5487	Goasafat	41
5488	Gobardanga	41
5489	Gobindapur	41
5490	Gopalpur	41
5491	Gopinathpur	41
5492	Gora Bazar	41
5493	Guma	41
5494	Gurdaha	41
5495	Guriahati	41
5496	Guskhara	41
5497	Habra	41
5498	Haldia	41
5499	Haldibari	41
5500	Halisahar	41
5501	Haora	41
5502	Harharia Chak	41
5503	Harindanga	41
5504	Haringhata	41
5505	Haripur	41
5506	Harishpur	41
5507	Hatgachha	41
5508	Hatsimla	41
5509	Hijuli	41
5510	Hindustan Cables Town	41
5511	Hooghly	41
5512	Howrah	41
5513	Hugli-Chunchura	41
5514	Humaipur	41
5515	Ichha Pur Defence Estate	41
5516	Ingraj Bazar	41
5517	Islampur	41
5518	Jafarpur	41
5519	Jagadanandapur	41
5520	Jagdishpur	41
5521	Jagtaj	41
5522	Jala Kendua	41
5523	Jaldhaka	41
5524	Jalkhura	41
5525	Jalpaiguri	41
5526	Jamuria	41
5527	Jangipur	41
5528	Jaygaon	41
5529	Jaynagar-Majilpur	41
5530	Jemari	41
5531	Jemari Township	41
5532	Jetia	41
5533	Jhalida	41
5534	Jhargram	41
5535	Jhorhat	41
5536	Jiaganj-Azimganj	41
5537	Joka	41
5538	Jot Kamal	41
5539	Kachu Pukur	41
5540	Kajora	41
5541	Kakdihi	41
5542	Kakdwip	41
5543	Kalaikunda	41
5544	Kalara	41
5545	Kalimpong	41
5546	Kaliyaganj	41
5547	Kalna	41
5548	Kalyani	41
5549	Kamarhati	41
5550	Kanaipur	41
5551	Kanchrapara	41
5552	Kandi	41
5553	Kanki	41
5554	Kankuria	41
5555	Kantlia	41
5556	Kanyanagar	41
5557	Karimpur	41
5558	Karsiyang	41
5559	Kasba	41
5560	Kasimbazar	41
5561	Katwa	41
5562	Kaugachhi	41
5563	Kenda	41
5564	Kendra Khottamdi	41
5565	Kendua	41
5566	Kesabpur	41
5567	Khagrabari	41
5568	Khalia	41
5569	Khalor	41
5570	Khandra	41
5571	Khantora	41
5572	Kharagpur	41
5573	Kharagpur Railway Settlement	41
5574	Kharar	41
5575	Khardaha	41
5576	Khari Mala Khagrabari	41
5577	Kharsarai	41
5578	Khatra	41
5579	Khodarampur	41
5580	Kodalia	41
5581	Kolaghat	41
5582	Kolaghat Thermal Power Project	41
5583	Kolkata	41
5584	Konardihi	41
5585	Konnogar	41
5586	Krishnanagar	41
5587	Krishnapur	41
5588	Kshidirpur	41
5589	Kshirpai	41
5590	Kulihanda	41
5591	Kulti	41
5592	Kunustara	41
5593	Kuperskem	41
5594	Madanpur	41
5595	Madhusudanpur	41
5596	Madhyamgram	41
5597	Maheshtala	41
5598	Mahiari	41
5599	Mahikpur	41
5600	Mahira	41
5601	Mahishadal	41
5602	Mainaguri	41
5603	Makardaha	41
5604	Mal	41
5605	Malda	41
5606	Mandarbani	41
5607	Mansinhapur	41
5608	Masila	41
5609	Maslandapur	41
5610	Mathabhanga	41
5611	Mekliganj	41
5612	Memari	41
5613	Midnapur	41
5614	Mirik	41
5615	Monoharpur	41
5616	Mrigala	41
5617	Muragachha	41
5618	Murgathaul	41
5619	Murshidabad	41
5620	Nabadhai Dutta Pukur	41
5621	Nabagram	41
5622	Nabgram	41
5623	Nachhratpur Katabari	41
5624	Nadia	41
5625	Naihati	41
5626	Nalhati	41
5627	Nasra	41
5628	Natibpur	41
5629	Naupala	41
5630	Navadwip	41
5631	Nebadhai Duttapukur	41
5632	New Barrackpore	41
5633	Ni Barakpur	41
5634	Nibra	41
5635	Noapara	41
5636	Nokpul	41
5637	North Barakpur	41
5638	Odlabari	41
5639	Old Maldah	41
5640	Ondal	41
5641	Pairagachha	41
5642	Palashban	41
5643	Panchla	41
5644	Panchpara	41
5645	Pandua	41
5646	Pangachhiya	41
5647	Paniara	41
5648	Panihati	41
5649	Panuhat	41
5650	Par Beliya	41
5651	Parashkol	41
5652	Parasia	41
5653	Parbbatipur	41
5654	Parui	41
5655	Paschim Jitpur	41
5656	Paschim Punro Para	41
5657	Patrasaer	41
5658	Pattabong Tea Garden	41
5659	Patuli	41
5660	Patulia	41
5661	Phulia	41
5662	Podara	41
5663	Port Blair	41
5664	Prayagpur	41
5665	Pujali	41
5666	Purba Medinipur	41
5667	Purba Tajpur	41
5668	Purulia	41
5669	Raghudebbati	41
5670	Raghudebpur	41
5671	Raghunathchak	41
5672	Raghunathpur	41
5673	Raghunathpur-Dankuni	41
5674	Raghunathpur-Magra	41
5675	Raigachhi	41
5676	Raiganj	41
5677	Raipur	41
5678	Rajarhat Gopalpur	41
5679	Rajpur	41
5680	Ramchandrapur	41
5681	Ramjibanpur	41
5682	Ramnagar	41
5683	Rampur Hat	41
5684	Ranaghat	41
5685	Raniganj	41
5686	Ratibati	41
5687	Raypur	41
5688	Rishra	41
5689	Rishra Cantonment	41
5690	Ruiya	41
5691	Sahajadpur	41
5692	Sahapur	41
5693	Sainthia	41
5694	Salap	41
5695	Sankarpur	41
5696	Sankrail	41
5697	Santoshpur	41
5698	Saontaidih	41
5699	Sarenga	41
5700	Sarpi	41
5701	Satigachha	41
5702	Serpur	41
5703	Shankhanagar	41
5704	Shantipur	41
5705	Shrirampur	41
5706	Siduli	41
5707	Siliguri	41
5708	Simla	41
5709	Singur	41
5710	Sirsha	41
5711	Siuri	41
5712	Sobhaganj	41
5713	Sodpur	41
5714	Sonamukhi	41
5715	Sonatikiri	41
5716	Srikantabati	41
5717	Srirampur	41
5718	Sukdal	41
5719	Taherpur	41
5720	Taki	41
5721	Talbandha	41
5722	Tamluk	41
5723	Tarakeswar	41
5724	Tentulberia	41
5725	Tentulkuli	41
5726	Thermal Power Project	41
5727	Tinsukia	41
5728	Titagarh	41
5729	Tufanganj	41
5730	Ukhra	41
5731	Ula	41
5732	Ulubaria	41
5733	Uttar Durgapur	41
5734	Uttar Goara	41
5735	Uttar Kalas	41
5736	Uttar Kamakhyaguri	41
5737	Uttar Latabari	41
5738	Uttar Mahammadpur	41
5739	Uttar Pirpur	41
5740	Uttar Raypur	41
5741	Uttarpara-Kotrung	41
5742	Abohar	2728
5743	Adampur	2728
5744	Ahmedgarh	2728
5745	Ajnala	2728
5746	Akalgarh	2728
5747	Alawalpur	2728
5748	Amloh	2728
5749	Amritsar	2728
5750	Amritsar Cantonment	2728
5751	Anandpur Sahib	2728
5752	Badhni Kalan	2728
5753	Bagh Purana	2728
5754	Balachaur	2728
5755	Banaur	2728
5756	Banga	2728
5757	Banur	2728
5758	Baretta	2728
5759	Bariwala	2728
5760	Barnala	2728
5761	Bassi Pathana	2728
5762	Batala	2728
5763	Bathinda	2728
5764	Begowal	2728
5765	Behrampur	2728
5766	Bhabat	2728
5767	Bhadur	2728
5768	Bhankharpur	2728
5769	Bharoli Kalan	2728
5770	Bhawanigarh	2728
5771	Bhikhi	2728
5772	Bhikhiwind	2728
5773	Bhisiana	2728
5774	Bhogpur	2728
5775	Bhuch	2728
5776	Bhulath	2728
5777	Budha Theh	2728
5778	Budhlada	2728
5779	Chima	2728
5780	Chohal	2728
5781	Dasuya	2728
5782	Daulatpur	2728
5783	Dera Baba Nanak	2728
5784	Dera Bassi	2728
5785	Dhanaula	2728
5786	Dharam Kot	2728
5787	Dhariwal	2728
5788	Dhilwan	2728
5789	Dhuri	2728
5790	Dinanagar	2728
5791	Dirba	2728
5792	Doraha	2728
5793	Faridkot	2728
5794	Fateh Nangal	2728
5795	Fatehgarh Churian	2728
5796	Fatehgarh Sahib	2728
5797	Fazilka	2728
5798	Firozpur	2728
5799	Firozpur Cantonment	2728
5800	Gardhiwala	2728
5801	Garhshankar	2728
5802	Ghagga	2728
5803	Ghanaur	2728
5804	Giddarbaha	2728
5805	Gobindgarh	2728
5806	Goniana	2728
5807	Goraya	2728
5808	Gurdaspur	2728
5809	Guru Har Sahai	2728
5810	Hajipur	2728
5811	Handiaya	2728
5812	Hariana	2728
5813	Hoshiarpur	2728
5814	Hussainpur	2728
5815	Jagraon	2728
5816	Jaitu	2728
5817	Jalalabad	2728
5818	Jalandhar	2728
5819	Jalandhar Cantonment	2728
5820	Jandiala	2728
5821	Jugial	2728
5822	Kalanaur	2728
5823	Kapurthala	2728
5824	Karoran	2728
5825	Kartarpur	2728
5826	Khamanon	2728
5827	Khanauri	2728
5828	Khanna	2728
5829	Kharar	2728
5830	Khem Karan	2728
5831	Kot Fatta	2728
5832	Kot Isa Khan	2728
5833	Kot Kapura	2728
5834	Kotkapura	2728
5835	Kurali	2728
5836	Lalru	2728
5837	Lehra Gaga	2728
5838	Lodhian Khas	2728
5839	Longowal	2728
5840	Ludhiana	2728
5841	Machhiwara	2728
5842	Mahilpur	2728
5843	Majitha	2728
5844	Makhu	2728
5845	Malaut	2728
5846	Malerkotla	2728
5847	Maloud	2728
5848	Mandi Gobindgarh	2728
5849	Mansa	2728
5850	Maur	2728
5851	Moga	2728
5852	Mohali	2728
5853	Moonak	2728
5854	Morinda	2728
5855	Mukerian	2728
5856	Muktsar	2728
5857	Mullanpur Dakha	2728
5858	Mullanpur Garibdas	2728
5859	Munak	2728
5860	Muradpura	2728
5861	Nabha	2728
5862	Nakodar	2728
5863	Nangal	2728
5864	Nawashahr	2728
5865	Naya Nangal	2728
5866	Nehon	2728
5867	Nurmahal	2728
5868	Pathankot	2728
5869	Patiala	2728
5870	Patti	2728
5871	Pattran	2728
5872	Payal	2728
5873	Phagwara	2728
5874	Phillaur	2728
5875	Qadian	2728
5876	Rahon	2728
5877	Raikot	2728
5878	Raja Sansi	2728
5879	Rajpura	2728
5880	Ram Das	2728
5881	Raman	2728
5882	Rampura	2728
5883	Rayya	2728
5884	Rupnagar	2728
5885	Rurki Kasba	2728
5886	Sahnewal	2728
5887	Samana	2728
5888	Samrala	2728
5889	Sanaur	2728
5890	Sangat	2728
5891	Sangrur	2728
5892	Sansarpur	2728
5893	Sardulgarh	2728
5894	Shahkot	2728
5895	Sham Churasi	2728
5896	Shekhpura	2728
5897	Sirhind	2728
5898	Sri Hargobindpur	2728
5899	Sujanpur	2728
5900	Sultanpur Lodhi	2728
5901	Sunam	2728
5902	Talwandi Bhai	2728
5903	Talwara	2728
5904	Tappa	2728
5905	Tarn Taran	2728
5906	Urmar Tanda	2728
5907	Zira	2728
5908	Zirakpur	2728
5909	Eshkashem	42
5910	Fayzabad	42
5911	Jurm	42
5912	Khandud	42
5913	Qaleh-ye Panjeh	42
5914	Bala Morghab	43
5915	Qaleh-ye Naw	43
5916	Andarab	44
5917	Baghlan	44
5918	Dahaneh-ye Ghawri	44
5919	Nahrin	44
5920	Pol-e Khumri	44
5921	Balkh	45
5922	Dawlatabad	45
5923	Mazar-e Sharif	45
5924	Qarchi Gak	45
5925	Shulgara	45
5926	Tash Gozar	45
5927	Bamiyan	46
5928	Panjab	46
5929	Qil Qaleh	46
5930	Anar Darreh	47
5931	Farah	47
5932	Shindand	47
5933	Andkhvoy	48
5934	Darzi Ab	48
5935	Dawlatabad	48
5936	Maymanah	48
5937	Chaghcharan	49
5938	Shahrak	49
5939	Taywarah	49
5940	Ghazni	50
5941	Awbeh	51
5942	Eslam Qaleh	51
5943	Ghurian	51
5944	Herat	51
5945	Karukh	51
5946	Kuhestan	51
5947	Kushk	51
5948	Qarabagh	51
5949	Tawraghudi	51
5950	Tir Pol	51
5951	Zendejan	51
5952	Baghran	52
5953	Darwishan	52
5954	Deh Shu	52
5955	Gereshk	52
5956	Lashkar Gah	52
5957	Sangin	52
5958	Aqchah	53
5959	Qarqin	53
5960	Sang-e Charak	53
5961	Shibarghan	53
5962	Baghrami	54
5963	Kabul	54
5964	Mir Bachchekut	54
5965	Paghman	54
5966	Qarabagh	54
5967	Sarawbi	54
5968	Mahmud-e Raqi	55
5969	Taghab	55
5970	Khawst	56
5971	Asadabad	57
5972	Asmar	57
5973	Mehtar Lam	58
5974	Azraw	59
5975	Baraki Barak	59
5976	Pol-e Alam	59
5977	Achin	60
5978	Batsawul	60
5979	Hugyani	60
5980	Jalalabad	60
5981	Nader Shah Kawt	60
5982	Chahar Burjak	61
5983	Chakhansur	61
5984	Khash	61
5985	Mirabad	61
5986	Rudbar	61
5987	Zaranj	61
5988	Nuristan	62
5989	Orgun	63
5990	Zareh Sharan	63
5991	Zarghun Shahr	63
5992	Ali Khayl	64
5993	Ghardez	64
5994	Charikar	65
5995	Jabal-os-Saraj	65
5996	Qandahar	66
5997	Dasht-e Archa	67
5998	Emam Saheb	67
5999	Hazart Imam	67
6000	Khanabad	67
6001	Qaleh-ye Zal	67
6002	Qunduz	67
6003	Aybak	68
6004	Kholm	68
6005	Chah Ab	70
6006	Eshkamesh	70
6007	Farkhar	70
6008	Khwajeh Ghar	70
6009	Rostaq	70
6010	Taloqan	70
6011	Yangi Qaleh	70
6012	Deh Rawud	71
6013	Gaz Ab	71
6014	Tarin Kawt	71
6015	Uruzgan	71
6016	Gardan Diwal	72
6017	Maydanshahr	72
6018	Qalat-e Ghilzay	73
6019	Berat	74
6020	Polican	74
6021	Ure Vajgurore	74
6022	Bulqize	75
6023	Delvine	76
6024	Bilisht	77
6025	Maqellare	78
6026	Peshkopi	78
6027	Durres	79
6028	Shijak	79
6029	Cerrik	80
6030	Elbasan	80
6031	Kerrabe	80
6032	Fier	81
6033	Patos	81
6034	Roskovec	81
6035	Gjirokaster	82
6036	Libohove	82
6037	Gramsh	83
6038	Krume	84
6039	Kavaje	85
6040	Erseke	86
6041	Leskovik	86
6042	Korce	87
6043	Maliq	87
6044	Fushe-Kruje	88
6045	Kruje	88
6046	Mamurras	88
6047	Milot	88
6048	Kucove	89
6049	Kukes	90
6050	Lac	91
6051	Lezhe	92
6052	Shengjin	92
6053	Librazhd	93
6054	Perrenjas	93
6055	Lushnje	94
6056	Rrogozhine	94
6057	Ballsh	95
6058	Burrel	97
6059	Klos	97
6060	Kraste	97
6061	Ulze	97
6062	Kurbnesh	98
6063	Rreshen	98
6064	Rubik	98
6065	Peqin	99
6066	Kelcyre	100
6067	Permet	100
6068	Pogradec	101
6069	Fierze	102
6070	Fushe-Arrez	102
6071	Puke	102
6072	Konispol	103
6073	Sarande	103
6074	Shkoder	104
6075	Corovode	105
6076	Memaliaj	106
6077	Tepelene	106
6078	Kamze	107
6079	Paskuqan	107
6080	Tirane	107
6081	Vore	107
6082	Bajram Curri	108
6083	Himare	109
6084	Orikum	109
6085	Selenice	109
6086	Vlore	109
6087	Adrar	112
6088	Awlaf	112
6089	Rijan	112
6090	Timimun	112
6091	Hydra	113
6092	Kouba	113
6093	Annabah	114
6094	Birrahhal	114
6095	Saraydih	114
6096	Sidi Amar	114
6097	al-Buni	114
6098	al-Hajar	114
6099	Abadlah	115
6100	Bani Wanif	115
6101	Bashshar	115
6102	Qanadsan	115
6103	Taghit	115
6104	Aris	116
6105	Ayn Tutah	116
6106	Barikah	116
6107	Batnah	116
6108	Marwanah	116
6109	Naghaus	116
6110	Ras-al-Ayun	116
6111	Tazult	116
6112	Ayt Rizin	117
6113	Akbu	117
6114	Amizur	117
6115	Barbasha	117
6116	Bijayah	117
6117	Farrawn	117
6118	Ighram	117
6119	Sadduk	117
6120	Shamini	117
6121	Sidi Aysh	117
6122	Taskaryut	117
6123	Tazmalt	117
6124	Timazrit	117
6125	Uz-al-Laqin	117
6126	al-Qasr	117
6127	Awlad Jallal	118
6128	Biskrah	118
6129	Sidi Khalid	118
6130	Sidi Ukbah	118
6131	Tulja	118
6132	Umash	118
6133	Zaribat-al-Wad	118
6134	Awlad Salam	119
6135	Awlad Yaysh	119
6136	Bani Khalil	119
6137	Bani Marad	119
6138	Bani Tamu	119
6139	Blidah	119
6140	Bu Arfa	119
6141	Bufarik	119
6142	Buinan	119
6143	Buqara	119
6144	Maftah	119
6145	Muzayah	119
6146	Shabli	119
6147	Shariah	119
6148	Shiffa	119
6149	Sidi Mussa	119
6150	Suma	119
6151	Wadi al-Allagh	119
6152	al-Afrun	119
6153	al-Arbaa	119
6154	Ayn Bissim	120
6155	Aghbalu	120
6156	Bir Ghabalu	120
6157	Buirah	120
6158	Lakhdariyah	120
6159	Shurfa	120
6160	Sur-al-Ghuzlan	120
6161	Ayn Tayah	121
6162	Awlad Haddaj	121
6163	Awlad Mussa	121
6164	Bani Amran	121
6165	Budwawu	121
6166	Budwawu al-Bahri	121
6167	Bumardas	121
6168	Burj Minayal	121
6169	Dalis	121
6170	Hammadi	121
6171	Issar	121
6172	Khamis-al-Khashnah	121
6173	Nasiriyah	121
6174	Raghayah	121
6175	Saabat	121
6176	Tinyah	121
6177	al-Arbaa Tash	121
6178	ar-Ruwibah	121
6179	Ammi Mussa	123
6180	Ghalizan	123
6181	Jidiwiyah	123
6182	Mazunah	123
6183	Sidi Muhammad Ban Ali	123
6184	Wadi Rahiyu	123
6185	Zammurah	123
6186	Biryan	124
6187	Bu Nura	124
6188	Ghardaia	124
6189	Ghardayah	124
6190	Matlili	124
6191	al-Ghuliah	124
6192	al-Qararah	124
6193	Ilizi	125
6194	Amir Abd-al-Qadar	126
6195	Jijili	126
6196	Shifka	126
6197	Tahar	126
6198	al-Miliyah	126
6199	Ayn Wissarah	127
6200	Ayn-al-Ibil	127
6201	Birin	127
6202	Dar Shiyukh	127
6203	Hassi Bahbah	127
6204	Jilfah	127
6205	Misad	127
6206	Sharif	127
6207	al-Idrisiyah	127
6208	Khanshalah	128
6209	Sharshar	128
6210	Tawziyanat	128
6211	al-Mahmal	128
6212	Ayn-al-Hajal	129
6213	Ayn-al-Milh	129
6214	Bu Saadah	129
6215	Hammam Dhalaa	129
6216	Maadid	129
6217	Maghra	129
6218	Masilah	129
6219	Sidi Aysa	129
6220	Wanugha	129
6221	Ayn Bu Sif	130
6222	Birwaghiyah	130
6223	Midyah	130
6224	Qasr-al-Bukhari	130
6225	Shillalah	130
6226	Tablat	130
6227	Farjiwah	131
6228	Milah	131
6229	Qararam Quqa	131
6230	Ruwashad	131
6231	Salghum-al-Ayd	131
6232	Sidi Maruf	131
6233	Sidi Marwan	131
6234	Tajananah	131
6235	Talighmah	131
6236	Wadi Athmaniyah	131
6237	Bu Khanifiyah	132
6238	Muaskar	132
6239	Muhammadiyah	132
6240	Siq	132
6241	Tighinnif	132
6242	Wadi al-Abtal	132
6243	Zahana	132
6244	Ayn Tadalas	133
6245	Hassi Mamash	133
6246	Mazaghran	133
6247	Mustaghanam	133
6248	Sidi Ali	133
6249	Ayn Safra	134
6250	Mishriyah	134
6251	Naama	134
6252	Oran	135
6253	Ouargla	136
6254	Ayn Bardah	137
6255	Bumahra Ahmad	137
6256	Hamman Awlad Ali	137
6257	Qalmah	137
6258	Wadi Zinati	137
6259	Ayn Abid	138
6260	Ayn Samara	138
6261	Didush Murad	138
6262	Hamma Bu Ziyan	138
6263	Qustantinah	138
6264	Zighut Yusuf	138
6265	al-Khurub	138
6266	Azzabah	139
6267	Amjaz Adshish	139
6268	Fil Fila	139
6269	Karkira	139
6270	Ramadan Jamal	139
6271	Sakikdah	139
6272	Shataybih	139
6273	Tamalus	139
6274	al-Harush	139
6275	al-Qull	139
6276	Ayn Azl	140
6277	Ayn Arnat	140
6278	Ayn Taqrut	140
6279	Ayn Wilman	140
6280	Ayn-al-Khabira	140
6281	Bouira	140
6282	Buqah	140
6283	Salah Bay	140
6284	Satif	140
6285	Setif	140
6286	Ziyama Mansuriyah	140
6287	al-Ulmah	140
6288	Ayn-al-Hajar	141
6289	Sayda	141
6290	Ayn Qazzan	144
6291	Ayn Salah	144
6292	Tamanghasat	144
6293	Ayn Binyan	145
6294	Bu Ismail	145
6295	Bu Midfarah	145
6296	Damus	145
6297	Duwirah	145
6298	Hajut	145
6299	Hammam Righa	145
6300	Sawlah	145
6301	Shiragha	145
6302	Shirshall	145
6303	Sidi Farj	145
6304	Stawali	145
6305	Tibazah	145
6306	Ziralda	145
6307	al-Qullah	145
6308	Bir-al-Itir	146
6309	Hammamat	146
6310	Mursut	146
6311	Shariyah	146
6312	Tibissah	146
6313	Winzah	146
6314	al-Awaynat	146
6315	Awlad Mimun	147
6316	Bani Mastar	147
6317	Bani Sikran	147
6318	Ghazawat	147
6319	Hannayah	147
6320	Maghniyah	147
6321	Nidruma	147
6322	Ramsh	147
6323	Sabra	147
6324	Shatwan	147
6325	Sibdu	147
6326	Sidi Abdallah	147
6327	Tilimsan	147
6328	al-Mansurah	147
6329	Tinduf	148
6330	Thaniyat-al-Had	149
6331	Tisamsilt	149
6332	Ayn Dhahab	150
6333	Firindah	150
6334	Mahdiyah	150
6335	Mashraa Asfa	150
6336	Qasr Shillalah	150
6337	Rahuyah	150
6338	Sughar	150
6339	Takhamarat	150
6340	Tiyarat	150
6341	Ayn Bayda	152
6342	Ayn Fakrun	152
6343	Ayn Kirshah	152
6344	Ayn Malilah	152
6345	Bir Shuhada	152
6346	Miskyanah	152
6347	Shamurah	152
6348	Umm-al-Bawaghi	152
6349	Ayn Biya	153
6350	Ayn-at-Turk	153
6351	Arzu	153
6352	Bir-al-Jir	153
6353	Butlilis	153
6354	Hassi Bu Nif	153
6355	Mars-al-Kabir	153
6356	Qadayal	153
6357	Sidi ash-Shami	153
6358	Wadi Thalatha	153
6359	Wahran	153
6360	al-Ansur	153
6361	as-Saniyah	153
6362	Hassi Masud	154
6363	Nazla	154
6364	Ruwisiyat	154
6365	Tabisbast	154
6366	Tamalhat	154
6367	Tamasin	154
6368	Tayabat-al-Janubiyah	154
6369	Tughghurt	154
6370	Warqla	154
6371	al-Hajirah	154
6372	Aflu	158
6373	Hassi al-Raml	158
6374	al-Aghwat	158
6375	Brizyanah	159
6376	al-Abyad Sidi Shaykh	159
6377	al-Bayadh	159
6378	Bab Azwar	160
6379	Baraki	160
6380	Bir Murad Rais	160
6381	Birkhadam	160
6382	Burj-al-Kiffan	160
6383	Dar-al-Bayda	160
6384	al-Jazair	160
6385	Bayadha	161
6386	Dabilah	161
6387	Hassan Abd-al-Karim	161
6388	Hassi Halifa	161
6389	Jamaa	161
6390	Maqran	161
6391	Qamar	161
6392	Raqiba	161
6393	Rubbah	161
6394	Sidi Amran	161
6395	al-Mighair	161
6396	al-Wad	161
6397	Ayn Maran	162
6398	Abu al-Hassan	162
6399	Bani Hawa	162
6400	Bu Qadir	162
6401	Sidi Ukaskah	162
6402	Tanas	162
6403	Wadi Sali	162
6404	Wadi al-Fiddah	162
6405	ash-Shalif	162
6406	ash-Shattiyah	162
6407	Ban Mahdi	163
6408	Bani Amar	163
6409	Basbas	163
6410	Dariyan	163
6411	Sabaita Muk	163
6412	al-Qalah	163
6413	at-Tarif	163
6414	Afono	164
6415	Alao	164
6416	Alofau	164
6417	Amouli	164
6418	Aoa	164
6419	Atuu	164
6420	Aua	164
6421	Aunuu	164
6422	Fagaalu	164
6423	Fagaitua	164
6424	Fagasa	164
6425	Fagatogo	164
6426	Laulii	164
6427	Leloaloa	164
6428	Nuuuli	164
6429	Pago Pago	164
6430	Tula	164
6431	Utulei	164
6432	Vatia	164
6433	Ofu	165
6434	Aoloau	167
6435	Faleniu	167
6436	Futiga	167
6437	Iliili	167
6438	Leone	167
6439	Malaeimi	167
6440	Malaeloa-Aitulagi	167
6441	Malaeloa-Ituau	167
6442	Mapusagafou	167
6443	Mesepa	167
6444	Pavaiai	167
6445	Tafuna	167
6446	Taputimu	167
6447	Vailoatai	167
6448	Vaitogi	167
6449	Canillo	169
6450	Encamp	170
6451	Ordino	173
6452	Caxito	175
6453	Benguela	176
6454	Lobito	176
6455	Camacupa	177
6456	Catabola	177
6457	Catumbela	177
6458	Chissamba	177
6459	Kuito	177
6460	Cabinda	178
6461	Ondjiva	179
6462	Caala	180
6463	Catchiungo	180
6464	Huambo	180
6465	Longonjo	180
6466	Caconda	181
6467	Caluquembe	181
6468	Lubango	181
6469	Menongue	182
6470	Luanda	185
6471	Malanje	188
6472	Cazaje	189
6473	Leua	189
6474	Luau	189
6475	Luena	189
6476	Lumeje	189
6477	Namibe	190
6478	Camabatela	191
6479	Uige	191
6480	Mbanza-Kongo	192
6481	Nzeto	192
6482	Soyo	192
6483	Codrington	201
6484	Catamarca	209
6485	Presidencia Roque Saenz Pena	210
6486	Resistencia	210
6487	Comodoro Rivadavia	211
6488	Puerto Madryn	211
6489	Rawson	211
6490	Trelew	211
6491	Alta Gracia	212
6492	Bell Ville	212
6493	Cordoba	212
6494	Rio Cuarto	212
6495	Rio Tercero	212
6496	San Francisco	212
6497	Villa Carlos Paz	212
6498	Villa Maria	212
6499	Corrientes	213
6500	Goya	213
6501	Mercedes	213
6502	San Lorenzo	213
6503	Formosa	216
6504	Jujuy	217
6505	Libertador General San Martin	217
6506	San Pedro	217
6507	Godoy Cruz	220
6508	Lujan	220
6509	Mendoza	220
6510	Rivadavia	220
6511	San Martin	220
6512	San Rafael	220
6513	Eldorado	221
6514	Obera	221
6515	Posadas	221
6516	Cutral Co	222
6517	Neuquen	222
6518	Salta	224
6519	San Ramon de la Nueva Oran	224
6520	Tartagal	224
6521	Tucuman	231
6522	Ashtarak	232
6523	Talin	232
6524	Ararat	233
6525	Artashat	233
6526	Armavir	234
6527	Vagharshapat	234
6528	Gavar	235
6529	Martuni	235
6530	Sevan	235
6531	Vardenis	235
6532	Abovyan	236
6533	Arzni	236
6534	Charentsavan	236
6535	Hrazdan	236
6536	Akhtala	237
6537	Alaverdi	237
6538	Spitak	237
6539	Stepanavan	237
6540	Tashir	237
6541	Vanadzor	237
6542	Artik	238
6543	Gyumri	238
6544	Stepanakert	239
6545	Angeghakot	240
6546	Goris	240
6547	Kajaran	240
6548	Kapan	240
6549	Meghri	240
6550	Sisian	240
6551	Dilijan	241
6552	Ijevan	241
6553	Yerevan	243
6554	Aruba	244
6555	Glenfield	245
6556	Henderson	245
6557	Milford	245
6558	Balgowlah	247
6559	Balmain	248
6560	Bankstown	249
6561	Camberwell	252
6562	Caulfield	255
6563	Chatswood	256
6564	Cheltenham	257
6565	Cherrybrook	258
6566	Clayton	259
6567	Collingwood	260
6568	Hawthorn	262
6569	Jannnali	263
6570	Knoxfield	264
6571	Melbourne	265
6572	South Oakleigh	265
6573	Cottesole	268
6574	Darch	268
6575	Mullaloo	268
6576	Noranda	268
6577	Osborne Park	268
6578	Willetton	268
6579	Acacia Ridge	269
6580	Aitkenvale	269
6581	Alderley	269
6582	Alexander Hills	269
6583	Archerfield	269
6584	Ashmore	269
6585	Atherton	269
6586	Ayr	269
6587	Beachmere	269
6588	Beenleigh	269
6589	Beerwah	269
6590	Bell	269
6591	Belmont	269
6592	Biloela	269
6593	Birkdale	269
6594	Blackwater	269
6595	Bongaree	269
6596	Bonogin	269
6597	Boonah	269
6598	Bowen	269
6599	Brendale	269
6600	Brisbane	269
6601	Buddina	269
6602	Buderim	269
6603	Bundaberg	269
6604	Bundall	269
6605	Burleigh Heads	269
6606	Burpengary	269
6607	Cabaland	269
6608	Caboolture	269
6609	Cairns	269
6610	Cairns Northern Beaches	269
6611	Caloundra	269
6612	Capalaba	269
6613	Charters Towers	269
6614	Childers	269
6615	Cleveland	269
6616	Coolum Beach	269
6617	Coopers Plain	269
6618	Dalby	269
6619	Deception Bay	269
6620	Eagle Farm	269
6621	Eagleby	269
6622	Emerald	269
6623	Emundi	269
6624	Forest Lake	269
6625	Gatton	269
6626	Gladstone	269
6627	Gold Coast	269
6628	Gowrie Junction	269
6629	Gympie	269
6630	Helensvale	269
6631	Hervey Bay	269
6632	Ingham	269
6633	Innisfail	269
6634	Ipswich	269
6635	Jindalee	269
6636	Julatten	269
6637	Kawana Waters	269
6638	Kingaroy	269
6639	Lawnton	269
6640	Loganholme	269
6641	Mackay	269
6642	Mareeba	269
6643	Maroochydore	269
6644	Maroochydore-Mooloolaba	269
6645	Maryborough	269
6646	Miami	269
6647	Milton	269
6648	Molendinar	269
6649	Moranbah	269
6650	Morayfield	269
6651	Mossman	269
6652	Mount Glorious	269
6653	Mount Isa	269
6654	Murarrie	269
6655	Nairand Kay	269
6656	Nambour	269
6657	Nerang	269
6658	Nobby Beach	269
6659	Noosa Heads	269
6660	Noosaville	269
6661	Paddington	269
6662	Port Douglas	269
6663	Robina	269
6664	Rockhampton	269
6665	Rocklea	269
6666	Roma	269
6667	Rubyvale	269
6668	Sanctuary Cove	269
6669	Slade Point	269
6670	Southport	269
6671	Suburb	269
6672	Sunshine Coast	269
6673	Tewantin-Noosa	269
6674	The Summit	269
6675	Toowong	269
6676	Toowoomba	269
6677	Townsville	269
6678	Victoria Point	269
6679	Warwick	269
6680	Willawong	269
6681	Yatala	269
6682	Yeppoon	269
6683	Zillmere	269
6684	Bridgewater-Gagebrook	271
6685	Burnie	271
6686	Burnie-Devonport	271
6687	Glenorchy	271
6688	Hobart	271
6689	Kingston-Blackmans Bay	271
6690	Launceston	271
6691	New Norfolk	271
6692	Rowella	271
6693	Sheffield	271
6694	Ulverstone	271
6695	Templestowe	272
6696	Albion	273
6697	Ararat	273
6698	Avenel	273
6699	Avondale Heights	273
6700	Baccus Marsh	273
6701	Bairnsdale	273
6702	Ballarat	273
6703	Balwyn	273
6704	Batman	273
6705	Bayswater	273
6706	Belmont	273
6707	Benalla	273
6708	Bendigo	273
6709	Bentleigh East	273
6710	Berwick	273
6711	Blackburn	273
6712	Blue Mountains	273
6713	Boonah	273
6714	Boronia	273
6715	Box Hill	273
6716	Brighton East	273
6717	Bundoora	273
6718	Campbellfield	273
6719	Carlton South	273
6720	Caroline Springs	273
6721	Castle Hill	273
6722	Castlemaine	273
6723	Caulfield	273
6724	Cheltenham	273
6725	Chester	273
6726	Clayton South	273
6727	Clifton Springs	273
6728	Coburg	273
6729	Colac	273
6730	Collingwood	273
6731	Craigieburn	273
6732	Cranbourne	273
6733	Crib Point	273
6734	Dandenong	273
6735	Devon Meadows	273
6736	Diamond Creek	273
6737	Doncaster East	273
6738	Doncester	273
6739	Donvale	273
6740	Echuca-Moama	273
6741	Elsternwick	273
6742	Eltham	273
6743	Fairfield	273
6744	Fitzroy	273
6745	Frnakston	273
6746	Geelong	273
6747	Glen Waverley	273
6748	Glenorchy	273
6749	Hallam	273
6750	Hamilton	273
6751	Hastings	273
6752	Healesville	273
6753	Horsham	273
6754	Hughesdale	273
6755	Ivanhoe	273
6756	Keilor	273
6757	Kensington	273
6758	Kerang	273
6759	Kilmore	273
6760	Kilsyth	273
6761	Kyabram	273
6762	Lakes Entrance	273
6763	Lalor	273
6764	Lara	273
6765	Laverton North	273
6766	Leopold	273
6767	Lower Templestowe	273
6768	Maidstone	273
6769	Malvern	273
6770	Maryborough	273
6771	Melbourne	273
6772	Melton	273
6773	Middle Park	273
6774	Mildura	273
6775	Mitcham	273
6776	Moe-Yallourn	273
6777	Moorabbin	273
6778	Mordialloc	273
6779	Morwell	273
6780	Mulgrave	273
6781	Murrumbeena	273
6782	Neerim South	273
6783	Noble Park North	273
6784	Notting Hill	273
6785	Oak Park	273
6786	Ocean Grove-Barwon Heads	273
6787	Olinda	273
6788	Pakenham	273
6789	Park Orchards	273
6790	Port Melbourne	273
6791	Portland	273
6792	Prahran	273
6793	Preston	273
6794	Pritbourne	273
6795	Queenscliff	273
6796	Reservoir	273
6797	Ringwood	273
6798	Rowville	273
6799	Sale	273
6800	Sandringham	273
6801	Scoresby	273
6802	Sebastopol	273
6803	Seymour	273
6804	Shepparton-Mooroopna	273
6805	Somerville	273
6806	South Yarra	273
6807	Southbank	273
6808	St. Albans	273
6809	St. Kilda East	273
6810	Stawell	273
6811	Sunbury	273
6812	Sunshine West	273
6813	Swan Hill	273
6814	Tatura	273
6815	Thomastown	273
6816	Thornbury	273
6817	Tongala	273
6818	Torquay	273
6819	Traralgon	273
6820	Tullamarine	273
6821	Vermont	273
6822	Wangaratta	273
6823	Wantirna	273
6824	Warragul	273
6825	Warrnambool	273
6826	Welshpool	273
6827	Wendouree	273
6828	Wonthaggi	273
6829	Woodend	273
6830	Yarrawonga-Mulwala	273
6831	Yea	273
6832	Wheeler	276
6833	Eisenstadt	280
6834	GroBpetersdorf	280
6835	Jennersdorf	280
6836	Kemeten	280
6837	Mattersburg	280
6838	Neudorfl	280
6839	Neusiedl am See	280
6840	Oberwart	280
6841	Pinkafeld	280
6842	Rust	280
6843	Maria Rain	281
6844	Poggersdorf	281
6845	Althofen	282
6846	Arnoldstein	282
6847	Bad Sankt Leonhard	282
6848	Bleiburg	282
6849	Ebenthal	282
6850	Eberndorf	282
6851	Feldkirchen	282
6852	Ferlach	282
6853	Finkenstein	282
6854	Friesach	282
6855	Hermagor	282
6856	Klagenfurt	282
6857	Klagenfurt 	282
6858	Lohnsburg	282
6859	Moosburg	282
6860	Paternion	282
6861	Radentheim	282
6862	Sankt Andra	282
6863	Sankt Jakob	282
6864	Sankt Veit	282
6865	Seeboden	282
6866	Spittal	282
6867	Velden am Worthersee	282
6868	Villach	282
6869	Volkermarkt	282
6870	Wernberg	282
6871	Wolfsberg	282
6872	Amstetten	285
6873	Bad Voslau	285
6874	Baden	285
6875	Berndorf	285
6876	Boheimkirchen	285
6877	Bruck an der Leitha	285
6878	Brunn	285
6879	Deutsch-Wagram	285
6880	Ebreichsdorf	285
6881	Eggendorf	285
6882	Fischamend	285
6883	Gablitz	285
6884	Ganserndorf	285
6885	Gerasdorf	285
6886	Gloggnitz	285
6887	Gmund	285
6888	Greifenstein	285
6889	GroB-Enzersdorf	285
6890	GroB-Gerungs	285
6891	Guntramsdorf	285
6892	Haag	285
6893	Hainburg	285
6894	Heidenreichstein	285
6895	Herzogenburg	285
6896	Himberg	285
6897	Hollabrunn	285
6898	Horn	285
6899	Klosterneuburg	285
6900	Korneuburg	285
6901	Kottingbrunn	285
6902	Krems	285
6903	Laa	285
6904	Langenlois	285
6905	Langenzersdorf	285
6906	Leobendorf	285
6907	Leopoldsdorf	285
6908	Lilienfeld	285
6909	Loipersdorf	285
6910	Maria Enzersdorf	285
6911	Melk	285
6912	Mistelbach	285
6913	Modling	285
6914	Neulengbach	285
6915	Neunkirchen	285
6916	Niederleis	285
6917	Ober-Grabendorf	285
6918	Perchtoldsdorf	285
6919	Pernitz	285
6920	Pottendorf	285
6921	Poysdorf	285
6922	Pressbaum	285
6923	Purgstall	285
6924	Purkersdorf	285
6925	Reichenau	285
6926	Retz	285
6927	Sankt Andra-Wordern	285
6928	Sankt Peter in der Au	285
6929	Sankt Polten	285
6930	Sankt Valentin	285
6931	Scheibbs	285
6932	Schrems	285
6933	Schwechat	285
6934	Seitenstetten	285
6935	Sollenau	285
6936	Stockerau	285
6937	Strasshof	285
6938	Ternitz	285
6939	Traiskirchen	285
6940	Traismauer	285
6941	Tulln	285
6942	Vosendorf	285
6943	Waidhofen	285
6944	Wiener Neudorf	285
6945	Wiener Neustadt	285
6946	Wieselburg	285
6947	Wilhelmsburg	285
6948	Wolkersdorf	285
6949	Ybbs	285
6950	Ybbsitz	285
6951	Zistersdorf	285
6952	Zwettl	285
6953	Alkoven	286
6954	Altheim	286
6955	Altmunster	286
6956	Andorf	286
6957	Ansfelden	286
6958	Asten	286
6959	Attnang-Puchheim	286
6960	Aurolzmunster	286
6961	Bad Goisern	286
6962	Bad Hall	286
6963	Bad Ischl	286
6964	Braunau	286
6965	Breitenfurt	286
6966	Ebensee	286
6967	Eferding	286
6968	Engerwitzdorf	286
6969	Enns	286
6970	Feldkirchen an der Donau	286
6971	Frankenburg	286
6972	Freistadt	286
6973	Gallneukirchen	286
6974	Garsten	286
6975	Gmunden	286
6976	Gramastetten	286
6977	Grieskirchen	286
6978	Gunskirchen	286
6979	Horsching	286
6980	Kirchdorf an der Krems	286
6981	Kremsmunster	286
6982	Krenglbach	286
6983	Laakirchen	286
6984	Lenzing	286
6985	Leonding	286
6986	Linz	286
6987	Loibichl	286
6988	Marchtrenk	286
6989	Mattighofen	286
6990	Mauthausen	286
6991	Micheldorf	286
6992	Neuhofen an der Krems	286
6993	Ohlsdorf	286
6994	Ottensheim	286
6995	Pasching	286
6996	Perg	286
6997	Pettenbach	286
6998	Pram	286
6999	Pregarten	286
7000	Puchenau	286
7001	Regau	286
7002	Ried	286
7003	Rohrbach in Oberosterreich	286
7004	Rutzenmoos	286
7005	Sankt Florian	286
7006	Sankt Georgen	286
7007	Sankt Marien	286
7008	Scharding	286
7009	Scharnstein	286
7010	Schwertberg	286
7011	Seewalchen	286
7012	Sierning	286
7013	Stadl-Paura	286
7014	Steyr	286
7015	Steyregg	286
7016	Steyrermuhl	286
7017	Thalheim	286
7018	Timelkam	286
7019	Traun	286
7020	Vocklabruck	286
7021	Vocklamarkt	286
7022	Vorchdorf	286
7023	Wels	286
7024	Wilhering	286
7025	Abtenau	287
7026	Anif	287
7027	Bad Gastein	287
7028	Bad Hofgastein	287
7029	Bergheim	287
7030	Bischofshofen	287
7031	Bruck an der GroBglocknerstraB	287
7032	Burmoos	287
7033	Elsbethen	287
7034	Eugendorf	287
7035	Forstau	287
7036	Grodig	287
7037	Hallein	287
7038	Hallwang	287
7039	Henndorf	287
7040	Kuchl	287
7041	Mayrhofen	287
7042	Mittersill	287
7043	Neumarkt	287
7044	Oberndorf	287
7045	Obertrum am See	287
7046	Piesendorf	287
7047	Puch	287
7048	Radstadt	287
7049	Saalfelden	287
7050	Salzburg	287
7051	Sankt Johann im Pongau	287
7052	Seekirchen	287
7053	Sieghartskirchen	287
7054	StraBwalchen	287
7055	Strobl	287
7056	Tamsweg	287
7057	Thalgau	287
7058	Wals-Siezenheim	287
7059	Wolfgangsee	287
7060	Zell am See	287
7061	Albersdorf	288
7062	Bad Aussee	289
7063	Barnbach	289
7064	Bruck an der Mur	289
7065	Deutschlandsberg	289
7066	Eisenerz	289
7067	Feldbach	289
7068	Feldkirchen bei Graz	289
7069	Fohnsdorf	289
7070	Frohnleiten	289
7071	Furstenfeld	289
7072	Gleisdorf	289
7073	Gratkorn	289
7074	Graz	289
7075	Hartberg	289
7076	Judenburg	289
7077	Judendorf-StraBengel	289
7078	Kapfenberg	289
7079	Karlsdorf	289
7080	Kindberg	289
7081	Knittelfeld	289
7082	Koflach	289
7083	Krieglach	289
7084	Lannach	289
7085	Leibnitz	289
7086	Leoben	289
7087	Liezen	289
7088	Murzzuschlag	289
7089	Rottenmann	289
7090	Schladming	289
7091	Seiersberg	289
7092	Spielberg	289
7093	Trofaiach	289
7094	Voitsberg	289
7095	Wagna	289
7096	Weiz	289
7097	Zeltweg	289
7098	Deutschfeistritz	290
7099	Liezen	290
7100	Sankt Bartholoma	290
7101	Absam	291
7102	Axams	291
7103	Ebbs	291
7104	Fugen	291
7105	Hall	291
7106	Haselgehr	291
7107	Hopfgarten	291
7108	Imst	291
7109	Innsbruck	291
7110	Jenbach	291
7111	Kirchberg	291
7112	Kirchbichl	291
7113	Kitzbuhel	291
7114	Kramsach	291
7115	Kufstein	291
7116	Landeck	291
7117	Lienz	291
7118	Matrei	291
7119	Neustift im Stubaital	291
7120	Reutte	291
7121	Rum	291
7122	Sankt Johann in Tirol	291
7123	Scheffau	291
7124	Schwaz	291
7125	St. Johann Am Walde	291
7126	Telfs	291
7127	Vols	291
7128	Vomp	291
7129	Wattens	291
7130	Worgl	291
7131	Zirl	291
7132	Altach	293
7133	Bludenz	293
7134	Bregenz	293
7135	Chassieu	293
7136	Dietmannsried	293
7137	Dornbirn	293
7138	Feldkirch	293
7139	Frastanz	293
7140	Gotzis	293
7141	Hard	293
7142	Hochst	293
7143	Hohenems	293
7144	Horbranz	293
7145	Hufingen	293
7146	Lauterach	293
7147	Lochau	293
7148	Lustenau	293
7149	Mittelberg	293
7150	Nenzing	293
7151	Nuziders	293
7152	Rankweil	293
7153	Schruns	293
7154	Thuringen	293
7155	Wolfurt	293
7156	Vienna	294
7157	Wien	294
7158	Alat	295
7159	Artyom	295
7160	Baki	295
7161	Bakixanov	295
7162	Balaxani	295
7163	Bilacari	295
7164	Bilqax	295
7165	Bina	295
7166	Buzovna	295
7167	Haci Zeynalabdin	295
7168	Hovsan	295
7169	Lokbatan	295
7170	Mastaga	295
7171	Puta	295
7172	Qarasuxur	295
7173	Qobustan	295
7174	Rasulzada	295
7175	Sabuncu	295
7176	Sanqacal	295
7177	Sumqayit	295
7178	Suraxani	295
7179	Xirdalan	295
7180	Zirya	295
7181	Daskasan	297
7182	Ganca	297
7183	Xanlar	297
7184	Ganja	298
7185	Cabrayil	299
7186	Kalbacar	299
7187	Lacin	299
7188	Astara	300
7189	Goytapa	300
7190	Lankaran	300
7191	Masalli	300
7192	Neftcala	300
7193	Agcabadi	301
7194	Agdam	301
7195	Barda	301
7196	Mingacevir	301
7197	Tartar	301
7198	Yevlax	301
7199	Ali Bayramli	302
7200	Bilasuvar	302
7201	Calilabad	302
7202	Qarasu	302
7203	Qazimammad	302
7204	Saatli	302
7205	Sabirabad	302
7206	Salyan	302
7207	Susa	303
7208	Xankandi	303
7209	Xocavand	303
7210	Culfa	304
7211	Naxcivan	304
7212	Ordubad	304
7213	Sadarak	304
7214	Sarur	304
7215	Beylaqan	305
7216	Fuzuli	305
7217	Imisli	305
7218	Agstafa	306
7219	Gadabay	306
7220	Kovlar	306
7221	Qaracamirli	306
7222	Qazax	306
7223	Samkir	306
7224	Tovuz	306
7225	Amircan	307
7226	Balakan	307
7227	Katex	307
7228	Oguz	307
7229	Qabala	307
7230	Qax	307
7231	Saki	307
7232	Zaqatala	307
7233	Agdas	308
7234	Agsu	308
7235	Goycay	308
7236	Ismayilli	308
7237	Kurdamir	308
7238	Samaxi	308
7239	Ucar	308
7240	Zardab	308
7241	Davaci	309
7242	Quba	309
7243	Qusar	309
7244	Siyazan	309
7245	Xacmaz	309
7246	Xudat	309
7247	Coopers Town	310
7248	Marsh Harbour	310
7249	Andros Town	312
7250	Nicholls Town	312
7251	Alice Town	314
7252	Freetown	317
7253	Rock Sound	317
7254	Pirates Well	322
7255	Isa	327
7256	Badiyah	328
7257	Hidd	329
7258	Mahama	331
7259	Manama	332
7260	Sitrah	333
7261	al-Manamah	334
7262	al-Muharraq	335
7263	ar-Rifaa	336
7264	Bandarban	338
7265	Barguna	339
7266	Barisal	340
7267	Gaurnadi	340
7268	Mehendiganj	340
7269	Nalchiti	340
7270	Bhola	341
7271	Burhanuddin	341
7272	Char Fasson	341
7273	Lalmohan	341
7274	Adamighi	342
7275	Bogora	342
7276	Sherpur	342
7277	Chandpur	344
7278	Hajiganj	344
7279	Boalkhali	345
7280	Chattagam	345
7281	Fatikchhari	345
7282	Lohagara	345
7283	Patiya	345
7284	Rangunia	345
7285	Raozan	345
7286	Sandip	345
7287	Satkaniya	345
7288	Alamdanga	347
7289	Chuadanga	347
7290	Damurhuda	347
7291	Dhaka	348
7292	Dhamrai	348
7293	Dohar	348
7294	Bochanganj	349
7295	Dinajpur	349
7296	Fulbari	349
7297	Parbatipur	349
7298	Bhanga	350
7299	Char Bhadrasan	350
7300	Faridpur	350
7301	Chhagalnaiya	351
7302	Feni	351
7303	Gaybanda	352
7304	Gazipur	353
7305	Tungi	353
7306	Gopalganj	354
7307	Tungi Para	354
7308	Baniachang	355
7309	Habiganj	355
7310	Jamalpur	357
7311	Sarishabari	357
7312	Abhaynagar	358
7313	Jessor	358
7314	Jhikargachha	358
7315	Keshabpur	358
7316	Jhalakati	359
7317	Jhanaydah	360
7318	Kaliganj	360
7319	Kotchandpur	360
7320	Shailkupa	360
7321	Khagrachari	361
7322	Manikchhari	361
7323	Ramgarh	361
7324	Khulna	362
7325	Phultala	362
7326	Bajitpur	363
7327	Bhairab Bazar	363
7328	Itna	363
7329	Kishorganj	363
7330	Komilla	365
7331	Laksham	365
7332	Chilmari	366
7333	Kurigram	366
7334	Nageshwari	366
7335	Ulipur	366
7336	Bheramara	367
7337	Kushtiya	367
7338	Lakshmipur	368
7339	Ramganj	368
7340	Ramgati	368
7341	Raypur	368
7342	Madaripur	370
7343	Magura	371
7344	Bhaluka	372
7345	Fulbaria	372
7346	Gafargaon	372
7347	Ishwarganj	372
7348	Maimansingh	372
7349	Muktagachha	372
7350	Trishal	372
7351	Manikganj	373
7352	Meherpur	375
7353	Munshiganj	376
7354	Kalia	377
7355	Naral	377
7356	Narayanganj	378
7357	Rupganj	378
7358	Narsingdi	379
7359	Roypura	379
7360	Gurudaspur	380
7361	Nator	380
7362	Naugaon	381
7363	Gomastapur	382
7364	Nawabganj	382
7365	Shibganj	382
7366	Netrakona	383
7367	Domar	384
7368	Nilphamari	384
7369	Saidpur	384
7370	Begamganj	385
7371	Noakhali	385
7372	Senbagh	385
7373	Bera	386
7374	Bhangura	386
7375	Ishurdi	386
7376	Pabna	386
7377	Panchagarh	387
7378	Patuakhali	388
7379	Bhandaria	389
7380	Mathbaria	389
7381	Nesarabad	389
7382	Pirojpur	389
7383	Pangsha	390
7384	Rajbari	390
7385	Rajshahi	391
7386	Kaptai	392
7387	Rangamati	392
7388	Badarganj	393
7389	Kaunia	393
7390	Rangpur	393
7391	Satkhira	394
7392	Palang	395
7393	Nalitabari	396
7394	Sherpur	396
7395	Silhat	397
7396	Shahjadpur	398
7397	Sirajganj	398
7398	Chhatak	399
7399	Sunamganj	399
7400	Gopalpur	400
7401	Mirzapur	400
7402	Sakhipur	400
7403	Tangayal	400
7404	Pirganj	401
7405	Thakurgaon	401
7406	Baranavichy	413
7407	Bjaroza	413
7408	Bjeloozersk	413
7409	Brest	413
7410	David-Haradok	413
7411	Drahichyn	413
7412	Hancavichy	413
7413	Ivacevichy	413
7414	Ivanava	413
7415	Kamjenec	413
7416	Kobryn	413
7417	Kosava	413
7418	Ljahavichy	413
7419	Luninjec	413
7420	Malaryta	413
7421	Mikashevichy	413
7422	Pinsk	413
7423	Pruzhany	413
7424	Stolin	413
7425	Vysokoje	413
7426	Zhabinka	413
7427	Buda Kosheljovo	414
7428	Chechersk	414
7429	Dobrush	414
7430	Hojniki	414
7431	Homjel	414
7432	Jelsk	414
7433	Kalinkavichy	414
7434	Kascjukovka	414
7435	Mazyr	414
7436	Narovlja	414
7437	Pjetrykav	414
7438	Rahachow	414
7439	Rechyca	414
7440	Svetlahorsk	414
7441	Vasilevichy	414
7442	Vjetka	414
7443	Zhlobin	414
7444	Zhytkavichy	414
7445	Ashmjany	415
7446	Berjozovka	415
7447	Hrodna	415
7448	Lida	415
7449	Masty	415
7450	Navahrudak	415
7451	Shchuchyn	415
7452	Skidel	415
7453	Slonim	415
7454	Smarhon	415
7455	Vawkavysk	415
7456	Asipovichy	416
7457	Babrujsk	416
7458	Byhau	416
7459	Chausy	416
7460	Cherikov	416
7461	Horki	416
7462	Kascjukovichy	416
7463	Klimavichy	416
7464	Krychaw	416
7465	Mahiljow	416
7466	Mstislav	416
7467	Shklov	416
7468	Slaeuharad	416
7469	Minsk	418
7470	Petrikov	420
7471	Baran	421
7472	Braslav	421
7473	Chashniki	421
7474	Disna	421
7475	Dokshicy	421
7476	Dubrovna	421
7477	Haradok	421
7478	Hlybokaje	421
7479	Ljepjel	421
7480	Mjory	421
7481	Navapolack	421
7482	Novalukoml	421
7483	Orsha	421
7484	Pastavy	421
7485	Polack	421
7486	Polotsk	421
7487	Senno	421
7488	Talachyn	421
7489	Verhnjadzvimsk	421
7490	Vicebsk	421
7491	Aartselaar	422
7492	Antwerpen	422
7493	Arendonk	422
7494	Baarle-Hertog	422
7495	Balen	422
7496	Beerse	422
7497	Berlaar	422
7498	Boechout	422
7499	Bonheiden	422
7500	Boom	422
7501	Bornem	422
7502	Borsbeek	422
7503	Brasschaat	422
7504	Brecht	422
7505	Dessel	422
7506	Deurne	422
7507	Duffel	422
7508	Edegem	422
7509	Ekeren	422
7510	Essen	422
7511	Geel	422
7512	Geluvele	422
7513	Grobbendonk	422
7514	Heist-op-den-Berg	422
7515	Hemiksem	422
7516	Herentals	422
7517	Herenthout	422
7518	Herselt	422
7519	Hoogstraten	422
7520	Hove	422
7521	Hulshout	422
7522	Kalmpthout	422
7523	Kalmthout	422
7524	Kapellen	422
7525	Kasterlee	422
7526	Kontich	422
7527	Laakdal	422
7528	Lier	422
7529	Lille	422
7530	Lint	422
7531	Malle	422
7532	Mechelen	422
7533	Meerhout	422
7534	Merksplas	422
7535	Mol	422
7536	Mortsel	422
7537	Niel	422
7538	Nijlen	422
7539	Olen	422
7540	Oud-Turnhout	422
7541	Putte	422
7542	Puurs	422
7543	Ranst	422
7544	Ravels	422
7545	Retie	422
7546	Rijkevorsel	422
7547	Robrechts	422
7548	Rumst	422
7549	Schelle	422
7550	Schilde	422
7551	Schoten	422
7552	Sint-Amands	422
7553	Sint-Katelijne-Waver	422
7554	Stabroek	422
7555	Turnhout	422
7556	Vorselaar	422
7557	Vosselaar	422
7558	Westerlo	422
7559	Wijnegem	422
7560	Willebroek	422
7561	Wilrijk	422
7562	Wommelgem	422
7563	Wuustwezel	422
7564	Zandhoven	422
7565	Zoersel	422
7566	Zwijndrecht	422
7567	Berchem	423
7568	Alsemberg	424
7569	Asse Zellik	424
7570	Brussels	424
7571	Bruxelles	424
7572	Diegem	424
7573	Alsemberg	425
7574	Asse Zellik	425
7575	Brussels	425
7576	Bruxelles	425
7577	Diegem	425
7578	Brussel	426
7579	Aiseau-Presles	428
7580	Anderlues	428
7581	Antoing	428
7582	Ath	428
7583	Beaumont	428
7584	Beloeil	428
7585	Bernissart	428
7586	Binche	428
7587	Boussu	428
7588	Braine-le-Comte	428
7589	Brugelette	428
7590	Brunehaut	428
7591	Celles	428
7592	Chapelle-lez-Herlaimont	428
7593	Charleroi	428
7594	Chatelet	428
7595	Chievres	428
7596	Chimay	428
7597	Colfontaine	428
7598	Comines-Warneton	428
7599	Courcelles	428
7600	Dour	428
7601	Ecaussinnes	428
7602	Ellezelles	428
7603	Enghien	428
7604	Erquelinnes	428
7605	Estaimpuis	428
7606	Estinnes	428
7607	Farciennes	428
7608	Fleurus	428
7609	Flobecq	428
7610	Fontaine-lEveque	428
7611	Frameries	428
7612	Frasnes-lez-Anvaing	428
7613	Froidchapelle	428
7614	Gerpinnes	428
7615	Haine-Saint-Pierre	428
7616	Ham-sur-Heure-Nalinnes	428
7617	Hensies	428
7618	Honnelles	428
7619	Jurbise	428
7620	La Louviere	428
7621	Le Roeulx	428
7622	Lens	428
7623	Les Bons Villers	428
7624	Lessines	428
7625	Leuze-en-Hainaut	428
7626	Lobbes	428
7627	Manage	428
7628	Merbes-le-Chateau	428
7629	Momignies	428
7630	Mons	428
7631	Mont-de-lEnclus	428
7632	Montigny-le-Tilleul	428
7633	Morlanwelz	428
7634	Mouscron	428
7635	Pecq	428
7636	Peruwelz	428
7637	Pont-a-Celles	428
7638	Quaregnon	428
7639	Quevy	428
7640	Quievrain	428
7641	Rumes	428
7642	Saint-Ghislain	428
7643	Seneffe	428
7644	Silly	428
7645	Sivry-Rance	428
7646	Soignies	428
7647	Thuin	428
7648	Tournai	428
7649	Amay	429
7650	Amel	429
7651	Angleur	429
7652	Ans	429
7653	Anthisnes	429
7654	Aubel	429
7655	Awans	429
7656	Aywaille	429
7657	Baelen	429
7658	Bassenge	429
7659	Berloz	429
7660	Beyne-Heusay	429
7661	Blegny	429
7662	Braives	429
7663	Bullingen	429
7664	Burdinne	429
7665	Burg-Reuland	429
7666	Butgenbach	429
7667	Chaudfontaine	429
7668	Clavier	429
7669	Comblain-au-Pont	429
7670	Crisnee	429
7671	Dalhem	429
7672	Dison	429
7673	Donceel	429
7674	Engis	429
7675	Esneux	429
7676	Eupen	429
7677	Faimes	429
7678	Ferrieres	429
7679	Fexhe-le-Haut-Clocher	429
7680	Flemalle	429
7681	Fleron	429
7682	Geer	429
7683	Grace-Hollogne	429
7684	Hamoir	429
7685	Hannut	429
7686	Heron	429
7687	Herstal	429
7688	Herve	429
7689	Huy	429
7690	Jalhay	429
7691	Juprelle	429
7692	Kelmis	429
7693	Liege	429
7694	Lierneux	429
7695	Limbourg	429
7696	Lincent	429
7697	Lontzen	429
7698	Malmedy	429
7699	Marchin	429
7700	Modave	429
7701	Montzen	429
7702	Nandrin	429
7703	Neupre	429
7704	Olne	429
7705	Oreye	429
7706	Ouffet	429
7707	Oupeye	429
7708	Pepinster	429
7709	Plombieres	429
7710	Racour	429
7711	Raeren	429
7712	Remicourt	429
7713	Saint-Georges-sur-Meuse	429
7714	Saint-Nicolas	429
7715	Sankt Vith	429
7716	Seraing	429
7717	Soumagne	429
7718	Spa	429
7719	Sprimont	429
7720	Stavelot	429
7721	Stoumont	429
7722	Theux	429
7723	Thimister-Clermont	429
7724	Tinlot	429
7725	Trois-Ponts	429
7726	Trooz	429
7727	Verlaine	429
7728	Verviers	429
7729	Villers-le-Bouillet	429
7730	Vise	429
7731	Waimes	429
7732	Wanze	429
7733	Waremme	429
7734	Wasseiges	429
7735	Welkenraedt	429
7736	Alken	430
7737	As	430
7738	Beringen	430
7739	Bilzen	430
7740	Bocholt	430
7741	Borgloon	430
7742	Bree	430
7743	Diepenbeek	430
7744	Dilsen-Stokkem	430
7745	Genk	430
7746	Gingelom	430
7747	Halen	430
7748	Ham	430
7749	Hamont-Achel	430
7750	Hasselt	430
7751	Hechtel-Eksel	430
7752	Heers	430
7753	Herk-de-Stad	430
7754	Herstappe	430
7755	Heusden-Zolder	430
7756	Hoeselt	430
7757	Houthalen-Helchteren	430
7758	Kinrooi	430
7759	Kortessem	430
7760	Kuringen	430
7761	Lanaken	430
7762	Leopoldsburg	430
7763	Lommel	430
7764	Lummen	430
7765	Maaseik	430
7766	Maasmechelen	430
7767	Meeuwen-Gruitrode	430
7768	Neerpelt	430
7769	Nieuwerkerken	430
7770	Opglabbeek	430
7771	Overpelt	430
7772	Peer	430
7773	Riemst	430
7774	Sint-Truiden	430
7775	Tessenderlo	430
7776	Tongeren	430
7777	Voeren	430
7778	Wellen	430
7779	Zonhoven	430
7780	Zutendaal	430
7781	Arlon	431
7782	Attert	431
7783	Aubange	431
7784	Bastogne	431
7785	Bertogne	431
7786	Bertrix	431
7787	Bouillon	431
7788	Chiny	431
7789	Daverdisse	431
7790	Durbuy	431
7791	Erezee	431
7792	Etalle	431
7793	Fauvillers	431
7794	Florenville	431
7795	Gouvy	431
7796	Grapfontaine	431
7797	Habay	431
7798	Herbeumont	431
7799	Hotton	431
7800	Houffalize	431
7801	La Roche-en-Ardenne	431
7802	Leglise	431
7803	Libin	431
7804	Libramont-Chevigny	431
7805	Manhay	431
7806	Marche-en-Famenne	431
7807	Marloie	431
7808	Martelange	431
7809	Meix-devant-Virton	431
7810	Messancy	431
7811	Musson	431
7812	Nassogne	431
7813	Neufchateau	431
7814	Paliseul	431
7815	Rendeux	431
7816	Rouvroy	431
7817	Saint-Hubert	431
7818	Saint-Leger	431
7819	Sainte-Ode	431
7820	Tellin	431
7821	Tenneville	431
7822	Tintigny	431
7823	Vaux-sur-Sure	431
7824	Vielsalm	431
7825	Virton	431
7826	Wellin	431
7827	Andenne	432
7828	Anhee	432
7829	Assesse	432
7830	Beauraing	432
7831	Bievre	432
7832	Cerfontaine	432
7833	Ciney	432
7834	Couvin	432
7835	Dinant	432
7836	Doische	432
7837	Eghezee	432
7838	Fernelmont	432
7839	Floreffe	432
7840	Florennes	432
7841	Fosses-la-Ville	432
7842	Gedinne	432
7843	Gembloux	432
7844	Gesves	432
7845	Hamois	432
7846	Hastiere	432
7847	Havelange	432
7848	Houyet	432
7849	Jambes	432
7850	Jemeppe-sur-Sambre	432
7851	La Bruyere	432
7852	Malonne	432
7853	Mettet	432
7854	Namur	432
7855	Ohey	432
7856	Onhaye	432
7857	Philippeville	432
7858	Profondeville	432
7859	Rochefort	432
7860	Sambreville	432
7861	Sombreffe	432
7862	Somme-Leuze	432
7863	Suarlee	432
7864	Viroinval	432
7865	Vresse-sur-Semois	432
7866	Walcourt	432
7867	Yvoir	432
7868	Gullegem	433
7869	Langdorp	433
7870	Aalst	434
7871	Aalter	434
7872	Assenede	434
7873	Berlare	434
7874	Beveren	434
7875	Brakel	434
7876	Buggenhout	434
7877	De Pinte	434
7878	Deinze	434
7879	Denderleeuw	434
7880	Dendermonde	434
7881	Destelbergen	434
7882	Drongen	434
7883	Eeklo	434
7884	Erembodegem	434
7885	Erpe-Mere	434
7886	Evergem	434
7887	Gavere	434
7888	Gent	434
7889	Geraardsbergen	434
7890	Ghent	434
7891	Haaltert	434
7892	Hamme	434
7893	Herzele	434
7894	Horebeke	434
7895	Kaprijke	434
7896	Kerksken	434
7897	Kluisbergen	434
7898	Knesselare	434
7899	Kruibeke	434
7900	Kruishoutem	434
7901	Laarne	434
7902	Lebbeke	434
7903	Lede	434
7904	Lierde	434
7905	Lochristi	434
7906	Lokeren	434
7907	Lovendegem	434
7908	Maarkedal	434
7909	Maldegem	434
7910	Melle	434
7911	Merelbeke	434
7912	Moerbeke	434
7913	Nazareth	434
7914	Nevele	434
7915	Ninove	434
7916	Oosterzele	434
7917	Oudenaarde	434
7918	Ronse	434
7919	Semmerzake	434
7920	Sint-Gillis-Waas	434
7921	Sint-Laureins	434
7922	Sint-Lievens-Houtem	434
7923	Sint-Martens-Latem	434
7924	Sint-Niklaas	434
7925	Stekene	434
7926	Temse	434
7927	Waarschoot	434
7928	Waasmunster	434
7929	Wachtebeke	434
7930	Wetteren	434
7931	Wichelen	434
7932	Wortegem-Petegem	434
7933	Zele	434
7934	Zelzate	434
7935	Zingem	434
7936	Zomergem	434
7937	Zottegem	434
7938	Zulte	434
7939	Zwalm	434
7940	Zwijnaarde	434
7941	Aarschot	436
7942	Affligem	436
7943	Asse	436
7944	Beersel	436
7945	Begijnendijk	436
7946	Bekkevoort	436
7947	Bertem	436
7948	Bever	436
7949	Bierbeek	436
7950	Boortmeerbeek	436
7951	Boutersem	436
7952	Diest	436
7953	Dilbeek	436
7954	Drogenbos	436
7955	Galmaarden	436
7956	Geetbets	436
7957	Glabbeek	436
7958	Gooik	436
7959	Grimbergen	436
7960	Haacht	436
7961	Halle	436
7962	Herent	436
7963	Herne	436
7964	Hoegaarden	436
7965	Hoeilaart	436
7966	Holsbeek	436
7967	Huldenberg	436
7968	Kampenhout	436
7969	Kapelle-op-den-Bos	436
7970	Keerbergen	436
7971	Kortenaken	436
7972	Kortenberg	436
7973	Kraainem	436
7974	Landen	436
7975	Lennik	436
7976	Leuven	436
7977	Liedekerke	436
7978	Linkebeek	436
7979	Linter	436
7980	Londerzeel	436
7981	Lubbeek	436
7982	Machelen	436
7983	Meise	436
7984	Merchtem	436
7985	Opwijk	436
7986	Oud-Heverlee	436
7987	Overijse	436
7988	Pepingen	436
7989	Roosdaal	436
7990	Rotselaar	436
7991	Scherpenheuvel-Zichem	436
7992	Sint-Genesius-Rode	436
7993	Sint-Pieters-Leeuw	436
7994	Steenokkerzeel	436
7995	Ternat	436
7996	Tervuren	436
7997	Tielt-Winge	436
7998	Tienen	436
7999	Tremelo	436
8000	Vilvoorde	436
8001	Wemmel	436
8002	Wezembeek-Oppem	436
8003	Zaventem	436
8004	Zemst	436
8005	Zoutleeuw	436
8006	Callenelle	437
8007	Marcinelle	437
8008	Strepy-Bracquegnies	437
8009	Alveringem	438
8010	Anzegem	438
8011	Ardooie	438
8012	Avelgem	438
8013	Beernem	438
8014	Blankenberge	438
8015	Bredene	438
8016	Brugge	438
8017	Damme	438
8018	De Haan	438
8019	De Panne	438
8020	Deerlijk	438
8021	Dentergem	438
8022	Diksmuide	438
8023	Geluveld	438
8024	Gistel	438
8025	Harelbeke	438
8026	Heuvelland	438
8027	Hooglede	438
8028	Houthulst	438
8029	Ichtegem	438
8030	Ieper	438
8031	Ingelmunster	438
8032	Ingooigem	438
8033	Izegem	438
8034	Jabbeke	438
8035	Knokke-Heist	438
8036	Koekelare	438
8037	Koksijde	438
8038	Kortemark	438
8039	Kortrijk	438
8040	Kuurne	438
8041	Langemark-Poelkapelle	438
8042	Ledegem	438
8043	Lendelede	438
8044	Lichtervelde	438
8045	Lo-Reninge	438
8046	Menen	438
8047	Mesen	438
8048	Meulebeke	438
8049	Middelkerke	438
8050	Moorslede	438
8051	Nieuwpoort	438
8052	Oostende	438
8053	Oostkamp	438
8054	Oostrozebeke	438
8055	Oudenburg	438
8056	Pittem	438
8057	Poperinge	438
8058	Roeselare	438
8059	Ruiselede	438
8060	Spiere-Helkijn	438
8061	Staden	438
8062	Tielt	438
8063	Torhout	438
8064	Veurne	438
8065	Vleteren	438
8066	Waregem	438
8067	Wervik	438
8068	Wevelgem	438
8069	Wielsbeke	438
8070	Wingene	438
8071	Zedelgem	438
8072	Zeebrugge	438
8073	Zonnebeke	438
8074	Zuienkerke	438
8075	Zwevegem	438
8076	Belize	439
8077	San Pedro	439
8078	Belmopan	440
8079	Benque Viejo	440
8080	San Ignacio	440
8081	Corozal	441
8082	Punta Gorda	444
8083	Kandi	445
8084	Malanville	445
8085	Batia	446
8086	Boukombe	446
8087	Kouande	446
8088	Natitingou	446
8089	Allada	447
8090	Cotonou	447
8091	Ouidah	447
8092	Tanguiete	447
8093	Bembereke	448
8094	Nikki	448
8095	Parakou	448
8096	Tchaourou	448
8097	Dassa	449
8098	Savalou	449
8099	Save	449
8100	Aplahoue	450
8101	Dogbo	450
8102	Djougou	451
8103	Cotonou	452
8104	Athieme	453
8105	Come	453
8106	Grand Popo	453
8107	Lokossa	453
8108	Adjohoun	454
8109	Porto Novo	454
8110	Ketou	455
8111	Pobe	455
8112	Sakete	455
8113	Abomey	456
8114	Bohicon	456
8115	Cove	456
8116	Zagnanado	456
8117	Hamilton	457
8118	Jakar	459
8119	Chhukha	460
8120	Phuentsholing	460
8121	Damphu	461
8122	Taga Dzong	462
8123	Geylegphug	463
8124	Ha	464
8125	Lhuntshi	465
8126	Mongar	466
8127	Pemagatsel	467
8128	Gasa	468
8129	Punakha	468
8130	Paro	469
8131	Phuntsholing	470
8132	Samchi	470
8133	Shemgang	472
8134	Tashigang	473
8135	Thimphu	474
8136	Timphu	474
8137	Tongsa	475
8138	Wangdiphodrang	476
8139	Guayaramerin	477
8140	Magdalena	477
8141	Reyes	477
8142	Riberalta	477
8143	Rurrenabaque	477
8144	San Borja	477
8145	San Ignacio	477
8146	San Ramon	477
8147	Santa Ana	477
8148	Santa Rosa	477
8149	Trinidad	477
8150	Camargo	478
8151	Monteagudo	478
8152	Muyupampa	478
8153	Padilla	478
8154	Sucre	478
8155	Tarabuco	478
8156	Villa Serano	478
8157	Aiquile	479
8158	Arani	479
8159	Capinota	479
8160	Chimore	479
8161	Cliza	479
8162	Cochabamba	479
8163	Colomi	479
8164	Entre Rios	479
8165	Irpa Irpa	479
8166	Ivirgarzama	479
8167	Mizque	479
8168	Punata	479
8169	Shinahota	479
8170	Sipe Sipe	479
8171	Tarata	479
8172	Ucurena	479
8173	Caracollo	481
8174	Challapata	481
8175	Eucaliptus	481
8176	Huanuni	481
8177	Machacamarca	481
8178	Oruro	481
8179	Poopo	481
8180	Santiago de Huari	481
8181	Totoral	481
8182	Cobija	482
8183	Atocha	483
8184	Betanzos	483
8185	Colquechaca	483
8186	Llallagua	483
8187	Potosi	483
8188	Santa Barbara	483
8189	Tupiza	483
8190	Uncia	483
8191	Uyuni	483
8192	Villazon	483
8193	Bermejo	485
8194	Entre Rios	485
8195	San Lorenzo	485
8196	Tarija	485
8197	Villamontes	485
8198	Yacuiba	485
8199	Kachikau	493
8200	Kasane	493
8201	Kavimba	493
8202	Kazungula	493
8203	Lesoma	493
8204	Muchinje-Mabale	493
8205	Pandamatenga	493
8206	Pandamatenga Botswana Defence 	493
8207	Parakarungu	493
8208	Satau	493
8209	Francistown	494
8210	Gaborone	495
8211	Bere	496
8212	Charles Hill	496
8213	Chobokwane	496
8214	Dekar	496
8215	East Hanahai	496
8216	Ghanzi	496
8217	Groote Laagte	496
8218	Kacgae	496
8219	Karakobis	496
8220	Kuke Quarantine Camp	496
8221	Kule	496
8222	Makunda	496
8223	Ncojane	496
8224	New Xade	496
8225	New Xanagas	496
8226	Qabo	496
8227	Tsootsha	496
8228	West Hanahai	496
8229	Jwaneng	497
8230	Artisia	500
8231	Bokaa	500
8232	Dikgonye	500
8233	Dikwididi	500
8234	Kgomodiatshaba	500
8235	Khurutshe	500
8236	Leshibitse	500
8237	Mabalane	500
8238	Malolwane	500
8239	Malotwana Siding	500
8240	Matebeleng	500
8241	Mmamashia	500
8242	Mmathubudukwane	500
8243	Mochudi	500
8244	Modipane	500
8245	Morwa	500
8246	Oliphants Drift	500
8247	Oodi	500
8248	Pilane	500
8249	Ramonaka	500
8250	Ramotlabaki	500
8251	Rasesa	500
8252	Sikwane	500
8253	Boatlaname	501
8254	Botlhapatlou	501
8255	Diagane	501
8256	Diphudugodu	501
8257	Diremogolo Lands	501
8258	Ditshegwane	501
8259	Ditshukudu	501
8260	Dumadumane	501
8261	Dutlwe	501
8262	Gabane	501
8263	Gakgatla	501
8264	Gakuto	501
8265	Galekgatshwane	501
8266	Gamodubu	501
8267	Gaphatshwa	501
8268	Hatsalatladi	501
8269	Kamenakwe	501
8270	Kaudwane	501
8271	Kgaphamadi	501
8272	Kgope	501
8273	Khekhenya-Chepetese	501
8274	Khudumelapye	501
8275	Kopong	501
8276	Kotolaname	501
8277	Kubung	501
8278	Kumakwane	501
8279	Kweneng	501
8280	Lentsweletau	501
8281	Lephepe	501
8282	Lesirane	501
8283	Letlhakeng	501
8284	Losilakgokong	501
8285	Maboane	501
8286	Mahetlwe	501
8287	Makabanyane-Dikgokong	501
8288	Malwelwe	501
8289	Mamhiko	501
8290	Manaledi	501
8291	Mantshwabisi	501
8292	Marejwane	501
8293	Masebele	501
8294	Medie	501
8295	Metsibotlhoko	501
8296	Metsimotlhaba	501
8297	Mmakanke	501
8298	Mmankgodi	501
8299	Mmanoko	501
8300	Mmokolodi	501
8301	Mmopane	501
8302	Mmopane Lands	501
8303	Mogoditshane	501
8304	Mogoditshane Botswana Defence 	501
8305	Mogoditshane Lands	501
8306	Mogonono	501
8307	Molepolole	501
8308	Mononyane	501
8309	Monwane	501
8310	Morabane	501
8311	Morope	501
8312	Moshaweng	501
8313	Mosokotswe	501
8314	Motokwe	501
8315	Ngware	501
8316	Nkoyaphiri	501
8317	Ramaphatlhe	501
8318	Salajwe	501
8319	Serinane	501
8320	Sesung	501
8321	Shadishadi	501
8322	Sojwe	501
8323	Sorilatholo	501
8324	Suping	501
8325	Takatokwane	501
8326	Thamaga	501
8327	Thebephatshwa	501
8328	Tlowaneng	501
8329	Tsetseng	501
8330	Tswaane	501
8331	Lobatse	502
8332	Bodibeng	503
8333	Boro	503
8334	Botlhatlogo	503
8335	Chanoga	503
8336	Chuchubega	503
8337	Daonara	503
8338	Ditshiping	503
8339	Habu	503
8340	Jao	503
8341	Kareng	503
8342	Katamaga	503
8343	Kgakge	503
8344	Khwai Camp	503
8345	Komana	503
8346	Legotlhwana	503
8347	Mababe	503
8348	Makalamabedi	503
8349	Matlapana	503
8350	Matsaudi	503
8351	Mawana	503
8352	Mokgalo-Haka	503
8353	Morutsha	503
8354	Nxharaga	503
8355	Phuduhudu	503
8356	Samodupi	503
8357	Sankuyo	503
8358	Sehithwa	503
8359	Semboyo	503
8360	Sexaxa	503
8361	Shakawe	503
8362	Shorobe	503
8363	Somela	503
8364	Toteng	503
8365	Tsanekona	503
8366	Tsao	503
8367	Xaxaba	503
8368	Xhobe	503
8369	Bethel	504
8370	Borobadilepe	504
8371	Diabo	504
8372	Digawana	504
8373	Dikhukhung	504
8374	Dinatshana	504
8375	Dipotsana	504
8376	Ditlharapa	504
8377	Gamajalela	504
8378	Gasita	504
8379	Gathwane	504
8380	Good Hope	504
8381	Goora-seno	504
8382	Gopong	504
8383	Hebron	504
8384	Itholoke	504
8385	Kanaku	504
8386	Kangwe	504
8387	Kanye	504
8388	Keng	504
8389	Kgomokasitwa	504
8390	Kgoro	504
8391	Khakhea	504
8392	Khonkhwa	504
8393	Kokong	504
8394	Lehoko	504
8395	Lejwana	504
8396	Lekgolobotlo	504
8397	Leporung	504
8398	Logagane	504
8399	Lorolwana	504
8400	Lorwana	504
8401	Lotlhakane	504
8402	Lotlhakane West	504
8403	Mabule	504
8404	Mabutsane	504
8405	Madingwana	504
8406	Magoriapitse	504
8407	Magotlhawane	504
8408	Mahotshwane	504
8409	Maisane	504
8410	Makokwe	504
8411	Malokaganyane	504
8412	Manyana	504
8413	Maokane	504
8414	Marojane	504
8415	Maruswa	504
8416	Metlobo	504
8417	Metlojane	504
8418	Mmakgori	504
8419	Mmathethe	504
8420	Mogojogojo	504
8421	Mogonye	504
8422	Mogwalale	504
8423	Mokatako	504
8424	Mokgomane	504
8425	Mokhomba	504
8426	Molapowabojang	504
8427	Molete	504
8428	Morwamosu	504
8429	Moshaneng	504
8430	Moshupa	504
8431	Motlhwatse	504
8432	Motsentshe	504
8433	Musi	504
8434	Ngwatsau	504
8435	Ntlhantlhe	504
8436	Papatlo	504
8437	Phihitshwane	504
8438	Pitsana-Potokwe	504
8439	Pitsane	504
8440	Pitseng-Ralekgetho	504
8441	Pitshane Molopo	504
8442	Rakhuna	504
8443	Ralekgetho	504
8444	Ramatlabama	504
8445	Ranaka	504
8446	Sedibeng	504
8447	Segakwana	504
8448	Segwagwa	504
8449	Seherelela	504
8450	Sekhutlane	504
8451	Sekoma	504
8452	Selokolela	504
8453	Semane	504
8454	Sese	504
8455	Sesung	504
8456	Sheep Farm	504
8457	Tlhankane	504
8458	Tlhareseleele	504
8459	Tshidilamolomo	504
8460	Tshwaane	504
8461	Tsonyane	504
8462	Tswaaneng	504
8463	Tswagare-Lothoje-Lokalana	504
8464	Tswanyaneng	504
8465	Beetsha	506
8466	Eretsha	506
8467	Etsha 1	506
8468	Etsha 13	506
8469	Etsha 6	506
8470	Etsha 8	506
8471	Etsha 9	506
8472	Gane	506
8473	Gonutsuga	506
8474	Gowe	506
8475	Gudingwa	506
8476	Gumare	506
8477	Ikoga	506
8478	Kajaja	506
8479	Kapotora Lands	506
8480	Kauxwhi	506
8481	Matswee	506
8482	Maun	506
8483	Moaha	506
8484	Mohembo East	506
8485	Mohembo West	506
8486	Mokgacha	506
8487	Ngarange	506
8488	Nokaneng	506
8489	Nxamasere	506
8490	Nxaunxau	506
8491	Nxwee	506
8492	Qangwa	506
8493	Roye	506
8494	Samochema	506
8495	Sekondomboro	506
8496	Sepopa	506
8497	Seronga	506
8498	Shaowe	506
8499	Tobere Lands	506
8500	Tubu	506
8501	Tubu Lands	506
8502	Xadau	506
8503	Xakao	506
8504	Xaxa	506
8505	Xhauga	506
8506	Xurube	506
8507	Orapa	507
8508	Sowa	510
8509	Acrelandia	512
8510	Brasileia	512
8511	Cruzeiro do Sul	512
8512	Epitaciolandia	512
8513	Feijo	512
8514	Mancio Lima	512
8515	Manoel Urbano	512
8516	Marechal Thaumaturgo	512
8517	Placido de Castro	512
8518	Porto Walter	512
8519	Rio Branco	512
8520	Rodrigues Alves	512
8521	Sena Madureira	512
8522	Senador Guiomard	512
8523	Tarauaca	512
8524	Xapuri	512
8525	Agua Branca	513
8526	Anadia	513
8527	Arapiraca	513
8528	Atalaia	513
8529	Barra de Santo Antonio	513
8530	Batalha	513
8531	Boca da Mata	513
8532	Cacimbinhas	513
8533	Cajueiro	513
8534	Campo Alegre	513
8535	Campo Grande	513
8536	Canapi	513
8537	Capela	513
8538	Coite do Noia	513
8539	Colonia Leopoldina	513
8540	Coruripe	513
8541	Craibas	513
8542	Delmiro Gouveia	513
8543	Dois Riachos	513
8544	Estrela de Alagoas	513
8545	Feira Grande	513
8546	Flexeiras	513
8547	Girau do Ponciano	513
8548	Ibateguara	513
8549	Igaci	513
8550	Igreja Nova	513
8551	Inhapi	513
8552	Joaquim Gomes	513
8553	Jundia	513
8554	Junqueiro	513
8555	Lagoa da Canoa	513
8556	Limoeiro de Anadia	513
8557	Maceio	513
8558	Major Isidoro	513
8559	Maragogi	513
8560	Maravilha	513
8561	Marechal Deodoro	513
8562	Maribondo	513
8563	Mata Grande	513
8564	Matriz de Camaragibe	513
8565	Messias	513
8566	Minador do Negrao	513
8567	Murici	513
8568	Novo Lino	513
8569	Olho dAgua das Flores	513
8570	Olivenca	513
8571	Palmeira dos Indios	513
8572	Pao de Acucar	513
8573	Passo de Camaragibe	513
8574	Penedo	513
8575	Piacabucu	513
8576	Pilar	513
8577	Piranhas	513
8578	Poco das Trincheiras	513
8579	Porto Calvo	513
8580	Porto Real do Colegio	513
8581	Quebrangulo	513
8582	Rio Largo	513
8583	Santana do Ipanema	513
8584	Santana do Mundau	513
8585	Sao Jose da Laje	513
8586	Sao Jose da Tapera	513
8587	Sao Luis do Quitunde	513
8588	Sao Miguel dos Campos	513
8589	Sao Sebastiao	513
8590	Satuba	513
8591	Senador Rui Palmeira	513
8592	Taquarana	513
8593	Teotonio Vilela	513
8594	Traipu	513
8595	Uniao dos Palmares	513
8596	Vicosa	513
8597	Amapa	514
8598	Laranjal do Jari	514
8599	Macapa	514
8600	Mazagao	514
8601	Oiapoque	514
8602	Santana	514
8603	Alvaraes	515
8604	Anori	515
8605	Apui	515
8606	Autazes	515
8607	Barcelos	515
8608	Barreirinha	515
8609	Benjamin Constant	515
8610	Boca do Acre	515
8611	Borba	515
8612	Canutama	515
8613	Carauari	515
8614	Careiro	515
8615	Careiro da Varzea	515
8616	Coari	515
8617	Codajas	515
8618	Eirunepe	515
8619	Envira	515
8620	Fonte Boa	515
8621	Guajara	515
8622	Humaita	515
8623	Ipixuna	515
8624	Iranduba	515
8625	Itacoatiara	515
8626	Japura	515
8627	Jutai	515
8628	Labrea	515
8629	Manacapuru	515
8630	Manaquiri	515
8631	Manaus	515
8632	Manicore	515
8633	Maraa	515
8634	Maues	515
8635	Nhamunda	515
8636	Nova Olinda do Norte	515
8637	Novo Airao	515
8638	Novo Aripuana	515
8639	Parintins	515
8640	Pauini	515
8641	Rio Preto da Eva	515
8642	Santa Isabel do Rio Negro	515
8643	Santo Antonio do Ica	515
8644	Sao Gabriel da Cachoeira	515
8645	Sao Paulo de Olivenca	515
8646	Tabatinga	515
8647	Tapaua	515
8648	Tefe	515
8649	Tonantins	515
8650	Uarini	515
8651	Urucara	515
8652	Urucurituba	515
8653	Acajutiba	516
8654	Alagoinhas	516
8655	Amargosa	516
8656	Amelia Rodrigues	516
8657	America Dourada	516
8658	Anage	516
8659	Araci	516
8660	Aurelino Leal	516
8661	Baixa Grande	516
8662	Barra	516
8663	Barra da Estiva	516
8664	Barra do Choca	516
8665	Barreiras	516
8666	Belmonte	516
8667	Boa Vista do Tupim	516
8668	Bom Jesus da Lapa	516
8669	Boquira	516
8670	Brumado	516
8671	Buerarema	516
8672	Cachoeira	516
8673	Cacule	516
8674	Caetite	516
8675	Cafarnaum	516
8676	Camacan	516
8677	Camacari	516
8678	Camamu	516
8679	Campo Alegre de Lourdes	516
8680	Campo Formoso	516
8681	Canarana	516
8682	Canavieiras	516
8683	Candeias	516
8684	Candido Sales	516
8685	Cansancao	516
8686	Capim Grosso	516
8687	Caravelas	516
8688	Carinhanha	516
8689	Casa Nova	516
8690	Castro Alves	516
8691	Catu	516
8692	Cicero Dantas	516
8693	Cipo	516
8694	Coaraci	516
8695	Conceicao da Feira	516
8696	Conceicao do Almeida	516
8697	Conceicao do Coite	516
8698	Conceicao do Jacuipe	516
8699	Conde	516
8700	Coracao de Maria	516
8701	Coronel Joao Sa	516
8702	Correntina	516
8703	Cruz das Almas	516
8704	Curaca	516
8705	Dias dAvila	516
8706	Encruzilhada	516
8707	Entre Rios	516
8708	Esplanada	516
8709	Euclides da Cunha	516
8710	Eunapolis	516
8711	Feira de Santana	516
8712	Filadelfia	516
8713	Formosa do Rio Preto	516
8714	Gandu	516
8715	Guanambi	516
8716	Guaratinga	516
8717	Iacu	516
8718	Ibicarai	516
8719	Ibicui	516
8720	Ibipeba	516
8721	Ibirapitanga	516
8722	Ibirataia	516
8723	Ibotirama	516
8724	Iguai	516
8725	Ilheus	516
8726	Inhambupe	516
8727	Ipiau	516
8728	Ipira	516
8729	Iraquara	516
8730	Irara	516
8731	Irece	516
8732	Itabela	516
8733	Itaberaba	516
8734	Itabuna	516
8735	Itacare	516
8736	Itagi	516
8737	Itagiba	516
8738	Itajuipe	516
8739	Itamaraju	516
8740	Itambe	516
8741	Itanhem	516
8742	Itaparica	516
8743	Itapetinga	516
8744	Itapicuru	516
8745	Itarantim	516
8746	Itirucu	516
8747	Itiuba	516
8748	Itororo	516
8749	Ituacu	516
8750	Itubera	516
8751	Jacobina	516
8752	Jaguaquara	516
8753	Jaguarari	516
8754	Jequie	516
8755	Jeremoabo	516
8756	Jitauna	516
8757	Joao Dourado	516
8758	Juazeiro	516
8759	Jussara	516
8760	Laje	516
8761	Lapao	516
8762	Lauro de Freitas	516
8763	Livramento	516
8764	Macarani	516
8765	Macaubas	516
8766	Madre de Deus	516
8767	Mairi	516
8768	Maracas	516
8769	Maragogipe	516
8770	Marau	516
8771	Mascote	516
8772	Mata de Sao Joao	516
8773	Medeiros Neto	516
8774	Miguel Calmon	516
8775	Milagres	516
8776	Monte Santo	516
8777	Morro de Chapeu	516
8778	Mucuri	516
8779	Mundo Novo	516
8780	Muritiba	516
8781	Mutuipe	516
8782	Nazare	516
8783	Nova Soure	516
8784	Nova Vicosa	516
8785	Olindina	516
8786	Oliveira dos Brejinhos	516
8787	Palmas de Monte Alto	516
8788	Paramirim	516
8789	Paratinga	516
8790	Paripiranga	516
8791	Pau Brasil	516
8792	Paulo Afonso	516
8793	Pilao Arcado	516
8794	Pindobacu	516
8795	Piritiba	516
8796	Planalto	516
8797	Pocoes	516
8798	Pojuca	516
8799	Ponto Novo	516
8800	Porto Seguro	516
8801	Prado	516
8802	Presidente Tancredo Neves	516
8803	Queimadas	516
8804	Quijingue	516
8805	Rafael Jambeiro	516
8806	Remanso	516
8807	Riachao das Neves	516
8808	Riachao do Jacuipe	516
8809	Riacho de Santana	516
8810	Ribeira do Pombal	516
8811	Rio Real	516
8812	Ruy Barbosa	516
8813	Salvador	516
8814	Santa Cruz Cabralia	516
8815	Santa Ines	516
8816	Santa Maria da Vitoria	516
8817	Santa Rita de Cassia	516
8818	Santaluz	516
8819	Santana	516
8820	Santo Amaro	516
8821	Santo Antonio de Jesus	516
8822	Santo Estevao	516
8823	Sao Desiderio	516
8824	Sao Felipe	516
8825	Sao Francisco do Conde	516
8826	Sao Gabriel	516
8827	Sao Goncalo dos Campos	516
8828	Sao Sebastiao do Passe	516
8829	Saubara	516
8830	Seabra	516
8831	Senhor do Bonfim	516
8832	Sento Se	516
8833	Serra Dourada	516
8834	Serra do Ramalho	516
8835	Serrinha	516
8836	Simoes Filho	516
8837	Sobradinho	516
8838	Souto Soares	516
8839	Tanhacu	516
8840	Taperoa	516
8841	Tapiramuta	516
8842	Teixeira de Freitas	516
8843	Teofilandia	516
8844	Terra Nova	516
8845	Tremedal	516
8846	Tucano	516
8847	Uaua	516
8848	Ubaira	516
8849	Ubaitaba	516
8850	Ubata	516
8851	Una	516
8852	Urucuca	516
8853	Utinga	516
8854	Valenca	516
8855	Valente	516
8856	Vera Cruz	516
8857	Vitoria da Conquista	516
8858	Wenceslau Guimaraes	516
8859	Xique-Xique	516
8860	Acarau	517
8861	Acopiara	517
8862	Amontada	517
8863	Aquiraz	517
8864	Aracati	517
8865	Aracoiaba	517
8866	Araripe	517
8867	Assare	517
8868	Aurora	517
8869	Barbalha	517
8870	Barro	517
8871	Barroquinha	517
8872	Baturite	517
8873	Beberibe	517
8874	Bela Cruz	517
8875	Boa Viagem	517
8876	Brejo Santo	517
8877	Camocim	517
8878	Campos Sales	517
8879	Caninde	517
8880	Carire	517
8881	Caririacu	517
8882	Cascavel	517
8883	Caucaia	517
8884	Cedro	517
8885	Chorozinho	517
8886	Coreau	517
8887	Crateus	517
8888	Crato	517
8889	Cruz	517
8890	Eusebio	517
8891	Farias Brito	517
8892	Forquilha	517
8893	Fortaleza	517
8894	Granja	517
8895	Guaiuba	517
8896	Guaraciaba do Norte	517
8897	Hidrolandia	517
8898	Horizonte	517
8899	Ibiapina	517
8900	Ico	517
8901	Iguatu	517
8902	Independencia	517
8903	Ipu	517
8904	Ipueiras	517
8905	Iraucuba	517
8906	Itaitinga	517
8907	Itapage	517
8908	Itapipoca	517
8909	Itarema	517
8910	Jaguaribe	517
8911	Jaguaruana	517
8912	Jardim	517
8913	Juazeiro do Norte	517
8914	Jucas	517
8915	Lavras da Mangabeira	517
8916	Limoeiro do Norte	517
8917	Maracanau	517
8918	Maranguape	517
8919	Marco	517
8920	Massape	517
8921	Mauriti	517
8922	Milagres	517
8923	Missao Velha	517
8924	Mombaca	517
8925	Morada Nova	517
8926	Nova Russas	517
8927	Novo Oriente	517
8928	Ocara	517
8929	Oros	517
8930	Pacajus	517
8931	Pacatuba	517
8932	Paracuru	517
8933	Paraipaba	517
8934	Parambu	517
8935	Pedra Branca	517
8936	Pentecoste	517
8937	Quixada	517
8938	Quixeramobim	517
8939	Quixere	517
8940	Redencao	517
8941	Reriutaba	517
8942	Russas	517
8943	Santa Quiteria	517
8944	Santana do Acarau	517
8945	Sao Benedito	517
8946	Sao Goncalo do Amarante	517
8947	Senador Pompeu	517
8948	Sobral	517
8949	Tabuleiro do Norte	517
8950	Tamboril	517
8951	Taua	517
8952	Tiangua	517
8953	Trairi	517
8954	Ubajara	517
8955	Umirim	517
8956	Uruburetama	517
8957	Varjota	517
8958	Varzea Alegre	517
8959	Vicosa do Ceara	517
8960	Abadiania	521
8961	Acreuna	521
8962	Aguas Lindas de Goias	521
8963	Alexania	521
8964	Anapolis	521
8965	Anicuns	521
8966	Aparecida de Goiania	521
8967	Aragarcas	521
8968	Bela Vista de Goias	521
8969	Bom Jesus de Goias	521
8970	Buriti Alegre	521
8971	Cacu	521
8972	Caiaponia	521
8973	Caldas Novas	521
8974	Campos Belos	521
8975	Campos Verdes	521
8976	Carmo do Rio Verde	521
8977	Catalao	521
8978	Cavalcante	521
8979	Ceres	521
8980	Cidade Ocidental	521
8981	Cocalzinho de Coias	521
8982	Cristalina	521
8983	Crixas	521
8984	Doverlandia	521
8985	Edeia	521
8986	Firminopolis	521
8987	Formosa	521
8988	Goianapolis	521
8989	Goianesia	521
8990	Goiania	521
8991	Goianira	521
8992	Goias	521
8993	Goiatuba	521
8994	Guapo	521
8995	Hidrolandia	521
8996	Iaciara	521
8997	Indiara	521
8998	Inhumas	521
8999	Ipameri	521
9000	Ipora	521
9001	Itaberai	521
9002	Itapaci	521
9003	Itapirapua	521
9004	Itapuranga	521
9005	Itumbiara	521
9006	Jaragua	521
9007	Jatai	521
9008	Jussara	521
9009	Luziania	521
9010	Mara Rosa	521
9011	Minacu	521
9012	Mineiros	521
9013	Morrinhos	521
9014	Mozarlandia	521
9015	Neropolis	521
9016	Niquelandia	521
9017	Nova Crixas	521
9018	Novo Gama	521
9019	Orizona	521
9020	Padre Bernardo	521
9021	Palmeiras de Goias	521
9022	Parauna	521
9023	Petrolina de Goias	521
9024	Piracanjuba	521
9025	Piranhas	521
9026	Pirenopolis	521
9027	Pires do Rio	521
9028	Planaltina	521
9029	Pontalina	521
9030	Porangatu	521
9031	Posse	521
9032	Quirinopolis	521
9033	Rialma	521
9034	Rio Verde	521
9035	Rubiataba	521
9036	Santa Helena de Goias	521
9037	Santa Terezinha de Goias	521
9038	Santo Antonio do Descoberto	521
9039	Sao Domingos	521
9040	Sao Luis de Montes Belos	521
9041	Sao Miguel do Araguaia	521
9042	Sao Simao	521
9043	Senador Canedo	521
9044	Silvania	521
9045	Trindade	521
9046	Uruacu	521
9047	Uruana	521
9048	Valparaiso de Goias	521
9049	Vianopolis	521
9050	Acailandia	522
9051	Alcantara	522
9052	Aldeias Altas	522
9053	Alto Alegre do Pindare	522
9054	Amarante do Maranhao	522
9055	Anajatuba	522
9056	Araioses	522
9057	Arame	522
9058	Arari	522
9059	Bacabal	522
9060	Balsas	522
9061	Barra do Corda	522
9062	Barreirinhas	522
9063	Bequimao	522
9064	Bom Jardim	522
9065	Brejo	522
9066	Buriti	522
9067	Buriti Bravo	522
9068	Buriticupu	522
9069	Candido Mendes	522
9070	Cantanhede	522
9071	Carolina	522
9072	Carutapera	522
9073	Caxias	522
9074	Chapadinha	522
9075	Codo	522
9076	Coelho Neto	522
9077	Colinas	522
9078	Coroata	522
9079	Cururupu	522
9080	Davinopolis	522
9081	Dom Pedro	522
9082	Esperantinopolis	522
9083	Estreito	522
9084	Fortuna	522
9085	Godofredo Viana	522
9086	Governador Eugenio Barros	522
9087	Governador Nunes Freire	522
9088	Grajau	522
9089	Humberto de Campos	522
9090	Icatu	522
9091	Imperatriz	522
9092	Itapecuru Mirim	522
9093	Itinga do Maranhao	522
9094	Joao Lisboa	522
9095	Lago da Pedra	522
9096	Lago do Junco	522
9097	Maracacume	522
9098	Matinha	522
9099	Matoes	522
9100	Mirador	522
9101	Miranda do Norte	522
9102	Moncao	522
9103	Montes Altos	522
9104	Morros	522
9105	Nova Olinda do Maranhao	522
9106	Olho dAgua das Cunhas	522
9107	Paco do Lumiar	522
9108	Paraibano	522
9109	Parnarama	522
9110	Passagem Franca	522
9111	Pastos Bons	522
9112	Paulo Ramos	522
9113	Pedreiras	522
9114	Penalva	522
9115	Pindare Mirim	522
9116	Pinheiro	522
9117	Pio XII	522
9118	Pirapemas	522
9119	Pocao de Pedras	522
9120	Porto Franco	522
9121	Presidente Dutra	522
9122	Raposa	522
9123	Riachao	522
9124	Rosario	522
9125	Santa Helena	522
9126	Santa Ines	522
9127	Santa Luzia	522
9128	Santa Luzia do Parua	522
9129	Santa Quiteria do Maranhao	522
9130	Santa Rita	522
9131	Sao Benedito do Rio Preto	522
9132	Sao Bento	522
9133	Sao Bernardo	522
9134	Sao Domingos do Maranhao	522
9135	Sao Joao Batista	522
9136	Sao Joao dos Patos	522
9137	Sao Jose de Ribamar	522
9138	Sao Luis	522
9139	Sao Luis Gonzaga do Maranhao	522
9140	Sao Mateus do Maranhao	522
9141	Sao Pedro da Agua Branca	522
9142	Sao Raimundo das Mangabeiras	522
9143	Timbiras	522
9144	Timon	522
9145	Trizidela do Vale	522
9146	Tuntum	522
9147	Turiacu	522
9148	Tutoia	522
9149	Urbano Santos	522
9150	Vargem Grande	522
9151	Viana	522
9152	Vitoria do Mearim	522
9153	Vitorino Freire	522
9154	Ze Doca	522
9155	Abaetetuba	526
9156	Acara	526
9157	Afua	526
9158	Agua Azul do Norte	526
9159	Alenquer	526
9160	Almeirim	526
9161	Altamira	526
9162	Ananindeua	526
9163	Augusto Correa	526
9164	Baiao	526
9165	Barcarena	526
9166	Belem	526
9167	Benevides	526
9168	Braganca	526
9169	Breu Branco	526
9170	Breves	526
9171	Bujaru	526
9172	Cameta	526
9173	Capanema	526
9174	Capitao Poco	526
9175	Castanhal	526
9176	Conceicao do Araguaia	526
9177	Concordia do Para	526
9178	Curionopolis	526
9179	Curuca	526
9180	Dom Eliseu	526
9181	Eldorado dos Carajas	526
9182	Garrafao do Norte	526
9183	Goianesia do Para	526
9184	Gurupa	526
9185	Igarape-Acu	526
9186	Igarape-Miri	526
9187	Irituia	526
9188	Itaituba	526
9189	Itupiranga	526
9190	Jacareacanga	526
9191	Jacunda	526
9192	Juruti	526
9193	Limoeiro do Ajuru	526
9194	Mae do Rio	526
9195	Maraba	526
9196	Maracana	526
9197	Marapanim	526
9198	Marituba	526
9199	Medicilandia	526
9200	Mocajuba	526
9201	Moju	526
9202	Monte Alegre	526
9203	Muana	526
9204	Novo Progresso	526
9205	Novo Repartimento	526
9206	Obidos	526
9207	Oeiras do Para	526
9208	Oriximina	526
9209	Ourem	526
9210	Ourilandia	526
9211	Pacaja	526
9212	Paragominas	526
9213	Parauapebas	526
9214	Portel	526
9215	Porto de Moz	526
9216	Prainha	526
9217	Redencao	526
9218	Rio Maria	526
9219	Rondon do Para	526
9220	Ruropolis	526
9221	Salinopolis	526
9222	Santa Isabel do Para	526
9223	Santa Luzia do Para	526
9224	Santa Maria do Para	526
9225	Santana do Araguaia	526
9226	Santarem	526
9227	Santo Antonio do Taua	526
9228	Sao Caetano de Odivelas	526
9229	Sao Domingos do Araguaia	526
9230	Sao Domingos do Capim	526
9231	Sao Felix do Xingu	526
9232	Sao Geraldo do Araguaia	526
9233	Sao Joao de Pirabas	526
9234	Sao Miguel do Guama	526
9235	Senador Jose Porfirio	526
9236	Soure	526
9237	Tailandia	526
9238	Terra Santa	526
9239	Tome-Acu	526
9240	Tucuma	526
9241	Tucurui	526
9242	Ulianopolis	526
9243	Uruara	526
9244	Vigia	526
9245	Viseu	526
9246	Xinguara	526
9247	Alagoa Grande	527
9248	Alagoa Nova	527
9249	Alagoinha	527
9250	Alhandra	527
9251	Aracagi	527
9252	Arara	527
9253	Araruna	527
9254	Areia	527
9255	Aroeiras	527
9256	Bananeiras	527
9257	Barra de Santa Rosa	527
9258	Bayeux	527
9259	Belem	527
9260	Boqueirao	527
9261	Brejo do Cruz	527
9262	Caapora	527
9263	Cabedelo	527
9264	Cacimba de Dentro	527
9265	Cajazeiras	527
9266	Campina Grande	527
9267	Catole do Rocha	527
9268	Conceicao	527
9269	Conde	527
9270	Coremas	527
9271	Cruz do Espirito Santo	527
9272	Cuite	527
9273	Desterro	527
9274	Dona Ines	527
9275	Esperanca	527
9276	Fagundes	527
9277	Guarabira	527
9278	Gurinhem	527
9279	Imaculada	527
9280	Inga	527
9281	Itabaiana	527
9282	Itaporanga	527
9283	Itapororoca	527
9284	Itatuba	527
9285	Jacarau	527
9286	Joao Pessoa	527
9287	Juazeirinho	527
9288	Juripiranga	527
9289	Juru	527
9290	Lagoa Seca	527
9291	Mamanguape	527
9292	Manaira	527
9293	Mari	527
9294	Massaranduba	527
9295	Mogeiro	527
9296	Monteiro	527
9297	Mulungu	527
9298	Natuba	527
9299	Nova Floresta	527
9300	Patos	527
9301	Paulista	527
9302	Pedras de Fogo	527
9303	Pianco	527
9304	Picui	527
9305	Pilar	527
9306	Pirpirituba	527
9307	Pitimbu	527
9308	Pocinhos	527
9309	Pombal	527
9310	Princesa Isabel	527
9311	Puxinana	527
9312	Queimadas	527
9313	Remigio	527
9314	Rio Tinto	527
9315	Salgado de Sao Felix	527
9316	Santa Luzia	527
9317	Santa Rita	527
9318	Sao Bento	527
9319	Sao Joao do Rio do Peixe	527
9320	Sao Jose de Piranhas	527
9321	Sao Sebastiao de Lagoa de Roca	527
9322	Sape	527
9323	Serra Branca	527
9324	Solanea	527
9325	Soledade	527
9326	Sousa	527
9327	Sume	527
9328	Taperoa	527
9329	Tavares	527
9330	Teixeira	527
9331	Triunfo	527
9332	Uirauna	527
9333	Umbuzeiro	527
9334	Almirante Tamandare	528
9335	Alto Parana	528
9336	Alto Piquiri	528
9337	Altonia	528
9338	Ampere	528
9339	Andira	528
9340	Antonina	528
9341	Apucarana	528
9342	Arapongas	528
9343	Arapoti	528
9344	Araucaria	528
9345	Assai	528
9346	Assis Chateaubriand	528
9347	Astorga	528
9348	Bandeirantes	528
9349	Barbosa Ferraz	528
9350	Bela Vista do Paraiso	528
9351	Cambara	528
9352	Cambe	528
9353	Campina Grande do Sul	528
9354	Campina da Lagoa	528
9355	Campo Largo	528
9356	Campo Murao	528
9357	Candido de Abreu	528
9358	Capitao Leonidas Marques	528
9359	Carambei	528
9360	Cascavel	528
9361	Castro	528
9362	Centenario do Sul	528
9363	Chopinzinho	528
9364	Cianorte	528
9365	Clevelandia	528
9366	Colombo	528
9367	Colorado	528
9368	Contenda	528
9369	Corbelia	528
9370	Cornelio Procopio	528
9371	Coronel Vivida	528
9372	Cruzeiro do Oeste	528
9373	Curitiba	528
9374	Dois Vizinhos	528
9375	Engenheiro Beltrao	528
9376	Faxinal	528
9377	Fazenda Rio Grande	528
9378	Florestopolis	528
9379	Foz do Iguacu	528
9380	Francisco Beltrao	528
9381	Goioere	528
9382	Guaira	528
9383	Guaraniacu	528
9384	Guarapuava	528
9385	Guaratuba	528
9386	Ibaiti	528
9387	Ibipora	528
9388	Imbituva	528
9389	Ipora	528
9390	Irati	528
9391	Itaperucu	528
9392	Ivaipora	528
9393	Jacarezinho	528
9394	Jaguariaiva	528
9395	Jandaia do Sul	528
9396	Jataizinho	528
9397	Lapa	528
9398	Laranjeiras do Sul	528
9399	Loanda	528
9400	Londrina	528
9401	Mandaguacu	528
9402	Mandaguari	528
9403	Marechal Candido Rondon	528
9404	Marialva	528
9405	Maringa	528
9406	Matelandia	528
9407	Matinhos	528
9408	Medianeira	528
9409	Moreira Sales	528
9410	Nova Aurora	528
9411	Nova Esperanca	528
9412	Nova Londrina	528
9413	Ortigueira	528
9414	Paicandu	528
9415	Palmas	528
9416	Palmeira	528
9417	Palotina	528
9418	Paranagua	528
9419	Paranavai	528
9420	Pato Branco	528
9421	Peabiru	528
9422	Pinhais	528
9423	Pinhao	528
9424	Pirai do Sul	528
9425	Piraquara	528
9426	Pitanga	528
9427	Ponta Grossa	528
9428	Pontal do Parana	528
9429	Porecatu	528
9430	Primero de Maio	528
9431	Prudentopolis	528
9432	Quatro Barras	528
9433	Quedas do Iguacu	528
9434	Realeza	528
9435	Reserva	528
9436	Ribeirao do Pinhal	528
9437	Rio Branco do Sul	528
9438	Rio Negro	528
9439	Rolandia	528
9440	Santa Helena	528
9441	Santa Terezinha de Itaipu	528
9442	Santo Antonio da Platina	528
9443	Santo Antonio do Sudoeste	528
9444	Sao Joao do Ivai	528
9445	Sao Jose dos Pinhais	528
9446	Sao Mateus do Sul	528
9447	Sao Miguel do Iguacu	528
9448	Sarandi	528
9449	Senges	528
9450	Sertanopolis	528
9451	Siquera Campos	528
9452	Tapejara	528
9453	Telemaco Borba	528
9454	Terra Boa	528
9455	Terra Rica	528
9456	Terra Roxa	528
9457	Tibagi	528
9458	Toledo	528
9459	Ubirata	528
9460	Umuarama	528
9461	Uniao da Victoria	528
9462	Wenceslau Braz	528
9463	Abreu e Lima	529
9464	Afogados da Ingazeira	529
9465	Agrestina	529
9466	Agua Preta	529
9467	Aguas Belas	529
9468	Alianca	529
9469	Altinho	529
9470	Amaraji	529
9471	Aracoiaba	529
9472	Araripina	529
9473	Arcoverde	529
9474	Barra de Guabiraba	529
9475	Barreiros	529
9476	Belem de Sao Francisco	529
9477	Belo Jardim	529
9478	Bezerros	529
9479	Bodoco	529
9480	Bom Conselho	529
9481	Bom Jardim	529
9482	Bonito	529
9483	Brejo da Madre de Deus	529
9484	Buique	529
9485	Cabo de Santo Agostinho	529
9486	Cabrobo	529
9487	Cachoeirinha	529
9488	Caetes	529
9489	Camaragibe	529
9490	Camocim de Sao Felix	529
9491	Canhotinho	529
9492	Capoeiras	529
9493	Carnaiba	529
9494	Carpina	529
9495	Caruaru	529
9496	Catende	529
9497	Cha Grande	529
9498	Condado	529
9499	Cumaru	529
9500	Cupira	529
9501	Custodia	529
9502	Escada	529
9503	Exu	529
9504	Feira Nova	529
9505	Fernando de Noronha	529
9506	Flores	529
9507	Floresta	529
9508	Gameleira	529
9509	Garanhuns	529
9510	Gloria do Goita	529
9511	Goiana	529
9512	Gravata	529
9513	Ibimirim	529
9514	Igarassu	529
9515	Inaja	529
9516	Ipojuca	529
9517	Ipubi	529
9518	Itaiba	529
9519	Itamaraca	529
9520	Itambe	529
9521	Itapissuma	529
9522	Itaquitinga	529
9523	Jaboatao	529
9524	Joao Alfredo	529
9525	Joaquim Nabuco	529
9526	Lagoa do Itaenga	529
9527	Lajedo	529
9528	Limoeiro	529
9529	Macaparana	529
9530	Maraial	529
9531	Moreno	529
9532	Nazare da Mata	529
9533	Olinda	529
9534	Orobo	529
9535	Ouricuri	529
9536	Palmares	529
9537	Panelas	529
9538	Parnamirim	529
9539	Passira	529
9540	Paudalho	529
9541	Paulista	529
9542	Pedra	529
9543	Pesqueira	529
9544	Petrolandia	529
9545	Petrolina	529
9546	Pombos	529
9547	Quipapa	529
9548	Recife	529
9549	Ribeirao	529
9550	Rio Formoso	529
9551	Salgueiro	529
9552	Santa Cruz do Capibaribe	529
9553	Santa Maria da Boa Vista	529
9554	Sao Bento do Una	529
9555	Sao Caitano	529
9556	Sao Joao	529
9557	Sao Joaquim do Monte	529
9558	Sao Jose da Coroa Grande	529
9559	Sao Jose do Belmonte	529
9560	Sao Jose do Egito	529
9561	Sao Lourenco da Mata	529
9562	Serra Talhada	529
9563	Sertania	529
9564	Sirinhaem	529
9565	Surubim	529
9566	Tabira	529
9567	Tamandare	529
9568	Taquaritinga do Norte	529
9569	Timbauba	529
9570	Toritama	529
9571	Trindade	529
9572	Triunfo	529
9573	Tupanatinga	529
9574	Vicencia	529
9575	Vitoria de Santo Antao	529
9576	Agua Branca	530
9577	Alto Longa	530
9578	Altos	530
9579	Amarante	530
9580	Avelino Lopes	530
9581	Barras	530
9582	Batalha	530
9583	Beneditinos	530
9584	Bom Jesus	530
9585	Buriti dos Lopes	530
9586	Campo Maior	530
9587	Canto do Buriti	530
9588	Castelo do Piaui	530
9589	Cocal	530
9590	Corrente	530
9591	Demerval Lobao	530
9592	Elesbao Veloso	530
9593	Esperantina	530
9594	Floriano	530
9595	Gilbues	530
9596	Guadalupe	530
9597	Inhuma	530
9598	Itainopolis	530
9599	Itaueira	530
9600	Jaicos	530
9601	Joaquim Pires	530
9602	Jose de Freitas	530
9603	Luis Correia	530
9604	Luzilandia	530
9605	Matias Olimpio	530
9606	Miguel Alves	530
9607	Monsenhor Gil	530
9608	Oeiras	530
9609	Palmeirais	530
9610	Parnaiba	530
9611	Pedro II	530
9612	Picos	530
9613	Pimenteiras	530
9614	Pio IX	530
9615	Piracuruca	530
9616	Piripiri	530
9617	Porto	530
9618	Regeneracao	530
9619	Sao Joao do Piaui	530
9620	Sao Miguel do Tapuio	530
9621	Sao Pedro do Piaui	530
9622	Sao Raimundo Nonato	530
9623	Simoes	530
9624	Simplicio Mendes	530
9625	Teresina	530
9626	Uniao	530
9627	Urucui	530
9628	Valenca do Piaui	530
9629	Alta Floresta dOeste	534
9630	Alto Alegre do Parecis	534
9631	Alto Paraiso	534
9632	Alvorada dOeste	534
9633	Ariquemes	534
9634	Buritis	534
9635	Cacoal	534
9636	Candeias do Jamari	534
9637	Cerejeiras	534
9638	Colorado do Oeste	534
9639	Corumbiara	534
9640	Espigao dOeste	534
9641	Governador Jorge Teixeira	534
9642	Guajara-Mirim	534
9643	Jaru	534
9644	Ji-Parana	534
9645	Machadinho dOeste	534
9646	Ministro Andreazza	534
9647	Mirante da Serra	534
9648	Nova Brasilandia dOeste	534
9649	Nova Mamore	534
9650	Novo Horizonte do Oeste	534
9651	Ouro Preto do Oeste	534
9652	Pimenta Bueno	534
9653	Porto Velho	534
9654	Presidente Medici	534
9655	Rolim de Moura	534
9656	Santa Luzia dOeste	534
9657	Sao Miguel do Guapore	534
9658	Urupa	534
9659	Vale do Paraiso	534
9660	Vilhena	534
9661	Alto Alegre	535
9662	Boa Vista	535
9663	Bonfim	535
9664	Caracarai	535
9665	Mucajai	535
9666	Normandia	535
9667	Sao Joao da Baliza	535
9668	Sao Luiz	535
9669	Aquidaba	538
9670	Aracaju	538
9671	Araua	538
9672	Areia Branca	538
9673	Barra dos Coqueiros	538
9674	Boquim	538
9675	Campo do Brito	538
9676	Caninde de Sao Francisco	538
9677	Capela	538
9678	Carira	538
9679	Cristinapolis	538
9680	Estancia	538
9681	Frei Paulo	538
9682	Gararu	538
9683	Indiaroba	538
9684	Itabaiana	538
9685	Itabaianinha	538
9686	Itaporanga dAjuda	538
9687	Japaratuba	538
9688	Japoata	538
9689	Lagarto	538
9690	Laranjeiras	538
9691	Malhador	538
9692	Maruim	538
9693	Moita Bonita	538
9694	Monte Alegre de Sergipe	538
9695	Neopolis	538
9696	Nossa Senhora da Gloria	538
9697	Nossa Senhora das Dores	538
9698	Nossa Senhora do Socorro	538
9699	Pacatuba	538
9700	Poco Verde	538
9701	Porto da Folha	538
9702	Propria	538
9703	Riachao do Dantas	538
9704	Ribeiropolis	538
9705	Salgado	538
9706	Santa Luzia do Itanhy	538
9707	Santo Amaro das Brotas	538
9708	Sao Cristovao	538
9709	Simao Dias	538
9710	Tobias Barreto	538
9711	Tomar do Geru	538
9712	Umbauba	538
9713	Alvorada	539
9714	Ananas	539
9715	Araguacu	539
9716	Araguaina	539
9717	Araguatins	539
9718	Arraias	539
9719	Augustinopolis	539
9720	Axixa do Tocantins	539
9721	Colinas do Tocantins	539
9722	Dianopolis	539
9723	Formoso do Araguaia	539
9724	Goiatins	539
9725	Guarai	539
9726	Gurupi	539
9727	Miracema do Tocantins	539
9728	Miranorte	539
9729	Palmas	539
9730	Paraiso	539
9731	Parana	539
9732	Porto Nacional	539
9733	Sitio Novo do Tocantins	539
9734	Taguatinga	539
9735	Tocantinopolis	539
9736	Wanderlandia	539
9737	Xambioa	539
9738	Kuala Belait	541
9739	Seria	541
9740	Bandar Seri Begawan	542
9741	Bangar	543
9742	Tutong	544
9743	Bansko	545
9744	Belica	545
9745	Blagoevgrad	545
9746	Goce Delchev	545
9747	Hadzhidimovo	545
9748	Jakoruda	545
9749	Kresna	545
9750	Melnik	545
9751	Petrich	545
9752	Razlog	545
9753	Sandanski	545
9754	Simitli	545
9755	Ahtopol	546
9756	Ajtos	546
9757	Balgarovo	546
9758	Bourgas	546
9759	Burgas	546
9760	Carevo	546
9761	Kableshkovo	546
9762	Kameno	546
9763	Karnobat	546
9764	Malko Tarnovo	546
9765	Nesebar	546
9766	Obzor	546
9767	Pomorie	546
9768	Primorsko	546
9769	Sozopol	546
9770	Sredec	546
9771	Sungurlare	546
9772	Tvardica	546
9773	Balchik	547
9774	Dobrich	547
9775	General-Toshevo	547
9776	Kavarna	547
9777	Loznica	547
9778	Shabla	547
9779	Tervel	547
9780	Drjanovo	548
9781	Gabrovo	548
9782	Plachkovci	548
9783	Sevlievo	548
9784	Trjavna	548
9785	Dimitrovgrad	549
9786	Harmanli	549
9787	Haskovo	549
9788	Ivajlovgrad	549
9789	Ljubimec	549
9790	Madzharovo	549
9791	Merichleri	549
9792	Simeonovgrad	549
9793	Svilengrad	549
9794	Boljarovo	550
9795	Elhovo	550
9796	Jambol	550
9797	Straldzha	550
9798	Topolovgrad	550
9799	Ardino	551
9800	Dzhebel	551
9801	Kardzhali	551
9802	Krumovgrad	551
9803	Momchilgrad	551
9804	Boboshevo	552
9805	Bobovdol	552
9806	Dupnica	552
9807	Kjustendil	552
9808	Kocherinovo	552
9809	Rila	552
9810	Sapareva Banja	552
9811	Zemen	552
9812	Aprilci	553
9813	Jablanica	553
9814	Letnica	553
9815	Lovech	553
9816	Lukovit	553
9817	Sopot	553
9818	Teteven	553
9819	Trojan	553
9820	Ugarchin	553
9821	Berkovica	554
9822	Bojchinovci	554
9823	Brusarci	554
9824	Chiprovci	554
9825	Lom	554
9826	Montana	554
9827	Valchedram	554
9828	Varshec	554
9829	Batak	556
9830	Belovo	556
9831	Bracigovo	556
9832	Koprivshtica	556
9833	Panagjurishte	556
9834	Pazardzhik	556
9835	Peshtera	556
9836	Rakitovo	556
9837	Septemvri	556
9838	Strelcha	556
9839	Velingrad	556
9840	Bankja	557
9841	Batanovci	557
9842	Breznik	557
9843	Pernik	557
9844	Radomir	557
9845	Tran	557
9846	Belene	558
9847	Cherven Brjag	558
9848	Dolna Mitropolija	558
9849	Dolni Dabnik	558
9850	Guljanci	558
9851	Levski	558
9852	Nikopol	558
9853	Pleven	558
9854	Pordim	558
9855	Slavjanovo	558
9856	Trashtenik	558
9857	Varbica	558
9858	Asenovgrad	559
9859	Brezovo	559
9860	Car Kalojan	559
9861	Hisarja	559
9862	Kalofer	559
9863	Karlovo	559
9864	Klisura	559
9865	Krichim	559
9866	Parvomaj	559
9867	Perushtica	559
9868	Plovdiv	559
9869	Rakovski	559
9870	Sadovo	559
9871	Saedinenie	559
9872	Stambolijski	559
9873	Isperih	560
9874	Kubrat	560
9875	Razgrad	560
9876	Senovo	560
9877	Zavet	560
9878	Bjala	561
9879	Borovo	561
9880	Dve Mogili	561
9881	Ruse	561
9882	Russe	561
9883	Vetovo	561
9884	Kaolinovo	562
9885	Kaspichan	562
9886	Novi Pazar	562
9887	Pliska	562
9888	Shumen	562
9889	Smjadovo	562
9890	Veliki Preslav	562
9891	Alfatar	563
9892	Dulovo	563
9893	Glavinica	563
9894	Silistra	563
9895	Tutrakan	563
9896	Kermen	564
9897	Kotel	564
9898	Nova Zagora	564
9899	Shivachevo	564
9900	Sliven	564
9901	Chepelare	565
9902	Devin	565
9903	Dospat	565
9904	Laki	565
9905	Madan	565
9906	Nedelino	565
9907	Rudozem	565
9908	Smoljan	565
9909	Zlatograd	565
9910	Antonovo	569
9911	Omurtag	569
9912	Opaka	569
9913	Popovo	569
9914	Targovishte	569
9915	Beloslav	570
9916	Bjala	570
9917	Dalgopol	570
9918	Devnja	570
9919	Iskar	570
9920	Provadija	570
9921	Suvorovo	570
9922	Valchi Dol	570
9923	Varna	570
9924	Belogradchik	572
9925	Bregovo	572
9926	Dimovo	572
9927	Dolni Chiflik	572
9928	Dunavci	572
9929	Gramada	572
9930	Kula	572
9931	Vidin	572
9932	Bjala Slatina	573
9933	Knezha	573
9934	Kojnare	573
9935	Kozloduj	573
9936	Krivodol	573
9937	Mezdra	573
9938	Mizija	573
9939	Orjahovo	573
9940	Roman	573
9941	Vraca	573
9942	Yablaniza	574
9943	Boromo	575
9944	Kongoussi	576
9945	Kombissiri	577
9946	Diebougou	578
9947	Pa	578
9948	Garango	579
9949	Tenkodogo	579
9950	Koudougou	580
9951	Banfora	581
9952	Zorgo	582
9953	Bogande	583
9954	Fada Ngourma	584
9955	Bekuy	585
9956	Bobo Dioulasso	585
9957	Dano	586
9958	Ouagadougou	587
9959	Koalla	588
9960	Koloko	588
9961	Orodara	588
9962	Gayeri	589
9963	Pama	590
9964	Nouna	591
9965	Koupela	592
9966	Bousse	593
9967	Sindou	594
9968	Dedougou	595
9969	Po	596
9970	Boulsa	597
9971	Batie	598
9972	Ziniare	599
9973	Gorom-Gorom	600
9974	Yako	601
9975	Gaoua	602
9976	Kampti	602
9977	Loropeni	602
9978	Reo	603
9979	Kaya	604
9980	Dori	605
9981	Gao	606
9982	Leo	606
9983	Aribinda	607
9984	Djibo	607
9985	Louta	608
9986	Tougan	608
9987	Diapaga	609
9988	Kantchari	609
9989	Hounde	610
9990	Ouahigouya	611
9991	Gourcy	612
9992	Manga	613
9993	Bubanza	614
9994	Bujumbura	615
9995	Bururi	616
9996	Cankuzo	617
9997	Cibitoke	618
9998	Gitega	619
9999	Karuzi	620
10000	Kayanza	621
10001	Kirundo	622
10002	Makamba	623
10003	Muramvya	624
10004	Muyinga	625
10005	Ngozi	626
10006	Rutana	627
10007	Ruyigi	628
10008	Kampot	635
10009	Ta Khmau	636
10010	Kracheh	638
10011	Pousat	645
10012	Phumi Takaev	652
10013	Banyo	653
10014	Meiganga	653
10015	Ngaoundere	653
10016	Tibati	653
10017	Tignere	653
10018	Akonolinga	654
10019	Bafia	654
10020	Eseka	654
10021	Mbalmayo	654
10022	Mfou	654
10023	Monatele	654
10024	Nanga Eboko	654
10025	Obala	654
10026	Ombesa	654
10027	Saa	654
10028	Yaounde	654
10029	Abong Mbang	655
10030	Batouri	655
10031	Bertoua	655
10032	Betare Oya	655
10033	Djoum	655
10034	Doume	655
10035	Lomie	655
10036	Yokadouma	655
10037	Bonaberi	656
10038	Dibombari	656
10039	Douala	656
10040	Edea	656
10041	Loum	656
10042	Manjo	656
10043	Mbanga	656
10044	Nkongsamba	656
10045	Yabassi	656
10046	Figuif	657
10047	Garoua	657
10048	Guider	657
10049	Lagdo	657
10050	Poli	657
10051	Rey Bouba	657
10052	Tchollire	657
10053	Figuif	658
10054	Garoua	658
10055	Guider	658
10056	Lagdo	658
10057	Poli	658
10058	Rey Bouba	658
10059	Tchollire	658
10060	Bamenda	659
10061	Kumbo	659
10062	Mbengwi	659
10063	Mme	659
10064	Njinikom	659
10065	Nkambe	659
10066	Wum	659
10067	Bafang	660
10068	Bafoussam	660
10069	Bafut	660
10070	Bali	660
10071	Bana	660
10072	Bangangte	660
10073	Djang	660
10074	Fontem	660
10075	Foumban	660
10076	Foumbot	660
10077	Mbouda	660
10078	Akom	661
10079	Ambam	661
10080	Ebolowa	661
10081	Kribi	661
10082	Lolodorf	661
10083	Moloundou	661
10084	Mvangue	661
10085	Sangmelima	661
10086	Buea	662
10087	Idenao	662
10088	Kumba	662
10089	Limbe	662
10090	Mamfe	662
10091	Muyuka	662
10092	Tiko	662
10093	Airdrie	663
10094	Athabasca	663
10095	Banff	663
10096	Barrhead	663
10097	Bassano	663
10098	Beaumont	663
10099	Beaverlodge	663
10100	Black Diamond	663
10101	Blackfalds	663
10102	Blairmore	663
10103	Bon Accord	663
10104	Bonnyville	663
10105	Bow Island	663
10106	Brooks	663
10107	Calgary	663
10108	Calmar	663
10109	Camrose	663
10110	Canmore	663
10111	Cardston	663
10112	Carstairs	663
10113	Chateau Lake Louise	663
10114	Chestermere	663
10115	Clairmont	663
10116	Claresholm	663
10117	Coaldale	663
10118	Coalhurst	663
10119	Cochrane	663
10120	Crossfield	663
10121	Devon	663
10122	Didsbury	663
10123	Drayton Valley	663
10124	Drumheller	663
10125	Edmonton	663
10126	Edson	663
10127	Elk Point	663
10128	Fairview	663
10129	Falher	663
10130	Fort MacLeod	663
10131	Fox Creek	663
10132	Gibbons	663
10133	Grand Centre	663
10134	Grande Cache	663
10135	Grande Prairie	663
10136	Grimshaw	663
10137	Hanna	663
10138	High Level	663
10139	High Prairie	663
10140	High River	663
10141	Hinton	663
10142	Irricana	663
10143	Jasper	663
10144	Killam	663
10145	La Crete	663
10146	Lac la Biche	663
10147	Lacombe	663
10148	Lamont	663
10149	Leduc	663
10150	Lethbridge	663
10151	Lloydminster	663
10152	Magrath	663
10153	Manning	663
10154	Mayerthorpe	663
10155	McMurray	663
10156	Medicine Hat	663
10157	Millet	663
10158	Morinville	663
10159	Nanton	663
10160	Okotoks	663
10161	Olds	663
10162	Peace River	663
10163	Penhold	663
10164	Picture Butte	663
10165	Pincher Creek	663
10166	Ponoka	663
10167	Provost	663
10168	Raymond	663
10169	Red Deer	663
10170	Redwater	663
10171	Rimbey	663
10172	Rocky Mountain House	663
10173	Rocky View	663
10174	Saint Paul	663
10175	Sexsmith	663
10176	Sherwood Park	663
10177	Slave Lake	663
10178	Smoky Lake	663
10179	Spirit River	663
10180	Spruce Grove	663
10181	Stettler	663
10182	Stony Plain	663
10183	Strathmore	663
10184	Sundre	663
10185	Swan Hills	663
10186	Sylvan Lake	663
10187	Taber	663
10188	Three Hills	663
10189	Tofield	663
10190	Two Hills	663
10191	Valleyview	663
10192	Vegreville	663
10193	Vermilion	663
10194	Viking	663
10195	Vulcan	663
10196	Wainwright	663
10197	Wembley	663
10198	Westlock	663
10199	Wetaskiwin	663
10200	Whitecourt	663
10201	Wood Buffalo	663
10202	Altona	665
10203	Beausejour	665
10204	Boissevain	665
10205	Brandon	665
10206	Carberry	665
10207	Carman	665
10208	Dauphin	665
10209	Deloraine	665
10210	Dugald	665
10211	Flin Flon	665
10212	Gimli	665
10213	Hamiota	665
10214	Killarney	665
10215	Lac du Bonnet	665
10216	Leaf Rapids	665
10217	Lorette	665
10218	Melita	665
10219	Minnedosa	665
10220	Morden	665
10221	Morris	665
10222	Neepawa	665
10223	Niverville	665
10224	Pinawa	665
10225	Portage la Prairie	665
10226	Ritchot	665
10227	Rivers	665
10228	Roblin	665
10229	Saint Adolphe	665
10230	Sainte Anne	665
10231	Sainte Rose du Lac	665
10232	Selkirk	665
10233	Shilo	665
10234	Snow Lake	665
10235	Souris	665
10236	Springfield	665
10237	Steinbach	665
10238	Stonewall	665
10239	Stony Mountain	665
10240	Swan River	665
10241	The Pas	665
10242	Thompson	665
10243	Virden	665
10244	Winkler	665
10245	Winnipeg	665
10246	Clyde River	670
10247	Iqaluit	670
10248	Kangerdlinerk	670
10249	Oqsuqtooq	670
10250	Pangnirtung	670
10251	Tununirusiq	670
10252	Acton	671
10253	Ajax	671
10254	Alexandria	671
10255	Alfred	671
10256	Alliston	671
10257	Almonte	671
10258	Amherstburg	671
10259	Amigo Beach	671
10260	Angus-Borden	671
10261	Arnprior	671
10262	Arthur	671
10263	Athens	671
10264	Atikokan	671
10265	Attawapiskat	671
10266	Aurora	671
10267	Aylmer	671
10268	Ayr	671
10269	Barrie	671
10270	Barrys Bay	671
10271	Beamsville	671
10272	Beaverton	671
10273	Beeton	671
10274	Belleville	671
10275	Belmont	671
10276	Blenheim	671
10277	Blind River	671
10278	Bobcaygeon	671
10279	Bolton	671
10280	Bourget	671
10281	Bowmanville-Newcastle	671
10282	Bracebridge	671
10283	Bradford	671
10284	Brampton	671
10285	Brantford	671
10286	Bridgenorth-Chemong Park Area	671
10287	Brighton	671
10288	Brockville	671
10289	Brooklin	671
10290	Brussels	671
10291	Burford	671
10292	Burlington	671
10293	Caledon	671
10294	Caledon East	671
10295	Caledonia	671
10296	Cambridge	671
10297	Campbellford	671
10298	Campbellville	671
10299	Cannington	671
10300	Capreol	671
10301	Cardinal	671
10302	Carleton Place	671
10303	Carlisle	671
10304	Casselman	671
10305	Cayuga	671
10306	Chalk River	671
10307	Chapleau	671
10308	Chatham	671
10309	Chesley	671
10310	Chesterville	671
10311	Clinton	671
10312	Cobourg	671
10313	Cochrane	671
10314	Colborne	671
10315	Colchester	671
10316	Collingwood	671
10317	Concord	671
10318	Constance Bay	671
10319	Cookstown	671
10320	Cornwall	671
10321	Creemore	671
10322	Crystal Beach	671
10323	Deep River	671
10324	Delhi	671
10325	Deseronto	671
10326	Downsview	671
10327	Drayton	671
10328	Dresden	671
10329	Dryden	671
10330	Dundalk	671
10331	Dunnville	671
10332	Durham	671
10333	Dutton	671
10334	Eganville	671
10335	Elliot Lake	671
10336	Elmira	671
10337	Elmvale	671
10338	Embrun	671
10339	Englehart	671
10340	Erin	671
10341	Espanola	671
10342	Essex	671
10343	Etobicoke	671
10344	Everett	671
10345	Exeter	671
10346	Fenelon Falls	671
10347	Fergus	671
10348	Forest	671
10349	Fort Erie	671
10350	Fort Frances	671
10351	Frankford	671
10352	Gananoque	671
10353	Georgetown	671
10354	Georgina	671
10355	Geraldton	671
10356	Glencoe	671
10357	Goderich	671
10358	Golden	671
10359	Gormley	671
10360	Grand Bend	671
10361	Grand Valley	671
10362	Gravenhurst	671
10363	Guelph	671
10364	Hagersville	671
10365	Haileybury	671
10366	Hamilton	671
10367	Hanover	671
10368	Harriston	671
10369	Harrow	671
10370	Hastings	671
10371	Havelock	671
10372	Hawkesbury	671
10373	Hearst	671
10374	Hensall	671
10375	Hillsburgh	671
10376	Hornepayne	671
10377	Huntsville	671
10378	Ingersoll	671
10379	Innisfil	671
10380	Iroquois	671
10381	Iroquois Falls	671
10382	Jarvis	671
10383	Kanata	671
10384	Kapuskasing	671
10385	Kars	671
10386	Kemptville	671
10387	Kenora	671
10388	Kincardine	671
10389	Kingston	671
10390	Kirkland Lake	671
10391	Kitchener	671
10392	LOriginal	671
10393	Lakefield	671
10394	Lanark	671
10395	Leamington	671
10396	Lindsay	671
10397	Listowel	671
10398	Little Current	671
10399	Lively	671
10400	London	671
10401	Longlac	671
10402	Lucan	671
10403	Lucknow	671
10404	Madoc	671
10405	Manitouwadge	671
10406	Maple	671
10407	Marathon	671
10408	Markdale	671
10409	Markham	671
10410	Marmora	671
10411	Mattawa	671
10412	Meaford	671
10413	Metcalfe	671
10414	Midland	671
10415	Mildmay	671
10416	Millbrook	671
10417	Milton	671
10418	Milverton	671
10419	Mississauga	671
10420	Mississauga Beach	671
10421	Mitchell	671
10422	Moose Factory	671
10423	Morrisburg	671
10424	Mount Albert	671
10425	Mount Brydges	671
10426	Mount Forest	671
10427	Munster	671
10428	Nanticoke	671
10429	Napanee	671
10430	Nepean	671
10431	New Hamburg	671
10432	Newmarket	671
10433	Newtonville	671
10434	Nobleton	671
10435	North Bay	671
10436	North Gower	671
10437	North York	671
10438	Norwich	671
10439	Norwood	671
10440	Oakville	671
10441	Omemee	671
10442	Onaping-Levack	671
10443	Ontario	671
10444	Orangeville	671
10445	Orillia	671
10446	Orono	671
10447	Osgoode	671
10448	Oshawa	671
10449	Ottawa	671
10450	Owen Sound	671
10451	Paisley	671
10452	Palmerston	671
10453	Paris	671
10454	Parkhill	671
10455	Parry Sound	671
10456	Pembroke	671
10457	Perth	671
10458	Petawawa	671
10459	Peterborough	671
10460	Petrolia	671
10461	Pickering	671
10462	Picton	671
10463	Porcupine	671
10464	Port Credit	671
10465	Port Dover	671
10466	Port Elgin	671
10467	Port Hope	671
10468	Port Perry	671
10469	Port Stanley	671
10470	Powassan	671
10471	Prescott	671
10472	Queensville	671
10473	Renfrew	671
10474	Richmond	671
10475	Richmond Hill	671
10476	Ridgetown	671
10477	Rockland	671
10478	Rockwood	671
10479	Rodney	671
10480	Saint Catharines	671
10481	Saint Catharines-Niagara	671
10482	Saint George	671
10483	Saint Jacobs	671
10484	Saint Marys	671
10485	Saint Thomas	671
10486	Sarnia	671
10487	Sault Sainte Marie	671
10488	Scarborough	671
10489	Schomberg	671
10490	Seaforth	671
10491	Shelburne	671
10492	Simcoe	671
10493	Sioux Lookout	671
10494	Smiths Falls	671
10495	Smithville	671
10496	South River	671
10497	Southampton	671
10498	Stayner	671
10499	Stirling	671
10500	Stoney Creek	671
10501	Stoney Point	671
10502	Stouffville	671
10503	Stratford	671
10504	Strathroy	671
10505	Sturgeon Falls	671
10506	Sudbury	671
10507	Sutton	671
10508	Tavistock	671
10509	Teeswater	671
10510	Terrace Bay	671
10511	Thamesford	671
10512	Thessalon	671
10513	Thornbury	671
10514	Thornhill	671
10515	Thunder Bay	671
10516	Tilbury	671
10517	Tilsonburg	671
10518	Timmins	671
10519	Toronto	671
10520	Tory Hill	671
10521	Tottenham	671
10522	Tweed	671
10523	Uxbridge	671
10524	Valley East	671
10525	Vankleek Hill	671
10526	Vaughan	671
10527	Vineland	671
10528	Walkerton	671
10529	Wallaceburg	671
10530	Wasaga Beach	671
10531	Waterdown	671
10532	Waterford	671
10533	Waterloo	671
10534	Watford	671
10535	Wawa	671
10536	Welland	671
10537	Wellesley	671
10538	Wellington	671
10539	West Lorne	671
10540	Wheatley	671
10541	Whitby	671
10542	Whitchurch-Stouffville	671
10543	Wiarton	671
10544	Wikwemikong	671
10545	Willowdale	671
10546	Winchester	671
10547	Windsor	671
10548	Wingham	671
10549	Woodbridge	671
10550	Woodstock	671
10551	Wyoming	671
10552	Acton Vale	673
10553	Albanel	673
10554	Alencon	673
10555	Alma	673
10556	Amos	673
10557	Amqui	673
10558	Anjou	673
10559	Asbestos	673
10560	Bagotville	673
10561	Baie-Comeau	673
10562	Baie-Saint-Paul	673
10563	Barraute	673
10564	Beauceville	673
10565	Beaupre	673
10566	Bedford	673
10567	Beloeil	673
10568	Bernierville	673
10569	Berthierville	673
10570	Betsiamites	673
10571	Boisbriand	673
10572	Bonaventure	673
10573	Boucherville	673
10574	Bromont	673
10575	Brossard	673
10576	Brownsburg	673
10577	Buckingham	673
10578	Cabano	673
10579	Candiac	673
10580	Cap-Chat	673
10581	Cap-aux-Meules	673
10582	Carleton	673
10583	Causapscal	673
10584	Chandler	673
10585	Chapais	673
10586	Charlesbourg	673
10587	Chateau-Richer	673
10588	Chibougamou	673
10589	Chicoutimi-Jonquiere	673
10590	Chisasibi	673
10591	Chute-aux-Outardes	673
10592	Clermont	673
10593	Coaticook	673
10594	Coleraine	673
10595	Contrecoeur	673
10596	Cookshire	673
10597	Cowansville	673
10598	Crabtree	673
10599	Danville	673
10600	Daveluyville	673
10601	Degelis	673
10602	Desbiens	673
10603	Disraeli	673
10604	Dolbeau	673
10605	Donnacona	673
10606	Dorval	673
10607	Drummondville	673
10608	East Angus	673
10609	East Broughton	673
10610	Farnham	673
10611	Ferme-Neuve	673
10612	Fermont	673
10613	Filion	673
10614	Forestville	673
10615	Fort-Coulonge	673
10616	Gaspe	673
10617	Gentilly	673
10618	Granby	673
10619	Grande-Riviere	673
10620	Grenville	673
10621	Ham Nord	673
10622	Hampstead	673
10623	Hauterive	673
10624	Havre-Saint-Pierre	673
10625	Hebertville	673
10626	Huntingdon	673
10627	Joliette	673
10628	Kingsey Falls	673
10629	LAnnonciation	673
10630	LAscension-de-Notre-Seigneur	673
10631	LEpiphanie	673
10632	La Malbaie	673
10633	La Pocatiere	673
10634	La Sarre	673
10635	La Tuque	673
10636	Labelle	673
10637	Lac-Etchemin	673
10638	Lac-Lapierre	673
10639	Lac-Megantic	673
10640	Lac-au-Saumon	673
10641	Lachine	673
10642	Lachute	673
10643	Lacolle	673
10644	Lasalle	673
10645	Laurentides	673
10646	Laurier-Station	673
10647	Laval	673
10648	Lavaltrie	673
10649	Le Bic	673
10650	Lebel-sur-Quevillon	673
10651	Les Cedres	673
10652	Les Coteaux	673
10653	Les Escoumins	673
10654	Liniere	673
10655	Longueuil	673
10656	Louiseville	673
10657	Luceville	673
10658	Macamic	673
10659	Magog	673
10660	Malartic	673
10661	Maniwaki	673
10662	Marieville	673
10663	Maskinonge	673
10664	Matagami	673
10665	Matane	673
10666	Metabetchouan	673
10667	Mirabel	673
10668	Mistissini	673
10669	Mont-Joli	673
10670	Mont-Laurier	673
10671	Montmagny	673
10672	Montreal	673
10673	Murdochville	673
10674	Napierville	673
10675	New Richmond	673
10676	Nicolet	673
10677	Normandin	673
10678	Notre-Dame-du-Bon-Conseil	673
10679	Notre-Dame-du-Lac	673
10680	Notre-Dame-du-Mont-Carmel	673
10681	Oka-Kanesatake	673
10682	Ormstown	673
10683	Papineauville	673
10684	Pierreville	673
10685	Plessisville	673
10686	Pointe-Claire	673
10687	Pont-Rouge	673
10688	Port-Alfred-Bagotville	673
10689	Port-Cartier	673
10690	Portneuf	673
10691	Price	673
10692	Princeville	673
10693	Quebec	673
10694	Rawdon	673
10695	Repentigny	673
10696	Richmond	673
10697	Rigaud	673
10698	Rimouski	673
10699	Riviere-au-Renard	673
10700	Riviere-du-Loup	673
10701	Roberval	673
10702	Rougemont	673
10703	Rouyn-Noranda	673
10704	Saint-Agapit	673
10705	Saint-Alexandre	673
10706	Saint-Alexis-des-Monts	673
10707	Saint-Ambroise	673
10708	Saint-Andre-Avellin	673
10709	Saint-Anselme	673
10710	Saint-Apollinaire	673
10711	Saint-Augustin	673
10712	Saint-Basile-Sud	673
10713	Saint-Bruno	673
10714	Saint-Canut	673
10715	Saint-Cesaire	673
10716	Saint-Cyrill-de-Wendover	673
10717	Saint-Damase	673
10718	Saint-Damien-de-Buckland	673
10719	Saint-Denis	673
10720	Saint-Donat-de-Montcalm	673
10721	Saint-Ephrem-de-Tring	673
10722	Saint-Fabien	673
10723	Saint-Felicien	673
10724	Saint-Felix-de-Valois	673
10725	Saint-Gabriel	673
10726	Saint-Gedeon	673
10727	Saint-Georges	673
10728	Saint-Germain-de-Grantham	673
10729	Saint-Gregoire	673
10730	Saint-Henri-de-Levis	673
10731	Saint-Honore	673
10732	Saint-Hyacinthe	673
10733	Saint-Jacques	673
10734	Saint-Jean-Port-Joli	673
10735	Saint-Jean-de-Dieu	673
10736	Saint-Jean-sur-Richelieu	673
10737	Saint-Jerome	673
10738	Saint-Josephe-de-Beauce	673
10739	Saint-Josephe-de-Lanoraie	673
10740	Saint-Josephe-de-la-Riviere-Bl	673
10741	Saint-Jovite	673
10742	Saint-Laurent	673
10743	Saint-Liboire	673
10744	Saint-Marc-des-Carrieres	673
10745	Saint-Martin	673
10746	Saint-Michel-des-Saints	673
10747	Saint-Pacome	673
10748	Saint-Pascal	673
10749	Saint-Pie	673
10750	Saint-Prosper	673
10751	Saint-Raphael	673
10752	Saint-Raymond	673
10753	Saint-Remi	673
10754	Saint-Roch-de-lAchigan	673
10755	Saint-Sauveur-des-Monts	673
10756	Saint-Tite	673
10757	Sainte-Adele	673
10758	Sainte-Agathe-des-Monts	673
10759	Sainte-Anne-des-Monts	673
10760	Sainte-Anne-des-Plaines	673
10761	Sainte-Catherine	673
10762	Sainte-Claire	673
10763	Sainte-Julienne	673
10764	Sainte-Justine	673
10765	Sainte-Madeleine	673
10766	Sainte-Marie	673
10767	Sainte-Martine	673
10768	Sainte-Sophie	673
10769	Sainte-Thecle	673
10770	Sainte-Therese	673
10771	Salaberry-de-Valleyfield	673
10772	Sayabec	673
10773	Senneterre	673
10774	Sept-Iles	673
10775	Shawinigan	673
10776	Shawville	673
10777	Sherbrooke	673
10778	Sorel	673
10779	St Faustin	673
10780	St. Hubert	673
10781	St. Jean Chrysostome	673
10782	Temiscaming	673
10783	Terrebonne	673
10784	Thetford Mines	673
10785	Thurso	673
10786	Trois-Pistoles	673
10787	Trois-Rivieres	673
10788	Val-David	673
10789	Val-dOr	673
10790	Valcourt	673
10791	Vallee-Jonction	673
10792	Vaudreuil	673
10793	Vercheres	673
10794	Victoriaville	673
10795	Ville-Marie	673
10796	Warwick	673
10797	Waterloo	673
10798	Weedon Centre	673
10799	Westmount	673
10800	Wickham	673
10801	Windsor	673
10802	Yamachiche	673
10803	Assiniboia	674
10804	Biggar	674
10805	Canora	674
10806	Carlyle	674
10807	Carnduff	674
10808	Caronport	674
10809	Carrot	674
10810	Dalmeny	674
10811	Davidson	674
10812	Esterhazy	674
10813	Estevan	674
10814	Eston	674
10815	Foam Lake	674
10816	Fort QuAppelle	674
10817	Gravelbourg	674
10818	Grenfell	674
10819	Gull Lake	674
10820	Hudson Bay	674
10821	Humboldt	674
10822	Indian Head	674
10823	Kamsack	674
10824	Kelvington	674
10825	Kerrobert	674
10826	Kindersley	674
10827	Kipling	674
10828	La Ronge	674
10829	Langenburg	674
10830	Langham	674
10831	Lanigan	674
10832	Lloydminster	674
10833	Lumsden	674
10834	Macklin	674
10835	Maple Creek	674
10836	Martensville	674
10837	Meadow Lake	674
10838	Melfort	674
10839	Melville	674
10840	Moose Jaw	674
10841	Moosomin	674
10842	Nipawin	674
10843	North Battleford	674
10844	Outlook	674
10845	Oxbow	674
10846	Pilot Butte	674
10847	Preeceville	674
10848	Prince Albert	674
10849	Regina	674
10850	Rosetown	674
10851	Rosthem	674
10852	Saskatoon	674
10853	Shaunavon	674
10854	Shellbrook	674
10855	Swift Current	674
10856	Tisdale	674
10857	Unity	674
10858	Wadena	674
10859	Warman	674
10860	Watrous	674
10861	Weyburn	674
10862	White City	674
10863	Wilkie	674
10864	Wynyard	674
10865	Yorkton	674
10866	Haines Junction	675
10867	Mayo	675
10868	Whitehorse	675
10869	Sal Rei	676
10870	Nova Sintra	677
10871	Mosteiros	678
10872	Sao Filipe	678
10873	Vila do Maio	679
10874	Santa Maria	680
10875	Ndele	686
10876	Bangui	687
10877	Alindao	688
10878	Kembe	688
10879	Mobaye	688
10880	Obo	689
10881	Zemio	689
10882	Bria	690
10883	Ouadda	690
10884	Dekoa	691
10885	Sibut	691
10886	Boda	692
10887	Mbaiki	692
10888	Mongoumba	692
10889	Berberati	693
10890	Carnot	693
10891	Gamboula	693
10892	Bangassou	694
10893	Gambo	694
10894	Ouango	694
10895	Rafai	694
10896	Kaga-Bandoro	695
10897	Baboua	696
10898	Baoro	696
10899	Bouar	696
10900	Bambari	698
10901	Grimari	698
10902	Ippy	698
10903	Kouango	698
10904	Batangafo	699
10905	Bossangoa	699
10906	Bouca	699
10907	Kabo	699
10908	Bocaranga	700
10909	Bozoum	700
10910	Paoua	700
10911	Nola	701
10912	Birao	702
10913	Ati	703
10914	Oum Hadjer	703
10915	Biltine	704
10916	Aouzou	705
10917	Bardai	705
10918	Fada	705
10919	Faya	705
10920	Bokoro	706
10921	Bousso	706
10922	Dourbali	706
10923	Massaguet	706
10924	Massakory	706
10925	Massenya	706
10926	NDjamena	706
10927	Ngama	706
10928	Bitkine	707
10929	Melfi	707
10930	Mongo	707
10931	Mao	708
10932	Moussoro	708
10933	Rig-Rig	708
10934	Bol	709
10935	Bongor	712
10936	Fianga	712
10937	Gounou Gaya	712
10938	Guelengdeng	712
10939	Lere	712
10940	Pala	712
10941	Goundi	713
10942	Koumra	713
10943	Kyabe	713
10944	Moissala	713
10945	Sarh	713
10946	Abeche	714
10947	Adre	714
10948	Am Dam	714
10949	Abou Deia	715
10950	Am Timan	715
10951	Mangueigne	715
10952	Benoy	716
10953	Bere	716
10954	Kelo	716
10955	Lai	716
10956	Aisen	717
10957	Chile Chico	717
10958	Cisnes	717
10959	Cochrane	717
10960	Coihaique	717
10961	Guaitecas	717
10962	Lago Verde	717
10963	OHiggins	717
10964	Rio Ibanez	717
10965	Tortel	717
10966	Antofagasta	718
10967	Calama	718
10968	Maria Elena	718
10969	Mejilones	718
10970	Ollague	718
10971	San Pedro de Atacama	718
10972	Sierra Gorda	718
10973	Taltal	718
10974	Tocopilla	718
10975	Angol	719
10976	Carahue	719
10977	Collipulli	719
10978	Cunco	719
10979	Curacautin	719
10980	Curarrehue	719
10981	Ercilla	719
10982	Freire	719
10983	Galvarino	719
10984	Gorbea	719
10985	Lautaro	719
10986	Loncoche	719
10987	Lonquimay	719
10988	Los Sauces	719
10989	Lumaco	719
10990	Melipeuco	719
10991	Nueva Imperial	719
10992	Padre las Casas	719
10993	Perquenco	719
10994	Pitrufquen	719
10995	Pucon	719
10996	Puren	719
10997	Renaico	719
10998	Saavedra	719
10999	Temuco	719
11000	Teodoro Schmidt	719
11001	Tolten	719
11002	Traiguen	719
11003	Victoria	719
11004	Vilcun	719
11005	Villarica	719
11006	Alto del Carmen	720
11007	Caldera	720
11008	Chanaral	720
11009	Copiapo	720
11010	Diego de Almagro	720
11011	Freirina	720
11012	Huasco	720
11013	Tierra Amarilla	720
11014	Vallenar	720
11015	Andacollo	722
11016	Canela	722
11017	Combarbala	722
11018	Coquimbo	722
11019	Illapel	722
11020	La Higuera	722
11021	La Serena	722
11022	Los Vilos	722
11023	Monte Patria	722
11024	Ovalle	722
11025	Paiguano	722
11026	Punitaci	722
11027	Rio Hurtado	722
11028	Salamanca	722
11029	Vicuna	722
11030	Cabo de Horno	725
11031	Laguna Blanca	725
11032	Natales	725
11033	Porvenir	725
11034	Primavera	725
11035	Punta Arenas	725
11036	Rio Verde	725
11037	San Gregorio	725
11038	Timaukel	725
11039	Torres del Paine	725
11040	Cauquenes	726
11041	Chanco	726
11042	Colbun	726
11043	Constitucion	726
11044	Curepto	726
11045	Curico	726
11046	Empedrado	726
11047	Hualane	726
11048	Licanten	726
11049	Linares	726
11050	Longavi	726
11051	Maule	726
11052	Molina	726
11053	Parral	726
11054	Pelarco	726
11055	Pelluhue	726
11056	Pencahue	726
11057	Rauco	726
11058	Retiro	726
11059	Rio Claro	726
11060	Romeral	726
11061	Sagrada Familia	726
11062	San Clemente	726
11063	San Javier	726
11064	San Rafael	726
11065	Talca	726
11066	Teno	726
11067	Vichuquen	726
11068	Villa Alegre	726
11069	Yerbas Buenas	726
11070	Alhue	727
11071	Buin	727
11072	Calera de Tango	727
11073	Colina	727
11074	Curacavi	727
11075	El Monte	727
11076	Isla de Maipo	727
11077	Lampa	727
11078	Maria Pinto	727
11079	Melipilla	727
11080	Padre Hurtado	727
11081	Paine	727
11082	Penaflor	727
11083	Pirque	727
11084	Puente Alto	727
11085	Quilicura	727
11086	San Bernardo	727
11087	San Jose de Maipo	727
11088	San Pedro	727
11089	Santiago	727
11090	Talagante	727
11091	Tiltil	727
11092	Alhue	728
11093	Buin	728
11094	Calera de Tango	728
11095	Colina	728
11096	Curacavi	728
11097	El Monte	728
11098	Isla de Maipo	728
11099	Lampa	728
11100	Maria Pinto	728
11101	Melipilla	728
11102	Padre Hurtado	728
11103	Paine	728
11104	Penaflor	728
11105	Pirque	728
11106	Puente Alto	728
11107	Quilicura	728
11108	San Bernardo	728
11109	San Jose de Maipo	728
11110	San Pedro	728
11111	Santiago	728
11112	Talagante	728
11113	Tiltil	728
11114	Arica	729
11115	Camarones	729
11116	Camina	729
11117	Colchane	729
11118	General Lagos	729
11119	Huara	729
11120	Iquique	729
11121	Pica	729
11122	Pozo Almonte	729
11123	Putre	729
11124	Algarrobo	730
11125	Cabildo	730
11126	Calera	730
11127	Calle Larga	730
11128	Cartagena	730
11129	Casablanca	730
11130	Catemu	730
11131	Concon	730
11132	El Quisco	730
11133	El Tabo	730
11134	Hijuelas	730
11135	La Cruz	730
11136	La Ligua	730
11137	Limache	730
11138	Llaillay	730
11139	Los Andes	730
11140	Nogales	730
11141	Olmue	730
11142	Panquehue	730
11143	Papudo	730
11144	Petorca	730
11145	Puchuncavi	730
11146	Putaendeo	730
11147	Quillota	730
11148	Quilpue	730
11149	Quintero	730
11150	Rinconada	730
11151	San Antonio	730
11152	San Esteban	730
11153	San Felipe	730
11154	Santa Maria	730
11155	Santo Domingo	730
11156	Valparaiso	730
11157	Villa Alemana	730
11158	Vina del Mar	730
11159	Zapallar	730
11160	Fengyang	731
11161	Guangde	731
11162	Liuan	731
11163	Ningguo	731
11164	Shucheng	731
11165	Xinchang	731
11166	Xuancheng	731
11167	Fengyang	732
11168	Guangde	732
11169	Liuan	732
11170	Ningguo	732
11171	Shucheng	732
11172	Xinchang	732
11173	Xuancheng	732
11174	Fengyang	733
11175	Guangde	733
11176	Liuan	733
11177	Ningguo	733
11178	Shucheng	733
11179	Xinchang	733
11180	Xuancheng	733
11181	Aomen	734
11182	Beijing	735
11183	Changping	735
11184	Fangshan	735
11185	Huangcun	735
11186	Liangxiang	735
11187	Mentougou	735
11188	Shunyi	735
11189	Tongzhou	735
11190	Beijing	736
11191	Changping	736
11192	Fangshan	736
11193	Huangcun	736
11194	Liangxiang	736
11195	Mentougou	736
11196	Shunyi	736
11197	Tongzhou	736
11198	Beibei	737
11199	Chongqing	737
11200	Fuling	737
11201	Longhua	737
11202	Nantongkuang	737
11203	Wanxian	737
11204	Xiuma	737
11205	Yubei	737
11206	Yudong	737
11207	Bantou	738
11208	Dongshan	738
11209	Fuan	738
11210	Fujian	738
11211	Fuqing	738
11212	Fuzhou	738
11213	Gantou	738
11214	Hanyang	738
11215	Jiangkou	738
11216	Jiaocheng	738
11217	Jinjiang	738
11218	Jinshang	738
11219	Longhai	738
11220	Longyan	738
11221	Luoyang	738
11222	Nanan	738
11223	Nanping	738
11224	Nanpu	738
11225	Putian	738
11226	Qingyang	738
11227	Quanzhou	738
11228	Rongcheng	738
11229	Sanming	738
11230	Shaowu	738
11231	Shima	738
11232	Shishi	738
11233	Tantou	738
11234	Tongshan	738
11235	Xiamen	738
11236	Xiapu	738
11237	Xiapu Ningde	738
11238	Ximei	738
11239	Yongan	738
11240	Zhangzhou	738
11241	Zhicheng	738
11242	Bantou	739
11243	Dongshan	739
11244	Fuan	739
11245	Fujian	739
11246	Fuqing	739
11247	Fuzhou	739
11248	Gantou	739
11249	Hanyang	739
11250	Jiangkou	739
11251	Jiaocheng	739
11252	Jinjiang	739
11253	Jinshang	739
11254	Longhai	739
11255	Longyan	739
11256	Luoyang	739
11257	Nanan	739
11258	Nanping	739
11259	Nanpu	739
11260	Putian	739
11261	Qingyang	739
11262	Quanzhou	739
11263	Rongcheng	739
11264	Sanming	739
11265	Shaowu	739
11266	Shima	739
11267	Shishi	739
11268	Tantou	739
11269	Tongshan	739
11270	Xiamen	739
11271	Xiapu	739
11272	Xiapu Ningde	739
11273	Ximei	739
11274	Yongan	739
11275	Zhangzhou	739
11276	Zhicheng	739
11277	Baiyin	740
11278	Baoji	740
11279	Beidao	740
11280	Jiayuguan	740
11281	Jinchang	740
11282	Jiuquan	740
11283	Lanzhou	740
11284	Linxia	740
11285	Pingliang	740
11286	Qincheng	740
11287	Wuwei	740
11288	Yaojie	740
11289	Yumen	740
11290	Zhangye	740
11291	Zhuanglang	740
11292	Anbu	741
11293	Chaozhou	741
11294	Chenghai	741
11295	Chuncheng	741
11296	Daliang	741
11297	Danshui	741
11298	Dongguan	741
11299	Donghai	741
11300	Dongli	741
11301	Dongzhen	741
11302	Ducheng	741
11303	Encheng	741
11304	Foahn	741
11305	Foshan	741
11306	Gaozhou	741
11307	Guangdong	741
11308	Guangzhou	741
11309	Guanjiao	741
11310	Haicheng	741
11311	Haimen	741
11312	Hepo	741
11313	Houpu	741
11314	Huaicheng	741
11315	Huanggang	741
11316	Huangpu	741
11317	Huazhou	741
11318	Huicheng	741
11319	Huizhou	741
11320	Humen	741
11321	Jiangmen	741
11322	Jiazi	741
11323	Jieshi	741
11324	Jieyang	741
11325	Lecheng	741
11326	Leicheng	741
11327	Liancheng	741
11328	Lianzhou	741
11329	Licheng	741
11330	Liusha	741
11331	Longgang	741
11332	Lubu	741
11333	Luocheng	741
11334	Luohu	741
11335	Luoyang	741
11336	Maba	741
11337	Maoming	741
11338	Mata	741
11339	Meilu	741
11340	Meizhou	741
11341	Mianchang	741
11342	Nanfeng	741
11343	Nanhai	741
11344	Pingshan	741
11345	Qingtang	741
11346	Qingyuan	741
11347	Rongcheng	741
11348	Sanbu	741
11349	Shantou	741
11350	Shanwei	741
11351	Shaoguan	741
11352	Shaping	741
11353	Shenzhen	741
11354	Shilong	741
11355	Shiqiao	741
11356	Shiwan	741
11357	Shuizhai	741
11358	Shunde	741
11359	Suicheng	741
11360	Taicheng	741
11361	Tangping	741
11362	Xiaolan	741
11363	Xinan	741
11364	Xingcheng	741
11365	Xiongzhou	741
11366	Xucheng	741
11367	Yangjiang	741
11368	Yingcheng	741
11369	Yuancheng	741
11370	Yuncheng	741
11371	Yunfu	741
11372	Zengcheng	741
11373	Zhanjiang	741
11374	Zhaoqing	741
11375	Zhilong	741
11376	Zhongshan	741
11377	Zhuhai	741
11378	Anbu	742
11379	Chaozhou	742
11380	Chenghai	742
11381	Chuncheng	742
11382	Daliang	742
11383	Danshui	742
11384	Dongguan	742
11385	Donghai	742
11386	Dongli	742
11387	Dongzhen	742
11388	Ducheng	742
11389	Encheng	742
11390	Foahn	742
11391	Foshan	742
11392	Gaozhou	742
11393	Guangdong	742
11394	Guangzhou	742
11395	Guanjiao	742
11396	Haicheng	742
11397	Haimen	742
11398	Hepo	742
11399	Houpu	742
11400	Huaicheng	742
11401	Huanggang	742
11402	Huangpu	742
11403	Huazhou	742
11404	Huicheng	742
11405	Huizhou	742
11406	Humen	742
11407	Jiangmen	742
11408	Jiazi	742
11409	Jieshi	742
11410	Jieyang	742
11411	Lecheng	742
11412	Leicheng	742
11413	Liancheng	742
11414	Lianzhou	742
11415	Licheng	742
11416	Liusha	742
11417	Longgang	742
11418	Lubu	742
11419	Luocheng	742
11420	Luohu	742
11421	Luoyang	742
11422	Maba	742
11423	Maoming	742
11424	Mata	742
11425	Meilu	742
11426	Meizhou	742
11427	Mianchang	742
11428	Nanfeng	742
11429	Nanhai	742
11430	Pingshan	742
11431	Qingtang	742
11432	Qingyuan	742
11433	Rongcheng	742
11434	Sanbu	742
11435	Shantou	742
11436	Shanwei	742
11437	Shaoguan	742
11438	Shaping	742
11439	Shenzhen	742
11440	Shilong	742
11441	Shiqiao	742
11442	Shiwan	742
11443	Shuizhai	742
11444	Shunde	742
11445	Suicheng	742
11446	Taicheng	742
11447	Tangping	742
11448	Xiaolan	742
11449	Xinan	742
11450	Xingcheng	742
11451	Xiongzhou	742
11452	Xucheng	742
11453	Yangjiang	742
11454	Yingcheng	742
11455	Yuancheng	742
11456	Yuncheng	742
11457	Yunfu	742
11458	Zengcheng	742
11459	Zhanjiang	742
11460	Zhaoqing	742
11461	Zhilong	742
11462	Zhongshan	742
11463	Zhuhai	742
11464	Babu	743
11465	Baihe	743
11466	Baise	743
11467	Beihai	743
11468	Binzhou	743
11469	Bose	743
11470	Fangchenggang	743
11471	Guicheng	743
11472	Guilin	743
11473	Guiping	743
11474	Jinchengjiang	743
11475	Jinji	743
11476	Laibin	743
11477	Lianzhou	743
11478	Liuzhou	743
11479	Luorong	743
11480	Matong	743
11481	Nandu	743
11482	Nanning	743
11483	Pingnan	743
11484	Pumiao	743
11485	Qinzhou	743
11486	Songhua	743
11487	Wuzhou	743
11488	Yashan	743
11489	Yulin	743
11490	Anshun	744
11491	Bijie	744
11492	Caohai	744
11493	Duyun	744
11494	Guiyang	744
11495	Kaili	744
11496	Liupanshui	744
11497	Luoyang	744
11498	Pingzhai	744
11499	Tongren	744
11500	Tongzi	744
11501	Xiaoweizhai	744
11502	Xingyi	744
11503	Zunyi	744
11504	Chengmai	745
11505	Dingan	745
11506	Haikou	745
11507	Lingao	745
11508	Qiongshan	745
11509	Sansha 	745
11510	Sanya	745
11511	Wanning	745
11512	Anping	746
11513	Baoding	746
11514	Botou	746
11515	Cangzhou	746
11516	Changli	746
11517	Chengde	746
11518	Dingzhou	746
11519	Fengfeng	746
11520	Fengrun	746
11521	Guye	746
11522	Handan	746
11523	Hebei	746
11524	Hecun	746
11525	Hejian	746
11526	Hengshui	746
11527	Huanghua	746
11528	Jingxingkuang	746
11529	Jinzhou	746
11530	Langfang	746
11531	Lianzhou	746
11532	Linshui	746
11533	Linxi	746
11534	Longyao County	746
11535	Nangong	746
11536	Pengcheng	746
11537	Qinhuangdao	746
11538	Renqiu	746
11539	Shahe	746
11540	Shijiazhuang	746
11541	Tangjiazhuang	746
11542	Tangshan	746
11543	Wuan	746
11544	Xian County	746
11545	Xingtai	746
11546	Xinji	746
11547	Xinle	746
11548	Xuanhua	746
11549	Zhangjiakou	746
11550	Zhaogezhuang	746
11551	Zhuozhou	746
11552	Acheng	747
11553	Anda	747
11554	Angangxi	747
11555	Baiquan	747
11556	Bamiantong	747
11557	Baoqing	747
11558	Baoshan	747
11559	Bayan	747
11560	Beian	747
11561	Binzhou	747
11562	Boli	747
11563	Chaihe	747
11564	Chengzihe	747
11565	Cuiluan	747
11566	Daqing	747
11567	Didao	747
11568	Dongning	747
11569	Fujin	747
11570	Fuli	747
11571	Fulitun	747
11572	Fuyu	747
11573	Gannan	747
11574	Hailin	747
11575	Hailun	747
11576	Harbin	747
11577	Hegang	747
11578	Heihe	747
11579	Hengshan	747
11580	Honggang	747
11581	Huanan	747
11582	Hulan	747
11583	Hulan Ergi	747
11584	Jiamusi	747
11585	Jidong	747
11586	Jixi	747
11587	Keshan	747
11588	Langxiang	747
11589	Lanxi	747
11590	Lingdong	747
11591	Linkou	747
11592	Lishu	747
11593	Longfeng	747
11594	Longjiang	747
11595	Mingshui	747
11596	Mishan	747
11597	Mudanjiang	747
11598	Nancha	747
11599	Nehe	747
11600	Nenjiang	747
11601	Nianzishan	747
11602	Ningan	747
11603	Qingan	747
11604	Qinggang	747
11605	Qiqihar	747
11606	Qitaihe	747
11607	Ranghulu	747
11608	Saertu	747
11609	Shangzhi	747
11610	Shanhetun	747
11611	Shuangcheng	747
11612	Shuangyashan	747
11613	Sifantan	747
11614	Suifenhe	747
11615	Suihua	747
11616	Suileng	747
11617	Tahe	747
11618	Taikang	747
11619	Tailai	747
11620	Tieli	747
11621	Wangkui	747
11622	Weihe	747
11623	Wuchang	747
11624	Xinglongzhen	747
11625	Xinqing	747
11626	Yian	747
11627	Yichun	747
11628	Yilan	747
11629	Youhao	747
11630	Zhaodong	747
11631	Zhaoyuan	747
11632	Zhaozhou	747
11633	Anyang	748
11634	Changying	748
11635	Dancheng	748
11636	Daokou	748
11637	Dengzhou	748
11638	Gongyi	748
11639	Gushi	748
11640	Hebi	748
11641	Huaidian	748
11642	Huangchuan	748
11643	Huangzhai	748
11644	Jiaozuo	748
11645	Jishui	748
11646	Kaifeng	748
11647	Liupen	748
11648	Luohe	748
11649	Luoyang	748
11650	Luyang	748
11651	Mengzhou	748
11652	Minggang	748
11653	Nandun	748
11654	Nanyang	748
11655	Pingdingshan	748
11656	Puyang	748
11657	Sanmenxia	748
11658	Shangqiu	748
11659	Tanghe	748
11660	Xiaoyi	748
11661	Xihua	748
11662	Xinxiang	748
11663	Xinyang	748
11664	Xinye	748
11665	Xixiang	748
11666	Xuanwu	748
11667	Xuchang	748
11668	Yigou	748
11669	Yima	748
11670	Yinzhuang	748
11671	Yunyang	748
11672	Yuzhou	748
11673	Zhecheng	748
11674	Zhengzhou	748
11675	Zhenping	748
11676	Zhoukou	748
11677	Zhumadian	748
11678	Anlu	749
11679	Baisha	749
11680	Buhe	749
11681	Caidian	749
11682	Caohe	749
11683	Danjiangkou	749
11684	Daye	749
11685	Duobao	749
11686	Enshi	749
11687	Ezhou	749
11688	Fengkou	749
11689	Guangshui	749
11690	Gucheng	749
11691	Hanchuan	749
11692	Hongan	749
11693	Honghu	749
11694	Huangmei	749
11695	Huangpi	749
11696	Huangshi	749
11697	Huangzhou	749
11698	Jingmen	749
11699	Jingzhou	749
11700	Laohekou	749
11701	Lichuan	749
11702	Macheng	749
11703	Nanhai	749
11704	Nanzhang	749
11705	Puqi	749
11706	Qianjiang	749
11707	Qingquan	749
11708	Qixingtai	749
11709	Rongcheng	749
11710	Shashi	749
11711	Shishou	749
11712	Shiyan	749
11713	Suizhou	749
11714	Tianmen	749
11715	Tongcheng	749
11716	Wuhan	749
11717	Wuxue	749
11718	Xiangfan	749
11719	Xianning	749
11720	Xiantao	749
11721	Xiaogan	749
11722	Xiaoxita	749
11723	Xiaxindian	749
11724	Xihe	749
11725	Xinpu	749
11726	Xinshi	749
11727	Xinzhou	749
11728	Yichang	749
11729	Yicheng	749
11730	Yingcheng	749
11731	Yingzhong	749
11732	Zaoyang	749
11733	Zhengchang	749
11734	Zhicheng	749
11735	Zhifang	749
11736	Zhongxiang	749
11737	Anjiang	750
11738	Anxiang	750
11739	Changde	750
11740	Changsha	750
11741	Chenzhou	750
11742	Dayong	750
11743	Hengyang	750
11744	Hongjiang	750
11745	Huaihua	750
11746	Jinshi	750
11747	Jishou	750
11748	Leiyang	750
11749	Lengshuijiang	750
11750	Lengshuitan	750
11751	Lianyuan	750
11752	Liling	750
11753	Liuyang	750
11754	Loudi	750
11755	Matian	750
11756	Nanzhou	750
11757	Ningxiang	750
11758	Qidong	750
11759	Qiyang	750
11760	Shaoyang	750
11761	Xiangtan	750
11762	Xiangxiang	750
11763	Xiangyin	750
11764	Xinhua	750
11765	Yiyang	750
11766	Yongfeng	750
11767	Yongzhou	750
11768	Yuanjiang	750
11769	Yueyang	750
11770	Zhuzhou	750
11771	Baoying	751
11772	Changzhou	751
11773	Dachang	751
11774	Dafeng	751
11775	Danyang	751
11776	Dingshu	751
11777	Dongkan	751
11778	Dongtai	751
11779	Fengxian	751
11780	Gaogou	751
11781	Gaoyou	751
11782	Guiren	751
11783	Haian	751
11784	Haizhou	751
11785	Hede	751
11786	Huaicheng	751
11787	Huaiyin	751
11788	Huilong	751
11789	Hutang	751
11790	Jiangdu	751
11791	Jiangyan	751
11792	Jiangyin	751
11793	Jiangyuan	751
11794	Jianhu	751
11795	Jingcheng	751
11796	Jinsha	751
11797	Jintan	751
11798	Juegang	751
11799	Jurong	751
11800	Kunshan	751
11801	Lianyungang	751
11802	Liucheng	751
11803	Liyang	751
11804	Luodu	751
11805	Mudu	751
11806	Nanjing	751
11807	Nantong	751
11808	Pecheng	751
11809	Pukou	751
11810	Qidong	751
11811	Qinnan	751
11812	Qixia	751
11813	Rucheng	751
11814	Songling	751
11815	Sucheng	751
11816	Suicheng	751
11817	Suqian	751
11818	Suzhou	751
11819	Taicang	751
11820	Taixing	751
11821	Wujiang	751
11822	Wuxi	751
11823	Xiaolingwei	751
11824	Xiaoshi	751
11825	Xinan	751
11826	Xinpu	751
11827	Xuzhou	751
11828	Yancheng	751
11829	Yangshe	751
11830	Yangzhou	751
11831	Yizheng	751
11832	Yunhe	751
11833	Yunyang	751
11834	Yushan	751
11835	Zhangjiagang	751
11836	Zhangjiangang	751
11837	Zhaoyang	751
11838	Zhenjiang	751
11839	Zhongxing	751
11840	Baoying	752
11841	Changzhou	752
11842	Dachang	752
11843	Dafeng	752
11844	Danyang	752
11845	Dingshu	752
11846	Dongkan	752
11847	Dongtai	752
11848	Fengxian	752
11849	Gaogou	752
11850	Gaoyou	752
11851	Guiren	752
11852	Haian	752
11853	Haizhou	752
11854	Hede	752
11855	Huaicheng	752
11856	Huaiyin	752
11857	Huilong	752
11858	Hutang	752
11859	Jiangdu	752
11860	Jiangyan	752
11861	Jiangyin	752
11862	Jiangyuan	752
11863	Jianhu	752
11864	Jingcheng	752
11865	Jinsha	752
11866	Jintan	752
11867	Juegang	752
11868	Jurong	752
11869	Kunshan	752
11870	Lianyungang	752
11871	Liucheng	752
11872	Liyang	752
11873	Luodu	752
11874	Mudu	752
11875	Nanjing	752
11876	Nantong	752
11877	Pecheng	752
11878	Pukou	752
11879	Qidong	752
11880	Qinnan	752
11881	Qixia	752
11882	Rucheng	752
11883	Songling	752
11884	Sucheng	752
11885	Suicheng	752
11886	Suqian	752
11887	Suzhou	752
11888	Taicang	752
11889	Taixing	752
11890	Wujiang	752
11891	Wuxi	752
11892	Xiaolingwei	752
11893	Xiaoshi	752
11894	Xinan	752
11895	Xinpu	752
11896	Xuzhou	752
11897	Yancheng	752
11898	Yangshe	752
11899	Yangzhou	752
11900	Yizheng	752
11901	Yunhe	752
11902	Yunyang	752
11903	Yushan	752
11904	Zhangjiagang	752
11905	Zhangjiangang	752
11906	Zhaoyang	752
11907	Zhenjiang	752
11908	Zhongxing	752
11909	Fengxin	753
11910	Fenyi	753
11911	Ganzhou	753
11912	Jian	753
11913	Jiangguang	753
11914	Jingdezhen	753
11915	Jiujiang	753
11916	Leping	753
11917	Linchuan	753
11918	Nanchang	753
11919	Pingxiang	753
11920	Poyang	753
11921	Shangrao	753
11922	Xiangdong	753
11923	Xingan	753
11924	Xinjian	753
11925	Xinyu	753
11926	Xiongshi	753
11927	Yichun	753
11928	Yingtai	753
11929	Yingtan	753
11930	Zhangshui	753
11931	Badaojiang	754
11932	Baicheng	754
11933	Baishishan	754
11934	Changchun	754
11935	Changling	754
11936	Chaoyang	754
11937	Daan	754
11938	Dashitou	754
11939	Dehui	754
11940	Dongchang	754
11941	Dongfeng	754
11942	Dunhua	754
11943	Erdaojiang	754
11944	Fuyu	754
11945	Gongzhuling	754
11946	Helong	754
11947	Hongmei	754
11948	Huadian	754
11949	Huangnihe	754
11950	Huinan	754
11951	Hunchun	754
11952	Jiaohe	754
11953	Jilin	754
11954	Jishu	754
11955	Jiutai	754
11956	Kaitong	754
11957	Kouqian	754
11958	Liaoyuan	754
11959	Linjiang	754
11960	Lishu	754
11961	Liuhe	754
11962	Longjing	754
11963	Meihekou	754
11964	Mingyue	754
11965	Nongan	754
11966	Panshi	754
11967	Pizhou	754
11968	Qianan	754
11969	Qianguo	754
11970	Sanchazi	754
11971	Shuangyang	754
11972	Shulan	754
11973	Siping	754
11974	Songjianghe	754
11975	Taonan	754
11976	Tumen	754
11977	Wangou	754
11978	Wangqing	754
11979	Xinglongshan	754
11980	Yanji	754
11981	Yantongshan	754
11982	Yushu	754
11983	Zhengjiatun	754
11984	Zhenlai	754
11985	Anshan	755
11986	Beipiao	755
11987	Benxi	755
11988	Changtu	755
11989	Chaoyang	755
11990	Dalian	755
11991	Dalianwan	755
11992	Dalinghe	755
11993	Dandong	755
11994	Dashiqiao	755
11995	Dongling	755
11996	Fengcheng	755
11997	Fushun	755
11998	Fuxin	755
11999	Haicheng	755
12000	Heishan	755
12001	Huanren	755
12002	Huludao	755
12003	Hushitai	755
12004	Jinxi	755
12005	Jinzhou	755
12006	Jiupu	755
12007	Kaiyuan	755
12008	Kuandian	755
12009	Langtou	755
12010	Liaoyang	755
12011	Liaozhong	755
12012	Lingyuan	755
12013	Liuerbao	755
12014	Lushunkou	755
12015	Nantai	755
12016	Panjin	755
12017	Pulandian	755
12018	Shenyang	755
12019	Sujiatun	755
12020	Tieling	755
12021	Wafangdian	755
12022	Xiaoshi	755
12023	Xifeng	755
12024	Xinchengxi	755
12025	Xingcheng	755
12026	Xinmin	755
12027	Xiongyue	755
12028	Xiuyan	755
12029	Yebaishou	755
12030	Yingkou	755
12031	Yuhong	755
12032	Zhuanghe	755
12033	Anshan	756
12034	Beipiao	756
12035	Benxi	756
12036	Changtu	756
12037	Chaoyang	756
12038	Dalian	756
12039	Dalianwan	756
12040	Dalinghe	756
12041	Dandong	756
12042	Dashiqiao	756
12043	Dongling	756
12044	Fengcheng	756
12045	Fushun	756
12046	Fuxin	756
12047	Haicheng	756
12048	Heishan	756
12049	Huanren	756
12050	Huludao	756
12051	Hushitai	756
12052	Jinxi	756
12053	Jinzhou	756
12054	Jiupu	756
12055	Kaiyuan	756
12056	Kuandian	756
12057	Langtou	756
12058	Liaoyang	756
12059	Liaozhong	756
12060	Lingyuan	756
12061	Liuerbao	756
12062	Lushunkou	756
12063	Nantai	756
12064	Panjin	756
12065	Pulandian	756
12066	Shenyang	756
12067	Sujiatun	756
12068	Tieling	756
12069	Wafangdian	756
12070	Xiaoshi	756
12071	Xifeng	756
12072	Xinchengxi	756
12073	Xingcheng	756
12074	Xinmin	756
12075	Xiongyue	756
12076	Xiuyan	756
12077	Yebaishou	756
12078	Yingkou	756
12079	Yuhong	756
12080	Zhuanghe	756
12081	Qiatou	759
12082	Xining	759
12083	Ankang	760
12084	Baoji	760
12085	Guozhen	760
12086	Hancheng	760
12087	Hanzhong	760
12088	Lishan	760
12089	Qili	760
12090	Tongchuan	760
12091	Weinan	760
12092	Xian	760
12093	Xianyang	760
12094	Yanan	760
12095	Yanliang	760
12096	Yulin	760
12097	Yuxia	760
12098	Anqiu	761
12099	Bianzhuang	761
12100	Binzhou	761
12101	Boshan	761
12102	Boxing County	761
12103	Caocheng	761
12104	Changqing	761
12105	Chengyang	761
12106	Dengzhou	761
12107	Dezhou	761
12108	Dingtao	761
12109	Dongcun	761
12110	Dongdu	761
12111	Donge County	761
12112	Dongying	761
12113	Feicheng	761
12114	Fushan	761
12115	Gaomi	761
12116	Haiyang	761
12117	Hanting	761
12118	Hekou	761
12119	Heze	761
12120	Jiaonan	761
12121	Jiaozhou	761
12122	Jiehu	761
12123	Jimo	761
12124	Jinan	761
12125	Jining	761
12126	Juxian	761
12127	Juye	761
12128	Kunlun	761
12129	Laiwu	761
12130	Laiyang	761
12131	Laizhou	761
12132	Leling	761
12133	Liaocheng	761
12134	Licung	761
12135	Linqing	761
12136	Linqu	761
12137	Linshu	761
12138	Linyi	761
12139	Longkou	761
12140	Mengyin	761
12141	Mingshui	761
12142	Nanchou	761
12143	Nanding	761
12144	Nanma	761
12145	Ninghai	761
12146	Ningyang	761
12147	Pingdu	761
12148	Pingyi	761
12149	Pingyin	761
12150	Qingdao	761
12151	Qingzhou	761
12152	Qixia	761
12153	Qufu	761
12154	Rizhao	761
12155	Rongcheng	761
12156	Shancheng	761
12157	Shanting	761
12158	Shengzhuang	761
12159	Shenxian	761
12160	Shizilu	761
12161	Shouguang	761
12162	Shuiji	761
12163	Sishui	761
12164	Suozhen	761
12165	Taian	761
12166	Tancheng	761
12167	Taozhuang	761
12168	Tengzhou	761
12169	Weifang	761
12170	Weihai	761
12171	Wencheng	761
12172	Wendeng	761
12173	Wenshang	761
12174	Wudi	761
12175	Xiazhen	761
12176	Xincheng	761
12177	Xindian	761
12178	Xintai	761
12179	Yanggu	761
12180	Yangshan	761
12181	Yantai	761
12182	Yanzhou	761
12183	Yatou	761
12184	Yidu	761
12185	Yishui	761
12186	Yucheng	761
12187	Yuncheng	761
12188	Zaozhuang	761
12189	Zhangdian	761
12190	Zhangjiawa	761
12191	Zhangqiu	761
12192	Zhaocheng	761
12193	Zhoucheng	761
12194	Zhoucun	761
12195	Zhucheng	761
12196	Zhuwang	761
12197	Zicheng	761
12198	Zouping	761
12199	Zouxian	761
12200	Anqiu	762
12201	Bianzhuang	762
12202	Binzhou	762
12203	Boshan	762
12204	Boxing County	762
12205	Caocheng	762
12206	Changqing	762
12207	Chengyang	762
12208	Dengzhou	762
12209	Dezhou	762
12210	Dingtao	762
12211	Dongcun	762
12212	Dongdu	762
12213	Donge County	762
12214	Dongying	762
12215	Feicheng	762
12216	Fushan	762
12217	Gaomi	762
12218	Haiyang	762
12219	Hanting	762
12220	Hekou	762
12221	Heze	762
12222	Jiaonan	762
12223	Jiaozhou	762
12224	Jiehu	762
12225	Jimo	762
12226	Jinan	762
12227	Jining	762
12228	Juxian	762
12229	Juye	762
12230	Kunlun	762
12231	Laiwu	762
12232	Laiyang	762
12233	Laizhou	762
12234	Leling	762
12235	Liaocheng	762
12236	Licung	762
12237	Linqing	762
12238	Linqu	762
12239	Linshu	762
12240	Linyi	762
12241	Longkou	762
12242	Mengyin	762
12243	Mingshui	762
12244	Nanchou	762
12245	Nanding	762
12246	Nanma	762
12247	Ninghai	762
12248	Ningyang	762
12249	Pingdu	762
12250	Pingyi	762
12251	Pingyin	762
12252	Qingdao	762
12253	Qingzhou	762
12254	Qixia	762
12255	Qufu	762
12256	Rizhao	762
12257	Rongcheng	762
12258	Shancheng	762
12259	Shanting	762
12260	Shengzhuang	762
12261	Shenxian	762
12262	Shizilu	762
12263	Shouguang	762
12264	Shuiji	762
12265	Sishui	762
12266	Suozhen	762
12267	Taian	762
12268	Tancheng	762
12269	Taozhuang	762
12270	Tengzhou	762
12271	Weifang	762
12272	Weihai	762
12273	Wencheng	762
12274	Wendeng	762
12275	Wenshang	762
12276	Wudi	762
12277	Xiazhen	762
12278	Xincheng	762
12279	Xindian	762
12280	Xintai	762
12281	Yanggu	762
12282	Yangshan	762
12283	Yantai	762
12284	Yanzhou	762
12285	Yatou	762
12286	Yidu	762
12287	Yishui	762
12288	Yucheng	762
12289	Yuncheng	762
12290	Zaozhuang	762
12291	Zhangdian	762
12292	Zhangjiawa	762
12293	Zhangqiu	762
12294	Zhaocheng	762
12295	Zhoucheng	762
12296	Zhoucun	762
12297	Zhucheng	762
12298	Zhuwang	762
12299	Zicheng	762
12300	Zouping	762
12301	Zouxian	762
12302	Jiading	763
12303	Minhang	763
12304	Shanghai	763
12305	Songjiang	763
12306	Trencin	763
12307	Changzhi	764
12308	Datong	764
12309	Houma	764
12310	Jiexiu	764
12311	Jincheng	764
12312	Linfen	764
12313	Taiyuan	764
12314	Xian	764
12315	Xinzhi	764
12316	Xinzhou	764
12317	Yangquan	764
12318	Yuanping	764
12319	Yuci	764
12320	Yuncheng	764
12321	Anju	765
12322	Baoning	765
12323	Chengdu	765
12324	Daan	765
12325	Dawan	765
12326	Daxian	765
12327	Deyang	765
12328	Dujiangyan City	765
12329	Guangkou	765
12330	Guangyuan	765
12331	Guihu	765
12332	Heyang	765
12333	Huayang	765
12334	Jiancheng	765
12335	Jiangyou	765
12336	Jijiang	765
12337	Leshan	765
12338	Linqiong	765
12339	Luocheng	765
12340	Luzhou	765
12341	Mianyang	765
12342	Nanchong	765
12343	Nanlong	765
12344	Neijiang	765
12345	Panzhihua	765
12346	Shifang	765
12347	Suining	765
12348	Taihe	765
12349	Tianpeng	765
12350	Tongchuan	765
12351	Xichang	765
12352	Xunchang	765
12353	Yaan	765
12354	Yibin	765
12355	Yongchang	765
12356	Zhonglong	765
12357	Zigong	765
12358	Ziyang	765
12359	Beichen	766
12360	Gangdong	766
12361	Hangu	766
12362	Jinghai	766
12363	Nankai	766
12364	Tanggu	766
12365	Tianjin	766
12366	Xianshuigu	766
12367	Yangcun	766
12368	Yangliuqing	766
12369	Guiqing	767
12370	Jiulong	767
12371	Quanwan	767
12372	Saigong	767
12373	Shatin	767
12374	Taipo	767
12375	Tuanmun	767
12376	Xianggang	767
12377	Yuanlong	767
12378	Aksu	768
12379	Baijiantan	768
12380	Changji	768
12381	Dongshan	768
12382	Hami	768
12383	Hetian	768
12384	Karamay	768
12385	Kashi	768
12386	Korla	768
12387	Kuche	768
12388	Kuytun	768
12389	Shache	768
12390	Shihezi	768
12391	Shuimogou	768
12392	Toutunhe	768
12393	Urumqi	768
12394	Yining	768
12395	Lasa	769
12396	Dali	770
12397	Gejiu	770
12398	Haikou	770
12399	Heilin	770
12400	Jinma	770
12401	Kaihua	770
12402	Kaiyuan	770
12403	Kunming	770
12404	Lianran	770
12405	Longquan	770
12406	Lucheng	770
12407	Mabai	770
12408	Majie	770
12409	Miyang	770
12410	Qujing	770
12411	Rongcheng	770
12412	Simao	770
12413	Wufeng	770
12414	Yunjinghong	770
12415	Yuxi Municipal	770
12416	Zhaotong	770
12417	Zhenhai	770
12418	Zhongshu	770
12419	Zhoucheng	770
12420	Zhuocheng	770
12421	Aojiang	771
12422	Choucheng	771
12423	Cixi	771
12424	Daqiao	771
12425	Deqing	771
12426	Dinghai	771
12427	Dongyang	771
12428	Fuyang	771
12429	Haining	771
12430	Haiyan	771
12431	Hangzhou	771
12432	Huangyan	771
12433	Hushan	771
12434	Huzhou	771
12435	Jiaojiang	771
12436	Jiaxing	771
12437	Jinhua	771
12438	Jinxiang	771
12439	Kaihua	771
12440	Kunyang	771
12441	Lanxi	771
12442	Linan City	771
12443	Linhai	771
12444	Linping	771
12445	Lishui	771
12446	Liushi	771
12447	Ningbo	771
12448	Ninghai	771
12449	Pinghu	771
12450	Quzhou	771
12451	Ruian	771
12452	Shangyu	771
12453	Shaoxing	771
12454	Shenjiamen	771
12455	Taizhou City	771
12456	Tonglu	771
12457	Wenling	771
12458	Wenzhou	771
12459	Wuning	771
12460	Wuyi	771
12461	Xianju	771
12462	Xiaoshan	771
12463	Xiashi	771
12464	Xushan	771
12465	Yiwu	771
12466	Yongkang	771
12467	Yueqing	771
12468	Yuhuan	771
12469	Yuyao	771
12470	Zhejiang	771
12471	Zhenhai	771
12472	Zhicheng	771
12473	Zhuji	771
12474	fenghua	771
12475	jiashan	771
12476	Aojiang	772
12477	Choucheng	772
12478	Cixi	772
12479	Daqiao	772
12480	Deqing	772
12481	Dinghai	772
12482	Dongyang	772
12483	Fuyang	772
12484	Haining	772
12485	Haiyan	772
12486	Hangzhou	772
12487	Huangyan	772
12488	Hushan	772
12489	Huzhou	772
12490	Jiaojiang	772
12491	Jiaxing	772
12492	Jinhua	772
12493	Jinxiang	772
12494	Kaihua	772
12495	Kunyang	772
12496	Lanxi	772
12497	Linan City	772
12498	Linhai	772
12499	Linping	772
12500	Lishui	772
12501	Liushi	772
12502	Ningbo	772
12503	Ninghai	772
12504	Pinghu	772
12505	Quzhou	772
12506	Ruian	772
12507	Shangyu	772
12508	Shaoxing	772
12509	Shenjiamen	772
12510	Taizhou City	772
12511	Tonglu	772
12512	Wenling	772
12513	Wenzhou	772
12514	Wuning	772
12515	Wuyi	772
12516	Xianju	772
12517	Xiaoshan	772
12518	Xiashi	772
12519	Xushan	772
12520	Yiwu	772
12521	Yongkang	772
12522	Yueqing	772
12523	Yuhuan	772
12524	Yuyao	772
12525	Zhejiang	772
12526	Zhenhai	772
12527	Zhicheng	772
12528	Zhuji	772
12529	fenghua	772
12530	jiashan	772
12531	Leticia	775
12532	Puerto Narino	775
12533	Abejorral	776
12534	Abriaqui	776
12535	Alejandria	776
12536	Amaga	776
12537	Amalfi	776
12538	Andes	776
12539	Angelopolis	776
12540	Angostura	776
12541	Anori	776
12542	Antioquia	776
12543	Anza	776
12544	Apartado	776
12545	Arboletes	776
12546	Argelia	776
12547	Armenia	776
12548	Barbosa	776
12549	Bello	776
12550	Belmira	776
12551	Betania	776
12552	Betulia	776
12553	Bolivar	776
12554	Briceno	776
12555	Buritica	776
12556	Caceres	776
12557	Caicedo	776
12558	Caldas	776
12559	Campamento	776
12560	Canasgordas	776
12561	Caracoli	776
12562	Caramanta	776
12563	Carepa	776
12564	Carmen de Viboral	776
12565	Carolina	776
12566	Caucasia	776
12567	Chigorodo	776
12568	Cisneros	776
12569	Cocorna	776
12570	Concepcion	776
12571	Concordia	776
12572	Copacabana	776
12573	Dabeiba	776
12574	Don Matias	776
12575	Ebejico	776
12576	El Bagre	776
12577	Entrerrios	776
12578	Envigado	776
12579	Fredonia	776
12580	Frontino	776
12581	Giraldo	776
12582	Girardota	776
12583	Gomez Plata	776
12584	Granada	776
12585	Guadalupe	776
12586	Guarne	776
12587	Guatape	776
12588	Heliconia	776
12589	Hispania	776
12590	Itagui	776
12591	Ituango	776
12592	Jardin	776
12593	Jerico	776
12594	La Ceja	776
12595	La Estrella	776
12596	La Pintada	776
12597	La Union	776
12598	Liborina	776
12599	Maceo	776
12600	Marinilla	776
12601	Medellin	776
12602	Montebello	776
12603	Murindo	776
12604	Mutata	776
12605	Narino	776
12606	Nechi	776
12607	Necocli	776
12608	Olaya	776
12609	Penol	776
12610	Peque	776
12611	Pueblorrico	776
12612	Puerto Berrio	776
12613	Puerto Nare	776
12614	Puerto Triunfo	776
12615	Remedios	776
12616	Retiro	776
12617	Rionegro	776
12618	Sabanalarga	776
12619	Sabaneta	776
12620	Salgar	776
12621	San Andres	776
12622	San Carlos	776
12623	San Francisco	776
12624	San Jeronimo	776
12625	San Jose de la Montana	776
12626	San Juan de Uraba	776
12627	San Luis	776
12628	San Pedro	776
12629	San Pedro de Uraba	776
12630	San Rafael	776
12631	San Roque	776
12632	San Vicente	776
12633	Santa Barbara	776
12634	Santa Rosa de Osos	776
12635	Santo Domingo	776
12636	Santuario	776
12637	Segovia	776
12638	Sonson	776
12639	Sopetran	776
12640	Tamesis	776
12641	Taraza	776
12642	Tarso	776
12643	Titiribi	776
12644	Toledo	776
12645	Turbo	776
12646	Uramita	776
12647	Urrao	776
12648	Valdivia	776
12649	Valparaiso	776
12650	Vegachi	776
12651	Venecia	776
12652	Vigia del Fuerte	776
12653	Yali	776
12654	Yarumal	776
12655	Yolombo	776
12656	Yondo	776
12657	Zaragoza	776
12658	Arauca	777
12659	Arauquita	777
12660	Cravo Norte	777
12661	Fortul	777
12662	Puerto Rondon	777
12663	Saravena	777
12664	Tame	777
12665	Baranoa	778
12666	Barranquilla	778
12667	Campo de la Cruz	778
12668	Candelaria	778
12669	Galapa	778
12670	Juan de Acosta	778
12671	Luruaco	778
12672	Malambo	778
12673	Manati	778
12674	Palmar de Varela	778
12675	Piojo	778
12676	Polo Nuevo	778
12677	Ponedera	778
12678	Puerto Colombia	778
12679	Repelon	778
12680	Sabanagrande	778
12681	Sabanalarga	778
12682	Santa Lucia	778
12683	Santo Tomas	778
12684	Soledad	778
12685	Suan	778
12686	Tubara	778
12687	Usiacuri	778
12688	Bogota	779
12689	Achi	780
12690	Altos del Rosario	780
12691	Arenal	780
12692	Arjona	780
12693	Arroyohondo	780
12694	Barranco de Loba	780
12695	Calamar	780
12696	Cantagallo	780
12697	Cartagena	780
12698	Cicuco	780
12699	Clemencia	780
12700	Cordoba	780
12701	El Carmen de Bolivar	780
12702	El Guamo	780
12703	El Penon	780
12704	Hatillo de Loba	780
12705	Magangue	780
12706	Mahates	780
12707	Margarita	780
12708	Maria la Baja	780
12709	Mompos	780
12710	Montecristo	780
12711	Morales	780
12712	Pinillos	780
12713	Regidor	780
12714	Rio Viejo	780
12715	San Cristobal	780
12716	San Estanislao	780
12717	San Fernando	780
12718	San Jacinto	780
12719	San Jacinto del Cauca	780
12720	San Juan Nepomuceno	780
12721	San Martin de Loba	780
12722	San Pablo	780
12723	Santa Catalina	780
12724	Santa Rosa	780
12725	Santa Rosa del Sur	780
12726	Simiti	780
12727	Soplaviento	780
12728	Talaigua Nuevo	780
12729	Tiquisio	780
12730	Turbaco	780
12731	Turbana	780
12732	Villanueva	780
12733	Zambrano	780
12734	Almeida	781
12735	Aquitania	781
12736	Arcabuco	781
12737	Belen	781
12738	Berbeo	781
12739	Beteitiva	781
12740	Boavita	781
12741	Boyaca	781
12742	Briceno	781
12743	Buenavista	781
12744	Busbanza	781
12745	Caldas	781
12746	Campohermoso	781
12747	Cerinza	781
12748	Chinavita	781
12749	Chiquinquira	781
12750	Chiquiza	781
12751	Chiscas	781
12752	Chita	781
12753	Chitaraque	781
12754	Chivata	781
12755	Chivor	781
12756	Cienega	781
12757	Combita	781
12758	Coper	781
12759	Corrales	781
12760	Covarachia	781
12761	Cubara	781
12762	Cucaita	781
12763	Cuitiva	781
12764	Duitama	781
12765	El Cocuy	781
12766	El Espino	781
12767	Firavitoba	781
12768	Floresta	781
12769	Gachantiva	781
12770	Gameza	781
12771	Garagoa	781
12772	Guacamayas	781
12773	Guateque	781
12774	Guayata	781
12775	Guican	781
12776	Iza	781
12777	Jenesano	781
12778	Jerico	781
12779	La Capilla	781
12780	La Uvita	781
12781	La Victoria	781
12782	Labranzagrande	781
12783	Leiva	781
12784	Macanal	781
12785	Maripi	781
12786	Miraflores	781
12787	Mongua	781
12788	Mongui	781
12789	Moniquira	781
12790	Motavita	781
12791	Muzo	781
12792	Nobsa	781
12793	Nuevo Colon	781
12794	Oicata	781
12795	Otanche	781
12796	Pachavita	781
12797	Paez	781
12798	Paipa	781
12799	Pajarito	781
12800	Panqueba	781
12801	Pauna	781
12802	Paya	781
12803	Paz del Rio	781
12804	Pesca	781
12805	Pisba	781
12806	Puerto Boyaca	781
12807	Quipama	781
12808	Ramiriqui	781
12809	Raquira	781
12810	Rondon	781
12811	Saboya	781
12812	Sachica	781
12813	Samaca	781
12814	San Eduardo	781
12815	San Jose de Pare	781
12816	San Luis de Gaceno	781
12817	San Mateo	781
12818	San Miguel de Sema	781
12819	San Pablo de Borbur	781
12820	Santa Maria	781
12821	Santa Rosa de Viterbo	781
12822	Santa Sofia	781
12823	Santana	781
12824	Sativanorte	781
12825	Sativasur	781
12826	Siachoque	781
12827	Soata	781
12828	Socha	781
12829	Socota	781
12830	Sogamoso	781
12831	Somondoco	781
12832	Sora	781
12833	Soraca	781
12834	Sotaquira	781
12835	Susacon	781
12836	Sutamarchan	781
12837	Sutatenza	781
12838	Tasco	781
12839	Tenza	781
12840	Tibana	781
12841	Tibasosa	781
12842	Tinjaca	781
12843	Tipacoque	781
12844	Toca	781
12845	Togui	781
12846	Topaga	781
12847	Tota	781
12848	Tunja	781
12849	Tunungua	781
12850	Turmeque	781
12851	Tuta	781
12852	Tutasa	781
12853	Umbita	781
12854	Ventaquemada	781
12855	Viracacha	781
12856	Zetaquira	781
12857	Aguadas	782
12858	Anserma	782
12859	Aranzazu	782
12860	Belalcazar	782
12861	Chinchina	782
12862	Filadelfia	782
12863	La Dorada	782
12864	La Merced	782
12865	Manizales	782
12866	Manzanares	782
12867	Marmato	782
12868	Marquetalia	782
12869	Marulanda	782
12870	Neira	782
12871	Norcasia	782
12872	Pacora	782
12873	Palestina	782
12874	Pensilvania	782
12875	Riosucio	782
12876	Risaralda	782
12877	Salamina	782
12878	Samana	782
12879	San Jose	782
12880	Supia	782
12881	Victoria	782
12882	Villamaria	782
12883	Viterbo	782
12884	Albania	783
12885	Belen Andaquies	783
12886	Cartagena del Chaira	783
12887	Curillo	783
12888	El Doncello	783
12889	El Paujil	783
12890	Florencia	783
12891	La Montanita	783
12892	Milan	783
12893	Morelia	783
12894	Puerto Rico	783
12895	San Jose de Fragua	783
12896	San Vicente del Caguan	783
12897	Solano	783
12898	Solita	783
12899	Valparaiso	783
12900	Aguazul	784
12901	Chameza	784
12902	Hato Corozal	784
12903	La Salina	784
12904	Mani	784
12905	Monterrey	784
12906	Nunchia	784
12907	Orocue	784
12908	Paz de Ariporo	784
12909	Pore	784
12910	Recetor	784
12911	Sabanalarga	784
12912	Sacama	784
12913	San Luis de Palenque	784
12914	Tamara	784
12915	Tauramena	784
12916	Trinidad	784
12917	Villanueva	784
12918	Yopal	784
12919	Almaguer	785
12920	Argelia	785
12921	Balboa	785
12922	Bolivar	785
12923	Buenos Aires	785
12924	Cajibio	785
12925	Caldono	785
12926	Caloto	785
12927	Corinto	785
12928	El Bordo	785
12929	El Tambo	785
12930	Florencia	785
12931	Guapi	785
12932	Inza	785
12933	Jambalo	785
12934	La Sierra	785
12935	La Vega	785
12936	Lopez	785
12937	Mercaderes	785
12938	Miranda	785
12939	Morales	785
12940	Padilla	785
12941	Paez	785
12942	Piamonte	785
12943	Piendamo	785
12944	Popayan	785
12945	Puerto Tejada	785
12946	Purace	785
12947	Rosas	785
12948	San Sebastian	785
12949	Santa Rosa	785
12950	Santander de Quilichao	785
12951	Silvia	785
12952	Sotara	785
12953	Suarez	785
12954	Sucre	785
12955	Timbio	785
12956	Timbiqui	785
12957	Toribio	785
12958	Totoro	785
12959	Villa Rica	785
12960	Aguachica	786
12961	Agustin Codazzi	786
12962	Astrea	786
12963	Becerril	786
12964	Bosconia	786
12965	Chimichagua	786
12966	Chiriguana	786
12967	Curumani	786
12968	El Copey	786
12969	El Paso	786
12970	Gamarra	786
12971	Gonzalez	786
12972	La Gloria	786
12973	La Jagua Ibirico	786
12974	Manaure	786
12975	Pailitas	786
12976	Pelaya	786
12977	Pueblo Bello	786
12978	Rio de Oro	786
12979	Robles la Paz	786
12980	San Alberto	786
12981	San Diego	786
12982	San Martin	786
12983	Tamalameque	786
12984	Valledupar	786
12985	Acandi	787
12986	Alto Baudo	787
12987	Atrato	787
12988	Bagado	787
12989	Bahia Solano	787
12990	Bajo Baudo	787
12991	Bojaya	787
12992	Canton de San Pablo	787
12993	Carmen del Darien	787
12994	Certegui	787
12995	Condoto	787
12996	El Carmen	787
12997	Istmina	787
12998	Jurado	787
12999	Litoral del San Juan	787
13000	Lloro	787
13001	Medio Atrato	787
13002	Medio Baudo	787
13003	Medio San Juan	787
13004	Novita	787
13005	Nuqui	787
13006	Quibdo	787
13007	Rio Iro	787
13008	Rio Quito	787
13009	Riosucio	787
13010	San Jose del Palmar	787
13011	Sipi	787
13012	Tado	787
13013	Unguia	787
13014	Union Panamericana	787
13015	Ayapel	788
13016	Buenavista	788
13017	Canalete	788
13018	Cerete	788
13019	Chima	788
13020	Chinu	788
13021	Cienaga de Oro	788
13022	Cotorra	788
13023	La Apartada	788
13024	Lorica	788
13025	Los Cordobas	788
13026	Momil	788
13027	Monitos	788
13028	Montelibano	788
13029	Monteria	788
13030	Planeta Rica	788
13031	Pueblo Nuevo	788
13032	Puerto Escondido	788
13033	Puerto Libertador	788
13034	Purisima	788
13035	Sahagun	788
13036	San Andres Sotavento	788
13037	San Antero	788
13038	San Bernardo Viento	788
13039	San Carlos	788
13040	San Pelayo	788
13041	Tierralta	788
13042	Valencia	788
13043	Agua de Dios	789
13044	Alban	789
13045	Anapoima	789
13046	Anolaima	789
13047	Arbelaez	789
13048	Beltran	789
13049	Bituima	789
13050	Bojaca	789
13051	Cabrera	789
13052	Cachipay	789
13053	Cajica	789
13054	Caparrapi	789
13055	Caqueza	789
13056	Carmen de Carupa	789
13057	Chaguani	789
13058	Chia	789
13059	Chipaque	789
13060	Choachi	789
13061	Choconta	789
13062	Cogua	789
13063	Cota	789
13064	Cucunuba	789
13065	El Colegio	789
13066	El Penon	789
13067	El Rosal	789
13068	Facatativa	789
13069	Fomeque	789
13070	Fosca	789
13071	Funza	789
13072	Fuquene	789
13073	Fusagasuga	789
13074	Gachala	789
13075	Gachancipa	789
13076	Gacheta	789
13077	Gama	789
13078	Girardot	789
13079	Granada	789
13080	Guacheta	789
13081	Guaduas	789
13082	Guasca	789
13083	Guataqui	789
13084	Guatavita	789
13085	Guayabal de Siquima	789
13086	Guayabetal	789
13087	Gutierrez	789
13088	Jerusalen	789
13089	Junin	789
13090	La Calera	789
13091	La Mesa	789
13092	La Palma	789
13093	La Pena	789
13094	La Vega	789
13095	Lenguazaque	789
13096	Macheta	789
13097	Madrid	789
13098	Manta	789
13099	Medina	789
13100	Mosquera	789
13101	Narino	789
13102	Nemocon	789
13103	Nilo	789
13104	Nimaima	789
13105	Nocaima	789
13106	Ospina Perez	789
13107	Pacho	789
13108	Paime	789
13109	Pandi	789
13110	Paratebueno	789
13111	Pasca	789
13112	Puerto Salgar	789
13113	Puli	789
13114	Quebradanegra	789
13115	Quetame	789
13116	Quipile	789
13117	Rafael Reyes	789
13118	Ricaurte	789
13119	San Antonio del Tequendama	789
13120	San Bernardo	789
13121	San Cayetano	789
13122	San Francisco	789
13123	San Juan de Rioseco	789
13124	Sasaima	789
13125	Sesquile	789
13126	Sibate	789
13127	Silvania	789
13128	Simijaca	789
13129	Soacha	789
13130	Sopo	789
13131	Subachoque	789
13132	Suesca	789
13133	Supata	789
13134	Susa	789
13135	Sutatausa	789
13136	Tabio	789
13137	Tausa	789
13138	Tena	789
13139	Tenjo	789
13140	Tibacuy	789
13141	Tibirita	789
13142	Tocaima	789
13143	Tocancipa	789
13144	Topaipi	789
13145	Ubala	789
13146	Ubaque	789
13147	Ubate	789
13148	Une	789
13149	Utica	789
13150	Vergara	789
13151	Viani	789
13152	Villagomez	789
13153	Villapinzon	789
13154	Villeta	789
13155	Viota	789
13156	Yacopi	789
13157	Zipacon	789
13158	Zipaquira	789
13159	Inirida	790
13160	Calamar	791
13161	El Retorno	791
13162	Miraflores	791
13163	San Jose del Guaviare	791
13164	Acevedo	792
13165	Agrado	792
13166	Aipe	792
13167	Algeciras	792
13168	Altamira	792
13169	Baraya	792
13170	Campoalegre	792
13171	Colombia	792
13172	Elias	792
13173	Garzon	792
13174	Gigante	792
13175	Guadalupe	792
13176	Hobo	792
13177	Iquira	792
13178	Isnos	792
13179	La Argentina	792
13180	La Plata	792
13181	Nataga	792
13182	Neiva	792
13183	Oporapa	792
13184	Paicol	792
13185	Palermo	792
13186	Palestina	792
13187	Pital	792
13188	Pitalito	792
13189	Rivera	792
13190	Saladoblanco	792
13191	San Agustin	792
13192	Santa Maria	792
13193	Suaza	792
13194	Tarqui	792
13195	Tello	792
13196	Teruel	792
13197	Tesalia	792
13198	Timana	792
13199	Villavieja	792
13200	Yaguara	792
13201	Algarrobo	794
13202	Aracataca	794
13203	Ariguani	794
13204	Cerro San Antonio	794
13205	Chivolo	794
13206	Cienaga	794
13207	Concordia	794
13208	El Banco	794
13209	El Pinon	794
13210	El Reten	794
13211	Fundacion	794
13212	Guamal	794
13213	Nueva Granada	794
13214	Pedraza	794
13215	Pijino del Carmen	794
13216	Pivijay	794
13217	Plato	794
13218	Puebloviejo	794
13219	Remolino	794
13220	Sabanas de San Angel	794
13221	Salamina	794
13222	San Sebastian	794
13223	San Zenon	794
13224	Santa Ana	794
13225	Santa Barbara de Pinto	794
13226	Santa Marta	794
13227	Sitionuevo	794
13228	Tenerife	794
13229	Zapayan	794
13230	Zona Bananera	794
13231	Acacias	795
13232	Barranca de Upia	795
13233	Cabuyaro	795
13234	Castilla la Nueva	795
13235	Cubarral	795
13236	Cumaral	795
13237	El Calvario	795
13238	El Castillo	795
13239	El Dorado	795
13240	Fuente de Oro	795
13241	Granada	795
13242	Guamal	795
13243	La Macarena	795
13244	La Uribe	795
13245	Lejanias	795
13246	Mapiripan	795
13247	Mesetas	795
13248	Puerto Concordia	795
13249	Puerto Gaitan	795
13250	Puerto Lleras	795
13251	Puerto Lopez	795
13252	Puerto Rico	795
13253	Restrepo	795
13254	San Carlos Guaroa	795
13255	San Juan de Arama	795
13256	San Juanito	795
13257	San Martin	795
13258	Villavicencio	795
13259	Vista Hermosa	795
13260	Alban	796
13261	Aldana	796
13262	Ancuya	796
13263	Arboleda	796
13264	Barbacoas	796
13265	Belen	796
13266	Buesaco	796
13267	Chachagui	796
13268	Colon	796
13269	Consaca	796
13270	Contadero	796
13271	Cordoba	796
13272	Cuaspud	796
13273	Cumbal	796
13274	Cumbitara	796
13275	El Charco	796
13276	El Penol	796
13277	El Rosario	796
13278	El Tablon	796
13279	El Tambo	796
13280	Funes	796
13281	Guachucal	796
13282	Guaitarilla	796
13283	Gualmatan	796
13284	Iles	796
13285	Imues	796
13286	Ipiales	796
13287	La Cruz	796
13288	La Florida	796
13289	La Llanada	796
13290	La Tola	796
13291	La Union	796
13292	Leiva	796
13293	Linares	796
13294	Los Andes	796
13295	Magui	796
13296	Mallama	796
13297	Mosquera	796
13298	Narino	796
13299	Olaya Herrera	796
13300	Ospina	796
13301	Pasto	796
13302	Pizarro	796
13303	Policarpa	796
13304	Potosi	796
13305	Providencia	796
13306	Puerres	796
13307	Pupiales	796
13308	Ricaurte	796
13309	Roberto Payan	796
13310	Samaniego	796
13311	San Bernardo	796
13312	San Lorenzo	796
13313	San Pablo	796
13314	San Pedro de Cartago	796
13315	Sandona	796
13316	Santa Barbara	796
13317	Santacruz	796
13318	Sapuyes	796
13319	Taminango	796
13320	Tangua	796
13321	Tumaco	796
13322	Tuquerres	796
13323	Yacuanquer	796
13324	Colon	798
13325	Mocoa	798
13326	Orito	798
13327	Puerto Asis	798
13328	Puerto Caycedo	798
13329	Puerto Guzman	798
13330	Puerto Leguizamo	798
13331	San Francisco	798
13332	San Miguel	798
13333	Santiago	798
13334	Sibundoy	798
13335	Valle del Guamuez	798
13336	Villagarzon	798
13337	Armenia	799
13338	Buenavista	799
13339	Calarca	799
13340	Circasia	799
13341	Cordoba	799
13342	Filandia	799
13343	Genova	799
13344	La Tebaida	799
13345	Montenegro	799
13346	Pijao	799
13347	Quimbaya	799
13348	Salento	799
13349	Apia	800
13350	Balboa	800
13351	Belen de Umbria	800
13352	Dos Quebradas	800
13353	Guatica	800
13354	La Celia	800
13355	La Virginia	800
13356	Marsella	800
13357	Mistrato	800
13358	Pereira	800
13359	Pueblo Rico	800
13360	Quinchia	800
13361	Santa Rosa de Cabal	800
13362	Santuario	800
13363	Aguada	802
13364	Albania	802
13365	Aratoca	802
13366	Barbosa	802
13367	Barichara	802
13368	Barrancabermeja	802
13369	Betulia	802
13370	Bolivar	802
13371	Bucaramanga	802
13372	Cabrera	802
13373	California	802
13374	Capitanejo	802
13375	Carcasi	802
13376	Cepita	802
13377	Cerrito	802
13378	Charala	802
13379	Charta	802
13380	Chima	802
13381	Chipata	802
13382	Cimitarra	802
13383	Concepcion	802
13384	Confines	802
13385	Contratacion	802
13386	Coromoro	802
13387	Curiti	802
13388	El Carmen	802
13389	El Guacamayo	802
13390	El Penon	802
13391	El Playon	802
13392	Encino	802
13393	Enciso	802
13394	Florian	802
13395	Floridablanca	802
13396	Galan	802
13397	Gambita	802
13398	Giron	802
13399	Guaca	802
13400	Guadalupe	802
13401	Guapota	802
13402	Guavata	802
13403	Guepsa	802
13404	Hato	802
13405	Jesus Maria	802
13406	Jordan	802
13407	La Belleza	802
13408	La Paz	802
13409	Landazuri	802
13410	Lebrija	802
13411	Los Santos	802
13412	Macaravita	802
13413	Malaga	802
13414	Matanza	802
13415	Mogotes	802
13416	Molagavita	802
13417	Ocamonte	802
13418	Oiba	802
13419	Onzaga	802
13420	Palmar	802
13421	Palmas del Socorro	802
13422	Paramo	802
13423	Piedecuesta	802
13424	Pinchote	802
13425	Puente Nacional	802
13426	Puerto Parra	802
13427	Puerto Wilches	802
13428	Rionegro	802
13429	Sabana de Torres	802
13430	San Andres	802
13431	San Benito	802
13432	San Gil	802
13433	San Joaquin	802
13434	San Jose de Miranda	802
13435	San Miguel	802
13436	San Vicente de Chucuri	802
13437	Santa Barbara	802
13438	Santa Helena	802
13439	Simacota	802
13440	Socorro	802
13441	Suaita	802
13442	Sucre	802
13443	Surata	802
13444	Tona	802
13445	Valle San Jose	802
13446	Velez	802
13447	Vetas	802
13448	Villanueva	802
13449	Zapatoca	802
13450	Buenavista	803
13451	Caimito	803
13452	Chalan	803
13453	Coloso	803
13454	Corozal	803
13455	El Roble	803
13456	Galeras	803
13457	Guaranda	803
13458	La Union	803
13459	Los Palmitos	803
13460	Majagual	803
13461	Morroa	803
13462	Ovejas	803
13463	Palmito	803
13464	Sampues	803
13465	San Benito Abad	803
13466	San Juan de Betulia	803
13467	San Marcos	803
13468	San Onofre	803
13469	San Pedro	803
13470	Since	803
13471	Sincelejo	803
13472	Sucre	803
13473	Tolu	803
13474	Toluviejo	803
13475	Alpujarra	804
13476	Alvarado	804
13477	Ambalema	804
13478	Anzoategui	804
13479	Ataco	804
13480	Cajamarca	804
13481	Carmen de Apicala	804
13482	Casabianca	804
13483	Chaparral	804
13484	Coello	804
13485	Coyaima	804
13486	Cunday	804
13487	Dolores	804
13488	Espinal	804
13489	Falan	804
13490	Flandes	804
13491	Fresno	804
13492	Guamo	804
13493	Guayabal	804
13494	Herveo	804
13495	Honda	804
13496	Ibague	804
13497	Icononzo	804
13498	Lerida	804
13499	Libano	804
13500	Mariquita	804
13501	Melgar	804
13502	Murillo	804
13503	Natagaima	804
13504	Ortega	804
13505	Palocabildo	804
13506	Piedras	804
13507	Planadas	804
13508	Prado	804
13509	Purificacion	804
13510	Rioblanco	804
13511	Roncesvalles	804
13512	Rovira	804
13513	Saldana	804
13514	San Antonio	804
13515	San Luis	804
13516	Santa Isabel	804
13517	Suarez	804
13518	Valle de San Juan	804
13519	Venadillo	804
13520	Villahermosa	804
13521	Villarrica	804
13522	Acaricuara	806
13523	Mitu	806
13524	Papunaua	806
13525	Taraira	806
13526	Villa Fatima	806
13527	Yavarate	806
13528	Cumaribo	807
13529	La Primavera	807
13530	Puerto Carreno	807
13531	Santa Rosalia	807
13532	Fomboni	808
13533	Mitsamiouli	809
13534	Moroni	809
13535	Domoni	810
13536	Mutsamudu	810
13537	Loudima	811
13538	Madingou	811
13539	Nkayi	811
13540	Brazzaville	812
13541	Ewo	813
13542	Kelle	813
13543	Makoua	813
13544	Mossaka	813
13545	Owando	813
13546	Loandjili	814
13547	Ngamaba-Mfilou	814
13548	Pointe Noire	814
13549	Sibiti	815
13550	Zanaga	815
13551	Dongou	816
13552	Epena	816
13553	Impfondo	816
13554	Kibangou	817
13555	Loubomo	817
13556	Matsanga	817
13557	Mossendjo	817
13558	Djambala	818
13559	Gamboma	818
13560	Boko	819
13561	Kinkala	819
13562	Mindouli	819
13563	Ikelemba	820
13564	Ouesso	820
13565	Sembe	820
13566	Souanke	820
13567	Bandundu	821
13568	Bolobo	821
13569	Bulungu	821
13570	Gungu	821
13571	Idiofa	821
13572	Inongo	821
13573	Kahemba	821
13574	Kasongo-Lunda	821
13575	Kenge	821
13576	Kikwit	821
13577	Kiri	821
13578	Kutu	821
13579	Lusanga	821
13580	Mangai	821
13581	Mushie	821
13582	Nioki	821
13583	Boma	822
13584	Kasangulu	822
13585	Kimpese	822
13586	Madimba	822
13587	Matadi	822
13588	Mbanza-Ngungu	822
13589	Muanda	822
13590	Tshela	822
13591	Basankusu	823
13592	Binga	823
13593	Bodalangi	823
13594	Boende	823
13595	Bongandanga	823
13596	Bosobolo	823
13597	Bumba	823
13598	Businga	823
13599	Gbadolite	823
13600	Gemena	823
13601	Ikela	823
13602	Libenge	823
13603	Lisala	823
13604	Makanza	823
13605	Mbandaka	823
13606	Mobayi-Mbongo	823
13607	Yakoma	823
13608	Yandongi	823
13609	Yumbi	823
13610	Zongo	823
13611	Aba	824
13612	Aketi	824
13613	Bafwasende	824
13614	Banalia	824
13615	Basoko	824
13616	Bondo	824
13617	Bunia	824
13618	Buta	824
13619	Djugu	824
13620	Faradje	824
13621	Gwane	824
13622	Isiro	824
13623	Itoko	824
13624	Kisangani	824
13625	Mambasa	824
13626	Mongbwalu	824
13627	Niangara	824
13628	Poko	824
13629	Simba	824
13630	Titule	824
13631	Ubundu	824
13632	Wamba	824
13633	Watsa	824
13634	Yangambi	824
13635	Demba	825
13636	Dibaya	825
13637	Ilebo	825
13638	Kananga	825
13639	Kazumba	825
13640	Luebo	825
13641	Mweka	825
13642	Tshikapa	825
13643	Gandajika	826
13644	Kabinda	826
13645	Katako-Kombe	826
13646	Kole	826
13647	Lodja	826
13648	Lubao	826
13649	Lubefu	826
13650	Lusambo	826
13651	Mbuji-Mayi	826
13652	Mwene-Ditu	826
13653	Tshilenge	826
13654	Tshofa	826
13655	Bukama	827
13656	Dilolo	827
13657	Kabalo	827
13658	Kalemie	827
13659	Kambove	827
13660	Kamina	827
13661	Kaniama	827
13662	Kikondjo	827
13663	Kipushi	827
13664	Kolwezi	827
13665	Kongolo	827
13666	Le Marinel	827
13667	Likasi	827
13668	Lubudi	827
13669	Lubumbashi	827
13670	Malemba-Nkulu	827
13671	Manono	827
13672	Moba	827
13673	Mulongo	827
13674	Mwanza	827
13675	Nyunzu	827
13676	Sakania	827
13677	Shinkolobwe	827
13678	Kinshasa	828
13679	Kalima	829
13680	Kasongo	829
13681	Kindu	829
13682	Beni	830
13683	Butembo	830
13684	Goma	830
13685	Bukavu	831
13686	Kabare	831
13687	Kama	831
13688	Kampene	831
13689	Kibombo	831
13690	Uvira	831
13691	Amuri	832
13692	Atiu	833
13693	Mangaia	834
13694	Tauhunu	835
13695	Mauke	836
13696	Mitiaro	837
13697	Nassau	838
13698	Roto	839
13699	Rakahanga	840
13700	Avarua	841
13701	Omoka	842
13702	Alajuela	843
13703	Atenas	843
13704	Bijagua	843
13705	Buenos Aires	843
13706	Carrillos	843
13707	Desemparados	843
13708	Dos Rios	843
13709	Esquipulas	843
13710	Florencia	843
13711	Fortuna	843
13712	Grecia	843
13713	Guacimo	843
13714	Laguna	843
13715	Los Chiles	843
13716	Mastate	843
13717	Naranjo	843
13718	Orotina	843
13719	Palmares	843
13720	Piedades Norte	843
13721	Pital	843
13722	Pocosol	843
13723	Quesada	843
13724	Rio Segundo	843
13725	Sabanilla	843
13726	San Antonio	843
13727	San Jose	843
13728	San Juan	843
13729	San Mateo	843
13730	San Pedro	843
13731	San Rafael	843
13732	San Ramon	843
13733	San Roque	843
13734	Santiago	843
13735	Sarchi Norte	843
13736	Sarchi Sur	843
13737	Tigra	843
13738	Turricares	843
13739	Upala	843
13740	Venado	843
13741	Zarcero	843
13742	Aguacaliente	844
13743	Capellades	844
13744	Carmen	844
13745	Cartago	844
13746	Concepcion	844
13747	Cot	844
13748	Dulce Nombre	844
13749	El Tejar	844
13750	Guadalupe	844
13751	Juan Vinas	844
13752	La Suiza	844
13753	Orosi	844
13754	Pacayas	844
13755	Paraiso	844
13756	Pejibaye	844
13757	San Diego	844
13758	San Isidro	844
13759	San Juan	844
13760	San Nicolas	844
13761	San Rafael	844
13762	San Ramon	844
13763	Tierra Blanca	844
13764	Tobosi	844
13765	Tres Rios	844
13766	Tucurrique	844
13767	Turrialba	844
13768	Bagaces	845
13769	Belen	845
13770	Canas	845
13771	Filadeldia	845
13772	Fortuna	845
13773	Hojancha	845
13774	Juntas	845
13775	La Cruz	845
13776	Liberia	845
13777	Mogote	845
13778	Nandayure	845
13779	Nicoya	845
13780	Samara	845
13781	Santa Cruz	845
13782	Sardinal	845
13783	Tilaran	845
13784	Angeles	846
13785	Asuncion	846
13786	Barrantes	846
13787	Barva	846
13788	Heredia	846
13789	Horquetas	846
13790	Llorente	846
13791	Mercedes	846
13792	Puerto Viejo	846
13793	Rivera	846
13794	San Antonio	846
13795	San Francisco	846
13796	San Isidro	846
13797	San Joaquin	846
13798	San Jose	846
13799	San Josecito	846
13800	San Juan	846
13801	San Miguel	846
13802	San Pablo	846
13803	San Pedro	846
13804	San Rafael	846
13805	San Roque	846
13806	San Vicente	846
13807	Santa Barbara	846
13808	Santa Lucia	846
13809	Santa Rosa	846
13810	Santiago	846
13811	Santo Domingo	846
13812	Santo Tomas	846
13813	Ulloa	846
13814	Batan	847
13815	Cahuita	847
13816	Cariari	847
13817	Guacimo	847
13818	Guapiles	847
13819	Jimenez	847
13820	Limon	847
13821	Matina	847
13822	Pocora	847
13823	Rita	847
13824	Roxana	847
13825	Siquirres	847
13826	Sixaola	847
13827	Valle la Estrella	847
13828	Buenos Aires	848
13829	Canoas	848
13830	Chacarita	848
13831	Corredor	848
13832	Esparta	848
13833	Espiritu Santo	848
13834	Golfito	848
13835	Guaycara	848
13836	Jaco	848
13837	La Cuesta	848
13838	Macacona	848
13839	Manzanillo	848
13840	Miramar	848
13841	Palmar	848
13842	Paquera	848
13843	Parrita	848
13844	Puerto Cortes	848
13845	Puerto Jimenez	848
13846	Puntarenas	848
13847	Quepos	848
13848	San Vito	848
13849	Marcory	850
13850	Adzope	851
13851	Affery	851
13852	Agboville	851
13853	Akoupe	851
13854	Rubino	851
13855	Touba	852
13856	Bako	853
13857	Odienne	853
13858	Gagnoa	855
13859	Guiberoua	855
13860	Hire	855
13861	Ndouci	855
13862	Oume	855
13863	Ouragahio	855
13864	Daloa	856
13865	Issia	856
13866	Vavoua	856
13867	Ndiekro	857
13868	Tiebissou	857
13869	Toumodi	857
13870	Yamoussoukro	857
13871	Abidjan	858
13872	Alepe	858
13873	Anyama	858
13874	Bingerville	858
13875	Dabou	858
13876	Grand-Lahou	858
13877	Jacqueville	858
13878	Tiassale	858
13879	Bouafle	859
13880	Sinfra	859
13881	Zuenoula	859
13882	Duekoue	860
13883	Guiglo	860
13884	Toulepleu	860
13885	Abengourou	861
13886	Agnibilekrou	861
13887	Arrah	862
13888	Bocanda	862
13889	Bongouanou	862
13890	Daoukro	862
13891	Dimbokro	862
13892	Mbahiakro	862
13893	Mbatto	862
13894	Nzi-Comoe	862
13895	San-Pedro	863
13896	Sassandra	863
13897	Soubre	863
13898	Tabou	863
13899	Boundiali	864
13900	Dikodougou	864
13901	Ferkessedougou	864
13902	Korhogo	864
13903	Tingrela	864
13904	Divo	865
13905	Fresco	865
13906	Lakota	865
13907	Aboisso	866
13908	Adiake	866
13909	Ayame	866
13910	Bonoua	866
13911	Grand Bassam	866
13912	Kani	868
13913	Mankono	868
13914	Seguela	868
13915	Bondoukou	869
13916	Bouna	869
13917	Tanda	869
13918	Bjelovar	870
13919	Brezovac	870
13920	Chazma	870
13921	Daruvar	870
13922	Daruvarski Brestovac	870
13923	Dezhanovac	870
13924	Dhulovac	870
13925	Gareshnica	870
13926	Gareshnichki Brestovac	870
13927	Grubishno Polje	870
13928	Gudovac	870
13929	Hercegovac	870
13930	Ivanska	870
13931	Klokochevac	870
13932	Konchanica	870
13933	Predavac	870
13934	Rovishce	870
13935	Shandrovac	870
13936	Sirach	870
13937	Trojstveni Markovac	870
13938	Velika Pisanica	870
13939	Veliki Grdhevac	870
13940	Veliki Zdenci	870
13941	Veliko Trojstvo	870
13942	Zhdralovi	870
13943	Blato	871
13944	Cavtat	871
13945	Chibacha	871
13946	Chilipi	871
13947	Dubrovnik	871
13948	Komin	871
13949	Korchula	871
13950	Lumbarda	871
13951	Metkovic	871
13952	Mlini	871
13953	Mokoshica	871
13954	Nova Mokoshica	871
13955	Opuzen	871
13956	Orebic	871
13957	Otrich-Seoci	871
13958	Ploche	871
13959	Smokvica	871
13960	Stashevica	871
13961	Vela Luka	871
13962	Zaton	871
13963	Zhrnovo	871
13964	Bale	873
13965	Banjole	873
13966	Brtonigla	873
13967	Buje	873
13968	Buzet	873
13969	Fazhana	873
13970	Funtana	873
13971	Galizhana	873
13972	Labin	873
13973	Lizhnjan	873
13974	Marchana	873
13975	Medulin	873
13976	Novigrad	873
13977	Pazin	873
13978	Porech	873
13979	Premantura	873
13980	Pula	873
13981	Rabac	873
13982	Rasha	873
13983	Rovinj	873
13984	Sveti Petar u Shumi	873
13985	Tar	873
13986	Umag	873
13987	Vinezh	873
13988	Vodnjan	873
13989	Vrsar	873
13990	Cerovac Vukmansichki	874
13991	Draganic	874
13992	Duga Resa	874
13993	Josipdol	874
13994	Karlovac	874
13995	Mrezhnichki Varosh	874
13996	Ogulin	874
13997	Oshtarije	874
13998	Ozalj	874
13999	Plashki	874
14000	Slunj	874
14001	Vojnic	874
14002	Dhelekovec	875
14003	Dhurdhevac	875
14004	Drnje	875
14005	Ferdinandovac	875
14006	Glogovac	875
14007	Gola	875
14008	Hlebine	875
14009	Kalinovac	875
14010	Kloshtar Podravski	875
14011	Koprivnica	875
14012	Koprivnichki Bregi	875
14013	Koprivnichki Ivanec	875
14014	Krizhevci	875
14015	Legrad	875
14016	Molve	875
14017	Novigrad Podravski	875
14018	Novo Virje	875
14019	Peteranec	875
14020	Podravske Sesvete	875
14021	Rasinja	875
14022	Reka	875
14023	Sigetec	875
14024	Starigrad	875
14025	Sveti Ivan Zhabno	875
14026	Trema	875
14027	Virje	875
14028	Andrashevec	876
14029	Bedekovchina	876
14030	Dhurmanec	876
14031	Donja Pachetina	876
14032	Donja Shemnica	876
14033	Donja Stubica	876
14034	Dubrovchan	876
14035	Gornja Stubica	876
14036	Hum na Sutli	876
14037	Klanjec	876
14038	Konjishchina	876
14039	Krapina	876
14040	Krapinske Toplice	876
14041	Laz Bistrichki	876
14042	Marija Bistrica	876
14043	Mihovljan	876
14044	Oroslavje	876
14045	Podgorje Bistrichko	876
14046	Poznanovec	876
14047	Pregrada	876
14048	Radoboj	876
14049	Shkaricevo	876
14050	Shpichkovina	876
14051	Stubichke Toplice	876
14052	Sveti Krizh Zachretje	876
14053	Veliko Trgovishce	876
14054	Zabok	876
14055	Zlatar	876
14056	Zlatar-Bistrica	876
14057	Brinje	877
14058	Donji Lapac	877
14059	Gospic	877
14060	Korenica	877
14061	Lichki Osik	877
14062	Lichko Leshce	877
14063	Novalja	877
14064	Otochac	877
14065	Perushic	877
14066	Prozor	877
14067	Senj	877
14068	Belica	878
14069	Chakovec	878
14070	Cirkovljan	878
14071	Dekanovec	878
14072	Domashinec	878
14073	Donja Dubrava	878
14074	Donji Kraljevec	878
14075	Donji Vidovec	878
14076	Drzhimurec	878
14077	Dunjkovec	878
14078	Gardinovec	878
14079	Gorichan	878
14080	Gornji Hrashcan	878
14081	Hodoshan	878
14082	Ivanovec	878
14083	Kotoriba	878
14084	Kurshanec	878
14085	Lopatinec	878
14086	Machkovec	878
14087	Mala Subotica	878
14088	Mihovljan	878
14089	Mursko Sredishce	878
14090	Nedelishce	878
14091	Novakovec	878
14092	Novo Selo Rok	878
14093	Orehovica	878
14094	Palovec	878
14095	Peklenica	878
14096	Podturen	878
14097	Prelog	878
14098	Pribislavec	878
14099	Pushcine	878
14100	Savska Ves	878
14101	Selnica	878
14102	Shenkovec	878
14103	Strahoninec	878
14104	Sveta Marija	878
14105	Trnovec	878
14106	Vratishinec	878
14107	Zasadbreg	878
14108	Antunovac	880
14109	Batina	880
14110	Beli Manastir	880
14111	Belishce	880
14112	Beljevina	880
14113	Bijelo Brdo	880
14114	Bilje	880
14115	Bistrinci	880
14116	Bizovac	880
14117	Branjin Vrh	880
14118	Brijeshce	880
14119	Brijest	880
14120	Ceminac	880
14121	Chepin	880
14122	Crnkovci	880
14123	Dalj	880
14124	Darda	880
14125	Dhakovo	880
14126	Dhurdhenovac	880
14127	Donja Motichina	880
14128	Donji Miholac	880
14129	Erdut	880
14130	Ernestinovo	880
14131	Ferichanci	880
14132	Gashinci	880
14133	Gorjani	880
14134	Grabovac	880
14135	Ivanovac	880
14136	Ivanovci Gorjanski	880
14137	Jagodnjak	880
14138	Jelisavac	880
14139	Josipovac	880
14140	Josipovac Punitovachki	880
14141	Karanac	880
14142	Keshinci	880
14143	Knezhevi Vinogradi	880
14144	Knezhevo	880
14145	Koritna	880
14146	Koshka	880
14147	Kushevac	880
14148	Ladimirevci	880
14149	Laslovo	880
14150	Lug	880
14151	Marijanci	880
14152	Markovac Nashichki	880
14153	Martin	880
14154	Mece	880
14155	Moslavina Podravska	880
14156	Nashice	880
14157	Osijek	880
14158	Ovchara	880
14159	Petlovac	880
14160	Petrijevci	880
14161	Pishkorevci	880
14162	Podgorach	880
14163	Popvac	880
14164	Rakitovica	880
14165	Sarvash	880
14166	Satnica Dhakovachka	880
14167	Selci Dhakovacki	880
14168	Semeljci	880
14169	Shiroko Polje	880
14170	Strizivojna	880
14171	Sveti Dhuradh	880
14172	Tenja	880
14173	Valpovo	880
14174	Velimirovac	880
14175	Viljevo	880
14176	Vishkovci	880
14177	Vishnjevac	880
14178	Vladislavci	880
14179	Vuka	880
14180	Vukojevci	880
14181	Zmajevac	880
14182	Zoljan	880
14183	Badljevina	882
14184	Brodski Drenovac	882
14185	Dervishaga	882
14186	Gradac	882
14187	Jakshic	882
14188	Kaptol	882
14189	Kutjevo	882
14190	Lipik	882
14191	Pakrac	882
14192	Pleternica	882
14193	Pozhega	882
14194	Prekopkra	882
14195	Trenkovo	882
14196	Velika	882
14197	Vetovo	882
14198	Vidovci	882
14199	Bilice	884
14200	Brodarica	884
14201	Drnish	884
14202	Dubrava kod Shibenika	884
14203	Grebashtica	884
14204	Jezera	884
14205	Kistanje	884
14206	Knin	884
14207	Kovachic	884
14208	Murter	884
14209	Pirovac	884
14210	Primoshten	884
14211	Rogoznica	884
14212	Shibenik	884
14213	Skradin	884
14214	Tisno	884
14215	Tribunj	884
14216	Vodice	884
14217	Vrpolje	884
14218	Zaton	884
14219	Brestacha	885
14220	Brochice	885
14221	Budashevo	885
14222	Donja Grachenica	885
14223	Dvor	885
14224	Glina	885
14225	Gornja Grachenica	885
14226	Gornja Jelenska	885
14227	Greda	885
14228	Gvozd	885
14229	Hrastelnica	885
14230	Hrvatska Dubica	885
14231	Hrvatska Kostajnica	885
14232	Husain	885
14233	Ilova	885
14234	Kutina	885
14235	Lekenik	885
14236	Lipovljani	885
14237	Moshchenica	885
14238	Novska	885
14239	Odra Sisachka	885
14240	Osekovo	885
14241	Peshcenica	885
14242	Petrinja	885
14243	Popovacha	885
14244	Potok	885
14245	Rajic	885
14246	Repushnica	885
14247	Sisak	885
14248	Staro Prachno	885
14249	Sunja	885
14250	Topolovac	885
14251	Voloder	885
14252	Bashka Voda	887
14253	Bol	887
14254	Brela	887
14255	Brnaze	887
14256	Cista Velika	887
14257	Donji Prolozhac	887
14258	Donji Vinjani	887
14259	Duce	887
14260	Dugi Rat	887
14261	Dugopolje	887
14262	Gala	887
14263	Glavice	887
14264	Glavina Donja	887
14265	Gornji Vincjani	887
14266	Gradac	887
14267	Grubine	887
14268	Hrvace	887
14269	Hvar	887
14270	Imotski	887
14271	Jelsa	887
14272	Jesenice	887
14273	Kamen	887
14274	Kashtel Gambelovac	887
14275	Kashtel Gomilica	887
14276	Kashtel Lukshic	887
14277	Kashtel Novi	887
14278	Kashtel Shtafilic	887
14279	Kashtel Stari	887
14280	Kashtel Sucurac	887
14281	Katuni	887
14282	Klis	887
14283	Komizha	887
14284	Koshute	887
14285	Lovrec	887
14286	Makarska	887
14287	Marina	887
14288	Mastrinka	887
14289	Milna	887
14290	Mravince	887
14291	Neoric	887
14292	Obrovac Sinjski	887
14293	Okrug Gornji	887
14294	Omish	887
14295	Otok	887
14296	Podgora	887
14297	Podstrana	887
14298	Poljica	887
14299	Postira	887
14300	Postranje	887
14301	Potravlje	887
14302	Primorski Dolac	887
14303	Puchishca	887
14304	Ruda	887
14305	Runovic	887
14306	Seget Donji	887
14307	Seget Vranjica	887
14308	Selca	887
14309	Sinj	887
14310	Slatine	887
14311	Solin	887
14312	Split	887
14313	Srinjine	887
14314	Stari Grad	887
14315	Stobrech	887
14316	Supetar	887
14317	Trilj	887
14318	Trogir	887
14319	Tuchepi	887
14320	Turjaci	887
14321	Vinishce	887
14322	Vis	887
14323	Vranjic	887
14324	Vrgorac	887
14325	Vrlika	887
14326	Zagvozd	887
14327	Zhrnovnica	887
14328	Zmijavci	887
14329	Bedenec	888
14330	Beletinec	888
14331	Beretinec	888
14332	Breznica	888
14333	Chreshnjevo	888
14334	Donja Voca	888
14335	Donje Ladanje	888
14336	Gornje Ladanje	888
14337	Gornje Vratno	888
14338	Gornji Kneginec	888
14339	Gornji Kucan	888
14340	Hrashcica	888
14341	Hrastovsko	888
14342	Hrzhenica	888
14343	Ivanec	888
14344	Jalkovec	888
14345	Jalzhabet	888
14346	Jerovec	888
14347	Klenovnik	888
14348	Kljuch	888
14349	Kucan Marof	888
14350	Lepoglava	888
14351	Ljubeshcica	888
14352	Ludbreg	888
14353	Madzharevo	888
14354	Mali Bukovec	888
14355	Nedeljanec	888
14356	Nova Ves Petrijanec	888
14357	Novi Marof	888
14358	Petrijanec	888
14359	Podevchevo	888
14360	Presechno	888
14361	Remetinec	888
14362	Selnik	888
14363	Shemovec	888
14364	Srachinec	888
14365	Sveti Petar	888
14366	Svibovec Podravski	888
14367	Trnovec	888
14368	Turchin	888
14369	Tuzhno	888
14370	Varazhdin	888
14371	Varazhdin Breg	888
14372	Varazhdinske Toplice	888
14373	Vidovec	888
14374	Vinica	888
14375	Zavrshje Podbelsko	888
14376	Zharovnica	888
14377	Borova	889
14378	Busetina	889
14379	Cabuna	889
14380	Chachinci	889
14381	Gradina	889
14382	Korija	889
14383	Mikleush	889
14384	Milanovac	889
14385	Nova Bukovica	889
14386	Orahovica	889
14387	Pitomacha	889
14388	Podgorje	889
14389	Rezovac	889
14390	Shpishic Bukovica	889
14391	Slatina	889
14392	Suhopolje	889
14393	Turanovac	889
14394	Virovitica	889
14395	Vocin	889
14396	Zdenci	889
14397	Andrijashevci	890
14398	Antin	890
14399	Babina Greda	890
14400	Bapska	890
14401	Bobota	890
14402	Bogdanovci	890
14403	Borovo	890
14404	Boshnjaci	890
14405	Brshadin	890
14406	Ceric	890
14407	Cerna	890
14408	Drenovci	890
14409	Gradishte	890
14410	Gunja	890
14411	Ilacha	890
14412	Ilok	890
14413	Ivankovo	890
14414	Jarmina	890
14415	Komletinci	890
14416	Lipovac	890
14417	Lovas	890
14418	Markushica	890
14419	Mirkovci	890
14420	Negoslavci	890
14421	Nijemci	890
14422	Novi Jankovci	890
14423	Nushtar	890
14424	Otok	890
14425	Petrovci	890
14426	Posavski Podgajci	890
14427	Privlaka	890
14428	Rachinovci	890
14429	Rajevo Selo	890
14430	Retkovci	890
14431	Rokovci	890
14432	Sharengrad	890
14433	Shishkovci	890
14434	Shtitar	890
14435	Slakovci	890
14436	Soljani	890
14437	Sotin	890
14438	Stari Jankovci	890
14439	Stari Mikanovci	890
14440	Tordinci	890
14441	Tovarnik	890
14442	Trpinja	890
14443	Vinkovci	890
14444	Vodhinci	890
14445	Vrbanja	890
14446	Vukovar	890
14447	Zhupanja	890
14448	Benkovac	891
14449	Bibinje	891
14450	Biograd na Moru	891
14451	Debeljak	891
14452	Galovac	891
14453	Gorica	891
14454	Gornji Karin	891
14455	Grachac	891
14456	Jasenice	891
14457	Kali	891
14458	Krushevo	891
14459	Nin	891
14460	Obrovac	891
14461	Pag	891
14462	Pakoshtane	891
14463	Polacha	891
14464	Polichnik	891
14465	Poljica	891
14466	Posedarje	891
14467	Preko	891
14468	Pridraga	891
14469	Privlaka	891
14470	Razhanac	891
14471	Shkabrnja	891
14472	Slivnica	891
14473	Starigrad	891
14474	Sukoshan	891
14475	Sveti Filip i Jakov	891
14476	Turanj	891
14477	Ugljan	891
14478	Vir	891
14479	Vrsi	891
14480	Zadar	891
14481	Zemunik Donji	891
14482	Bestovje	892
14483	Bishkupec Zelinski	892
14484	Brckovljani	892
14485	Brdovec	892
14486	Bregana	892
14487	Brezje	892
14488	Bushevec	892
14489	Celine	892
14490	Domaslovec	892
14491	Donja Bistra	892
14492	Donja Kupchina	892
14493	Donja Lomnica	892
14494	Donja Zdenchina	892
14495	Donji Desinec	892
14496	Donji Stupnik	892
14497	Dubrava	892
14498	Dugo Selo	892
14499	Gornja Bistra	892
14500	Gornji Laduch	892
14501	Gornji Stupnik	892
14502	Grachec	892
14503	Gradici	892
14504	Ivan Bistranski	892
14505	Ivanic-Grad	892
14506	Jablanovec	892
14507	Jakovlje	892
14508	Jastrebarsko	892
14509	Kerestinec	892
14510	Klincha Sela	892
14511	Kloshtar Ivanic	892
14512	Kozinshchak	892
14513	Krizh	892
14514	Kuche	892
14515	Kupinec	892
14516	Lonjica	892
14517	Luka	892
14518	Lukarishce	892
14519	Lukavec	892
14520	Lupoglav	892
14521	Michevec	892
14522	Mraclin	892
14523	Novaki	892
14524	Novo Chiche	892
14525	Novoselec	892
14526	Oborovo Bistranski	892
14527	Oreshje	892
14528	Pojatno	892
14529	Poljanica Bistranska	892
14530	Prigorje Brdovechko	892
14531	Rakitje	892
14532	Rakov Potok	892
14533	Rude	892
14534	Samobor	892
14535	Strmec	892
14536	Sveta Nedelja	892
14537	Sveti Ivan Zelina	892
14538	Turopolje	892
14539	Velika Gorica	892
14540	Velika Mlaka	892
14541	Velika Ostrna	892
14542	Vrbovec	892
14543	Vukovina	892
14544	Zapreshic	892
14545	Zdenci Brdovechki	892
14546	Camaguey	893
14547	Caney	893
14548	Carlos Manuel de Cespedes	893
14549	Esmeralda	893
14550	Florida	893
14551	Guaimaro	893
14552	Minas	893
14553	Nuevitas	893
14554	Santa Cruz del Sur	893
14555	Sibanicu	893
14556	Vertientes	893
14557	Cienfuegos	895
14558	Cruces	895
14559	Cumanayagua	895
14560	Palmira	895
14561	Rodas	895
14562	Bayamo	897
14563	Campechuela	897
14564	Guisa	897
14565	Jiguani	897
14566	Manzanillo	897
14567	Media Luna	897
14568	Niquero	897
14569	Pilon	897
14570	Rio Cauto	897
14571	Yara	897
14572	Baracoa	898
14573	Guantanamo	898
14574	Yateras	898
14575	Havana	899
14576	Antilla	900
14577	Baguanos	900
14578	Banes	900
14579	Cacocum	900
14580	Cauto Cristo	900
14581	Cueto	900
14582	Gibara	900
14583	Holguin	900
14584	Jobabo	900
14585	Moa	900
14586	Sagua de Tanamo	900
14587	Abreus	904
14588	Agramonte	904
14589	Aguacate	904
14590	Aguada de Pasajeros	904
14591	Alacranes	904
14592	Bolondron	904
14593	Calimete	904
14594	Cardenas	904
14595	Carlos Rojas	904
14596	Colon	904
14597	Corralillo	904
14598	Jaguey Grande	904
14599	Jovellanos	904
14600	Juan Gualberto Gomez	904
14601	Los Arabos	904
14602	Manguito	904
14603	Marti	904
14604	Matanzas	904
14605	Maximo Gomez	904
14606	Pedro Betancourt	904
14607	Perico	904
14608	Union de Reyes	904
14609	Varadero	904
14610	Limassol	910
14611	Paphos	912
14612	Frycovice	915
14613	Bechyne	917
14614	Blatna	917
14615	Cheske Budejovice	917
14616	Chesky Krumlov	917
14617	Dachice	917
14618	Jindrichuv Hradec	917
14619	Kaplice	917
14620	Milevsko	917
14621	Pisek	917
14622	Prachatice	917
14623	Protivin	917
14624	Sezimovo Usti	917
14625	Sobeslav	917
14626	Strakonice	917
14627	Tabor	917
14628	Trebon	917
14629	Tyn nad Vltavou	917
14630	Veseli nad Luzhnici	917
14631	Vimperk	917
14632	Vodnany	917
14633	Adamov	918
14634	Blansko	918
14635	Boskovice	918
14636	Breclav	918
14637	Brno	918
14638	Buchovice	918
14639	Dubnany	918
14640	Hodonin	918
14641	Hrusky	918
14642	Hustopeche	918
14643	Ivanchice	918
14644	Kurim	918
14645	Kyjov	918
14646	Letovice	918
14647	Mikulov	918
14648	Moravsky Krumlov	918
14649	Namesht nad Oslavou	918
14650	Rosice	918
14651	Shlapanice	918
14652	Slavkov u Brna	918
14653	Tishnov	918
14654	Vyshkov	918
14655	Znojmo	918
14656	Ash	919
14657	Bozicany	919
14658	Cheb	919
14659	Chodov	919
14660	Frantishkovy Lazne	919
14661	Horni Slavkov	919
14662	Karlovy Vary	919
14663	Kraslice	919
14664	Kynshperk nad Ohri	919
14665	Marianske Lazne	919
14666	Nejdek	919
14667	Ostrov	919
14668	Sokolov	919
14669	Klecany	920
14670	Broumov	921
14671	Cherveny Kostelec	921
14672	Cheska Skalice	921
14673	Chlumec nad Cidlinou	921
14674	Dobrushka	921
14675	Dvur Kralove	921
14676	Habartov	921
14677	Holice	921
14678	Horice	921
14679	Hostinne	921
14680	Hradec Kralove	921
14681	Hronov	921
14682	Jaromer	921
14683	Jichin	921
14684	Kostelec nad Orlici	921
14685	Nachod	921
14686	Nova Paka	921
14687	Nove Mesto nad Metuji	921
14688	Novy Bydzhov	921
14689	Rychnov nad Knezhnou	921
14690	Trebechovice pod Orebem	921
14691	Trutnov	921
14692	Tynishte nad Orlici	921
14693	Upice	921
14694	Vrchlabi	921
14695	Ceska Lipa	922
14696	Cheska Kamenice	922
14697	Cheska Lipa	922
14698	Chrastava	922
14699	Doksy	922
14700	Frydlant	922
14701	Hradek	922
14702	Jablonec	922
14703	Jilemnice	922
14704	Liberec	922
14705	Lomnice nad Popelkou	922
14706	Mimon	922
14707	Novy Bor	922
14708	Semily	922
14709	Tanvald	922
14710	Turnov	922
14711	Zhelezny Brod	922
14712	Lipov	923
14713	Bilovec	924
14714	Bohumin	924
14715	Bruntal	924
14716	Chesky Teshin	924
14717	Frenshtat	924
14718	Frydek-Mistek	924
14719	Frydlant nad Ostravici	924
14720	Fulnek	924
14721	Havirov	924
14722	Hluchin	924
14723	Hradec nad Moravice	924
14724	Jablunkov	924
14725	Karvina	924
14726	Koprivnice	924
14727	Kravare	924
14728	Krnov	924
14729	Novy Jichin	924
14730	Odry	924
14731	Opava	924
14732	Orlova	924
14733	Ostrava	924
14734	Petrvald	924
14735	Pribor	924
14736	Rychvald	924
14737	Rymarov	924
14738	Shenov	924
14739	Studenka	924
14740	Trinec	924
14741	Vitkov	924
14742	Vratimov	924
14743	Vrbno pod Pradedem	924
14744	Hranice	925
14745	Jesenik	925
14746	Kojetin	925
14747	Lipnik nad Becvou	925
14748	Litovel	925
14749	Mohelnice	925
14750	Olomouc	925
14751	Prerov	925
14752	Prostejov	925
14753	Shternberk	925
14754	Shumperk	925
14755	Unichov	925
14756	Zabreh	925
14757	Hranice	926
14758	Jesenik	926
14759	Kojetin	926
14760	Lipnik nad Becvou	926
14761	Litovel	926
14762	Mohelnice	926
14763	Olomouc	926
14764	Prerov	926
14765	Prostejov	926
14766	Shternberk	926
14767	Shumperk	926
14768	Unichov	926
14769	Zabreh	926
14770	Cheska Trebova	927
14771	Chocen	927
14772	Chrudim	927
14773	Chvaletice	927
14774	Hermanuv Mestec	927
14775	Hlinsko	927
14776	Lanshkroun	927
14777	Letohrad	927
14778	Litomyshl	927
14779	Moravska Trebova	927
14780	Pardubice	927
14781	Polichka	927
14782	Policka	927
14783	Prelouch	927
14784	Skutech	927
14785	Svitavy	927
14786	Usti nad Orlici	927
14787	Vysoke Myto	927
14788	Zhamberk	927
14789	Dobrany	928
14790	Domazhlice	928
14791	Horazhdovice	928
14792	Horshovky Tyn	928
14793	Kdyne	928
14794	Klatovy	928
14795	Nyrany	928
14796	Nyrsko	928
14797	Plana	928
14798	Plzen	928
14799	Preshtice	928
14800	Radnice	928
14801	Rokycany	928
14802	Stribro	928
14803	Sushice	928
14804	Tachov	928
14805	Prague	929
14806	Praha	929
14807	Rajhrad	930
14808	Smirice	931
14809	Benatky nad Jizerou	934
14810	Beneshov	934
14811	Beroun	934
14812	Brandys nad Labem-Stara Bolesl	934
14813	Chaslav	934
14814	Chavaletice	934
14815	Chelakovice	934
14816	Chesky Brod	934
14817	Dobrish	934
14818	Horovice	934
14819	Kladno	934
14820	Kolin	934
14821	Kralupy nad Vltavou	934
14822	Kutna Hora	934
14823	Lysa nad Labem	934
14824	Melnik	934
14825	Mlada Boleslav	934
14826	Mnichovo Hradishte	934
14827	Neratovice	934
14828	Nove Strasheci	934
14829	Nymburk	934
14830	Podebrady	934
14831	Pribram	934
14832	Rakovnik	934
14833	Richany	934
14834	Rousinov	934
14835	Roztoky	934
14836	Sedlcany	934
14837	Slany	934
14838	Stochov	934
14839	Vlashim	934
14840	Zruch nad Sazavou	934
14841	Unicov	935
14842	Bilina	936
14843	Chomutov	936
14844	Dechin	936
14845	Dubi	936
14846	Duchcov	936
14847	Jilove	936
14848	Jirkov	936
14849	Kadan	936
14850	Klasterec nad Ohri	936
14851	Krupka	936
14852	Litomerice	936
14853	Litvinov	936
14854	Louny	936
14855	Lovosice	936
14856	Mezibori	936
14857	Most	936
14858	Osek	936
14859	Podborany	936
14860	Roudnice	936
14861	Rumburk	936
14862	Shluknov	936
14863	Shteti	936
14864	Teplice	936
14865	Usti	936
14866	Varnsdorf	936
14867	Zatec	936
14868	Valletta	937
14869	Velesin	938
14870	Bystrice nad Pernshtejnem	939
14871	Chotebor	939
14872	Havlichkuv Brod	939
14873	Humpolec	939
14874	Jihlava	939
14875	Ledech	939
14876	Moravske Budejovice	939
14877	Nove Mesto na Morave	939
14878	Okrisky	939
14879	Pacov	939
14880	Pelhrimov	939
14881	Polna	939
14882	Svetla nad Sazavou	939
14883	Telch	939
14884	Trebich	939
14885	Tresht	939
14886	Velke Mezirichi	939
14887	Zhdar	939
14888	Brumov	940
14889	Bystrice pod Hostynem	940
14890	Chropyne	940
14891	Holeshov	940
14892	Hulin	940
14893	Kromerizh	940
14894	Kunovice	940
14895	Napajedla	940
14896	Otrokovice	940
14897	Rozhnov	940
14898	Roznov pod Radhostem	940
14899	Slavicin	940
14900	Slusovice	940
14901	Stare Mesto	940
14902	Strazhnice	940
14903	Uherske Hradishte	940
14904	Uhersky Brod	940
14905	Valashske Klobouky	940
14906	Valashske Mezirichi	940
14907	Veseli nad Moravou	940
14908	Vsetin	940
14909	Zborovice	940
14910	Zlin	940
14911	Aarhus	941
14912	Allingabro	941
14913	Arhus	941
14914	Assentoft	941
14915	Auning	941
14916	Beder	941
14917	Brabrand	941
14918	Ebeltoft	941
14919	Framlev	941
14920	Galten	941
14921	Grenaa	941
14922	Hadsten	941
14923	Hammel	941
14924	Hinnerup	941
14925	Hjortshoj	941
14926	Horning	941
14927	Hornslet	941
14928	Kolt	941
14929	Langa	941
14930	Logten	941
14931	Lystrup	941
14932	Malling	941
14933	Mariager	941
14934	Marslet	941
14935	Odder	941
14936	Randers	941
14937	Risskov	941
14938	Ronde	941
14939	Ry	941
14940	Ryomgard	941
14941	Sabro	941
14942	Silkeborg	941
14943	Skanderborg	941
14944	Skovby	941
14945	Soften	941
14946	Solbjerg	941
14947	Spentrup	941
14948	Stavtrup	941
14949	Stilling	941
14950	Svejbak	941
14951	Tranbjerg	941
14952	Trige	941
14953	Virklund	941
14954	Aakirkeby	942
14955	Allinge-Sandvig	942
14956	Nexo	942
14957	Ronne	942
14958	Allerod	943
14959	Birkerod	943
14960	Blovstrod	943
14961	Espergarde	943
14962	Farum	943
14963	Fredensborg	943
14964	Frederikssund	943
14965	Frederiksvark	943
14966	Ganlose	943
14967	Gilleleje	943
14968	Grasted	943
14969	Hellebak	943
14970	Helsinge	943
14971	Helsingor	943
14972	Hillerod	943
14973	Hornbak	943
14974	Horsholm	943
14975	Humlebak	943
14976	Hundested	943
14977	Jagerspris	943
14978	Kvistgaard	943
14979	Lillerod	943
14980	Liseleje	943
14981	Lynge	943
14982	Niva	943
14983	Nodebo	943
14984	Olstykke	943
14985	Skibby	943
14986	Slangerup	943
14987	Stavnsholt	943
14988	Stenlose	943
14989	Valby	943
14990	Vekso	943
14991	Aarup	944
14992	Arslev	944
14993	Assens	944
14994	Bellinge	944
14995	Blommenslyst	944
14996	Bogense	944
14997	Brenderup	944
14998	Broby	944
14999	Bullerup	944
15000	Ejby	944
15001	Faaborg	944
15002	Glamsbjerg	944
15003	Haarby	944
15004	Hojby	944
15005	Kerteminde	944
15006	Langeskov	944
15007	Marstal	944
15008	Middelfart	944
15009	Munkebo	944
15010	Neder Holluf	944
15011	Norre Aaby	944
15012	Nyborg	944
15013	Odense	944
15014	Otterup	944
15015	Ringe	944
15016	Rudkobing	944
15017	Sankt Klemens	944
15018	Seden	944
15019	Sonderso	944
15020	Stige	944
15021	Strib	944
15022	Svendborg	944
15023	Thuro	944
15024	Tommerup	944
15025	Ullerslev	944
15026	Vindeby	944
15027	Vissenbjerg	944
15028	Ballerup	945
15029	Brondby	945
15030	Stenlose	945
15031	Vallensbaek	945
15032	Dragor	946
15033	Flong	946
15034	Gentofte	946
15035	Glostrup	946
15036	Herlev	946
15037	Hvidovre	946
15038	Ishoj	946
15039	Kastrup	946
15040	Lyngby	946
15041	Malov	946
15042	Smorumnedre	946
15043	Taastrup	946
15044	Trorod	946
15045	Vanlose	946
15046	Varlose	946
15047	Aabybro	949
15048	Aalborg	949
15049	Aars	949
15050	Arden	949
15051	Bindslev	949
15052	Bronderslev	949
15053	Brovst	949
15054	Dronninglund	949
15055	Farso	949
15056	Fjerritslev	949
15057	Frederikshavn	949
15058	Frejlev	949
15059	Gistrup	949
15060	Gorlose	949
15061	Hadsund	949
15062	Hals	949
15063	Hirtshals	949
15064	Hjallerup	949
15065	Hjorring	949
15066	Hobro	949
15067	Kas	949
15068	Klarup	949
15069	Logstor	949
15070	Nibe	949
15071	Norresundby	949
15072	NÃƒÂƒÃ‚Â¸rresundby	949
15073	Pandrup	949
15074	Saby	949
15075	Sindal	949
15076	Skagen	949
15077	Skorping	949
15078	Storvorde	949
15079	Stovring	949
15080	Strandby	949
15081	Sulsted	949
15082	Svenstrup	949
15083	Tars	949
15084	Tranekaer	949
15085	Vadum	949
15086	Vestbjerg	949
15087	Vester Hassing	949
15088	Vodskov	949
15089	Vra	949
15090	Ansager	950
15091	Billund	950
15092	Bramming	950
15093	Brorup	950
15094	Esbjerg	950
15095	Grindsted	950
15096	Holsted	950
15097	Nordby	950
15098	Oksbol	950
15099	Olgod	950
15100	Ribe	950
15101	Tjareborg	950
15102	Varde	950
15103	Vejen	950
15104	Vorbasse	950
15105	Aulum	951
15106	Bording	951
15107	Brande	951
15108	Gjellerup Kirkeby	951
15109	Hammerum	951
15110	Harboore	951
15111	Herning	951
15112	Holstebro	951
15113	Hvide Sande	951
15114	Ikast	951
15115	Kibak	951
15116	Lemvig	951
15117	Lind	951
15118	Ringkobing	951
15119	Skaerbaek	951
15120	Skjern	951
15121	Snejbjerg	951
15122	Struer	951
15123	Sunds	951
15124	Tarm	951
15125	Thyboron	951
15126	Ulfborg	951
15127	Videbak	951
15128	Vildbjerg	951
15129	Vinderup	951
15130	Roervig	952
15131	Bjaverskov	953
15132	Borup	953
15133	Ejby	953
15134	Greve Strand	953
15135	Gundsomagle	953
15136	Harlev	953
15137	Havdrup	953
15138	Hvalso	953
15139	Jyllinge	953
15140	Koge	953
15141	Lejre	953
15142	Osted	953
15143	Roskilde	953
15144	Solrod	953
15145	Stroby Egede	953
15146	Svogerslev	953
15147	Tune	953
15148	Viby	953
15149	Vindinge	953
15150	Glyngore	954
15151	Karise	955
15152	Naestved	955
15153	Soeborg	956
15154	Aabenraa	957
15155	Aarsleve	957
15156	Augustenborg	957
15157	Broager	957
15158	Christiansfeld	957
15159	Dybbol	957
15160	Gram	957
15161	Grasten	957
15162	Guderup	957
15163	Haderslev	957
15164	Horuphav	957
15165	Krusa	957
15166	Logumkloster	957
15167	Lojt Kirkeby	957
15168	Nordborg	957
15169	Padborg	957
15170	Rodding	957
15171	Rodekro	957
15172	Skarbak	957
15173	Sonderborg	957
15174	Starup	957
15175	Tinglev	957
15176	Toftlund	957
15177	Tonder	957
15178	Vojens	957
15179	Fakse	958
15180	Fakse Ladeplads	958
15181	Fensmark	958
15182	Holeby	958
15183	Maribo	958
15184	Nakskov	958
15185	Nastved	958
15186	Neder Vindinge	958
15187	Norre Alslev	958
15188	Nykobing	958
15189	Nyrad	958
15190	Orslev	958
15191	Prasto	958
15192	Rodby	958
15193	Rodbyhavn	958
15194	Ronnede	958
15195	Sakskobing	958
15196	Stege	958
15197	Store Heddinge	958
15198	Stubbekobing	958
15199	Sundby	958
15200	Vordingborg	958
15201	Bylderup-Bov	959
15202	Fovling	959
15203	Toelloese	960
15204	Borkop	961
15205	Bradstrup	961
15206	Brejning	961
15207	Egtved	961
15208	Fredericia	961
15209	Give	961
15210	Hedensted	961
15211	Horsens	961
15212	Jelling	961
15213	Juelsminde	961
15214	Kolding	961
15215	Lunderskov	961
15216	Snoghoj	961
15217	Sonder Bjert	961
15218	Taulov	961
15219	Torring	961
15220	Vamdrup	961
15221	Vejle	961
15222	Asnas	962
15223	Dianalund	962
15224	Forlev	962
15225	Frederiksberg	962
15226	Fuglebjerg	962
15227	Gorlev	962
15228	Haslev	962
15229	Holbaek	962
15230	Hong	962
15231	Horve	962
15232	Jyderup	962
15233	Kalundborg	962
15234	Korsor	962
15235	Nykobing	962
15236	Ringsted	962
15237	Skalskor	962
15238	Slagelse	962
15239	Soro	962
15240	Svebolle	962
15241	Svinninge	962
15242	Tollose	962
15243	Vipperod	962
15244	Aalestrup	963
15245	Bjerringbro	963
15246	Hanstholm	963
15247	Hojslev	963
15248	Hurup	963
15249	Karup	963
15250	Kjellerup	963
15251	Nykobing	963
15252	Skive	963
15253	Stoholm	963
15254	Thisted	963
15255	Ulstrup	963
15256	Viborg	963
15257	Dikhil	965
15258	Jibuti	966
15259	Tajurah	967
15260	Ubuk	968
15261	Azua	979
15262	Sabana Yegua	979
15263	Neyba	980
15264	Tamayo	980
15265	Barahona	981
15266	Cabral	981
15267	El Penon	981
15268	Dajabon	982
15269	Las Guaranas	984
15270	Pimentel	984
15271	San Francisco de Macoris	984
15272	Moca	987
15273	Duverge	989
15274	Jimani	989
15275	Pedernales	997
15276	Bani	998
15277	Ocoa	998
15278	Salcedo	1000
15279	Samana	1001
15280	Sanchez	1001
15281	Santiago	1006
15282	Tamboril	1006
15283	Villa Bisono	1006
15284	Santiago	1007
15285	Tamboril	1007
15286	Villa Bisono	1007
15287	Esperanza	1008
15288	Mao	1008
15289	Aileu	1009
15290	Ainaro	1010
15291	Pante Macassar	1011
15292	Baucau	1012
15293	Auba	1013
15294	Lolotoi	1013
15295	Maliana	1013
15296	Dare	1015
15297	Dili	1015
15298	Metinaro	1015
15299	Ermera	1016
15300	Lautem	1017
15301	Los Palos	1017
15302	Bazartete	1018
15303	Liquica	1018
15304	Manatuto	1019
15305	Same	1020
15306	Viqueque	1021
15307	Cuenca	1022
15308	Gualaceo	1022
15309	Guaranda	1023
15310	San Miguel	1023
15311	Azogues	1024
15312	Canar	1024
15313	La Troncal	1024
15314	El Angel	1025
15315	San Gabriel	1025
15316	Tulcan	1025
15317	Alausi	1026
15318	Guano	1026
15319	Riobamba	1026
15320	La Mana	1027
15321	Latacunga	1027
15322	Pujili	1027
15323	San Miguel	1027
15324	Saquisili	1027
15325	Esmeraldas	1029
15326	Muisne	1029
15327	Rosa Zarate	1029
15328	San Lorenzo	1029
15329	Valdez	1029
15330	Puerto Ayora	1030
15331	Puerto Baquerizo Moreno	1030
15332	San Cristobal	1030
15333	Alfredo Baquerizo Moreno	1031
15334	Balao	1031
15335	Balzar	1031
15336	Colimes	1031
15337	Coronel Mariduena	1031
15338	Daule	1031
15339	El Salitre	1031
15340	El Triunfo	1031
15341	Eloy Alfaro	1031
15342	Guayaquil	1031
15343	La Libertad	1031
15344	Lomas de Sargentillo	1031
15345	Mapasingue	1031
15346	Milagro	1031
15347	Naranjal	1031
15348	Naranjito	1031
15349	Palestina	1031
15350	Pedro Carbo	1031
15351	Playas	1031
15352	Salinas	1031
15353	Samborondon	1031
15354	Santa Elena	1031
15355	Santa Lucia	1031
15356	Velasco Ibarra	1031
15357	Yaguachi	1031
15358	Atuntaqui	1032
15359	Cotacachi	1032
15360	Ibarra	1032
15361	Otavalo	1032
15362	Pimampiro	1032
15363	Alamor	1033
15364	Cariamanga	1033
15365	Catacocha	1033
15366	Catamayo	1033
15367	Celica	1033
15368	Loja	1033
15369	Macara	1033
15370	Bahia de Caraquez	1035
15371	Calceta	1035
15372	Chone	1035
15373	El Carmen	1035
15374	Jipijapa	1035
15375	Junin	1035
15376	Manta	1035
15377	Montecristi	1035
15378	Pajan	1035
15379	Pedernales	1035
15380	Portoviejo	1035
15381	Rocafuerte	1035
15382	Santa Ana	1035
15383	Sucre	1035
15384	Tosagua	1035
15385	Archidona	1037
15386	Tena	1037
15387	Orellana	1038
15388	Puyo	1039
15389	Cayambe	1040
15390	Machachi	1040
15391	Quito	1040
15392	Sangolqui	1040
15393	Santo Domingo	1040
15394	Nueva Loja	1041
15395	Shushufindi	1041
15396	Ambato	1042
15397	Banos	1042
15398	Pelileo	1042
15399	Pillaro	1042
15400	Aswan	1044
15401	Daraw	1044
15402	Kawm Umbu	1044
15403	an-Nasir	1044
15404	Abnub	1045
15405	Abu Tij	1045
15406	Asyut	1045
15407	Bani Muhammadiyat	1045
15408	Dayrut	1045
15409	Dayrut-ash-Sharif	1045
15410	Manfalut	1045
15411	Musha	1045
15412	Sahil Salim	1045
15413	Sanabu	1045
15414	Umm-al-Qusur	1045
15415	al-Badari	1045
15416	al-Qusiyah	1045
15417	an-Nukhaylah	1045
15418	6th of October City	1048
15419	Ataba	1048
15420	Cairo	1048
15421	Nasr	1048
15422	Nasr City	1048
15423	Obour City	1048
15424	Izbat-al-Burj	1049
15425	Damietta	1049
15426	Dumyat	1049
15427	El-Zarka	1049
15428	Faraskur	1049
15429	Kafr Sad	1049
15430	Kafr-al-Battikh	1049
15431	az-Zarqa	1049
15432	Biyala	1050
15433	Disuq	1050
15434	Fuwah	1050
15435	Kafr-al-Jaraidah	1050
15436	Kafr-ash-Shaykh	1050
15437	Mutubis	1050
15438	Qallin	1050
15439	Sidi Salim	1050
15440	al-Burj	1050
15441	al-Burullus	1050
15442	al-Haddadi	1050
15443	al-Hamul	1050
15444	Marsa Matruh	1051
15445	Nasr	1051
15446	Sidi Barrani	1051
15447	Zawiyat Shammas	1051
15448	ad-Daba	1051
15449	Armant	1057
15450	Asfun-al-Matainah	1057
15451	Dandarah	1057
15452	Dishna	1057
15453	Farshut	1057
15454	Hijazah	1057
15455	Hiw	1057
15456	Idfu	1057
15457	Isna	1057
15458	Kiman-al-Matainah	1057
15459	Naj Hammadi	1057
15460	Naqadah	1057
15461	Qift	1057
15462	Qina	1057
15463	Qus	1057
15464	ad-Dabbiyah	1057
15465	ad-Dayr	1057
15466	al-Ballas	1057
15467	al-Karnak	1057
15468	al-Waqf	1057
15469	ar-Radisiyat-al-Bahriyah	1057
15470	Akhmim	1058
15471	Awlad Tawq Sharq	1058
15472	Dar-as-Salam	1058
15473	Jirja	1058
15474	Juhaynah	1058
15475	Sawhaj	1058
15476	Tahta	1058
15477	Tima	1058
15478	al-Balyana	1058
15479	al-Manshah	1058
15480	al-Maragah	1058
15481	Aja	1061
15482	Bahut	1061
15483	Bilqas	1061
15484	Dikirnis	1061
15485	Minyat-an-Nasr	1061
15486	Mit Gamr	1061
15487	Shirbin	1061
15488	Talkha	1061
15489	al-Jamaliyah	1061
15490	al-Masarah	1061
15491	al-Mansurah	1061
15492	al-Manzilah	1061
15493	al-Matariyah	1061
15494	as-Sinbillawayn	1061
15495	Ras Gharib	1062
15496	Safaja	1062
15497	al-Ghardaqah	1062
15498	al-Qusayr	1062
15499	Abu Hummus	1063
15500	Abu al-Matamir	1063
15501	Buturis	1063
15502	Damanhur	1063
15503	Edfina	1063
15504	Hawsh Isa	1063
15505	Idku	1063
15506	Ityay-al-Barud	1063
15507	Kafr Salim	1063
15508	Kafr-ad-Dawwar	1063
15509	Kawm Hamada	1063
15510	Nubaria	1063
15511	Rashid	1063
15512	Shubra Khit	1063
15513	Zawiyat Sidi Gazi	1063
15514	ad-Dilinjat	1063
15515	al-Kawm-al-Akhdar	1063
15516	al-Mahmudiyah	1063
15517	ar-Rahmaniyah	1063
15518	Fidimin	1064
15519	Ibshaway	1064
15520	Itsa	1064
15521	Qasr Qarun	1064
15522	Sanhur	1064
15523	Sinnuris	1064
15524	Tamiyah	1064
15525	al-Fayyum	1064
15526	Abyar	1065
15527	Basyun	1065
15528	Kafr-az-Zayyat	1065
15529	Mahallat Marhum	1065
15530	Nisf Thani Bashbish	1065
15531	Qutur	1065
15532	Samannud	1065
15533	Tanta	1065
15534	Zifta	1065
15535	ad-Daljamun	1065
15536	al-Mahallah al-Kubra	1065
15537	as-Santah	1065
15538	Agamy	1066
15539	al-Iskandariyah	1066
15540	al-Maks	1066
15541	Faid	1067
15542	Sarabiyum	1067
15543	al-Ismailiyah	1067
15544	Atfih	1068
15545	Awsim	1068
15546	Giza	1068
15547	Madinat Sittah Uktubar	1068
15548	Nahya	1068
15549	Saqqarah	1068
15550	al-Ayyat	1068
15551	al-Badrashayn	1068
15552	al-Hawamidiyah	1068
15553	al-Jizah	1068
15554	al-Mansuriyah	1068
15555	al-Wahat-al-Bahriyah	1068
15556	as-Saff	1068
15557	Ashmun	1069
15558	Birkat-as-Sab	1069
15559	Milij	1069
15560	Minuf	1069
15561	Quwaysina	1069
15562	Shibin-al-Kawm	1069
15563	Sirs-al-Layyanah	1069
15564	Tala	1069
15565	al-Bajur	1069
15566	al-Batanun	1069
15567	ash-Shuhada	1069
15568	Abu Qurqas	1070
15569	Bani Mazar	1070
15570	Dayr Mawas	1070
15571	Magagah	1070
15572	Mallawi	1070
15573	Matay	1070
15574	Samalut	1070
15575	Tallah	1070
15576	Tandah	1070
15577	al-Anayim	1070
15578	al-Fikriyah	1070
15579	al-Minya	1070
15580	ar-Rawdah	1070
15581	Badr City	1071
15582	Heliopolis	1071
15583	al-Qahira	1071
15584	Abu Zabal	1072
15585	Banha	1072
15586	Qalyub	1072
15587	Shubra al-Khaymah	1072
15588	Sibin-al-Qanatir	1072
15589	Tukh	1072
15590	al-Khankah	1072
15591	al-Qanatir-al-Khayriyah	1072
15592	al-Uqsur	1073
15593	as-Suways	1075
15594	Abu Hammad	1076
15595	Abu Kabir	1076
15596	Bilbays	1076
15597	Diyarb Najm	1076
15598	Faqus	1076
15599	Hihya	1076
15600	Kafr Saqr	1076
15601	Mashtul-as-Suq	1076
15602	Minyat-al-Qamh	1076
15603	al-Ashir mir-Ramadan	1076
15604	al-Husayniyah	1076
15605	al-Ibrahimiyah	1076
15606	al-Qanayat	1076
15607	al-Qassasin	1076
15608	al-Qurayn	1076
15609	as-Salihiyah	1076
15610	at-Tall-al-Kabir	1076
15611	az-Zaqaziq	1076
15612	Ahuachapan	1077
15613	Atiquizaya	1077
15614	Concepcion de Ataco	1077
15615	Guaymango	1077
15616	Jujutla	1077
15617	San Francisco Menendez	1077
15618	Tacuba	1077
15619	Ilobasco	1078
15620	Sensuntepeque	1078
15621	Victoria	1078
15622	Chalatenango	1079
15623	La Palma	1079
15624	Nueva Concepcion	1079
15625	San Francisco Morazan	1079
15626	Cojutepeque	1080
15627	San Pedro Perulapan	1080
15628	Suchitoto	1080
15629	Tecoluca	1080
15630	Tenancingo	1080
15631	Cacaopera	1084
15632	Corinto	1084
15633	Gotera	1084
15634	Guatajiagua	1084
15635	Jocoro	1084
15636	Sociedad	1084
15637	Acajutla	1089
15638	Armenia	1089
15639	Izalco	1089
15640	Juayua	1089
15641	Nahuizalco	1089
15642	San Antonio del Monte	1089
15643	San Julian	1089
15644	Sonsonate	1089
15645	Sonzacate	1089
15646	Berlin	1090
15647	Concepcion Batres	1090
15648	Estanzuelas	1090
15649	Jiquilisco	1090
15650	Jucuapa	1090
15651	Jucuaran	1090
15652	Ozatlan	1090
15653	Puerto El Triunfo	1090
15654	San Agustin	1090
15655	Santa Elena	1090
15656	Santiago de Maria	1090
15657	Usulutan	1090
15658	Pale	1091
15659	Ebebiyin	1095
15660	Mikomeseng	1095
15661	Bata	1096
15662	Mbini	1096
15663	Aconibe	1097
15664	Anisoc	1097
15665	Mongomo	1097
15666	Nsok	1097
15667	Keren	1098
15668	Addi Kwala	1099
15669	Addi Ugri	1099
15670	Asseb	1100
15671	Beylul	1100
15672	Edd	1100
15673	Mersa Fatma	1100
15674	Akordat	1101
15675	Barentu	1101
15676	Teseney	1101
15677	Asmara	1102
15678	Ginda	1102
15679	Himbirti	1102
15680	Nefasit	1102
15681	Addi Keyih	1103
15682	Dekemhare	1103
15683	Mitsiwa	1103
15684	Senafe	1103
15685	Aasmae	1104
15686	Aaviku	1104
15687	Aegviidu	1104
15688	Aigrumae	1104
15689	Aila	1104
15690	Alavere	1104
15691	Alliku	1104
15692	Amari	1104
15693	Anija	1104
15694	Ardu	1104
15695	Arukula	1104
15696	Aruvalla	1104
15697	Assaku	1104
15698	Ellamaa	1104
15699	Haabneeme	1104
15700	Habaja	1104
15701	Haiba	1104
15702	Haljava	1104
15703	Hara	1104
15704	Harju-Risti	1104
15705	Harku	1104
15706	Harkujarve	1104
15707	Harma	1104
15708	Huuru	1104
15709	Ilmandu	1104
15710	Iru	1104
15711	Jagala	1104
15712	Jalgimae	1104
15713	Jarsi	1104
15714	Jarvekula	1104
15715	Jogisoo	1104
15716	Juri	1104
15717	Kaasiku	1104
15718	Kaberneeme	1104
15719	Kahala	1104
15720	Kalesi	1104
15721	Kallavere	1104
15722	Karjakula	1104
15723	Karla	1104
15724	Kasepere	1104
15725	Kasispea	1104
15726	Kehra	1104
15727	Keila	1104
15728	Keila-Joa	1104
15729	Kelvingi	1104
15730	Kiia	1104
15731	Kiili	1104
15732	Kiisa	1104
15733	Kiiu	1104
15734	Klooga	1104
15735	Kloogaranna	1104
15736	Kohatu	1104
15737	Kolga	1104
15738	Kolga-Aabla	1104
15739	Kolgakula	1104
15740	Konnu	1104
15741	Kose	1104
15742	Kose-Uuemoisa	1104
15743	Kostivere	1104
15744	Krei	1104
15745	Kuivajoe	1104
15746	Kumna	1104
15747	Kurtna	1104
15748	Kuusalu	1104
15749	Laabi	1104
15750	Laagri	1104
15751	Lagedi	1104
15752	Laitse	1104
15753	Laulasmaa	1104
15754	Lehetu	1104
15755	Lehola	1104
15756	Lehtmetsa	1104
15757	Leppneeme	1104
15758	Liikva	1104
15759	Lilli	1104
15760	Lohusalu	1104
15761	Loksa	1104
15762	Lokuti	1104
15763	Loo	1104
15764	Lubja	1104
15765	Luige	1104
15766	Maardu	1104
15767	Maidla	1104
15768	Manniku	1104
15769	Metsakasti	1104
15770	Metsanurme	1104
15771	Miiduranna	1104
15772	Munalaskme	1104
15773	Muraste	1104
15774	Muuga	1104
15775	Nabala	1104
15776	Neeme	1104
15777	Ohtu	1104
15778	Ojasoo	1104
15779	Oru	1104
15780	Padise	1104
15781	Pae	1104
15782	Paekna	1104
15783	Pajupea	1104
15784	Paldiski	1104
15785	Palvere	1104
15786	Parispea	1104
15787	Patika	1104
15788	Paunkula	1104
15789	Peetri	1104
15790	Peningi	1104
15791	Perila	1104
15792	Pikva	1104
15793	Pillapalu	1104
15794	Pringi	1104
15795	Puunsi	1104
15796	Raasiku	1104
15797	Rae	1104
15798	Randvere	1104
15799	Rannamoisa	1104
15800	Ravila	1104
15801	Riisipere	1104
15802	Rohuneeme	1104
15803	Roobuka	1104
15804	Ruila	1104
15805	Rummu	1104
15806	Saha	1104
15807	Saku	1104
15808	Saue	1104
15809	Saula	1104
15810	Saunja	1104
15811	Suurpea	1104
15812	Suurupi	1104
15813	Tabasalu	1104
15814	Tagadi	1104
15815	Tagametsa	1104
15816	Tallinn	1104
15817	Tammneeme	1104
15818	Tiskre	1104
15819	Todva	1104
15820	Turba	1104
15821	Turisalu	1104
15822	Tutermaa	1104
15823	Tuula	1104
15824	Tuulna	1104
15825	Uksnurme	1104
15826	Ulejoe	1104
15827	Uuri	1104
15828	Uuskula	1104
15829	Vaana	1104
15830	Vaana-Joesuu	1104
15831	Vaida	1104
15832	Vaidasoo	1104
15833	Valingu	1104
15834	Valkla	1104
15835	Vanamoisa	1104
15836	Vardja	1104
15837	Vasalemma	1104
15838	Vaskjala	1104
15839	Vatsla	1104
15840	Veskikula	1104
15841	Vihasoo	1104
15842	Viimsi	1104
15843	Viinistu	1104
15844	Viti	1104
15845	Emmaste	1105
15846	Jausa	1105
15847	Kaina	1105
15848	Kardla	1105
15849	Korgessaare	1105
15850	Lauka	1105
15851	Lope	1105
15852	Mannamaa	1105
15853	Putkaste	1105
15854	Suuremoisa	1105
15855	Aa	1106
15856	Alajoe	1106
15857	Aseri	1106
15858	Avinurme	1106
15859	Edise	1106
15860	Erra	1106
15861	Iisaku	1106
15862	Jarve	1106
15863	Johvi	1106
15864	Kahula	1106
15865	Kiikla	1106
15866	Kivioli	1106
15867	Kohtla-Jarve	1106
15868	Kohtla-Nomme	1106
15869	Konju	1106
15870	Kose	1106
15871	Kuremae	1106
15872	Kurtna	1106
15873	Lohusuu	1106
15874	Luganuse	1106
15875	Maetaguse	1106
15876	Maidla	1106
15877	Narva	1106
15878	Narva-Joesuu	1106
15879	Olgina	1106
15880	Pagari	1106
15881	Puhajoe	1106
15882	Purtse	1106
15883	Pussi	1106
15884	Rannu	1106
15885	Saka	1106
15886	Savala	1106
15887	Sillamae	1106
15888	Sinimae	1106
15889	Soldina	1106
15890	Sompa	1106
15891	Sonda	1106
15892	Tammiku	1106
15893	Toila	1106
15894	Tudulinna	1106
15895	Ulvi	1106
15896	Vaivara	1106
15897	Varja	1106
15898	Vasavere	1106
15899	Voka	1106
15900	Ahula	1107
15901	Aiamaa	1107
15902	Albu	1107
15903	Ambla	1107
15904	Anari	1107
15905	Anna	1107
15906	Aravete	1107
15907	Ervita	1107
15908	Imavere	1107
15909	Janeda	1107
15910	Jarva-Jaani	1107
15911	Jogisoo	1107
15912	Jootme	1107
15913	Kaalepi	1107
15914	Kabala	1107
15915	Kahala	1107
15916	Karavete	1107
15917	Karevere	1107
15918	Karinu	1107
15919	Kasukonna	1107
15920	Kirna	1107
15921	Koeru	1107
15922	Koigi	1107
15923	Kolu	1107
15924	Kuksema	1107
15925	Laupa	1107
15926	Lehtse	1107
15927	Lokuta	1107
15928	Loola	1107
15929	Muusleri	1107
15930	Oisu	1107
15931	Paide	1107
15932	Painurme	1107
15933	Peetri	1107
15934	Poikva	1107
15935	Reopalu	1107
15936	Retla	1107
15937	Roa	1107
15938	Roosna	1107
15939	Roosna-Alliku	1107
15940	Sarevere	1107
15941	Sargvere	1107
15942	Taikse	1107
15943	Tarbja	1107
15944	Turi	1107
15945	Turi-Alliku	1107
15946	Vaatsa	1107
15947	Vahukula	1107
15948	Vao	1107
15949	Viisu	1107
15950	Villevere	1107
15951	Adavere	1108
15952	Esku	1108
15953	Harjanurme	1108
15954	Jogeva	1108
15955	Kaarepere	1108
15956	Kalana	1108
15957	Kalme	1108
15958	Kamari	1108
15959	Karde	1108
15960	Kasepaa	1108
15961	Kassinurme	1108
15962	Konnu	1108
15963	Kudina	1108
15964	Kukita	1108
15965	Kuremaa	1108
15966	Kurista	1108
15967	Lahavere	1108
15968	Laiuse	1108
15969	Laiusevalja	1108
15970	Leedi	1108
15971	Lustivere	1108
15972	Luua	1108
15973	Maarja	1108
15974	Mallikvere	1108
15975	Metsakula	1108
15976	Mohkula	1108
15977	Mustvee	1108
15978	Neanurme	1108
15979	Nova	1108
15980	Omedu	1108
15981	Ouna	1108
15982	Painkula	1108
15983	Pajusi	1108
15984	Pala	1108
15985	Palamuse	1108
15986	Pataste	1108
15987	Pauastvere	1108
15988	Pikkjarve	1108
15989	Pikknurme	1108
15990	Pisisaare	1108
15991	Poltsamaa	1108
15992	Poora	1108
15993	Puurmani	1108
15994	Raabise	1108
15995	Raja	1108
15996	Saare	1108
15997	Sadala	1108
15998	Sadukula	1108
15999	Siimusti	1108
16000	Tabivere	1108
16001	Tahkvere	1108
16002	Tiheda	1108
16003	Toikvere	1108
16004	Torma	1108
16005	Umbusi	1108
16006	Vagari	1108
16007	Vaiatu	1108
16008	Vaike-Kamari	1108
16009	Vaimastvere	1108
16010	Valgma	1108
16011	Visusti	1108
16012	Voduvere	1108
16013	Vohmanomme	1108
16014	Voisiku	1108
16015	Voldi	1108
16016	Voore	1108
16017	Votikvere	1108
16018	Haapsalu	1109
16019	Hullo	1109
16020	Joodre	1109
16021	Kirbla	1109
16022	Kirimae	1109
16023	Koluvere	1109
16024	Komsi	1109
16025	Kullamaa	1109
16026	Lihula	1109
16027	Liivi	1109
16028	Linnamae	1109
16029	Martna	1109
16030	Nigula	1109
16031	Nova	1109
16032	Palivere	1109
16033	Palli	1109
16034	Panga	1109
16035	Paralepa	1109
16036	Piirsalu	1109
16037	Purksi	1109
16038	Rannakula	1109
16039	Risti	1109
16040	Roude	1109
16041	Sutlepa	1109
16042	Taebla	1109
16043	Tuudi	1109
16044	Uuemoisa	1109
16045	Variku	1109
16046	Vatla	1109
16047	Virtsu	1109
16048	Aaspere	1110
16049	Ama	1110
16050	Arkna	1110
16051	Assamalla	1110
16052	Avanduse	1110
16053	Avispea	1110
16054	Ebavere	1110
16055	Eipri	1110
16056	Essu	1110
16057	Haljala	1110
16058	Hulja	1110
16059	Imastu	1110
16060	Inju	1110
16061	Kadapiku	1110
16062	Kadila	1110
16063	Kadrina	1110
16064	Kakumae	1110
16065	Karitsa	1110
16066	Karu	1110
16067	Kasmu	1110
16068	Kihlevere	1110
16069	Kiku	1110
16070	Kiltsi	1110
16071	Kohala	1110
16072	Kunda	1110
16073	Kuti	1110
16074	Laekvere	1110
16075	Lasila	1110
16076	Lepna	1110
16077	Levala	1110
16078	Liigvalla	1110
16079	Modriku	1110
16080	Moe	1110
16081	Moora	1110
16082	Muuga	1110
16083	Napi	1110
16084	Paasvere	1110
16085	Pajusti	1110
16086	Pandivere	1110
16087	Piira	1110
16088	Pikevere	1110
16089	Podrangu	1110
16090	Podruse	1110
16091	Porkuni	1110
16092	Rahkla	1110
16093	Rakke	1110
16094	Rakvere	1110
16095	Ridakula	1110
16096	Roela	1110
16097	Roodevalja	1110
16098	Saase	1110
16099	Salda	1110
16100	Salla	1110
16101	Simuna	1110
16102	Someru	1110
16103	Taaravainu	1110
16104	Tamsalu	1110
16105	Tapa	1110
16106	Torma	1110
16107	Torremae	1110
16108	Triigi	1110
16109	Tudu	1110
16110	Ubja	1110
16111	Udriku	1110
16112	Uhtna	1110
16113	Ulvi	1110
16114	Undla	1110
16115	Ussimae	1110
16116	Uudekula	1110
16117	Vaekula	1110
16118	Vahakulmu	1110
16119	Vaiatu	1110
16120	Vaike-Maarja	1110
16121	Vajangu	1110
16122	Vao	1110
16123	Veltsi	1110
16124	Venevere	1110
16125	Vergi	1110
16126	Vetiku	1110
16127	Vihula	1110
16128	Viitna	1110
16129	Vinni	1110
16130	Viru-Jaagupi	1110
16131	Viru-Kabala	1110
16132	Viru-Nigula	1110
16133	Vohnja	1110
16134	Vosu	1110
16135	Vosupere	1110
16136	Ahaste	1111
16137	Aluste	1111
16138	Are	1111
16139	Arumetsa	1111
16140	Audru	1111
16141	Eametsa	1111
16142	Haademeeste	1111
16143	Halinga	1111
16144	Ikla	1111
16145	Ilvese	1111
16146	Jaamakula	1111
16147	Jaarja	1111
16148	Joesuu	1111
16149	Joopre	1111
16150	Kaansoo	1111
16151	Kabli	1111
16152	Kadjaste	1111
16153	Kaisma	1111
16154	Kalita	1111
16155	Kanakula	1111
16156	Kergu	1111
16157	Kihlepa	1111
16158	Kilingi-Nomme	1111
16159	Kilksama	1111
16160	Koima	1111
16161	Koonga	1111
16162	Krundikula	1111
16163	Laadi	1111
16164	Langerma	1111
16165	Lavassaare	1111
16166	Leipste	1111
16167	Lemmetsa	1111
16168	Lemsi	1111
16169	Libatse	1111
16170	Linakula	1111
16171	Lindi	1111
16172	Liu	1111
16173	Lodja	1111
16174	Lope	1111
16175	Malda	1111
16176	Mannikuste	1111
16177	Massiaru	1111
16178	Metsaaare	1111
16179	Metsapoole	1111
16180	Moisakula	1111
16181	Muraka	1111
16182	Niidu	1111
16183	Nurme	1111
16184	Oara	1111
16185	Oidrema	1111
16186	Paikuse	1111
16187	Papsaare	1111
16188	Parnjoe	1111
16189	Parnu	1111
16190	Parnu-Jaagupi	1111
16191	Penu	1111
16192	Piistaoja	1111
16193	Pohara	1111
16194	Poldeotsa	1111
16195	Pootsi	1111
16196	Pulli	1111
16197	Rannametsa	1111
16198	Ratsepa	1111
16199	Reiu	1111
16200	Ridalepa	1111
16201	Rootsikula	1111
16202	Saarde	1111
16203	Saare	1111
16204	Sauga	1111
16205	Seliste	1111
16206	Selja	1111
16207	Seljametsa	1111
16208	Silla	1111
16209	Sindi	1111
16210	Soeva	1111
16211	Soometsa	1111
16212	Suigu	1111
16213	Surju	1111
16214	Suurejoe	1111
16215	Taali	1111
16216	Tahkuranna	1111
16217	Tali	1111
16218	Tammiste	1111
16219	Tammuru	1111
16220	Tihemetsa	1111
16221	Tolla	1111
16222	Tootsi	1111
16223	Tori	1111
16224	Tostamaa	1111
16225	Tousi	1111
16226	Treimani	1111
16227	Urge	1111
16228	Uulu	1111
16229	Vahenurme	1111
16230	Vaki	1111
16231	Vandra	1111
16232	Varbla	1111
16233	Veelikse	1111
16234	Vihtra	1111
16235	Voidu	1111
16236	Voiste	1111
16237	Aarna	1112
16238	Ahja	1112
16239	Erastvere	1112
16240	Himma	1112
16241	Himmaste	1112
16242	Holvandi	1112
16243	Ihamaru	1112
16244	Jaanimoisa	1112
16245	Kanepi	1112
16246	Karilatsi	1112
16247	Karsa	1112
16248	Karste	1112
16249	Kauksi	1112
16250	Kiidjarve	1112
16251	Kostrimae	1112
16252	Krootuse	1112
16253	Leevaku	1112
16254	Leevi	1112
16255	Leevijoe	1112
16256	Linte	1112
16257	Lootvina	1112
16258	Maaritsa	1112
16259	Mammaste	1112
16260	Metste	1112
16261	Mikitamae	1112
16262	Mooste	1112
16263	Naha	1112
16264	Orava	1112
16265	Pahtpaa	1112
16266	Partsi	1112
16267	Peri	1112
16268	Piigandi	1112
16269	Polgaste	1112
16270	Polva	1112
16271	Prangli	1112
16272	Puuri	1112
16273	Raadama	1112
16274	Rahumae	1112
16275	Raigla	1112
16276	Rapina	1112
16277	Rasina	1112
16278	Ristipalo	1112
16279	Rosma	1112
16280	Ruusa	1112
16281	Saverna	1112
16282	Sillapaa	1112
16283	Soodoma	1112
16284	Suurkula	1112
16285	Taevaskoja	1112
16286	Tannassilma	1112
16287	Tilsi	1112
16288	Treski	1112
16289	Vaike-Rosna	1112
16290	Valgjarve	1112
16291	Vana-Koiola	1112
16292	Vardja	1112
16293	Varska	1112
16294	Vastse-Kuuste	1112
16295	Veriora	1112
16296	Viluste	1112
16297	Voopsu	1112
16298	Aespa	1113
16299	Alu	1113
16300	Eidapere	1113
16301	Hageri	1113
16302	Hagudi	1113
16303	Haimre	1113
16304	Hertu	1113
16305	Iira	1113
16306	Ingliste	1113
16307	Jarlepa	1113
16308	Jarvakandi	1113
16309	Juuru	1113
16310	Kaerepere	1113
16311	Kaiu	1113
16312	Kalbu	1113
16313	Karu	1113
16314	Kasti	1113
16315	Keava	1113
16316	Kehtna	1113
16317	Kivi-Vigala	1113
16318	Kodila	1113
16319	Kohila	1113
16320	Kuimetsa	1113
16321	Kuusiku	1113
16322	Laukna	1113
16323	Lelle	1113
16324	Lipa	1113
16325	Lohu	1113
16326	Lokuta	1113
16327	Maidla	1113
16328	Marjamaa	1113
16329	Masti	1113
16330	Moisamaa	1113
16331	Naravere	1113
16332	Orgita	1113
16333	Paardu	1113
16334	Pae	1113
16335	Pahkla	1113
16336	Pihali	1113
16337	Pirgu	1113
16338	Prillimae	1113
16339	Purila	1113
16340	Purku	1113
16341	Rabivere	1113
16342	Raikkula	1113
16343	Rangu	1113
16344	Rapla	1113
16345	Salutaguse	1113
16346	Sipa	1113
16347	Sotke	1113
16348	Sutlema	1113
16349	Tamme	1113
16350	Teenuse	1113
16351	Uuskula	1113
16352	Vahastu	1113
16353	Valgu	1113
16354	Valtu	1113
16355	Vana-Kaiu	1113
16356	Vana-Vigala	1113
16357	Varbola	1113
16358	Vilivere	1113
16359	Arandi	1114
16360	Aste	1114
16361	Eikla	1114
16362	Hellamaa	1114
16363	Kao	1114
16364	Karja	1114
16365	Karla	1114
16366	Kihelkonna	1114
16367	Koimla	1114
16368	Koljala	1114
16369	Korkkula	1114
16370	Korkvere	1114
16371	Kudjape	1114
16372	Kuressaare	1114
16373	Laatsa	1114
16374	Lahekula	1114
16375	Laimjala	1114
16376	Leisi	1114
16377	Liiva	1114
16378	Lumanda	1114
16379	Metskula	1114
16380	Mustjala	1114
16381	Nasva	1114
16382	Nommkula	1114
16383	Orissaare	1114
16384	Pahkla	1114
16385	Parsama	1114
16386	Pihtla	1114
16387	Sakla	1114
16388	Salme	1114
16389	Sandla	1114
16390	Tagavere	1114
16391	Tornimae	1114
16392	Valjala	1114
16393	Vohma	1114
16394	Aardla	1115
16395	Aksi	1115
16396	Alasoo	1115
16397	Alatskivi	1115
16398	Annikoru	1115
16399	Aravu	1115
16400	Elva	1115
16401	Erala	1115
16402	Ervu	1115
16403	Haage	1115
16404	Haaslava	1115
16405	Ignase	1115
16406	Illi	1115
16407	Ilmatsalu	1115
16408	Kaagvere	1115
16409	Kaardi	1115
16410	Kaarlijarve	1115
16411	Kallaste	1115
16412	Kalme	1115
16413	Kambja	1115
16414	Kandikula	1115
16415	Karevere	1115
16416	Karkna	1115
16417	Kasepaa	1115
16418	Kavastu	1115
16419	Kirepi	1115
16420	Kodukula	1115
16421	Kokora	1115
16422	Kolkja	1115
16423	Konguta	1115
16424	Koosa	1115
16425	Koruste	1115
16426	Korvekula	1115
16427	Kulitse	1115
16428	Kurekula	1115
16429	Kurista	1115
16430	Laaniste	1115
16431	Laeva	1115
16432	Lahte	1115
16433	Lalli	1115
16434	Lapetukme	1115
16435	Lemmatsi	1115
16436	Lohkva	1115
16437	Lossimae	1115
16438	Luke	1115
16439	Luunja	1115
16440	Maksa	1115
16441	Maramaa	1115
16442	Marja	1115
16443	Meeksi	1115
16444	Meeri	1115
16445	Mehikoorma	1115
16446	Melliste	1115
16447	Metsakivi	1115
16448	Metsalaane	1115
16449	Moisanurme	1115
16450	Nina	1115
16451	Nogiaru	1115
16452	Noo	1115
16453	Pilka	1115
16454	Poka	1115
16455	Pooritsa	1115
16456	Puhja	1115
16457	Rahinge	1115
16458	Raigaste	1115
16459	Ramsi	1115
16460	Rani	1115
16461	Rannu	1115
16462	Rebase	1115
16463	Reola	1115
16464	Rohu	1115
16465	Roiu	1115
16466	Rongu	1115
16467	Saadjarve	1115
16468	Sinikula	1115
16469	Sirgu	1115
16470	Soinaste	1115
16471	Sojamaa	1115
16472	Tahtvere	1115
16473	Tammiste	1115
16474	Tammistu	1115
16475	Tartu	1115
16476	Teedla	1115
16477	Tilga	1115
16478	Toravere	1115
16479	Torvandi	1115
16480	Tuki	1115
16481	Uderna	1115
16482	Uhti	1115
16483	Ulenurme	1115
16484	Ulila	1115
16485	Unikula	1115
16486	Vahi	1115
16487	Vaike-Rakke	1115
16488	Valguta	1115
16489	Vana-Kuuste	1115
16490	Vara	1115
16491	Varnja	1115
16492	Vasula	1115
16493	Vedu	1115
16494	Vesneri	1115
16495	Vissi	1115
16496	Voibla	1115
16497	Voika	1115
16498	Vonnu	1115
16499	Voopste	1115
16500	Vorbuse	1115
16501	Aakre	1116
16502	Ala	1116
16503	Hargla	1116
16504	Hellenurme	1116
16505	Helme	1116
16506	Hummuli	1116
16507	Jeti	1116
16508	Jogeveste	1116
16509	Kaagjarve	1116
16510	Kalme	1116
16511	Karjatnurme	1116
16512	Karula	1116
16513	Keeni	1116
16514	Koikkula	1116
16515	Laanemetsa	1116
16516	Laatre	1116
16517	Laukula	1116
16518	Leebiku	1116
16519	Linna	1116
16520	Lossikula	1116
16521	Lullemae	1116
16522	Moldre	1116
16523	Nouni	1116
16524	Nupli	1116
16525	Oru	1116
16526	Oruste	1116
16527	Otepaa	1116
16528	Paidla	1116
16529	Paju	1116
16530	Palupera	1116
16531	Patkula	1116
16532	Piiri	1116
16533	Pikasilla	1116
16534	Pilkuse	1116
16535	Puhajarve	1116
16536	Puka	1116
16537	Restu	1116
16538	Riidaja	1116
16539	Sangaste	1116
16540	Sihva	1116
16541	Sooru	1116
16542	Taagepera	1116
16543	Tagula	1116
16544	Taheva	1116
16545	Tiidu	1116
16546	Tolliste	1116
16547	Torva	1116
16548	Tsirguliina	1116
16549	Valga	1116
16550	Vana-Otepaa	1116
16551	Abja-Paluoja	1117
16552	Abja-Vanamoisa	1117
16553	Aidu	1117
16554	Angi	1117
16555	Anikatsi	1117
16556	Arikula	1117
16557	Halliste	1117
16558	Heimtali	1117
16559	Holstre	1117
16560	Intsu	1117
16561	Jamejala	1117
16562	Jaska	1117
16563	Kaavere	1117
16564	Kamara	1117
16565	Karksi	1117
16566	Karksi-Nuia	1117
16567	Karstna	1117
16568	Karula	1117
16569	Kobruvere	1117
16570	Koidama	1117
16571	Koksvere	1117
16572	Kolga-Jaani	1117
16573	Koo	1117
16574	Kopu	1117
16575	Kulla	1117
16576	Lalsi	1117
16577	Leie	1117
16578	Lilli	1117
16579	Lohavere	1117
16580	Loodi	1117
16581	Maeltkula	1117
16582	Matapera	1117
16583	Meleski	1117
16584	Metskula	1117
16585	Moisakula	1117
16586	Monnaste	1117
16587	Mustivere	1117
16588	Mustla	1117
16589	Navesti	1117
16590	Odiste	1117
16591	Oisu	1117
16592	Olustvere	1117
16593	Pahuvere	1117
16594	Paistu	1117
16595	Parakula	1117
16596	Pari	1117
16597	Parsti	1117
16598	Peetrimoisa	1117
16599	Pilistvere	1117
16600	Pinska	1117
16601	Polde	1117
16602	Polli	1117
16603	Puiatu	1117
16604	Ramsi	1117
16605	Reegoldi	1117
16606	Saarepeedi	1117
16607	Savikoti	1117
16608	Sinialliku	1117
16609	Soe	1117
16610	Soomevere	1117
16611	Sudiste	1117
16612	Suislepa	1117
16613	Sultsi	1117
16614	Supsi	1117
16615	Surgavere	1117
16616	Suure-Jaani	1117
16617	Taaksi	1117
16618	Tanassilma	1117
16619	Tinnikuru	1117
16620	Tohvri	1117
16621	Tuhalaane	1117
16622	Tusti	1117
16623	Ulde	1117
16624	Ulensi	1117
16625	Uusna	1117
16626	Valgita	1117
16627	Valma	1117
16628	Valuste	1117
16629	Vana-Kariste	1117
16630	Vana-Voidu	1117
16631	Vardi	1117
16632	Vardja	1117
16633	Vastemoisa	1117
16634	Veelikse	1117
16635	Verilaske	1117
16636	Veskimae	1117
16637	Viiratsi	1117
16638	Viljandi	1117
16639	Villa	1117
16640	Vohma	1117
16641	Voivaku	1117
16642	Vooru	1117
16643	Antsla	1118
16644	Haanja	1118
16645	Jarvere	1118
16646	Kaapa	1118
16647	Kirumpaa	1118
16648	Kobela	1118
16649	Kollino	1118
16650	Kose	1118
16651	Kraavi	1118
16652	Krabi	1118
16653	Kulaoru	1118
16654	Kuldre	1118
16655	Kuutsi	1118
16656	Lasva	1118
16657	Loosu	1118
16658	Lusti	1118
16659	Meegomae	1118
16660	Meremae	1118
16661	Misso	1118
16662	Moniste	1118
16663	Navi	1118
16664	Nursi	1118
16665	Obinitsa	1118
16666	Osula	1118
16667	Otsa	1118
16668	Parksepa	1118
16669	Puiga	1118
16670	Raiste	1118
16671	Rimmi	1118
16672	Rouge	1118
16673	Ruusmae	1118
16674	Saru	1118
16675	Somerpalu	1118
16676	Sulbi	1118
16677	Taberlaane	1118
16678	Tagakula	1118
16679	Tsolgo	1118
16680	Tsooru	1118
16681	Urvaste	1118
16682	Uue-Antsla	1118
16683	Vaabina	1118
16684	Vagula	1118
16685	Vaimela	1118
16686	Vana-Antsla	1118
16687	Vana-Roosa	1118
16688	Vana-Vastseliina	1118
16689	Varstu	1118
16690	Vastseliina	1118
16691	Verijarve	1118
16692	Viitina	1118
16693	Viitka	1118
16694	Visela	1118
16695	Voru	1118
16696	Vorumoisa	1118
16697	Asayita	1120
16698	Awash	1120
16699	Dubti	1120
16700	Gewane	1120
16701	Addi Arkay	1121
16702	Addis Alem	1121
16703	Addis Zemen	1121
16704	Adet	1121
16705	Bahir Dar	1121
16706	Bati	1121
16707	Bichena	1121
16708	Bure	1121
16709	Chagni	1121
16710	Dabat	1121
16711	Dangla	1121
16712	Debark	1121
16713	Debre Birhan	1121
16714	Debre Markos	1121
16715	Debre Sina	1121
16716	Debre Tabor	1121
16717	Debre Werk	1121
16718	Dejen	1121
16719	Dese	1121
16720	Finote Selam	1121
16721	Gondar	1121
16722	Kobo	1121
16723	Kembolcha	1121
16724	Kemise	1121
16725	Lalibela	1121
16726	Motta	1121
16727	Nefas Mewcha	1121
16728	Sekota	1121
16729	Shewa Robit	1121
16730	Weldiya	1121
16731	Were Ilu	1121
16732	Werota	1121
16733	Asosa	1122
16734	Dire Dawa	1123
16735	Gambela	1124
16736	Harer	1125
16737	Jigjiga	1126
16738	Alem Maya	1128
16739	Abomsa	1128
16740	Agaro	1128
16741	Asasa	1128
16742	Asbe Teferi	1128
16743	Assela	1128
16744	Bako	1128
16745	Bedele	1128
16746	Bedesa	1128
16747	Burayu	1128
16748	Debre Zeyit	1128
16749	Deder	1128
16750	Dembi Dolo	1128
16751	Dodola	1128
16752	Fiche	1128
16753	Gebre Guracha	1128
16754	Gedo	1128
16755	Gelemso	1128
16756	Gimbi	1128
16757	Ginchi	1128
16758	Ginir	1128
16759	Giyon	1128
16760	Goba	1128
16761	Gore	1128
16762	Guder	1128
16763	Hagere Hiywet	1128
16764	Hagere Maryam	1128
16765	Hirna	1128
16766	Holeta Genet	1128
16767	Huruta	1128
16768	Jimma	1128
16769	Kibre Mengist	1128
16770	Kofele	1128
16771	Mega	1128
16772	Meki	1128
16773	Mendi	1128
16774	Metehara	1128
16775	Metu	1128
16776	Mojo	1128
16777	Moyale	1128
16778	Nazret	1128
16779	Nedjo	1128
16780	Negele	1128
16781	Nekemte	1128
16782	Robe	1128
16783	Sebeta	1128
16784	Sendafa	1128
16785	Shakiso	1128
16786	Shambu	1128
16787	Shashemenne	1128
16788	Sheh Hussen	1128
16789	Sire	1128
16790	Tulu Bolo	1128
16791	Welenchiti	1128
16792	Welkite	1128
16793	Wonji	1128
16794	Yabelo	1128
16795	Ziway	1128
16796	Bircot	1129
16797	Degeh Bur	1129
16798	Dollo Odo	1129
16799	Imi	1129
16800	Jijiga	1129
16801	Werder	1129
16802	Alaba Kulito	1130
16803	Arba Minch	1130
16804	Areka	1130
16805	Awassa	1130
16806	Bako	1130
16807	Boditi	1130
16808	Bonga	1130
16809	Butajira	1130
16810	Chencha	1130
16811	Dilla	1130
16812	Gidole	1130
16813	Hossaina	1130
16814	Jinka	1130
16815	Leku	1130
16816	Mizan Teferi	1130
16817	Sawla	1130
16818	Soddo	1130
16819	Teppi	1130
16820	Wendo	1130
16821	Yirga Alem	1130
16822	Yirga Chefe	1130
16823	Abiy Adi	1131
16824	Addigrat	1131
16825	Adwa	1131
16826	Aksum	1131
16827	Alamata	1131
16828	Endasilasie	1131
16829	Hagere Selam	1131
16830	Himora	1131
16831	Korem	1131
16832	Maychew	1131
16833	Mekele	1131
16834	Mekele	1131
16835	Wikro	1131
16836	Hvannasund	1137
16837	Klaksvik	1137
16838	Husavik	1140
16839	Sands	1140
16840	Skalavik	1140
16841	Skopun	1140
16842	Skuvoy	1140
16843	Haldarsvik	1141
16844	Hests	1141
16845	Hosvik	1141
16846	Hvalvik	1141
16847	Kirkjubo	1141
16848	Kollafjar 	1141
16849	Kvivik	1141
16850	Nolsoy	1141
16851	Saksun	1141
16852	Torshavn	1141
16853	Vestmanna	1141
16854	Torshavn	1144
16855	Biggjar	1145
16856	Midvags	1145
16857	Mykines	1145
16858	Sandavags	1145
16859	Sorvags	1145
16860	Deuba	1146
16861	Korovou	1146
16862	Lami	1146
16863	Namosi	1146
16864	Nausori	1146
16865	Navua	1146
16866	Suva	1146
16867	Levuka	1147
16868	Malhaha	1147
16869	Tubou	1147
16870	Vunisea	1147
16871	Korokade	1148
16872	Labasa	1148
16873	Savusavu	1148
16874	Ba	1150
16875	Lautoka	1150
16876	Nadi	1150
16877	Rakiraki	1150
16878	Sigatoka	1150
16879	Tavua	1150
16880	Vatukoula	1150
16881	Maarianhamina	1151
16882	Imatra	1152
16883	Joutseno	1152
16884	Lappeenranta	1152
16885	Hyllykallio	1153
16886	Ilmajoki	1153
16887	Kauhajoki	1153
16888	Kurikka	1153
16889	Lapua	1153
16890	Seinajoki	1153
16891	Mikkeli	1154
16892	Savonlinna	1154
16893	Loviisa	1157
16894	Orimattila	1157
16895	Porvoo	1157
16896	Kajaani	1158
16897	Forssa	1159
16898	Hameenlinna	1159
16899	Janakkala	1159
16900	Riihimaki	1159
16901	Kokkola	1160
16902	Aanekoski	1161
16903	Jamsa	1161
16904	Jyvaskyla	1161
16905	Keuruu	1161
16906	Laukaa	1161
16907	Lieto	1161
16908	Anjalankoski	1162
16909	Hamina	1162
16910	Kotka	1162
16911	Kouvola	1162
16912	Kuusankoski	1162
16913	Valkeala	1162
16914	Vehkalahti	1162
16915	Kemi	1164
16916	Kemijarvi	1164
16917	Rovaniemi	1164
16918	Sonka	1164
16919	Tornio	1164
16920	Jakobstad	1166
16921	Oulunsalo	1166
16922	Heinola	1168
16923	Hollola	1168
16924	Lahti	1168
16925	Nastola	1168
16926	Kangasala	1169
16927	Lempaala	1169
16928	Nokia	1169
16929	Pirkkala	1169
16930	Sastamala	1169
16931	Tampere	1169
16932	Valkeakoski	1169
16933	Ylojarvi	1169
16934	Kristiinankaupunki	1170
16935	Mustasaari	1170
16936	Pietarsaari	1170
16937	Uusikarlepyy	1170
16938	Vaasa	1170
16939	Joensuu	1171
16940	Lieksa	1171
16941	Haukipudas	1172
16942	Kempele	1172
16943	Kuusamo	1172
16944	Muhos	1172
16945	Nivala	1172
16946	Oulainen	1172
16947	Oulu	1172
16948	Raahe	1172
16949	Ylivieska	1172
16950	Iisalmi	1173
16951	Kuopio	1173
16952	Sillinjarvi	1173
16953	Varkaus	1173
16954	Saarijarvi	1174
16955	Eura	1175
16956	Eurajoki	1175
16957	Harjavalta	1175
16958	Huittinen	1175
16959	Kankaanpaa	1175
16960	Kokemaki	1175
16961	Lappi	1175
16962	Nakkila	1175
16963	Noormarkku	1175
16964	Pori	1175
16965	Rauma	1175
16966	Sakyla	1175
16967	Ulvila	1175
16968	Vammala	1175
16969	Espoo	1179
16970	Hanko	1179
16971	Helsinki	1179
16972	Hyvinkaa	1179
16973	Jarvenpaa	1179
16974	Kauniainen	1179
16975	Kerava	1179
16976	Kirkkonummi	1179
16977	Lohja	1179
16978	Mantsala	1179
16979	Nurmijarvi	1179
16980	Sipoo	1179
16981	Tammisaari	1179
16982	Tuusula	1179
16983	Vantaa	1179
16984	Vihti	1179
16985	Kaarina	1180
16986	Naantali	1180
16987	Parainen	1180
16988	Raisio	1180
16989	Salo	1180
16990	Turku	1180
16991	Uusikaupunki	1180
16992	Amberieu-en-Bugey	1181
16993	Bellegarde-sur-Valserine	1181
16994	Bourg-en-Bresse	1181
16995	Oyonnax	1181
16996	Chateau-Thierry	1182
16997	Chauny	1182
16998	Hirson	1182
16999	Laon	1182
17000	Saint-Quentin	1182
17001	Soissons	1182
17002	Strassbourg	1182
17003	Tergnier	1182
17004	Cusset	1184
17005	Montlucon	1184
17006	Moulins	1184
17007	Vichy	1184
17008	Yzeure	1184
17009	Antibes	1186
17010	Beausoleil	1186
17011	Cagnes-sur-Mer	1186
17012	Cannes	1186
17013	Carros	1186
17014	Grasse	1186
17015	La Trinite	1186
17016	Le Cannet	1186
17017	Mandelieu-la-Napoule	1186
17018	Menton	1186
17019	Mougins	1186
17020	Nice	1186
17021	Roquebrune-Cap-Martin	1186
17022	Saint-Laurent-du-Var	1186
17023	Valbonne	1186
17024	Vallauris	1186
17025	Vence	1186
17026	Villeneuve-Loubet	1186
17027	Digne-les-Bains	1187
17028	Manosque	1187
17029	Adainville	1188
17030	Alby-sur-Cheran	1188
17031	Aubervilliers	1188
17032	Auterive	1188
17033	Baillet	1188
17034	Beaune	1188
17035	Beauzelle	1188
17036	Bonnet De Mure	1188
17037	Bormes-les-Mimosas	1188
17038	Brindas	1188
17039	Burlats	1188
17040	Buzancais	1188
17041	Candillargues	1188
17042	Carry-le-Rouet	1188
17043	Cassis	1188
17044	Cessenon-Sur-Orb	1188
17045	Chanac	1188
17046	Chevigny	1188
17047	Cogolin	1188
17048	Collioure	1188
17049	Cremieu	1188
17050	Drulingen	1188
17051	Ecouen	1188
17052	Eschau	1188
17053	Feignies	1188
17054	Ferus	1188
17055	Fourqueux	1188
17056	Franqueville	1188
17057	Gignac	1188
17058	Gravigny	1188
17059	Hangenbieten	1188
17060	Hunspach	1188
17061	Kilstett	1188
17062	La Chevroliere	1188
17063	La-Fare-Les-Oliviers	1188
17064	Lanvellec	1188
17065	Le Faget	1188
17066	Lesigny	1188
17067	Lesquin	1188
17068	Limonest	1188
17069	Messein	1188
17070	Morgat	1188
17071	Mundolsheim	1188
17072	Nantiat	1188
17073	Niederbronn-les-Bain	1188
17074	Nimes	1188
17075	Opoul	1188
17076	Pance	1188
17077	Peronne	1188
17078	Ploneour Lanvern	1188
17079	Realmont	1188
17080	Reichstett	1188
17081	Saint Aubin	1188
17082	Saint Christophe	1188
17083	Saint Martin dÃƒÂ¢Ã‚Â€Ã‚Â™Here	1188
17084	Saint-Berthevin	1188
17085	Saint-Cergues	1188
17086	Sancerre	1188
17087	Sarzeau	1188
17088	Seltz	1188
17089	Seyssins	1188
17090	Souffelweyersheim	1188
17091	Vireux-Molhain	1188
17092	Voves	1188
17093	Wambrechies	1188
17094	Wervocq Sud	1188
17095	Abzac	1189
17096	Bidart	1189
17097	Biganos	1189
17098	Buzet-sur-Baise	1189
17099	Coursac	1189
17100	Hasparren	1189
17101	Landiras	1189
17102	Le Haillan	1189
17103	Ledat	1189
17104	Martillac	1189
17105	Puyoo	1189
17106	Saint-Jean-dIllac	1189
17107	Seignosse	1189
17108	Tresses	1189
17109	Annonay	1190
17110	Aubenas	1190
17111	Guilherand-Granges	1190
17112	Privas	1190
17113	Tournon-sur-Rhone	1190
17114	Charleville-Mezieres	1191
17115	Les Hautes-Rivieres	1191
17116	Revin	1191
17117	Sedan	1191
17118	Foix	1192
17119	Pamier	1192
17120	Bar-sur-Seine	1193
17121	Romilly-sur-Seine	1193
17122	Saint-Andre-les-Vergers	1193
17123	Sainte-Savine	1193
17124	Troyes	1193
17125	Carcassonne	1194
17126	Castelnaudary	1194
17127	Limoux	1194
17128	Narbonne	1194
17129	Ambert	1195
17130	Creuzier-le-Vieux	1195
17131	Ferrieres	1195
17132	Peschadoires	1195
17133	Riotord	1195
17134	Saint-Pal-de-Chalencon	1195
17135	Saint-Romain-Lachalm	1195
17136	Saint-Vidal	1195
17137	Sainte-Sigolene	1195
17138	Millau	1196
17139	Onet-le-Chataeu	1196
17140	Rodez	1196
17141	Villefranche-de-Rouergue	1196
17142	Bischheim	1197
17143	Bischwiller	1197
17144	Haguenau	1197
17145	Hoenheim	1197
17146	Illkirch-Graffenstaden	1197
17147	Lingolsheim	1197
17148	Obernai	1197
17149	Ostwald	1197
17150	Saverne	1197
17151	Schiltigheim	1197
17152	Selestat	1197
17153	Strasbourg	1197
17154	Deauville	1198
17155	Aix-en-Provence	1199
17156	Allauch	1199
17157	Arles	1199
17158	Aubagne	1199
17159	Berre-lEtang	1199
17160	Bouc-Bel-Air	1199
17161	Chateauneuf-les-Martigues	1199
17162	Chateaurenard	1199
17163	Fos-sur-Mer	1199
17164	Gardanne	1199
17165	Istres	1199
17166	La Ciotat	1199
17167	Les Pennes-Mirabeau	1199
17168	Maillane	1199
17169	Marignane	1199
17170	Marseille	1199
17171	Martigues	1199
17172	Miramas	1199
17173	Plan-de-Cuques	1199
17174	Port-de-Bouc	1199
17175	Rognac	1199
17176	Saint-Martin-de-Crau	1199
17177	Saint-Remy-de-Provence	1199
17178	Salon-de-Provence	1199
17179	Septemes-les-Vallons	1199
17180	Tarascon	1199
17181	Vitrolles	1199
17182	Migennes	1200
17183	Javene	1201
17184	Plouha	1201
17185	Brehan	1202
17186	Broons	1202
17187	Guipry	1202
17188	Miniac-Morvan	1202
17189	Ploudaniel	1202
17190	Vern-sur-Seiche	1202
17191	Aillant-sur-Tholon	1203
17192	Bayeux	1204
17193	Caen	1204
17194	Herouville-Saint-Clair	1204
17195	Lisieux	1204
17196	Mondeville	1204
17197	Vire	1204
17198	Aurillac	1205
17199	Brumath	1206
17200	Courtaboeuf	1206
17201	Iregny	1206
17202	cedex	1206
17203	Azay-le-Rideau	1207
17204	Chevillon-sur-Huillard	1207
17205	Cloyes-sur-le-Loir	1207
17206	Gellainville	1207
17207	La Chaussse-Saint-Victor	1207
17208	La Ville-aux-Clercs	1207
17209	Ladon	1207
17210	Le Chatelet	1207
17211	Angouleme	1208
17212	Cognac	1208
17213	Lencloitre	1208
17214	Soyaux	1208
17215	La Rochelle	1209
17216	Rochefort	1209
17217	Royan	1209
17218	Saintes	1209
17219	Bourges	1210
17220	Saint-Amand-Montrond	1210
17221	Saint-Doulchard	1210
17222	Vierzon	1210
17223	Brive-la-Gaillarde	1211
17224	Tulle	1211
17225	Ussel	1211
17226	Ajaccio	1212
17227	Porto-Vecchio	1212
17228	Beaune	1213
17229	Chenove	1213
17230	Dijon	1213
17231	Quetigny	1213
17232	Talant	1213
17233	Dinan	1214
17234	Lamballe	1214
17235	Lannion	1214
17236	Loudeac	1214
17237	Plerin	1214
17238	Ploufragan	1214
17239	Saint-Brieuc	1214
17240	Gueret	1215
17241	Crolles	1216
17242	Bressuire	1217
17243	Niort	1217
17244	Parthenay	1217
17245	Thouars	1217
17246	Bergerac	1218
17247	Perigueux	1218
17248	Sarlat-la-Caneda	1218
17249	Audincourt	1219
17250	Besancon	1219
17251	Beure	1219
17252	Montbeliard	1219
17253	Pontarlier	1219
17254	Valentigney	1219
17255	Bourg-les-Valence	1220
17256	Montelimar	1220
17257	Pierrelatte	1220
17258	Romans-sur-Isere	1220
17259	Valence	1220
17260	Athis-Mons	1221
17261	Bretigny-sur-Orge	1221
17262	Brunoy	1221
17263	Bures-sur-Yvette	1221
17264	Chilly-Mazarin	1221
17265	Corbeil-Essonnes	1221
17266	Courcouronnes	1221
17267	Dourdan	1221
17268	Draveil	1221
17269	Epinay-sous-Senart	1221
17270	Epinay-sur-Orge	1221
17271	Etampes	1221
17272	Evry	1221
17273	Fleury-Merogis	1221
17274	Gif-sur-Yvette	1221
17275	Grigny	1221
17276	Igny	1221
17277	Juvisy-sur-Orge	1221
17278	Les Ulis	1221
17279	Longjumeau	1221
17280	Massy	1221
17281	Mennecy	1221
17282	Montgeron	1221
17283	Morangis	1221
17284	Morsang-sur-Orge	1221
17285	Orsay	1221
17286	Palaiseau	1221
17287	Ris-Orangis	1221
17288	Saint-Michel-sur-Orge	1221
17289	Sainte-Genevieve-des-Bois	1221
17290	Savigny-sur-Orge	1221
17291	Verrieres-le-Buisson	1221
17292	Vigneux-sur-Seine	1221
17293	Villebon-sur-Yvette	1221
17294	Viry-Chatillon	1221
17295	Yerres	1221
17296	Bernay	1222
17297	Evreux	1222
17298	Gisors	1222
17299	Louviers	1222
17300	Pont-Audemer	1222
17301	Val-de-Reuil	1222
17302	Vernon	1222
17303	Chartres	1223
17304	Chateaudun	1223
17305	Dreux	1223
17306	Luce	1223
17307	Mainvillier	1223
17308	Nogent-le-Rotrou	1223
17309	Vernouillet	1223
17310	Feucherolles	1224
17311	Brest	1225
17312	Concarneau	1225
17313	Douarnenez	1225
17314	Guipavas	1225
17315	Landerneau	1225
17316	Le Relecq-Kerhoun	1225
17317	Morlaix	1225
17318	Plougastel-Daoulas	1225
17319	Plouzane	1225
17320	Quimper	1225
17321	Quimperle	1225
17322	Charquemont	1226
17323	Chemaudin	1226
17324	Pelousey	1226
17325	Perrigny	1226
17326	Pirey	1226
17327	Villers-le-Lac	1226
17328	Ales	1227
17329	Bagnols-sur-Ceze	1227
17330	Beaucaire	1227
17331	Nimes	1227
17332	Pont-Saint-Esprit	1227
17333	Saint-Gilles	1227
17334	Vauvert	1227
17335	Villeneuve-les-Avignon	1227
17336	Auch	1228
17337	Beraut	1228
17338	Ambares-et-Lagrave	1229
17339	Arcachon	1229
17340	Begles	1229
17341	Blanquefort	1229
17342	Bordeaux	1229
17343	Bruges	1229
17344	Cenon	1229
17345	Cestas	1229
17346	Eysines	1229
17347	Floirac	1229
17348	Gradignan	1229
17349	Gujan-Mestras	1229
17350	La Teste-de-Buch	1229
17351	Le Bouscat	1229
17352	Libourne	1229
17353	Lormont	1229
17354	Merignac	1229
17355	Pessac	1229
17356	Saint-Medard-en-Jalles	1229
17357	Talence	1229
17358	Villenave-dOrnon	1229
17359	Cernay	1230
17360	Colmar	1230
17361	Guebwiller	1230
17362	Illzach	1230
17363	Kingersheim	1230
17364	Mulhouse	1230
17365	Riediesheim	1230
17366	Rixheim	1230
17367	Saint-Louis	1230
17368	Wittelsheim	1230
17369	Wittenheim	1230
17370	Bastia	1231
17371	Balma	1232
17372	Blagnac	1232
17373	Colomiers	1232
17374	Cugnaux	1232
17375	LUnion	1232
17376	Muret	1232
17377	Plaisance-du-Touch	1232
17378	Ramonville-Saint-Agne	1232
17379	Saint-Gaudens	1232
17380	Saint-Orens-de-Gameville	1232
17381	Toulouse	1232
17382	Tournefeuille	1232
17383	Blanzac	1233
17384	Le Puy-en-Velay	1233
17385	Chaumont	1234
17386	Langres	1234
17387	Saint-Dizier	1234
17388	Hericourt	1235
17389	Lure	1235
17390	Luxeuil-les-Bains	1235
17391	Vesoul	1235
17392	Annecy	1236
17393	Annecy-le-Vieux	1236
17394	Annemasse	1236
17395	Archamps	1236
17396	Bonneville	1236
17397	Chamonix-Mont-Blanc	1236
17398	Cluses	1236
17399	Contamine sur Arve	1236
17400	Cran-Gevrier	1236
17401	Passy	1236
17402	Rumilly	1236
17403	Sallanches	1236
17404	Seynod	1236
17405	Thonon-les-Bains	1236
17406	Gaillard	1237
17407	Limoges	1237
17408	Saint-Junien	1237
17409	Briancon	1238
17410	Gap	1238
17411	Lourdes	1239
17412	Tarbes	1239
17413	Antony	1240
17414	Asnieres-sur-Seine	1240
17415	Bagneux	1240
17416	Bois-Colombes	1240
17417	Boulogne-Billancourt	1240
17418	Bourg-la-Reine	1240
17419	Chatenay-Malabry	1240
17420	Chatillon	1240
17421	Chaville	1240
17422	Clamart	1240
17423	Clichy	1240
17424	Colombes	1240
17425	Courbevoie	1240
17426	Fontenay-aux-Roses	1240
17427	Garches	1240
17428	Gennevillers	1240
17429	Issy-les-Moulineaux	1240
17430	La Garenne-Colombes	1240
17431	Le Plessis-Robinson	1240
17432	Levallois-Perret	1240
17433	Malakoff	1240
17434	Meudon	1240
17435	Montrouge	1240
17436	Nanterre	1240
17437	Neuilly-sur-Seine	1240
17438	Puteaux	1240
17439	Rueil-Malmaison	1240
17440	Saint-Cloud	1240
17441	Sceaux	1240
17442	Sevres	1240
17443	Suresnes	1240
17444	Vanves	1240
17445	Ville-dAvray	1240
17446	Villeneuve-la-Garenne	1240
17447	Agde	1241
17448	Beziers	1241
17449	Castelnau-le-Lez	1241
17450	Frontignan	1241
17451	Lattes	1241
17452	Lunel	1241
17453	Mauguio	1241
17454	Montpellier	1241
17455	Sete	1241
17456	Champagne-sur-Oise	1242
17457	Croissy-Beaubourg	1242
17458	Gennevilliers	1242
17459	Le Mesnil-le-Roi	1242
17460	Le Plessis-Bouchard	1242
17461	Rebais	1242
17462	Saint-Thibault-des-Vignes	1242
17463	Cesson-Sevigne	1243
17464	Dinard	1243
17465	Fougeres	1243
17466	Rennes	1243
17467	Saint-Malo	1243
17468	Vitre	1243
17469	Chateauroux	1244
17470	Issoudun	1244
17471	Amboise	1245
17472	Joue-les-Tours	1245
17473	Saint-Avertin	1245
17474	Saint-Cyr-sur-Loire	1245
17475	Saint-Pierre-des-Corps	1245
17476	Tours	1245
17477	Bourgoin-Jallieu	1246
17478	Crolles	1246
17479	Echirolles	1246
17480	Fontaine	1246
17481	Grenoble	1246
17482	Le Pont-de-Claix	1246
17483	Meylan	1246
17484	Saint-Egreve	1246
17485	Saint-Martin-dHeres	1246
17486	Seyssinet-Pariset	1246
17487	Vienne	1246
17488	Villefontaine	1246
17489	Voiron	1246
17490	Champagnole	1247
17491	Dole	1247
17492	Lons-le-Saunier	1247
17493	Saint-Claude	1247
17494	Sebastiangasse	1248
17495	Biscarrosse	1249
17496	Dax	1249
17497	Hagetmau	1249
17498	Landes	1249
17499	Mont-de-Marsan	1249
17500	Saint-Paul-les-Dax	1249
17501	Tarnos	1249
17502	Codolet	1250
17503	Cuxac-dAude	1250
17504	Gigean	1250
17505	Grabels	1250
17506	Lamalou-les-Bains	1250
17507	Perols	1250
17508	Peyrens	1250
17509	Tuchan	1250
17510	Larcay	1251
17511	Voutezac	1254
17512	Blois	1255
17513	Romorantin-Lanthenay	1255
17514	Vendome	1255
17515	Andrezieux-Boutheon	1256
17516	Firminy	1256
17517	La Ricamarie	1256
17518	Le Chambon-Feugerolles	1256
17519	Montbrison	1256
17520	Riorges	1256
17521	Rive-de-Gier	1256
17522	Roanne	1256
17523	Roche-la-Moliere	1256
17524	Saint-Chamond	1256
17525	Saint-Etienne	1256
17526	Saint-Just-Saint-Rambert	1256
17527	Bouguenais	1257
17528	Carquefou	1257
17529	Chateaubriant	1257
17530	Coueron	1257
17531	Guerande	1257
17532	La Baule-Escoublac	1257
17533	La Chapelle-sur-Erdre	1257
17534	Nantes	1257
17535	Orvault	1257
17536	Reze	1257
17537	Saint Etienne de Mer Morte	1257
17538	Saint-Herblain	1257
17539	Saint-Nazaire	1257
17540	Saint-Sebastien-sur-Loire	1257
17541	Sainte-Luce-sur-Loire	1257
17542	Vertou	1257
17543	Amilly	1258
17544	Chalette-sur-Loing	1258
17545	Fleury-les-Aubrais	1258
17546	Gien	1258
17547	Montargis	1258
17548	Olivet	1258
17549	Orleans	1258
17550	Pithiviers	1258
17551	Saint-Jean-de-Braye	1258
17552	Saint-Jean-de-la-Ruelle	1258
17553	Saran	1258
17554	Montbronn	1259
17555	Cahors	1260
17556	Figeac	1260
17557	Agen	1261
17558	Le Passage	1261
17559	Marmande	1261
17560	Tonneins	1261
17561	Villeneuve-sur-Lot	1261
17562	Mende	1263
17563	Angers	1264
17564	Avrille	1264
17565	Cholet	1264
17566	Les Ponts-de-Ce	1264
17567	Saint-Barthelemy-dAnjou	1264
17568	Saumur	1264
17569	Torfou	1264
17570	Trelaze	1264
17571	Cherbourg	1265
17572	Coutances	1265
17573	Equeurdreville-Hainneville	1265
17574	Granville	1265
17575	Octeville	1265
17576	Saint-Lo	1265
17577	Tourlaville	1265
17578	Chalons-en-Champagne	1266
17579	Epernay	1266
17580	Reims	1266
17581	Tinqueux	1266
17582	Vitry-le-Francois	1266
17583	Chateau-Gontier	1267
17584	Laval	1267
17585	Mayenne	1267
17586	Montsurs	1267
17587	Dombasle-sur-Meurthe	1268
17588	Jarville-la-Malgrange	1268
17589	Laxou	1268
17590	Longwy	1268
17591	Luneville	1268
17592	Nancy	1268
17593	Pont-a-Mousson	1268
17594	Saint-Max	1268
17595	Toul	1268
17596	Vandoeuvre-les-Nancy	1268
17597	Villers-les-Nancy	1268
17598	Villerupt	1268
17599	Bar-le-Duc	1269
17600	Verdun	1269
17601	Boissezon	1270
17602	Hauterive	1270
17603	Launaguet	1270
17604	Mauleon	1270
17605	Maurens-Scopont	1270
17606	Auray	1271
17607	Guidel	1271
17608	Hennebont	1271
17609	Lanester	1271
17610	Lorient	1271
17611	Ploemeur	1271
17612	Pontivy	1271
17613	Vannes	1271
17614	Amneville	1272
17615	Behren-les-Forbach	1272
17616	Creutzwald	1272
17617	Fameck	1272
17618	Florange	1272
17619	Forbach	1272
17620	Freyming-Merlebach	1272
17621	Hagondange	1272
17622	Hayange	1272
17623	Hombourg-Haut	1272
17624	Maizieres-les-Metz	1272
17625	Marly	1272
17626	Metz	1272
17627	Montigny-les-Metz	1272
17628	Moyeuvre-Grande	1272
17629	Rombas	1272
17630	Saint-Avold	1272
17631	Sarrebourg	1272
17632	Sarreguemines	1272
17633	Stiring-Wendel	1272
17634	Thionville	1272
17635	Uckange	1272
17636	Woippy	1272
17637	Yutz	1272
17638	Cosne-Cours-sur-Loire	1273
17639	Nevers	1273
17640	Varennes-Vauzelles	1273
17641	Aniche	1274
17642	Annoeullin	1274
17643	Anzin	1274
17644	Armentieres	1274
17645	Aulnoye-Aymeries	1274
17646	Bailleul	1274
17647	Bondues	1274
17648	Bruay-sur-lEscaut	1274
17649	Cambrai	1274
17650	Cappelle-la-Grande	1274
17651	Caudry	1274
17652	Comines	1274
17653	Conde-sur-lEscaut	1274
17654	Coudekerque-Branche	1274
17655	Croix	1274
17656	Denain	1274
17657	Douai	1274
17658	Douchy-les-Mines	1274
17659	Dunkerque	1274
17660	Escaudain	1274
17661	Fache-Thumesnil	1274
17662	Fourmies	1274
17663	Grande-Synthe	1274
17664	Graveline	1274
17665	Halluin	1274
17666	Haubourdin	1274
17667	Hautmont	1274
17668	Hazebrouck	1274
17669	Hem	1274
17670	Hulluch	1274
17671	Jeumont	1274
17672	La Madeleine	1274
17673	Lambersart	1274
17674	Leers	1274
17675	Lille	1274
17676	Lomme	1274
17677	Loos	1274
17678	Lys-lez-Lannoy	1274
17679	Marcq-en-Baroeul	1274
17680	Marennes	1274
17681	Marly	1274
17682	Marquette-lez-Lille	1274
17683	Maubeuge	1274
17684	Merville	1274
17685	Mons-en-Baroeul	1274
17686	Mouvaux	1274
17687	Neuville-en-Ferrain	1274
17688	Onnaing	1274
17689	Raismes	1274
17690	Ronchin	1274
17691	Roncq	1274
17692	Roubaix	1274
17693	Saint-Amand-les-Eaux	1274
17694	Saint-Andre-lez-Lille	1274
17695	Saint-Pol-sur-Mer	1274
17696	Saint-Saulve	1274
17697	Seclin	1274
17698	Sin-le-Noble	1274
17699	Somain	1274
17700	Tourcoing	1274
17701	Valenciennes	1274
17702	Vieux-Conde	1274
17703	Villeneuve-dAscq	1274
17704	Wasquehal	1274
17705	Wattignies	1274
17706	Wattrelos	1274
17707	Waziers	1274
17708	Esquelbecq	1275
17709	Beauvais	1276
17710	Chantilly	1276
17711	Clermont	1276
17712	Compiegne	1276
17713	Creil	1276
17714	Crepy-en-Valois	1276
17715	Gouvieux	1276
17716	Meru	1276
17717	Montataire	1276
17718	Nogent-sur-Oise	1276
17719	Noyon	1276
17720	Pont-Sainte-Maxence	1276
17721	Senlis	1276
17722	Alencon	1277
17723	Argentan	1277
17724	Flers	1277
17725	LAigle	1277
17726	Paris	1278
17727	Aire-sur-la-Lys	1279
17728	Arras	1279
17729	Auchel	1279
17730	Avion	1279
17731	Berck	1279
17732	Bethune	1279
17733	Boulogne-sur-Mer	1279
17734	Bruay-la-Brussiere	1279
17735	Bully-les-Mines	1279
17736	Calais	1279
17737	Carvin	1279
17738	Courrieres	1279
17739	Etaples	1279
17740	Harnes	1279
17741	Henin-Beaumont	1279
17742	Le Portel	1279
17743	Lens	1279
17744	Libercourt	1279
17745	Lievin	1279
17746	Lillers	1279
17747	Longuenesse	1279
17748	Marck	1279
17749	Mericourt	1279
17750	Montigny-en-Gohelle	1279
17751	Noeux-les-Mines	1279
17752	Oignies	1279
17753	Outreau	1279
17754	Rouvroy	1279
17755	Saint-Martin-Boulogne	1279
17756	Saint-Omer	1279
17757	Sallaumines	1279
17758	Vendin-le-Vieil	1279
17759	Loiron	1281
17760	Marolles-les-Braults	1281
17761	Mortagne-sur-Sevre	1281
17762	Mouzillon	1281
17763	Noirmoutier-en-lÃƒÂŽle	1281
17764	Friville	1282
17765	Liancourt	1282
17766	Maizy	1282
17767	Oust-Marest	1282
17768	Puiseux-le-Hauberger	1282
17769	Saint-Crepin-Ibouvillers	1282
17770	Aubiere	1283
17771	Beaumont	1283
17772	Chamalieres	1283
17773	Clermont-Ferrand	1283
17774	Cournon-dAuvergne	1283
17775	Gerzat	1283
17776	Issoire	1283
17777	Riom	1283
17778	Thiers	1283
17779	Anglet	1284
17780	Bayonne	1284
17781	Biarritz	1284
17782	Billere	1284
17783	Hendaye	1284
17784	Lons	1284
17785	Oloron-Sainte-Marie	1284
17786	Orthez	1284
17787	Pau	1284
17788	Saint-Jean-de-Luz	1284
17789	Perpignan	1285
17790	Saint-Esteve	1285
17791	Quelmes	1286
17792	Brignais	1287
17793	Bron	1287
17794	Caluire-et-Cuire	1287
17795	Decines-Charpieu	1287
17796	Ecully	1287
17797	Francheville	1287
17798	Genas	1287
17799	Genay	1287
17800	Givors	1287
17801	Lyon	1287
17802	Meyzieu	1287
17803	Mions	1287
17804	Oullins	1287
17805	Pierre-Benite	1287
17806	Rillieux-la-Pape	1287
17807	Saint-Fons	1287
17808	Saint-Genis-Laval	1287
17809	Saint-Priest	1287
17810	Sainte-Foy-les-Lyon	1287
17811	Tarare	1287
17812	Tassin-la-Demi-Lune	1287
17813	Vaulx-en-Velin	1287
17814	Venissieux	1287
17815	Villefranche-sur-Saone	1287
17816	Villeurbanne	1287
17817	Beauvoir-en-Royans	1288
17818	Belley	1288
17819	Bons-en-Chablais	1288
17820	Chalain-dUzore	1288
17821	Chassieu	1288
17822	Chavanod	1288
17823	Chazay-d-Azergues	1288
17824	Chimilin	1288
17825	Civrieux-d Azergues	1288
17826	Corbas	1288
17827	Courzieu	1288
17828	Dardilly	1288
17829	Guereins	1288
17830	Izernore	1288
17831	La Talaudiere	1288
17832	La Tronche	1288
17833	La Verpilliere	1288
17834	Le Cheylard	1288
17835	Le Cheylas	1288
17836	Mery	1288
17837	Moirans	1288
17838	Montalieu-Vercieu	1288
17839	Montmiral	1288
17840	Peronnas	1288
17841	Poncin	1288
17842	Quincie-en-Beaujolais	1288
17843	Saint-Quentin-sur-Isere	1288
17844	Sainte Agathe la Bouteresse	1288
17845	Sainte-Consorce	1288
17846	Sisteron	1288
17847	Trevoux	1288
17848	Villard-Bonnot	1288
17849	Autun	1291
17850	Chalon-sur-Saone	1291
17851	Digoin	1291
17852	Gueugnon	1291
17853	Le Creusot	1291
17854	Macon	1291
17855	Montceau-les-Mines	1291
17856	Paray-le-Monial	1291
17857	Saint-Vallier	1291
17858	Allonnes	1292
17859	La Ferte-Bernard	1292
17860	La Fleche	1292
17861	Le Mans	1292
17862	Sable-sur-Sarthe	1292
17863	Aix-les-Bains	1293
17864	Albertville	1293
17865	Chambery	1293
17866	La Motte-Servolex	1293
17867	Saint-Jean-de-Maurienne	1293
17868	Barentin	1294
17869	Bihorel	1294
17870	Bois-Guillaume	1294
17871	Bolbec	1294
17872	Canteleu	1294
17873	Caudebec-les-Elbeuf	1294
17874	Darnetal	1294
17875	Deville-les-Rouen	1294
17876	Dieppe	1294
17877	Elbeuf	1294
17878	Fecamp	1294
17879	Gonfreville-lOrcher	1294
17880	Grand-Couronne	1294
17881	Harfleur	1294
17882	Le Grand-Quevilly	1294
17883	Le Havre	1294
17884	Le Petit-Quevilly	1294
17885	Lillebonne	1294
17886	Maromme	1294
17887	Mont-Saint-Aignan	1294
17888	Montivilliers	1294
17889	Notre-Dame-de-Gravenchon	1294
17890	Oissel	1294
17891	Rouen	1294
17892	Saint-Etienne-du-Rouvray	1294
17893	Sotteville-les-Rouen	1294
17894	Yvetot	1294
17895	Aubervillers	1295
17896	Aulnay-sous-Bois	1295
17897	Bagnolet	1295
17898	Bobigny	1295
17899	Bondy	1295
17900	Clichy-sous-Bois	1295
17901	Drancy	1295
17902	Epinay-sur-Seine	1295
17903	Gagny	1295
17904	La Courneuve	1295
17905	Le Blanc-Mesnil	1295
17906	Le Bourget	1295
17907	Le Pre-Saint-Gervais	1295
17908	Le Raincy	1295
17909	Les Lilas	1295
17910	Les Pavillons-sous-Bois	1295
17911	Livry-Gargan	1295
17912	Montfermeil	1295
17913	Montreuil	1295
17914	Neuilly-Plaisance	1295
17915	Neuilly-sur-Marne	1295
17916	Noisy-le-Grand	1295
17917	Noisy-le-Sec	1295
17918	Pantin	1295
17919	Pierrefitte-sur-Seine	1295
17920	Romainville	1295
17921	Rosny-sous-Bois	1295
17922	Saint-Denis	1295
17923	Saint-Ouen	1295
17924	Sevran	1295
17925	Stains	1295
17926	Tremblay-en-France	1295
17927	Villemomble	1295
17928	Villepinte	1295
17929	Villetaneuse	1295
17930	Avon	1296
17931	Brie-Comte-Robert	1296
17932	Champs-sur-Marne	1296
17933	Chelles	1296
17934	Claye-Souilly	1296
17935	Combs-la-Ville	1296
17936	Coulommiers	1296
17937	Dammarie-les-Lys	1296
17938	Fontainebleau	1296
17939	Lagny-sur-Marne	1296
17940	Le Mee-sur-Seine	1296
17941	Lognes	1296
17942	Meaux	1296
17943	Melun	1296
17944	Mitry-Mory	1296
17945	Moissy-Cramayel	1296
17946	Montereau-Fault-Yonne	1296
17947	Nemours	1296
17948	Noisiel	1296
17949	Ozoir-la-Ferriere	1296
17950	Pontault-Combault	1296
17951	Provins	1296
17952	Roissy-en-Brie	1296
17953	Saint-Fargeau-Ponthierry	1296
17954	Savigny-le-Temple	1296
17955	Torcy	1296
17956	Vaires-sur-Marne	1296
17957	Veneux	1296
17958	Villeparisis	1296
17959	Abbeville	1297
17960	Albert	1297
17961	Amiens	1297
17962	Souvans	1299
17963	Albi	1300
17964	Carmaux	1300
17965	Castres	1300
17966	Gaillac	1300
17967	Graulhet	1300
17968	Mazamet	1300
17969	Castelsarassin	1301
17970	Moissac	1301
17971	Montauban	1301
17972	Chamberet	1303
17973	Argenteuil	1305
17974	Arnouville-les-Gonesse	1305
17975	Beauchamps	1305
17976	Bezons	1305
17977	Cergy	1305
17978	Cormeilles-en-Parisis	1305
17979	Deuil-la-Barre	1305
17980	Domont	1305
17981	Eaubonne	1305
17982	Enghien-les-Bains	1305
17983	Eragny	1305
17984	Ermont	1305
17985	Ezanville	1305
17986	Fosses	1305
17987	Franconville	1305
17988	Garges-les-Gonesse	1305
17989	Gonesse	1305
17990	Goussainville	1305
17991	Herblay	1305
17992	Jouy-le-Moutier	1305
17993	LIsle-Adam	1305
17994	Montigny-les-Cormeilles	1305
17995	Montmagny	1305
17996	Montmorency	1305
17997	Osny	1305
17998	Persan	1305
17999	Pontoise	1305
18000	Saint-Brice-sous-Foret	1305
18001	Saint-Gratien	1305
18002	Saint-Leu-la-Foret	1305
18003	Saint-Ouen-lAumone	1305
18004	Sannois	1305
18005	Sarcelles	1305
18006	Soisy-sous-Montmorency	1305
18007	Taverny	1305
18008	Vaureal	1305
18009	Villiers-le-Bel	1305
18010	Alfortville	1306
18011	Arcueil	1306
18012	Boissy-Saint-Leger	1306
18013	Bonneuil	1306
18014	Bry-sur-Marne	1306
18015	Cachan	1306
18016	Champigny-sur-Marne	1306
18017	Charenton-le-Pont	1306
18018	Chennevieres-sur-Marne	1306
18019	Chevilly-Larue	1306
18020	Choisy-le-Roi	1306
18021	Creteil	1306
18022	Fontenay-sous-Bois	1306
18023	Fresnes	1306
18024	Gentilly	1306
18025	Ivry-sur-Seine	1306
18026	Joinville-le-Pont	1306
18027	LHay-les-Roses	1306
18028	La Queue-en-Brie	1306
18029	Le Kremlin-Bicetre	1306
18030	Le Perreux-sur-Marne	1306
18031	Le Plessis-Trevise	1306
18032	Limeil-Brevannes	1306
18033	Maisons-Alfort	1306
18034	Nogent-sur-Marne	1306
18035	Orly	1306
18036	Ormesson-sur-Marne	1306
18037	Saint-Mande	1306
18038	Saint-Maur-des-Fosses	1306
18039	Saint-Maurice	1306
18040	Sucy-en-Brie	1306
18041	Thiais	1306
18042	Valenton	1306
18043	Villejuif	1306
18044	Villeneuve-Saint-Georges	1306
18045	Villeneuve-le-Roi	1306
18046	Villiers-sur-Marne	1306
18047	Vincennes	1306
18048	Vitry-sur-Seine	1306
18049	Brignoles	1307
18050	Draguignan	1307
18051	Frejus	1307
18052	Hyeres	1307
18053	La Crau	1307
18054	La Garde	1307
18055	La Seyne-sur-Mer	1307
18056	La Valette-du-Var	1307
18057	Le Pradet	1307
18058	Ollioules	1307
18059	Roquebrune-sur-Argens	1307
18060	Saint-Maximin-la-Sainte-Baume	1307
18061	Saint-Raphael	1307
18062	Sainte-Maxime	1307
18063	Sanary-sur-Mer	1307
18064	Six-Fours-les-Plages	1307
18065	Sollies-Pont	1307
18066	Toulon	1307
18067	Apt	1308
18068	Avignon	1308
18069	Bollene	1308
18070	Carpentras	1308
18071	Cavaillon	1308
18072	LIsle-sur-la-Sorgue	1308
18073	Le Pontet	1308
18074	Orange	1308
18075	Pertuis	1308
18076	Sorgues	1308
18077	Valreas	1308
18078	Vellise	1309
18079	Challans	1310
18080	Chateau-dOlonne	1310
18081	Fontenay-le-Comte	1310
18082	La Chasnis	1310
18083	La Roche-sur-Yon	1310
18084	Les Herbiers	1310
18085	Les Sables-dOlonne	1310
18086	Longeville-sur-Mer	1310
18087	Chatellerault	1311
18088	Poitiers	1311
18089	Epinal	1312
18090	Gerardmer	1312
18091	Remiremont	1312
18092	Saint-Die	1312
18093	Auxerre	1313
18094	Avallon	1313
18095	Joigny	1313
18096	Sens	1313
18097	Acheres	1314
18098	Andresy	1314
18099	Aubergenville	1314
18100	Bois-dArcy	1314
18101	Carrieres-sous-Poissy	1314
18102	Carrieres-sur-Seine	1314
18103	Chanteloup-les-Vignes	1314
18104	Chatou	1314
18105	Conflans-Sainte-Honorine	1314
18106	Croissy-sur-Seine	1314
18107	Elancourt	1314
18108	Fontenay-le-Fleury	1314
18109	Guyancourt	1314
18110	Houilles	1314
18111	La Celle-Saint-Cloud	1314
18112	Le Chesnay	1314
18113	Le Pecq	1314
18114	Le Vesinet	1314
18115	Les Clayes-sous-Bois	1314
18116	Les Mureaux	1314
18117	Limay	1314
18118	Maisons-Laffitte	1314
18119	Mantes-la-Jolie	1314
18120	Mantes-la-Ville	1314
18121	Marly-le-Roi	1314
18122	Maurepas	1314
18123	Montesson	1314
18124	Montigny-le-Bretonneux	1314
18125	Plaisir	1314
18126	Poissy	1314
18127	Rambouillet	1314
18128	Saint-Cyr-lEcole	1314
18129	Saint-Germain-en-Laye	1314
18130	Sartrouville	1314
18131	Trappes	1314
18132	Triel-sur-Seine	1314
18133	Velizy-Villacoublay	1314
18134	Verneuil-sur-Seine	1314
18135	Versailles	1314
18136	Viroflay	1314
18137	Voisins-le-Bretonneux	1314
18138	Camopi	1315
18139	Cayenne	1315
18140	Iracoubo	1315
18141	Kourou	1315
18142	Macouria	1315
18143	Matoury	1315
18144	Remire-Montjoly	1315
18145	Roura	1315
18146	Saint-Georges	1315
18147	Sinnamary	1315
18148	Apatou	1316
18149	Grand-Santi	1316
18150	Mana	1316
18151	Maripasoula	1316
18152	Saint-Laurent-du-Maroni	1316
18153	Atuona	1319
18154	Fatu-Hiva	1319
18155	Hakahao	1319
18156	Hakamaii	1319
18157	Hatiheu	1319
18158	Tahuata	1319
18159	Taiohae	1319
18160	Taipivai	1319
18161	Ua-Huka	1319
18162	Ahe	1320
18163	Amanu	1320
18164	Anaa	1320
18165	Apataki	1320
18166	Arutua	1320
18167	Faaite	1320
18168	Fakahima	1320
18169	Fakarava	1320
18170	Fangatau	1320
18171	Hao	1320
18172	Hereheretue	1320
18173	Hikueru	1320
18174	Katiu	1320
18175	Kauehi	1320
18176	Kaukura	1320
18177	Makatea	1320
18178	Makemo	1320
18179	Manihi	1320
18180	Marokau	1320
18181	Napuka	1320
18182	Niau	1320
18183	Nukutavake	1320
18184	Puamau	1320
18185	Pukapuka	1320
18186	Pukarua	1320
18187	Rangiroa	1320
18188	Raroia	1320
18189	Reao	1320
18190	Rikitea	1320
18191	Taenga	1320
18192	Takapoto	1320
18193	Takaroa	1320
18194	Tatakoto	1320
18195	Tepoto	1320
18196	Tikehau	1320
18197	Tureia	1320
18198	Vahitahi	1320
18199	Vairaatea	1320
18200	Amaru	1321
18201	Anapoto	1321
18202	Anatonu	1321
18203	Auti	1321
18204	Avera	1321
18205	Mahu	1321
18206	Mataura	1321
18207	Moerai	1321
18208	Mutuaura	1321
18209	Rairua	1321
18210	Rapa	1321
18211	Taahuaia	1321
18212	Vaiuru	1321
18213	Martin-de-Vivies	1322
18214	Port-aux-Francais	1324
18215	Cocobeach	1325
18216	Kango	1325
18217	Libreville	1325
18218	Nkan	1325
18219	Ntoum	1325
18220	Lekoni	1326
18221	Masuku	1326
18222	Moanda	1326
18223	Mounana	1326
18224	Okandja	1326
18225	Lambarene	1327
18226	Ndjole	1327
18227	Fougamou	1328
18228	Mbigou	1328
18229	Mimongo	1328
18230	Mouila	1328
18231	Ndende	1328
18232	Mayumba	1329
18233	Tchibanga	1329
18234	Tsogni	1329
18235	Booue	1330
18236	Makokou	1330
18237	Mekambo	1330
18238	Koulamoutou	1331
18239	Lastoursville	1331
18240	Gamba	1332
18241	Omboue	1332
18242	Port-Gentil	1332
18243	Sette Cama	1332
18244	Bitam	1333
18245	Lalara	1333
18246	Medouneu	1333
18247	Minvoul	1333
18248	Mitzic	1333
18249	Oyem	1333
18250	Banjul	1334
18251	Basse	1335
18252	Gambissara	1335
18253	Sabi	1335
18254	Salikeni	1335
18255	Brikama	1336
18256	Brufut	1336
18257	Gunjur	1336
18258	Sukuta	1336
18259	Bansang	1337
18260	Janjanbureh	1337
18261	Bakau	1338
18262	Serekunda	1338
18263	Barra	1339
18264	Essau	1339
18265	Farafenni	1339
18266	Kerewan	1339
18267	Lamin	1339
18268	Kuntaur	1340
18269	Mansakonko	1341
18270	Ahali Atoni	1342
18271	Bihvinta	1342
18272	Gagra	1342
18273	Gali	1342
18274	Gudauta	1342
18275	Gulripshi	1342
18276	Ochamchira	1342
18277	Suhumi	1342
18278	Tkvarcheli	1342
18279	Batumi	1343
18280	Dioknisi	1343
18281	Kobuleti	1343
18282	Mahindzhauri	1343
18283	Lanchhuti	1344
18284	Ozurgeti	1344
18285	Bagdadi	1345
18286	Chaltubo	1345
18287	Chiatura	1345
18288	Honi	1345
18289	Kutaisi	1345
18290	Sachhere	1345
18291	Samtredia	1345
18292	Terzhola	1345
18293	Tkibuli	1345
18294	Vani	1345
18295	Zestaponi	1345
18296	Ahmeta	1346
18297	Cnori	1346
18298	Dedoplisckaro	1346
18299	Gurdzhaani	1346
18300	Kvareli	1346
18301	Lagodehi	1346
18302	Sagaredzho	1346
18303	Signahi	1346
18304	Telavi	1346
18305	Dusheti	1348
18306	Mcheta	1348
18307	Ambrolauri	1349
18308	Cageri	1349
18309	Oni	1349
18310	Ahalcihe	1351
18311	Ahalkalaki	1351
18312	Borzhomi	1351
18313	Ninocminda	1351
18314	Vale	1351
18315	Tbilisi	1353
18316	Aalen	1355
18317	Achern	1355
18318	Aichtal	1355
18319	Albstadt	1355
18320	Aldingen	1355
18321	Allmersbach	1355
18322	Alpirsbach	1355
18323	Altensteig	1355
18324	Altlussheim	1355
18325	Ammerbuch	1355
18326	Appenweier	1355
18327	Asperg	1355
18328	Backnang	1355
18329	Bad Durrheim	1355
18330	Bad Friedrichshall	1355
18331	Bad Krozingen	1355
18332	Bad Liebenzell	1355
18333	Bad Mergentheim	1355
18334	Bad Rappenau	1355
18335	Bad Sackingen	1355
18336	Bad Schonborn	1355
18337	Bad Urach	1355
18338	Bad Waldsee	1355
18339	Bad Wurzach	1355
18340	Baden-Baden	1355
18341	Bahlingen	1355
18342	Baiersbronn	1355
18343	Balgheim	1355
18344	Balingen	1355
18345	Ballrechten-Dottingen	1355
18346	Besigheim	1355
18347	Biberach	1355
18348	Bietigheim-Bissingen	1355
18349	Binzen	1355
18350	Birkenfeld	1355
18351	Bisingen	1355
18352	Bitz	1355
18353	Blaubeuren	1355
18354	Blaustein	1355
18355	Blumberg	1355
18356	Boblingen	1355
18357	Bodelshausen	1355
18358	Bonndorf	1355
18359	Bonnigheim	1355
18360	Bopfingen	1355
18361	Bottingen	1355
18362	Brackenheim	1355
18363	Breisach	1355
18364	Bretten	1355
18365	Bretzfeld	1355
18366	Bruchsal	1355
18367	Bruhl	1355
18368	Buchen	1355
18369	Buchenbach	1355
18370	Buhl	1355
18371	Burgstetten	1355
18372	Burladingen	1355
18373	Calw	1355
18374	Crailsheim	1355
18375	Denkendorf	1355
18376	Denzlingen	1355
18377	Dettingen	1355
18378	Dietenheim	1355
18379	Ditzingen	1355
18380	Donaueschingen	1355
18381	Donzdorf	1355
18382	Dornhan	1355
18383	Dornstadt	1355
18384	Dornstetten	1355
18385	Dossenheim	1355
18386	Durbheim	1355
18387	Durmersheim	1355
18388	Eberbach	1355
18389	Ebersbach	1355
18390	Edingen	1355
18391	Edingen-Neckarhausen	1355
18392	Eggenstein-Leopoldshafen	1355
18393	Ehingen	1355
18394	Eislingen	1355
18395	Ellhofen	1355
18396	Ellwangen	1355
18397	Emmendingen	1355
18398	Emmingen-Liptingen	1355
18399	Engen	1355
18400	Eningen	1355
18401	Eppelheim	1355
18402	Eppingen	1355
18403	Erbach	1355
18404	Eriskirch	1355
18405	Eschach	1355
18406	Esslingen	1355
18407	Ettenheim	1355
18408	Ettlingen	1355
18409	Fellbach	1355
18410	Filderstadt	1355
18411	Freiberg	1355
18412	Freiburg	1355
18413	Freudenstadt	1355
18414	Frickenhausen	1355
18415	Fridingen	1355
18416	Friedrichshafen	1355
18417	Friesenheim	1355
18418	Frittlingen	1355
18419	Furtwangen	1355
18420	Gaggenau	1355
18421	Gaildorf	1355
18422	Gartringen	1355
18423	Gaufelden	1355
18424	Geislingen	1355
18425	Gengenbach	1355
18426	Gerlingen	1355
18427	Gernsbach	1355
18428	Gerstetten	1355
18429	Giengen	1355
18430	Goppingen	1355
18431	Gottmadingen	1355
18432	Graben-Neudorf	1355
18433	Grafenberg	1355
18434	Grafenhausen	1355
18435	Grenzach-Wyhlen	1355
18436	GroBbettlingen	1355
18437	Grunkraut	1355
18438	Gschwend	1355
18439	Guglingen	1355
18440	Gundelfingen	1355
18441	Gutach	1355
18442	Haigerloch	1355
18443	Haiterbach	1355
18444	Harmersabch	1355
18445	Hausach	1355
18446	Hechingen	1355
18447	Heddesheim	1355
18448	Heidelberg	1355
18449	Heidenheim	1355
18450	Heilbronn	1355
18451	Hemsbach	1355
18452	Herbrechtingen	1355
18453	Herrenberg	1355
18454	Heubach	1355
18455	Hirschberg	1355
18456	Hockenheim	1355
18457	Holzgerlingen	1355
18458	Horb	1355
18459	Hufingen	1355
18460	Huttlingen	1355
18461	Isny	1355
18462	Ispringen	1355
18463	Jungingen	1355
18464	Karlsbad	1355
18465	Karlsruhe	1355
18466	Kehl	1355
18467	Kernen	1355
18468	Ketsch	1355
18469	Kieselbronn	1355
18470	Kirchberg an der Jagst	1355
18471	Kirchheim	1355
18472	Kirchzarten	1355
18473	Kisslegg	1355
18474	Klettgau	1355
18475	Kongen	1355
18476	Konigsbach-Stein	1355
18477	Konigsbronn	1355
18478	Konstanz	1355
18479	Korb	1355
18480	Korntal-Munchingen	1355
18481	Kornwestheim	1355
18482	Kraichtal	1355
18483	Kressbronn an Bodensee	1355
18484	Kronau	1355
18485	Kuessaberg	1355
18486	Kunzelsau	1355
18487	Ladenburg	1355
18488	Lahr	1355
18489	Laichingen	1355
18490	Langenau	1355
18491	Lauda-Konigshofen	1355
18492	Lauffen	1355
18493	Laupheim	1355
18494	Leimen	1355
18495	Leinfelden-Echterdingen	1355
18496	Leingarten	1355
18497	Lenningen	1355
18498	Lenzkirch	1355
18499	Leonberg	1355
18500	Leutenbach	1355
18501	Leutkirch	1355
18502	Lichtenstein	1355
18503	Linkenheim-Hochstetten	1355
18504	Lorch	1355
18505	Lorrach	1355
18506	Ludwigsburg	1355
18507	Malsch	1355
18508	Mannheim	1355
18509	Marbach	1355
18510	Markdorf	1355
18511	Markgroningen	1355
18512	Maulburg	1355
18513	MeBstetten	1355
18514	Meckenbeuren	1355
18515	Meckesheim	1355
18516	Meersburg	1355
18517	Mengen	1355
18518	Metzingen	1355
18519	Mockmuhl	1355
18520	Moglingen	1355
18521	Monsheim	1355
18522	Mosbach	1355
18523	Mossingen	1355
18524	Muhlacker	1355
18525	Mullheim	1355
18526	Munsingen	1355
18527	Murrhardt	1355
18528	Nagold	1355
18529	Neckargemund	1355
18530	Neckarsulm	1355
18531	Neresheim	1355
18532	Neuenburg	1355
18533	Neuhausen	1355
18534	Niederstetten	1355
18535	Niefern-Oschelbronn	1355
18536	NuBloch	1355
18537	Nurtingen	1355
18538	Oberhausen-Rheinhausen	1355
18539	Oberkirch	1355
18540	Oberndorf	1355
18541	Oberstenfeld	1355
18542	Obersulm	1355
18543	Ochsenhausen	1355
18544	Offenburg	1355
18545	Ofterdingen	1355
18546	Oftersheim	1355
18547	Oggelshausen	1355
18548	Ohringen	1355
18549	Olbronn-Durrn	1355
18550	Oppenweiler	1355
18551	Ostfildern	1355
18552	Ostringen	1355
18553	Otisheim	1355
18554	Pfalzgrafenweiler	1355
18555	Pfinztal	1355
18556	Pforzheim	1355
18557	Pfullendorf	1355
18558	Pfullingen	1355
18559	Philippsburg	1355
18560	Plankstadt	1355
18561	Pleidelsheim	1355
18562	Pliezhausen	1355
18563	Plochingen	1355
18564	Pluderhausen	1355
18565	Radolfzell	1355
18566	Rastatt	1355
18567	Ravensburg	1355
18568	Reilingen	1355
18569	Remchingen	1355
18570	Remseck	1355
18571	Remshalden	1355
18572	Renchen	1355
18573	Renningen	1355
18574	Reutlingen	1355
18575	Rheinau	1355
18576	Rheinfelden	1355
18577	Rheinmunster	1355
18578	Rheinstetten	1355
18579	Riederich	1355
18580	Riedlingen	1355
18581	Rielasingen-Worblingen	1355
18582	Rosenfeld	1355
18583	Rottenburg	1355
18584	Rottweil	1355
18585	Rudersberg	1355
18586	Rutesheim	1355
18587	Sachsenheim	1355
18588	Salem	1355
18589	Sandhausen	1355
18590	Sankt Georgen	1355
18591	Sankt Leon-Rot	1355
18592	Saulgau	1355
18593	Scheer	1355
18594	Schlierbach	1355
18595	Schonaich	1355
18596	Schopfheim	1355
18597	Schorndorf	1355
18598	Schramberg	1355
18599	Schriesheim	1355
18600	Schwabisch Gmund	1355
18601	Schwabisch Hall	1355
18602	Schwaigern	1355
18603	Schwetzingen	1355
18604	Schwieberdingen	1355
18605	Seitingen-Oberflacht	1355
18606	Sexau	1355
18607	Sigmaringen	1355
18608	Sindelfingen	1355
18609	Singen	1355
18610	Sinsheim	1355
18611	Sinzheim	1355
18612	Sonnenbuhl	1355
18613	Sontheim	1355
18614	Spaichingen	1355
18615	Stegen	1355
18616	Steinen	1355
18617	Steinheim	1355
18618	Steinmauern	1355
18619	Stockach	1355
18620	Straubenhardt	1355
18621	Stutensee	1355
18622	Stuttgart	1355
18623	SuBen	1355
18624	Sulz	1355
18625	Sulzfeld	1355
18626	Tamm	1355
18627	Tauberbischofsheim	1355
18628	Teningen	1355
18629	Tettnang	1355
18630	Titisee-Neustadt	1355
18631	Trossingen	1355
18632	Tubingen	1355
18633	Tuningen	1355
18634	Tuttlingen	1355
18635	Uberlingen	1355
18636	Ubstadt-Weiher	1355
18637	Uhingen	1355
18638	Ulm	1355
18639	Umkirch	1355
18640	Vaihingen	1355
18641	Villingen-Schwenningen	1355
18642	Villingendorf	1355
18643	Waghausel	1355
18644	Waiblingen	1355
18645	Waldbronn	1355
18646	Waldkirch	1355
18647	Waldlaubersheim	1355
18648	Waldshut-Tiengen	1355
18649	Walldorf	1355
18650	Walldurn	1355
18651	Walzbachtal	1355
18652	Wangen	1355
18653	Wehr	1355
18654	Weikersheim	1355
18655	Weil	1355
18656	Weil am Rhein	1355
18657	Weil der Stadt	1355
18658	Weil im Schonbuch	1355
18659	Weilheim	1355
18660	Weingarten	1355
18661	Weinheim	1355
18662	Weinsberg	1355
18663	Weinstadt	1355
18664	Wellendingen	1355
18665	Welzheim	1355
18666	Wendlingen	1355
18667	Wernau	1355
18668	Wertheim	1355
18669	Wiesloch	1355
18670	Wildbad	1355
18671	Wildberg	1355
18672	Winnenden	1355
18673	Wolpertshausen	1355
18674	Zuzenhausen	1355
18675	Ahorn	1356
18676	Allershausen	1356
18677	Attenhofen	1356
18678	Bad Birnbach	1356
18679	Bad Endorf	1356
18680	Bad Gronenbach	1356
18681	Barbing	1356
18682	Benediktbeuern	1356
18683	Breitenberg	1356
18684	Bruckberg	1356
18685	Brunnthal	1356
18686	Burgheim	1356
18687	Chiemsee	1356
18688	Emersacker	1356
18689	Eresing	1356
18690	Fahrenzhausen	1356
18691	Faulbach	1356
18692	Finning	1356
18693	Forstinning	1356
18694	Georgensgmund	1356
18695	Haldenwang	1356
18696	Heideck	1356
18697	Heimenkirch	1356
18698	Hergensweiler	1356
18699	Hirschau	1356
18700	Iffeldorf	1356
18701	Karlstein	1356
18702	Kleinheubach	1356
18703	Kleinwallstadt	1356
18704	Kotz	1356
18705	Krailling	1356
18706	Langenbach	1356
18707	Laudenbach	1356
18708	Leutershausen	1356
18709	Mammendorf	1356
18710	Mombris	1356
18711	Munnerstadt	1356
18712	Neu-Ulm	1356
18713	Niederlauer	1356
18714	Obernburg	1356
18715	Oberpfaffenhofen	1356
18716	Ostallgau	1356
18717	Prittriching	1356
18718	Prutting	1356
18719	Pullach	1356
18720	Putzbrunn	1356
18721	Randersacker	1356
18722	Rednitzhembach	1356
18723	Ronsberg	1356
18724	Ruckersdorf	1356
18725	Schaufling	1356
18726	Schonberg	1356
18727	Seefeld	1356
18728	Sengenthal	1356
18729	Sondheim v.d.Rhon	1356
18730	Steinwiesen	1356
18731	Stockheim	1356
18732	Tagmersheim	1356
18733	Uettingen	1356
18734	Unterfohring	1356
18735	Weibensberg	1356
18736	Wiesthal	1356
18737	Wildflecken	1356
18738	Wolfertschwenden	1356
18739	Zorneding	1356
18740	Abensberg	1357
18741	Aichach	1357
18742	Ainring	1357
18743	Altdorf	1357
18744	Altotting	1357
18745	Altusried	1357
18746	Alzenau	1357
18747	Amberg	1357
18748	Amerang	1357
18749	Ansbach	1357
18750	Aschaffenburg	1357
18751	Augsburg	1357
18752	Bad Aibling	1357
18753	Bad Kissingen	1357
18754	Bad Neustadt	1357
18755	Bad Reichenhall	1357
18756	Bad Tolz	1357
18757	Bad Windsheim	1357
18758	Bad Worishofen	1357
18759	Bamberg	1357
18760	Bayreuth	1357
18761	Bobingen	1357
18762	Bogen	1357
18763	Bruckmuhl	1357
18764	Buchloe	1357
18765	Burghausen	1357
18766	Burgkirchen	1357
18767	Burglengenfeld	1357
18768	Burgthann	1357
18769	Buttenheim	1357
18770	Cadolzburg	1357
18771	Castell	1357
18772	Cham	1357
18773	Coburg	1357
18774	Dachau	1357
18775	Deggendorf	1357
18776	DieBen	1357
18777	Diedorf	1357
18778	Dietmannsried	1357
18779	Dietramszell	1357
18780	Dillingen	1357
18781	Dingolfing	1357
18782	Dinkelsbuhl	1357
18783	Dombuhl	1357
18784	Donauworth	1357
18785	Dorfen	1357
18786	Ebersberg	1357
18787	Eching	1357
18788	Eckental	1357
18789	Eggenfelden	1357
18790	Eichenau	1357
18791	Eichstatt	1357
18792	Elchingen	1357
18793	Erding	1357
18794	Ergolding	1357
18795	Erlangen	1357
18796	Erlenbach	1357
18797	Essenbach	1357
18798	Feldafing	1357
18799	Feldkirchen-Westerham	1357
18800	Feucht	1357
18801	Feuchtwangen	1357
18802	Forchheim	1357
18803	Freilassing	1357
18804	Freising	1357
18805	Fridolfing	1357
18806	Friedberg	1357
18807	Furstenfeldbruck	1357
18808	Furth	1357
18809	Furth im Wald	1357
18810	Fussen	1357
18811	Gachenbach	1357
18812	Gaimersheim	1357
18813	Garching	1357
18814	Garmisch-Partenkirchen	1357
18815	Gauting	1357
18816	Gemunden	1357
18817	Geretsried	1357
18818	Germering	1357
18819	Gersthofen	1357
18820	Gilching	1357
18821	Goldbach	1357
18822	Grafelfing	1357
18823	Grafenau	1357
18824	Grafing	1357
18825	GroBostheim	1357
18826	Grobenstadt	1357
18827	Grobenzell	1357
18828	Grunwald	1357
18829	Gunzburg	1357
18830	Gunzenhausen	1357
18831	HaBfurt	1357
18832	Haar	1357
18833	Hammelburg	1357
18834	Hasloch	1357
18835	Hauzenberg	1357
18836	Helmbrechts	1357
18837	Henfenfeld	1357
18838	Hersbruck	1357
18839	Herzogenaurach	1357
18840	Hilpoltstein	1357
18841	Hirschaid	1357
18842	Hochstadt	1357
18843	Hof	1357
18844	Holzkirchen	1357
18845	Hosbach	1357
18846	Illertissen	1357
18847	Immenstadt	1357
18848	Ingolstadt	1357
18849	Inning	1357
18850	Ismaning	1357
18851	Karlsfeld	1357
18852	Karlstadt	1357
18853	Kaufbeuren	1357
18854	Kelheim	1357
18855	Kempten	1357
18856	Kiefersfelden	1357
18857	Kirchheim	1357
18858	Kissing	1357
18859	Kitzingen	1357
18860	Kleinostheim	1357
18861	Klingenberg	1357
18862	Kolbermoor	1357
18863	Konigsbrunn	1357
18864	Kreuzwertheim	1357
18865	Kronach	1357
18866	Krumbach	1357
18867	Kulmbach	1357
18868	Kummersbruck	1357
18869	Landau	1357
18870	Landsberg	1357
18871	Landshut	1357
18872	Langenzenn	1357
18873	Lappersdorf	1357
18874	Lauf	1357
18875	Lauingen	1357
18876	Leinburg	1357
18877	Lenggries	1357
18878	Lichtenfels	1357
18879	Lindach	1357
18880	Lindau	1357
18881	Lindenberg	1357
18882	Lohr	1357
18883	Mainburg	1357
18884	Maisach	1357
18885	Manching	1357
18886	Markt Schwaben	1357
18887	Marktheidenfeld	1357
18888	Marktoberdorf	1357
18889	Marktredwitz	1357
18890	Maxhutte-Haidhof	1357
18891	Meitingen	1357
18892	Memmingen	1357
18893	Mering	1357
18894	Miesbach	1357
18895	Miltenberg	1357
18896	Mindelheim	1357
18897	Moosburg	1357
18898	Muhldorf	1357
18899	Munchberg	1357
18900	Munchen	1357
18901	Munningen	1357
18902	Murnau	1357
18903	Naila	1357
18904	Neubiberg	1357
18905	Neuburg	1357
18906	Neufahrn	1357
18907	Neumarkt	1357
18908	Neuried	1357
18909	NeusaB	1357
18910	Neustadt	1357
18911	Neutraubling	1357
18912	Nordlingen	1357
18913	Nuremberg	1357
18914	Nurnberg	1357
18915	Oberasbach	1357
18916	Oberhaching	1357
18917	OberschleiBheim	1357
18918	Oberstdorf	1357
18919	Ochsenfurt	1357
18920	Olching	1357
18921	Osterhofen	1357
18922	Ostheim	1357
18923	Ottobrunn	1357
18924	Parsberg	1357
18925	Passau	1357
18926	Pegnitz	1357
18927	PeiBenberg	1357
18928	Peiting	1357
18929	Pentling	1357
18930	Penzberg	1357
18931	Pfaffenhofen	1357
18932	Pfarrkirchen	1357
18933	Planegg	1357
18934	Plattling	1357
18935	Pocking	1357
18936	Poing	1357
18937	Polling	1357
18938	Pommelsbrunn	1357
18939	Prien	1357
18940	Puchheim	1357
18941	Rannersdorf	1357
18942	Raubling	1357
18943	Regen	1357
18944	Regensburg	1357
18945	Regenstauf	1357
18946	Rehau	1357
18947	Rodental	1357
18948	Roding	1357
18949	Rosenheim	1357
18950	Roth	1357
18951	Rothenbach	1357
18952	Rothenburg	1357
18953	Ruhstorf	1357
18954	Schnelldorf	1357
18955	Schongau	1357
18956	Schrobenhausen	1357
18957	Schwabach	1357
18958	Schwabmunchen	1357
18959	Schwandorf	1357
18960	Schwarzenbach	1357
18961	Schweinfurt	1357
18962	Selb	1357
18963	Selbitz	1357
18964	Senden	1357
18965	Simbach	1357
18966	Sonthofen	1357
18967	Spalt	1357
18968	Stadtbergen	1357
18969	Staffelstein	1357
18970	Starnberg	1357
18971	Stein	1357
18972	Stephanskirchen	1357
18973	Straubing	1357
18974	Sulzbach-Rosenberg	1357
18975	Taufkirchen	1357
18976	Thansau	1357
18977	Tirschenreuth	1357
18978	Toging	1357
18979	Traunreut	1357
18980	Traunstein	1357
18981	Treuchtlingen	1357
18982	Trostberg	1357
18983	Tutzing	1357
18984	Unterbergen	1357
18985	Unterhaching	1357
18986	UnterschleiBheim	1357
18987	Valley	1357
18988	Vaterstetten	1357
18989	Veitshochheim	1357
18990	Viechtach	1357
18991	Vilgertshofen	1357
18992	Vilsbiburg	1357
18993	Vilshofen	1357
18994	Vohringen	1357
18995	Volkach	1357
18996	Waldkirchen	1357
18997	Waldkraiburg	1357
18998	Walkertshofen	1357
18999	Wasserburg	1357
19000	WeiBenburg	1357
19001	WeiBenhorn	1357
19002	Weiden	1357
19003	Weidenberg	1357
19004	Weilheim	1357
19005	Wendelstein	1357
19006	Werneck	1357
19007	Wessling	1357
19008	Wolfratshausen	1357
19009	Wolnzach	1357
19010	Wunsiedel	1357
19011	Wurzburg	1357
19012	Zirndorf	1357
19013	Zwiesel	1357
19014	Berlin	1359
19015	Panketal	1359
19016	Steinfeld	1359
19017	Angermunde	1360
19018	Bad Freienwalde	1360
19019	Bad Liebenwerda	1360
19020	Barnim	1360
19021	Beeskow	1360
19022	Bernau	1360
19023	Blankenfelde	1360
19024	Brandenburg	1360
19025	Brieselang	1360
19026	Cottbus	1360
19027	Dahlewitz	1360
19028	Dahme	1360
19029	Eberswalde	1360
19030	Eisenhuttenstadt	1360
19031	Elsterwerda	1360
19032	Erkner	1360
19033	Falkensee	1360
19034	Finsterwalde	1360
19035	Forst	1360
19036	Frankfurt	1360
19037	Fredersdorf-Vogelsdorf	1360
19038	Furstenwalde	1360
19039	Glienicke	1360
19040	Gransee	1360
19041	GroBraschen	1360
19042	Guben	1360
19043	Heidesee	1360
19044	Hennigsdorf	1360
19045	Herzberg	1360
19046	Hohen Neuendorf	1360
19047	Jacobsdorf	1360
19048	Juterbog	1360
19049	Kleinmachnow	1360
19050	Kolkwitz	1360
19051	Konigs Wusterhausen	1360
19052	Kyritz	1360
19053	Lauchhammer	1360
19054	Lubben	1360
19055	Lubbenau	1360
19056	Luckenwalde	1360
19057	Ludwigsfelde	1360
19058	Nauen	1360
19059	Neuenhagen	1360
19060	Neuruppin	1360
19061	Oranienburg	1360
19062	Perleberg	1360
19063	Petershagen-Eggersdorf	1360
19064	Potsdam	1360
19065	Premnitz	1360
19066	Prenzlau	1360
19067	Pritzwalk	1360
19068	Rathenow	1360
19069	Rudersdorf	1360
19070	Schonefeld	1360
19071	Schoneiche	1360
19072	Schwedt	1360
19073	Schwielowsee	1360
19074	Senftenberg	1360
19075	Spremberg	1360
19076	Strausberg	1360
19077	Teltow	1360
19078	Templin	1360
19079	Velten	1360
19080	Werder	1360
19081	Wildau	1360
19082	Wittenberge	1360
19083	Wittstock	1360
19084	Zehdenick	1360
19085	Zepernick	1360
19086	Bremen	1361
19087	Bremerhaven	1361
19088	Berne	1364
19089	Hamburg	1364
19090	Diekholzen	1365
19091	Heroldstatt	1366
19092	ABlar	1367
19093	Alsbach-HÃƒÂ¤hnlein	1367
19094	Alsfeld	1367
19095	Altenstadt	1367
19096	Angelburg	1367
19097	Arolsen	1367
19098	Asslar	1367
19099	Babenhausen	1367
19100	Bad Camberg	1367
19101	Bad Hersfeld	1367
19102	Bad Homburg	1367
19103	Bad Nauheim	1367
19104	Bad Orb	1367
19105	Bad Schwalbach	1367
19106	Bad Soden	1367
19107	Bad Soden-Salmunster	1367
19108	Bad Sooden-Allendorf	1367
19109	Bad Vilbel	1367
19110	Bad Wildungen	1367
19111	Baunatal	1367
19112	Bebra	1367
19113	Beerfelden	1367
19114	Bensheim	1367
19115	Berkatal	1367
19116	Biblis	1367
19117	Bickenbach	1367
19118	Biebertal	1367
19119	Biedenkopf	1367
19120	Birkenau	1367
19121	Bischofsheim	1367
19122	Borken	1367
19123	Braunfels	1367
19124	Breidenbach	1367
19125	Bruchkobel	1367
19126	Budingen	1367
19127	Burstadt	1367
19128	Buseck	1367
19129	Buttelborn	1367
19130	Butzbach	1367
19131	Darmstadt	1367
19132	Dautphetal	1367
19133	Dieburg	1367
19134	Dietzenbach	1367
19135	Dillenburg	1367
19136	Dreieich	1367
19137	Egelsbach	1367
19138	Eichenzell	1367
19139	Eltville	1367
19140	Eppstein	1367
19141	Erbach	1367
19142	Erlensee	1367
19143	Erzhausen	1367
19144	Eschborn	1367
19145	Eschenburg	1367
19146	Eschwege	1367
19147	Felsberg	1367
19148	Fernwald	1367
19149	Florsheim	1367
19150	Frankenberg	1367
19151	Frankfurt	1367
19152	Freigericht	1367
19153	Friedberg	1367
19154	Friedrichsdorf	1367
19155	Fritzlar	1367
19156	Fulda	1367
19157	Fuldabruck	1367
19158	Fuldatal	1367
19159	Geisenheim	1367
19160	Gelnhausen	1367
19161	Gernsheim	1367
19162	GieBen	1367
19163	Giessen	1367
19164	Ginsheim-Gustavsburg	1367
19165	Gladenbach	1367
19166	Griesheim	1367
19167	GroB-Gerau	1367
19168	GroB-Umstadt	1367
19169	GroB-Zimmern	1367
19170	Grossenluder	1367
19171	Gruenberg	1367
19172	Grunberg	1367
19173	Grundau	1367
19174	Hadamar	1367
19175	Haiger	1367
19176	Hainburg	1367
19177	Hanau	1367
19178	Hattersheim	1367
19179	Heppenheim	1367
19180	Herborn	1367
19181	Hessisch Lichtenau	1367
19182	Heuchelheim	1367
19183	Heusenstamm	1367
19184	Hochheim	1367
19185	Hochst	1367
19186	Hofbieber	1367
19187	Hofgeismar	1367
19188	Hofheim	1367
19189	Homberg	1367
19190	Hunfeld	1367
19191	Hunfelden	1367
19192	Hungen	1367
19193	Huttenberg	1367
19194	Idstein	1367
19195	Karben	1367
19196	Kassel	1367
19197	Kaufungen	1367
19198	Kelkheim	1367
19199	Kelsterbach	1367
19200	Kirchhain	1367
19201	Konigstein	1367
19202	Korbach	1367
19203	Kriftel	1367
19204	Kronberg	1367
19205	Kunzell	1367
19206	Lahnau	1367
19207	Lahntal	1367
19208	Lampertheim	1367
19209	Langen	1367
19210	Langenselbold	1367
19211	Langgons	1367
19212	Laubach	1367
19213	Lauterbach	1367
19214	Lich	1367
19215	Limburg	1367
19216	Linden	1367
19217	Lindenholzhausen	1367
19218	Linsengericht	1367
19219	Lohfelden	1367
19220	Lollar	1367
19221	Lorsch	1367
19222	Maintal	1367
19223	Marburg	1367
19224	Melsungen	1367
19225	Mengerskirchen	1367
19226	Michelstadt	1367
19227	Morfelden-Walldorf	1367
19228	Morlenbach	1367
19229	Mucke	1367
19230	Muhlheim	1367
19231	Muhltal	1367
19232	Munster	1367
19233	Nauheim	1367
19234	Neu-Anspach	1367
19235	Neu-Isenburg	1367
19236	Neuhof	1367
19237	Neustadt	1367
19238	Nidda	1367
19239	Niddatal	1367
19240	Nidderau	1367
19241	Niederdorfelden	1367
19242	Niedernhausen	1367
19243	Niestetal	1367
19244	Ober-Ramstedt	1367
19245	Obertshausen	1367
19246	Oberursel	1367
19247	Oestrich-Winkel	1367
19248	Offenbach	1367
19249	Petersberg	1367
19250	Pfungstadt	1367
19251	Pohlheim	1367
19252	Raunheim	1367
19253	Reichelsheim	1367
19254	Reinheim	1367
19255	Reiskirchen	1367
19256	Riedstadt	1367
19257	Rimbach	1367
19258	RoBdorf	1367
19259	Rodenbach	1367
19260	Rodermark	1367
19261	Rodgau	1367
19262	Rosbach	1367
19263	Rotenburg	1367
19264	Rudesheim	1367
19265	Runkel	1367
19266	Russelsheim	1367
19267	Schauenburg	1367
19268	Schlangenbad	1367
19269	Schlitz	1367
19270	Schluchtern	1367
19271	Schoneck	1367
19272	Schotten	1367
19273	Schwalbach	1367
19274	Schwalbach am Taunus	1367
19275	Schwalmstadt	1367
19276	Seeheim-Jugenheim	1367
19277	Seligenstadt	1367
19278	Selters	1367
19279	Sinntal	1367
19280	Solms	1367
19281	Sontra	1367
19282	Spangenberg	1367
19283	Stadtallendorf	1367
19284	Steinau	1367
19285	Steinbach	1367
19286	Taunusstein	1367
19287	Trebur	1367
19288	Ulrichstein	1367
19289	Usingen	1367
19290	Vellmar	1367
19291	Viernheim	1367
19292	Volkmarsen	1367
19293	Wachtersbach	1367
19294	Wald-Michelbach	1367
19295	Waldbrunn	1367
19296	Waldems	1367
19297	Wehrheim	1367
19298	Weilburg	1367
19299	Weilmunster	1367
19300	Weiterstadt	1367
19301	Wettenberg	1367
19302	Wetter	1367
19303	Wetzlar	1367
19304	Wiesbaden	1367
19305	Witzenhausen	1367
19306	Wolfersheim	1367
19307	Wolfhagen	1367
19308	Zwingenberg	1367
19309	Kortenberg	1368
19310	Laasdorf	1369
19311	Anklam	1381
19312	Bad Doberan	1381
19313	Barth	1381
19314	Bergen	1381
19315	Boizenburg	1381
19316	Butzow	1381
19317	Demmin	1381
19318	Gagelow	1381
19319	Gallin	1381
19320	Grabow	1381
19321	Greifswald	1381
19322	Grevesmuhlen	1381
19323	Grimmen	1381
19324	Gustrow	1381
19325	Hagenow	1381
19326	Konigsee	1381
19327	Lubtheen	1381
19328	Ludersdorf	1381
19329	Ludwigslust	1381
19330	Malchin	1381
19331	Neubrandenburg	1381
19332	Neustrelitz	1381
19333	Parchim	1381
19334	Pasewalk	1381
19335	Ribnitz-Damgarten	1381
19336	Rostock	1381
19337	SaBnitz	1381
19338	Schweina	1381
19339	Schwerin	1381
19340	Selmsdorf	1381
19341	Stralsund	1381
19342	Teterow	1381
19343	Torgelow	1381
19344	Ueckermunde	1381
19345	Waren	1381
19346	Wismar	1381
19347	Wolgast	1381
19348	Zarrentin	1381
19349	Mulfingen	1382
19350	Grafing bei Munchen	1383
19351	Neubeuern	1384
19352	Achim	1385
19353	Adendorf	1385
19354	Aerzen	1385
19355	Alfeld	1385
19356	Ankum	1385
19357	Apen	1385
19358	Aurich	1385
19359	Bad Bentheim	1385
19360	Bad Bevensen	1385
19361	Bad Essen	1385
19362	Bad Gandersheim	1385
19363	Bad Harzburg	1385
19364	Bad Iburg	1385
19365	Bad Laer	1385
19366	Bad Lauterberg	1385
19367	Bad Munder	1385
19368	Bad Nenndorf	1385
19369	Bad Pyrmont	1385
19370	Bad Sachsa	1385
19371	Bad Salzdetfurth	1385
19372	Bad Zwischenahn	1385
19373	BarBel	1385
19374	Barsinghausen	1385
19375	Bassum	1385
19376	Beesten	1385
19377	Belm	1385
19378	Bergen	1385
19379	Bissendorf	1385
19380	Bleckede	1385
19381	Bockenem	1385
19382	Bohmte	1385
19383	Bovenden	1385
19384	Brake	1385
19385	Bramsche	1385
19386	Braunschweig	1385
19387	Bremervorde	1385
19388	Brockel	1385
19389	Brunswick	1385
19390	Buchholz	1385
19391	Buckeburg	1385
19392	Burgdorf	1385
19393	Burgwedel	1385
19394	Buxtehude	1385
19395	Celle	1385
19396	Clausthal-Zellerfeld	1385
19397	Clenze	1385
19398	Cloppenburg	1385
19399	Cremlingen	1385
19400	Cuxhaven	1385
19401	Dahlenburg	1385
19402	Damme	1385
19403	Dannenberg	1385
19404	Dassel	1385
19405	Deinste	1385
19406	Delmenhorst	1385
19407	Diepholz	1385
19408	Dinklage	1385
19409	Dorverden	1385
19410	Dransfeld	1385
19411	Drochtersen	1385
19412	Duderstadt	1385
19413	Edemissen	1385
19414	Edewecht	1385
19415	Einbeck	1385
19416	Elsfleth	1385
19417	Elze	1385
19418	Emden	1385
19419	Emlichheim	1385
19420	Emmerthal	1385
19421	Emsburen	1385
19422	Eppendorf	1385
19423	Fallingbostel	1385
19424	Frellstedt	1385
19425	Friedeburg	1385
19426	Friedland	1385
19427	Friesoythe	1385
19428	Ganderkesee	1385
19429	Garbsen	1385
19430	Garrel	1385
19431	Geeste	1385
19432	Gehrden	1385
19433	Georgsmarienhutte	1385
19434	Gifhorn	1385
19435	Gleichen	1385
19436	Goslar	1385
19437	Gottingen	1385
19438	GroBefehn	1385
19439	GroBenkneten	1385
19440	Hagen	1385
19441	Hambergen	1385
19442	Hameln	1385
19443	Hannover	1385
19444	Hannoversch Munden	1385
19445	Haren	1385
19446	Harsum	1385
19447	Hasbergen	1385
19448	Haselunne	1385
19449	Hatten	1385
19450	Hauslingen	1385
19451	Helmstedt	1385
19452	Hemmingen	1385
19453	Herzberg	1385
19454	Hessisch Oldendorf	1385
19455	Hildesheim	1385
19456	Hilter	1385
19457	Hittfeld	1385
19458	Holzminden	1385
19459	Hoya	1385
19460	Hude	1385
19461	Ihlow	1385
19462	Ilsede	1385
19463	Isernhagen	1385
19464	Jade	1385
19465	Jever	1385
19466	Jork	1385
19467	Kalefeld	1385
19468	Kirchlinteln	1385
19469	Knesebeck	1385
19470	Konigslutter	1385
19471	Krummhorn	1385
19472	Laatzen	1385
19473	Lahstedt	1385
19474	Langelsheim	1385
19475	Langen	1385
19476	Langenhagen	1385
19477	Langwedel	1385
19478	Lastrup	1385
19479	Leer	1385
19480	Lehre	1385
19481	Lehrte	1385
19482	Lemforde	1385
19483	Lengede	1385
19484	Liebenburg	1385
19485	Lilienthal	1385
19486	Lingen	1385
19487	Lohne	1385
19488	Loningen	1385
19489	Lorup	1385
19490	Loxstedt	1385
19491	Luchow	1385
19492	Luneburg	1385
19493	Melle	1385
19494	Meppen	1385
19495	Moormerland	1385
19496	Munster	1385
19497	Neu Wulmstorf	1385
19498	Neustadt	1385
19499	Nienburg	1385
19500	Norden	1385
19501	Nordenham	1385
19502	Nordhorn	1385
19503	Nordstemmen	1385
19504	Norten-Hardenberg	1385
19505	Northeim	1385
19506	Obernkirchen	1385
19507	Oldenburg	1385
19508	Osnabruck	1385
19509	Ostercappeln	1385
19510	Osterholz-Scharmbeck	1385
19511	Osterode	1385
19512	Ostrhauderfehn	1385
19513	Ottersberg	1385
19514	Oyten	1385
19515	Papenburg	1385
19516	Pattensen	1385
19517	Peine	1385
19518	Quakenbruck	1385
19519	Rastede	1385
19520	Rehburg-Loccum	1385
19521	Rhauderfehn	1385
19522	Rinteln	1385
19523	Ritterhude	1385
19524	Ronnenberg	1385
19525	Rosdorf	1385
19526	Rosengarten	1385
19527	Rotenburg	1385
19528	Salzgitter	1385
19529	Salzhemmendorf	1385
19530	Sarstedt	1385
19531	Saterland	1385
19532	ScheeBel	1385
19533	Schiffdorf	1385
19534	Schneverdingen	1385
19535	Schoningen	1385
19536	Schortens	1385
19537	Schuttorf	1385
19538	Schwanewede	1385
19539	Seelze	1385
19540	Seesen	1385
19541	Seevetal	1385
19542	Sehnde	1385
19543	Soltau	1385
19544	Springe	1385
19545	Stade	1385
19546	Stadthagen	1385
19547	Stadtoldendorf	1385
19548	Stelle	1385
19549	Stuhr	1385
19550	Sudbrookmerland	1385
19551	Sulingen	1385
19552	Syke	1385
19553	Tarmstedt	1385
19554	Tostedt	1385
19555	Twistringen	1385
19556	Uchte	1385
19557	Uelzen	1385
19558	Uetze	1385
19559	Uplengen	1385
19560	Uslar	1385
19561	Varel	1385
19562	Vechelde	1385
19563	Vechta	1385
19564	Verden	1385
19565	Vienenburg	1385
19566	Visselhovede	1385
19567	Walkenried	1385
19568	Wallenhorst	1385
19569	Walsrode	1385
19570	Wangerland	1385
19571	Wardenburg	1385
19572	Wedemark	1385
19573	Weener	1385
19574	Wendeburg	1385
19575	Wennigsen	1385
19576	Westerstede	1385
19577	Westoverledingen	1385
19578	Weyhe	1385
19579	Wiefelstede	1385
19580	Wiesmoor	1385
19581	Wildeshausen	1385
19582	Wilhelmshaven	1385
19583	Winsen	1385
19584	Wittingen	1385
19585	Wittmund	1385
19586	Wolfenbuttel	1385
19587	Wolfsburg	1385
19588	Worpswede	1385
19589	Wunstorf	1385
19590	Zetel	1385
19591	Zeven	1385
19592	Middenbeemster	1386
19593	Aachen	1387
19594	Ahaus	1387
19595	Ahlen	1387
19596	Aldenhoven	1387
19597	Alfter	1387
19598	Alpen	1387
19599	Alsdorf	1387
19600	Altena	1387
19601	Altendorf	1387
19602	Anrochte	1387
19603	Arnsberg	1387
19604	Ascheberg	1387
19605	Attendorn	1387
19606	Augustdorf	1387
19607	Bad Berleburg	1387
19608	Bad Driburg	1387
19609	Bad Honnef	1387
19610	Bad Laasphe	1387
19611	Bad Lippspringe	1387
19612	Bad Munstereifel	1387
19613	Bad Oeynhausen	1387
19614	Bad Salzuflen	1387
19615	Bad Sassendorf	1387
19616	Baesweiler	1387
19617	Balve	1387
19618	Barntrup	1387
19619	Beckum	1387
19620	Bedburg	1387
19621	Bedburg-Hau	1387
19622	Bergheim	1387
19623	Bergisch Gladbach	1387
19624	Bergkamen	1387
19625	Bergneustadt	1387
19626	Bestwig	1387
19627	Beverungen	1387
19628	Bielefeld	1387
19629	Billerbeck	1387
19630	Blomberg	1387
19631	Bocholt	1387
19632	Bochum	1387
19633	Bocket	1387
19634	Bonen	1387
19635	Bonn	1387
19636	Borchen	1387
19637	Borgentreich	1387
19638	Borgholzhausen	1387
19639	Borken	1387
19640	Bornheim	1387
19641	Bottrop	1387
19642	Brakel	1387
19643	Brilon	1387
19644	Bruggen	1387
19645	Bruhl	1387
19646	Bunde	1387
19647	Burbach	1387
19648	Buren	1387
19649	Burscheid	1387
19650	Castrop-Rauxel	1387
19651	Coesfeld	1387
19652	Cologne	1387
19653	Datteln	1387
19654	Delbruck	1387
19655	Denklingen	1387
19656	Detmold	1387
19657	Dingden	1387
19658	Dinslaken	1387
19659	Dormagen	1387
19660	Dorsten	1387
19661	Dortmund	1387
19662	Drensteinfurt	1387
19663	Drolshagen	1387
19664	Duisburg	1387
19665	Dulmen	1387
19666	Duren	1387
19667	Dusseldorf	1387
19668	Eitorf	1387
19669	Elsdorf	1387
19670	Emmerich	1387
19671	Emsdetten	1387
19672	Engelskirchen	1387
19673	Enger	1387
19674	Ennepetal	1387
19675	Ennigerloh	1387
19676	Ense	1387
19677	Erftstadt	1387
19678	Erkelenz	1387
19679	Erkrath	1387
19680	Erwitte	1387
19681	Espelkamp	1387
19682	Essen	1387
19683	Euskirchen	1387
19684	Extertal	1387
19685	Finnentrop	1387
19686	Frechen	1387
19687	Freudenberg	1387
19688	Frondenberg	1387
19689	Gangelt	1387
19690	Geilenkirchen	1387
19691	Geldern	1387
19692	Gelsenkirchen	1387
19693	Gescher	1387
19694	Geseke	1387
19695	Gevelsberg	1387
19696	Gladbeck	1387
19697	Goch	1387
19698	Grefrath	1387
19699	Greven	1387
19700	Grevenbroich	1387
19701	Gronau	1387
19702	Gummersbach	1387
19703	Gutersloh	1387
19704	Haan	1387
19705	Hagen	1387
19706	Halle	1387
19707	Haltern	1387
19708	Halver	1387
19709	Hamm	1387
19710	Hamminkeln	1387
19711	Harsewinkel	1387
19712	Hattingen	1387
19713	Havixbeck	1387
19714	Heiligenhaus	1387
19715	Heinsberg	1387
19716	Hemer	1387
19717	Hennef	1387
19718	Herdecke	1387
19719	Herford	1387
19720	Herne	1387
19721	Herten	1387
19722	Herzebrock-Clarholz	1387
19723	Herzogenrath	1387
19724	Hiddenhausen	1387
19725	Hilchenbach	1387
19726	Hilden	1387
19727	Hille	1387
19728	Holzwickede	1387
19729	Horn-Bad Meinberg	1387
19730	Horstel	1387
19731	Hovelhof	1387
19732	Hoxter	1387
19733	Huckelhoven	1387
19734	Huckeswagen	1387
19735	Hullhorst	1387
19736	Hunxe	1387
19737	Hurth	1387
19738	Ibbenburen	1387
19739	Iserlohn	1387
19740	Isselburg	1387
19741	Issum	1387
19742	Juchen	1387
19743	Julich	1387
19744	Kaarst	1387
19745	Kalkar	1387
19746	Kall	1387
19747	Kalletal	1387
19748	Kamen	1387
19749	Kamp-Lintfort	1387
19750	Kempen	1387
19751	Kerken	1387
19752	Kerpen	1387
19753	Kevelaer	1387
19754	Kierspe	1387
19755	Kirchhundem	1387
19756	Kirchlengern	1387
19757	Kleve	1387
19758	Koln	1387
19759	Konigswinter	1387
19760	Korschenbroich	1387
19761	Krefeld	1387
19762	Kreuzau	1387
19763	Kreuztal	1387
19764	Kurten	1387
19765	Lage	1387
19766	Langenfeld	1387
19767	Langerwehe	1387
19768	Leichlingen	1387
19769	Lemgo	1387
19770	Lengerich	1387
19771	Lennestadt	1387
19772	Leopoldshohe	1387
19773	Leverkusen	1387
19774	Lichtenau	1387
19775	Lindlar	1387
19776	Linnich	1387
19777	Lippetal	1387
19778	Lippstadt	1387
19779	Lohmar	1387
19780	Lohne	1387
19781	Lotte	1387
19782	Lubbecke	1387
19783	Ludenscheid	1387
19784	Ludinghausen	1387
19785	Lugde	1387
19786	Lunen	1387
19787	Marienheide	1387
19788	Marl	1387
19789	Marsberg	1387
19790	Mechernich	1387
19791	Meckenheim	1387
19792	Meerbusch	1387
19793	Meinerzhagen	1387
19794	Menden	1387
19795	Meschede	1387
19796	Mettingen	1387
19797	Mettmann	1387
19798	Minden	1387
19799	Moers	1387
19800	Mohnesee	1387
19801	Monchengladbach	1387
19802	Monheim	1387
19803	Monschau	1387
19804	Morsbach	1387
19805	Much	1387
19806	Mulheim	1387
19807	Munster	1387
19808	Netphen	1387
19809	Nettetal	1387
19810	Neuenkirchen	1387
19811	Neuenrade	1387
19812	Neukirchen-Vluyn	1387
19813	Neunkirchen	1387
19814	Neunkirchen-Seelscheid	1387
19815	Neuss	1387
19816	Nideggen	1387
19817	Niederkassel	1387
19818	Niederkruchten	1387
19819	Niederzier	1387
19820	Nordkirchen	1387
19821	Norvenich	1387
19822	Nottuln	1387
19823	Numbrecht	1387
19824	Oberhausen	1387
19825	Ochtrup	1387
19826	Odenthal	1387
19827	Oelde	1387
19828	Oer-Erkenschwick	1387
19829	Oerlinghausen	1387
19830	Olfen	1387
19831	Olpe	1387
19832	Olsberg	1387
19833	Overath	1387
19834	Paderborn	1387
19835	Petershagen	1387
19836	Plettenberg	1387
19837	Porta Westfalica	1387
19838	PreuBisch Oldendorf	1387
19839	Pulheim	1387
19840	Radevormwald	1387
19841	Raesfeld	1387
19842	Rahden	1387
19843	Ratingen	1387
19844	Recke	1387
19845	Recklinghausen	1387
19846	Rees	1387
19847	Reichshof	1387
19848	Reken	1387
19849	Remscheid	1387
19850	Rheda-Wiedenbruck	1387
19851	Rhede	1387
19852	Rheinbach	1387
19853	Rheinberg	1387
19854	Rheine	1387
19855	Rietberg	1387
19856	Rommerskirchen	1387
19857	Rosendahl	1387
19858	Rosrath	1387
19859	Ruthen	1387
19860	Salzkotten	1387
19861	Sassenberg	1387
19862	Schalksmuhle	1387
19863	Schermbeck	1387
19864	Schieder-Schwalenberg	1387
19865	Schleiden	1387
19866	SchloB Holte-Stukenbrock	1387
19867	Schmallenberg	1387
19868	Schwalmtal	1387
19869	Schwelm	1387
19870	Schwerte	1387
19871	Selm	1387
19872	Senden	1387
19873	Sendenhorst	1387
19874	Siegburg	1387
19875	Siegen	1387
19876	Simmerath	1387
19877	Soest	1387
19878	Solingen	1387
19879	Sonsbeck	1387
19880	Spenge	1387
19881	Sprockhovel	1387
19882	Stadtlohn	1387
19883	Steinfurt	1387
19884	Steinhagen	1387
19885	Steinheim	1387
19886	Stemwede	1387
19887	Stolberg	1387
19888	Straelen	1387
19889	Sundern	1387
19890	Swisttal	1387
19891	Tecklenburg	1387
19892	Telgte	1387
19893	Tonisvorst	1387
19894	Troisdorf	1387
19895	Ubach-Palenberg	1387
19896	Unna	1387
19897	Velbert	1387
19898	Velen	1387
19899	Verl	1387
19900	Versmold	1387
19901	Viersen	1387
19902	Vlotho	1387
19903	Voerde	1387
19904	Vreden	1387
19905	Wachtberg	1387
19906	Wachtendonk	1387
19907	Wadersloh	1387
19908	Waldbrol	1387
19909	Waltrop	1387
19910	Warburg	1387
19911	Warendorf	1387
19912	Warstein	1387
19913	Wassenberg	1387
19914	Weeze	1387
19915	Wegberg	1387
19916	Weilerswist	1387
19917	Welver	1387
19918	Wenden	1387
19919	Werdohl	1387
19920	Werl	1387
19921	Wermelskirchen	1387
19922	Werne	1387
19923	Werther	1387
19924	Wesel	1387
19925	Wesseling	1387
19926	Westerkappeln	1387
19927	Wetter	1387
19928	Wickede	1387
19929	Wiehl	1387
19930	Willich	1387
19931	Wilnsdorf	1387
19932	Windeck	1387
19933	Winterberg	1387
19934	Wipperfurth	1387
19935	Witten	1387
19936	Wulfrath	1387
19937	Wunnenberg	1387
19938	Wuppertal	1387
19939	Wurselen	1387
19940	Xanten	1387
19941	Zulpich	1387
19942	Herzberg am Harz	1389
19943	Alzey	1390
19944	Andernach	1390
19945	Bad Durkheim	1390
19946	Bad Ems	1390
19947	Bad Kreuznach	1390
19948	Bad Neuenahr-Ahrweiler	1390
19949	Bendorf	1390
19950	Betzdorf	1390
19951	Bingen	1390
19952	Bitburg	1390
19953	Bobenheim-Roxheim	1390
19954	Bohl-Iggelheim	1390
19955	Boppard	1390
19956	Daun	1390
19957	Diez	1390
19958	Eisenberg	1390
19959	Essingen	1390
19960	Frankenthal	1390
19961	Gau-Odernheim	1390
19962	Germersheim	1390
19963	Grunstadt	1390
19964	HaBloch	1390
19965	Hahnstatten	1390
19966	Hallschlag	1390
19967	Herschbach	1390
19968	Herxheim	1390
19969	Hirschhorn	1390
19970	Hohr-Grenzhausen	1390
19971	Holzheim	1390
19972	Idar-Oberstein	1390
19973	Ingelheim	1390
19974	Kaisersesch	1390
19975	Kaiserslautern	1390
19976	Kastellaun	1390
19977	Kindsbach	1390
19978	Kirchen	1390
19979	Kirn	1390
19980	Koblenz	1390
19981	Lahnstein	1390
19982	Landau	1390
19983	Limburgerhof	1390
19984	Luckenburg	1390
19985	Ludwigshafen	1390
19986	Mainz	1390
19987	Mayen	1390
19988	Montabaur	1390
19989	Morbach	1390
19990	Mulheim-Karlich	1390
19991	Mundersbach	1390
19992	Mutterstadt	1390
19993	Nassau	1390
19994	Neitersen	1390
19995	Neustadt	1390
19996	Neuwied	1390
19997	Niederzissen	1390
19998	Pirmasens	1390
19999	Plaidt	1390
20000	Remagen	1390
20001	Schifferstadt	1390
20002	Schoenenberg Kuebelberg	1390
20003	Sinzig	1390
20004	Speyer	1390
20005	St. Goar	1390
20006	Trier	1390
20007	Vallendar	1390
20008	Winterbach	1390
20009	Wittlich	1390
20010	Worms	1390
20011	Worth	1390
20012	Zweibrucken	1390
20013	Adenau	1391
20014	Anhausen	1391
20015	Barbelroth	1391
20016	Berndroth	1391
20017	Bernkastel-Kues	1391
20018	Burgbrohl	1391
20019	Dieblich	1391
20020	Dierdorf	1391
20021	Dreisbach	1391
20022	Elsoff	1391
20023	Enkenbach-Alsenborn	1391
20024	Etzbach	1391
20025	Flonheim	1391
20026	Fohren	1391
20027	Grafschaft	1391
20028	Hochspeyer	1391
20029	Leiningen	1391
20030	Moschheim	1391
20031	Murlenbach	1391
20032	Neuhofen	1391
20033	Nievern	1391
20034	Norken	1391
20035	Oberlahr	1391
20036	Otterstadt	1391
20037	Rennerod	1391
20038	Rheinbreitbach	1391
20039	Rieschweiler-Muhlbach	1391
20040	Saarburg	1391
20041	Stahlhofen	1391
20042	Steinebach	1391
20043	Weinsheim	1391
20044	Winnweiler	1391
20045	Wissen	1391
20046	Beckingen	1392
20047	Bexbach	1392
20048	Blieskastel	1392
20049	Dillingen	1392
20050	Duppenweiler	1392
20051	Eppelborn	1392
20052	Friedrichsthal	1392
20053	GroBrosseln	1392
20054	Heusweiler	1392
20055	Homburg	1392
20056	Illingen	1392
20057	Kirkel	1392
20058	Kleinblittersdorf	1392
20059	Lebach	1392
20060	Losheim	1392
20061	Mandelbachtal	1392
20062	Marpingen	1392
20063	Merchweiler	1392
20064	Merzig	1392
20065	Mettlach	1392
20066	Nalbach	1392
20067	Neunkirchen	1392
20068	Nohfelden	1392
20069	Nonnweiler	1392
20070	Oberthal	1392
20071	Ottweiler	1392
20072	Puttlingen	1392
20073	Quierschied	1392
20074	Rehlingen-Siersburg	1392
20075	Riegelsberg	1392
20076	Saarbrucken	1392
20077	Saarlouis	1392
20078	Saarwellingen	1392
20079	Sankt Ingbert	1392
20080	Sankt Wendel	1392
20081	Schiffweiler	1392
20082	Schmelz	1392
20083	Schwalbach	1392
20084	Spiesen-Elversberg	1392
20085	Sulzbach	1392
20086	Tholey	1392
20087	Uberherrn	1392
20088	Volklingen	1392
20089	Wadern	1392
20090	Wadgassen	1392
20091	Wallerfangen	1392
20092	Weiskirchen	1392
20093	Annaberg-Buchholz	1393
20094	Aue	1393
20095	Auerbach	1393
20096	Bautzen	1393
20097	Bischofswerda	1393
20098	Borna	1393
20099	Brand-Erbisdorf	1393
20100	Burgstadt	1393
20101	Chemnitz	1393
20102	Coswig	1393
20103	Crimmitschau	1393
20104	Delitzsch	1393
20105	Dobeln	1393
20106	Dresden	1393
20107	Ebersbach	1393
20108	Eilenburg	1393
20109	Falkenstein	1393
20110	Floha	1393
20111	Frankenberg	1393
20112	Freiberg	1393
20113	Freital	1393
20114	Friedewald	1393
20115	Glauchau	1393
20116	Gorlitz	1393
20117	Grimma	1393
20118	GroBenhain	1393
20119	Groditz	1393
20120	Hainichen	1393
20121	Heidenau	1393
20122	Hirschstein	1393
20123	Hohenstein-Ernstthal	1393
20124	Hoyerswerda	1393
20125	Kamenz	1393
20126	Klingenthal	1393
20127	Leipzig	1393
20128	Lichtenstein	1393
20129	Limbach-Oberfrohna	1393
20130	LoBnitz	1393
20131	Lobau	1393
20132	Lugau	1393
20133	Marienberg	1393
20134	Markkleeberg	1393
20135	Meerane	1393
20136	MeiBen	1393
20137	Mittweida	1393
20138	Muldenhammer	1393
20139	Neustadt	1393
20140	Niesky	1393
20141	Oelsnitz	1393
20142	Olbernhau	1393
20143	Olbersdorf	1393
20144	Oschatz	1393
20145	Pirna	1393
20146	Plauen	1393
20147	Radeberg	1393
20148	Radebeul	1393
20149	Reichenbach	1393
20150	Riesa	1393
20151	Rietschen	1393
20152	Schkeuditz	1393
20153	Schneeberg	1393
20154	Schwarzenberg	1393
20155	Sebnitz	1393
20156	Stollberg	1393
20157	Taubenheim	1393
20158	Taucha	1393
20159	Thalheim	1393
20160	Torgau	1393
20161	Waldheim	1393
20162	WeiBwasser	1393
20163	Werdau	1393
20164	Wilkau-HaBlau	1393
20165	Wurzen	1393
20166	Zittau	1393
20167	Zschopau	1393
20168	Zwickau	1393
20169	Zwonitz	1393
20170	Aken	1394
20171	Aschersleben	1394
20172	Bad Durrenberg	1394
20173	Bebitz	1394
20174	Bernburg	1394
20175	Bitterfeld	1394
20176	Blankenburg	1394
20177	Braunsbedra	1394
20178	Burg	1394
20179	Calbe	1394
20180	Coswig	1394
20181	Dessau	1394
20182	Eisleben	1394
20183	Gardelegen	1394
20184	Genthin	1394
20185	Gommern	1394
20186	Grafenhainichen	1394
20187	Halberstadt	1394
20188	Haldensleben	1394
20189	Halle	1394
20190	Hettstedt	1394
20191	Heyrothsberge	1394
20192	Hotensleben	1394
20193	Kothen	1394
20194	Leuna	1394
20195	Magdeburg	1394
20196	Merseburg	1394
20197	Naumburg	1394
20198	Oschersleben	1394
20199	Osterburg	1394
20200	Osterwieck	1394
20201	Quedlinburg	1394
20202	Querfurt	1394
20203	Raguhn	1394
20204	RoBlau	1394
20205	Salzwedel	1394
20206	Sangerhausen	1394
20207	Schonebeck	1394
20208	StaBfurt	1394
20209	Stendal	1394
20210	Tangermunde	1394
20211	Thale	1394
20212	WeiBenfels	1394
20213	Wittenberg	1394
20214	Wolfen	1394
20215	Wolmirstedt	1394
20216	Zeitz	1394
20217	Zerbst	1394
20218	Bad Lausick	1395
20219	Bernsdorf	1395
20220	Borde-Hakel	1395
20221	Gelenau	1395
20222	Groberkmannsdorf 	1395
20223	Hartha	1395
20224	Kreischa	1395
20225	Malschwitz	1395
20226	Naunhof	1395
20227	Pausa	1395
20228	Seiffen	1395
20229	Stutzengrun	1395
20230	Ahrensbok	1396
20231	Ahrensburg	1396
20232	Altenholz	1396
20233	Alveslohe	1396
20234	Ammersbek	1396
20235	Bad Bramstedt	1396
20236	Bad Oldesloe	1396
20237	Bad Schwartau	1396
20238	Bad Segeberg	1396
20239	Bargteheide	1396
20240	Barmstedt	1396
20241	Barsbuttel	1396
20242	Bredstedt	1396
20243	Brunsbuttel	1396
20244	Budelsdorf	1396
20245	Eckernforde	1396
20246	Eddelak	1396
20247	Elmshorn	1396
20248	Eutin	1396
20249	Flensburg	1396
20250	Friedrichstadt	1396
20251	Geesthacht	1396
20252	Glinde	1396
20253	Gluckstadt	1396
20254	Grob Pampau	1396
20255	Halstenbek	1396
20256	Hamfelde	1396
20257	Harrislee	1396
20258	Hartenholm	1396
20259	Heide	1396
20260	Heiligenhafen	1396
20261	Henstedt-Ulzburg	1396
20262	Honenwestedt	1396
20263	Husum	1396
20264	Itzehoe	1396
20265	Kaltenkirchen	1396
20266	Kappeln	1396
20267	Kiel	1396
20268	Kronshagen	1396
20269	Lauenburg	1396
20270	Lensahn	1396
20271	Lubeck	1396
20272	Malente	1396
20273	Mielkendorf	1396
20274	Molfsee	1396
20275	Molln	1396
20276	Neuenbrook	1396
20277	Neumunster	1396
20278	Neustadt	1396
20279	Norderstedt	1396
20280	Oldenburg	1396
20281	Oststeinbek	1396
20282	Pinneberg	1396
20283	Plon	1396
20284	Preetz	1396
20285	Quickborn	1396
20286	Ratekau	1396
20287	Ratzeburg	1396
20288	Reinbek	1396
20289	Reinfeld	1396
20290	Rellingen	1396
20291	Rendsburg	1396
20292	Rethwisch	1396
20293	Satrup	1396
20294	Scharbeutz	1396
20295	Schenefeld	1396
20296	Schleswig	1396
20297	Schmalfeld	1396
20298	Schoenkirchen	1396
20299	Schwarzenbek	1396
20300	Seefeld	1396
20301	Sievershutten	1396
20302	Stockelsdorf	1396
20303	Tangstedt	1396
20304	Timmendorfer Strand	1396
20305	Tornesch	1396
20306	Travemunde	1396
20307	Uetersen	1396
20308	Wahlstedt	1396
20309	Wedel	1396
20310	Wentorf	1396
20311	Westerland	1396
20312	Westerronfeld	1396
20313	Wohltorf	1396
20314	Wotersen	1396
20315	Altenburg	1397
20316	Apolda	1397
20317	Arnstadt	1397
20318	Bad Frankenhausen	1397
20319	Bad Langensalza	1397
20320	Bad Salzungen	1397
20321	Cursdorf	1397
20322	Dornburg	1397
20323	Eisenach	1397
20324	Eisenberg	1397
20325	Erfurt	1397
20326	Gera	1397
20327	Geschwenda	1397
20328	Gotha	1397
20329	Greiz	1397
20330	Heiligenstadt	1397
20331	Hermsdorf	1397
20332	Hildburghausen	1397
20333	Ilmenau	1397
20334	Immelborn	1397
20335	Jena	1397
20336	Leinefelde	1397
20337	Leutenberg	1397
20338	Meiningen	1397
20339	Meuselwitz	1397
20340	Muhlhausen	1397
20341	Neustadt	1397
20342	Nordhausen	1397
20343	PoBneck	1397
20344	Rosenthal	1397
20345	Rositz	1397
20346	Rudolstadt	1397
20347	Ruhla	1397
20348	Saalfeld	1397
20349	Schmalkalden	1397
20350	Schmolln	1397
20351	Sommerda	1397
20352	Sondershausen	1397
20353	Sonneberg	1397
20354	Suhl	1397
20355	Triptis	1397
20356	Uhlstadt	1397
20357	Waltershausen	1397
20358	Weida	1397
20359	Weimar	1397
20360	Wernigerode	1397
20361	Wormstedt	1397
20362	Zella-Mehlis	1397
20363	Zeulenroda	1397
20364	Webling	1398
20365	Neustadt	1399
20366	Schlobborn	1400
20367	Agogo	1401
20368	Bekwai	1401
20369	Konongo	1401
20370	Kumasi	1401
20371	Mampong	1401
20372	Mankranso	1401
20373	Obuasi	1401
20374	Ofinso	1401
20375	Tafo	1401
20376	Bechem	1402
20377	Berekum	1402
20378	Duayaw Nkwanta	1402
20379	Kintampo	1402
20380	Sunyani	1402
20381	Techiman	1402
20382	Wenchi	1402
20383	Apam	1403
20384	Cape Coast	1403
20385	Dunkwa	1403
20386	Elmina	1403
20387	Foso	1403
20388	Komenda	1403
20389	Mauri	1403
20390	Mumford	1403
20391	Nyakrom	1403
20392	Okitsiu	1403
20393	Saltpond	1403
20394	Swedru	1403
20395	Winneba	1403
20396	Aburi	1404
20397	Ada	1404
20398	Akim Swedru	1404
20399	Akropong	1404
20400	Asamankese	1404
20401	Begoro	1404
20402	Kade	1404
20403	Kibi	1404
20404	Koforidua	1404
20405	Mpraeso	1404
20406	Nkawkaw	1404
20407	Nsawam	1404
20408	Oda	1404
20409	Somanya	1404
20410	Suhum	1404
20411	Kpandae	1406
20412	Salaga	1406
20413	Savelugu	1406
20414	Tamale	1406
20415	Yendi	1406
20416	Aflao	1409
20417	Anloga	1409
20418	Ho	1409
20419	Hohoe	1409
20420	Keta	1409
20421	Kete-Krachi	1409
20422	Kpandu	1409
20423	Aboso	1410
20424	Anomabu	1410
20425	Axim	1410
20426	Bibiani	1410
20427	Prestea	1410
20428	Sekondi	1410
20429	Shama	1410
20430	Takoradi	1410
20431	Tarkwa	1410
20432	Gibraltar	1411
20433	Elassonos	1412
20434	Aiyion	1413
20435	Patra	1413
20436	Argos	1415
20437	Navplion	1415
20438	Tripoli	1416
20439	Arta	1417
20440	Acharnes	1418
20441	Agios Ioannis Rentis	1418
20442	Drapetsona	1418
20443	Koropi	1418
20444	Lavrion	1418
20445	Mandra	1418
20446	Spata	1418
20447	Aharna	1419
20448	Aiyaleo	1419
20449	Alimos	1419
20450	Amarousion	1419
20451	Ano Liosia	1419
20452	Aryiroupoli	1419
20453	Aspropirgos	1419
20454	Athina	1419
20455	Athinai	1419
20456	Ayia Barbara	1419
20457	Ayia Paraskevi	1419
20458	Ayios Anaryiros	1419
20459	Ayios Dimitrios	1419
20460	Dafne	1419
20461	Elevsis	1419
20462	Ellenikon	1419
20463	Galatsion	1419
20464	Glifada	1419
20465	Haidarion	1419
20466	Halandrion	1419
20467	Holargos	1419
20468	Ilioupoli	1419
20469	Iraklion	1419
20470	Kaisariani	1419
20471	Kallithea	1419
20472	Kamateron	1419
20473	Keratea	1419
20474	Keratsinion	1419
20475	Kifisia	1419
20476	Koridallos	1419
20477	Kropion	1419
20478	Markopoulos Mesogaia	1419
20479	Maroussi	1419
20480	Megara	1419
20481	Melission	1419
20482	Metamorfosios	1419
20483	Moshatos	1419
20484	Nea Filedelfia	1419
20485	Nea Ionia	1419
20486	Nea Liosia	1419
20487	Nea Smirni	1419
20488	Nikaia	1419
20489	Palaion Faliron	1419
20490	Perama	1419
20491	Peristerion	1419
20492	Petroupoli	1419
20493	Pevka	1419
20494	Piraeus	1419
20495	Salamis	1419
20496	Tavros	1419
20497	Viron	1419
20498	Voula	1419
20499	Vrilission	1419
20500	Zografos	1419
20501	Heraklion	1421
20502	Arhangelos	1422
20503	Ialysos	1422
20504	Kos	1422
20505	Rodos	1422
20506	Drama	1423
20507	Chalkis	1424
20508	Karpenisi	1425
20509	Alexandroupoli	1426
20510	Orestias	1426
20511	Halkida	1427
20512	Florina	1428
20513	Amfissa	1429
20514	Lamia	1430
20515	Grevena	1431
20516	Halandri	1432
20517	Lakkoma	1433
20518	N. Kallikrateia	1433
20519	Poliyiros	1433
20520	Hania	1434
20521	Crete	1435
20522	Hios	1436
20523	Pirgos	1437
20524	Veroia	1438
20525	Ioannina	1439
20526	Karditsa	1441
20527	Kastoria	1442
20528	Kavala	1443
20529	Agioi Theodoroi	1444
20530	Argostolion	1444
20531	Kerkira	1445
20532	Ermoupoli	1446
20533	Fira	1446
20534	Mikonos	1446
20535	Kilkis	1447
20536	Korinthos	1448
20537	Kozani	1449
20538	Ptolemais	1449
20539	Sparti	1450
20540	Larisa	1451
20541	Larissa	1451
20542	Ayios Nikolaos	1452
20543	Ierapetra	1452
20544	Sitia	1452
20545	Mitilini	1453
20546	Levkas	1454
20547	Volos	1455
20548	Kalamata	1456
20549	Edessa	1459
20550	Yiannitsa	1459
20551	Katerini	1460
20552	Acharne	1461
20553	Pallini	1461
20554	Preveza	1462
20555	Rethimnon	1463
20556	Komotini	1464
20557	Samos	1465
20558	Serrai	1466
20559	Igoumenitsa	1467
20560	Ampelokipa	1468
20561	Kalamaria	1468
20562	Neapoli	1468
20563	Oristiada	1468
20564	Thessaloniki	1468
20565	Trikala	1469
20566	Levadia	1470
20567	Thivai	1470
20568	Xanthi	1472
20569	Zakinthos	1473
20570	Aasiaat	1474
20571	Akunnaaq	1474
20572	Kitsissuarsuit	1474
20573	Ikkatteq	1475
20574	Isortoq	1475
20575	Kulusuk	1475
20576	Kuumiut	1475
20577	Qernertuarssuit	1475
20578	Sermiligaaq	1475
20579	Tasiilaq	1475
20580	Tiniteqilaaq	1475
20581	Illoqqortoormiut	1476
20582	Itterajivit	1476
20583	Uunarteq	1476
20584	Ilimanaq	1477
20585	Ilulissat	1477
20586	Oqaatsut	1477
20587	Qeqertaq	1477
20588	Saqqaq	1477
20589	Ivittuut	1478
20590	Kangilinnguit	1478
20591	Attu	1479
20592	Iginniarfik	1479
20593	Ikerasaarsuk	1479
20594	Kangaatsiaq	1479
20595	Niaqornaarsuk	1479
20596	Atammik	1480
20597	Kangaamiut	1480
20598	Maniitsoq	1480
20599	Napasoq	1480
20600	Aappilattoq	1481
20601	Akuliaruseq	1481
20602	Alluitsoq	1481
20603	Alluitsup Paa	1481
20604	Ammassivik	1481
20605	Ikerasassuaq	1481
20606	Nanortalik	1481
20607	Narsarmijit	1481
20608	Nuugaarsuk	1481
20609	Qallimiut	1481
20610	Qortortorsuaq	1481
20611	Tasiusaq	1481
20612	Amannguit	1482
20613	Atarnaatsoq	1482
20614	Eqaluit Ilua	1482
20615	Igaliku	1482
20616	Igaliku Kujalleq	1482
20617	Inneruulalik	1482
20618	Issormiut	1482
20619	Iterlak	1482
20620	Kangerlua	1482
20621	Narsaq	1482
20622	Narsarsuaq	1482
20623	Nunataaq	1482
20624	Qassiarsuk	1482
20625	Qinngua	1482
20626	Qinngua Kangilleq	1482
20627	Qolortup Itinnera	1482
20628	Sillisit	1482
20629	Tasiusaq	1482
20630	Timerliit	1482
20631	Uummannartuuaraq	1482
20632	Kangerluarsoruseq	1483
20633	Kapisillit	1483
20634	Neriunaq	1483
20635	Nuuk	1483
20636	Qeqertarsuatsiaat	1483
20637	Qooqqut	1483
20638	Qoornoq	1483
20639	Arsuk	1484
20640	Paamiut	1484
20641	Moriusaq	1485
20642	Qaanaaq	1485
20643	Qeqertarsuaq	1485
20644	Qeqertat	1485
20645	Savissivik	1485
20646	Siorapaluk	1485
20647	Eqalugaarsuit	1486
20648	Illorsuit	1486
20649	Kangerluarsorujuk	1486
20650	Kangerluarsorujuup Qinngua	1486
20651	Qanisartuut	1486
20652	Qaqortokolook	1486
20653	Qaqortoq	1486
20654	Qassimiut	1486
20655	Saarloq	1486
20656	Saqqamiut	1486
20657	Tasiluk	1486
20658	Upernaviarsuk	1486
20659	Ikamiut	1487
20660	Qasigiannguit	1487
20661	Kangerluk	1488
20662	Qeqertarsuaq	1488
20663	Itilleq	1489
20664	Kangerlussuaq	1489
20665	Sarfannguit	1489
20666	Sisimiut	1489
20667	Aappilattoq	1491
20668	Ikerakuuk	1491
20669	Innarsuit	1491
20670	Kangersuatsiaq	1491
20671	Kullorsuaq	1491
20672	Naajaat	1491
20673	Nutaarmiut	1491
20674	Nuusuaq	1491
20675	Tasiusaq	1491
20676	Upernavik	1491
20677	Upernavik Kujalleq	1491
20678	Ikerasak	1492
20679	Illorsuit	1492
20680	Niaqornat	1492
20681	Nuugaatsiaq	1492
20682	Qaarsut	1492
20683	Saattut	1492
20684	Ukkusissat	1492
20685	Uummannaq	1492
20686	Baie-Mahault	1500
20687	Baillif	1500
20688	Basse-Terre	1500
20689	Bouillante	1500
20690	Capesterre-Belle-Eau	1500
20691	Gourbeyre	1500
20692	Lamentin	1500
20693	Petit-Bourg	1500
20694	Pointe-Noire	1500
20695	Saint-Claude	1500
20696	Sainte-Rose	1500
20697	Trois-Rivieres	1500
20698	Vieux-Habitants	1500
20699	Anse-Bertrand	1501
20700	Le Gosier	1501
20701	Le Moule	1501
20702	Les Abymes	1501
20703	Morne-a-lEau	1501
20704	Petit-Canal	1501
20705	Point-a-Pitre	1501
20706	Port-Louis	1501
20707	Saint-Francois	1501
20708	Sainte-Anne	1501
20709	Grand-Bourg	1504
20710	Agat	1508
20711	Barrigada	1509
20712	Barrigada Heights	1509
20713	Chalan Pago	1510
20714	Ordot	1510
20715	Astumbo	1511
20716	Dededo	1511
20717	Finegayan Station	1511
20718	Agana	1512
20719	Agana Station	1512
20720	Inarajan	1513
20721	Mangilao	1514
20722	Merizo	1515
20723	Mongmong	1516
20724	Toto	1516
20725	Sinajana	1518
20726	Talofofo	1519
20727	Tamuning	1520
20728	Anderson Air Force Base	1521
20729	Yigo	1521
20730	Yona	1522
20731	Chimaltenango	1525
20732	Comalapa	1525
20733	Itzapa	1525
20734	Patzun	1525
20735	Chiquimula	1526
20736	Esquipulas	1526
20737	Cotzumalguapa	1528
20738	Escuintla	1528
20739	Palin	1528
20740	San Jose	1528
20741	Tiquisate	1528
20742	Amatitlan	1529
20743	Chinautla	1529
20744	Guatemala	1529
20745	Mixco	1529
20746	Petapa	1529
20747	Villa Nueva	1529
20748	Huehuetenango	1530
20749	Puerto Barrios	1531
20750	Jalapa	1532
20751	Asuncion Mita	1533
20752	Jutiapa	1533
20753	Flores	1534
20754	San Benito	1534
20755	Quezaltenango	1535
20756	Quiche	1536
20757	Retalhuleu	1537
20758	Antigua	1538
20759	Ciudad Vieja	1538
20760	Jocotenango	1538
20761	Santa Maria de Jesus	1538
20762	Sumpango	1538
20763	Atitlan	1541
20764	Solola	1541
20765	Mazatenango	1542
20766	Totonicapan	1543
20767	Zacapa	1544
20768	Saint Annes	1545
20769	Castle	1546
20770	Forest	1547
20771	Sark	1554
20772	Torteval	1555
20773	Vale	1556
20774	Beyla	1557
20775	Boffa	1558
20776	Boke	1559
20777	Conakry	1560
20778	Coyah	1561
20779	Dabola	1562
20780	Dalaba	1563
20781	Dinguiraye	1564
20782	Faranah	1565
20783	Forecariah	1566
20784	Fria	1567
20785	Gaoual	1568
20786	Guekedou	1569
20787	Kankan	1570
20788	Kerouane	1571
20789	Kindia	1572
20790	Kissidougou	1573
20791	Koubia	1574
20792	Koundara	1575
20793	Kouroussa	1576
20794	Labe	1577
20795	Lola	1578
20796	Macenta	1579
20797	Mali	1580
20798	Mamou	1581
20799	Mandiana	1582
20800	Nzerekore	1583
20801	Pita	1584
20802	Siguiri	1585
20803	Telimele	1586
20804	Tougue	1587
20805	Yomou	1588
20806	Bafata	1589
20807	Bissau	1590
20808	Bolama	1591
20809	Bubaque	1591
20810	Cacheu	1592
20811	Canchungo	1592
20812	Gabu	1593
20813	Bissora	1594
20814	Farim	1594
20815	Mansoa	1594
20816	Buba	1595
20817	Fulacunda	1595
20818	Quebo	1595
20819	Catio	1596
20820	Mabaruma	1597
20821	Morawhanna	1597
20822	Bartica	1598
20823	Issano	1598
20824	Kamarang	1598
20825	Georgetown	1599
20826	Mahaica	1599
20827	Paradise	1599
20828	Queenstown	1599
20829	Fort Wellington	1602
20830	Mahaicony	1602
20831	Rosignol	1602
20832	Anna Regina	1603
20833	Charity	1603
20834	Suddie	1603
20835	Mahdia	1604
20836	Tumatumari	1604
20837	Desdunes	1607
20838	Dessalines	1607
20839	Gonaives	1607
20840	Gros-Morne	1607
20841	LArtibonite	1607
20842	Saint-Marc	1607
20843	Saint-Michel-de-lAtalaye	1607
20844	Saint-Raphael	1607
20845	Verrettes	1607
20846	Hinche	1608
20847	Mirebalais	1608
20848	Anse-dHainault	1609
20849	Dame Marie	1609
20850	Jeremie	1609
20851	Miragoane	1609
20852	Cap-Haitien	1610
20853	Croix-des-Bouquets	1610
20854	Grande Riviere du Nord	1610
20855	Limbe	1610
20856	Pignon	1610
20857	Derac	1611
20858	Fort-Liberte	1611
20859	Ouanaminthe	1611
20860	Trou-du-Nord	1611
20861	Port-de-Paix	1612
20862	Saint-Louis-du-Nord	1612
20863	Anse-a-Galets	1613
20864	Carrefour	1613
20865	Delmas	1613
20866	Kenscoff	1613
20867	Lascahobas	1613
20868	Leogane	1613
20869	Petionville	1613
20870	Petit Goave	1613
20871	Port-au-Prince	1613
20872	Aquin	1614
20873	Les Cayes	1614
20874	Jacmel	1615
20875	La Ceiba	1617
20876	Olanchito	1617
20877	Tela	1617
20878	Choluteca	1618
20879	El Triunfo	1618
20880	Pespire	1618
20881	Sonaguera	1619
20882	Tocoa	1619
20883	Trujillo	1619
20884	Comayagua	1620
20885	Siguatepeque	1620
20886	Copan	1621
20887	Corquin	1621
20888	Dulce Nombre	1621
20889	El Paraiso	1621
20890	San Antonio	1621
20891	San Nicolas	1621
20892	Santa Rosa de Copan	1621
20893	Choloma	1622
20894	La Lima	1622
20895	Omoa	1622
20896	Puerto Cortes	1622
20897	San Pedro Sula	1622
20898	Intibuca	1627
20899	La Esperanza	1627
20900	Utila	1627
20901	Gracias	1630
20902	Ocotepeque	1631
20903	San Marcos	1631
20904	Sinuapa	1631
20905	Catacamas	1632
20906	Juticalpa	1632
20907	Amapala	1634
20908	Langue	1634
20909	Nacaome	1634
20910	San Lorenzo	1634
20911	El Progreso	1635
20912	Morazan	1635
20913	Santa Rita	1635
20914	Yoro	1635
20915	Akaszto	1637
20916	Bacsalmas	1637
20917	Bacsbokod	1637
20918	Baja	1637
20919	Bugac	1637
20920	Davod	1637
20921	Dunapataj	1637
20922	Dunavecse	1637
20923	Fulopszallas	1637
20924	Hajos	1637
20925	Harta	1637
20926	Izsak	1637
20927	Jakabszallas	1637
20928	Janoshalma	1637
20929	Kalocsa	1637
20930	Kecel	1637
20931	Kecskemet	1637
20932	Kiskoros	1637
20933	Kiskunfelegyhaza	1637
20934	Kiskunhalas	1637
20935	Kiskunmajsa	1637
20936	Kunfeherto	1637
20937	Kunszentmiklos	1637
20938	Lajosmizse	1637
20939	Lakitelek	1637
20940	Madaras	1637
20941	Melykut	1637
20942	Nagybaracska	1637
20943	Orgovany	1637
20944	Palmonostora	1637
20945	Solt	1637
20946	Soltvadkert	1637
20947	Sukosd	1637
20948	Szabadszallas	1637
20949	Szalkszentmarton	1637
20950	Tass	1637
20951	Tiszakecske	1637
20952	Tompa	1637
20953	Beremend	1638
20954	Boly	1638
20955	Dunaszekcso	1638
20956	Harkany	1638
20957	Hosszuheteny	1638
20958	Komlo	1638
20959	Magocs	1638
20960	Mohacs	1638
20961	Pecs	1638
20962	Pecsvarad	1638
20963	Sasd	1638
20964	Sellye	1638
20965	Siklos	1638
20966	Szentlorinc	1638
20967	Szigetvar	1638
20968	Vajszlo	1638
20969	Villany	1638
20970	Battonya	1639
20971	Bekes	1639
20972	Bekescsaba	1639
20973	Bekessamson	1639
20974	Bekesszentandras	1639
20975	Csorvas	1639
20976	Devavanya	1639
20977	Doboz	1639
20978	Elek	1639
20979	Endrod	1639
20980	Fuzesgyarmat	1639
20981	Gyula	1639
20982	Ketegyhaza	1639
20983	Kondoros	1639
20984	Korosladany	1639
20985	Kunagota	1639
20986	Lokoshaza	1639
20987	Mezobereny	1639
20988	Mezohegyes	1639
20989	Mezokovacshaza	1639
20990	Nagyszenas	1639
20991	Oroshaza	1639
20992	Sarkad	1639
20993	Szabadkigyos	1639
20994	Szarvas	1639
20995	Szeghalom	1639
20996	Totkomlos	1639
20997	Veszto	1639
20998	Abaujszanto	1640
20999	Arlo	1640
21000	Bogacs	1640
21001	Cigand	1640
21002	Edeleny	1640
21003	Emod	1640
21004	Encs	1640
21005	Gonc	1640
21006	Karcsa	1640
21007	Kazincbarcika	1640
21008	Mad	1640
21009	Megyaszo	1640
21010	Mezokeresztes	1640
21011	Mezokovesd	1640
21012	Miskolc	1640
21013	Monok	1640
21014	Nyekladhaza	1640
21015	Olaszliszka	1640
21016	Onod	1640
21017	Ozd	1640
21018	Putnok	1640
21019	Rudabanya	1640
21020	Sajokaza	1640
21021	Sajolad	1640
21022	Sajoszentpeter	1640
21023	Saly	1640
21024	Sarospatak	1640
21025	Satoraljaujhely	1640
21026	Szendro	1640
21027	Szentistvan	1640
21028	Szerencs	1640
21029	Szihalom	1640
21030	Szikszo	1640
21031	Taktaharkany	1640
21032	Taktaszada	1640
21033	Tallya	1640
21034	Tarcal	1640
21035	Tiszaluc	1640
21036	Tiszaujvaros	1640
21037	Tokaj	1640
21038	Tolcsva	1640
21039	Budapest	1641
21040	Csongrad	1642
21041	Fabiansebestyen	1642
21042	Foldeak	1642
21043	Hodmezovasarhely	1642
21044	Kiskundorozsma	1642
21045	Kistelek	1642
21046	Kiszombor	1642
21047	Mako	1642
21048	Mindszent	1642
21049	Morahalom	1642
21050	Pusztaszer	1642
21051	Roszke	1642
21052	Sandorfalva	1642
21053	Szatymaz	1642
21054	Szeged	1642
21055	Szegvar	1642
21056	Szekkutas	1642
21057	Szentes	1642
21058	Aba	1643
21059	Adony	1643
21060	Alap	1643
21061	Apostag	1643
21062	Bakonycsernye	1643
21063	Bicske	1643
21064	Bodajk	1643
21065	Cece	1643
21066	Csakvar	1643
21067	Deg	1643
21068	Dios	1643
21069	Dunaujvaros	1643
21070	Enying	1643
21071	Ercsi	1643
21072	Etyek	1643
21073	Fehervarcsurgo	1643
21074	Lovasbereny	1643
21075	Martonvasar	1643
21076	Mezofalva	1643
21077	Mezoszilas	1643
21078	Mor	1643
21079	Pazmand	1643
21080	Polgardi	1643
21081	Pusztavam	1643
21082	Rackeresztur	1643
21083	Sarbogard	1643
21084	Seregelyes	1643
21085	Soponya	1643
21086	Szabadbattyan	1643
21087	Szekesfehervar	1643
21088	Val	1643
21089	Asvanyraro	1644
21090	Beled	1644
21091	Bosarkany	1644
21092	Csorna	1644
21093	Fertod	1644
21094	Fertorakos	1644
21095	Fertoszentmiklos	1644
21096	Gyor	1644
21097	Gyorujbarat	1644
21098	Hunyadi u.	1644
21099	Kapuvar	1644
21100	Lebeny	1644
21101	Mihalyi	1644
21102	Mosonmagyarovar	1644
21103	Nyul	1644
21104	Pannonhalma	1644
21105	Rajka	1644
21106	Sopron	1644
21107	Szany	1644
21108	Tet	1644
21109	Balmazujvaros	1645
21110	Barand	1645
21111	Berettyoujfalu	1645
21112	Biharkeresztes	1645
21113	Biharnagybajom	1645
21114	Debrecen	1645
21115	Derecske	1645
21116	Egyek	1645
21117	Foldes	1645
21118	Hajduboszormeny	1645
21119	Hajdudorog	1645
21120	Hajduhadhaz	1645
21121	Hajdusamson	1645
21122	Hajduszoboszlo	1645
21123	Hajduszovat	1645
21124	Hortobagy	1645
21125	Hosszupalyi	1645
21126	Kaba	1645
21127	Komadi	1645
21128	Mikepercs	1645
21129	Monostorpalyi	1645
21130	Nadudvar	1645
21131	Nagyleta	1645
21132	Nyirabrany	1645
21133	Nyiracsad	1645
21134	Nyiradony	1645
21135	Polgar	1645
21136	Puspokladany	1645
21137	Sarretudvari	1645
21138	Tiszacsege	1645
21139	Ujfeherto	1645
21140	Vamospercs	1645
21141	Abasar	1646
21142	Andornaktalya	1646
21143	Belapatfalva	1646
21144	Domoszlo	1646
21145	Eger	1646
21146	Erdotelek	1646
21147	Felsotarkany	1646
21148	Fuzesabony	1646
21149	Gyongyos	1646
21150	Gyongyospata	1646
21151	Gyongyossolymos	1646
21152	Gyongyostarjan	1646
21153	Hatvan	1646
21154	Heves	1646
21155	Kal	1646
21156	Lorinci	1646
21157	Matraderecske	1646
21158	Parad	1646
21159	Petervasara	1646
21160	Recsk	1646
21161	Sirok	1646
21162	Tarnalelesz	1646
21163	Verpelet	1646
21164	Abadszalok	1647
21165	Besenyszog	1647
21166	Cserkeszolo	1647
21167	Fegyvernek	1647
21168	Hegyeshalom	1647
21169	Jaszalsoszentgyorgy	1647
21170	Jaszapati	1647
21171	Jaszarokszallas	1647
21172	Jaszbereny	1647
21173	Jaszfenyzaru	1647
21174	Jaszjakohalma	1647
21175	Jaszkiser	1647
21176	Jaszladany	1647
21177	Jaszszentandras	1647
21178	Karcag	1647
21179	Kenderes	1647
21180	Kisujszallas	1647
21181	Kunhegyes	1647
21182	Kunmadaras	1647
21183	Kunszentmarton	1647
21184	Martfu	1647
21185	Mezotur	1647
21186	Ocsod	1647
21187	Szolnok	1647
21188	Tiszabura	1647
21189	Tiszafoldvar	1647
21190	Tiszafured	1647
21191	Tiszapuspoki	1647
21192	Tiszaroff	1647
21193	Tiszasuly	1647
21194	Torokszentmiklos	1647
21195	Toszeg	1647
21196	Turkeve	1647
21197	Ujszasz	1647
21198	Acs	1648
21199	Almasfuzito	1648
21200	Babolna	1648
21201	Bajna	1648
21202	Dorog	1648
21203	Esztergom	1648
21204	Kesztolc	1648
21205	Kisber	1648
21206	Komarom	1648
21207	Kornye	1648
21208	Labatlan	1648
21209	Mocsa	1648
21210	Nagyigmand	1648
21211	Nyergesujfalu	1648
21212	Oroszlany	1648
21213	Sarisap	1648
21214	Tardos	1648
21215	Tarjan	1648
21216	Tata	1648
21217	Tatabanya	1648
21218	Tokod	1648
21219	Vertesszolos	1648
21220	Balassagyarmat	1649
21221	Batonyterenye	1649
21222	Bercel	1649
21223	Bujak	1649
21224	Diosjeno	1649
21225	Karancskeszi	1649
21226	Matraverebely	1649
21227	Nagyoroszi	1649
21228	Paszto	1649
21229	Retsag	1649
21230	Romhany	1649
21231	Salgotarjan	1649
21232	Szecseny	1649
21233	Tar	1649
21234	Abony	1650
21235	Albertirsa	1650
21236	Aszod	1650
21237	Biatorbagy	1650
21238	Budakalasz	1650
21239	Budakeszi	1650
21240	Budaors	1650
21241	Bugyi	1650
21242	Cegled	1650
21243	Csobanka	1650
21244	Dabas	1650
21245	Domsod	1650
21246	Dunabogdany	1650
21247	Dunaharaszti	1650
21248	Dunakeszi	1650
21249	Erd	1650
21250	Forro	1650
21251	Fot	1650
21252	Galgaheviz	1650
21253	God	1650
21254	Godollo	1650
21255	Gyomro	1650
21256	Hevizgyork	1650
21257	Isaszeg	1650
21258	Jaszkarajeno	1650
21259	Kiskunlachaza	1650
21260	Kocser	1650
21261	Koka	1650
21262	Kosd	1650
21263	Maglod	1650
21264	Monor	1650
21265	Nagykata	1650
21266	Nagykoros	1650
21267	Nagykovacsi	1650
21268	Nagymaros	1650
21269	Nagytarcsa	1650
21270	Nyaregyhaza	1650
21271	Ocsa	1650
21272	Orbottyan	1650
21273	Orkeny	1650
21274	Paty	1650
21275	Pecel	1650
21276	Perbal	1650
21277	Pilis	1650
21278	Pilisborosjeno	1650
21279	Piliscsaba	1650
21280	Pilisszanto	1650
21281	Pilisszentivan	1650
21282	Pilisszentkereszt	1650
21283	Pilisvorosvar	1650
21284	Pomaz	1650
21285	Racalmas	1650
21286	Rackeve	1650
21287	Solymar	1650
21288	Soskut	1650
21289	Szada	1650
21290	Szazhalombatta	1650
21291	Szentendre	1650
21292	Szentmartonkata	1650
21293	Szigetcsep	1650
21294	Szigetszentmiklos	1650
21295	Szigetujfalu	1650
21296	Szob	1650
21297	Tahitofalu	1650
21298	Tapiobicske	1650
21299	Tapioszecso	1650
21300	Tapioszele	1650
21301	Toalmas	1650
21302	Torokbalint	1650
21303	Tortel	1650
21304	Tura	1650
21305	Ullo	1650
21306	Uri	1650
21307	Urom	1650
21308	Vac	1650
21309	Vecses	1650
21310	Veresegyhaz	1650
21311	Verocemaros	1650
21312	Visegrad	1650
21313	Zsambek	1650
21314	Zsambok	1650
21315	Adand	1651
21316	Balatonfoldvar	1651
21317	Balatonoszod	1651
21318	Balatonszabadi	1651
21319	Balatonszarszo	1651
21320	Barcs	1651
21321	Berzence	1651
21322	Boglarlelle	1651
21323	Bohonye	1651
21324	Csurgo	1651
21325	Fonyod	1651
21326	Kaposvar	1651
21327	Karad	1651
21328	Kethely	1651
21329	Lengyeltoti	1651
21330	Marcali	1651
21331	Nagyatad	1651
21332	Nagybajom	1651
21333	Siofok	1651
21334	Somogyvar	1651
21335	Tab	1651
21336	Zamardi	1651
21337	Ajak	1652
21338	Baktaloranthaza	1652
21339	Balkany	1652
21340	Buj	1652
21341	Demecser	1652
21342	Dombrad	1652
21343	Fehergyarmat	1652
21344	Ibrany	1652
21345	Kemecse	1652
21346	Kisvarda	1652
21347	Kotaj	1652
21348	Mandok	1652
21349	Mariapocs	1652
21350	Mateszalka	1652
21351	Nagyecsed	1652
21352	Nagyhalasz	1652
21353	Nagykallo	1652
21354	Nyirbator	1652
21355	Nyirbeltek	1652
21356	Nyiregyhaza	1652
21357	Nyirmada	1652
21358	Nyirpazony	1652
21359	Nyirtelek	1652
21360	Ofeherto	1652
21361	Rakamaz	1652
21362	Tarpa	1652
21363	Tiszabercel	1652
21364	Tiszalok	1652
21365	Tiszavasvari	1652
21366	Tuzser	1652
21367	Vaja	1652
21368	Vasarosnameny	1652
21369	Zahony	1652
21370	Bataszek	1653
21371	Bonyhad	1653
21372	Decs	1653
21373	Dombovar	1653
21374	Dunafoldvar	1653
21375	Fadd	1653
21376	Gyonk	1653
21377	Hogyesz	1653
21378	Iregszemcse	1653
21379	Madocsa	1653
21380	Nagymagocs	1653
21381	Nagymanyok	1653
21382	Ozora	1653
21383	Paks	1653
21384	Pincehely	1653
21385	Simontornya	1653
21386	Szekszard	1653
21387	Szentgal	1653
21388	Tamasi	1653
21389	Tengelic	1653
21390	Tolna	1653
21391	Zomba	1653
21392	Buk	1654
21393	Celldomolk	1654
21394	Csepreg	1654
21395	Gencsapati	1654
21396	Jak	1654
21397	Janoshaza	1654
21398	Kormend	1654
21399	Koszeg	1654
21400	Sarvar	1654
21401	Szentgotthard	1654
21402	Szombathely	1654
21403	Vasvar	1654
21404	Vep	1654
21405	Ajka	1655
21406	Badacsonytomaj	1655
21407	Balatonalmadi	1655
21408	Balatonfured	1655
21409	Balatonfuzfo	1655
21410	Balatonkenese	1655
21411	Band	1655
21412	Berhida	1655
21413	Csabrendek	1655
21414	Devecser	1655
21415	Herend	1655
21416	Papa	1655
21417	Sumeg	1655
21418	Tapolca	1655
21419	Urkut	1655
21420	Varpalota	1655
21421	Veszprem	1655
21422	Zirc	1655
21423	Becsehely	1656
21424	Heviz	1656
21425	Keszthely	1656
21426	Lenti	1656
21427	Letenye	1656
21428	Nagykanizsa	1656
21429	Sarmellek	1656
21430	Turje	1656
21431	Zalaegerszeg	1656
21432	Zalakomar	1656
21433	Zalalovo	1656
21434	Zalaszentgrot	1656
21435	Bakkafjor ur	1657
21436	Borgarfjor ur	1657
21437	Brei dalsvik	1657
21438	Djupivogur	1657
21439	Egilssta ir	1657
21440	Eskifjor ur	1657
21441	Faskru sfjor ur	1657
21442	Fellabar	1657
21443	Hallormssta ur	1657
21444	Hofn	1657
21445	Nesjakauptun	1657
21446	Neskaupsta ur	1657
21447	Rey arfjor ur	1657
21448	Sey isfjor ur	1657
21449	Sto varfjor ur	1657
21450	Vopnafjor ur	1657
21451	Akranes	1665
21452	Borgarnes	1665
21453	Bu ardalur	1665
21454	Grundarfjor ur	1665
21455	Hellissandur	1665
21456	Hvanneyri	1665
21457	Olafsvik	1665
21458	Rif	1665
21459	Stykkisholmur	1665
21460	Banda Aceh	1666
21461	Bireun	1666
21462	Langsa	1666
21463	Lhokseumawe	1666
21464	Meulaboh	1666
21465	Denpasar	1667
21466	Karangasem	1667
21467	Klungkung	1667
21468	Kuta	1667
21469	Negara	1667
21470	Singaraja	1667
21471	Tabanan	1667
21472	Ubud	1667
21473	Manggar	1668
21474	Mentok	1668
21475	Pangkal Pinang	1668
21476	Sungai Liat	1668
21477	Tanjung Pandan	1668
21478	Toboali-Rias	1668
21479	Cikupa	1669
21480	Cilegon	1669
21481	Ciputat	1669
21482	Curug	1669
21483	Kresek	1669
21484	Labuhan	1669
21485	Pandegelang	1669
21486	Pondok Aren	1669
21487	Rangkasbitung	1669
21488	Serang	1669
21489	Serpong	1669
21490	Tangerang	1669
21491	Teluknaga	1669
21492	Bengkulu	1670
21493	Curup	1670
21494	Gandaria	1671
21495	Gorontalo	1672
21496	Cengkareng	1673
21497	Jakarta	1673
21498	Jambi	1674
21499	Kualatungka	1674
21500	Simpang	1674
21501	Sungaipenuh	1674
21502	Kendal	1682
21503	Bandar Lampung	1683
21504	Kota Bumi	1683
21505	Metro	1683
21506	Pringsewu	1683
21507	Terbanggi Besar	1683
21508	Amahai	1684
21509	Ambon	1684
21510	Tual	1684
21511	Amahai	1685
21512	Ambon	1685
21513	Tual	1685
21514	Aberpura	1688
21515	Biak	1688
21516	Jaya Pura	1688
21517	Manokwari	1688
21518	Merauke	1688
21519	Sorong	1688
21520	Balaipungut	1689
21521	Bengkalis	1689
21522	Dumai	1689
21523	Duri	1689
21524	Pekan Baru	1689
21525	Selatpanjang	1689
21526	Tanjung Balai-Meral	1689
21527	Tembilahan	1689
21528	Balaipungut	1690
21529	Bengkalis	1690
21530	Dumai	1690
21531	Duri	1690
21532	Pekan Baru	1690
21533	Selatpanjang	1690
21534	Tanjung Balai-Meral	1690
21535	Tembilahan	1690
21536	Solo	1691
21537	Bambanglipuro	1699
21538	Banguntapan	1699
21539	Bantul	1699
21540	Depok	1699
21541	Gamping	1699
21542	Godean	1699
21543	Jetis	1699
21544	Kasihan	1699
21545	Ngaglik	1699
21546	Pandak	1699
21547	Pundong	1699
21548	Sewon	1699
21549	Seyegan	1699
21550	Sleman	1699
21551	Srandakan	1699
21552	Wonosari	1699
21553	Yogyakarta	1699
21554	Ardabil	1700
21555	Garmi	1700
21556	Khalkhal	1700
21557	Meshkinshahr	1700
21558	Parsabad	1700
21559	Bandar-e Gonaveh	1703
21560	Borazjan	1703
21561	Bushehr	1703
21562	Dashti	1703
21563	Dir	1703
21564	Khormuj	1703
21565	Kongan	1703
21566	Tangestan	1703
21567	Ardistan	1705
21568	Dorchehpiyaz	1705
21569	Dowlatabad	1705
21570	Esfahan	1705
21571	Falavarjan	1705
21572	Faridan	1705
21573	Fereydunshahr	1705
21574	Fuladshahr	1705
21575	Golara	1705
21576	Golpayegan	1705
21577	Kashan	1705
21578	Kelishad	1705
21579	Khomeynishahr	1705
21580	Khonsar	1705
21581	Khuresgan	1705
21582	Mobarakeh	1705
21583	Nain	1705
21584	Najafabad	1705
21585	Natnaz	1705
21586	Qahdarijan	1705
21587	Rehnan	1705
21588	Semirom	1705
21589	Shahinshahr	1705
21590	Shahreza	1705
21591	Zarinshahr	1705
21592	Abadeh	1706
21593	Akbarabad	1706
21594	Darab	1706
21595	Eqlid	1706
21596	Estehban	1706
21597	Fasa	1706
21598	Firuzabad	1706
21599	Gerash	1706
21600	Jahrom	1706
21601	Kazerun	1706
21602	Lar	1706
21603	Marv Dasht	1706
21604	Neyriz	1706
21605	Nurabad	1706
21606	Qaemiyeh	1706
21607	Sepidan	1706
21608	Shiraz	1706
21609	Astaneh-ye Ashrafiyeh	1707
21610	Astara	1707
21611	Bandar-e Anzali	1707
21612	Faman	1707
21613	Hashtpar	1707
21614	Lahijan	1707
21615	Langarud	1707
21616	Rasht	1707
21617	Rudbar	1707
21618	Rudsar	1707
21619	Sawmaeh Sara	1707
21620	Aq Qaleh	1708
21621	Azad Shahr	1708
21622	Bandar-e Torkaman	1708
21623	Gonbad-e Qabus	1708
21624	Gorgan	1708
21625	Asadabad	1709
21626	Bahar	1709
21627	Hamadan	1709
21628	Malayer	1709
21629	Nahavand	1709
21630	Tuysarkan	1709
21631	Bandar Abbas	1710
21632	Bandar-e Abbas	1710
21633	Bandar-e Lengeh	1710
21634	Gheshm	1710
21635	Jask	1710
21636	Kish	1710
21637	Kish Island	1710
21638	Minab	1710
21639	Abdanan	1711
21640	Darrehshahr	1711
21641	Dehloran	1711
21642	Ilam	1711
21643	Ivan	1711
21644	Mehran	1711
21645	Baft	1712
21646	Bam	1712
21647	Bardsir	1712
21648	Jiroft	1712
21649	Kahnuj	1712
21650	Kerman	1712
21651	Rafsanjan	1712
21652	Ravar	1712
21653	Shahr-e Babak	1712
21654	Sirjan	1712
21655	Zarand	1712
21656	Eslamabad	1713
21657	Gilan-e Garb	1713
21658	Harsin	1713
21659	Javanrud	1713
21660	Kangavar	1713
21661	Kermanshah	1713
21662	Paveh	1713
21663	Sahneh	1713
21664	Sar-e-Pol-e-Zohab	1713
21665	Sonqor	1713
21666	Birjand	1714
21667	Bojnurd	1714
21668	Chenaran	1714
21669	Darreh Gaz	1714
21670	Esfarayen	1714
21671	Fariman	1714
21672	Ferdus	1714
21673	Ghanat	1714
21674	Gonabad	1714
21675	Kashmar	1714
21676	Mashad	1714
21677	Mashhad	1714
21678	Neyshabur	1714
21679	Qayen	1714
21680	Quchan	1714
21681	Sabzevar	1714
21682	Sarakhs	1714
21683	Shirvan	1714
21684	Tabas	1714
21685	Tayyebat	1714
21686	Torbat-e Heydariyeh	1714
21687	Torbat-e Jam	1714
21688	Abadan	1715
21689	Agha Jari	1715
21690	Ahvaz	1715
21691	Ahwaz	1715
21692	Andimeshk	1715
21693	Bandar-e Emam Khomeyni	1715
21694	Bandar-e Mahshahr	1715
21695	Behbahan	1715
21696	Dezful	1715
21697	Ezeh	1715
21698	Hendijan	1715
21699	Khorramshahr	1715
21700	Masjed-e Soleyman	1715
21701	Omidiyeh	1715
21702	Ramhormoz	1715
21703	Ramshir	1715
21704	Shadegan	1715
21705	Shush	1715
21706	Shushtar	1715
21707	Susangerd	1715
21708	Baneh	1717
21709	Bijar	1717
21710	Kamyaran	1717
21711	Marivan	1717
21712	Qorveh	1717
21713	Sanandaj	1717
21714	Saqqez	1717
21715	Alashtar	1718
21716	Aligudarz	1718
21717	Azna	1718
21718	Borujerd	1718
21719	Do Rud	1718
21720	Khorramabad	1718
21721	Kuhdasht	1718
21722	Nurabad	1718
21723	Arak	1719
21724	Ashtian	1719
21725	Delijan	1719
21726	Khomeyn	1719
21727	Mahallat	1719
21728	Sarband	1719
21729	Saveh	1719
21730	Tafresh	1719
21731	Aliabad	1720
21732	Amir Kala	1720
21733	Amol	1720
21734	Babol	1720
21735	Babol Sar	1720
21736	Behshahr	1720
21737	Chalus	1720
21738	Fereydunkenar	1720
21739	Juybar	1720
21740	Kalaleh	1720
21741	Kordkuy	1720
21742	Mahmudabad	1720
21743	Minudasht	1720
21744	Neka	1720
21745	Nur	1720
21746	Nushahr	1720
21747	Qaemshahr	1720
21748	Ramsar	1720
21749	Sari	1720
21750	Savadkuh	1720
21751	Tonekabon	1720
21752	Abhar	1722
21753	Abyek	1722
21754	Qazvin	1722
21755	Takestan	1722
21756	Qom	1723
21757	Damghan	1724
21758	Garmsar	1724
21759	Semnan	1724
21760	Shahrud	1724
21761	Damavand	1726
21762	Eqbaliyeh	1726
21763	Eslamshahr	1726
21764	Hashtgerd	1726
21765	Karaj	1726
21766	Mahdasht	1726
21767	Malard	1726
21768	Mohammadiyeh	1726
21769	Nazarabad	1726
21770	Pakdasht	1726
21771	Pishva	1726
21772	Qarchak	1726
21773	Qods	1726
21774	Robat Karim	1726
21775	Shahriyar	1726
21776	Tehran	1726
21777	Varamin	1726
21778	Ardakan	1727
21779	Bafq	1727
21780	Mehriz	1727
21781	Meybod	1727
21782	Taft	1727
21783	Yazd	1727
21784	Alvand	1728
21785	Khorramdarreh	1728
21786	Zanjan	1728
21787	Jurf-as-Sakhr	1729
21788	Saddat-al-Hindiyah	1729
21789	al-Hillah	1729
21790	al-Madhatiyah	1729
21791	al-Musayyib	1729
21792	al-Qasim	1729
21793	Baghdad	1730
21794	Dahuk	1731
21795	Zakhu	1731
21796	Baqubah	1733
21797	Hanaqin	1733
21798	Jalula	1733
21799	Kifri	1733
21800	Mandali	1733
21801	al-Fuhud	1733
21802	al-Khalis	1733
21803	al-Miqdadiyah	1733
21804	ash-Shatrah	1733
21805	Ankawa	1734
21806	Chaqalawa	1735
21807	Irbil	1735
21808	Rawanduz	1735
21809	Karbala	1736
21810	al-Hindiyah	1736
21811	Erbil	1737
21812	Ali al Gharbi	1738
21813	al-Amarah	1738
21814	al-Majarr-al-Kabir	1738
21815	Qarah Qush	1739
21816	Sinjar	1739
21817	Tall Afar	1739
21818	Tall Kayf	1739
21819	al-Mawsil	1739
21820	ash-Shaykhan	1739
21821	Balad	1740
21822	Bayji	1740
21823	Dhaluiyah	1740
21824	Samarra	1740
21825	Tikrit	1740
21826	Tuz	1740
21827	ad-Dujayl	1740
21828	al-Aziziyah	1741
21829	al-Hayy	1741
21830	al-Kut	1741
21831	an-Numaniyah	1741
21832	as-Suwayrah	1741
21833	Anah	1742
21834	Hit	1742
21835	Rawah	1742
21836	al-Fallujah	1742
21837	al-Habbaniyah	1742
21838	al-Hadithah	1742
21839	ar-Ramadi	1742
21840	ar-Rutbah	1742
21841	Abu al-Khasib	1743
21842	Harithah	1743
21843	Shatt-al-Arab	1743
21844	al-Basrah	1743
21845	al-Faw	1743
21846	al-Qurnah	1743
21847	az-Zubayr	1743
21848	ar-Rumaythah	1744
21849	as-Samawah	1744
21850	Afak	1745
21851	ad-Diwaniyah	1745
21852	al-Ghammas	1745
21853	al-Hamzah	1745
21854	ash-Shamiyah	1745
21855	ash-Shinafiyah	1745
21856	al-Kufah	1746
21857	al-Mishkhab	1746
21858	an-Najaf	1746
21859	Chamchamal	1747
21860	Halabjah	1747
21861	Kusanjaq	1747
21862	Panjwin	1747
21863	Qalat Dizeh	1747
21864	as-Sulaymaniyah	1747
21865	Aqrah	1748
21866	Kirkuk	1748
21867	Moira	1749
21868	Bagenalstown	1750
21869	Carlow	1750
21870	Tullow	1750
21871	Bailieborough	1751
21872	Belturbet	1751
21873	Cavan	1751
21874	Coothill	1751
21875	Ennis	1752
21876	Kilkee	1752
21877	Kilrush	1752
21878	Newmarket-on-Fergus	1752
21879	Shannon	1752
21880	Bandon	1753
21881	Bantry	1753
21882	Blarney	1753
21883	Carrigaline	1753
21884	Charleville	1753
21885	Clonakilty	1753
21886	Cobh	1753
21887	Cork	1753
21888	Drishane	1753
21889	Dunmanway	1753
21890	Fermoy	1753
21891	Kanturk	1753
21892	Kinsale	1753
21893	Macroom	1753
21894	Mallow	1753
21895	Midleton	1753
21896	Millstreet	1753
21897	Mitchelstown	1753
21898	Passage West	1753
21899	Skibbereen	1753
21900	Youghal	1753
21901	Ballybofey	1754
21902	Ballyshannon	1754
21903	Buncrana	1754
21904	Bundoran	1754
21905	Carndonagh	1754
21906	Donegal	1754
21907	Killybegs	1754
21908	Letterkenny	1754
21909	Lifford	1754
21910	Moville	1754
21911	Balbriggan	1755
21912	Ballsbridge	1755
21913	Dublin	1755
21914	Leixlip	1755
21915	Lucan	1755
21916	Malahide	1755
21917	Portrane	1755
21918	Rathcoole	1755
21919	Rush	1755
21920	Skerries	1755
21921	Swords	1755
21922	Athenry	1756
21923	Ballinasloe	1756
21924	Clifden	1756
21925	Galway	1756
21926	Gort	1756
21927	Loughrea	1756
21928	Tuam	1756
21929	Ballybunion	1757
21930	Cahirciveen	1757
21931	Castleisland	1757
21932	Dingle	1757
21933	Kenmare	1757
21934	Killarney	1757
21935	Killorglin	1757
21936	Listowel	1757
21937	Tralee	1757
21938	Athy	1758
21939	Celbridge	1758
21940	Clane	1758
21941	Kilcock	1758
21942	Kilcullen	1758
21943	Kildare	1758
21944	Maynooth	1758
21945	Monasterevan	1758
21946	Naas	1758
21947	Newbridge	1758
21948	Callan	1759
21949	Castlecomer	1759
21950	Kilkenny	1759
21951	Thomastown	1759
21952	Abbeyleix	1760
21953	Mountmellick	1760
21954	Mountrath	1760
21955	Port Laoise	1760
21956	Portarlington	1760
21957	Meath	1761
21958	Carrick-on-Shannon	1762
21959	Abbeyfeale	1763
21960	Kilmallock	1763
21961	Limerick	1763
21962	Newcastle	1763
21963	Rathkeale	1763
21964	Granard	1765
21965	Longford	1765
21966	Moate	1765
21967	Ardee	1766
21968	Drogheda	1766
21969	Drumcar	1766
21970	Dundalk	1766
21971	Ballina	1767
21972	Ballinrobe	1767
21973	Ballyhaunis	1767
21974	Castlebar	1767
21975	Claremorris	1767
21976	Swinford	1767
21977	Westport	1767
21978	Ashbourne	1768
21979	Duleek	1768
21980	Dunboyne	1768
21981	Dunshaughlin	1768
21982	Kells	1768
21983	Laytown	1768
21984	Navan	1768
21985	Trim	1768
21986	Carrickmacross	1769
21987	Castleblayney	1769
21988	Clones	1769
21989	Monaghan	1769
21990	Banagher	1770
21991	Birr	1770
21992	Clara	1770
21993	Edenderry	1770
21994	Kilcormac	1770
21995	Tullamore	1770
21996	Ballaghaderreen	1771
21997	Boyle	1771
21998	Castlerea	1771
21999	Roscommon	1771
22000	Sligo	1772
22001	Co Tyrone	1775
22002	Downpatrick	1775
22003	Dungarvan	1776
22004	Tramore	1776
22005	Waterford	1776
22006	Athlone	1777
22007	Mullingar	1777
22008	Enniscorthy	1778
22009	Gorey	1778
22010	New Ross	1778
22011	Wexford	1778
22012	Arklow	1779
22013	Baltinglass	1779
22014	Blessington	1779
22015	Bray	1779
22016	Greystones	1779
22017	Kilcoole	1779
22018	Newtownmountkennedy	1779
22019	Rathdrum	1779
22020	Wicklow	1779
22021	Bethlehem	1782
22022	Caesarea	1783
22023	Petach Tikva	1784
22024	Ramallah	1784
22025	Gaza	1785
22026	Arad	1786
22027	Omer	1786
22028	Ashdod	1786
22029	Ashqelon	1786
22030	Beer Sheva	1786
22031	Beersheba	1786
22032	Bene Ayish	1786
22033	Dimona	1786
22034	Elat	1786
22035	Gan Yavne	1786
22036	Nahal `Oz	1786
22037	Netivot	1786
22038	Ofaqim	1786
22039	Qiryat Gat	1786
22040	Qiryat Malakhi	1786
22041	Sederot	1786
22042	Yeroham	1786
22043	kiryat Malachi	1786
22044	Beer Yaaqov	1788
22045	Beit Shemesh	1788
22046	Bene Beraq	1788
22047	Bnei Brak	1788
22048	Even Yehuda	1788
22049	Fureidis	1788
22050	Gat Rimon	1788
22051	Gedera	1788
22052	Givat Shmuel	1788
22053	Hibat Zion	1788
22054	Hod HaSharon	1788
22055	Hogar	1788
22056	Jaljulye	1788
22057	Jatt	1788
22058	Kafar Qasem	1788
22059	Kefar Sava	1788
22060	Kefar Yona	1788
22061	Kfar Saba	1788
22062	Kiryag Bialik	1788
22063	Lod	1788
22064	Mazkeret Batya	1788
22065	Modiin	1788
22066	Nes Ziyyona	1788
22067	Ness Ziona	1788
22068	Netanya	1788
22069	Nordiya	1788
22070	Pardesiyya	1788
22071	Petakh Tiqwa	1788
22072	Qadima	1788
22073	Qalansawe	1788
22074	Qiryat Eqron	1788
22075	Raanana	1788
22076	Ramla	1788
22077	Rehovot	1788
22078	Rekhovot	1788
22079	Rinnatya	1788
22080	Rishon LeZiyyon	1788
22081	Rosh HaAyin	1788
22082	Shoham	1788
22083	Tayibe	1788
22084	Tire	1788
22085	Tsur Igal	1788
22086	Udim	1788
22087	Yavne	1788
22088	Yehud	1788
22089	Afula	1789
22090	Akko	1789
22091	Arrabe	1789
22092	Ein Mahel	1789
22093	Ilut	1789
22094	Abu Sinan	1789
22095	Basmat Tabun	1789
22096	Beit Jann	1789
22097	Bet Shean	1789
22098	Bine	1789
22099	Bir-al-Maksur	1789
22100	Bueine-Nujeidat	1789
22101	Dabburye	1789
22102	Dayr Hannah	1789
22103	Dayr-al-Asad	1789
22104	Hazor HaGelilit	1789
22105	Ibillin	1789
22106	Iksal	1789
22107	Judeide-Maker	1789
22108	Kabul	1789
22109	Kafar Kanna	1789
22110	Kafar Manda	1789
22111	Kafar Yasif	1789
22112	Karmiel	1789
22113	Kisra-Sumei	1789
22114	Maalot Tarshikha	1789
22115	Majd-al-Kurum	1789
22116	Migdal HaEmeq	1789
22117	Mugar	1789
22118	Nahariyya	1789
22119	Nahef	1789
22120	Nazerat	1789
22121	Nazerat Illit	1789
22122	Qiryat Shemona	1789
22123	Qiryat Tivon	1789
22124	Rame	1789
22125	Reine	1789
22126	Sakhnin	1789
22127	Shefaram	1789
22128	Tamra	1789
22129	Tiberias	1789
22130	Turan	1789
22131	Yirka	1789
22132	Yoqneam Illit	1789
22133	Zefat	1789
22134	Zur Yigal	1789
22135	Hebron	1790
22136	Sgula	1791
22137	Jerusalem	1792
22138	Arara	1793
22139	Isifya	1793
22140	Baqa al-Gharbiyyah	1793
22141	Binyamina	1793
22142	Daliyat-al-Karmil	1793
22143	Jizr-az-Zarqa	1793
22144	Khadera	1793
22145	Khefa	1793
22146	Nesher	1793
22147	Or Aqiva	1793
22148	Pardes Khanna-Karkur	1793
22149	Qiryat Atta	1793
22150	Qiryat Bialik	1793
22151	Qiryat Motzkin	1793
22152	Qiryat Yam	1793
22153	Rekhasim	1793
22154	Tirat Karmel	1793
22155	Umm-al-Fahm	1793
22156	Zikhron Yaaqov	1793
22157	Qalqilya	1796
22158	Hadera	1799
22159	Kiryag Bialik	1799
22160	Bet Shemesh	1801
22161	Mevasserat Ziyyon	1801
22162	Yerushalayim	1801
22163	Meta	1802
22164	Miano	1802
22165	Alba Adriatica	1803
22166	Atessa	1803
22167	Atri	1803
22168	Avezzano	1803
22169	Celano	1803
22170	Cepagatti	1803
22171	Chieti	1803
22172	Citta SantAngelo	1803
22173	Francavilla al Mare	1803
22174	Giulianova	1803
22175	Guardiagrele	1803
22176	LAquila	1803
22177	Lanciano	1803
22178	Martinsicuro	1803
22179	Montesilvano	1803
22180	Montorio al Vomano	1803
22181	Mosciano SantAngelo	1803
22182	Ortona	1803
22183	Penne	1803
22184	Pescara	1803
22185	Pineto	1803
22186	Roseto degli Abruzzi	1803
22187	San Giovanni Teatino	1803
22188	San Salvo	1803
22189	SantEgidio alla Vibrata	1803
22190	Silvi	1803
22191	Spoltore	1803
22192	Sulmona	1803
22193	Teramo	1803
22194	Vasto	1803
22195	Agrigento	1804
22196	Alessandria della Rocca	1804
22197	Aragona	1804
22198	Bivona	1804
22199	Burgio	1804
22200	Calamonaci	1804
22201	Caltabellotta	1804
22202	Camastra	1804
22203	Cammarata	1804
22204	Campobello di Licata	1804
22205	CanicattÃƒÂ¬	1804
22206	Casteltermini	1804
22207	Castrofilippo	1804
22208	Cattolica Eraclea	1804
22209	Cianciana	1804
22210	Comitini	1804
22211	Favara	1804
22212	Grotte	1804
22213	Joppolo Giancaxio	1804
22214	Lampedusa e Linosa	1804
22215	Licata	1804
22216	Lucca Sicula	1804
22217	Menfi	1804
22218	Montallegro	1804
22219	Montevago	1804
22220	Naro	1804
22221	Palma di Montechiaro	1804
22222	Porto Empedocle	1804
22223	Racalmuto	1804
22224	Raffadali	1804
22225	Ravanusa	1804
22226	Realmonte	1804
22227	Ribera	1804
22228	Sambuca di Sicilia	1804
22229	San Biagio Platani	1804
22230	San Giovanni Gemini	1804
22231	Sant Angelo Muxaro	1804
22232	Santa Elisabetta	1804
22233	Santa Margherita di Belice	1804
22234	Santo Stefano Quisquina	1804
22235	Sciacca	1804
22236	Siculiana	1804
22237	Villafranca Sicula	1804
22238	Castellazzo Bormida	1805
22239	Gavi	1805
22240	Villanova Monferrato	1805
22241	Camerano	1806
22242	Castelplanio	1806
22243	Capolona	1807
22244	Montevarchi	1807
22245	Subbiano	1807
22246	Buttigliera dAsti	1809
22247	Flumeri	1810
22248	Nusco	1810
22249	Prata di Principato Ultra	1810
22250	Villanova del Battista	1810
22251	Avigliano	1812
22252	Bernalda	1812
22253	Ferrandina	1812
22254	Lauria	1812
22255	Lavello	1812
22256	Matera	1812
22257	Melfi	1812
22258	Montescaglioso	1812
22259	Pisticci	1812
22260	Policoro	1812
22261	Potenza	1812
22262	Rionero in Vulture	1812
22263	Venosa	1812
22264	Belluno	1813
22265	Dalpago	1813
22266	Longarone	1813
22267	Pedavena	1813
22268	San Bartolomeo	1814
22269		1815
22270	Bagnatica	1815
22271	Bergamo	1815
22272	Bolgare	1815
22273	Bottanuco	1815
22274	Brignano Gera dAdda	1815
22275	Calcio	1815
22276	Caravaggio	1815
22277	Chiuduno	1815
22278	Ciserano	1815
22279	Comun Nuovo	1815
22280	Costa di Mezzate	1815
22281	Gandino	1815
22282	Grassobbio	1815
22283	Grumello Del Monte	1815
22284	Grumello del Monte	1815
22285	Lallio	1815
22286	Levate	1815
22287	Lurano	1815
22288	Mapello	1815
22289	Pagazzano	1815
22290	Ponteranica	1815
22291	Pontida	1815
22292	Sant Omobono Imagna	1815
22293	Torre Pallavicina	1815
22294	Trescore Balneario	1815
22295	Verdellino	1815
22296	Zingonia	1815
22297	Camburzano	1816
22298	Crevacuore	1816
22299	Gaglianico	1816
22300	Sandigliano	1816
22301	Vigliano Biellese	1816
22302	Anzola dellEmilia	1817
22303	Bologna	1817
22304	Borgo Tossignano	1817
22305	Casalfiumanese	1817
22306	Castiglione Dei Pepoli 	1817
22307	Funo	1817
22308	Loiano	1817
22309	Monterenzio	1817
22310	Osteria Grande	1817
22311	Frangarto	1818
22312	Agnosine	1819
22313	Brescia	1819
22314	Capriano del Colle	1819
22315	Capriolo	1819
22316	Castegnato	1819
22317	Castelcovati	1819
22318	Cellatica	1819
22319	Coccaglio	1819
22320	Comezzano-Cizzago	1819
22321	Erbusco	1819
22322	Flero	1819
22323	Lavenone	1819
22324	Longhena	1819
22325	Maclodio	1819
22326	Muscoline	1819
22327	Padenghe sul Garda	1819
22328	Paderno Franciacorta	1819
22329	Paratico	1819
22330	Passirano	1819
22331	Polaveno	1819
22332	Poncarale	1819
22333	Prevalle	1819
22334	Provaglio dIseo	1819
22335	Roncadelle	1819
22336	Verolavecchia	1819
22337	Visano	1819
22338	San Donaci	1820
22339	Acri	1821
22340	Amantea	1821
22341	Bagnara Calabra	1821
22342	Belvedere Marittimo	1821
22343	Bisignano	1821
22344	Bovalino	1821
22345	Cariati	1821
22346	Cassano allo Ionio	1821
22347	Castrolibero	1821
22348	Castrovillari	1821
22349	Catanzaro	1821
22350	Cetraro	1821
22351	Ciro Marina	1821
22352	Cittanova	1821
22353	Corigliano Calabro	1821
22354	Cosenza	1821
22355	Crosia	1821
22356	Crotone	1821
22357	Cutro	1821
22358	Fuscaldo	1821
22359	Gioia Tauro	1821
22360	Isola di Capo Rizzuto	1821
22361	Lamezia Terme	1821
22362	Locri	1821
22363	Luzzi	1821
22364	Melito di Porto Salvo	1821
22365	Mendicino	1821
22366	Montalto Uffugo	1821
22367	Palmi	1821
22368	Paola	1821
22369	Petilia Policastro	1821
22370	Pizzo	1821
22371	Polistena	1821
22372	Reggio di Calabria	1821
22373	Rende	1821
22374	Rosarno	1821
22375	Rossano	1821
22376	San Giovanni in Fiore	1821
22377	Scalea	1821
22378	Sellia Marina	1821
22379	Siderno	1821
22380	Soverato	1821
22381	Taurianova	1821
22382	Trebisacce	1821
22383	Vibo Valentia	1821
22384	Villa San Giovanni	1821
22385	Acerra	1822
22386	Afragola	1822
22387	Agropoli	1822
22388	Angri	1822
22389	Ariano Irpino	1822
22390	Arzano	1822
22391	Atripalda	1822
22392	Avellino	1822
22393	Aversa	1822
22394	Bacoli	1822
22395	Barano dIschia	1822
22396	Baronissi	1822
22397	Battipaglia	1822
22398	Bellizzi	1822
22399	Benevento	1822
22400	Boscoreale	1822
22401	Boscotrecase	1822
22402	Brusciano	1822
22403	Caivano	1822
22404	Calvizzano	1822
22405	Campagna	1822
22406	Capaccio	1822
22407	Capua	1822
22408	Cardito	1822
22409	Carinola	1822
22410	Casagiove	1822
22411	Casal di Principe	1822
22412	Casalnuovo di Napoli	1822
22413	Casaluce	1822
22414	Casandrino	1822
22415	Casavatore	1822
22416	Caserta	1822
22417	Casoria	1822
22418	Castel San Giorgio	1822
22419	Castel Volturno	1822
22420	Castellammare di Stabia	1822
22421	Cava de Tirreni	1822
22422	Cercola	1822
22423	Cervinara	1822
22424	Cicciano	1822
22425	Crispano	1822
22426	Eboli	1822
22427	Ercolano	1822
22428	Fisciano	1822
22429	Forio	1822
22430	Frattamaggiore	1822
22431	Frattaminore	1822
22432	Frignano	1822
22433	Giffoni Valle Piana	1822
22434	Giugliano in Campania	1822
22435	Gragnano	1822
22436	Gricignano di Aversa	1822
22437	Grottaminarda	1822
22438	Grumo Nevano	1822
22439	Ischia	1822
22440	Lusciano	1822
22441	Macerata Campania	1822
22442	Maddaloni	1822
22443	Marano di Napoli	1822
22444	Marcianise	1822
22445	Marigliano	1822
22446	Massa Lubrense	1822
22447	Melito di Napoli	1822
22448	Mercato San Severino	1822
22449	Mercogliano	1822
22450	Meta	1822
22451	Mirabella Eclano	1822
22452	Mondragone	1822
22453	Monte di Procida	1822
22454	Montecorvino Rovella	1822
22455	Monteforte Irpino	1822
22456	Montesarchio	1822
22457	Montoro Inferiore	1822
22458	Mugnano di Napoli	1822
22459	Naples	1822
22460	Napoli	1822
22461	Nocera Inferiore	1822
22462	Nocera Superiore	1822
22463	Nola	1822
22464	Orta di Atella	1822
22465	Ottaviano	1822
22466	Pagani	1822
22467	Palma Campania	1822
22468	Parete	1822
22469	Pellezzano	1822
22470	Piano di Sorrento	1822
22471	Piedimonte Matese	1822
22472	Poggiomarino	1822
22473	Pollena Trocchia	1822
22474	Pomigliano dArco	1822
22475	Pompei	1822
22476	Pontecagnano	1822
22477	Portici	1822
22478	Positano	1822
22479	Pozzuoli	1822
22480	Procida	1822
22481	Qualiano	1822
22482	Quarto	1822
22483	Roccapiemonte	1822
22484	Sala Consilina	1822
22485	Salerno	1822
22486	San Cipriano dAversa	1822
22487	San Felice a Cancello	1822
22488	San Gennaro Vesuviano	1822
22489	San Giorgio a Cremano	1822
22490	San Giorgio del Sannio	1822
22491	San Giuseppe Vesuviano	1822
22492	San Marcellino	1822
22493	San Marzano sul Sarno	1822
22494	San Nicola	1822
22495	San Prisco	1822
22496	San Sebastiano al Vesuvio	1822
22497	San Valentino Torio	1822
22498	Sant Antimo	1822
22499	SantAgata de Goti	1822
22500	SantAgnello	1822
22501	SantAnastasia	1822
22502	SantAntonio Abate	1822
22503	SantArpino	1822
22504	SantEgidio del Monte Albino	1822
22505	Santa Maria Capua Vetere	1822
22506	Santa Maria a Vico	1822
22507	Santa Maria la Carita	1822
22508	Sarno	1822
22509	Saviano	1822
22510	Scafati	1822
22511	Sessa Aurunca	1822
22512	Siano	1822
22513	Solofra	1822
22514	Somma Vesuviana	1822
22515	Sorrento	1822
22516	Teano	1822
22517	Teggiano	1822
22518	Terzigno	1822
22519	Teverola	1822
22520	Torre Annunziata	1822
22521	Torre del Greco	1822
22522	Trecase	1822
22523	Trentola-Ducenta	1822
22524	Vallo della Lucania	1822
22525	Vico Equense	1822
22526	Vietri sul Mare	1822
22527	Villa Literno	1822
22528	Villaricca	1822
22529	Volla	1822
22530	Cartoceto	1823
22531	Carinaro	1824
22532	San Marco Evangelista	1824
22533	Fiandaca Di Acireale	1825
22534	San Cono	1825
22535	Altino	1826
22536	Archi	1826
22537	Ari	1826
22538	Arielli	1826
22539	Atessa	1826
22540	Bomba	1826
22541	Borrello	1826
22542	Bucchianico	1826
22543	Canosa Sannita	1826
22544	Carpineto Sinello	1826
22545	Carunchio	1826
22546	Casacanditella	1826
22547	Casalanguida	1826
22548	Casalbordino	1826
22549	Casalincontrada	1826
22550	Casoli	1826
22551	Castel Frentano	1826
22552	Castelguidone	1826
22553	Castiglione Messer Marino	1826
22554	Celenza sul Trigno	1826
22555	Chieti	1826
22556	Civitaluparella	1826
22557	Civitella Messer Raimondo	1826
22558	Colledimacine	1826
22559	Colledimezzo	1826
22560	Crecchio	1826
22561	Cupello	1826
22562	Dogliola	1826
22563	Fallo	1826
22564	Fara Filiorum Petri	1826
22565	Fara San Martino	1826
22566	Filetto	1826
22567	Fossacesia	1826
22568	Fraine	1826
22569	Francavilla al Mare	1826
22570	Fresagrandinaria	1826
22571	Frisa	1826
22572	Furci	1826
22573	Gamberale	1826
22574	Gessopalena	1826
22575	Gissi	1826
22576	Giuliano Teatino	1826
22577	Guardiagrele	1826
22578	Guilmi	1826
22579	Lama dei Peligni	1826
22580	Lanciano	1826
22581	Lentella	1826
22582	Lettopalena	1826
22583	Liscia	1826
22584	Miglianico	1826
22585	Montazzoli	1826
22586	Montebello sul Sangro	1826
22587	Monteferrante	1826
22588	Montelapiano	1826
22589	Montenerodomo	1826
22590	Monteodorisio	1826
22591	Mozzagrogna	1826
22592	Orsogna	1826
22593	Ortona	1826
22594	Paglieta	1826
22595	Palena	1826
22596	Palmoli	1826
22597	Palombaro	1826
22598	Pennadomo	1826
22599	Pennapiedimonte	1826
22600	Perano	1826
22601	Pietraferrazzana	1826
22602	Pizzoferrato	1826
22603	Poggiofiorito	1826
22604	Pollutri	1826
22605	Pretoro	1826
22606	Quadri	1826
22607	Rapino	1826
22608	Ripa Teatina	1826
22609	Rocca San Giovanni	1826
22610	Roccamontepiano	1826
22611	Roccascalegna	1826
22612	Roccaspinalveti	1826
22613	Roio del Sangro	1826
22614	Rosello	1826
22615	San Buono	1826
22616	San Giovanni Lipioni	1826
22617	San Giovanni Teatino	1826
22618	San Martino sulla Marrucina	1826
22619	San Salvo	1826
22620	San Vito Chietino	1826
22621	Sant Eusanio del Sangro	1826
22622	Santa Maria Imbaro	1826
22623	Scerni	1826
22624	Schiavi di Abruzzo	1826
22625	Taranta Peligna	1826
22626	Tollo	1826
22627	Torino di Sangro	1826
22628	Tornareccio	1826
22629	Torrebruna	1826
22630	Torrevecchia Teatina	1826
22631	Torricella Peligna	1826
22632	Treglio	1826
22633	Tufillo	1826
22634	Vacri	1826
22635	Vasto	1826
22636	Villa Santa Maria	1826
22637	Villalfonsina	1826
22638	Villamagna	1826
22639	Albavilla	1827
22640	Cadorago	1827
22641	Carimate	1827
22642	Castelmarte	1827
22643	Cavaria	1827
22644	Cernobbio	1827
22645	Comocrea	1827
22646	Dongo	1827
22647	Gironico	1827
22648	Grandate	1827
22649	Lurago dErba	1827
22650	Mozzate	1827
22651	Novedrate	1827
22652	Orsenigo	1827
22653	Turate	1827
22654	Uggiate	1827
22655	Corso del Tirreno	1828
22656	Mangone	1828
22657	Casalbuttano	1829
22658	Casalmaggiore	1829
22659	Castelverde	1829
22660	Madignano	1829
22661	Pieve San Giacomo	1829
22662	Bandito	1830
22663	Bra	1830
22664	Casalgrasso	1830
22665	Cossano Belbo	1830
22666	Magliano Alpi	1830
22667	Mondovi	1830
22668	Roddi	1830
22669	Santa Vittoria dAlba	1830
22670	Verduno	1830
22671	Alfonsine	1831
22672	Argelato	1831
22673	Argenta	1831
22674	Bagnacavallo	1831
22675	Bagnolo in Piano	1831
22676	Bellaria-Igea Marina	1831
22677	Bertinoro	1831
22678	Bologna	1831
22679	Bondeno	1831
22680	Budrio	1831
22681	Calderara di Reno	1831
22682	Carpi	1831
22683	Casalecchio di Reno	1831
22684	Casalgrande	1831
22685	Castel Bolognese	1831
22686	Castel Maggiore	1831
22687	Castel San Giovanni	1831
22688	Castel San Pietro Terme	1831
22689	Castelfranco Emilia	1831
22690	Castellarano	1831
22691	Castelnovo ne Monti	1831
22692	Castelnuovo Rangone	1831
22693	Castelvetro di Modena	1831
22694	Castenaso	1831
22695	Cattolica	1831
22696	Cavriago	1831
22697	Cento	1831
22698	Cervia	1831
22699	Cesena	1831
22700	Cesenatico	1831
22701	Codigoro	1831
22702	Collecchio	1831
22703	Comacchio	1831
22704	Concordia sulla Secchia	1831
22705	Conselice	1831
22706	Copparo	1831
22707	Coriano	1831
22708	Correggio	1831
22709	Crespellano	1831
22710	Crevalcore	1831
22711	Faenza	1831
22712	Ferrara	1831
22713	Fidenza	1831
22714	Finale Emilia	1831
22715	Fiorano Modenese	1831
22716	Fiorenzuola dArda	1831
22717	Forli	1831
22718	Forlimpopoli	1831
22719	Formigine	1831
22720	Gambettola	1831
22721	Granarolo dellEmilia	1831
22722	Guastalla	1831
22723	Imola	1831
22724	Langhirano	1831
22725	Lugo	1831
22726	Luzzara	1831
22727	Maranello	1831
22728	Massa Lombarda	1831
22729	Medesano	1831
22730	Medicina	1831
22731	Meldola	1831
22732	Mirandola	1831
22733	Misano Adriatico	1831
22734	Modena	1831
22735	Molinella	1831
22736	Monte San Pietro	1831
22737	Montecchio Emilia	1831
22738	Montechiarugolo	1831
22739	Noceto	1831
22740	Nonantola	1831
22741	Novellara	1831
22742	Novi di Modena	1831
22743	Ozzano dellEmilia	1831
22744	Parma	1831
22745	Pavullo nel Frignano	1831
22746	Piacenza	1831
22747	Pianoro	1831
22748	Ponticino	1831
22749	Portomaggiore	1831
22750	Quattro Castella	1831
22751	Ravenna	1831
22752	Reggio nellEmilia	1831
22753	Reggiolo	1831
22754	Riccione	1831
22755	Rimini	1831
22756	Rottofreno	1831
22757	Rubiera	1831
22758	Russi	1831
22759	Salsomaggiore Terme	1831
22760	San Felice sul Panaro	1831
22761	San Giovanni in Persiceto	1831
22762	San Lazzaro di Savena	1831
22763	San Mauro Pascoli	1831
22764	San Pietro in Casale	1831
22765	SantIlario dEnza	1831
22766	Santarcangelo di Romagna	1831
22767	Sasso Marconi	1831
22768	Sassuolo	1831
22769	Savignano sul Panaro	1831
22770	Savignano sul Rubicone	1831
22771	Scandiano	1831
22772	Soliera	1831
22773	Sorbolo	1831
22774	Spilamberto	1831
22775	Verucchio	1831
22776	Vignola	1831
22777	Zola Predosa	1831
22778	Saint Agostino	1832
22779	Capalle	1833
22780	Firenze	1833
22781	Pelago	1833
22782	San Donnino	1833
22783	Scarperia	1833
22784	Scandicci	1834
22785	Sesto Fiorentino	1834
22786	Casalvieri	1837
22787	Frosinone	1837
22788	Sgurgola	1837
22789	Genoa	1838
22790	Moneglia	1838
22791	Romans dIsonzo	1839
22792	Savogna dIsonzo	1839
22793	Magliano de Marsi	1840
22794	Alatri	1841
22795	Albano Laziale	1841
22796	Anagni	1841
22797	Anguillara Sabazia	1841
22798	Anzio	1841
22799	Aprilia	1841
22800	Ardea	1841
22801	Ariccia	1841
22802	Artena	1841
22803	Boville Ernica	1841
22804	Bracciano	1841
22805	Campagnano di Roma	1841
22806	Cassino	1841
22807	Cave	1841
22808	Ceccano	1841
22809	Ceprano	1841
22810	Cerveteri	1841
22811	Ciampino	1841
22812	Cisterna	1841
22813	Civita Castellana	1841
22814	Civitavecchia	1841
22815	Colleferro	1841
22816	Cori	1841
22817	Fara in Sabina	1841
22818	Ferentino	1841
22819	Fiano Romano	1841
22820	Fiuggi	1841
22821	Fiumicino	1841
22822	Fondi	1841
22823	Fonte Nuova	1841
22824	Formello	1841
22825	Formia	1841
22826	Frascati	1841
22827	Frosinone	1841
22828	Gaeta	1841
22829	Genzano di Roma	1841
22830	Grottaferrata	1841
22831	Guidonia	1841
22832	Isola del Liri	1841
22833	Itri	1841
22834	Ladispoli	1841
22835	Lanuvio	1841
22836	Lariano	1841
22837	Latina	1841
22838	Marino	1841
22839	Mentana	1841
22840	Minturno	1841
22841	Monte San Giovanni Campano	1841
22842	Montefiascone	1841
22843	Monterotondo	1841
22844	Nettuno	1841
22845	Palestrina	1841
22846	Palombara Sabina	1841
22847	Pomezia	1841
22848	Pontecorvo	1841
22849	Pontinia	1841
22850	Priverno	1841
22851	Rieti	1841
22852	Rocca Priora	1841
22853	Rocca di Papa	1841
22854	Roma	1841
22855	Rome	1841
22856	Sabaudia	1841
22857	San Cesareo	1841
22858	Santa Marinella	1841
22859	Segni	1841
22860	Sezze	1841
22861	Sora	1841
22862	Soriano nel Cimino	1841
22863	Subiaco	1841
22864	Tarquinia	1841
22865	Terracina	1841
22866	Tivoli	1841
22867	Valmontone	1841
22868	Velletri	1841
22869	Veroli	1841
22870	Vetralla	1841
22871	Viterbo	1841
22872	Zagarolo	1841
22873	Acquarica del Capo	1842
22874	Airuno	1843
22875	Bosisio Parini	1843
22876	Lecco	1843
22877	Margno	1843
22878	Osnago	1843
22879	Sirone	1843
22880	Airuno	1844
22881	Bosisio Parini	1844
22882	Lecco	1844
22883	Margno	1844
22884	Osnago	1844
22885	Sirone	1844
22886	Alassio	1845
22887	Albenga	1845
22888	Albisola Superiore	1845
22889	Arcola	1845
22890	Arenzano	1845
22891	Bordighera	1845
22892	Borgonuovo	1845
22893	Cairo Montenotte	1845
22894	Chiavari	1845
22895	Cogoleto	1845
22896	Finale Ligure	1845
22897	Genova	1845
22898	Imperia	1845
22899	La Spezia	1845
22900	Lavagna	1845
22901	Lerici	1845
22902	Loano	1845
22903	Ortonovo	1845
22904	Pietra Ligure	1845
22905	Rapallo	1845
22906	Recco	1845
22907	San Remo	1845
22908	Santa Margherita Ligure	1845
22909	Santo Stefano di Magra	1845
22910	Sarzana	1845
22911	Savona	1845
22912	Sestri Levante	1845
22913	Taggia	1845
22914	Varazze	1845
22915	Ventimiglia	1845
22916	Somaglia	1846
22917	Abbiategrasso	1847
22918	Agrate Brianza	1847
22919	Albiate	1847
22920	Albino	1847
22921	Albizzate	1847
22922	Alzano Lombardo	1847
22923	Arcisate	1847
22924	Arconate	1847
22925	Arcore	1847
22926	Arese	1847
22927	Arluno	1847
22928	Asola	1847
22929	Bagnolo Mella	1847
22930	Ballabio	1847
22931	Bareggio	1847
22932	Basiglio	1847
22933	Bedizzole	1847
22934	Bergamo	1847
22935	Bernareggio	1847
22936	Besana in Brianza	1847
22937	Besozzo	1847
22938	Biassono	1847
22939	Bienate	1847
22940	Bollate	1847
22941	Botticino	1847
22942	Bovisio-Masciago	1847
22943	Brembilla	1847
22944	Brescia	1847
22945	Bresso	1847
22946	Broni	1847
22947	Brugherio	1847
22948	Buccinasco	1847
22949	Bussero	1847
22950	Busto Arsizio	1847
22951	Busto Garolfo	1847
22952	Cairate	1847
22953	Calcinato	1847
22954	Calolziocorte	1847
22955	Calusco dAdda	1847
22956	Canegrate	1847
22957	Cantu	1847
22958	Capriolo	1847
22959	Carate Brianza	1847
22960	Caravaggio	1847
22961	Cardano al Campo	1847
22962	Caronno Pertusella	1847
22963	Carpenedolo	1847
22964	Carugate	1847
22965	Carvico	1847
22966	Casalmaggiore	1847
22967	Casalpusterlengo	1847
22968	Casatenovo	1847
22969	Casazza	1847
22970	Casnigo	1847
22971	Cassano Magnago	1847
22972	Cassano dAdda	1847
22973	Cassina de Pecchi	1847
22974	Castano Primo	1847
22975	Castel Goffredo	1847
22976	Castel Mella	1847
22977	Castellanza	1847
22978	Castelleone	1847
22979	Castelli Calepio	1847
22980	Castenedolo	1847
22981	Castiglione delle Stiviere	1847
22982	Cazzago San Martino	1847
22983	Cene	1847
22984	Cermenate	1847
22985	Cernusco sul Naviglio	1847
22986	Cerro Maggiore	1847
22987	Cesano Boscone	1847
22988	Cesano Maderno	1847
22989	Cesate	1847
22990	Chiari	1847
22991	Cilavegna	1847
22992	Cinisello Balsamo	1847
22993	Cislago	1847
22994	Clusone	1847
22995	Codogno	1847
22996	Cologno Monzese	1847
22997	Cologno al Serio	1847
22998	Como	1847
22999	Concesio	1847
23000	Concorezzo	1847
23001	Corbetta	1847
23002	Cormano	1847
23003	Cornaredo	1847
23004	Cornate dAdda	1847
23005	Corsico	1847
23006	Corte dei Cortesi	1847
23007	Costa Volpino	1847
23008	Crema	1847
23009	Cremona	1847
23010	Crocetta	1847
23011	Curtatone	1847
23012	Cusano Milanino	1847
23013	Dalmine	1847
23014	Darfo	1847
23015	Desenzano del Garda	1847
23016	Desio	1847
23017	Erba	1847
23018	Fagnano Olona	1847
23019	Fino Mornasco	1847
23020	Gaggiano	1847
23021	Galbiate	1847
23022	Gallarate	1847
23023	Gambolo	1847
23024	Garbagnate Milanese	1847
23025	Gardone Val Trompia	1847
23026	Garlasco	1847
23027	Gavardo	1847
23028	Gavirate	1847
23029	Gerenzano	1847
23030	Ghedi	1847
23031	Giussano	1847
23032	Goito	1847
23033	Gonzaga	1847
23034	Gorgonzola	1847
23035	Gussago	1847
23036	Gussola	1847
23037	Induno Olona	1847
23038	Inveruno	1847
23039	Inzago	1847
23040	Iseo	1847
23041	Isola Dovarese	1847
23042	Lacchiarella	1847
23043	Lainate	1847
23044	Laveno-Mombello	1847
23045	Lecco	1847
23046	Leffe	1847
23047	Legnano	1847
23048	Leno	1847
23049	Lentate sul Seveso	1847
23050	Limbiate	1847
23051	Lissone	1847
23052	Locate di Triulzi	1847
23053	Lodi	1847
23054	Lomazzo	1847
23055	Lonate Pozzolo	1847
23056	Lonato	1847
23057	Luino	1847
23058	Lumezzane	1847
23059	Lurate Caccivio	1847
23060	Magenta	1847
23061	Malnate	1847
23062	Mandello del Lario	1847
23063	Manerbio	1847
23064	Mantova	1847
23065	Mariano Comense	1847
23066	Martinengo	1847
23067	Mazzano	1847
23068	Meda	1847
23069	Mediglia	1847
23070	Melegnano	1847
23071	Melzo	1847
23072	Merate	1847
23073	Milano	1847
23074	Molteno	1847
23075	Montichiari	1847
23076	Monza	1847
23077	Morbegno	1847
23078	Mornago	1847
23079	Mortara	1847
23080	Muggio	1847
23081	Nave	1847
23082	Nembro	1847
23083	Nerviano	1847
23084	Nova Milanese	1847
23085	Novate Milanese	1847
23086	Olgiate Comasco	1847
23087	Olgiate Olona	1847
23088	Opera	1847
23089	Orzinuovi	1847
23090	Osio Sotto	1847
23091	Ospitaletto	1847
23092	Paderno Dugnano	1847
23093	Palazzolo sullOglio	1847
23094	Pandino	1847
23095	Parabiago	1847
23096	Paullo	1847
23097	Pavia	1847
23098	Pero	1847
23099	Peschiera Borromeo	1847
23100	Pessano con Bornago	1847
23101	Pieve Emanuele	1847
23102	Pioltello	1847
23103	Ponte Nossa	1847
23104	Ponte San Pietro	1847
23105	Porto Mantovano	1847
23106	Pozzolengo	1847
23107	Rescaldina	1847
23108	Rezzato	1847
23109	Rho	1847
23110	Rivarolo Mantovano	1847
23111	Rodano	1847
23112	Romano di Lombardia	1847
23113	Rovato	1847
23114	Rozzano	1847
23115	Saletto	1847
23116	Salo	1847
23117	Samarate	1847
23118	San Donato Milanese	1847
23119	San Giuliano Milanese	1847
23120	SantAngelo Lodigiano	1847
23121	Sarezzo	1847
23122	Saronno	1847
23123	Scanzorosciate	1847
23124	Sedriano	1847
23125	Segrate	1847
23126	Senago	1847
23127	Seregno	1847
23128	Seriate	1847
23129	Sesto Calende	1847
23130	Sesto San Giovanni	1847
23131	Settimo Milanese	1847
23132	Seveso	1847
23133	Sirmione	1847
23134	Solaro	1847
23135	Somma Lombardo	1847
23136	Sondrio	1847
23137	Soresina	1847
23138	Sorisole	1847
23139	Stezzano	1847
23140	Stradella	1847
23141	Suzzara	1847
23142	Tirano	1847
23143	Tornata	1847
23144	Tradate	1847
23145	Travagliato	1847
23146	Treviglio	1847
23147	Treviolo	1847
23148	Trezzano sul Naviglio	1847
23149	Trezzo	1847
23150	Tromello	1847
23151	Uboldo	1847
23152	Urgnano	1847
23153	Usmate Velate	1847
23154	Valmadrera	1847
23155	Varedo	1847
23156	Varese	1847
23157	Verano Brianza	1847
23158	Vergiate	1847
23159	Viadana	1847
23160	Vigevano	1847
23161	Vignate	1847
23162	Villa Carcina	1847
23163	Villa Guardia	1847
23164	Villasanta	1847
23165	Vimercate	1847
23166	Vimodrone	1847
23167	Virgilio	1847
23168	Voghera	1847
23169	Zibido San Giacomo	1847
23170	Zogno	1847
23171	Barasso	1848
23172	Bergamo	1848
23173	Bolladello	1848
23174	Capergnanica	1848
23175	Costa Masnaga	1848
23176	Medolago	1848
23177	Nibionno	1848
23178	Rodano	1848
23179	Sordio	1848
23180	Torre dIsola	1848
23181	Varese	1848
23182	Villongo	1848
23183	milan	1848
23184	Colmurano	1849
23185	Monte San Giusto	1849
23186	Castel	1850
23187	Gazoldo	1850
23188	Marmirolo	1850
23189	Monzambano	1850
23190	Ostiglia	1850
23191	Pegognaga	1850
23192	Poggio Rusco	1850
23193	Quistello	1850
23194	Roverbella	1850
23195	Suzzara	1850
23196	Ancona	1851
23197	Ascoli Piceno	1851
23198	Barchi	1851
23199	Cagli	1851
23200	Castelfidardo	1851
23201	Chiaravalle	1851
23202	Cingoli	1851
23203	Civitanova Marche	1851
23204	Corridonia	1851
23205	Fabriano	1851
23206	Falconara Marittima	1851
23207	Fano	1851
23208	Fermo	1851
23209	Filottrano	1851
23210	Folignano	1851
23211	Fossombrone	1851
23212	Grottammare	1851
23213	Jesi	1851
23214	Loreto	1851
23215	Macerata	1851
23216	Matelica	1851
23217	Mondavio	1851
23218	Mondolfo	1851
23219	Montappone	1851
23220	Montecosaro	1851
23221	Montegranaro	1851
23222	Montemarciano	1851
23223	Monteprandone	1851
23224	Morrovalle	1851
23225	Osimo	1851
23226	Pesaro	1851
23227	Polverigi	1851
23228	Porto Recanati	1851
23229	Porto San Giorgio	1851
23230	Porto SantElpidio	1851
23231	Potenza Picena	1851
23232	Recanati	1851
23233	San Benedetto del Tronto	1851
23234	San Severino Marche	1851
23235	SantElpidio a Mare	1851
23236	Senigallia	1851
23237	Tolentino	1851
23238	Treia	1851
23239	Urbino	1851
23240	Cumiana	1852
23241	Giammoro	1852
23242	Assago	1853
23243	Besana in Brianza	1853
23244	Biassono	1853
23245	Burago Molgora	1853
23246	Cernusco Sul Naviglio	1853
23247	Cologno Monzese	1853
23248	Concorezzo	1853
23249	Cornaredo	1853
23250	Cuggiono	1853
23251	Cusago	1853
23252	Foro Buonaparte	1853
23253	Gessate	1853
23254	Gorgonzola	1853
23255	Liscate	1853
23256	Magenta	1853
23257	Milan	1853
23258	Noviglio	1853
23259	Passirana Di Rho	1853
23260	Pregnana Milane	1853
23261	San Donato Milanese	1853
23262	Seregno	1853
23263	Trezzo Sulladda	1853
23264	Tribiano	1853
23265	Vaprio dAdda	1853
23266	Vermezzo	1853
23267	Bomporto	1854
23268	Campogalliano	1854
23269	Cavezzo	1854
23270	Medolla	1854
23271	Nonantola	1854
23272	San Possidonio	1854
23273	Sassuolo	1854
23274	Spilamberto	1854
23275	Bojano	1855
23276	Campobasso	1855
23277	Cantalupo	1855
23278	Isernia	1855
23279	Termoli	1855
23280	Venafro	1855
23281	Montenegro	1857
23282	Forio dIschia	1859
23283	Bogogno	1860
23284	Invorio	1860
23285	Pombia	1860
23286	Bagnoli di Sopra	1861
23287	Bovolenta	1861
23288	Casale Di Scodosia	1861
23289	Cervarese Santa Croce	1861
23290	Fontaniva	1861
23291	Galliera Veneta	1861
23292	Legnaro	1861
23293	Limena	1861
23294	Loreggia	1861
23295	Massanzago	1861
23296	Onara	1861
23297	Ponso	1861
23298	Portogallo	1861
23299	Tribano	1861
23300	Baganzola	1862
23301	Busseto	1862
23302	Casale Di Mezzani	1862
23303	Fontevivo	1862
23304	Solignano	1862
23305	Torrile	1862
23306	Codevilla	1863
23307	Marcignago	1863
23308	Pavia	1863
23309	Siziano	1863
23310	Pianello	1864
23311	Ponte Felcino	1864
23312	Zanica	1864
23313	Gradara	1865
23314	Monte Porzio	1865
23315	Pergola	1865
23316	Tavullia	1865
23317	Alseno	1866
23318	Gossolengo	1866
23319	Vigolzone	1866
23320	Armeno	1867
23321	Bergamasco	1867
23322	Caselette	1867
23323	Rosta	1867
23324	San Damiano	1867
23325	Spinetta Marengo	1867
23326	Acqui Terme	1868
23327	Alba	1868
23328	Alessandria	1868
23329	Alpignano	1868
23330	Andezeno	1868
23331	Andonno	1868
23332	Arona	1868
23333	Asti	1868
23334	Avigliana	1868
23335	Baveno	1868
23336	Beinasco	1868
23337	Bellinzago Novarese	1868
23338	Biella	1868
23339	Borgaro Torinese	1868
23340	Borgo San Dalmazzo	1868
23341	Borgomanero	1868
23342	Borgosesia	1868
23343	Boves	1868
23344	Bra	1868
23345	Busca	1868
23346	Cameri	1868
23347	Canelli	1868
23348	Carignano	1868
23349	Carmagnola	1868
23350	Casale Monferrato	1868
23351	Caselle Torinese	1868
23352	Castellamonte	1868
23353	Castelletto sopra Ticino	1868
23354	Chieri	1868
23355	Chivasso	1868
23356	Cirie	1868
23357	Collegno	1868
23358	Cossato	1868
23359	Cuneo	1868
23360	Cuorgne	1868
23361	Domodossola	1868
23362	Druento	1868
23363	Fossano	1868
23364	Galliate	1868
23365	Gassino Torinese	1868
23366	Gattinara	1868
23367	Giaveno	1868
23368	Grugliasco	1868
23369	Ivrea	1868
23370	Leini	1868
23371	LusigliÃƒÂ¨	1868
23372	Marano Ticino	1868
23373	Mergozzo	1868
23374	Moncalieri	1868
23375	Mondovi	1868
23376	Mongrando	1868
23377	Nichelino	1868
23378	Nizza Monferrato	1868
23379	Novara	1868
23380	Novi Ligure	1868
23381	Oleggio	1868
23382	Omegna	1868
23383	Orbassano	1868
23384	Ovada	1868
23385	Pianezza	1868
23386	Pinerolo	1868
23387	Pino Torinese	1868
23388	Piossasco	1868
23389	Poirino	1868
23390	Racconigi	1868
23391	Rivalta di Torino	1868
23392	Rivarolo Canavese	1868
23393	Rivoli	1868
23394	Saluzzo	1868
23395	San Maurizio	1868
23396	San Mauro Torinese	1868
23397	Sandigliano	1868
23398	Santena	1868
23399	Santhia	1868
23400	Savigliano	1868
23401	Settimo Torinese	1868
23402	Torino	1868
23403	Tortona	1868
23404	Trecate	1868
23405	Trofarello	1868
23406	Valduggia	1868
23407	Valenza	1868
23408	Venaria Reale	1868
23409	Verbania	1868
23410	Vercelli	1868
23411	Vigliano Biellese	1868
23412	Vinovo	1868
23413	Volpiano	1868
23414	Perignano	1869
23415	Ponte a Egola	1869
23416	San Quirino	1870
23417	Latronico	1871
23418	Acquaviva delle Fonti	1872
23419	Adelfia	1872
23420	Alberobello	1872
23421	Altamura	1872
23422	Andria	1872
23423	Apricena	1872
23424	Aradeo	1872
23425	Bari	1872
23426	Barletta	1872
23427	Bisceglie	1872
23428	Bitetto	1872
23429	Bitonto	1872
23430	Bitritto	1872
23431	Brindisi	1872
23432	Campi Salentina	1872
23433	Canosa di Puglia	1872
23434	Capurso	1872
23435	Carmiano	1872
23436	Carovigno	1872
23437	Casamassima	1872
23438	Casarano	1872
23439	Cassano delle Murge	1872
23440	Castellana Grotte	1872
23441	Castellaneta	1872
23442	Cavallino	1872
23443	Ceglie Messapica	1872
23444	Cerignola	1872
23445	Cisternino	1872
23446	Conversano	1872
23447	Copertino	1872
23448	Corato	1872
23449	Crispiano	1872
23450	Cutrofiano	1872
23451	Erchie	1872
23452	Fasano	1872
23453	Foggia	1872
23454	Francavilla Fontana	1872
23455	Galatina	1872
23456	Galatone	1872
23457	Gallipoli	1872
23458	Ginosa	1872
23459	Gioia del Colle	1872
23460	Giovinazzo	1872
23461	Gravina in Puglia	1872
23462	Grottaglie	1872
23463	Grumo Appula	1872
23464	Laterza	1872
23465	Latiano	1872
23466	Lecce	1872
23467	Leverano	1872
23468	Lizzanello	1872
23469	Lizzano	1872
23470	Locorotondo	1872
23471	Lucera	1872
23472	Maglie	1872
23473	Manduria	1872
23474	Manfredonia	1872
23475	Margherita di Savoia	1872
23476	Martano	1872
23477	Martina Franca	1872
23478	Massafra	1872
23479	Matino	1872
23480	Melendugno	1872
23481	Mesagne	1872
23482	Minervino Murge	1872
23483	Modugno	1872
23484	Mola di Bari	1872
23485	Molfetta	1872
23486	Monopoli	1872
23487	Monte SantAngelo	1872
23488	Monteroni di Lecce	1872
23489	Mottola	1872
23490	Nardo	1872
23491	Neviano	1872
23492	Noci	1872
23493	Noicattaro	1872
23494	Novoli	1872
23495	Oria	1872
23496	Orta Nova	1872
23497	Ostuni	1872
23498	Palagiano	1872
23499	Palo del Colle	1872
23500	Parabita	1872
23501	Polignano a Mare	1872
23502	Pulsano	1872
23503	Putignano	1872
23504	Racale	1872
23505	Ruffano	1872
23506	Rutigliano	1872
23507	Ruvo di Puglia	1872
23508	Salice Salentino	1872
23509	San Ferdinando di Puglia	1872
23510	San Giorgio Ionico	1872
23511	San Giovanni Rotondo	1872
23512	San Marco in Lamis	1872
23513	San Marzano di San Giuseppe	1872
23514	San Nicandro Garganico	1872
23515	San Pancrazio Salentino	1872
23516	San Pietro Vernotico	1872
23517	San Severo	1872
23518	San Vito dei Normanni	1872
23519	Sannicandro di Bari	1872
23520	Santeramo in Colle	1872
23521	Sava	1872
23522	Squinzano	1872
23523	Statte	1872
23524	Surbo	1872
23525	Taranto	1872
23526	Taurisano	1872
23527	Taviano	1872
23528	Terlizzi	1872
23529	Toritto	1872
23530	Torre Santa Susanna	1872
23531	Torremaggiore	1872
23532	Trani	1872
23533	Trepuzzi	1872
23534	Tricase	1872
23535	Triggiano	1872
23536	Trinitapoli	1872
23537	Turi	1872
23538	Ugento	1872
23539	Valenzano	1872
23540	Veglie	1872
23541	Vico del Gargano	1872
23542	Vieste	1872
23543	Villa Castelli	1872
23544	San Giovanni in Marignano	1874
23545	Torriana	1874
23546	Anzio	1875
23547	Atena Lucana	1876
23548	Castel San Giorgio	1876
23549	Fisciano	1876
23550	Giungano	1876
23551	Omignano	1876
23552	Alghero	1877
23553	Arzachena	1877
23554	Assemini	1877
23555	Cabras	1877
23556	Cagliari	1877
23557	Capoterra	1877
23558	Carbonia	1877
23559	Dorgali	1877
23560	Guspini	1877
23561	Iglesias	1877
23562	Ittiri	1877
23563	La Maddalena	1877
23564	Macomer	1877
23565	Monserrato	1877
23566	Nuoro	1877
23567	Olbia	1877
23568	Oristano	1877
23569	Ozieri	1877
23570	Porto Torres	1877
23571	Quartu SantElena	1877
23572	Quartucciu	1877
23573	San Gavino Monreale	1877
23574	Sanluri	1877
23575	SantAntioco	1877
23576	Sassari	1877
23577	Selargius	1877
23578	Serramanna	1877
23579	Sestu	1877
23580	Siniscola	1877
23581	Sinnai	1877
23582	Sorso	1877
23583	Tempio Pausania	1877
23584	Terralba	1877
23585	Tortoli	1877
23586	Villacidro	1877
23587	Nule	1878
23588	Altare	1879
23589	Aci Castello	1880
23590	Aci Catena	1880
23591	Aci SantAntonio	1880
23592	Acireale	1880
23593	Adrano	1880
23594	Agira	1880
23595	Agrigento	1880
23596	Alcamo	1880
23597	Altofonte	1880
23598	Aragona	1880
23599	Augusta	1880
23600	Avola	1880
23601	Bagheria	1880
23602	Barcellona	1880
23603	Barrafranca	1880
23604	Belmonte Mezzagno	1880
23605	Belpasso	1880
23606	Biancavilla	1880
23607	Bronte	1880
23608	Caccamo	1880
23609	Caltagirone	1880
23610	Caltanissetta	1880
23611	Campobello di Licata	1880
23612	Campobello di Mazara	1880
23613	Canicatti	1880
23614	Capaci	1880
23615	Capo dOrlando	1880
23616	Carini	1880
23617	Carlentini	1880
23618	Castelbuono	1880
23619	Casteldaccia	1880
23620	Castellammare del Golfo	1880
23621	Casteltermini	1880
23622	Castelvetrano	1880
23623	Catania	1880
23624	Catenanuova	1880
23625	Cefalu	1880
23626	Chiaramonte Gulfi	1880
23627	Cinisi	1880
23628	Comiso	1880
23629	Corleone	1880
23630	Enna	1880
23631	Erice	1880
23632	Favara	1880
23633	Ficarazzi	1880
23634	Fiumefreddo di Sicilia	1880
23635	Floridia	1880
23636	Francofonte	1880
23637	Gela	1880
23638	Giardini-Naxos	1880
23639	Giarre	1880
23640	Grammichele	1880
23641	Gravina di Catania	1880
23642	Ispica	1880
23643	Lentini	1880
23644	Leonforte	1880
23645	Licata	1880
23646	Lipari	1880
23647	Marsala	1880
23648	Mascali	1880
23649	Mascalucia	1880
23650	Mazara del Vallo	1880
23651	Mazzarino	1880
23652	Melilli	1880
23653	Menfi	1880
23654	Messina	1880
23655	Milazzo	1880
23656	Militello in Val di Catania	1880
23657	Misilmeri	1880
23658	Misterbianco	1880
23659	Modica	1880
23660	Monreale	1880
23661	Motta SantAnastasia	1880
23662	Mussomeli	1880
23663	Naro	1880
23664	Nicosia	1880
23665	Niscemi	1880
23666	Noto	1880
23667	Paceco	1880
23668	Pachino	1880
23669	Palagonia	1880
23670	Palazzolo Acreide	1880
23671	Palermo	1880
23672	Palma di Montechiaro	1880
23673	Partanna	1880
23674	Partinico	1880
23675	Paterno	1880
23676	Patti	1880
23677	Pedara	1880
23678	Piazza Armerina	1880
23679	Porto Empedocle	1880
23680	Pozzallo	1880
23681	Priolo Gargallo	1880
23682	Racalmuto	1880
23683	Raffadali	1880
23684	Ragusa	1880
23685	Ramacca	1880
23686	Randazzo	1880
23687	Ravanusa	1880
23688	Ribera	1880
23689	Riesi	1880
23690	Riposto	1880
23691	Rosolini	1880
23692	Salemi	1880
23693	San Cataldo	1880
23694	San Giovanni Gemini	1880
23695	San Giovanni la Punta	1880
23696	San Giuseppe Jato	1880
23697	San Gregorio di Catania	1880
23698	SantAgata di Militello	1880
23699	SantAgata li Battiati	1880
23700	Santa Croce Camerina	1880
23701	Santa Flavia	1880
23702	Santa Teresa di Riva	1880
23703	Sciacca	1880
23704	Scicli	1880
23705	Scordia	1880
23706	Siracusa	1880
23707	Sortino	1880
23708	Taormina	1880
23709	Termini Imerese	1880
23710	Terrasini	1880
23711	Trabia	1880
23712	Trapani	1880
23713	Trecastagni	1880
23714	Tremestieri Etneo	1880
23715	Troina	1880
23716	Valderice	1880
23717	Valguarnera Caropepe	1880
23718	Villabate	1880
23719	Villafranca Tirrena	1880
23720	Vittoria	1880
23721	Zafferana Etnea	1880
23722	Monteriggioni	1881
23723	Monteroni d Arbia	1881
23724	Delebio	1882
23725	Talamona	1882
23726	Faggiano	1884
23727	Riva del Garda	1884
23728	Castilenti	1885
23729	Controguerra	1885
23730	Bruino	1886
23731	Busano	1886
23732	Buttigliera Alta	1886
23733	Cavour	1886
23734	Chieri	1886
23735	Colleretto Giacosa	1886
23736	Cuceglio	1886
23737	Giaveno	1886
23738	Mazze	1886
23739	Mercenasco	1886
23740	Piobesi	1886
23741	Rivoli	1886
23742	Robassomero	1886
23743	Scarmagno	1886
23744	Strambino	1886
23745	Turin	1886
23746	Villar Perosa	1886
23747	Volpiano	1886
23748	Agliana	1887
23749	Altopascio	1887
23750	Anghiari	1887
23751	Arezzo	1887
23752	Aulla	1887
23753	Bagno a Ripoli	1887
23754	Barberino di Mugello	1887
23755	Barga	1887
23756	Bibbiena	1887
23757	Borgo San Lorenzo	1887
23758	Bucine	1887
23759	Buggiano	1887
23760	Calcinaia	1887
23761	Calenzano	1887
23762	Camaiore	1887
23763	Campi Bisenzio	1887
23764	Campiglia Marittima	1887
23765	Capannori	1887
23766	Cappelle	1887
23767	Capraia	1887
23768	Carmignano	1887
23769	Carrara	1887
23770	Cascina	1887
23771	Castagneto Carducci	1887
23772	Castelfiorentino	1887
23773	Castelfranco di Sotto	1887
23774	Castiglion Fiorentino	1887
23775	Cecina	1887
23776	Cerreto Guidi	1887
23777	Certaldo	1887
23778	Chiesina Uzzanese	1887
23779	Chiusi	1887
23780	Civitella in Val di Chiana	1887
23781	Colle di Val dElsa	1887
23782	Collesalvetti	1887
23783	Cortona	1887
23784	Empoli	1887
23785	Fiesole	1887
23786	Figline Valdarno	1887
23787	Firenze	1887
23788	Fivizzano	1887
23789	Florence	1887
23790	Foiano della Chiana	1887
23791	Follonica	1887
23792	Forte dei Marmi	1887
23793	Fucecchio	1887
23794	Gavorrano	1887
23795	Greve in Chianti	1887
23796	Grosseto	1887
23797	Impruneta	1887
23798	Lari	1887
23799	Lastra a Signa	1887
23800	Livorno	1887
23801	Lucca	1887
23802	Massa	1887
23803	Massa Marittima	1887
23804	Massarosa	1887
23805	Monsummano Terme	1887
23806	Montale	1887
23807	Monte Argentario	1887
23808	Monte San Savino	1887
23809	Montecatini-Terme	1887
23810	Montelupo Fiorentino	1887
23811	Montemurlo	1887
23812	Montepulciano	1887
23813	Montespertoli	1887
23814	Montevarchi	1887
23815	Montignoso	1887
23816	Montopoli in Val dArno	1887
23817	Orbetello	1887
23818	Pescia	1887
23819	Pietrasanta	1887
23820	Pieve a Nievole	1887
23821	Piombino	1887
23822	Pisa	1887
23823	Pistoia	1887
23824	Poggibonsi	1887
23825	Poggio a Caiano	1887
23826	Ponsacco	1887
23827	Pontassieve	1887
23828	Pontedera	1887
23829	Ponticino	1887
23830	Pontremoli	1887
23831	Portoferraio	1887
23832	Prato	1887
23833	Quarrata	1887
23834	Reggello	1887
23835	Rignano	1887
23836	Roccastrada	1887
23837	Rosignano Marittimo	1887
23838	San Casciano	1887
23839	San Giovanni Valdarno	1887
23840	San Giuliano Terme	1887
23841	San Miniato	1887
23842	Sansepolcro	1887
23843	Santa Croce sullArno	1887
23844	Santa Maria a Monte	1887
23845	Scandicci	1887
23846	Seravezza	1887
23847	Serravalle Pistoiese	1887
23848	Sesto Fiorentino	1887
23849	Siena	1887
23850	Signa	1887
23851	Sinalunga	1887
23852	Sovicille	1887
23853	Terranuova Bracciolini	1887
23854	Vaiano	1887
23855	Varna	1887
23856	Vecchiano	1887
23857	Viareggio	1887
23858	Vinci	1887
23859	Volterra	1887
23860	Guarrato	1888
23861	 San Giorgio	1890
23862	Dro	1890
23863	Asolo	1891
23864	Conegliano	1891
23865	Cordignano	1891
23866	Gaiarine	1891
23867	Ormelle	1891
23868	Possagno	1891
23869	Revine Lago	1891
23870	Basiliano	1892
23871	Bicinicco	1892
23872	Buttrio	1892
23873	Coseano	1892
23874	Pradamano	1892
23875	San Giovanni al Natisone	1892
23876	Torreano	1892
23877	Amelia	1893
23878	Assisi	1893
23879	Bastia Umbra	1893
23880	Castiglione del Lago	1893
23881	Citta di Castello	1893
23882	Corciano	1893
23883	Deruta	1893
23884	Foligno	1893
23885	Gualdo Tadino	1893
23886	Gubbio	1893
23887	Magione	1893
23888	Marsciano	1893
23889	Narni	1893
23890	Orvieto	1893
23891	Perugia	1893
23892	San Giustino	1893
23893	Spello	1893
23894	Spoleto	1893
23895	Terni	1893
23896	Todi	1893
23897	Umbertide	1893
23898	Arsago Seprio	1895
23899	Busto Arsizio	1895
23900	Cassano Magnago	1895
23901	Gazzada	1895
23902	Oggiona Con Santo Stefano	1895
23903	Solbiate Arno	1895
23904	Solbiate Olona	1895
23905	Ternate	1895
23906	Venegono Inferiore	1895
23907	Abano Terme	1896
23908	Adria	1896
23909	Albignasego	1896
23910	Altavilla Vicentina	1896
23911	Arzignano	1896
23912	Badia Polesine	1896
23913	Bassano del Grappa	1896
23914	Belfiore	1896
23915	Belluno	1896
23916	Borso del Grappa	1896
23917	Bovolone	1896
23918	Bussolengo	1896
23919	Cadoneghe	1896
23920	Caldogno	1896
23921	Camisano Vicentino	1896
23922	Campodarsego	1896
23923	Campolongo Maggiore	1896
23924	Camponogara	1896
23925	Camposampiero	1896
23926	Caorle	1896
23927	Carbonera	1896
23928	Casale sul Sile	1896
23929	Casier	1896
23930	Cassola	1896
23931	Castel dAzzano	1896
23932	Castelfranco Veneto	1896
23933	Castello di Godego	1896
23934	Castelnuovo del Garda	1896
23935	Cavallino-Treporti	1896
23936	Cavarzere	1896
23937	Cerea	1896
23938	Chiampo	1896
23939	Chioggia	1896
23940	Cittadella	1896
23941	Colombano	1896
23942	Concordia Sagittaria	1896
23943	Conegliano	1896
23944	Conselve	1896
23945	Cornedo Vicentino	1896
23946	Creazzo	1896
23947	Dolo	1896
23948	Due Carrare	1896
23949	Dueville	1896
23950	Eraclea	1896
23951	Este	1896
23952	Feltre	1896
23953	Galzignano Terme	1896
23954	Grezzana	1896
23955	Iesolo	1896
23956	Isola Vicentina	1896
23957	Isola della Scala	1896
23958	Jesolo	1896
23959	Legnago	1896
23960	Lendinara	1896
23961	Lonigo	1896
23962	Malo	1896
23963	Marano Vicentino	1896
23964	Marcon	1896
23965	Marostica	1896
23966	Martellago	1896
23967	Mestrino	1896
23968	Mira	1896
23969	Mirano	1896
23970	Mogliano Veneto	1896
23971	Monselice	1896
23972	Montagnana	1896
23973	Montebelluna	1896
23974	Montecchio Maggiore	1896
23975	Montegrotto Terme	1896
23976	Monticello Conte Otto	1896
23977	Motta di Livenza	1896
23978	Murano	1896
23979	Musile di Piave	1896
23980	Mussolente	1896
23981	Negrar	1896
23982	Noale	1896
23983	Noventa Padovana	1896
23984	Noventa Vicentina	1896
23985	Occhiobello	1896
23986	Oderzo	1896
23987	Ormelle	1896
23988	Padova	1896
23989	Padua	1896
23990	Paese	1896
23991	Pescantina	1896
23992	Peschiera del Garda	1896
23993	Pianiga	1896
23994	Piazzola sul Brenta	1896
23995	Pieve di Soligo	1896
23996	Pievebelvicino	1896
23997	Piombino Dese	1896
23998	Piove di Sacco	1896
23999	Ponte San Nicolo	1896
24000	Ponzano Veneto	1896
24001	Porto Tolle	1896
24002	Porto Viro	1896
24003	Portogruaro	1896
24004	Preganziol	1896
24005	Quinto di Treviso	1896
24006	Riese Pio X	1896
24007	Romano dEzzelino	1896
24008	Roncade	1896
24009	Rosa	1896
24010	Rovigo	1896
24011	Rubano	1896
24012	Salzano	1896
24013	San Biagio di Callalta	1896
24014	San Bonifacio	1896
24015	San Dona di Piave	1896
24016	San Giovanni Lupatoto	1896
24017	San Martino Buon Albergo	1896
24018	San Martino di Lupari	1896
24019	San Michele al Tagliamento	1896
24020	San Pietro in Cariano	1896
24021	San Vendemiano	1896
24022	SantAmbrogio	1896
24023	Santa Maria di Sala	1896
24024	Santo Stino di Livenza	1896
24025	Santorso	1896
24026	Saonara	1896
24027	Sarcedo	1896
24028	Schio	1896
24029	Scorze	1896
24030	Sedico	1896
24031	Selvazzano Dentro	1896
24032	Silea	1896
24033	Sivizzo	1896
24034	Sommacampagna	1896
24035	Sona	1896
24036	Spinea	1896
24037	Spresiano	1896
24038	Susegana	1896
24039	Taglio di Po	1896
24040	Teolo	1896
24041	Tezze sul Brenta	1896
24042	Thiene	1896
24043	Torri di Quartesolo	1896
24044	Trebaseleghe	1896
24045	Trevignano	1896
24046	Treviso	1896
24047	Trissino	1896
24048	Valdagno	1896
24049	Valdobbiadene	1896
24050	Valeggio sul Mincio	1896
24051	Vedelago	1896
24052	Venezia	1896
24053	Venice	1896
24054	Verona	1896
24055	Vicenza	1896
24056	Vigodarzere	1896
24057	Vigonovo	1896
24058	Vigonza	1896
24059	Villafranca di Verona	1896
24060	Villorba	1896
24061	Vittorio Veneto	1896
24062	Volpago del Montello	1896
24063	Zane	1896
24064	Zero Branco	1896
24065	Zevio	1896
24066	Cona	1897
24067	Marghera	1897
24068	Oriago di Mira	1897
24069	Tessera	1897
24070	Piedimulera	1898
24071	Crescentino	1899
24072	Moncrivello	1899
24073	Rovasenda	1899
24074	Trino	1899
24075	 Valeggio Sul Mincio	1900
24076	Cadidavid	1900
24077	Colognola ai Colli	1900
24078	Pastrengo	1900
24079	Valgatara	1900
24080	 Montebello Vicentino	1901
24081	Alonte	1901
24082	Arcugnano	1901
24083	Arzignano	1901
24084	Barbarano Vicentino	1901
24085	Breganze	1901
24086	Brendola	1901
24087	Bressanvido	1901
24088	Carre	1901
24089	Castelgomberto	1901
24090	Costabissara	1901
24091	Grumolo delle Abbadesse	1901
24092	Piovene Rocchette	1901
24093	Povolaro	1901
24094	Rossano Veneto	1901
24095	San Pietro di Rosa	1901
24096	San Vito di Leguzzano	1901
24097	Sandrigo	1901
24098	Thiene	1901
24099	Torrebelvicino	1901
24100	Torri di Quartesolo	1901
24101	Villaverla	1901
24102	Nepi	1902
24103	May Pen	1904
24104	Lucea	1905
24105	Kingston	1906
24106	Mandeville	1907
24107	Port Antonio	1908
24108	Albert Town	1916
24109	Falmouth	1916
24110	Savanna la Mar	1917
24111	Agui	1918
24112	Anjo	1918
24113	Atsumi	1918
24114	Bisai	1918
24115	Chiryu	1918
24116	Chita	1918
24117	Fujioka	1918
24118	Fuso	1918
24119	Gamagori	1918
24120	Handa	1918
24121	Hekinan	1918
24122	Higashiura	1918
24123	Ichinomiya	1918
24124	Inazawa	1918
24125	Inuyama	1918
24126	Isshiki	1918
24127	Iwakura	1918
24128	Jimokuji	1918
24129	Kanie	1918
24130	Kariya	1918
24131	Kasugai	1918
24132	Kira	1918
24133	Kisogawa	1918
24134	Komaki	1918
24135	Konan	1918
24136	Kota	1918
24137	Kozakai	1918
24138	Mihama	1918
24139	Minamichita	1918
24140	Miwa	1918
24141	Miyoshi	1918
24142	Nagakute	1918
24143	Nagoya	1918
24144	Nishiharu	1918
24145	Nishio	1918
24146	Nisshin	1918
24147	Obu	1918
24148	Oharu	1918
24149	Okazaki	1918
24150	Owariashi	1918
24151	Saori	1918
24152	Saya	1918
24153	Seto	1918
24154	Shikatsu	1918
24155	Shinshiro	1918
24156	Shippo	1918
24157	Sobue	1918
24158	Tahara	1918
24159	Takahama	1918
24160	Taketoyo	1918
24161	Togo	1918
24162	Tokai	1918
24163	Tokoname	1918
24164	Toyoake	1918
24165	Toyohashi	1918
24166	Toyokawa	1918
24167	Toyota	1918
24168	Tsushima	1918
24169	Yatomi	1918
24170	Akita	1919
24171	Honjo	1919
24172	Kazuno	1919
24173	Noshiro	1919
24174	Odate	1919
24175	Oga	1919
24176	Omagari	1919
24177	Takanosu	1919
24178	Tenno	1919
24179	Ugo	1919
24180	Yokote	1919
24181	Yuzawa	1919
24182	Aomori	1920
24183	Goshogawara	1920
24184	Hachinohe	1920
24185	Hiraka	1920
24186	Hirosaki	1920
24187	Kizukuri	1920
24188	Kuroishi	1920
24189	Misawa	1920
24190	Mutsu	1920
24191	Namioka	1920
24192	Towada	1920
24193	Abiko	1921
24194	Asahi	1921
24195	Chiba	1921
24196	Choshi	1921
24197	Funabashi	1921
24198	Fussa	1921
24199	Futtsu	1921
24200	Ichihara	1921
24201	Ichikawa	1921
24202	Inzai	1921
24203	Kamagaya	1921
24204	Kamogawa	1921
24205	Kashiwa	1921
24206	Katsuura	1921
24207	Kimitsu	1921
24208	Kisarazu	1921
24209	Kujukuri	1921
24210	Matsudo	1921
24211	Mobara	1921
24212	Nagareyama	1921
24213	Narashino	1921
24214	Narita	1921
24215	Naruto	1921
24216	Noda	1921
24217	Oamishirasato	1921
24218	Ohara	1921
24219	Omigawa	1921
24220	Sakae	1921
24221	Sakura	1921
24222	Sambu	1921
24223	Sawara	1921
24224	Sekiyado	1921
24225	Shiroi	1921
24226	Shisui	1921
24227	Shonan	1921
24228	Sodegaura	1921
24229	Tateyama	1921
24230	Togane	1921
24231	Tomisato	1921
24232	Urayasu	1921
24233	Yachimata	1921
24234	Yachiyo	1921
24235	Yokaichiba	1921
24236	Yotsukaido	1921
24237	Hojo	1922
24238	Imabari	1922
24239	Iyo	1922
24240	Iyomishima	1922
24241	Kawanoe	1922
24242	Masaki	1922
24243	Matsuyama	1922
24244	Niihama	1922
24245	Ozu	1922
24246	Saijo	1922
24247	Shigenobu	1922
24248	Tobe	1922
24249	Toyo	1922
24250	Uwajima	1922
24251	Yawatahama	1922
24252	Fukui	1923
24253	Harue	1923
24254	Katsuyama	1923
24255	Maruoka	1923
24256	Mikuni	1923
24257	Obama	1923
24258	Ono	1923
24259	Sabae	1923
24260	Takefu	1923
24261	Tsuruga	1923
24262	Amagi	1924
24263	Buzen	1924
24264	Chikugo	1924
24265	Chikushino	1924
24266	Dazaifu	1924
24267	Fukuma	1924
24268	Fukuoka	1924
24269	Hirokawa	1924
24270	Honami	1924
24271	Iizuka	1924
24272	Inatsuki	1924
24273	Kanda	1924
24274	Kasuga	1924
24275	Kasuya	1924
24276	Kawasaki	1924
24277	Kitakyushu	1924
24278	Koga	1924
24279	Kurate	1924
24280	Kurume	1924
24281	Maebaru	1924
24282	Miyata	1924
24283	Mizumaki	1924
24284	Munakata	1924
24285	Nakagawa	1924
24286	Nakama	1924
24287	Nogata	1924
24288	Ogori	1924
24289	Okagaki	1924
24290	Okawa	1924
24291	Omuta	1924
24292	Onojo	1924
24293	Sasaguri	1924
24294	Setaka	1924
24295	Shime	1924
24296	Shingu	1924
24297	Sue	1924
24298	Tagawa	1924
24299	Tanushimaru	1924
24300	Umi	1924
24301	Yamada	1924
24302	Yame	1924
24303	Yanagawa	1924
24304	Yukuhashi	1924
24305	Aizubange	1925
24306	Aizuwakamatsu	1925
24307	Fukushima	1925
24308	Funehiki	1925
24309	Haramachi	1925
24310	Hobara	1925
24311	Inawashiro	1925
24312	Ishikawa	1925
24313	Iwaki	1925
24314	Kawamata	1925
24315	Kitakata	1925
24316	Koriyama	1925
24317	Miharu	1925
24318	Motomiya	1925
24319	Namie	1925
24320	Nihommatsu	1925
24321	Shirakawa	1925
24322	Soma	1925
24323	Sukagawa	1925
24324	Yanagawa	1925
24325	Ena	1926
24326	Gifu	1926
24327	Ginan	1926
24328	Godo	1926
24329	Hashima	1926
24330	Hozumi	1926
24331	Ibigawa	1926
24332	Ikeda	1926
24333	Kakamigahara	1926
24334	Kani	1926
24335	Kasamatsu	1926
24336	Mino	1926
24337	Minokamo	1926
24338	Mitake	1926
24339	Mizunami	1926
24340	Nakatsugawa	1926
24341	Ogaki	1926
24342	Ono	1926
24343	Seki	1926
24344	Tajimi	1926
24345	Takayama	1926
24346	Tarui	1926
24347	Toki	1926
24348	Yoro	1926
24349	Annaka	1927
24350	Azuma	1927
24351	Fujimi	1927
24352	Fujioka	1927
24353	Gumma	1927
24354	Haruna	1927
24355	Isesaki	1927
24356	Kasakake	1927
24357	Kiryu	1927
24358	Maebashi	1927
24359	Nakanojo	1927
24360	Nitta	1927
24361	Numata	1927
24362	Oizumi	1927
24363	Omama	1927
24364	Ora	1927
24365	Ota	1927
24366	Sakai	1927
24367	Shibukawa	1927
24368	Takasaki	1927
24369	Tamamura	1927
24370	Tatebayashi	1927
24371	Tomioka	1927
24372	Yoshii	1927
24373	Fuchu	1928
24374	Fukuyama	1928
24375	Hatsukaichi	1928
24376	Higashihiroshima	1928
24377	Hiroshima	1928
24378	Innoshima	1928
24379	Kaita	1928
24380	Kannabe	1928
24381	Kumano	1928
24382	Kure	1928
24383	Kurose	1928
24384	Mihara	1928
24385	Miyoshi	1928
24386	Ono	1928
24387	Onomichi	1928
24388	Otake	1928
24389	Shinichi	1928
24390	Shobara	1928
24391	Takehara	1928
24392	Abashiri	1929
24393	Akabira	1929
24394	Asahikawa	1929
24395	Ashibetsu	1929
24396	Bibai	1929
24397	Bihoro	1929
24398	Chitose	1929
24399	Date	1929
24400	Ebetsu	1929
24401	Eniwa	1929
24402	Fukagawa	1929
24403	Furano	1929
24404	Hakodate	1929
24405	Hokkaido	1929
24406	Hyogo	1929
24407	Ishikari	1929
24408	Iwamizawa	1929
24409	Iwanai	1929
24410	Kamiiso	1929
24411	Kitahiroshima	1929
24412	Kitami	1929
24413	Kushiro	1929
24414	Makubetsu	1929
24415	Mikasa	1929
24416	Mombetsu	1929
24417	Muroran	1929
24418	Nakashibetsu	1929
24419	Nanae	1929
24420	Nayoro	1929
24421	Nemuro	1929
24422	Noboribetsu	1929
24423	Obihiro	1929
24424	Otaru	1929
24425	Otofuke	1929
24426	Rumoi	1929
24427	Sapporo	1929
24428	Shibetsu	1929
24429	Shiraoi	1929
24430	Shizunai	1929
24431	Sunagawa	1929
24432	Takikawa	1929
24433	Tobetsu	1929
24434	Tomakomai	1929
24435	Utashinai	1929
24436	Wakkanai	1929
24437	Yoichi	1929
24438	Yubari	1929
24439	Aioi	1930
24440	Akashi	1930
24441	Ako	1930
24442	Amagasaki	1930
24443	Ashiya	1930
24444	Fukusaki	1930
24445	Harima	1930
24446	Himeji	1930
24447	Inagawa	1930
24448	Inami	1930
24449	Itami	1930
24450	Kakogawa	1930
24451	Kasai	1930
24452	Kawanishi	1930
24453	Kobe	1930
24454	Kodera	1930
24455	Miki	1930
24456	Nandan	1930
24457	Nishinomiya	1930
24458	Nishiwaki	1930
24459	Ono	1930
24460	Sanda	1930
24461	Sasayama	1930
24462	Sumoto	1930
24463	Taishi	1930
24464	Takarazuka	1930
24465	Takasago	1930
24466	Tatsuno	1930
24467	Toyooka	1930
24468	Yamasaki	1930
24469	Yashiro	1930
24470	Yumesaki	1930
24471	Ami	1931
24472	Chiyoda	1931
24473	Daigo	1931
24474	Edosaki	1931
24475	Fujishiro	1931
24476	Hasaki	1931
24477	Hitachi	1931
24478	Hitachinaka	1931
24479	Hitachiota	1931
24480	Hokota	1931
24481	Ibaraki	1931
24482	Ina	1931
24483	Ishige	1931
24484	Ishioka	1931
24485	Itako	1931
24486	Iwai	1931
24487	Iwase	1931
24488	Kamisu	1931
24489	Kasama	1931
24490	Kashima	1931
24491	Kasumigaura	1931
24492	Kitaibaraki	1931
24493	Koga	1931
24494	Kukizaki	1931
24495	Makabe	1931
24496	Minori	1931
24497	Mito	1931
24498	Mitsukaido	1931
24499	Moriya	1931
24500	Naka	1931
24501	Oarai	1931
24502	Omiya	1931
24503	Ryugasaki	1931
24504	Sakai	1931
24505	Sanwa	1931
24506	Shimodate	1931
24507	Shimotsuma	1931
24508	Sowa	1931
24509	Takahagi	1931
24510	Tokai	1931
24511	Tomobe	1931
24512	Tone	1931
24513	Toride	1931
24514	Tsukuba	1931
24515	Ushiku	1931
24516	Yachiyo	1931
24517	Yasato	1931
24518	Yuki	1931
24519	Hakui	1932
24520	Kaga	1932
24521	Kanazawa	1932
24522	Komatsu	1932
24523	Matto	1932
24524	Nanao	1932
24525	Nonoichi	1932
24526	Suzu	1932
24527	Tsubata	1932
24528	Tsurugi	1932
24529	Uchinada	1932
24530	Wajima	1932
24531	Daito	1933
24532	Esashi	1933
24533	Hanamaki	1933
24534	Ichinohe	1933
24535	Ichinoseki	1933
24536	Iwate	1933
24537	Kamaishi	1933
24538	Kitakami	1933
24539	Kuji	1933
24540	Miyako	1933
24541	Mizusawa	1933
24542	Morioka	1933
24543	Ninohe	1933
24544	Ofunato	1933
24545	Otsuchi	1933
24546	Rikuzentakata	1933
24547	Shiwa	1933
24548	Shizukuishi	1933
24549	Takizawa	1933
24550	Tono	1933
24551	Yahaba	1933
24552	Yamada	1933
24553	Kagawa	1934
24554	Kanonji	1934
24555	Kokubunji	1934
24556	Marugame	1934
24557	Miki	1934
24558	Ryonan	1934
24559	Sakaide	1934
24560	Shido	1934
24561	Tadotsu	1934
24562	Takamatsu	1934
24563	Tonosho	1934
24564	Zentsuji	1934
24565	Aira	1935
24566	Akune	1935
24567	Hayato	1935
24568	Ibusuki	1935
24569	Ijuin	1935
24570	Izumi	1935
24571	Kagoshima	1935
24572	Kajiki	1935
24573	Kanoya	1935
24574	Kaseda	1935
24575	Kokubu	1935
24576	Kushikino	1935
24577	Makurazaki	1935
24578	Naze	1935
24579	Nishinoomote	1935
24580	Okuchi	1935
24581	Sendai	1935
24582	Shibushi	1935
24583	Sueyoshi	1935
24584	Tarumizu	1935
24585	Aikawa	1936
24586	Atsugi	1936
24587	Ayase	1936
24588	Chigasaki	1936
24589	Ebina	1936
24590	Fujisawa	1936
24591	Hadano	1936
24592	Hakone	1936
24593	Hayama	1936
24594	Hiratsuka	1936
24595	Isehara	1936
24596	Kamakura	1936
24597	Kawasaki	1936
24598	Minamiashigara	1936
24599	Miura	1936
24600	Ninomiya	1936
24601	Odawara	1936
24602	Oiso	1936
24603	Sagamihara	1936
24604	Samukawa	1936
24605	Shiroyama	1936
24606	Takatsu-Ku	1936
24607	Tsukui	1936
24608	Yamato	1936
24609	Yokohama	1936
24610	Yokosuka	1936
24611	Yugawara	1936
24612	Zama	1936
24613	Zushi	1936
24614	Gunma	1937
24615	Saitama	1937
24616	Aki	1938
24617	Ino	1938
24618	Kochi	1938
24619	Muroto	1938
24620	Nakamura	1938
24621	Nankoku	1938
24622	Sukumo	1938
24623	Susaki	1938
24624	Tosa	1938
24625	Tosashimizu	1938
24626	Tosayamada	1938
24627	Arao	1939
24628	Ashikita	1939
24629	Aso	1939
24630	Hitoyoshi	1939
24631	Hondo	1939
24632	Jonan	1939
24633	Kikuchi	1939
24634	Kikuyo	1939
24635	Koshi	1939
24636	Kumamoto	1939
24637	Mashiki	1939
24638	Matsubase	1939
24639	Minamata	1939
24640	Nishigoshi	1939
24641	Ozu	1939
24642	Tamana	1939
24643	Ueki	1939
24644	Ushibuka	1939
24645	Uto	1939
24646	Yamaga	1939
24647	Yatsushiro	1939
24648	Ayabe	1940
24649	Fukuchiyama	1940
24650	Joyo	1940
24651	Kameoka	1940
24652	Kizu	1940
24653	Kumiyama	1940
24654	Kyotanabe	1940
24655	Kyoto	1940
24656	Maizuru	1940
24657	Miyazu	1940
24658	Muko	1940
24659	Nagaokakyo	1940
24660	Seika	1940
24661	Uji	1940
24662	Yawata	1940
24663	Ago	1941
24664	Hisai	1941
24665	Ise	1941
24666	Kameyama	1941
24667	Komono	1941
24668	Kumano	1941
24669	Kuwana	1941
24670	Matsusaka	1941
24671	Meiwa	1941
24672	Nabari	1941
24673	Owase	1941
24674	Suzuka	1941
24675	Toba	1941
24676	Toin	1941
24677	Tsu	1941
24678	Ueno	1941
24679	Yokkaichi	1941
24680	Furukawa	1942
24681	Hasama	1942
24682	Ishinomaki	1942
24683	Iwanuma	1942
24684	Kakuda	1942
24685	Kesennuma	1942
24686	Kogota	1942
24687	Marumori	1942
24688	Natori	1942
24689	Ogawara	1942
24690	Rifu	1942
24691	Sendai	1942
24692	Shibata	1942
24693	Shichigahama	1942
24694	Shiogama	1942
24695	Shiroishi	1942
24696	Tagajo	1942
24697	Taiwa	1942
24698	Tomiya	1942
24699	Wakuya	1942
24700	Watari	1942
24701	Yamoto	1942
24702	Ebino	1943
24703	Hyuga	1943
24704	Kiyotake	1943
24705	Kobayashi	1943
24706	Kunitomi	1943
24707	Kushima	1943
24708	Mimata	1943
24709	Miyakonojo	1943
24710	Miyazaki	1943
24711	Nichinan	1943
24712	Nobeoka	1943
24713	Sadowara	1943
24714	Saito	1943
24715	Shintomi	1943
24716	Takanabe	1943
24717	Chino	1944
24718	Hotaka	1944
24719	Iida	1944
24720	Iiyama	1944
24721	Ina	1944
24722	Komagane	1944
24723	Komoro	1944
24724	Koshoku	1944
24725	Maruko	1944
24726	Matsumoto	1944
24727	Minowa	1944
24728	Nagano	1944
24729	Nakano	1944
24730	Okaya	1944
24731	Omachi	1944
24732	Saku	1944
24733	Shimosuwa	1944
24734	Shiojiri	1944
24735	Suwa	1944
24736	Suzaka	1944
24737	Tatsuno	1944
24738	Tobu	1944
24739	Toyoshina	1944
24740	Ueda	1944
24741	Fukue	1945
24742	Hirado	1945
24743	Isahaya	1945
24744	Matsuura	1945
24745	Nagasaki	1945
24746	Nagayo	1945
24747	Omura	1945
24748	Sasebo	1945
24749	Shimabara	1945
24750	Togitsu	1945
24751	Gojo	1946
24752	Gose	1946
24753	Haibara	1946
24754	Heguri	1946
24755	Ikagura	1946
24756	Ikoma	1946
24757	Kammaki	1946
24758	Kashiba	1946
24759	Kashihara	1946
24760	Kawai	1946
24761	Koryo	1946
24762	Nara	1946
24763	Oji	1946
24764	Oyodo	1946
24765	Sakurai	1946
24766	Sango	1946
24767	Tawaramoto	1946
24768	Tenri	1946
24769	Yamatokoriyama	1946
24770	Yamatotakada	1946
24771	Arai	1947
24772	Fuchu	1947
24773	Gosen	1947
24774	Itoigawa	1947
24775	Joetsu	1947
24776	Kameda	1947
24777	Kamo	1947
24778	Kashiwazaki	1947
24779	Kurosaki	1947
24780	Maki	1947
24781	Mitsuke	1947
24782	Muika	1947
24783	Murakami	1947
24784	Muramatsu	1947
24785	Nagaoka	1947
24786	Nakajo	1947
24787	Niigata	1947
24788	Niitsu	1947
24789	Ojiya	1947
24790	Ryotsu	1947
24791	Sanjo	1947
24792	Shibata	1947
24793	Shiozawa	1947
24794	Shirone	1947
24795	Suibara	1947
24796	Tochio	1947
24797	Tokamachi	1947
24798	Toyosaka	1947
24799	Tsubame	1947
24800	Yoshida	1947
24801	Beppu	1948
24802	Bungotakada	1948
24803	Hiji	1948
24804	Hita	1948
24805	Kitsuki	1948
24806	Kusu	1948
24807	Nakatsu	1948
24808	Oita	1948
24809	Saiki	1948
24810	Taketa	1948
24811	Tsukumi	1948
24812	Usa	1948
24813	Usuki	1948
24814	Bizen	1949
24815	Ibara	1949
24816	Kamogata	1949
24817	Kasaoka	1949
24818	Kurashiki	1949
24819	Mabi	1949
24820	Niimi	1949
24821	Okayama	1949
24822	Sanyo	1949
24823	Soja	1949
24824	Takahashi	1949
24825	Tamano	1949
24826	Tsuyama	1949
24827	Chatan	1950
24828	Ginowan	1950
24829	Gushikawa	1950
24830	Haebaru	1950
24831	Hirara	1950
24832	Ishigaki	1950
24833	Ishikawa	1950
24834	Itoman	1950
24835	Nago	1950
24836	Naha	1950
24837	Nishihara	1950
24838	Okinawa	1950
24839	Tomigusuku	1950
24840	Urasoe	1950
24841	Yomitan	1950
24842	Daito	1951
24843	Fujiidera	1951
24844	Habikino	1951
24845	Hannan	1951
24846	Higashiosaka	1951
24847	Hirakata	1951
24848	Ibaraki	1951
24849	Ikeda	1951
24850	Izumi	1951
24851	Izumiotsu	1951
24852	Izumisano	1951
24853	Kadoma	1951
24854	Kaizuka	1951
24855	Kashiwara	1951
24856	Katano	1951
24857	Kawachinagano	1951
24858	Kishiwada	1951
24859	Kobe	1951
24860	Kumatori	1951
24861	Matsubara	1951
24862	Mihara	1951
24863	Mino	1951
24864	Misaki	1951
24865	Moriguchi	1951
24866	Neyagawa	1951
24867	Osaka	1951
24868	Osakasayama	1951
24869	Sakai	1951
24870	Sennan	1951
24871	Settsu	1951
24872	Shijonawate	1951
24873	Shimamoto	1951
24874	Suita	1951
24875	Takaishi	1951
24876	Takatsuki	1951
24877	Tondabayashi	1951
24878	Toyonaka	1951
24879	Toyono	1951
24880	Yao	1951
24881	Imari	1952
24882	Kanzaki	1952
24883	Karatsu	1952
24884	Kashima	1952
24885	Kawasoe	1952
24886	Saga	1952
24887	Takeo	1952
24888	Taku	1952
24889	Tosu	1952
24890	Ureshino	1952
24891	Yamato	1952
24892	Ageo	1953
24893	Asaka	1953
24894	Chichibu	1953
24895	Fujimi	1953
24896	Fukaya	1953
24897	Fukiage	1953
24898	Gyoda	1953
24899	Hanno	1953
24900	Hanyu	1953
24901	Hasuda	1953
24902	Hatogaya	1953
24903	Hatoyama	1953
24904	Hidaka	1953
24905	Higashimatsuyama	1953
24906	Honjo	1953
24907	Ina	1953
24908	Iruma	1953
24909	Iwatsuki	1953
24910	Kamifukuoka	1953
24911	Kamisato	1953
24912	Kasukabe	1953
24913	Kawagoe	1953
24914	Kawaguchi	1953
24915	Kawajima	1953
24916	Kazo	1953
24917	Kisai	1953
24918	Kitamoto	1953
24919	Kodama	1953
24920	Konosu	1953
24921	Koshigaya	1953
24922	Kuki	1953
24923	Kumagaya	1953
24924	Kurihashi	1953
24925	Matsubushi	1953
24926	Menuma	1953
24927	Misato	1953
24928	Miyashiro	1953
24929	Miyoshi	1953
24930	Moroyama	1953
24931	Niiza	1953
24932	Ogawa	1953
24933	Oi	1953
24934	Okegawa	1953
24935	Omiya	1953
24936	Saitma-Shi	1953
24937	Sakado	1953
24938	Satte	1953
24939	Sayama	1953
24940	Shiki	1953
24941	Shiraoka	1953
24942	Shobu	1953
24943	Showa	1953
24944	Soka	1953
24945	Sugito	1953
24946	Toda	1953
24947	Tokorozawa	1953
24948	Tsurugashima	1953
24949	Urawa	1953
24950	Wako	1953
24951	Warabi	1953
24952	Washimiya	1953
24953	Yashio	1953
24954	Yono	1953
24955	Yorii	1953
24956	Yoshikawa	1953
24957	Yoshimi	1953
24958	Hikone	1954
24959	Hino	1954
24960	Konan	1954
24961	Kosei	1954
24962	Kusatsu	1954
24963	Minakuchi	1954
24964	Moriyama	1954
24965	Nagahama	1954
24966	Notogawa	1954
24967	Omihachiman	1954
24968	Otsu	1954
24969	Ritto	1954
24970	Shiga	1954
24971	Yasu	1954
24972	Yokaichi	1954
24973	Gotsu	1955
24974	Hamada	1955
24975	Hikawa	1955
24976	Hirata	1955
24977	Izumo	1955
24978	Masuda	1955
24979	Matsue	1955
24980	Oda	1955
24981	Yasugi	1955
24982	Asaba	1956
24983	Atami	1956
24984	Daito	1956
24985	Fuji	1956
24986	Fujieda	1956
24987	Fujinomiya	1956
24988	Fukuroi	1956
24989	Gotemba	1956
24990	Haibara	1956
24991	Hamakita	1956
24992	Hamamatsu	1956
24993	Hamaoka	1956
24994	Hosoe	1956
24995	Ito	1956
24996	Iwata	1956
24997	Kakegawa	1956
24998	Kanaya	1956
24999	Kannami	1956
25000	Kikugawa	1956
25001	Kosai	1956
25002	Mishima	1956
25003	Mori	1956
25004	Nagaizumi	1956
25005	Numazu	1956
25006	Oigawa	1956
25007	Oyama	1956
25008	Ryuyo	1956
25009	Sagara	1956
25010	Shimada	1956
25011	Shimizu	1956
25012	Shimoda	1956
25013	Shizuoka	1956
25014	Susono	1956
25015	Tenryu	1956
25016	Toyoda	1956
25017	Yaizu	1956
25018	Yoshida	1956
25019	Ashikaga	1957
25020	Fujioka	1957
25021	Imaichi	1957
25022	Iwafune	1957
25023	Kaminokawa	1957
25024	Kanuma	1957
25025	Karasuyama	1957
25026	Kawachi	1957
25027	Kuroiso	1957
25028	Mashiko	1957
25029	Mibu	1957
25030	Minamikawachi	1957
25031	Moka	1957
25032	Motegi	1957
25033	Nasu	1957
25034	Nikko	1957
25035	Nishinasuno	1957
25036	Nogi	1957
25037	Ohira	1957
25038	Otawara	1957
25039	Oyama	1957
25040	Sano	1957
25041	Takanezawa	1957
25042	Tanuma	1957
25043	Tochigi	1957
25044	Ujiie	1957
25045	Utsunomiya	1957
25046	Yaita	1957
25047	Aizumi	1958
25048	Anan	1958
25049	Ikeda	1958
25050	Ishii	1958
25051	Kamojima	1958
25052	Kitajima	1958
25053	Komatsushima	1958
25054	Naruto	1958
25055	Tokushima	1958
25056	Waki	1958
25057	Akiruno	1959
25058	Akishima	1959
25059	Chofu	1959
25060	Fuchu	1959
25061	Hachioji	1959
25062	Hamura	1959
25063	Higashikurume	1959
25064	Higashimurayama	1959
25065	Higashiyamato	1959
25066	Hino	1959
25067	Hoya	1959
25068	Inagi	1959
25069	Kiyose	1959
25070	Kodaira	1959
25071	Koganei	1959
25072	Kokubunji	1959
25073	Komae	1959
25074	Kunitachi	1959
25075	Machida	1959
25076	Mitaka	1959
25077	Mizuho	1959
25078	Musashimurayama	1959
25079	Musashino	1959
25080	Ome	1959
25081	Tachikawa	1959
25082	Tama	1959
25083	Tanashi	1959
25084	Tokyo	1959
25085	Kurayoshi	1960
25086	Sakaiminato	1960
25087	Tottori	1960
25088	Yonago	1960
25089	Fukumitsu	1961
25090	Himi	1961
25091	Kamiichi	1961
25092	Kosugi	1961
25093	Kurobe	1961
25094	Namerikawa	1961
25095	Nyuzen	1961
25096	Osawano	1961
25097	Oyabe	1961
25098	Shimminato	1961
25099	Takaoka	1961
25100	Tateyama	1961
25101	Tonami	1961
25102	Toyama	1961
25103	Uozu	1961
25104	Yatsuo	1961
25105	Arida	1962
25106	Gobo	1962
25107	Hashimoto	1962
25108	Iwade	1962
25109	Kainan	1962
25110	Katsuragi	1962
25111	Kishigawa	1962
25112	Nachikatsuura	1962
25113	Shingu	1962
25114	Tanabe	1962
25115	Wakayama	1962
25116	Higashine	1963
25117	Kahoku	1963
25118	Kaminoyama	1963
25119	Kawanishi	1963
25120	Murayama	1963
25121	Nagai	1963
25122	Nanyo	1963
25123	Obanazawa	1963
25124	Sagae	1963
25125	Sakata	1963
25126	Shinjo	1963
25127	Takahata	1963
25128	Tendo	1963
25129	Tsuchiura	1963
25130	Tsuruoka	1963
25131	Yamagata	1963
25132	Yonezawa	1963
25133	Yuza	1963
25134	Hagi	1964
25135	Hikari	1964
25136	Hofu	1964
25137	Iwakuni	1964
25138	Kudamatsu	1964
25139	Mine	1964
25140	Nagato	1964
25141	Ogori	1964
25142	Onoda	1964
25143	Sanyo	1964
25144	Shimonoseki	1964
25145	Shinnanyo	1964
25146	Tokuyama	1964
25147	Toyoura	1964
25148	Ube	1964
25149	Yamaguchi	1964
25150	Yanai	1964
25151	Enzan	1965
25152	Fujiyoshida	1965
25153	Isawa	1965
25154	Kofu	1965
25155	Nirasaki	1965
25156	Otsuki	1965
25157	Ryuo	1965
25158	Tsuru	1965
25159	Uenohara	1965
25160	Yamanashi	1965
25161	Grouville	1966
25162	Trinity	1976
25163	Abbin	1977
25164	Ajlun	1977
25165	Anjarah	1977
25166	Arjan	1977
25167	Ayn Janna	1977
25168	Halawah	1977
25169	Kharbat al-Wahadnah	1977
25170	Kufranjah	1977
25171	Sakhrah	1977
25172	al-Hashamiyah	1977
25173	Abu Alanda	1978
25174	Amman	1978
25175	Askan Abu Nusayr	1978
25176	Jawa	1978
25177	Khalda wa Tila-al-Ali	1978
25178	Khraybat As-Suq	1978
25179	Marj al-Hammam	1978
25180	Naur	1978
25181	Nuzhat Sahab	1978
25182	Sahab	1978
25183	Shafa Badran	1978
25184	Suwaylih	1978
25185	Tariq	1978
25186	Umm As-Summaq	1978
25187	Umm Nuwarah	1978
25188	Umm Qusayr wal Muqabalin	1978
25189	Umm al-Basatin	1978
25190	Wadi as-Sir	1978
25191	al-Abdaliyah	1978
25192	al-Binayat	1978
25193	al-Faysaliyah	1978
25194	al-Jizah	1978
25195	al-Jubayhah	1978
25196	al-Juwaydah	1978
25197	al-Quwaysimah	1978
25198	al-Yadudah	1978
25199	ar-Rawdah	1978
25200	at-Talbiyah	1978
25201	at-Taybah	1978
25202	Alal	1979
25203	Anbah	1979
25204	Arhaba	1979
25205	Aydun	1979
25206	Bayt Idas	1979
25207	Bayt Ras	1979
25208	Bayt Yafa	1979
25209	Bushra	1979
25210	Dayr Abi Said	1979
25211	Dayr Yusif	1979
25212	Dayr as-Saanah	1979
25213	Duwaqarah	1979
25214	Hakama	1979
25215	Hartha	1979
25216	Hatam	1979
25217	Hawwarah	1979
25218	Irbid	1979
25219	Jasar ash-Shaykh Hussayn	1979
25220	Judayta	1979
25221	Katam	1979
25222	Kharja	1979
25223	Kufur Awan	1979
25224	Kufur Abil	1979
25225	Kufur Asad	1979
25226	Kufur Rakab	1979
25227	Kufur Sum	1979
25228	Kufur Yuba	1979
25229	Kufur al-Ma	1979
25230	Kuraymah	1979
25231	Malka	1979
25232	Mukhayyam al-Husun	1979
25233	Qumaym	1979
25234	Saham	1979
25235	Sal	1979
25236	Samma	1979
25237	Sammaw	1979
25238	Sum	1979
25239	Tabnah	1979
25240	Umm Qays	1979
25241	Wadi al-Yabas	1979
25242	Waqqas	1979
25243	Zahar	1979
25244	al-Ashrafiyah	1979
25245	al-Balawnah	1979
25246	al-Buwaydah	1979
25247	al-Husun	1979
25248	al-Manshiyah	1979
25249	al-Masharia	1979
25250	al-Mazar ash-Shamaliyah	1979
25251	al-Mughayyar	1979
25252	an-Nuaymeh	1979
25253	ar-Ramtha	1979
25254	as-Sarih	1979
25255	ash-Shajarah	1979
25256	ash-Shunah ash-Shamaliyah	1979
25257	at-Taybah	1979
25258	at-Turrah	1979
25259	Balila	1980
25260	Burma	1980
25261	Jarash	1980
25262	Kufur Khall	1980
25263	Mukhayyam Ghazzah	1980
25264	Mukhayyam Suf	1980
25265	Qafqafa	1980
25266	Raymun	1980
25267	Sakab	1980
25268	Suf	1980
25269	al-Kattah	1980
25270	Bayar	1981
25271	Maan	1981
25272	Wadi Musa	1981
25273	al-Hussayniyah	1981
25274	al-Jafar	1981
25275	at-Taybah	1981
25276	Dhiban	1982
25277	Main	1982
25278	Madaba	1982
25279	Mulayh	1982
25280	al-Faysaliyah	1982
25281	al-Aqabah	1983
25282	al-Quwayrah	1983
25283	Ayn al-Basha	1984
25284	Darar	1984
25285	Juwafat al-Kafrayn	1984
25286	Maaddi	1984
25287	Mahas	1984
25288	Safut	1984
25289	Suknat ash-Shunah	1984
25290	Yarqa	1984
25291	al-Baqah	1984
25292	al-Fuhays	1984
25293	al-Karamah	1984
25294	ar-Rawdah	1984
25295	as-Salt	1984
25296	as-Sawalhah	1984
25297	as-Subayhi	1984
25298	at-Tawal al-Janubi	1984
25299	at-Tuwal ash-Shamali	1984
25300	Ayy	1985
25301	Adar	1985
25302	Faqqu	1985
25303	Ghawr al-Mazraah	1985
25304	Ghawr as-Safi	1985
25305	Mawtah	1985
25306	Sirfa	1985
25307	al-Hussayniyah	1985
25308	al-Karak	1985
25309	al-Mazar	1985
25310	al-Qasr	1985
25311	al-Qitranah	1985
25312	ar-Rabbah	1985
25313	ash-Shahabiyah	1985
25314	at-Taybah	1985
25315	Badiyat ar-Ruwayshid	1986
25316	Balama	1986
25317	Manshiyat Bani Hassan	1986
25318	Mugayyar as-Sarhan	1986
25319	Sabha	1986
25320	Sama as-Sarhan	1986
25321	Umm al-Quttayn	1986
25322	al-Hamra	1986
25323	al-Khaldiyah al-Jadidah	1986
25324	al-Mabrukah	1986
25325	al-Mafraq	1986
25326	ar-Ruwayshid	1986
25327	az-Zatari	1986
25328	Busayrah	1987
25329	al-Ayn al-Bayda	1987
25330	al-Hasa	1987
25331	al-Qadisiyah	1987
25332	at-Tafilah	1987
25333	Iskan al-Hashamiyah	1988
25334	Mushayrfat Ras al-Ayn	1988
25335	Shnillar	1988
25336	ad-Dulayl	1988
25337	al-Azraq ash-Shamali	1988
25338	al-Hashamiyah	1988
25339	ar-Russayfah	1988
25340	as-Sukhnah	1988
25341	az-Zarqa	1988
25342	Akmecet	1989
25343	Aral	1989
25344	Baykonir	1989
25345	Canakazali	1989
25346	Canakorgan	1989
25347	Cosali	1989
25348	Kazali	1989
25349	Sieli	1989
25350	Tasboget	1989
25351	Aksu	1990
25352	Alekseevka	1990
25353	Astana	1990
25354	Atbasar	1990
25355	Bestobe	1990
25356	Caltir	1990
25357	Colimbet	1990
25358	Ereymentau	1990
25359	Koksetau	1990
25360	Makin	1990
25361	Stepnogorsk	1990
25362	Aktobe	1991
25363	Alka	1991
25364	Batamsi	1991
25365	Embi	1991
25366	Hromtau	1991
25367	Kandagac	1991
25368	Salkar	1991
25369	Subarkudik	1991
25370	Subarsi	1991
25371	Temir	1991
25372	Almati	1992
25373	Almaty	1992
25374	Boralday	1992
25375	Carkant	1992
25376	Energetyceskiy	1992
25377	Esik	1992
25378	Fabrichniy	1992
25379	Kapsagay	1992
25380	Karabulak	1992
25381	Kaskelen	1992
25382	Kirov	1992
25383	Sariozek	1992
25384	Sarkand	1992
25385	Selek	1992
25386	Taldikorgan	1992
25387	Talgar	1992
25388	Tekeli	1992
25389	Ustobe	1992
25390	Uzunagac	1992
25391	Atirau	1993
25392	Atyrau	1993
25393	Dossor	1993
25394	Inderbor	1993
25395	Karaton	1993
25396	Kulsari	1993
25397	Makat	1993
25398	Oporni	1993
25399	Sumisker	1993
25400	Abay	1996
25401	Akadir	1996
25402	Aktas	1996
25403	Aktau	1996
25404	Atasu	1996
25405	Balkas	1996
25406	Cayrem	1996
25407	Cezkazgan	1996
25408	Gulsat	1996
25409	Karacal	1996
25410	Karaganda	1996
25411	Karkarali	1996
25412	Karsakbay	1996
25413	Konrat	1996
25414	Novodolinskiy	1996
25415	Osakarovka	1996
25416	Sahti	1996
25417	Saran	1996
25418	Sarisagan	1996
25419	Satpaev	1996
25420	Temirtau	1996
25421	Tokaryovka	1996
25422	Arkalik	1997
25423	Borovskoy	1997
25424	Cetikara	1997
25425	Derjavinsk	1997
25426	Esil	1997
25427	Fodorov	1997
25428	Kacar	1997
25429	Komsomol	1997
25430	Kostanay	1997
25431	Kusmurin	1997
25432	Lisakovsk	1997
25433	Rudni	1997
25434	Tobol	1997
25435	Uritsk	1997
25436	Zatobolsk	1997
25437	Aktau	1998
25438	Beyneu	1998
25439	Canaozen	1998
25440	Cetibay	1998
25441	Fort-Sevcenko	1998
25442	Kurik	1998
25443	Mangyslak	1998
25444	Setpe	1998
25445	Ekibastuz	2000
25446	Ermak	2000
25447	Ertis	2000
25448	Kaciri	2000
25449	Maykain	2000
25450	Pavlodar	2000
25451	Sarbakti	2000
25452	Canatas	2003
25453	Georgiyev	2003
25454	Karatau	2003
25455	Lugovoy	2003
25456	Merke	2003
25457	Mihaylov	2003
25458	Oytal	2003
25459	Su	2003
25460	Taraz	2003
25461	Gilgil	2004
25462	Karatina	2004
25463	Kiambu	2004
25464	Kijabe	2004
25465	Kikuyu	2004
25466	Limuru	2004
25467	Maragua	2004
25468	Muranga	2004
25469	Nyeri	2004
25470	Ruiru	2004
25471	Sagana	2004
25472	Thika	2004
25473	Vanga	2004
25474	Changamwe	2005
25475	Garsen	2005
25476	Gazi	2005
25477	Hola	2005
25478	Kaloleni	2005
25479	Kilifi	2005
25480	Kinango	2005
25481	Kipini	2005
25482	Kwale	2005
25483	Lamu	2005
25484	Malindi	2005
25485	Mambrui	2005
25486	Mombasa	2005
25487	Sawasawa	2005
25488	Shimoni	2005
25489	Takaungu	2005
25490	Taveta	2005
25491	Voi	2005
25492	Witu	2005
25493	Wundanyi	2005
25494	Athi River	2006
25495	Chuka	2006
25496	Embu	2006
25497	Isiolo	2006
25498	Kangonde	2006
25499	Kitui	2006
25500	Machakos	2006
25501	Mado Gashi	2006
25502	Marsabit	2006
25503	Meru	2006
25504	Moyale	2006
25505	Mutomo	2006
25506	Nairobi	2007
25507	Homa Bay	2009
25508	Kisii	2009
25509	Kisumu	2009
25510	Migori	2009
25511	Bungoma	2011
25512	Busia	2011
25513	Kakamega	2011
25514	Mumias	2011
25515	Webuye	2011
25516	Taburao	2012
25517	Binoinano	2013
25518	Takaeang	2014
25519	Roreti	2015
25520	Ooma	2016
25521	Tabukiniberu	2017
25522	Butaritari	2018
25523	London	2019
25524	Tabontebike	2020
25525	Tabiauea	2021
25526	Makin	2022
25527	Rawannawi	2023
25528	Rungata	2024
25529	Temaraia	2025
25530	Ijaki	2026
25531	Nabari	2030
25532	Abaokoro	2031
25533	Washington	2034
25534	Kanggye	2035
25535	Cheongjin	2036
25536	Kimchaek	2036
25537	Najin	2036
25538	Hamheung	2037
25539	Sariweon	2038
25540	Seongnim	2038
25541	Haeju	2039
25542	Kaeseong	2040
25543	Weonsan	2041
25544	Nampo	2042
25545	Sineuiju	2043
25546	Phyeongseong	2044
25547	Pyeongyang	2045
25548	Pyongyang	2045
25549	Hyesan	2046
25550	Busan	2047
25551	Aeweol	2048
25552	Cheju	2048
25553	Seogwipo	2048
25554	Cheonju	2049
25555	Chongup	2049
25556	Iksan	2049
25557	Kimje	2049
25558	Kochang	2049
25559	Kunsan	2049
25560	Namwon	2049
25561	Puan	2049
25562	Haenam	2050
25563	Hwasun	2050
25564	Kwangyang	2050
25565	Kwangyang Up	2050
25566	Mokpo	2050
25567	Naju	2050
25568	Peolgyo	2050
25569	Suncheon	2050
25570	Yeocheon	2050
25571	Yeosu	2050
25572	Yonggwang	2050
25573	Cheongwon-gun	2051
25574	Eumsung-Kun	2051
25575	Jinchunkun	2051
25576	Okcheon-gun	2051
25577	Um Sung Gun	2051
25578	Chechon	2052
25579	Cheongju	2052
25580	Chincheon	2052
25581	Chungju	2052
25582	Jincheon-gun	2052
25583	Okchon	2052
25584	Yongdong	2052
25585	Asan	2053
25586	Cheonan	2053
25587	Chochiwon	2053
25588	Geumsan-Gun	2053
25589	Hongseong	2053
25590	Kongju	2053
25591	Kumsan	2053
25592	Nonsan	2053
25593	Poryong	2053
25594	Puyeo	2053
25595	Seonghwan	2053
25596	Seosan	2053
25597	Taean	2053
25598	Taesan	2053
25599	Tangjin	2053
25600	Yesan	2053
25601	Yonmu	2053
25602	Chonan	2054
25603	Danjin-gun	2054
25604	Gongjusi	2054
25605	Daegu	2055
25606	Dalseo-gu	2055
25607	Chungcheong	2056
25608	Hoengseong	2056
25609	Mummakeup	2056
25610	Wonju	2056
25611	Gimhae	2057
25612	Goyang-si	2057
25613	Ansan	2058
25614	Anyang	2058
25615	Anyang-Si	2058
25616	Anyangsi	2058
25617	Buchon	2058
25618	Buchun-Si	2058
25619	Byeoryangdong	2058
25620	Dongan-gu	2058
25621	Gimpo City	2058
25622	Goyang	2058
25623	Gupo-si	2058
25624	Guri-Si	2058
25625	Gwacheon Si	2058
25626	Gwangju-Si	2058
25627	Hwaseong-si	2058
25628	Icheon-si	2058
25629	Iljuk-myeon	2058
25630	Kwangju	2058
25631	Pocheon-Si	2058
25632	Seongnam	2058
25633	Shihung-Si	2058
25634	Siheung	2058
25635	Sihung-si	2058
25636	Suwon	2058
25637	Uijeongbu-dong	2058
25638	Uiwang	2058
25639	Yangju	2058
25640	Yangpyeong-Gun	2058
25641	Yeokbuk-Dong-Si	2058
25642	Changwon	2060
25643	Gimhae-si	2060
25644	Incheon	2061
25645	Kanghwa	2061
25646	Namdongku	2061
25647	Jeju	2062
25648	Yeongpyeong-Dong	2062
25649	Jeonju-Si	2063
25650	Chuncheon	2064
25651	Hongcheon	2064
25652	Kangneung	2064
25653	Samchok	2064
25654	Seokcho	2064
25655	Taebaek	2064
25656	Tonghae	2064
25657	Weonju	2064
25658	Yeongweol	2064
25659	Kwangju	2065
25660	Ansan	2066
25661	Anseong	2066
25662	Anyang	2066
25663	Chongok	2066
25664	Euijeongbu	2066
25665	Euiwang	2066
25666	Hanam	2066
25667	Hoechon	2066
25668	Hwado	2066
25669	Hwasung	2066
25670	Ichon	2066
25671	Kihung	2066
25672	Kimpo	2066
25673	Koyang	2066
25674	Kumchon	2066
25675	Kunpo	2066
25676	Kuri	2066
25677	Kwacheon	2066
25678	Kwangju	2066
25679	Kwangmyeong	2066
25680	Munsan	2066
25681	Namyangju	2066
25682	Osan	2066
25683	Paengseong	2066
25684	Pochon	2066
25685	Pubal	2066
25686	Pucheon	2066
25687	Pyeongtaek	2066
25688	Seongnam	2066
25689	Shiheung	2066
25690	Suweon	2066
25691	Taean	2066
25692	Tongducheon	2066
25693	Wabu	2066
25694	Yeoju	2066
25695	Yongin	2066
25696	Andong	2067
25697	Angang	2067
25698	Hayang	2067
25699	Heunghae	2067
25700	Kimcheon	2067
25701	Kumi	2067
25702	Kyeongju	2067
25703	Kyeongsan	2067
25704	Mungyong	2067
25705	Ochon	2067
25706	Oedong	2067
25707	Pohang	2067
25708	Sangju	2067
25709	Seonsan	2067
25710	Waegwan	2067
25711	Yechon	2067
25712	Yeongcheon	2067
25713	Yeongju	2067
25714	Yeonil	2067
25715	Changweon	2068
25716	Chinhae	2068
25717	Chinju	2068
25718	Chinyeong	2068
25719	Keoje	2068
25720	Kimhae	2068
25721	Kochang	2068
25722	Koseong	2068
25723	Masan	2068
25724	Miryang	2068
25725	Naeso	2068
25726	Sacheon	2068
25727	Sinhyeon	2068
25728	Tongyong	2068
25729	Ungsang	2068
25730	Yangju	2068
25731	Yangsan	2068
25732	Anyang-Si	2069
25733	Bucheon	2069
25734	Paju	2069
25735	Sungnamshi	2069
25736	Suwon	2069
25737	Uijongbu	2069
25738	Yangju	2069
25739	Gumi-Shi	2070
25740	Kyungsan	2070
25741	Youngcheon-Si	2070
25742	Bundang	2071
25743	Gunpo	2071
25744	Yangu	2071
25745	Pochun	2072
25746	Yangju	2072
25747	Yonggi	2072
25748	Kijang	2073
25749	Pusan	2073
25750	Seoul	2074
25751	Paju	2075
25752	Hwawon	2076
25753	Taegu	2076
25754	Taejeon	2077
25755	Daejeon	2078
25756	Nongso	2079
25757	Ulsan	2079
25758	Heungup-Myun	2080
25759	Inchon	2081
25760	Pusan	2081
25761	Taejon	2081
25762	Bayan	2083
25763	Hawalli	2083
25764	Massilah	2083
25765	Mushrif	2083
25766	Salwa	2083
25767	Shaab	2083
25768	Subbah-as-Salim	2083
25769	al-Funaytis	2083
25770	al-Funaytis-al-Garbiyah	2083
25771	al-Jabiriyah	2083
25772	al-Karim	2083
25773	ar-Rumaythiyah	2083
25774	as-Salimiyah	2083
25775	Mishref	2084
25776	Qadesiya	2085
25777	Safat	2086
25778	Salmiya	2087
25779	Aqaylah	2088
25780	Abu Hulayfah	2088
25781	Dahar	2088
25782	Desert Area	2088
25783	Hadiyah	2088
25784	Jabbar-al-Ali	2088
25785	Shuaybah	2088
25786	al-Ahmadi	2088
25787	al-Fintas	2088
25788	al-Fuhayhil	2088
25789	al-Mahbulah	2088
25790	al-Manqaf	2088
25791	al-Wafrah	2088
25792	ar-Riqqah	2088
25793	as-Sabahiyah	2088
25794	az-Zawr	2088
25795	Umayriyah	2089
25796	Abraq Khitan	2089
25797	Ardiyah	2089
25798	Fardaws	2089
25799	Jalib ash-Shuyuh	2089
25800	Janub-as-Surrah	2089
25801	Khitan-al-Janubiyah	2089
25802	Qartaba	2089
25803	Ray	2089
25804	Riqay	2089
25805	Sabhan	2089
25806	Sarbah-an-Nasr	2089
25807	Warmawk	2089
25808	al-Andalus	2089
25809	al-Farwaniyah	2089
25810	ar-Rabbiyah	2089
25811	Amgarah	2090
25812	Desert Area	2090
25813	Nasim	2090
25814	Tayma	2090
25815	Uyawn	2090
25816	Waha	2090
25817	al-Jahra	2090
25818	al-Qusayr	2090
25819	as-Sulaybiyah	2090
25820	Abullah-as-Salam	2091
25821	Ardhiyah	2091
25822	Banayd-al-Qar	2091
25823	Health District	2091
25824	Kayfan	2091
25825	Khalidiyah	2091
25826	Mansuriyah	2091
25827	Nuzha	2091
25828	Qarnadah	2091
25829	Shamiyah	2091
25830	ad-Daiyah	2091
25831	ad-Dasma	2091
25832	ad-Dawhah	2091
25833	al-Udayliyah	2091
25834	al-Fayha	2091
25835	al-Kuwayt	2091
25836	al-Qadisiyah	2091
25837	ar-Rawdah	2091
25838	as-Sulaybihat	2091
25839	ash-Shuwaykh Industrial	2091
25840	ash-Shuwaykh Reservoir	2091
25841	Batken	2092
25842	Isfana	2092
25843	Khaidarkan	2092
25844	Kyzyl-Kiya	2092
25845	Ravat	2092
25846	Sulukta	2092
25847	Bishkek	2093
25848	Ak-Suu	2094
25849	Belovodskoye	2094
25850	Boroldoy	2094
25851	Chaldovar	2094
25852	Chatkyol	2094
25853	Chui	2094
25854	Don Arik	2094
25855	Ivanovka	2094
25856	Jangyjar	2094
25857	Jangypakhtar	2094
25858	Kalininskoye	2094
25859	Kalinovka	2094
25860	Kant	2094
25861	Kara-Suu	2094
25862	Karabalta	2094
25863	Kayingdi	2094
25864	Kegety	2094
25865	Kemin	2094
25866	Kosh Tegirmen	2094
25867	Krasnaya Rechka	2094
25868	Orlovka	2094
25869	Sokuluk	2094
25870	Sopokov	2094
25871	Sosnovka	2094
25872	Tokmok	2094
25873	Tunuk	2094
25874	Yuryevka	2094
25875	Ak-Bulok	2095
25876	Ak-Terek	2095
25877	Ananyevo	2095
25878	Balykchy	2095
25879	Barskoon	2095
25880	Cholpon-Ata	2095
25881	Darkhon	2095
25882	Enilchek	2095
25883	Grigoryevka	2095
25884	Jyrgolon	2095
25885	Kara-Say	2095
25886	Karako	2095
25887	Karakol	2095
25888	Kuturgu	2095
25889	Mikhaylovka	2095
25890	Novovoznesenovka	2095
25891	Ottuk	2095
25892	Semyonovka	2095
25893	Taldy-Suu	2095
25894	Teploklyuchenka	2095
25895	Tyup	2095
25896	Ala Buka	2096
25897	Bazarkurgon	2096
25898	Jalal-Abad	2096
25899	Jangybazar	2096
25900	Karavan	2096
25901	Kochkor-Ata	2096
25902	Kok-Jangak	2096
25903	Mailuu-Suu	2096
25904	Tash-Kumyr	2096
25905	At-Bashi	2097
25906	Chaiek	2097
25907	Kara-Suu	2097
25908	Kayirma	2097
25909	Kek-Algyp	2097
25910	Kochkorka	2097
25911	Kulanak	2097
25912	Mingbulok	2097
25913	Mingkush	2097
25914	Naryn	2097
25915	Ugyut	2097
25916	Daraut-Korgan	2098
25917	Gulcha	2098
25918	Kara-Suu	2098
25919	Leninskoye	2098
25920	Osh	2098
25921	Uzgen	2098
25922	Chat-Bazar	2099
25923	Groznoye	2099
25924	Kara-Kul	2099
25925	Klyuchevka	2099
25926	Kyzyl-Adyr	2099
25927	Leninopol	2099
25928	Maimak	2099
25929	Talas	2099
25930	Toktogul	2099
25931	Samakhixai	2100
25932	Huayxay	2101
25933	Pakxan	2102
25934	Champasak	2103
25935	Muang Khong	2103
25936	Muang Khongxedon	2103
25937	Pakxe	2103
25938	Xam Nua	2104
25939	Thakek	2105
25940	Ban Nahin	2108
25941	Phongsaly	2109
25942	Saravan	2110
25943	Savannakhet	2111
25944	Sekong	2112
25945	Xaignabury	2115
25946	Aizkraukle	2117
25947	Jaunjelgava	2117
25948	Plavinas	2117
25949	Aluksne	2118
25950	Ape	2118
25951	Balvi	2119
25952	Vilaka	2119
25953	Bauska	2120
25954	Cesis	2121
25955	Ligatne	2121
25956	Ilukste	2122
25957	Subate	2122
25958	Ilukste	2123
25959	Subate	2123
25960	Auce	2124
25961	Dobele	2124
25962	Gulbene	2125
25963	Akniste	2126
25964	Jekabspils	2126
25965	Viesite	2126
25966	Jelgava	2127
25967	Kalnciems	2128
25968	Dagda	2130
25969	Kraslava	2130
25970	Kuldiga	2131
25971	Skrunda	2131
25972	Liepaja	2132
25973	Aizpute	2133
25974	Durbe	2133
25975	Grobina	2133
25976	Pavilosta	2133
25977	Priekule	2133
25978	Ainazhi	2134
25979	Aloja	2134
25980	Limbazhi	2134
25981	Salacgriva	2134
25982	Staicele	2134
25983	Karsava	2135
25984	Ludza	2135
25985	Zilupe	2135
25986	Cesvaine	2136
25987	Lubana	2136
25988	Madona	2136
25989	Varaklani	2136
25990	Ikskile	2137
25991	Kegums	2137
25992	Les Hautes-Rivieres	2137
25993	Lielvarde	2137
25994	Ogre	2137
25995	Livani	2138
25996	Preili	2138
25997	Rezekne	2139
25998	Vilani	2140
25999	Riga	2141
26000	Baldone	2142
26001	Balozhi	2142
26002	Olaine	2142
26003	Salaspils	2142
26004	Saulkrasti	2142
26005	Sigulda	2142
26006	Vangazhi	2142
26007	Broceni	2143
26008	Saldus	2143
26009	Sabile	2144
26010	Stende	2144
26011	Talsi	2144
26012	Valdemarpils	2144
26013	Kandava	2145
26014	Tukums	2145
26015	Seda	2146
26016	Smiltene	2146
26017	Strenchi	2146
26018	Valka	2146
26019	Mazsalaca	2147
26020	Rujiena	2147
26021	Valmiera	2147
26022	Piltene	2148
26023	Piltene	2149
26024	Beirut	2150
26025	Jdeidet el Metn	2150
26026	Jnaah	2150
26027	Sidon	2154
26028	Balabakk	2155
26029	Jubb Jannin	2155
26030	Rashayya	2155
26031	Riyak	2155
26032	Zahlah	2155
26033	al-Hirmil	2155
26034	Jazzin	2156
26035	Juwayya	2156
26036	Sayda	2156
26037	Sur	2156
26038	Marj Uyun	2157
26039	Nabatieh	2157
26040	an-Nabatiyat-at-Tahta	2157
26041	Tarabulus ash-Sham	2158
26042	al-Batrun	2158
26043	Teyateyaneng	2159
26044	Butha Buthe	2160
26045	Hlotse	2161
26046	Maputsoa	2161
26047	Mafeteng	2162
26048	Maseru	2163
26049	Mokhotlong	2165
26050	Quthing	2167
26051	Thaba-Tseka	2168
26052	Tubmanburg	2169
26053	Gbarnga	2170
26054	Voinjama	2174
26055	Harbel	2175
26056	Kakata	2175
26057	Bensonville	2177
26058	Monrovia	2177
26059	Ganta	2178
26060	Sanniquellie	2178
26061	Yekepa	2178
26062	Rivercess	2179
26063	Greenville	2180
26064	Ajdabiya	2181
26065	Awjilah	2181
26066	Marsa al-Burayqah	2181
26067	az-Zuwaytinah	2181
26068	Awbari	2182
26069	Ghat	2182
26070	Banghazi	2183
26071	Suluq	2183
26072	al-Quriyah	2183
26073	Darnah	2184
26074	Ghadamis	2185
26075	Nalut	2185
26076	Gharyan	2186
26077	Mizdah	2186
26078	al-Qaryah-ash-Sharqiyah	2186
26079	Misratah	2187
26080	Murzuq	2188
26081	Sabha	2189
26082	Bani Walid	2190
26083	Surt	2191
26084	Tarabulus	2192
26085	Tripoli	2192
26086	Tarhunah	2193
26087	Misrata	2194
26088	Bardiyah	2195
26089	Tubruq	2195
26090	Yafran	2196
26091	Zlitan	2197
26092	al-Aziziyah	2198
26093	al-Abyar	2199
26094	al-Marj	2199
26095	Waddan	2201
26096	al-Khums	2202
26097	al-Jawf	2203
26098	Birak	2205
26099	az-Zawiyah	2206
26100	Balzers	2207
26101	Eschen	2208
26102	Gamprin	2209
26103	Mauren	2210
26104	Planken	2211
26105	Ruggell	2212
26106	Schaan	2213
26107	Schellenberg	2214
26108	Triesen	2215
26109	Triesenberg	2216
26110	Vaduz	2217
26111	Alytus	2218
26112	Daugai	2218
26113	Druskininkai	2218
26114	Lazdijai	2218
26115	Simnas	2218
26116	Varena	2218
26117	Veisiejai	2218
26118	Anyksciai	2219
26119	Ariogala	2220
26120	Birshtonas	2220
26121	Dotnuva	2220
26122	Ezherelis	2220
26123	Garliava	2220
26124	Jieznas	2220
26125	Jonava	2220
26126	Kachergine	2220
26127	Kaishiadorys	2220
26128	Kaunas	2220
26129	Kedainiai	2220
26130	Kulautuva	2220
26131	Prienai	2220
26132	Raseiniai	2220
26133	Vilkija	2220
26134	Zhiezhmariai	2220
26135	Gargzhdai	2221
26136	Klaipeda	2221
26137	Kretinga	2221
26138	Neringa	2221
26139	Pagegiai	2221
26140	Palanga	2221
26141	Panemune	2221
26142	Priekule	2221
26143	Rusne	2221
26144	Salantai	2221
26145	Shilute	2221
26146	Skuodas	2221
26147	Zhemaichiu Naumiestis	2221
26148	Gelgaudishkis	2222
26149	Kalvarija	2222
26150	Kazlu Ruda	2222
26151	Kudirkos Naumiestis	2222
26152	Kybartai	2222
26153	Marijampole	2222
26154	Shakiai	2222
26155	Vilkavishkis	2222
26156	Virbalis	2222
26157	Birzhai	2223
26158	Jonishkelis	2223
26159	Juodupe	2223
26160	Kupishkis	2223
26161	Obeliai	2223
26162	Pandelys	2223
26163	Panevezhys	2223
26164	Panevezio	2223
26165	Pasvalys	2223
26166	Ramygala	2223
26167	Rokishkis	2223
26168	Subachius	2223
26169	Vabalninkas	2223
26170	Panevezys	2224
26171	Akmene	2225
26172	Jonishkis	2225
26173	Kelme	2225
26174	Kurshenai	2225
26175	Linkuva	2225
26176	Naujoji Akmene	2225
26177	Pakruojis	2225
26178	Radvilishkis	2225
26179	Sheduva	2225
26180	Shiauliai	2225
26181	Siauliai	2225
26182	Tyruliai	2225
26183	Tytuvenai	2225
26184	Uzhventis	2225
26185	Venta	2225
26186	Viekshniai	2225
26187	Zhagare	2225
26188	Jurbarkas	2226
26189	Shilale	2226
26190	Skaudvile	2226
26191	Smalininkai	2226
26192	Taurage	2226
26193	Guglingen	2227
26194	Mazheikiai	2227
26195	Plunge	2227
26196	Rietavas	2227
26197	Seda	2227
26198	Telshiai	2227
26199	Varniai	2227
26200	Mazeikiai	2228
26201	Anykshchiai	2229
26202	Dukshtas	2229
26203	Dusetos	2229
26204	Ignalina	2229
26205	Kavarskas	2229
26206	Moletai	2229
26207	Troshkunai	2229
26208	Turmantas	2229
26209	Utena	2229
26210	Visaginas	2229
26211	Zarasai	2229
26212	Baltoji Voke	2230
26213	Eishishkes	2230
26214	Elektrenai	2230
26215	Grigishkes	2230
26216	Lentvaris	2230
26217	Nemenchine	2230
26218	Pabrade	2230
26219	Rudishkes	2230
26220	Shalchininkai	2230
26221	Shirvintos	2230
26222	Shvenchioneliai	2230
26223	Shvenchionys	2230
26224	Trakai	2230
26225	Ukmerge	2230
26226	Vievis	2230
26227	Vilnius	2230
26228	Bascharage	2231
26229	Bettange-sur-Mess	2231
26230	Bridel	2231
26231	Capellen	2231
26232	Clemency	2231
26233	Dahlem	2231
26234	Dippach	2231
26235	Dondelange	2231
26236	Eischen	2231
26237	Fingig	2231
26238	Garnich	2231
26239	Goeblange	2231
26240	Goetzingen	2231
26241	Grass	2231
26242	Greisch	2231
26243	Hagen	2231
26244	Hautcharage	2231
26245	Hivange	2231
26246	Hobscheid	2231
26247	Holzem	2231
26248	Kahler	2231
26249	Kehlen	2231
26250	Keispelt	2231
26251	Kleinbettingen	2231
26252	Koerich	2231
26253	Kospstal	2231
26254	Linger	2231
26255	Mamer	2231
26256	Meispelt	2231
26257	Nospelt	2231
26258	Olm	2231
26259	Roodt	2231
26260	Schouweiler	2231
26261	Septfontaines	2231
26262	Sprinkange	2231
26263	Steinfort	2231
26264	Allerborn	2232
26265	Asselborn	2232
26266	Basbellain	2232
26267	Beiler	2232
26268	Binsfeld	2232
26269	Biwisch	2232
26270	Bockholtz	2232
26271	Boevange	2232
26272	Boxhorn	2232
26273	Brachtenbach	2232
26274	Breidfeld	2232
26275	Cinqfontaines	2232
26276	Clervaux	2232
26277	Consthum	2232
26278	Crendal	2232
26279	Deiffelt-Lentzweiler	2232
26280	Derenbach	2232
26281	Doennange	2232
26282	Dorscheid	2232
26283	Drauffelt	2232
26284	Drinklange	2232
26285	Eisenbach	2232
26286	Eselborn	2232
26287	Fischbach	2232
26288	Goedange	2232
26289	Grindhausen	2232
26290	Hachiville	2232
26291	Hamiville	2232
26292	Hautbellain	2232
26293	Heinerscheid	2232
26294	Hoffelt	2232
26295	Holler	2232
26296	Holzthum	2232
26297	Hosingen	2232
26298	Huldange	2232
26299	Hupperdange	2232
26300	Kalborn	2232
26301	Leithum	2232
26302	Lieler	2232
26303	Lullange	2232
26304	Marnach	2232
26305	Maulusmuehle	2232
26306	Munshausen	2232
26307	Neidhausen	2232
26308	Niederwampach-Schimpach	2232
26309	Oberwampach	2232
26310	Reuler	2232
26311	Roder	2232
26312	Rodershausen	2232
26313	Rumlange-Lentzweiler	2232
26314	Sassel	2232
26315	Siebenaler	2232
26316	Stockem	2232
26317	Troine-Hinterhasselt	2232
26318	Troine-Route	2232
26319	Troisvierges	2232
26320	Urspelt	2232
26321	Wahlhausen	2232
26322	Weicherdange	2232
26323	Weiler	2232
26324	Weiswampach	2232
26325	Wilwerdange	2232
26326	Wincrange	2232
26327	Bastendorf	2233
26328	Bettendorf	2233
26329	Bigelbach	2233
26330	Bourscheid	2233
26331	Brandenbourg	2233
26332	Burden	2233
26333	Diekirch	2233
26334	Eppeldorf	2233
26335	Ermsdorf	2233
26336	Erpeldange	2233
26337	Ettelbruck	2233
26338	Folkendange	2233
26339	Gilsdorf	2233
26340	Hoesdorf	2233
26341	Hoscheid	2233
26342	Hoscheid-Dickt	2233
26343	Ingeldorf	2233
26344	Kehmen-Scheidel	2233
26345	Landscheid	2233
26346	Lipperscheid	2233
26347	Medernach	2233
26348	Mertzig	2233
26349	Michelau	2233
26350	Moestroff	2233
26351	Niederfeulen	2233
26352	Oberfeulen	2233
26353	Reisdorf	2233
26354	Savelborn + Fermes	2233
26355	Schieren	2233
26356	Schlindermanderscheid	2233
26357	Stegen	2233
26358	Tandel	2233
26359	Wallendorf	2233
26360	Warken	2233
26361	Welscheid	2233
26362	Altrier	2234
26363	Beaufort	2234
26364	Bech	2234
26365	Berdorf	2234
26366	Bollendorf-Pont	2234
26367	Born	2234
26368	Boursdorf	2234
26369	Breidweiler	2234
26370	Christnach	2234
26371	Consdorf	2234
26372	Dickweiler	2234
26373	Dillingen	2234
26374	Echternach	2234
26375	Girst	2234
26376	Girsterklaus	2234
26377	Givenich	2234
26378	Grundhof	2234
26379	Haller	2234
26380	Hemstal	2234
26381	Herborn	2234
26382	Hersberg-Kobenbour-Graulinster	2234
26383	Hinkel	2234
26384	Moersdorf	2234
26385	Mompach	2234
26386	Mullerthal	2234
26387	Osweiler	2234
26388	Rippig	2234
26389	Rosport	2234
26390	Scheidgen	2234
26391	Steinheim	2234
26392	Waldbillig	2234
26393	Weilerbach	2234
26394	Zittig	2234
26395	Abweiler	2235
26396	Aspelt	2235
26397	Belvaux	2235
26398	Berchem	2235
26399	Bergem	2235
26400	Bettembourg	2235
26401	Bivange	2235
26402	Crauthem	2235
26403	Differdange	2235
26404	Dudelange	2235
26405	Ehlange	2235
26406	Ehlerange	2235
26407	Esch-Alzette	2235
26408	Fennange	2235
26409	Foetz	2235
26410	Fousbann	2235
26411	Frisange	2235
26412	Hellange	2235
26413	Huncherange	2235
26414	Kayl	2235
26415	Kockelscheuer	2235
26416	Lamadelaine	2235
26417	Lasauvage	2235
26418	Leudelange	2235
26419	Limpach	2235
26420	Livange	2235
26421	Mondercange	2235
26422	Niedercorn	2235
26423	Noertzange	2235
26424	Obercorn	2235
26425	Peppange	2235
26426	Petange	2235
26427	Pissange	2235
26428	Pontpierre	2235
26429	Reckange-sur-Mess	2235
26430	Rodange	2235
26431	Roedgen	2235
26432	Roeser	2235
26433	Rumelange	2235
26434	Sanem	2235
26435	Schifflange	2235
26436	Soleuvre	2235
26437	Tetange	2235
26438	Wickrange	2235
26439	Ahn-Dreiborn	2236
26440	Altlinster	2236
26441	Beidweiler	2236
26442	Berbourg	2236
26443	Berg	2236
26444	Betzdorf	2236
26445	Beyren	2236
26446	Biwer	2236
26447	Biwerbach	2236
26448	Boudler	2236
26449	Boudlerbach	2236
26450	Bourglinster	2236
26451	Breinert	2236
26452	Brouch	2236
26453	Ehnen	2236
26454	Eisenborn	2236
26455	Eschweiler	2236
26456	Flaxweiler	2236
26457	Godbrange	2236
26458	Gonderange	2236
26459	Gostingen	2236
26460	Graulinster-Blumenthal	2236
26461	Grevenmacher	2236
26462	Hagelsdorf	2236
26463	Imbringen	2236
26464	Junglinster	2236
26465	Lellig	2236
26466	Machtum	2236
26467	Manternach	2236
26468	Mensdorf	2236
26469	Mertert	2236
26470	Munschecker	2236
26471	Niederdonven	2236
26472	Oberdonven	2236
26473	Olingen	2236
26474	Rodenbourg	2236
26475	Roodt-sur-Syr	2236
26476	Wasserbillig	2236
26477	Wecker	2236
26478	Wecker-Gare	2236
26479	Weydig	2236
26480	Wormeldange	2236
26481	Wormeldange-Haut	2236
26482	Alzingen	2237
26483	Bereldange	2237
26484	Bertrange	2237
26485	Contern	2237
26486	Ernster	2237
26487	Fentange	2237
26488	Findel	2237
26489	Hassel	2237
26490	Heisdorf	2237
26491	Helmsange	2237
26492	Hesperange	2237
26493	Hostert	2237
26494	Howald	2237
26495	Itzig	2237
26496	Luxembourg	2237
26497	Medingen	2237
26498	Moutfort	2237
26499	Mullendorf	2237
26500	Munsbach	2237
26501	Neuhaeusgen	2237
26502	Niederanven	2237
26503	Oberanven	2237
26504	Oetrange	2237
26505	Rameldange	2237
26506	Sandweiler	2237
26507	Schrassig	2237
26508	Schuttrange	2237
26509	Senningen	2237
26510	Senningerberg	2237
26511	Steinsel	2237
26512	Strassen	2237
26513	Syren	2237
26514	Uebersyren	2237
26515	Waldhof	2237
26516	Walferdange	2237
26517	Weiler-la-Tour	2237
26518	Angelsberg	2238
26519	Ansembourg	2238
26520	Beringen	2238
26521	Bissen	2238
26522	Blaschette	2238
26523	Boevange-Attert	2238
26524	Bofferdange	2238
26525	Bour	2238
26526	Brouch	2238
26527	Buschdorf	2238
26528	Colmar-Berg	2238
26529	Cruchten	2238
26530	Ernzen	2238
26531	Essingen	2238
26532	Fischbach	2238
26533	Glabach	2238
26534	Gosseldange	2238
26535	Grevenknapp-Bill-Finsterthal	2238
26536	Heffingen	2238
26537	Helmdange	2238
26538	Hollenfels	2238
26539	Hunsdorf	2238
26540	Larochette	2238
26541	Lintgen	2238
26542	Lorentzweiler	2238
26543	Marienthal	2238
26544	Mersch	2238
26545	Moesdorf	2238
26546	Nommern	2238
26547	Pettingen	2238
26548	Prettange	2238
26549	Reckange	2238
26550	Reuland	2238
26551	Rollingen	2238
26552	Scherbach	2238
26553	Scherfenhof	2238
26554	Schiltzberg	2238
26555	Schoenfels	2238
26556	Schoos	2238
26557	Schrondweiler	2238
26558	Tuntange	2238
26559	Arsdorf	2239
26560	Beckerich	2239
26561	Bettborn	2239
26562	Bigonville	2239
26563	Bilsdorf	2239
26564	Brattert-Rindschleiden	2239
26565	Buschrodt	2239
26566	Calmus	2239
26567	Colpach-Bas	2239
26568	Colpach-Haut	2239
26569	Dellen-Lehrhof-Grevels	2239
26570	Ehner	2239
26571	Ell	2239
26572	Eltz	2239
26573	Elvange	2239
26574	Eschette	2239
26575	Everlange	2239
26576	Folschette	2239
26577	Grevels	2239
26578	Grosbous	2239
26579	Haut-Martelange	2239
26580	Heispelt	2239
26581	Holtz	2239
26582	Hostert	2239
26583	Hovelange	2239
26584	Huttange	2239
26585	Kapweiler	2239
26586	Koetschette	2239
26587	Kuborn	2239
26588	Lannen	2239
26589	Levelange	2239
26590	Michelbouch	2239
26591	Nagem	2239
26592	Niederpallen	2239
26593	Noerdange	2239
26594	Oberpallen	2239
26595	Ospern	2239
26596	Perle	2239
26597	Petit-Nobressart	2239
26598	Platen	2239
26599	Pratz	2239
26600	Rambrouch	2239
26601	Redange	2239
26602	Reichlange	2239
26603	Reimberg	2239
26604	Rippweiler	2239
26605	Rombach	2239
26606	Roodt	2239
26607	Saeul	2239
26608	Schandel	2239
26609	Schwebach	2239
26610	Schweich	2239
26611	Useldange	2239
26612	Vichten	2239
26613	Wahl	2239
26614	Wolwelange	2239
26615	Altwies	2240
26616	Assel	2240
26617	Bech-Kleinmacher	2240
26618	Bous	2240
26619	Burmerange	2240
26620	Canach	2240
26621	Dalheim	2240
26622	Ellange	2240
26623	Elvange	2240
26624	Emerange	2240
26625	Erpeldange	2240
26626	Filsdorf	2240
26627	Greiveldange	2240
26628	Lenningen	2240
26629	Mondorf-les-Bains	2240
26630	Remerschen	2240
26631	Remich	2240
26632	Rolling	2240
26633	Schengen	2240
26634	Schwebsingen	2240
26635	Stadtbredimus	2240
26636	Trintange	2240
26637	Trintange-Ersange-Roedt	2240
26638	Waldbredimus	2240
26639	Welfrange	2240
26640	Wellenstein	2240
26641	Wintrange	2240
26642	Bettel	2241
26643	Bivels	2241
26644	Fouhren	2241
26645	Gralingen	2241
26646	Longsdorf	2241
26647	Merscheid	2241
26648	Nachtmanderscheid	2241
26649	Putscheid	2241
26650	Stolzembourg	2241
26651	Vianden	2241
26652	Walsdorf	2241
26653	Weiler	2241
26654	Alscheid	2242
26655	Baschleiden	2242
26656	Bavigne	2242
26657	Berle	2242
26658	Bockholtz	2242
26659	Boulaide	2242
26660	Buderscheid	2242
26661	Dahl	2242
26662	Doncols	2242
26663	Enscherange	2242
26664	Erpeldange	2242
26665	Esch-sur-Sure	2242
26666	Eschdorf	2242
26667	Eschweiler	2242
26668	Goesdorf	2242
26669	Grumelscheid	2242
26670	Harlange	2242
26671	Heiderscheid	2242
26672	Heiderscheid-Fond	2242
26673	Hierheck	2242
26674	Insenborn	2242
26675	Kaundorf	2242
26676	Kautenbach	2242
26677	Knaphoscheid	2242
26678	Lellingen	2242
26679	Liefrange	2242
26680	Lultzhausen	2242
26681	Masseler	2242
26682	Mecher	2242
26683	Merckholtz	2242
26684	Merscheid	2242
26685	Neunhausen	2242
26686	Nocher	2242
26687	Nocher-Route	2242
26688	Noertrange	2242
26689	Nothum	2242
26690	Pintsch	2242
26691	Pommerloch	2242
26692	Schleif	2242
26693	Selscheid	2242
26694	Sonlez	2242
26695	Surre	2242
26696	Tadler-Ringel-Dirbach	2242
26697	Tarchamps	2242
26698	Watrange	2242
26699	Wiltz	2242
26700	Wilwerwiltz	2242
26701	Winseler	2242
26702	Macau	2243
26703	Berovo	2244
26704	Pehchevo	2244
26705	Bach	2245
26706	Bistrica	2245
26707	Bitola	2245
26708	Capari	2245
26709	Dobrushevo	2245
26710	Kukurechani	2245
26711	Mogila	2245
26712	Novaci	2245
26713	Staravina	2245
26714	Brod	2246
26715	Plasnica	2246
26716	Samokov	2246
26717	Debar	2247
26718	Zhupa	2247
26719	Delchevo	2248
26720	Kamenica	2248
26721	Bogdanci	2250
26722	Gevgelija	2250
26723	Miravci	2250
26724	Star Dojran	2250
26725	Chegrane	2251
26726	Dolna Banjica	2251
26727	Gostivar	2251
26728	Mavrovi Anovi	2251
26729	Negotino-Poloshko	2251
26730	Rostusha	2251
26731	Srbinovo	2251
26732	Vrapchishte	2251
26733	Vrutok	2251
26734	Kavadarci	2252
26735	Konopishte	2252
26736	Rosoman	2252
26737	Drugovo	2253
26738	Kichevo	2253
26739	Oslomej	2253
26740	Vraneshtica	2253
26741	Zajas	2253
26742	Cheshinovo	2254
26743	Kochani	2254
26744	Obleshevo	2254
26745	Zletovo	2254
26746	Kratovo	2255
26747	Krushevo	2257
26748	Zhitoshe	2257
26749	Izvor	2258
26750	Klechevce	2258
26751	Kumanovo	2258
26752	Lipkovo	2258
26753	Orashac	2258
26754	Staro Nagorichane	2258
26755	Demir Kapija	2259
26756	Negotino	2259
26757	Belchishta	2260
26758	Kosel	2260
26759	Mesheishta	2260
26760	Ohrid	2260
26761	Dolneni	2261
26762	Krivogashtani	2261
26763	Prilep	2261
26764	Topolchani	2261
26765	Vitolishte	2261
26766	Probishtip	2262
26767	Konche	2263
26768	Podaresh	2263
26769	Radovish	2263
26770	Resen	2264
26771	Karbinci	2265
26772	Shtip	2265
26773	Stip	2265
26774	Arachinovo	2266
26775	Chucher	2266
26776	Ilinden	2266
26777	Kondovo	2266
26778	Petrovec	2266
26779	Saraj	2266
26780	Skopje	2266
26781	Sopishte	2266
26782	Studenichani	2266
26783	Zelenikovo	2266
26784	Delogozhdi	2267
26785	Labunishta	2267
26786	Lukovo	2267
26787	Struga	2267
26788	Veleshta	2267
26789	Vevchani	2267
26790	Bosilovo	2268
26791	Kuklish	2268
26792	Murtino	2268
26793	Novo Selo	2268
26794	Strumica	2268
26795	Vasilevo	2268
26796	Bogovinje	2270
26797	Brvenica	2270
26798	Dzhepchishte	2270
26799	Jegunovce	2270
26800	Kamenjance	2270
26801	Shipkovica	2270
26802	Tearce	2270
26803	Tetovo	2270
26804	Vratnica	2270
26805	Zhelino	2270
26806	Valandovo	2271
26807	Bogomila	2272
26808	Chashka	2272
26809	Gradsko	2272
26810	Veles	2272
26811	Blatec	2273
26812	Orizari	2273
26813	Vinica	2273
26814	Zrnovci	2273
26815	Ambatolampy	2274
26816	Anjozorobe	2274
26817	Ankazobe	2274
26818	Antananarivo	2274
26819	Antanifotsy	2274
26820	Antsirabe	2274
26821	Arivonimamo	2274
26822	Betafo	2274
26823	Faratsiho	2274
26824	Fenoarivo	2274
26825	Manjakandriana	2274
26826	Soavinandriana	2274
26827	Tsiroanomandidy	2274
26828	Ambanja	2275
26829	Ambilobe	2275
26830	Andapa	2275
26831	Antalaha	2275
26832	Antsirambazaha	2275
26833	Antsiranana	2275
26834	Sambava	2275
26835	Ambalavao	2276
26836	Ambatofinandrahana	2276
26837	Ambositra	2276
26838	Fandriana	2276
26839	Farafangana	2276
26840	Fianarantsoa	2276
26841	Ifanadiana	2276
26842	Ihosy	2276
26843	Ikalamavony	2276
26844	Ikongo	2276
26845	Manakara	2276
26846	Manandriana	2276
26847	Mananjary	2276
26848	Nosy Varika	2276
26849	Vangaindrano	2276
26850	Vondrozo	2276
26851	Ambato Boina	2277
26852	Antsohihy	2277
26853	Bealanana	2277
26854	Mahajanga	2277
26855	Marovoay	2277
26856	Tsaratanana	2277
26857	Ambatondrazaka	2278
26858	Ambodifototra	2278
26859	Amparafaravola	2278
26860	Andevoranto	2278
26861	Andilamena	2278
26862	Anosibe Anala	2278
26863	Fenoarivo Atsinanana	2278
26864	Mahanoro	2278
26865	Mananara	2278
26866	Maroantsetra	2278
26867	Marolambo	2278
26868	Moramanga	2278
26869	Soanierana Ivongo	2278
26870	Toamasina	2278
26871	Vavatenina	2278
26872	Vohibinany	2278
26873	Amboasary	2279
26874	Ambovombe	2279
26875	Ampanihy	2279
26876	Ankazoabo	2279
26877	Beloha	2279
26878	Beloni Tsiribihina	2279
26879	Beroroha	2279
26880	Betioky	2279
26881	Miandrivazo	2279
26882	Morondava	2279
26883	Sakaraha	2279
26884	Taolanaro	2279
26885	Toliary	2279
26886	Tsihombe	2279
26887	Balaka	2280
26888	Chikwawa	2282
26889	Chiradzulu	2283
26890	Chitipa	2284
26891	Chipoka	2285
26892	Dedza	2285
26893	Dowa	2286
26894	Mponela	2286
26895	Chilumba	2287
26896	Karonga	2287
26897	Livingstonia	2287
26898	Kasungu	2288
26899	Liwonde	2290
26900	Machinga	2290
26901	Mangochi	2291
26902	Monkey Bay	2291
26903	Mchinji	2292
26904	Mulanje	2293
26905	Mwanza	2294
26906	Mzimba	2295
26907	Nkhotakota	2298
26908	Nsanje	2299
26909	Ntcheu	2300
26910	Ntchisi	2301
26911	Phalombe	2302
26912	Rumphi	2303
26913	Salima	2304
26914	Luchenza	2305
26915	Thyolo	2305
26916	Bandar Maharani	2307
26917	Bandar Penggaram	2307
26918	Bukit Bakri	2307
26919	Buloh Kasap	2307
26920	Chaah	2307
26921	Johor Bahru	2307
26922	Kelapa Sawit	2307
26923	Kluang	2307
26924	Kota Tinggi	2307
26925	Kulai	2307
26926	Labis	2307
26927	Ledang	2307
26928	Masai	2307
26929	Mersing	2307
26930	Parit Raja	2307
26931	Pasir Gudang	2307
26932	Pekan Nenas	2307
26933	Pontian Kecil	2307
26934	Segamat	2307
26935	Sekudai	2307
26936	Senai	2307
26937	Simpang Rengam	2307
26938	Tangkak	2307
26939	Ulu Tiram	2307
26940	Yong Peng	2307
26941	Alor Setar	2308
26942	Bailing	2308
26943	Bedong	2308
26944	Gurun	2308
26945	Jitra	2308
26946	Kuah	2308
26947	Kuala Kedah	2308
26948	Kulim	2308
26949	Langgar	2308
26950	Sungai Petani	2308
26951	Gua Musang	2309
26952	Kadok	2309
26953	Kota Bahru	2309
26954	Kuala Krai	2309
26955	Pangkal Kalong	2309
26956	Pasir Mas	2309
26957	Peringat	2309
26958	Tanah Merah	2309
26959	Tumpat	2309
26960	Wakaf Baru	2309
26961	Labuan	2311
26962	Alor Gajah	2312
26963	Ayer Keroh	2312
26964	Ayer Molek	2312
26965	Batu Berendam	2312
26966	Bemban	2312
26967	Bukit Baru	2312
26968	Bukit Rambai	2312
26969	Klebang	2312
26970	Kuala Sungai Baru	2312
26971	Malacca	2312
26972	Masjid Tanah	2312
26973	Melaka	2312
26974	Pulau Sebang	2312
26975	Sungai Udang	2312
26976	Bandar Jengka Pusat	2315
26977	Bentong	2315
26978	Bukit Tinggi	2315
26979	Jerantut	2315
26980	Karak	2315
26981	Kuala Lipis	2315
26982	Kuantan	2315
26983	Mentakab	2315
26984	Pekan	2315
26985	Pulau Pinang	2315
26986	Raub	2315
26987	Temerloh	2315
26988	Bayan Lepas	2316
26989	Church Town	2316
26990	George Town	2316
26991	Ayer Tawar	2317
26992	Bagan Serai	2317
26993	Batu Gajah	2317
26994	Bidor	2317
26995	Ipoh	2317
26996	Jelapang	2317
26997	Kampar	2317
26998	Kampong Koh	2317
26999	Kuala Kangsar	2317
27000	Lawan Kuda Baharu	2317
27001	Lumut	2317
27002	Pantai Remis	2317
27003	Parit Buntar	2317
27004	Perak	2317
27005	Pusing	2317
27006	Simpang Empat	2317
27007	Sungai Siput Utara	2317
27008	Taiping	2317
27009	Tanjong Malim	2317
27010	Tapah	2317
27011	Teluk Intan	2317
27012	Kangar	2318
27013	Kuala Perlis	2318
27014	Beaufort	2320
27015	Donggongon	2320
27016	Keningau	2320
27017	Kinarut	2320
27018	Kota Belud	2320
27019	Kota Kinabalu	2320
27020	Kudat	2320
27021	Kunak	2320
27022	Lahad Datu	2320
27023	Papar	2320
27024	Putatan	2320
27025	Ranau	2320
27026	Sandakan	2320
27027	Semporna	2320
27028	Tawau	2320
27029	Batu Delapan Bazaar	2321
27030	Bintulu	2321
27031	Kapit	2321
27032	Kota Samarahan	2321
27033	Kuching	2321
27034	Limbang	2321
27035	Miri	2321
27036	Sarawak	2321
27037	Sarikel	2321
27038	Sibu	2321
27039	Sri Aman	2321
27040	Ampang	2322
27041	Ampang Jaya	2322
27042	Balakong	2322
27043	Bandar Baru Bangi	2322
27044	Bandar Baru Salak Tinggi	2322
27045	Bander Baro Bangi	2322
27046	Banting	2322
27047	Batang Berjuntai	2322
27048	Batu Arang	2322
27049	Batu Sembilan Cheras	2322
27050	Beranang	2322
27051	Bukit Beruntung	2322
27052	Cyberjaya	2322
27053	Darul Ehsan	2322
27054	Dungun	2322
27055	Gombak Setia	2322
27056	Jenjarom	2322
27057	Kajang	2322
27058	Kajang-Sungai Chua	2322
27059	Klang	2322
27060	Kuala Kubu Baru	2322
27061	Kuala Selangor	2322
27062	Kuang	2322
27063	Pengkalan Kundang	2322
27064	Petaling Jaya	2322
27065	Port Klang	2322
27066	Puchong	2322
27067	Rawang	2322
27068	Sabak	2322
27069	Sekinchan	2322
27070	Selayang Baru	2322
27071	Semenyih	2322
27072	Serendah	2322
27073	Seri Kembangan	2322
27074	Shah Alam	2322
27075	Subang Jaya	2322
27076	Sungai Besar	2322
27077	Sungai Buloh	2322
27078	Sungai Pelek	2322
27079	Taman Greenwood	2322
27080	Tanjong Karang	2322
27081	Tanjong Sepat	2322
27082	Bahaiyah	2323
27083	Langkap	2323
27084	Cukai	2324
27085	Jertih	2324
27086	Kemaman	2324
27087	Kerteh	2324
27088	Kuala Terengganu	2324
27089	Marang	2324
27090	Paka	2324
27091	Serdang	2324
27092	Dharavandhoo	2327
27093	Dhonfanu	2327
27094	Eydhafushi	2327
27095	Fehendhoo	2327
27096	Fulhadhoo	2327
27097	Goidhoo	2327
27098	Hithaadhoo	2327
27099	Kamadhoo	2327
27100	Kendhoo	2327
27101	Kihaadhoo	2327
27102	Kudarikilu	2327
27103	Maalhos	2327
27104	Thulhaadhoo	2327
27105	Badidhoo	2328
27106	Gemendhoo	2328
27107	Hulhudheli	2328
27108	Kudahuvadhoo	2328
27109	Maaeboodhoo	2328
27110	Meedhoo	2328
27111	Ribudhoo	2328
27112	Vaanee	2328
27113	Biledhdhoo	2329
27114	Dharaboodhoo	2329
27115	Feeali	2329
27116	Magoodhoo	2329
27117	Nilandhoo	2329
27118	Fuvammulah	2332
27119	Dhiffushi	2335
27120	Gaafaru	2335
27121	Gulhi	2335
27122	Guraidhoo	2335
27123	Himmafushi	2335
27124	Huraa	2335
27125	Kaashidhoo	2335
27126	Maafushi	2335
27127	Thulusdhoo	2335
27128	Dhabidhoo	2336
27129	Fonadhoo	2336
27130	Gaadhoo	2336
27131	Gamu	2336
27132	Hithadhoo	2336
27133	Isdhoo	2336
27134	Kalhaidhoo	2336
27135	Kunahandhoo	2336
27136	Maabaidhoo	2336
27137	Maamendhoo	2336
27138	Maavah	2336
27139	Mundhoo	2336
27140	Hinnavaru	2337
27141	Kurendhoo	2337
27142	Maafilaafushi	2337
27143	Naifaru	2337
27144	Olhuvelifushi	2337
27145	Dhiggaru	2339
27146	Kolhufushi	2339
27147	Madifushi	2339
27148	Maduvvari	2339
27149	Mulah	2339
27150	Muli	2339
27151	Naalaafushi	2339
27152	Raimandhoo	2339
27153	Veyvah	2339
27154	Fodhdhoo	2340
27155	Hebadhoo	2340
27156	Holhudhoo	2340
27157	Kedhikolhudhoo	2340
27158	Kudafari	2340
27159	Landhoo	2340
27160	Lhohi	2340
27161	Maafaru	2340
27162	Maalhendhoo	2340
27163	Magoodhoo	2340
27164	Manadhoo	2340
27165	Miladhoo	2340
27166	Velidhoo	2340
27167	Agolhitheemu	2341
27168	Alifushi	2341
27169	Fainu	2341
27170	Hulhudhuffaaru	2341
27171	Iguraidhoo	2341
27172	Innamaadhoo	2341
27173	Kadholhudhoo	2341
27174	Kinolhas	2341
27175	Maakurathu	2341
27176	Maduvvari	2341
27177	Meedhoo	2341
27178	Rasgetheemu	2341
27179	Rasmaadhoo	2341
27180	Ugoofaaru	2341
27181	Vaadhoo	2341
27182	Bilehffahi	2342
27183	Feevah	2342
27184	Feydhoo	2342
27185	Firubaidhoo	2342
27186	Foakaidhoo	2342
27187	Funadhoo	2342
27188	Goidhoo	2342
27189	Kaditheemu	2342
27190	Komandoo	2342
27191	Lhaimagu	2342
27192	Maakandoodhoo	2342
27193	Maaugoodhoo	2342
27194	Maroshi	2342
27195	Narudhoo	2342
27196	Noomaraa	2342
27197	Feydhoo	2343
27198	Hithadhoo	2343
27199	Hulhudhoo	2343
27200	Maradhoo	2343
27201	Maradhoo-Feydhoo	2343
27202	Meedhoo	2343
27203	Buruni	2344
27204	Dhiyamigili	2344
27205	Gaadhiffushi	2344
27206	Guraidhoo	2344
27207	Hirilandhoo	2344
27208	Kadoodhoo	2344
27209	Kibidhoo	2344
27210	Madifushi	2344
27211	Omadhoo	2344
27212	Thimarafushi	2344
27213	Vandhoo	2344
27214	Veymandhoo	2344
27215	Vilufushi	2344
27216	Felidhoo	2345
27217	Fulidhoo	2345
27218	Keyodhoo	2345
27219	Rakeedhoo	2345
27220	Thinadhoo	2345
27221	Bamako	2346
27222	Gao	2347
27223	Bafoulabe	2348
27224	Kayes	2348
27225	Kita	2348
27226	Nioro	2348
27227	Kidal	2349
27228	Tessalit	2349
27229	Banamba	2350
27230	Kangaba	2350
27231	Kati	2350
27232	Kolokani	2350
27233	Koulikoro	2350
27234	Nara	2350
27235	Bandiagara	2351
27236	Djenne	2351
27237	Douentza	2351
27238	Koro	2351
27239	Mopti	2351
27240	Tenenkou	2351
27241	Ke-Massina	2352
27242	Kimparana	2352
27243	Markala	2352
27244	Niono	2352
27245	San	2352
27246	Segou	2352
27247	Sokolo	2352
27248	Bougouni	2353
27249	Kolondieba	2353
27250	Koutiala	2353
27251	Sikasso	2353
27252	Yorosso	2353
27253	Araouane	2354
27254	Dire	2354
27255	Goundam	2354
27256	Niafunke	2354
27257	Taoudenni	2354
27258	Tombouctou	2354
27259	Gharghur	2357
27260	Mellieha	2357
27261	Mgarr	2357
27262	Mosta	2357
27263	Naxxar	2357
27264	San Pawl il-Bahar	2357
27265	L-Iklin	2360
27266	Attard	2361
27267	Balzan	2361
27268	Dingli	2361
27269	Iklin	2361
27270	Lija	2361
27271	Mdina	2361
27272	Rabat	2361
27273	Sighghiewi	2361
27274	Zebbug	2361
27275	Castletown	2362
27276	Douglas	2363
27277	Laxey	2364
27278	Onchan	2365
27279	Peel	2366
27280	Ramsey	2369
27281	Aerok	2370
27282	Beran	2370
27283	Bikeer	2370
27284	Buoj	2370
27285	Enewe	2370
27286	Jabwan	2370
27287	Jah	2370
27288	Jeh	2370
27289	Kattiej	2370
27290	Mejajok	2370
27291	Mejil	2370
27292	Tobomaro	2370
27293	Woja	2370
27294	Wolar	2370
27295	Ailuk	2371
27296	Ajelep	2371
27297	Aliej	2371
27298	Biken	2371
27299	Enejabrok	2371
27300	Enejelar	2371
27301	Kapen	2371
27302	Arno Arno	2372
27303	Bikarej	2372
27304	Bikonele	2372
27305	Boken	2372
27306	Eneaidrik	2372
27307	Enirik	2372
27308	Ijoen	2372
27309	Ine	2372
27310	Japo	2372
27311	Jilane	2372
27312	Kejbwe	2372
27313	Kilange	2372
27314	Kilemman	2372
27315	Kinajon	2372
27316	Langor	2372
27317	Lukoj	2372
27318	Malel	2372
27319	Manrar	2372
27320	Matolen	2372
27321	Meetdik	2372
27322	Mian	2372
27323	Najaj	2372
27324	Namwi	2372
27325	Neenkotkot	2372
27326	Taklep	2372
27327	Tinak	2372
27328	Tutu	2372
27329	Ulien	2372
27330	Aur	2373
27331	Tabal	2373
27332	Eneu	2374
27333	Emej	2375
27334	Enearmij	2375
27335	Enekoion	2375
27336	Enilok	2375
27337	Jittaken	2375
27338	Jittoen	2375
27339	Rerok	2375
27340	Toka	2375
27341	Enewetak	2376
27342	Japtan	2376
27343	Medren	2376
27344	Jabat	2377
27345	Ae	2378
27346	Ajejen	2378
27347	Anilep	2378
27348	Arreen	2378
27349	Bokanake	2378
27350	Bokkan	2378
27351	Bukantorak	2378
27352	Dede	2378
27353	Ewo	2378
27354	Imiej	2378
27355	Imroj	2378
27356	Jabnoren	2378
27357	Jabwor	2378
27358	Jaluit	2378
27359	Lonone	2378
27360	Mejatto	2378
27361	Mejrirok	2378
27362	Menge	2378
27363	Nabbe	2378
27364	Narmej	2378
27365	Urbaj	2378
27366	Kili	2379
27367	Arbwa	2380
27368	Ebadon	2380
27369	Ebeye	2380
27370	Ebjadik	2380
27371	Ebwaj	2380
27372	Ennilabegan	2380
27373	Enubirr	2380
27374	Enubuj	2380
27375	Gugeegue	2380
27376	Mejatto	2380
27377	Ningi	2380
27378	North Loi	2380
27379	Orpap	2380
27380	South Loi	2380
27381	Enerein	2381
27382	Lae	2381
27383	Lejab	2381
27384	Lib	2382
27385	Jebal	2383
27386	Likiep	2383
27387	Liklal	2383
27388	Melang	2383
27389	Ajeltake	2384
27390	Aneenwudej	2384
27391	Aneko	2384
27392	Arrak	2384
27393	Biken	2384
27394	Bokaetoktok	2384
27395	Denmeo	2384
27396	Didej	2384
27397	Ejit	2384
27398	Enemanet	2384
27399	Jelter	2384
27400	Kalalen	2384
27401	Kemman	2384
27402	Laura	2384
27403	Pikiriin	2384
27404	Rita	2384
27405	Rongrong	2384
27406	Woja	2384
27407	Airok	2385
27408	Jang	2385
27409	Kaben	2385
27410	Tarawa	2385
27411	Wolot	2385
27412	Mejit	2386
27413	Aeloneo	2387
27414	Anel	2387
27415	Arbar	2387
27416	Bar	2387
27417	Bikonel	2387
27418	Enajet	2387
27419	Eoo	2387
27420	Jabonwod	2387
27421	Loen	2387
27422	Lukoj	2387
27423	Lukonwor	2387
27424	Mae	2387
27425	Majkin	2387
27426	Mili	2387
27427	Nad	2387
27428	Nallu	2387
27429	Tokewa	2387
27430	Wau	2387
27431	Namorik	2388
27432	Namu	2389
27433	Rongelap	2390
27434	Ujae	2391
27435	Utirik	2392
27436	Wotho	2393
27437	Didi	2394
27438	Nibun	2394
27439	Wormej	2394
27440	Wotje	2394
27441	Fort-de-France	2395
27442	Le Lamentin	2395
27443	Saint-Joseph	2395
27444	Schoelcher	2395
27445	Le Morne-Rouge	2398
27446	Saint-Pierre	2398
27447	Atar	2399
27448	Shingati	2399
27449	Kifah	2400
27450	Alaq	2401
27451	Buqah	2401
27452	Magta Lahjar	2401
27453	Ayun-al-Atrus	2403
27454	Kubanni	2403
27455	Timbedra	2404
27456	Walatah	2404
27457	an-Namah	2404
27458	Aqjawajat	2405
27459	Nawakshut	2406
27460	Hsay Walad Ali Babi	2407
27461	Kayhaydi	2408
27462	Tijiqjah	2409
27463	Rusu	2411
27464	Bel Air	2414
27465	Bon Accueil	2414
27466	Brisee Verdiere	2414
27467	Camp Ithier	2414
27468	Camp de Masque	2414
27469	Camp de Masque Pave	2414
27470	Central Flacq	2414
27471	Clemencia	2414
27472	Ecroignard	2414
27473	Grand River South East	2414
27474	Lalmatie	2414
27475	Laventure	2414
27476	Mare La Chaux	2414
27477	Medine-Camp de Masque	2414
27478	Olivia	2414
27479	Poste de Flacq	2414
27480	Quatre Cocos	2414
27481	Quatre Soeurs	2414
27482	Queen Victoria	2414
27483	Saint Julien	2414
27484	Saint Julien dHotman	2414
27485	Sebastopol	2414
27486	Trou dEau Douce	2414
27487	Floreal	2415
27488	Camp Thorel	2417
27489	Dagotiere	2417
27490	Dubreuil	2417
27491	Esperance	2417
27492	LAvenir	2417
27493	La Laura-Malenga	2417
27494	Melrose	2417
27495	Moka	2417
27496	Montagne Blanche	2417
27497	Pailles	2417
27498	Providence	2417
27499	Quartier Militaire	2417
27500	Ripailles	2417
27501	Saint Pierre	2417
27502	Verdun	2417
27503	Arsenal	2418
27504	Baie du Tombeau	2418
27505	Calebasses	2418
27506	Congomah	2418
27507	Creve Coeur	2418
27508	DEpinay	2418
27509	Fond du Sac	2418
27510	La Tour Koenig	2418
27511	Le Hochet	2418
27512	Long Mountain	2418
27513	Morcellement Saint Andre	2418
27514	Notre Dame	2418
27515	Pamplemousse	2418
27516	Plaines des Papayes	2418
27517	Pointe aux Piments	2418
27518	Terre Rouge	2418
27519	Triolet	2418
27520	Villebague	2418
27521	Baie Malgache	2422
27522	Coromandel-Graviers	2422
27523	Grand Baie-Montagne Goyaves	2422
27524	La Ferme	2422
27525	Lataniers-Mont Lubin	2422
27526	Mangues-Quatre Vents	2422
27527	Oyster Bay	2422
27528	Petit Gabriel	2422
27529	Piments-Baie Topaze	2422
27530	Plaine Corail-La Fouche Corail	2422
27531	Port Mathurin	2422
27532	Port Sud-Est	2422
27533	Riviere Cocos	2422
27534	Roche Bon Dieu-Trefles	2422
27535	Baie du Cap	2424
27536	Bel Ombre	2424
27537	Benares	2424
27538	Bois Cheri	2424
27539	Britannia	2424
27540	Camp Diable	2424
27541	Chamouny	2424
27542	Chemin Grenier	2424
27543	Grand Bois	2424
27544	Riviere des Anguilles	2424
27545	Saint Aubin	2424
27546	Souillac	2424
27547	Surinam	2424
27548	Acoua	2425
27549	Bandraboua	2425
27550	Bandrele	2425
27551	Boueni	2425
27552	Chiconi	2425
27553	Chirongui	2425
27554	Dembeni	2425
27555	Kanikeli	2425
27556	Koungou	2425
27557	Mamoudzou	2425
27558	Mtsamboro	2425
27559	Mtsangamouji	2425
27560	Ouangani	2425
27561	Sada	2425
27562	Tsingoni	2425
27563	Dzaoudzi	2426
27564	Pamanzi	2426
27565	Aguascalientes	2427
27566	Asientos	2427
27567	Calvillo	2427
27568	Cosio	2427
27569	Margaritas	2427
27570	Ojocaliente	2427
27571	Pabellon de Arteaga	2427
27572	Pabellon de Hidalgo	2427
27573	Palo Alto	2427
27574	Rincon de Romos	2427
27575	San Francisco de los Romo	2427
27576	San Jose de Gracia	2427
27577	Tepezala	2427
27578	Villa Juarez	2427
27579	Becal	2430
27580	Bolonchen	2430
27581	Calkini	2430
27582	Campeche	2430
27583	Candelaria	2430
27584	Carmen	2430
27585	Champoton	2430
27586	China	2430
27587	Dzitbalche	2430
27588	Escarcega	2430
27589	Hecelchakan	2430
27590	Hopelchen	2430
27591	Isla Aguada	2430
27592	Nuevo Progreso	2430
27593	Nunkini	2430
27594	Palizada	2430
27595	Pomuch	2430
27596	Sabancuy	2430
27597	Seybaplaya	2430
27598	Tenabo	2430
27599	Acacoyagua	2431
27600	Acala	2431
27601	Acapetahua	2431
27602	Altamirano	2431
27603	Alvaro Obregon	2431
27604	Amatan	2431
27605	Amatenango del Valle	2431
27606	Arriaga	2431
27607	Benemerito de las Americas	2431
27608	Berriozabal	2431
27609	Bochil	2431
27610	Cacahoatan	2431
27611	Cancuc	2431
27612	Catazaja	2431
27613	Chalchihiutan	2431
27614	Chanal	2431
27615	Chiapa	2431
27616	Chiapilla	2431
27617	Chicomuselo	2431
27618	Chilon	2431
27619	Cintalapa	2431
27620	Comaltitlan	2431
27621	Comitan	2431
27622	Copainala	2431
27623	Copoya	2431
27624	Cristobal Obregon	2431
27625	El Bosque	2431
27626	El Parral	2431
27627	Escuintla	2431
27628	Frontera Comalapa	2431
27629	Frontera Corozal	2431
27630	Frontera Hidalgo	2431
27631	Huehuetan	2431
27632	Huehuetan Estacion	2431
27633	Huixtla	2431
27634	Ixhuatan	2431
27635	Ixtacomitan	2431
27636	Ixtapa	2431
27637	Jaltenango	2431
27638	Jesus Maria Garza	2431
27639	Jiquipilas	2431
27640	Jitotol	2431
27641	Juarez	2431
27642	La Concordia	2431
27643	La Libertad	2431
27644	La Trinitaria	2431
27645	Las Margaritas	2431
27646	Las Rosas	2431
27647	Mapastepec	2431
27648	Mazatan	2431
27649	Motozintla	2431
27650	Navenchauc	2431
27651	Nicolas Ruiz	2431
27652	Ocosingo	2431
27653	Ocotepec	2431
27654	Ocozocoautla	2431
27655	Ostuacan	2431
27656	Oxchuc	2431
27657	Palenque	2431
27658	Palestina	2431
27659	Pantelho	2431
27660	Paredon	2431
27661	Petalcingo	2431
27662	Pichucalco	2431
27663	Pijijiapan	2431
27664	Pueblo Nuevo Solistahuacan	2431
27665	Puerto Madero	2431
27666	Pujiltic	2431
27667	Raudales Malpaso	2431
27668	Rayon	2431
27669	Reforma	2431
27670	Revolucion Mexicana	2431
27671	Rincon Chamula	2431
27672	Salto de Agua	2431
27673	San Cristobal de las Casas	2431
27674	San Fernando	2431
27675	San Lucas	2431
27676	San Pedro Buenavista	2431
27677	Simojovel	2431
27678	Socoltenango	2431
27679	Soyalo	2431
27680	Suchiapa	2431
27681	Suchiate	2431
27682	Tapachula	2431
27683	Tapilula	2431
27684	Tecpatan	2431
27685	Tenango	2431
27686	Teopisca	2431
27687	Tila	2431
27688	Tonala	2431
27689	Totolapa	2431
27690	Tres Picos	2431
27691	Tuxtla Chico	2431
27692	Tuxtla Gutierrez	2431
27693	Tzimol	2431
27694	Veinte de Noviembre	2431
27695	Venustiano Carranza	2431
27696	Villa Corzo	2431
27697	Villaflores	2431
27698	Yajalon	2431
27699	Zinacantan	2431
27700	Adolfo Lopez Mateos	2432
27701	Ahumada	2432
27702	Anahuac	2432
27703	Ascension	2432
27704	Benito Juarez	2432
27705	Camargo	2432
27706	Carichi	2432
27707	Casas Grandes	2432
27708	Chihuahua	2432
27709	Colonia Municipio Libre	2432
27710	Creel	2432
27711	Cuauhtemoc	2432
27712	Delicias	2432
27713	El Largo	2432
27714	Guachochi	2432
27715	Guadalupe	2432
27716	Guadalupe y Calvo	2432
27717	Hermenegildo Galeana	2432
27718	Hidalgo	2432
27719	Ignacio Zaragoza	2432
27720	Jimenez	2432
27721	Juan Aldama	2432
27722	Juarez	2432
27723	Lazaro Cardenas	2432
27724	Madera	2432
27725	Majimachi	2432
27726	Meoqui	2432
27727	Naica	2432
27728	Nuevo Casas Grandes	2432
27729	Octaviano Lopez	2432
27730	Ojinaga	2432
27731	Praxedis Guerrero	2432
27732	Puerto Palomas	2432
27733	Puerto de Anapra	2432
27734	San Buenaventura	2432
27735	San Francisco el Oro	2432
27736	Santa Barbara	2432
27737	Santa Cruz de Rosales	2432
27738	Saucillo	2432
27739	Valentin Gomez Farias	2432
27740	Valle de Allende	2432
27741	Vicente Guerrero	2432
27742	Acuna	2433
27743	Allende	2433
27744	Arteaga	2433
27745	Castanos	2433
27746	Concordia	2433
27747	Cuatrocienagas	2433
27748	El Coyote	2433
27749	Frontera	2433
27750	General Cepeda	2433
27751	Hercules	2433
27752	Matamoros	2433
27753	Minas de Barroteran	2433
27754	Monclova	2433
27755	Muzquiz	2433
27756	Nadadores	2433
27757	Nava	2433
27758	Nueva Rosita	2433
27759	Ocampo	2433
27760	Palau	2433
27761	Parras	2433
27762	Piedras Negras	2433
27763	Ramos Arizpe	2433
27764	Sabinas	2433
27765	Saltillo	2433
27766	San Buenaventura	2433
27767	San Pedro	2433
27768	Torreon	2433
27769	Venustiano Carranza	2433
27770	Viesca	2433
27771	Villa Madero	2433
27772	Villa Union	2433
27773	Zaragoza	2433
27774	Armeria	2434
27775	Cofradia	2434
27776	Colima	2434
27777	Colonia Bayardo	2434
27778	Comala	2434
27779	Coquimatlan	2434
27780	Cuauhtemoc	2434
27781	El Colomo	2434
27782	Madrid	2434
27783	Manzanillo	2434
27784	Minatitlan	2434
27785	Queseria	2434
27786	Suchitlan	2434
27787	Tecoman	2434
27788	Villa de Alvarez	2434
27789	Bermejillo	2436
27790	Canatlan	2436
27791	Cuencame	2436
27792	Durango	2436
27793	Gomez Palacio	2436
27794	Guadalupe Victoria	2436
27795	Juarez	2436
27796	Lerdo	2436
27797	Mapimi	2436
27798	Nazareno	2436
27799	Nazas	2436
27800	Nombre de Dios	2436
27801	Nuevo Ideal	2436
27802	Ocampo	2436
27803	Panuco	2436
27804	Papasquiaro	2436
27805	Penon Blanco	2436
27806	Poanas	2436
27807	Pueblo Nuevo	2436
27808	Rodeo	2436
27809	Santa Catarina de Tepehuanes	2436
27810	Santa Clara	2436
27811	Santa Maria del Oro	2436
27812	Suchil	2436
27813	Tayoltita	2436
27814	Tlahualilo	2436
27815	Vicente Guerrero	2436
27816	Abasolo	2438
27817	Acambaro	2438
27818	Aldama	2438
27819	Allende	2438
27820	Antonio Rodriguez	2438
27821	Apaseo el Alto	2438
27822	Apaseo el Grande	2438
27823	Celaya	2438
27824	Centro Familiar la Soledad	2438
27825	Cerano	2438
27826	Cerro Gordo	2438
27827	Colonias Nuevo Mexico	2438
27828	Comonfort	2438
27829	Coroneo	2438
27830	Cortazar	2438
27831	Cueramaro	2438
27832	Doctor Mora	2438
27833	Dolores Hidalgo	2438
27834	Duarte	2438
27835	El Sabino	2438
27836	Escobedo	2438
27837	Guanajuato	2438
27838	Huanimaro	2438
27839	Iramuco	2438
27840	Irapuato	2438
27841	Jaral del Progreso	2438
27842	Jerecuaro	2438
27843	Juventino Rosas	2438
27844	La Aldea	2438
27845	La Calera	2438
27846	La Ermita	2438
27847	La Moncada	2438
27848	Leon	2438
27849	Loma Pelada	2438
27850	Manuel Doblado	2438
27851	Maravatio	2438
27852	Marfil	2438
27853	Medina	2438
27854	Mexicanos	2438
27855	Moroleon	2438
27856	Ocampo	2438
27857	Octopan	2438
27858	Pacueco	2438
27859	Palo Verde	2438
27860	Paracuaro	2438
27861	Penjamo	2438
27862	Plan de Ayala	2438
27863	Pueblo Nuevo	2438
27864	Purisima de Bustos	2438
27865	Rincon de Tamayo	2438
27866	Romita	2438
27867	Salamanca	2438
27868	Salvatierra	2438
27869	San Bartolo de Berrios	2438
27870	San Cristobal	2438
27871	San Diego de la Union	2438
27872	San Felipe	2438
27873	San Francisco del Rincon	2438
27874	San Jose Agua Azul	2438
27875	San Jose Iturbide	2438
27876	San Jose Temascatio	2438
27877	San Juan de la Vega	2438
27878	San Luis de la Paz	2438
27879	San Nicolas de los Agustinos	2438
27880	San Pedro de los Naranjos	2438
27881	San Roque	2438
27882	Santa Teresa	2438
27883	Santiago de Cuenda	2438
27884	Sarabia	2438
27885	Silao	2438
27886	Tarandacuao	2438
27887	Tarimoro	2438
27888	Teneria del Santuario	2438
27889	Uriangato	2438
27890	Urireo	2438
27891	Valle de Santiago	2438
27892	Valtierrilla	2438
27893	Victoria	2438
27894	Villagran	2438
27895	Villas de Irapuato	2438
27896	Yerbabuena	2438
27897	Yuriria	2438
27898	Acamixtla	2439
27899	Acapulco	2439
27900	Acatlan	2439
27901	Ajuchitlan	2439
27902	Alpoyeca	2439
27903	Altamirano	2439
27904	Apango	2439
27905	Apaxtla	2439
27906	Arcelia	2439
27907	Atliaca	2439
27908	Atoyac	2439
27909	Ayutla	2439
27910	Azoyu	2439
27911	Bajos de Ejido	2439
27912	Buenavista	2439
27913	Chichihualco	2439
27914	Chilapa	2439
27915	Chilpancingo	2439
27916	Coacoyul	2439
27917	Cocula	2439
27918	Copala	2439
27919	Copalillo	2439
27920	Coyuca	2439
27921	Cruz Grande	2439
27922	Cuajinicuilapa	2439
27923	Cuautepec	2439
27924	Cutzamala	2439
27925	El Ocotito	2439
27926	El Paraiso	2439
27927	El Suchil	2439
27928	Huamuxtitlan	2439
27929	Huitziltepec	2439
27930	Huitzuco	2439
27931	Iguala	2439
27932	Ixtapa	2439
27933	Kilometro Treinta	2439
27934	La Loma	2439
27935	La Union	2439
27936	Las Petaquillas	2439
27937	Las Vigas	2439
27938	Marquelia	2439
27939	Mazatlan	2439
27940	Mochitlan	2439
27941	Olinala	2439
27942	Ometepec	2439
27943	Petatlan	2439
27944	Pilcaya	2439
27945	Quechultenango	2439
27946	San Jeronimito	2439
27947	San Jeronimo	2439
27948	San Jose Ixtapa	2439
27949	San Luis San Pedro	2439
27950	San Marcos	2439
27951	Taxco	2439
27952	Taxco de Alarcon	2439
27953	Tecoanapa	2439
27954	Tecpan	2439
27955	Teloloapan	2439
27956	Tepecoacuilco	2439
27957	Tierra Colorada	2439
27958	Tixtla	2439
27959	Tlacoachistlahuaca	2439
27960	Tlacotepec	2439
27961	Tlalchapa	2439
27962	Tlamacazapa	2439
27963	Tlapa	2439
27964	Tlapehuala	2439
27965	Totolapan	2439
27966	Tres Palos	2439
27967	Xalpatlahuac	2439
27968	Xaltianguis	2439
27969	Xochihuehuetlan	2439
27970	Xochistlahuaca	2439
27971	Zacualpan	2439
27972	Zihuatanejo	2439
27973	Zirandaro	2439
27974	Zitlala	2439
27975	Zumpango	2439
27976	Acaxochitlan	2440
27977	Acayuca	2440
27978	Actopan	2440
27979	Ajacuba	2440
27980	Almoloya	2440
27981	Apan	2440
27982	Atengo	2440
27983	Atitalaquia	2440
27984	Atotonilco de Tula	2440
27985	Atotonilco el Grande	2440
27986	Calnali	2440
27987	Cardonal	2440
27988	Chapulhuacan	2440
27989	Cuautepec	2440
27990	Doxey	2440
27991	El Arenal	2440
27992	El Llano	2440
27993	El Rosario	2440
27994	Emiliano Zapata	2440
27995	Huautla	2440
27996	Huejutla	2440
27997	Hueytlalpan	2440
27998	Huichapan	2440
27999	Ixmiquilpan	2440
28000	Jacala	2440
28001	Jaltocan	2440
28002	Los Reyes	2440
28003	Mineral del Monte	2440
28004	Mixquiahuala	2440
28005	Molango	2440
28006	Orizatlan	2440
28007	Pachuca	2440
28008	Pachuquilla	2440
28009	Progreso	2440
28010	Sahagun	2440
28011	San Ildefonso	2440
28012	San Juan Tepa	2440
28013	San Marcos	2440
28014	Singuilucan	2440
28015	Tasquillo	2440
28016	Tecozautla	2440
28017	Tepatepec	2440
28018	Tepeapulco	2440
28019	Tepeji	2440
28020	Tepepa	2440
28021	Tetepango	2440
28022	Tezontepec	2440
28023	Tizayuca	2440
28024	Tlahuelilpan	2440
28025	Tlanalapa	2440
28026	Tlanchinol	2440
28027	Tlaxcoapan	2440
28028	Tlaxiaca	2440
28029	Tolcayuca	2440
28030	Tula de Allende	2440
28031	Tulancingo	2440
28032	Tulantepec	2440
28033	Vindho	2440
28034	Zacualtipan	2440
28035	Zapotlan	2440
28036	Zempoala	2440
28037	Zimapan	2440
28038	Acatic	2441
28039	Acatlan	2441
28040	Ahualulco	2441
28041	Ajijic	2441
28042	Alejandria	2441
28043	Amatitan	2441
28044	Ameca	2441
28045	Antonio Escobedo	2441
28046	Arandas	2441
28047	Atemajac	2441
28048	Atequiza	2441
28049	Atotonilco el Alto	2441
28050	Atotonilquillo	2441
28051	Atoyac	2441
28052	Autlan	2441
28053	Ayotlan	2441
28054	Ayutla	2441
28055	Bellavista	2441
28056	Cajititlan	2441
28057	Capilla de Guadalupe	2441
28058	Casimiro Castillo	2441
28059	Centro de Readaptacion Social	2441
28060	Chapala	2441
28061	Chiquilistlan	2441
28062	Cihuatlan	2441
28063	Cocula	2441
28064	Colotlan	2441
28065	Concepcion de Buenos Aires	2441
28066	Cosala	2441
28067	Coyula	2441
28068	Cuitzeo	2441
28069	Cuqio	2441
28070	Cuyutlan	2441
28071	Degollado	2441
28072	El Arenal	2441
28073	El Grullo	2441
28074	El Limon	2441
28075	El Quince	2441
28076	El Refugio	2441
28077	El Salto	2441
28078	El Verde	2441
28079	Encarnacion	2441
28080	Etzatlan	2441
28081	Guadalajara	2441
28082	Guzman	2441
28083	Hidalgo	2441
28084	Hostotipaquillo	2441
28085	Huejucar	2441
28086	Huejuquilla el Alto	2441
28087	Itzican	2441
28088	Ixtapa	2441
28089	Ixtlahuacan de los Membrillos	2441
28090	Ixtlahuacan del Rio	2441
28091	Ixtlan	2441
28092	Jalostotitlan	2441
28093	Jamay	2441
28094	Jesus Maria	2441
28095	Jocotepec	2441
28096	Juanacatlan	2441
28097	Juchitlan	2441
28098	La Barca	2441
28099	La Huerta	2441
28100	La Ribera	2441
28101	La Tijera	2441
28102	La Venta del Astillero	2441
28103	Lagos de Moreno	2441
28104	Las Juntas	2441
28105	Las Pintas	2441
28106	Las Pintitas	2441
28107	Lo Arado	2441
28108	Magdalena	2441
28109	Mascota	2441
28110	Mazamitla	2441
28111	Mexticacan	2441
28112	Mezcala	2441
28113	Nuevo Mexico	2441
28114	Ocotlan	2441
28115	Ojuelos de Jalisco	2441
28116	Pihuamo	2441
28117	Poncitlan	2441
28118	Puente Grande	2441
28119	Puerto Vallarta	2441
28120	Purificacion	2441
28121	San Agustin	2441
28122	San Francisco de Asis	2441
28123	San Gabriel	2441
28124	San Jose de Gracia	2441
28125	San Jose del Castillo	2441
28126	San Juan de los Lagos	2441
28127	San Julian	2441
28128	San Marcos	2441
28129	San Martin de Hidalgo	2441
28130	San Miguel el Alto	2441
28131	San Patricio	2441
28132	San Sebastian del Sur	2441
28133	San Sebastian el Grande	2441
28134	Santa Anita	2441
28135	Santa Cruz de las Flores	2441
28136	Santa Cruz del Valle	2441
28137	Sayula	2441
28138	Tala	2441
28139	Talpa	2441
28140	Tamazula	2441
28141	Tapalpa	2441
28142	Tecalitlan	2441
28143	Tecolotlan	2441
28144	Tenamaxtlan	2441
28145	Teocaltiche	2441
28146	Teocuitatlan de Corona	2441
28147	Tepatitlan	2441
28148	Tequila	2441
28149	Tesistan	2441
28150	Teuchitlan	2441
28151	Tizapan el Alto	2441
28152	Tlajomulco	2441
28153	Tlaquepaque	2441
28154	Tomatlan	2441
28155	Tonala	2441
28156	Tonaya	2441
28157	Tonila	2441
28158	Tototlan	2441
28159	Tuxpan	2441
28160	Union de San Antonio	2441
28161	Union de Tula	2441
28162	Usmajac	2441
28163	Valle de Guadalupe	2441
28164	Valle de Juarez	2441
28165	Villa Corona	2441
28166	Villa Guerrero	2441
28167	Yahualica	2441
28168	Zacoalco	2441
28169	Zapopan	2441
28170	Zapote	2441
28171	Zapotiltic	2441
28172	Zapotlanejo	2441
28173	Acahualco	2442
28174	Acambay	2442
28175	Acazulco	2442
28176	Acolman	2442
28177	Acuautla	2442
28178	Acutzilapan	2442
28179	Ajoloapan	2442
28180	Alborada	2442
28181	Almaya	2442
28182	Almoloya	2442
28183	Almoloya del Rio	2442
28184	Amanalco	2442
28185	Amecameca	2442
28186	Ameyalco	2442
28187	Apaxco	2442
28188	Atarasquillo	2442
28189	Atenco	2442
28190	Atizapan	2442
28191	Atlacomulco	2442
28192	Atlatlahuca	2442
28193	Atlatongo	2442
28194	Atlautla	2442
28195	Atlazalpan	2442
28196	Autopan	2442
28197	Axapusco	2442
28198	Ayotuzco	2442
28199	Ayotzingo	2442
28200	Azcatepec	2442
28201	Balderas	2442
28202	Bocanegra	2442
28203	Boreje	2442
28204	Buenavista	2442
28205	Cacalomacan	2442
28206	Cahuacan	2442
28207	Calimaya	2442
28208	Calixtlahuaca	2442
28209	Capulhuac	2442
28210	Carbon	2442
28211	Cautzingo	2442
28212	Chalco	2442
28213	Chapultepec	2442
28214	Chiautla	2442
28215	Chicoloapan	2442
28216	Chiconautla	2442
28217	Chiconcuac	2442
28218	Chimalhuacan	2442
28219	Chimalpa	2442
28220	Cholula	2442
28221	Citendeje	2442
28222	Coacalco	2442
28223	Coachochitlan	2442
28224	Coacomulco	2442
28225	Coapango	2442
28226	Coatepec	2442
28227	Coatepec Harinas	2442
28228	Coatlinchan	2442
28229	Cocotitlan	2442
28230	Colorines	2442
28231	Concepcion Jolalpan	2442
28232	Coyotepec	2442
28233	Cuauhtemoc	2442
28234	Cuauhtenco	2442
28235	Cuautitlan	2442
28236	Cuautitlan Izcalli	2442
28237	Cuautlalpan	2442
28238	Cuaxustenco	2442
28239	Cuexontitlan	2442
28240	Cuijingo	2442
28241	Ecatepec	2442
28242	Ecatzingo	2442
28243	Ejido Cahuacan	2442
28244	Ejido Veinte de Noviembre la C	2442
28245	Ejido de la Y Seccion Siete a 	2442
28246	El Coporo	2442
28247	El Oro	2442
28248	Enchisi	2442
28249	Enthavi	2442
28250	Fuentes del Valle	2442
28251	Huehuetoca	2442
28252	Huexoculco	2442
28253	Hueypoxtla	2442
28254	Huilango	2442
28255	Huitzilzingo	2442
28256	Huixquilucan	2442
28257	Huixquilucan de Degollado	2442
28258	Huixtoco	2442
28259	Ixlahuaca	2442
28260	Ixtacalco	2442
28261	Ixtapaluca	2442
28262	Ixtapan	2442
28263	Ixtlahuatzingo	2442
28264	Jajalpa	2442
28265	Jaltenco	2442
28266	Jaltepec	2442
28267	Jesus del Monte	2442
28268	Jicaltepec Autopan	2442
28269	Jilotepec	2442
28270	Jilotzingo	2442
28271	Jocotitlan	2442
28272	Joquicingo	2442
28273	Jorge Jimenez Cantu	2442
28274	Juchitepec	2442
28275	La Concepcion los Banos	2442
28276	La Constitucion	2442
28277	La Magdalema	2442
28278	Lerma	2442
28279	Loma de Juarez	2442
28280	Lomas de Zacamulpa	2442
28281	Lopez Mateos	2442
28282	Los Esparragos	2442
28283	Los Reyes	2442
28284	Los Reyes Acozac	2442
28285	Luvianos	2442
28286	Malinalco	2442
28287	Melchor Ocampo	2442
28288	Metepec	2442
28289	Mexicaltzingo	2442
28290	Mextepec	2442
28291	Montecillo	2442
28292	Nativitas	2442
28293	Naucalpan	2442
28294	Nexquipayac	2442
28295	Nextlalpan	2442
28296	Nezahualcoyotl	2442
28297	Nicolas Romero	2442
28298	Nopaltepec	2442
28299	Ocotitlan	2442
28300	Ocotlan	2442
28301	Ocoyoacac	2442
28302	Ojo de Agua	2442
28303	Otumba	2442
28304	Otzacatipan	2442
28305	Oyamel	2442
28306	Oztolotepec	2442
28307	Ozumba	2442
28308	Papalotla	2442
28309	Progreso Industrial	2442
28310	Pueblo Nuevo	2442
28311	Rayon	2442
28312	Rio Frio	2442
28313	Salitrillo	2442
28314	San Antonio Buenavista	2442
28315	San Antonio La Isla	2442
28316	San Bartolo	2442
28317	San Bartolo del Llano	2442
28318	San Bernardino	2442
28319	San Buenaventura	2442
28320	San Felipe del Progreso	2442
28321	San Jeronimo	2442
28322	San Jose Guadalupe	2442
28323	San Jose el Vidrio	2442
28324	San Juan Tilapa	2442
28325	San Juan de las Huertas	2442
28326	San Juan y San Pedro Tezompa	2442
28327	San Lorenzo Cuauhtenco	2442
28328	San Martin de las Piramides	2442
28329	San Miguel la Labor	2442
28330	San Nicolas Guadalupe	2442
28331	San Nicolas Tolentino	2442
28332	San Pablo de las Salinas	2442
28333	San Pedro Abajo	2442
28334	San Pedro Arriba	2442
28335	San Pedro el Alto	2442
28336	San Pedro los Banos	2442
28337	San Simon de la Laguna	2442
28338	Santa Catarina del Monte	2442
28339	Santa Cruz del Monte	2442
28340	Santa Gertrudis	2442
28341	Santa Maria del Monte	2442
28342	Santo Domingo de Guzman	2442
28343	Soyaniquilpan	2442
28344	Sultepec	2442
28345	Tecalco	2442
28346	Tecamac	2442
28347	Techuchulco	2442
28348	Tecuahutitlan	2442
28349	Tehuixtitlan	2442
28350	Tejupilco	2442
28351	Temamatla	2442
28352	Temascalapa	2442
28353	Temascalcingo	2442
28354	Temoaya	2442
28355	Tenancingo	2442
28356	Tenango de Arista	2442
28357	Tenango del Aire	2442
28358	Tenochtitlan	2442
28359	Teoloyucan	2442
28360	Teotihuacan	2442
28361	Tepeolulco	2442
28362	Tepetitlan	2442
28363	Tepetlaoxtoc	2442
28364	Tepetlixpa	2442
28365	Tepexpan	2442
28366	Tepotzotlan	2442
28367	Tequexquinahuac	2442
28368	Tequisistlan	2442
28369	Tequixquiac	2442
28370	Texcalyacac	2442
28371	Texcoco	2442
28372	Teyahualco	2442
28373	Tezoquipan	2442
28374	Tezoyuca	2442
28375	Tianguistenco	2442
28376	Tilapa	2442
28377	Tlachaloya Segunda Seccion	2442
28378	Tlachihualpa	2442
28379	Tlacotepec	2442
28380	Tlahuelilpan	2442
28381	Tlaixpan	2442
28382	Tlalcilalcalli	2442
28383	Tlalcilalcalpan	2442
28384	Tlalmanalco	2442
28385	Tlalmimilolpan	2442
28386	Tlalnepantla	2442
28387	Tlaltelulco	2442
28388	Tlaltizapan	2442
28389	Tlanisco	2442
28390	Toluca	2442
28391	Tonanitla	2442
28392	Tonatico	2442
28393	Totocuitlapilco	2442
28394	Totoltepec	2442
28395	Tulantongo	2442
28396	Tultepec	2442
28397	Tultitlan	2442
28398	Valle de Bravo	2442
28399	Victoria	2442
28400	Villa Guerrero	2442
28401	Vista Hermosa	2442
28402	Xalatlaco	2442
28403	Xalpa	2442
28404	Xico	2442
28405	Xochimanca	2442
28406	Xolalpa	2442
28407	Xoloc	2442
28408	Xometla	2442
28409	Xonacatlan	2442
28410	Yachihuacaltepec	2442
28411	Yancuitlalpan	2442
28412	Zacacalco	2442
28413	Zacamulpa	2442
28414	Zacualpan	2442
28415	Zaragoza	2442
28416	Zictepec	2442
28417	Zinacantepec	2442
28418	Zolotepec	2442
28419	Zumpahuacan	2442
28420	Zumpango	2442
28421	Acuitzio	2443
28422	Aguililla	2443
28423	Alvaro Obregon	2443
28424	Angahuan	2443
28425	Angamacutiro	2443
28426	Angangueo	2443
28427	Antunez	2443
28428	Apatzingan	2443
28429	Ario	2443
28430	Arteaga	2443
28431	Benito Juarez	2443
28432	Brisenas	2443
28433	Buenavista	2443
28434	Buenos Aires	2443
28435	Caltzontzin	2443
28436	Capacuaro	2443
28437	Capula	2443
28438	Caracuaro	2443
28439	Charapan	2443
28440	Charo	2443
28441	Chavinda	2443
28442	Cheran	2443
28443	Chilchota	2443
28444	Churintzio	2443
28445	Churumuco	2443
28446	Coahuayana	2443
28447	Coalcoman	2443
28448	Coeneo	2443
28449	Cojumatlan	2443
28450	Comachuen	2443
28451	Contepec	2443
28452	Copandaro	2443
28453	Cotija	2443
28454	Cuanajo	2443
28455	Cuitareo	2443
28456	Cuitzeo	2443
28457	Ecuandureo	2443
28458	Hidalgo	2443
28459	Huandacareo	2443
28460	Huetamo	2443
28461	Indaparapeo	2443
28462	Irimbo	2443
28463	Ixtlan	2443
28464	Jacona	2443
28465	Jiquilpan	2443
28466	Jungapeo	2443
28467	La Huacana	2443
28468	La Mira	2443
28469	La Orilla	2443
28470	La Piedad	2443
28471	La Ruana	2443
28472	Las Guacamayas	2443
28473	Lazaro Cardenas	2443
28474	Lombardia	2443
28475	Los Reyes	2443
28476	Madero	2443
28477	Maravatio	2443
28478	Maya	2443
28479	Morelia	2443
28480	Morelos	2443
28481	Nahuatzen	2443
28482	Nocupetaro	2443
28483	Nueva Italia de Ruiz	2443
28484	Nuevo San Juan Parangaricutiro	2443
28485	Numaran	2443
28486	Ocampo	2443
28487	Opopeo	2443
28488	Pajacuaran	2443
28489	Panindicuaro	2443
28490	Paracho	2443
28491	Paracuaro	2443
28492	Pastor Ortiz	2443
28493	Patzcuaro	2443
28494	Pedernales	2443
28495	Penjamillo	2443
28496	Periban	2443
28497	Pichataro	2443
28498	Purepero	2443
28499	Puruandiro	2443
28500	Puruaran	2443
28501	Querendaro	2443
28502	Quiroga	2443
28503	Rincon de Nicolas Romero	2443
28504	Riva Palacio	2443
28505	Sahuayo	2443
28506	San Jose de Gracia	2443
28507	San Lucas	2443
28508	San Matias Grande	2443
28509	Santa Clara de Valladares	2443
28510	Santa Clara del Cobre	2443
28511	Santa Fe de la Laguna	2443
28512	Tacambaro	2443
28513	Tancitaro	2443
28514	Tangamandapio	2443
28515	Tangancicuaro	2443
28516	Tanhuato	2443
28517	Tarecuato	2443
28518	Taretan	2443
28519	Tarimbaro	2443
28520	Tejaro	2443
28521	Tepalcatepec	2443
28522	Tingambato	2443
28523	Tinguindin	2443
28524	Tiquicheo	2443
28525	Tlalpujahua	2443
28526	Tlazazalca	2443
28527	Tungareo	2443
28528	Tuxpan	2443
28529	Tzintzuntzan	2443
28530	Uruapan	2443
28531	Venustiano Carranza	2443
28532	Villa Jimenez	2443
28533	Villachuato	2443
28534	Villamar	2443
28535	Vista Hermosa	2443
28536	Yurecuaro	2443
28537	Zacapu	2443
28538	Zamora	2443
28539	Zinapecuaro	2443
28540	Zitacuaro	2443
28541	Alpuyeca	2444
28542	Amacuzac	2444
28543	Amayuca	2444
28544	Anenecuilco	2444
28545	Apatlaco	2444
28546	Atlatlahucan	2444
28547	Axochiapan	2444
28548	Ayala	2444
28549	Calera Chica	2444
28550	Chiconcuac	2444
28551	Coatetelco	2444
28552	Cocoyoc	2444
28553	Cuautla	2444
28554	Cuernavaca	2444
28555	Emiliano Zapata	2444
28556	Higueron	2444
28557	Hueyapan	2444
28558	Huiztilac	2444
28559	Independencia	2444
28560	Jantetelco	2444
28561	Jiutepec	2444
28562	Jojutla	2444
28563	Jonacatepec	2444
28564	Juan Morales	2444
28565	La Joya	2444
28566	Los Arcos	2444
28567	Mazatepec	2444
28568	Miacatlan	2444
28569	Oaxtepec	2444
28570	Ocuituco	2444
28571	Pedro Amaro	2444
28572	Progreso	2444
28573	Puente de Ixtla	2444
28574	San Jose Vista Hermosa	2444
28575	San Nicolas Galeana	2444
28576	Santa Catarina	2444
28577	Santa Rosa Treinta	2444
28578	Tehuixtla	2444
28579	Telixtac	2444
28580	Temixco	2444
28581	Temoac	2444
28582	Tenextepango	2444
28583	Tepalcingo	2444
28584	Tepoztlan	2444
28585	Tetecala	2444
28586	Tetela del Volcan	2444
28587	Tilzapotla	2444
28588	Tlacotepec	2444
28589	Tlalnepantla	2444
28590	Tlaltizapan	2444
28591	Tlaquiltenango	2444
28592	Tlatenchi	2444
28593	Tlayacapan	2444
28594	Totolapan	2444
28595	Tres Marias	2444
28596	Unidad Habitacional Jose Maria	2444
28597	Xochitepec	2444
28598	Xoxocotla	2444
28599	Yautepec	2444
28600	Yecapixtla	2444
28601	Zacatepec	2444
28602	Zacualpan	2444
28603	Acaponeta	2445
28604	Ahuacatlan	2445
28605	Amatlan	2445
28606	Aztatan	2445
28607	Bucerias	2445
28608	Carmen	2445
28609	Cerralvo	2445
28610	Compostela	2445
28611	Hidalgo	2445
28612	Ixcuintla	2445
28613	Ixtlan del Rio	2445
28614	Jala	2445
28615	Jalcocotan	2445
28616	La Penita de Jaltemba	2445
28617	La Presa	2445
28618	Lagunillas	2445
28619	Las Jarretaderas	2445
28620	Las Varas	2445
28621	Puga	2445
28622	Rosamorada	2445
28623	Ruiz	2445
28624	San Blas	2445
28625	San Jose del Valle	2445
28626	San Juan de Abajo	2445
28627	San Vicente	2445
28628	Santa Maria del Oro	2445
28629	Tecuala	2445
28630	Tepic	2445
28631	Tuxpan	2445
28632	Valle de Banderas	2445
28633	Xalisco	2445
28634	Yago	2445
28635	Zacualpan	2445
28636	Acatlan	2447
28637	Amatlan	2447
28638	Amilpas	2447
28639	Amuzgos	2447
28640	Asuncion Ixtaltepec	2447
28641	Asuncion Nochixtlan	2447
28642	Asuncion Ocotlan	2447
28643	Atempa	2447
28644	Atzompa	2447
28645	Ayautla	2447
28646	Ayoquezco	2447
28647	Ayotzintepec	2447
28648	Bajos de Chila	2447
28649	Brisas de Zicatela	2447
28650	Cacahuatepec	2447
28651	Cacaotepec	2447
28652	Chahuites	2447
28653	Chichicapam	2447
28654	Chiltepec	2447
28655	Cienaga de Zimatlan	2447
28656	Coatlan	2447
28657	Comitancillo	2447
28658	Cosolapa	2447
28659	Coyotepec	2447
28660	Crucecita	2447
28661	Cuicatlan	2447
28662	Cuilapam	2447
28663	Ejutla de Crespo	2447
28664	El Espinal	2447
28665	Etla	2447
28666	Fraccionamiento el Rosario	2447
28667	Guelavia	2447
28668	Guichicovi	2447
28669	Huajuapan	2447
28670	Huatulco	2447
28671	Huautla	2447
28672	Huaxpaltepec	2447
28673	Huayapam	2447
28674	Huazolotitlan	2447
28675	Huitzo	2447
28676	Huixtepec	2447
28677	Ingenio	2447
28678	Ixcatlan	2447
28679	Ixhuatan	2447
28680	Ixtepec	2447
28681	Jalapa	2447
28682	Jamiltepec	2447
28683	Jicayan	2447
28684	Juchitan	2447
28685	Juquila	2447
28686	Juxtlahuaca	2447
28687	Loma Bonita	2447
28688	Magdalena Teitipac	2447
28689	Magdalena Tequisistlan	2447
28690	Matatlan	2447
28691	Matias Romero	2447
28692	Mechoacan	2447
28693	Miahuatlan	2447
28694	Mitla	2447
28695	Mixtepec	2447
28696	Mixtequilla	2447
28697	Nazareno Etla	2447
28698	Niltepec	2447
28699	Oaxaca	2447
28700	Ocotepec	2447
28701	Ocotlan	2447
28702	Ojitlan	2447
28703	Palomares	2447
28704	Panixtlahuaca	2447
28705	Petapa	2447
28706	Pinotepa Nacional	2447
28707	Pinotepa de Don Luis	2447
28708	Pochutla	2447
28709	Puerto Escondido	2447
28710	Putla	2447
28711	Quetzaltepec	2447
28712	Rincon Viejo	2447
28713	Rio Grande	2447
28714	Salina Cruz	2447
28715	San Agustin de las Juntas	2447
28716	San Antonio Castillo Velasco	2447
28717	San Antonio de la Cal	2447
28718	San Dionisio del Mar	2447
28719	San Francisco del Mar	2447
28720	San Jose del Progreso	2447
28721	San Juan Colorado	2447
28722	San Mateo del Mar	2447
28723	Santa Lucia del Camino	2447
28724	Santa Maria del Tule	2447
28725	Santiago Apostol	2447
28726	Santos Reyes Nopala	2447
28727	Soyaltepec	2447
28728	Suchilquitongo	2447
28729	Tamazulapam	2447
28730	Tapanatepec	2447
28731	Tehuantepec	2447
28732	Teitipac	2447
28733	Telixtlahuaca	2447
28734	Teotitlan	2447
28735	Teotitlan den Valle	2447
28736	Tilquiapam	2447
28737	Tlacolula	2447
28738	Tlalixtac	2447
28739	Tlaxiaco	2447
28740	Tutla	2447
28741	Tuxtepec	2447
28742	Union Hidalgo	2447
28743	Usila	2447
28744	Valle Nacional	2447
28745	Vicente Camalote	2447
28746	Vicente Guerrero	2447
28747	Xadani	2447
28748	Xitla	2447
28749	Xoxocotlan	2447
28750	Yaitepec	2447
28751	Yatareni	2447
28752	Zaachila	2447
28753	Zacatepec	2447
28754	Zanatepec	2447
28755	Zimatlan	2447
28756	Acajete	2448
28757	Acateno	2448
28758	Acatlan	2448
28759	Acatzingo	2448
28760	Actipan	2448
28761	Acuexcomac	2448
28762	Ahuatempan	2448
28763	Ajalpan	2448
28764	Aljojuca	2448
28765	Almecatla	2448
28766	Alseseca	2448
28767	Altepexi	2448
28768	Amecac	2448
28769	Amozoc	2448
28770	Aparicio	2448
28771	Atempan	2448
28772	Atencingo	2448
28773	Atlixco	2448
28774	Atoyatempan	2448
28775	Atzitzintla	2448
28776	Atzompa	2448
28777	Ayutla	2448
28778	Azumiatla	2448
28779	Benito Juarez	2448
28780	Buenos Aires	2448
28781	Cacaloxuchitl	2448
28782	Calipan	2448
28783	Calmeca	2448
28784	Calpan	2448
28785	Caltenco	2448
28786	Canada	2448
28787	Canoa	2448
28788	Caxhuacan	2448
28789	Chalchihuapan	2448
28790	Chapulco	2448
28791	Chautla	2448
28792	Chiapa	2448
28793	Chiautla	2448
28794	Chiautzingo	2448
28795	Chiconquiac	2448
28796	Chietla	2448
28797	Chignahuapan	2448
28798	Chignautla	2448
28799	Chilac	2448
28800	Chilchotla	2448
28801	Cholula	2448
28802	Citlaltepetl	2448
28803	Coatepec	2448
28804	Coronango	2448
28805	Coxcatlan	2448
28806	Coyula	2448
28807	Cuacnopalan	2448
28808	Cuanala	2448
28809	Cuapiaxtla	2448
28810	Cuautlancingo	2448
28811	Cuayucatepec	2448
28812	Cuetzalan	2448
28813	Domingo Arenas	2448
28814	Escape	2448
28815	Esperanza	2448
28816	Guadalupe Victoria	2448
28817	Huaquechula	2448
28818	Huauchinango	2448
28819	Huehuetlan	2448
28820	Huejotzingo	2448
28821	Hueyapan	2448
28822	Hueyotlipan	2448
28823	Hueytamalco	2448
28824	Huixcolotla	2448
28825	Ixcaquixtla	2448
28826	Ixtiyucan	2448
28827	Izucar	2448
28828	Jolalpan	2448
28829	La Ceiba	2448
28830	La Galarza	2448
28831	La Resureccion	2448
28832	Lazaro Cardenas	2448
28833	Libres	2448
28834	Los Ranchos	2448
28835	Los Reyes de Juarez	2448
28836	Malacatepec	2448
28837	Metlaltoyuca	2448
28838	Miahuatlan	2448
28839	Mihuacan	2448
28840	Momoxpan	2448
28841	Moyotzingo	2448
28842	Nealtican	2448
28843	Necaxa	2448
28844	Nopalucan	2448
28845	Ocotitlan	2448
28846	Ocotlan	2448
28847	Ocoyucan	2448
28848	Oriental	2448
28849	Pahuatlan	2448
28850	Palmar de Bravo	2448
28851	Puebla	2448
28852	Quecholac	2448
28853	Raboso	2448
28854	Rafael Lara Grajales	2448
28855	San Gabriel Casa Blanca	2448
28856	San Lucas el Grande	2448
28857	San Salvador el Seco	2448
28858	San Sebastian Villanueva	2448
28859	Sanctorum	2448
28860	Santa Maria la Alta	2448
28861	Serdan	2448
28862	Soltepec	2448
28863	Tatoxcac	2448
28864	Tecali	2448
28865	Tecamachalco	2448
28866	Tehuacan	2448
28867	Tehuitzingo	2448
28868	Tenango	2448
28869	Tenango de las Flores	2448
28870	Tenextatiloyan	2448
28871	Teontepec	2448
28872	Teopantlan	2448
28873	Teotlalcingo	2448
28874	Tepango	2448
28875	Tepatlaxco	2448
28876	Tepeaca	2448
28877	Tepeojuma	2448
28878	Tepexi	2448
28879	Tepulco	2448
28880	Tetela Morelos	2448
28881	Tetela de Ocampo	2448
28882	Teteles	2448
28883	Tetzoyocan	2448
28884	Texmelucan	2448
28885	Teziutlan	2448
28886	Tianguismanalco	2448
28887	Tlachichuca	2448
28888	Tlacotepec	2448
28889	Tlacoyalco	2448
28890	Tlahuapan	2448
28891	Tlaixpan	2448
28892	Tlalancaleca	2448
28893	Tlaltenango	2448
28894	Tlanalapan	2448
28895	Tlancualpican	2448
28896	Tlanepantla	2448
28897	Tlapanala	2448
28898	Tlatlauquitepec	2448
28899	Tlaxcalancingo	2448
28900	Tlaxco	2448
28901	Tochapan	2448
28902	Tochimilco	2448
28903	Tochtepec	2448
28904	Tulcingo	2448
28905	Tuxco	2448
28906	Venustiano Carranza	2448
28907	Xalmimilulco	2448
28908	Xaltepec	2448
28909	Xicotepec	2448
28910	Xiutetelco	2448
28911	Xochiltenango	2448
28912	Xochitlan	2448
28913	Xonatepec	2448
28914	Xoxtla	2448
28915	Yaonahuac	2448
28916	Yehualtepec	2448
28917	Zacapechpan	2448
28918	Zacapoaxtla	2448
28919	Zacatepec	2448
28920	Zacatlan	2448
28921	Zaragoza	2448
28922	Zinacatepec	2448
28923	Zongozotla	2448
28924	Zozutla	2448
28925	Ajuchitlan	2449
28926	Amazcala	2449
28927	Amealco	2449
28928	Cadereyta	2449
28929	Candiles	2449
28930	Colon	2449
28931	El Colorado	2449
28932	El Pueblito	2449
28933	El Sauz	2449
28934	Ezequiel Montes	2449
28935	Huimilpan	2449
28936	Jalpan	2449
28937	Jauregui	2449
28938	La Canada	2449
28939	La Estancia	2449
28940	La Lira	2449
28941	La Llave	2449
28942	Paso de Mata	2449
28943	Pedro Escobedo	2449
28944	Queretaro	2449
28945	San Jose de los Olvera	2449
28946	San Jose el Alto	2449
28947	San Juan del Rio	2449
28948	San Nicolas	2449
28949	San Pedro Martir	2449
28950	Santa Maria Magdalena	2449
28951	Tequisquiapan	2449
28952	Tlacote el Bajo	2449
28953	Adolfo Ruiz Cortines	2452
28954	Agua Verde	2452
28955	Ahome	2452
28956	Angostura	2452
28957	Badiraguato	2452
28958	Bagojo	2452
28959	Benito Juarez	2452
28960	Campo Gobierno	2452
28961	Choix	2452
28962	Compuertas	2452
28963	Concordia	2452
28964	Constancia	2452
28965	Cosala	2452
28966	Costa Rica	2452
28967	Culiacan	2452
28968	Culiacancito	2452
28969	El Burrion	2452
28970	El Carrizo	2452
28971	El Diez	2452
28972	El Estero	2452
28973	El Fuerte	2452
28974	El Rosario	2452
28975	El Tamarindo	2452
28976	Eldorado	2452
28977	Escuinapa	2452
28978	Estacion Naranjo	2452
28979	Estancia Bamoa	2452
28980	Gabriel Leyva Solano	2452
28981	Guamuchil	2452
28982	Guasave	2452
28983	Higuera	2452
28984	Isla del Bosque	2452
28985	Jahuara Segundo	2452
28986	Juan Jose Rios	2452
28987	La Cruz	2452
28988	La Palma	2452
28989	La Reforma	2452
28990	La Trinidad	2452
28991	Los Mochis	2452
28992	Mazatlan	2452
28993	Mochicahui	2452
28994	Mocorito	2452
28995	Navolato	2452
28996	Pericos	2452
28997	Pueblos Unidos	2452
28998	Quila	2452
28999	San Blas	2452
29000	San Ignacio	2452
29001	Sinaloa	2452
29002	Teacapan	2452
29003	Topolobampo	2452
29004	Villa Union	2452
29005	Zapotitlan	2452
29006	Agua Prieta	2453
29007	Alamos	2453
29008	Altar	2453
29009	Bacobampo	2453
29010	Bacum	2453
29011	Bahia de Kino	2453
29012	Benjamin Hill	2453
29013	Caborca	2453
29014	Campo Sesenta	2453
29015	Cananea	2453
29016	Carbo	2453
29017	Cocorit	2453
29018	Cumpas	2453
29019	Empalme	2453
29020	Esperanza	2453
29021	Esqueda	2453
29022	Etchojoa	2453
29023	Etchoropo	2453
29024	Guaymas	2453
29025	Hermosillo	2453
29026	Huatabampo	2453
29027	Imuris	2453
29028	Juarez	2453
29029	Kino	2453
29030	La Doce	2453
29031	La Union	2453
29032	Moctezuma	2453
29033	Naco	2453
29034	Nacozari	2453
29035	Navajoa	2453
29036	Nogales	2453
29037	Obregon	2453
29038	Pitiquito	2453
29039	Potam	2453
29040	Providencia	2453
29041	Puerto Penasco	2453
29042	Rio Muerto	2453
29043	Sahuaripa	2453
29044	San Jose de Bacum	2453
29045	San Luis Rio Colorado	2453
29046	Sanchez	2453
29047	Santa Ana	2453
29048	Sonoita	2453
29049	Tobarito	2453
29050	Ures	2453
29051	Vicam	2453
29052	Yaqui	2453
29053	Yavaros	2453
29054	Aquiles Serdan	2454
29055	Ayapa	2454
29056	Balancan	2454
29057	Barra de Santa Ana	2454
29058	Belen	2454
29059	Bosque de Saloya	2454
29060	Buenavista	2454
29061	Campo Magellanes	2454
29062	Cardenas	2454
29063	Chichicapa	2454
29064	Chontalpa	2454
29065	Comalcalco	2454
29066	Cunduacan	2454
29067	El Triunfo	2454
29068	Emiliano Zapata	2454
29069	Fraccionamiento la Selva	2454
29070	Frontera	2454
29071	Huimanguillo	2454
29072	Jalapa	2454
29073	Jalpa	2454
29074	Jonuta	2454
29075	La Curva	2454
29076	La Venta	2454
29077	Luis Gil Perez	2454
29078	Macultepec	2454
29079	Macuspana	2454
29080	Magana	2454
29081	Miguel Hidalgo	2454
29082	Nacajuca	2454
29083	Ocuiltzapotlan	2454
29084	Once de Febrero	2454
29085	Paraiso	2454
29086	Parrilla	2454
29087	Pemex	2454
29088	Playas del Rosario	2454
29089	Rio Viejo	2454
29090	San Carlos	2454
29091	Santa Rosalia	2454
29092	Simon Sarlat	2454
29093	Tacotalpa	2454
29094	Tamulte	2454
29095	Teapa	2454
29096	Tecolutilla	2454
29097	Tenosique	2454
29098	Vicente Guerrero	2454
29099	Villa Aldama	2454
29100	Villahermosa	2454
29101	Abasolo	2455
29102	Aldama	2455
29103	Altamira	2455
29104	Antiguo Morelos	2455
29105	Camargo	2455
29106	Cuauhtemoc	2455
29107	El Mante	2455
29108	Estacion Manuel	2455
29109	Gonzalez	2455
29110	Graciano Sanchez	2455
29111	Guerrero	2455
29112	Gustavo Diaz Ordaz	2455
29113	Hidalgo	2455
29114	Jaumave	2455
29115	Llerca	2455
29116	Los Guerra	2455
29117	Madero	2455
29118	Matamoros	2455
29119	Mier	2455
29120	Miguel Aleman	2455
29121	Miramar	2455
29122	Nuevo Laredo	2455
29123	Nuevo Progreso	2455
29124	Ocampo	2455
29125	Padilla	2455
29126	Reynosa	2455
29127	Rio Bravo	2455
29128	San Fernando	2455
29129	Santa Engracia	2455
29130	Santander Jimenez	2455
29131	Soto la Marina	2455
29132	Tampico	2455
29133	Tula	2455
29134	Valle Hermoso	2455
29135	Victoria	2455
29136	Xicotencatl	2455
29137	Ahuashuatepec	2456
29138	Altzayanca	2456
29139	Amaxac	2456
29140	Apetatitlan	2456
29141	Apizaco	2456
29142	Apizaquito	2456
29143	Atexcatzingo	2456
29144	Axocomanitla	2456
29145	Ayometla	2456
29146	Benito Juarez	2456
29147	Buen Suceso	2456
29148	Calpulalpan	2456
29149	Chiautempan	2456
29150	Contla	2456
29151	Cuapiaxtla	2456
29152	Huactzinco	2456
29153	Huamantla	2456
29154	Hueyotlipan	2456
29155	Huiloac	2456
29156	Ignacio Zaragoza	2456
29157	Ixtacuixtla	2456
29158	Ixtenco	2456
29159	Mazatecochco	2456
29160	Nanacamilpa	2456
29161	Nativitas	2456
29162	Nopalucan	2456
29163	Panotla	2456
29164	Papalotla	2456
29165	Quilehtla	2456
29166	Sanctorum	2456
29167	Teacalco	2456
29168	Tenancingo	2456
29169	Teolocholco	2456
29170	Tepetitla	2456
29171	Tepeyanco	2456
29172	Tequixquitla	2456
29173	Terrenate	2456
29174	Tetla	2456
29175	Tetlanohcan	2456
29176	Tetlatlahuca	2456
29177	Texcalac	2456
29178	Texoloc	2456
29179	Tlaltelulco	2456
29180	Tlaxcala	2456
29181	Tlaxco	2456
29182	Tocatlan	2456
29183	Totolac	2456
29184	Vicente Guerrero	2456
29185	Villa Alta	2456
29186	Xaloztoc	2456
29187	Xaltocan	2456
29188	Xicohtzinco	2456
29189	Xicotencatl	2456
29190	Xiloxoxtla	2456
29191	Yauhquemecan	2456
29192	Zacatelco	2456
29193	Zacualpan	2456
29194	Zitlaltepec	2456
29195	Acayucan	2457
29196	Actopan	2457
29197	Acultzingo	2457
29198	Agua Dulce	2457
29199	Alamo	2457
29200	Allende	2457
29201	Altamirano	2457
29202	Alto Lucero	2457
29203	Altotonga	2457
29204	Alvarado	2457
29205	Amatlan	2457
29206	Anahuac	2457
29207	Anton Lizardo	2457
29208	Atzacan	2457
29209	Azueta	2457
29210	Banderilla	2457
29211	Benito Juarez	2457
29212	Boca del Monte	2457
29213	Boca del Rio	2457
29214	Cabada	2457
29215	Cabezas	2457
29216	Carrillo	2457
29217	Castillo de Teayo	2457
29218	Catemaco	2457
29219	Cazones	2457
29220	Cerro Azul	2457
29221	Chacaltianguis	2457
29222	Chicontepec	2457
29223	Chinameca	2457
29224	Chinampa	2457
29225	Chocaman	2457
29226	Citlaltepetl	2457
29227	Clara	2457
29228	Coacoatzintla	2457
29229	Coacotla	2457
29230	Coatepec	2457
29231	Coatzacoalcos	2457
29232	Coatzintla	2457
29233	Comoapan	2457
29234	Cordoba	2457
29235	Corral Nuevo	2457
29236	Cosamaloapan	2457
29237	Cosautlan	2457
29238	Coscomatepec	2457
29239	Cosoleacaque	2457
29240	Covarrubias	2457
29241	Coxquihui	2457
29242	Coyutla	2457
29243	Cuauhtemoc	2457
29244	Cuautlapan	2457
29245	Cuichapa	2457
29246	Cuitlahuac	2457
29247	El Castillo	2457
29248	El Higo	2457
29249	El Naranjito	2457
29250	El Pueblito	2457
29251	El Tejar	2457
29252	Emilio Carranza	2457
29253	Estacion Juanita	2457
29254	Estacion del Idolo	2457
29255	Filomeno Mata	2457
29256	Fortin	2457
29257	Gabino Barreda	2457
29258	Guadalupe Victoria	2457
29259	Gutierrez Zamora	2457
29260	Hidalgo	2457
29261	Hidalgotitlan	2457
29262	Huatusco	2457
29263	Huayacoctla	2457
29264	Hueyapan	2457
29265	Huiloapan	2457
29266	Ignacio de la Llave	2457
29267	Isla	2457
29268	Ixcatepec	2457
29269	Ixhuatlan del Cafe	2457
29270	Ixhuatlan del Sureste	2457
29271	Ixhuatlancillo	2457
29272	Ixtaczoquitlan	2457
29273	Jalacingo	2457
29274	Jalapilla	2457
29275	Jaltipan	2457
29276	Jamapa	2457
29277	Jesus Carranza	2457
29278	Jilotepec	2457
29279	La Antigua	2457
29280	La Estanzuela	2457
29281	La Pena	2457
29282	La Perla	2457
29283	La Poza	2457
29284	Las Amapolas	2457
29285	Las Choapas	2457
29286	Las Vigas	2457
29287	Lerdo	2457
29288	Lomas de Barillas	2457
29289	Los Altos	2457
29290	Los Mangos	2457
29291	Maltrata	2457
29292	Mariano Escobedo	2457
29293	Martinez	2457
29294	Mecatlan	2457
29295	Mecayapan	2457
29296	Mendoza	2457
29297	Minatitlan	2457
29298	Misantla	2457
29299	Monte Blanco	2457
29300	Moralillo	2457
29301	Motzorongo	2457
29302	Mundo Nuevo	2457
29303	Nanchital	2457
29304	Naolinco	2457
29305	Naranjos	2457
29306	Nautla	2457
29307	Nogales	2457
29308	Oluta	2457
29309	Omealca	2457
29310	Orizaba	2457
29311	Otatitlan	2457
29312	Oteapan	2457
29313	Ozuluama	2457
29314	Pajapan	2457
29315	Palmira	2457
29316	Panuco	2457
29317	Papantla	2457
29318	Paraje Nuevo	2457
29319	Paso de Ovejas	2457
29320	Paso del Macho	2457
29321	Paso del Toro	2457
29322	Penuela	2457
29323	Perote	2457
29324	Piedras Negras	2457
29325	Plan de Ayala	2457
29326	Platon Sanchez	2457
29327	Playa Vicente	2457
29328	Potrero Nuevo	2457
29329	Potrero del Llano	2457
29330	Poza Rica	2457
29331	Puntilla Aldama	2457
29332	Rafael Delgado	2457
29333	Rafael Lucio	2457
29334	Rinconada	2457
29335	Saltabarranca	2457
29336	San Juan Evangelista	2457
29337	San Marcos	2457
29338	San Rafael	2457
29339	San Roman	2457
29340	Santiago Tuxtla	2457
29341	Sayula	2457
29342	Soconusco	2457
29343	Soledad	2457
29344	Soteapan	2457
29345	Tamalin	2457
29346	Tamiahua	2457
29347	Tantoyuca	2457
29348	Tatahuicapan	2457
29349	Tecolutla	2457
29350	Tempoal	2457
29351	Tenango de Rio Blanco	2457
29352	Teocelo	2457
29353	Tepetzintla	2457
29354	Tequila	2457
29355	Tetelzingo	2457
29356	Texistepec	2457
29357	Tezonapa	2457
29358	Tierra Blanca	2457
29359	Tihuatlan	2457
29360	Tlacojalpan	2457
29361	Tlacotalpan	2457
29362	Tlaltetela	2457
29363	Tlapacoyan	2457
29364	Tocuila	2457
29365	Tomatlan	2457
29366	Totolapa	2457
29367	Totula	2457
29368	Tres Valles	2457
29369	Tuxpam	2457
29370	Tuxtla	2457
29371	Tuzamapan	2457
29372	Union y Progreso	2457
29373	Ursulo Galvan	2457
29374	Valente Diaz	2457
29375	Vega de Alatorre	2457
29376	Veracruz	2457
29377	Xalapa	2457
29378	Xico	2457
29379	Xocotla	2457
29380	Yanga	2457
29381	Yecuatla	2457
29382	Zaragoza	2457
29383	Zempoala	2457
29384	Zongolica	2457
29385	Zozocolco	2457
29386	Acanceh	2458
29387	Akil	2458
29388	Baca	2458
29389	Buctzotz	2458
29390	Cacalchen	2458
29391	Cansahcab	2458
29392	Caucel	2458
29393	Celestun	2458
29394	Cenotillo	2458
29395	Chemax	2458
29396	Chichimila	2458
29397	Chicxulub	2458
29398	Chochola	2458
29399	Cholul	2458
29400	Chumayel	2458
29401	Conkal	2458
29402	Cuzama	2458
29403	Dzan	2458
29404	Dzemul	2458
29405	Dzidzantun	2458
29406	Dzilam Gonzalez	2458
29407	Dzitas	2458
29408	Espita	2458
29409	Halacho	2458
29410	Hocaba	2458
29411	Hoctun	2458
29412	Homun	2458
29413	Huhi	2458
29414	Hunucma	2458
29415	Itzincab	2458
29416	Ixil	2458
29417	Izamal	2458
29418	Kanasin	2458
29419	Kantunil	2458
29420	Kinchil	2458
29421	Mama	2458
29422	Mani	2458
29423	Maxcanu	2458
29424	Merida	2458
29425	Motul	2458
29426	Muna	2458
29427	Opichen	2458
29428	Oxkutzcab	2458
29429	Panaba	2458
29430	Peto	2458
29431	Piste	2458
29432	Progreso	2458
29433	Sacalum	2458
29434	Santa Elena	2458
29435	Seye	2458
29436	Sotuta	2458
29437	Sucila	2458
29438	Tahmek	2458
29439	Teabo	2458
29440	Tecoh	2458
29441	Tekanto	2458
29442	Tekax	2458
29443	Tekit	2458
29444	Telchac	2458
29445	Temax	2458
29446	Temozon	2458
29447	Tetiz	2458
29448	Ticul	2458
29449	Timucuy	2458
29450	Tixkokob	2458
29451	Tixpehual	2458
29452	Tizimin	2458
29453	Tunkas	2458
29454	Tzucacab	2458
29455	Uman	2458
29456	Valladolid	2458
29457	X-Can	2458
29458	Yucatan	2458
29459	Apozol	2459
29460	Banon	2459
29461	Canitas	2459
29462	Chalchihuites	2459
29463	Concepcion del Oro	2459
29464	Cos	2459
29465	Estrada	2459
29466	Fresnillo	2459
29467	Garcia	2459
29468	Gonzalez Ortega	2459
29469	Guadalupe	2459
29470	Hidalgo	2459
29471	Jalpa	2459
29472	Jerez	2459
29473	Juan Aldama	2459
29474	Juchipila	2459
29475	Loreto	2459
29476	Lourdes	2459
29477	Luis Moya	2459
29478	Miguel Auza	2459
29479	Monte Escobedo	2459
29480	Morelos	2459
29481	Natera	2459
29482	Nieves	2459
29483	Nochistlan	2459
29484	Ojo Caliente	2459
29485	Piedra Gorda	2459
29486	Pinos	2459
29487	Plateros	2459
29488	Pozo de Gamboa	2459
29489	Rio Grande	2459
29490	Sain Alto	2459
29491	Sombrerete	2459
29492	Tabasco	2459
29493	Tacoaleche	2459
29494	Tepechitlan	2459
29495	Teul	2459
29496	Tlaltenango	2459
29497	Toribio	2459
29498	Trancoso	2459
29499	Valparaiso	2459
29500	Victor Rosales	2459
29501	Villa Gonzalez Ortega	2459
29502	Villanueva	2459
29503	Zacatecas	2459
29504	Tol	2460
29505	Weno	2460
29506	Lelu	2461
29507	Kolonia	2462
29508	Palikir	2462
29509	Colonia	2463
29510	Balti	2464
29511	Falesti	2464
29512	Glodeni	2464
29513	Rascani	2464
29514	Cahul	2465
29515	Straseni	2466
29516	Straseni	2467
29517	Briceni	2468
29518	Donduseni	2468
29519	Edinet	2468
29520	Ocnita	2468
29521	Ciadar Lunga	2469
29522	Comrat	2469
29523	Vulcanesti	2469
29524	Basarabeasca	2470
29525	Cimislia	2470
29526	Hancesti	2470
29527	Leova	2470
29528	Orhei	2471
29529	Rezina	2471
29530	Telenesti	2471
29531	Drochia	2472
29532	Floresti	2472
29533	Soroca	2472
29534	Taraclia	2473
29535	Causani	2474
29536	Camenca	2475
29537	Dnestrovsc	2475
29538	Dubasari	2475
29539	Griguriopol	2475
29540	Rabnita	2475
29541	Slobozia	2475
29542	Tighina	2475
29543	Tiraspol	2475
29544	Calarasi	2476
29545	Nisporeni	2476
29546	Ungheni	2476
29547	Fontvieille	2477
29548	Monaco-Ville	2479
29549	Cecerleg	2481
29550	Olgij	2482
29551	Bajanhongor	2483
29552	Bulgan	2484
29553	Darhan	2485
29554	Chojbalsan	2486
29555	Sajnshand	2487
29556	Mandalgovi	2488
29557	Altaj	2489
29558	Chojr	2490
29559	Ondorhaan	2491
29560	Hovd	2492
29561	Moron	2493
29562	Dalanzadgad	2494
29563	Erdenet	2495
29564	Arvajheer	2496
29565	Suhbaatar	2497
29566	Zuunharaa	2497
29567	Baruun-Urt	2498
29568	Nalajh	2499
29569	Zuunmod	2499
29570	Ulaanbaatar	2500
29571	Ulaangom	2501
29572	Tosoncengel	2502
29573	Uliastaj	2502
29574	Montserrat	2503
29575	Agadir	2504
29576	Mohammedia	2505
29577	ad-Dar-al-Bayda	2505
29578	Bin Sulayman	2506
29579	Bir Rashid	2506
29580	Bu-al-Jad	2506
29581	Buznika	2506
29582	Khuribghah	2506
29583	Sattat	2506
29584	Wad Zam	2506
29585	Asfi	2507
29586	Azimur	2507
29587	Sidi Binnur	2507
29588	Sidi Ismail	2507
29589	Yussufiyah	2507
29590	al-Jadidah	2507
29591	Fas	2508
29592	Fes	2508
29593	Safru	2508
29594	Ghulimim	2510
29595	Sidi Ifni	2510
29596	Tafraut	2510
29597	Tantan	2510
29598	Kenitra	2511
29599	Amalu Ighriban	2513
29600	Azru	2513
29601	Jamaat-al-Marirt	2513
29602	Khanifrah	2513
29603	Meknes	2513
29604	Midalt	2513
29605	Miknas	2513
29606	Mulay Idris	2513
29607	al-Hajab	2513
29608	ar-Rasidiyah	2513
29609	Ahfir	2514
29610	Bin Ansar	2514
29611	Birkan	2514
29612	Fijij	2514
29613	Jaradah	2514
29614	Tawrirt	2514
29615	Ujdah	2514
29616	Zayu	2514
29617	al-Arwi	2514
29618	al-Ayun Sidi Malluk	2514
29619	an-Nadur	2514
29620	Oujda	2515
29621	Khamissat	2517
29622	Sakhirat	2517
29623	Tiflat	2517
29624	ar-Ribat	2517
29625	Settat	2519
29626	Bani Mallal	2521
29627	Beni Mellal	2521
29628	Qasbat Tadlah	2521
29629	Suq Sabt Awlat Nama	2521
29630	al-Faqih Bin Salah	2521
29631	Asilah	2522
29632	Finidiq	2522
29633	Martil	2522
29634	Midiq	2522
29635	Shifshawn	2522
29636	Tangier	2522
29637	Tanjah	2522
29638	Tittawin	2522
29639	Titwan	2522
29640	al-Araish	2522
29641	al-Qasr-al-Kabir	2522
29642	Chibuto	2527
29643	Chidenguele	2527
29644	Chokwe	2527
29645	Chongoene	2527
29646	Guija	2527
29647	Macia	2527
29648	Manjacaze	2527
29649	Xai-Xai	2527
29650	Homoine	2528
29651	Inhambane	2528
29652	Inharrime	2528
29653	Jangamo	2528
29654	Maxixe	2528
29655	Panda	2528
29656	Quissico	2528
29657	Chimoio	2529
29658	Manica	2529
29659	Maputo	2530
29660	Maputo	2531
29661	Angoche	2532
29662	Lumbo	2532
29663	Mocambique	2532
29664	Nacala	2532
29665	Nampula	2532
29666	Cuamba	2533
29667	Lichinga	2533
29668	Mandimba	2533
29669	Maniamba	2533
29670	Marrupa	2533
29671	Beira	2534
29672	Dondo	2534
29673	Tete	2535
29674	Zumbo	2535
29675	Garue	2536
29676	Mocuba	2536
29677	Quelimane	2536
29678	Bogale	2537
29679	Henzada	2537
29680	Kyaiklat	2537
29681	Labutta	2537
29682	Maubin	2537
29683	Moulmeingyun	2537
29684	Myanaung	2537
29685	Pathein	2537
29686	Pyapon	2537
29687	Wakema	2537
29688	Yandoon	2537
29689	Ye	2537
29690	Bago	2538
29691	Letpadan	2538
29692	Nyaunglebin	2538
29693	Paungde	2538
29694	Pyay	2538
29695	Pyu	2538
29696	Thanatpin	2538
29697	Tharrawaddy	2538
29698	Toungoo	2538
29699	Falam	2539
29700	Banmo	2540
29701	Myitkyina	2540
29702	Loikaw	2541
29703	Hpa-an	2542
29704	Allanmyo	2543
29705	Chauk	2543
29706	Magway	2543
29707	Minbu	2543
29708	Pakokku	2543
29709	Taungdwingyi	2543
29710	Thayetmyo	2543
29711	Yenangyaung	2543
29712	Kyaukse	2544
29713	Mandalay	2544
29714	Maymyo	2544
29715	Meiktila	2544
29716	Mogok	2544
29717	Myingyan	2544
29718	Pyinmana	2544
29719	Yamethin	2544
29720	Kyaikkami	2545
29721	Kyaikto	2545
29722	Martaban	2545
29723	Mawlamyine	2545
29724	Mudon	2545
29725	Thaton	2545
29726	Akyab	2547
29727	Arakan	2547
29728	Kalay	2548
29729	Katha	2548
29730	Mawlaik	2548
29731	Monywa	2548
29732	Sagaing	2548
29733	Shwebo	2548
29734	Keng Tung	2549
29735	Lashio	2549
29736	Taunggyi	2549
29737	Dawei	2550
29738	Mergui	2550
29739	Kanbe	2551
29740	Kayan	2551
29741	Syriam	2551
29742	Thongwa	2551
29743	Twante	2551
29744	Yangon	2551
29745	Katima Mulilo	2552
29746	Henties Bay	2553
29747	Karibib	2553
29748	Kuisebmond	2553
29749	Omaruru	2553
29750	Otjimbingwe	2553
29751	Swakopmund	2553
29752	Usakos	2553
29753	Walvis Bay	2553
29754	Aranos	2554
29755	Maltahohe	2554
29756	Mariental	2554
29757	Rehoboth	2554
29758	Bethanien	2555
29759	Karasburg	2555
29760	Keetmanshoop	2555
29761	Luderitz	2555
29762	Oranjemund	2555
29763	Warmbad	2555
29764	Rundu	2556
29765	Windhoek	2557
29766	Arandis	2558
29767	Khorixas	2558
29768	Opuwo	2558
29769	Outjo	2558
29770	Oshikango	2559
29771	Gobabis	2560
29772	Leonardville	2560
29773	Ongandjera	2561
29774	Ongwediva	2562
29775	Oshakati	2562
29776	Ondangwa	2563
29777	Otavi	2563
29778	Tsumeb	2563
29779	Grootfontein	2564
29780	Okahandja	2564
29781	Okakarara	2564
29782	Otjiwarongo	2564
29783	Yaren	2565
29784	Banepa	2566
29785	Bhaktapur	2566
29786	Bidur	2566
29787	Bishalter	2566
29788	Dhulikhel	2566
29789	Kathmandu	2566
29790	Kirtipur	2566
29791	Lalitpur	2566
29792	Madhyapur Thimi	2566
29793	Panauti	2566
29794	Tribuvannagar	2566
29795	Birendranagar	2567
29796	Gulariya	2567
29797	Narayan	2567
29798	Nepalganj	2567
29799	Surkhet	2567
29800	Baglung	2568
29801	Weni	2568
29802	Byas	2569
29803	Leknath	2569
29804	Pokhara	2569
29805	Prithivinarayan	2569
29806	Putalibazar	2569
29807	Waling	2569
29808	Bhimeshwar	2570
29809	Jaleshwar	2570
29810	Janakpur	2570
29811	Kamalamai	2570
29812	Malangwa	2570
29813	Sinduli Marhi	2570
29814	Jumla	2571
29815	Biratnagar	2572
29816	Dhankuta	2572
29817	Dharan	2572
29818	Inaruwa	2572
29819	Itahari	2572
29820	Khandbari	2572
29821	Butwal	2573
29822	Kapilwastu	2573
29823	Ramgram	2573
29824	Sidharthanagar	2573
29825	Tansen	2573
29826	Wahadurganj	2573
29827	Amargadhi	2574
29828	Dashrathchand	2574
29829	Mahendranagar	2574
29830	Bhadrapur	2575
29831	Damak	2575
29832	Ilam	2575
29833	Mechinagar	2575
29834	Bharatpur	2576
29835	Birganj	2576
29836	Chitwan	2576
29837	Gaur	2576
29838	Hetauda	2576
29839	Kalaiya	2576
29840	Ratnanagar	2576
29841	Salyan	2577
29842	Tulsipur	2577
29843	Lahan	2578
29844	Rajbiraj	2578
29845	Siraha	2578
29846	Triyuga	2578
29847	Dhangadi	2579
29848	Dipayal	2579
29849	Tikapur	2579
29850	Kralendijk	2580
29851	Curacao	2581
29852	Willemstad	2581
29853	The Bottom	2582
29854	SchipolRijk	2585
29855	Amstelveen	2586
29856	Aa en Hunze	2587
29857	Assen	2587
29858	Borger-Odoorn	2587
29859	Coevorden	2587
29860	De Wolden	2587
29861	Den Oever	2587
29862	Emmen	2587
29863	Gasteren	2587
29864	Hoogeveen	2587
29865	Menterwolde	2587
29866	Meppel	2587
29867	Midden-Drenthe	2587
29868	Noordenveld	2587
29869	Stadskanaal	2587
29870	Tynaarlo	2587
29871	Veenoord	2587
29872	Westerveld	2587
29873	Zuidlaren	2587
29874	Almere	2588
29875	Dronten	2588
29876	Lelystad	2588
29877	Noordoostpolder	2588
29878	Urk	2588
29879	Zeewolde	2588
29880	Achtkarspelen	2589
29881	Ameland	2589
29882	Boarnsterhim	2589
29883	Bolsward	2589
29884	Dantumadeel	2589
29885	Dongeradeel	2589
29886	Drachten	2589
29887	Ferwerderadiel	2589
29888	Franekeradeel	2589
29889	Gaasterlan-Sleat	2589
29890	Gorredijk	2589
29891	Harlingen	2589
29892	Heerenveen	2589
29893	Het Bildt	2589
29894	Kollumerland	2589
29895	Leeuwarden	2589
29896	Leeuwarderadeel	2589
29897	Lemsterland	2589
29898	Littenseradiel	2589
29899	Menaldumadeel	2589
29900	Nijefurd	2589
29901	Oostrum	2589
29902	Ooststellingwerf	2589
29903	Opsterland	2589
29904	Schiermonnikoog	2589
29905	Skasterlan	2589
29906	Smallingerland	2589
29907	Sneek	2589
29908	Terschelling	2589
29909	Tytsjerksteradiel	2589
29910	Ureterp	2589
29911	Weststellingwerf	2589
29912	Wolvega	2589
29913	Wunseradiel	2589
29914	Wymbritseradiel	2589
29915	Aalten	2590
29916	Angerlo	2590
29917	Apeldoorn	2590
29918	Appeldoorn	2590
29919	Arnhem	2590
29920	Barneveld	2590
29921	Bemmel	2590
29922	Bergh	2590
29923	Beuningen	2590
29924	Borculo	2590
29925	Brummen	2590
29926	Buren	2590
29927	Culemborg	2590
29928	Delden	2590
29929	Didam	2590
29930	Dieren	2590
29931	Dinxperlo	2590
29932	Dodewaard	2590
29933	Doesburg	2590
29934	Doetinchem	2590
29935	Druten	2590
29936	Duiven	2590
29937	Ede	2590
29938	Eerbeek	2590
29939	Eibergen	2590
29940	Elburg	2590
29941	Epe	2590
29942	Ermelo	2590
29943	Geldermalsen	2590
29944	Gendringen	2590
29945	Giesbeek	2590
29946	Gorssel	2590
29947	Groenlo	2590
29948	Groesbeek	2590
29949	Harderwijk	2590
29950	Hattem	2590
29951	Heerde	2590
29952	Hengelo	2590
29953	Heumen	2590
29954	Huisen	2590
29955	Hummelo en Keppel	2590
29956	Kesteren	2590
29957	Kootwijkerbroek	2590
29958	Leerdam	2590
29959	Leeuwen	2590
29960	Lichtenvoorde	2590
29961	Lingewaal	2590
29962	Lochem	2590
29963	Loppersum	2590
29964	Maasdriel	2590
29965	Malden	2590
29966	Millingen	2590
29967	Molenhoek	2590
29968	Neede	2590
29969	Neerijnen	2590
29970	Nijkerk	2590
29971	Nijmegen	2590
29972	Nunspeet	2590
29973	Oldebroek	2590
29974	Oosterbeek	2590
29975	Overbetuwe	2590
29976	Putten	2590
29977	Renkum	2590
29978	Rheden	2590
29979	Rijnwaarden	2590
29980	Rozendaal	2590
29981	Ruurlo	2590
29982	Scherpenzeel	2590
29983	Steenderen	2590
29984	Terborg	2590
29985	Tiel	2590
29986	Twello	2590
29987	Ubbergen	2590
29988	Vaassen	2590
29989	Varsseveld	2590
29990	Voorst	2590
29991	Vorden	2590
29992	Waardenburg	2590
29993	Wageningen	2590
29994	Warmsveld	2590
29995	Wehl	2590
29996	Westervoort	2590
29997	Wijchen	2590
29998	Winterswijk	2590
29999	Wisch	2590
30000	Zaltbommel	2590
30001	Zelhem	2590
30002	Zevenaar	2590
30003	Zutphen	2590
30004	s-Heerenberg	2590
30005	Appingedam	2591
30006	Bedum	2591
30007	Bellingwedde	2591
30008	De Marne	2591
30009	Delfzijl	2591
30010	Eemsmond	2591
30011	Groningen	2591
30012	Grootegast	2591
30013	Haren	2591
30014	Hoogezand-Sappemeer	2591
30015	Leek	2591
30016	Marum	2591
30017	Midwolda	2591
30018	Muntendam	2591
30019	Pekela	2591
30020	Reiderland	2591
30021	Scheemda	2591
30022	Slochteren	2591
30023	Ten Boer	2591
30024	Tolbert	2591
30025	Veendam	2591
30026	Vlagtwedde	2591
30027	Winschoten	2591
30028	Winsum	2591
30029	Zuidhorn	2591
30030	Ambt Montfort	2592
30031	Arcen en Velden	2592
30032	Beek	2592
30033	Beesel	2592
30034	Bergen	2592
30035	Blerick	2592
30036	Brunssum	2592
30037	Echt	2592
30038	Eijsden	2592
30039	Gennep	2592
30040	Gulpen-Wittem	2592
30041	Haelen	2592
30042	Heel	2592
30043	Heerlen	2592
30044	Helden	2592
30045	Heythuysen	2592
30046	Horst	2592
30047	Hunsel	2592
30048	Kerkrade	2592
30049	Kessel	2592
30050	Landgraaf	2592
30051	Maasbracht	2592
30052	Maasbree	2592
30053	Maastricht	2592
30054	Margraten	2592
30055	Meerlo-Wanssum	2592
30056	Meerssen	2592
30057	Meijel	2592
30058	Mook en Middelaar	2592
30059	Nederweert	2592
30060	Nuth	2592
30061	Onderbanken	2592
30062	Roerdalen	2592
30063	Roermond	2592
30064	Roggel	2592
30065	Roggel en Neer	2592
30066	Schinnen	2592
30067	Sevenum	2592
30068	Simpelveld	2592
30069	Sittard	2592
30070	Sittard-Geleen	2592
30071	Stein	2592
30072	Stramproy	2592
30073	Susteren	2592
30074	Swalmen	2592
30075	Tegelen	2592
30076	Thorn	2592
30077	Vaals	2592
30078	Valkenburg	2592
30079	Venlo	2592
30080	Venray	2592
30081	Vilt Limburg	2592
30082	Voerendaal	2592
30083	Weert	2592
30084	s-Hertogenbosch	2593
30085	Aalburg	2593
30086	Alphen-Chaam	2593
30087	Asten	2593
30088	Baarle-Nassau	2593
30089	Bergeijk	2593
30090	Bergen op Zoom	2593
30091	Berghem	2593
30092	Bernheze	2593
30093	Bernisse	2593
30094	Best	2593
30095	Bladel	2593
30096	Boekel	2593
30097	Boxmeer	2593
30098	Boxtel	2593
30099	Breda	2593
30100	Budel	2593
30101	Cranendonck	2593
30102	Cuijk	2593
30103	Den Bosch	2593
30104	Den Dungen	2593
30105	Deurne	2593
30106	Dongen	2593
30107	Drimmelen	2593
30108	Drunen	2593
30109	Duizel	2593
30110	Eersel	2593
30111	Eindhoven	2593
30112	Etten-Leur	2593
30113	Geertruidenberg	2593
30114	Geldrop	2593
30115	Gemert-Bakel	2593
30116	Gilze en Rijen	2593
30117	Goirle	2593
30118	Grave	2593
30119	Haaren	2593
30120	Halderberge	2593
30121	Heeze-Leende	2593
30122	Heijningen	2593
30123	Helmond	2593
30124	Heusden	2593
30125	Hilvarenbeek	2593
30126	Hoeven	2593
30127	Hoogerheide	2593
30128	Kaatsheuvel	2593
30129	Korendijk	2593
30130	Laarbeek	2593
30131	Landerd	2593
30132	Lith	2593
30133	Loon op Zand	2593
30134	Maarheeze	2593
30135	Maasdonk	2593
30136	Mierlo	2593
30137	Mill en Sint Hubert	2593
30138	Moerdijk	2593
30139	Nieuwkuijk	2593
30140	Nuenen	2593
30141	Oirschot	2593
30142	Oisterwijk	2593
30143	Oosterhout	2593
30144	Oss	2593
30145	Raamsdonksveer	2593
30146	Ravenstein	2593
30147	Reusel-De Mierden	2593
30148	Roosendaal	2593
30149	Rosmalen	2593
30150	Rucphen	2593
30151	Schaijk	2593
30152	Schijndel	2593
30153	Sint Anthonis	2593
30154	Sint Willebrord	2593
30155	Sint-Michielsgestel	2593
30156	Sint-Oedenrode	2593
30157	Sleeuwijk	2593
30158	Someren	2593
30159	Son en Breugel	2593
30160	Steenbergen	2593
30161	Tilburg	2593
30162	Uden	2593
30163	Valkenswaard	2593
30164	Veghel	2593
30165	Veldhoven	2593
30166	Vinkel	2593
30167	Vught	2593
30168	Waalre	2593
30169	Waalwijk	2593
30170	Werkendam	2593
30171	Woensdrecht	2593
30172	Woudrichem	2593
30173	Zundert	2593
30174	Aalsmeer	2594
30175	Alkmaar	2594
30176	Amstelveen	2594
30177	Amsterdam	2594
30178	Andijk	2594
30179	Ankeveen	2594
30180	Anna Paulowna	2594
30181	Assendelft	2594
30182	Badhoevedorp	2594
30183	Beemster	2594
30184	Bennebroek	2594
30185	Bergen	2594
30186	Beverwijk	2594
30187	Blaricum	2594
30188	Bloemendaal	2594
30189	Bovenkarspel	2594
30190	Bussum	2594
30191	Castricum	2594
30192	Den Helder	2594
30193	Diemen	2594
30194	Drechterland	2594
30195	Edam-Volendam	2594
30196	Enkhuizen	2594
30197	Graft-De Rijp	2594
30198	Haarlem	2594
30199	Haarlemmerliede	2594
30200	Haarlemmermeer	2594
30201	Harenkarspel	2594
30202	Heemskerk	2594
30203	Heemstede	2594
30204	Heerhugowaard	2594
30205	Heiloo	2594
30206	Hillegom	2594
30207	Hilversum	2594
30208	Hoofddorp	2594
30209	Hoorn	2594
30210	Huizen	2594
30211	Ijmuiden	2594
30212	Katwijk	2594
30213	Krommenie	2594
30214	Landsmeer	2594
30215	Langedijk	2594
30216	Laren	2594
30217	Loosdrecht	2594
30218	Medemblik	2594
30219	Middenbeemster	2594
30220	Muiden	2594
30221	Naarden	2594
30222	Niedorp	2594
30223	Nieuw-Vennep	2594
30224	Noorder-Koggenland	2594
30225	Obdam	2594
30226	Oostzaan	2594
30227	Opmeer	2594
30228	Oude Meer	2594
30229	Ouder-Amstel	2594
30230	Oudkarspel	2594
30231	Purmerend	2594
30232	Rozenburg	2594
30233	Schagen	2594
30234	Schermer	2594
30235	Stede Broec	2594
30236	Texel	2594
30237	Tuitjenhorn	2594
30238	Uitgeest	2594
30239	Uithoorn	2594
30240	Velsen	2594
30241	Venhuizen	2594
30242	Vijfhuizen	2594
30243	Waarland	2594
30244	Waterland	2594
30245	Weesp	2594
30246	Wervershoof	2594
30247	Wester-Koggenland	2594
30248	Westwoud	2594
30249	Wieringen	2594
30250	Wieringermeer	2594
30251	Wognum	2594
30252	Wormer	2594
30253	Wormerland	2594
30254	Wormerveer	2594
30255	Zaandam	2594
30256	Zaanstad	2594
30257	Zandvoort	2594
30258	Zeevang	2594
30259	Zwaag	2594
30260	Zwanenburg	2594
30261	Almelo	2595
30262	Bathmen	2595
30263	Borne	2595
30264	Dalfsen	2595
30265	Dedemsvaart	2595
30266	Denekamp	2595
30267	Deventer	2595
30268	Diepenheim	2595
30269	Enschede	2595
30270	Genemuiden	2595
30271	Haaksbergen	2595
30272	Hardenberg	2595
30273	Hasselt	2595
30274	Hellendoorn	2595
30275	Hengelo	2595
30276	Hof van Twente	2595
30277	IJsselmuiden	2595
30278	Kampen	2595
30279	Lemelerveld	2595
30280	Losser	2595
30281	Nieuwleusen	2595
30282	Nijverdal	2595
30283	Oldenzaal	2595
30284	Olst	2595
30285	Ommen	2595
30286	Ootmarsum	2595
30287	Raalte	2595
30288	Rijssen	2595
30289	Staphorst	2595
30290	Steenwijk	2595
30291	Tubbergen	2595
30292	Vriezenveen	2595
30293	Vroomshoop	2595
30294	Weerselo	2595
30295	Wierden	2595
30296	Zwartewaterland	2595
30297	Zwolle	2595
30298	Abcoude	2597
30299	Amerongen	2597
30300	Amersfoort	2597
30301	Baarn	2597
30302	Benschop	2597
30303	Breukelen	2597
30304	Bunnik	2597
30305	Bunschoten	2597
30306	De Bilt	2597
30307	De Ronde Venen	2597
30308	Den Dolder	2597
30309	Doorn	2597
30310	Driebergen-Rijsenburg	2597
30311	Eemnes	2597
30312	Houten	2597
30313	IJsselstein	2597
30314	Kockengen	2597
30315	Leersum	2597
30316	Leusden	2597
30317	Loenen	2597
30318	Lopik	2597
30319	Maarn	2597
30320	Maarsen	2597
30321	Mijdrecht	2597
30322	Montfoort	2597
30323	Nieuwegein	2597
30324	Nigtevecht	2597
30325	Odijk	2597
30326	Oudewater	2597
30327	Renswoude	2597
30328	Rhenen	2597
30329	Soest	2597
30330	Soesterberg	2597
30331	Utrecht	2597
30332	Veenendaal	2597
30333	Vianen	2597
30334	Wijdemeren	2597
30335	Wijk	2597
30336	Wilnis	2597
30337	Woerden	2597
30338	Woudenberg	2597
30339	Zeist	2597
30340	Axel	2598
30341	Borsele	2598
30342	Goes	2598
30343	Hontenisse	2598
30344	Hulst	2598
30345	Kapelle	2598
30346	Middelburg	2598
30347	Noord-Beveland	2598
30348	Oostburg	2598
30349	Reimerswaal	2598
30350	Sas van Gent	2598
30351	Schouwen-Duiveland	2598
30352	Sluis-Aardenburg	2598
30353	Terneuzen	2598
30354	Tholen	2598
30355	Veere	2598
30356	Vlissingen	2598
30357	Zierikzee	2598
30358	Zijpe	2598
30359	s-Gravendeel	2599
30360	s-Gravenhage	2599
30361	s-Gravenzande	2599
30362	Alblasserdam	2599
30363	Albrandswaard	2599
30364	Alkemade	2599
30365	Alphen	2599
30366	Alphen aan den Rijn	2599
30367	Barendrecht	2599
30368	Bergambacht	2599
30369	Bergschenhoek	2599
30370	Berkel en Rodenrijs	2599
30371	Binnenmaas	2599
30372	Bleiswijk	2599
30373	Bodegraven	2599
30374	Boskoop	2599
30375	Brielle	2599
30376	Capelle	2599
30377	Cromstrijen	2599
30378	De Lier	2599
30379	Delft	2599
30380	Dirksland	2599
30381	Dordrecht	2599
30382	Giessenlanden	2599
30383	Goedereede	2599
30384	Gorinchem	2599
30385	Gouda	2599
30386	Graafstroom	2599
30387	Hardinxveld-Giessendam	2599
30388	Heerjansdam	2599
30389	Hellevoetsluis	2599
30390	Hendrik-Ido-Ambacht	2599
30391	Jacobswoude	2599
30392	Katwijk	2599
30393	Kinderdijk	2599
30394	Krimpen	2599
30395	Leiden	2599
30396	Leiderdorp	2599
30397	Leidschendam-Voorburg	2599
30398	Liemeer	2599
30399	Liesveld	2599
30400	Lisse	2599
30401	Maasland	2599
30402	Maassluis	2599
30403	Middelharnis	2599
30404	Monster	2599
30405	Moordrecht	2599
30406	Naaldwijk	2599
30407	Nederlek	2599
30408	Nieuw-Lekkerland	2599
30409	Nieuwekerk aan den IJssel	2599
30410	Nieuwkoop	2599
30411	Noordwijk	2599
30412	Noordwijkerhout	2599
30413	Oegestgeest	2599
30414	Oostflakkee	2599
30415	Oud-Beijerland	2599
30416	Ouderkerk	2599
30417	Papendrecht	2599
30418	Pijnacker-Nootdorp	2599
30419	Reeuwijk	2599
30420	Ridderkerk	2599
30421	Rijnsburg	2599
30422	Rijnwoude	2599
30423	Rijswijk	2599
30424	Rotterdam	2599
30425	Sassenheim	2599
30426	Schiedam	2599
30427	Schipluiden	2599
30428	Schoonhoven	2599
30429	Sliedrecht	2599
30430	Spijkenisse	2599
30431	Strijen	2599
30432	Ter Aar	2599
30433	The Hague	2599
30434	Valkenburg	2599
30435	Vierpolders	2599
30436	Vlaardingen	2599
30437	Vlist	2599
30438	Voorhout	2599
30439	Voorschoten	2599
30440	Waddinxveen	2599
30441	Warmond	2599
30442	Wassenaar	2599
30443	Wateringen	2599
30444	West Maas en Waal	2599
30445	Westvoorne	2599
30446	Zederik	2599
30447	Zevenhuizen-Moerkapelle	2599
30448	Zoetermeer	2599
30449	Zoeterwoude	2599
30450	Zwijndrecht	2599
30451	Belep	2600
30452	Fayaoue	2600
30453	Tadine	2600
30454	Vao	2600
30455	We	2600
30456	Canala	2601
30457	Hienghene	2601
30458	Houailu	2601
30459	Kaala Gomen	2601
30460	Kone	2601
30461	Koumac	2601
30462	Ouegoa	2601
30463	Poindimie	2601
30464	Ponerihouen	2601
30465	Pouebo	2601
30466	Pouembout	2601
30467	Poum	2601
30468	Poya	2601
30469	Touho	2601
30470	Voh	2601
30471	Bouloupari	2602
30472	Bourail	2602
30473	Dumbea	2602
30474	Farino	2602
30475	La Foa	2602
30476	Moindou	2602
30477	Mont-Dore	2602
30478	Noumea	2602
30479	Paita	2602
30480	Sarramea	2602
30481	Thio	2602
30482	Yate	2602
30483	Auckland	2604
30484	Helensville	2604
30485	Henderson	2604
30486	Hillsborough	2604
30487	Lynfield	2604
30488	Manukau	2604
30489	Manurewa	2604
30490	Mt. Roskill	2604
30491	North Shore	2604
30492	Onehunga	2604
30493	Orewa	2604
30494	Otahuhu	2604
30495	Panmure	2604
30496	Papakura	2604
30497	Papatoetoe	2604
30498	Ponsonby	2604
30499	Royal Oak	2604
30500	Sandringham	2604
30501	Snells Beach	2604
30502	Takanini	2604
30503	Waiheke	2604
30504	Waitakere	2604
30505	Amberley	2606
30506	Ashburton	2606
30507	Christchurch	2606
30508	Fairlie	2606
30509	Geraldine	2606
30510	Kaikoura	2606
30511	Leeston	2606
30512	Lyttelton	2606
30513	Oamaru	2606
30514	Rangiora	2606
30515	Temuka	2606
30516	Timaru	2606
30517	Waimate	2606
30518	Gisborne	2608
30519	Dannevirke	2610
30520	Feilding	2610
30521	Foxton	2610
30522	Levin	2610
30523	Marton	2610
30524	Palmerston North	2610
30525	Picton	2610
30526	Taumarunui	2610
30527	Wanganui	2610
30528	Blenheim	2611
30529	Havelock	2611
30530	Nelson	2612
30531	Dargaville	2613
30532	Kaikohe	2613
30533	Kaitaia	2613
30534	Kerikeri	2613
30535	Maungatapere	2613
30536	Whangarei	2613
30537	Alexandra	2614
30538	Balclutha	2614
30539	Dunedin	2614
30540	Queenstown	2614
30541	Wanaka	2614
30542	Warkworth	2615
30543	Gore	2616
30544	Invercargill	2616
30545	Eltham	2617
30546	Hawera	2617
30547	Inglewood	2617
30548	New Plymouth	2617
30549	Oakura	2617
30550	Stratford	2617
30551	Waitara	2617
30552	Motueka	2618
30553	Richmond	2618
30554	Cambridge	2619
30555	Coromandel	2619
30556	Hamilton	2619
30557	Hillcrest	2619
30558	Huntly	2619
30559	Matamata	2619
30560	Morrinsville	2619
30561	Ngaruawahia	2619
30562	Otorohanga	2619
30563	Paeroa	2619
30564	Pukekohe	2619
30565	Putaruru	2619
30566	Taupo	2619
30567	Te Aroha	2619
30568	Te Awamutu	2619
30569	Te Kuiti	2619
30570	Thames	2619
30571	Tokoroa	2619
30572	Turangi	2619
30573	Waiuku	2619
30574	Whangamata	2619
30575	Whitianga	2619
30576	Carterton	2620
30577	Kapiti	2620
30578	Lower Hutt	2620
30579	Martinborough	2620
30580	Masterton	2620
30581	Otaki	2620
30582	Paraparaumu	2620
30583	Porirua	2620
30584	Upper Hutt	2620
30585	Wairarapa	2620
30586	Wellington	2620
30587	Boaco	2624
30588	Camoapa	2624
30589	San Lorenzo	2624
30590	Diriamba	2625
30591	Dolores	2625
30592	Jinotepe	2625
30593	Masatepe	2625
30594	San Marcos	2625
30595	Santa Teresa	2625
30596	Chichigalpa	2626
30597	Chinandega	2626
30598	Corinto	2626
30599	El Viejo	2626
30600	Puerto Morazan	2626
30601	Somotillo	2626
30602	Acoyapa	2627
30603	Juigalpa	2627
30604	Santo Domingo	2627
30605	Santo Tomas	2627
30606	Villa Sandino	2627
30607	Condega	2628
30608	Esteli	2628
30609	La Trinidad	2628
30610	Diriomo	2629
30611	Granada	2629
30612	Nandaime	2629
30613	Jinotega	2630
30614	Wiwili	2630
30615	El Sauce	2631
30616	La Paz Centro	2631
30617	Larreynaga	2631
30618	Leon	2631
30619	Nagarote	2631
30620	Telica	2631
30621	Somoto	2632
30622	Managua	2633
30623	Mateare	2633
30624	San Rafael del Sur	2633
30625	Ticuantepe	2633
30626	Tipitapa	2633
30627	La Concepcion	2634
30628	Masaya	2634
30629	Nandasmo	2634
30630	Nindiri	2634
30631	Niquinohomo	2634
30632	Ciudad Dario	2635
30633	Esquipulas	2635
30634	Matagalpa	2635
30635	Matiguas	2635
30636	Rio Blanco	2635
30637	San Isidro	2635
30638	Sebaco	2635
30639	Belen	2638
30640	Rivas	2638
30641	San Jorge	2638
30642	San Juan del Sur	2638
30643	Agadez	2639
30644	Arlit	2639
30645	Bilma	2639
30646	Fachi	2639
30647	Ingall	2639
30648	Tchirozerine	2639
30649	Diffa	2640
30650	Maine-Soroa	2640
30651	NGuigmi	2640
30652	Birni NGaoure	2641
30653	Boboye	2641
30654	Dogondoutchi	2641
30655	Dosso	2641
30656	Gaya	2641
30657	Loga	2641
30658	Aguie	2642
30659	Dakoro	2642
30660	Gazaoua	2642
30661	Guidan Roumdji	2642
30662	Madarounfa	2642
30663	Maradi	2642
30664	Mayahi	2642
30665	Tessaoua	2642
30666	Tibiri	2642
30667	Niamey	2643
30668	Birni NKonni	2644
30669	Bouza	2644
30670	Illela	2644
30671	Keita	2644
30672	Madaoua	2644
30673	Malbazauzine	2644
30674	Tahoua	2644
30675	Tchintabaraden	2644
30676	Ayorou	2645
30677	Filingue	2645
30678	Kollo	2645
30679	Ouallam	2645
30680	Say	2645
30681	Tera	2645
30682	Tillabery	2645
30683	Goure	2646
30684	Kantche	2646
30685	Magaria	2646
30686	Matameye	2646
30687	Mirriah	2646
30688	Tanout	2646
30689	Zinder	2646
30690	Aba	2647
30691	Amaigbo	2647
30692	Arochukwu	2647
30693	Bende	2647
30694	Ohafia	2647
30695	Okwe	2647
30696	Umuahia	2647
30697	Demsa	2649
30698	Ganye	2649
30699	Girei	2649
30700	Gombi	2649
30701	Jada	2649
30702	Jimeta	2649
30703	Lamurde	2649
30704	Madagala	2649
30705	Maiha	2649
30706	Mubi	2649
30707	Ngurore	2649
30708	Numan	2649
30709	Shelleng	2649
30710	Song	2649
30711	Toungo	2649
30712	Yola	2649
30713	Aguata	2651
30714	Agulu	2651
30715	Anambra	2651
30716	Awka	2651
30717	Enugu Ukwu	2651
30718	Igbo Ukwu	2651
30719	Ihiala	2651
30720	Nkpor	2651
30721	Nnewi	2651
30722	Obosi	2651
30723	Okija	2651
30724	Okpoko	2651
30725	Onitsha	2651
30726	Ozubulu	2651
30727	Uga	2651
30728	Alkaleri	2652
30729	Azare	2652
30730	Bauchi	2652
30731	Bogoro	2652
30732	Bununu Dass	2652
30733	Darazo	2652
30734	Gamawa	2652
30735	Ganjuwa	2652
30736	Jamari	2652
30737	Katagum	2652
30738	Misau	2652
30739	Ningi	2652
30740	Tafawa Balewa	2652
30741	Brass	2653
30742	Ekeremor	2653
30743	Nembe	2653
30744	Yenagoa	2653
30745	Aliade	2654
30746	Gboko	2654
30747	Katsina-Ala	2654
30748	Makurdi	2654
30749	Otukpo	2654
30750	Ukum	2654
30751	Zaki Biam	2654
30752	Abadan	2655
30753	Askira	2655
30754	Bama	2655
30755	Biu	2655
30756	Chibok	2655
30757	Damboa	2655
30758	Dikwa	2655
30759	Gamboru	2655
30760	Gubio	2655
30761	Gwoza	2655
30762	Kaga	2655
30763	Kala	2655
30764	Konduga	2655
30765	Kukawa	2655
30766	Mafa	2655
30767	Magumeri	2655
30768	Maiduguri	2655
30769	Marte	2655
30770	Monguno	2655
30771	Ngala	2655
30772	Shani	2655
30773	Agbor	2657
30774	Asaba	2657
30775	Bomadi	2657
30776	Burutu	2657
30777	Okpe	2657
30778	Patani	2657
30779	Sapele	2657
30780	Ughelli	2657
30781	Warri	2657
30782	Abakaliki	2658
30783	Afikpo	2658
30784	Effium	2658
30785	Ezza	2658
30786	Ishieke	2658
30787	Uburu	2658
30788	Auchi	2659
30789	Benin	2659
30790	Ekpoma	2659
30791	Igarra	2659
30792	Ikpoba	2659
30793	Irrua	2659
30794	Sabongida	2659
30795	Ubiaja	2659
30796	Uromi	2659
30797	Ado	2660
30798	Aramoko	2660
30799	Efon Alaye	2660
30800	Emure	2660
30801	Igbara Odo	2660
30802	Igede	2660
30803	Ijero	2660
30804	Ikere	2660
30805	Ikole	2660
30806	Ilawe	2660
30807	Ipoti	2660
30808	Ise	2660
30809	Ode	2660
30810	Omuo	2660
30811	Osi	2660
30812	Agwa	2661
30813	Aku	2661
30814	Awgu	2661
30815	Eha Amufu	2661
30816	Enugu	2661
30817	Enugu Ezike	2661
30818	Enugu Ngwo	2661
30819	Ezeagu	2661
30820	Mberubu	2661
30821	Nsukka	2661
30822	Oji	2661
30823	Udi	2661
30824	Ako	2662
30825	Deba	2662
30826	Duku	2662
30827	Garko	2662
30828	Gombe	2662
30829	Kaltungo	2662
30830	Kumo	2662
30831	Nafada	2662
30832	Pindiga	2662
30833	Aboh	2663
30834	Etiti	2663
30835	Ihite	2663
30836	Nkwerre	2663
30837	Oguta	2663
30838	Okigwe	2663
30839	Owerri	2663
30840	Babura	2664
30841	Birnin Kudu	2664
30842	Buji	2664
30843	Dutse	2664
30844	Garki	2664
30845	Gumel	2664
30846	Gwaram	2664
30847	Gwiwa	2664
30848	Hadejia	2664
30849	Jahun	2664
30850	Kaugama	2664
30851	Kazaure	2664
30852	Keffin Hausa	2664
30853	Kiyawa	2664
30854	Maigatari	2664
30855	Malammaduri	2664
30856	Ringim	2664
30857	Sule Tankarkar	2664
30858	Taura	2664
30859	Birnin Gwari	2665
30860	Doka	2665
30861	Giwa	2665
30862	Gwagwada	2665
30863	Hunkuyi	2665
30864	Igabi	2665
30865	Ikara	2665
30866	Jemaa	2665
30867	Kachia	2665
30868	Kaduna	2665
30869	Kafanchan	2665
30870	Kagarko	2665
30871	Kagoro	2665
30872	Kaura	2665
30873	Kudan	2665
30874	Lere	2665
30875	Makarfi	2665
30876	Sabon Birnin Gwari	2665
30877	Sabongari	2665
30878	Sanga	2665
30879	Soba	2665
30880	Tudun Wada	2665
30881	Zangon Katab	2665
30882	Zaria	2665
30883	Ajingi	2666
30884	Albasu	2666
30885	Bagwai	2666
30886	Bebeji	2666
30887	Bichi	2666
30888	Bunkure	2666
30889	Dambarta	2666
30890	Dawakin Tofe	2666
30891	Fagge	2666
30892	Garko	2666
30893	Garun Mallam	2666
30894	Gaya	2666
30895	Gezawa	2666
30896	Gwarzo	2666
30897	Kabo	2666
30898	Kano	2666
30899	Karaye	2666
30900	Kibiya	2666
30901	Kiru	2666
30902	Kumbotso	2666
30903	Kunchi	2666
30904	Kura	2666
30905	Madobi	2666
30906	Makoda	2666
30907	Nassarawa	2666
30908	Rano	2666
30909	Rimin Gado	2666
30910	Shanono	2666
30911	Sumaila	2666
30912	Takai	2666
30913	Tofa	2666
30914	Tudun Wada	2666
30915	Wudil	2666
30916	Bakori	2667
30917	Batsari	2667
30918	Bindawa	2667
30919	Cheranchi	2667
30920	Dan Dume	2667
30921	Danja	2667
30922	Daura	2667
30923	Dutsi	2667
30924	Dutsin Ma	2667
30925	Faskari	2667
30926	Funtua	2667
30927	Ingawa	2667
30928	Jibiya	2667
30929	Kangiwa	2667
30930	Kankara	2667
30931	Kankiya	2667
30932	Katsina	2667
30933	Kurfi	2667
30934	Malumfashi	2667
30935	Mani	2667
30936	Mashi	2667
30937	Musawa	2667
30938	Rimi	2667
30939	Sandamu	2667
30940	Zango	2667
30941	Argungu	2668
30942	Augie	2668
30943	Bagudo	2668
30944	Birnin Kebbi	2668
30945	Birnin Yauri	2668
30946	Bunza	2668
30947	Fakai	2668
30948	Gwandu	2668
30949	Jega	2668
30950	Kalgo	2668
30951	Koko	2668
30952	Maiyema	2668
30953	Sakaba	2668
30954	Shanga	2668
30955	Suru	2668
30956	Wasagu	2668
30957	Zuru	2668
30958	Ajaokuta	2669
30959	Ankpa	2669
30960	Dekina	2669
30961	Idah	2669
30962	Kabba	2669
30963	Koton-Karifi	2669
30964	Kuroro	2669
30965	Lokoja	2669
30966	Mopa	2669
30967	Ogaminana	2669
30968	Ogori	2669
30969	Okene	2669
30970	Ajasse	2670
30971	Ilorin	2670
30972	Jebba	2670
30973	Kaiama	2670
30974	Lafiagi	2670
30975	Offa	2670
30976	Pategi	2670
30977	Apapa	2671
30978	Badagri	2671
30979	Epe	2671
30980	Ibeju	2671
30981	Iganmi	2671
30982	Ikeja	2671
30983	Ikorodu	2671
30984	Lagos	2671
30985	Ojo	2671
30986	Surulere	2671
30987	Akwanga	2672
30988	Awe	2672
30989	Doma	2672
30990	Keana	2672
30991	Keffi	2672
30992	Lafia	2672
30993	Nassarawa	2672
30994	Obi	2672
30995	Toto	2672
30996	Wamba	2672
30997	Agale	2673
30998	Babana	2673
30999	Bida	2673
31000	Bosso	2673
31001	Chanchaga	2673
31002	Gbako	2673
31003	Kontagora	2673
31004	Lapai	2673
31005	Minna	2673
31006	Mokwa	2673
31007	New Bussa	2673
31008	Rijau	2673
31009	Shiroro	2673
31010	Suleja	2673
31011	Wushishi	2673
31012	Abeokuta	2674
31013	Ado Odo	2674
31014	Agbara	2674
31015	Aiyetoro	2674
31016	Ewekoro	2674
31017	Ifo	2674
31018	Ijebu Igbo	2674
31019	Ijebu Ode	2674
31020	Ikene	2674
31021	Ilaro	2674
31022	Ipokia	2674
31023	Odogbolu	2674
31024	Owode	2674
31025	Sango Ota	2674
31026	Shagamu	2674
31027	Akure	2675
31028	Idanre	2675
31029	Ikare	2675
31030	Irele	2675
31031	Odigbo	2675
31032	Oka	2675
31033	Okitipupa	2675
31034	Ondo	2675
31035	Owo	2675
31036	Apomu	2676
31037	Ede	2676
31038	Ejigbo	2676
31039	Erin-Oshogbo	2676
31040	Gbongan	2676
31041	Ife	2676
31042	Ifon Osun	2676
31043	Ijesha	2676
31044	Ikire	2676
31045	Ikirun	2676
31046	Ila	2676
31047	Ilesha	2676
31048	Ilobu	2676
31049	Inisa	2676
31050	Iwo	2676
31051	Modakeke	2676
31052	Oke-Mesi	2676
31053	Olorunda	2676
31054	Olupona	2676
31055	Ore	2676
31056	Orolu	2676
31057	Oshogbo	2676
31058	Oyan	2676
31059	Akinyele	2677
31060	Egbeda	2677
31061	Eruwa	2677
31062	Fiditi	2677
31063	Ibadan	2677
31064	Ibeto	2677
31065	Igbo Ora	2677
31066	Igboho	2677
31067	Iseyin	2677
31068	Kajola	2677
31069	Kishi	2677
31070	Lalupon	2677
31071	Ogbomosho	2677
31072	Ogo	2677
31073	Oke-Iho	2677
31074	Oyo	2677
31075	Shaki	2677
31076	Barakin	2678
31077	Bassa	2678
31078	Bokkos	2678
31079	Bukuru	2678
31080	Jos	2678
31081	Langtang	2678
31082	Pankshin	2678
31083	Riyom	2678
31084	Shendam	2678
31085	Vom	2678
31086	Wase	2678
31087	Abonnema	2679
31088	Abua	2679
31089	Ahoada	2679
31090	Bonny	2679
31091	Bugama	2679
31092	Degema	2679
31093	Egbema	2679
31094	Ogu	2679
31095	Okrika	2679
31096	Omoko	2679
31097	Opobo	2679
31098	Oyigbo	2679
31099	Port Harcourt	2679
31100	Binji	2680
31101	Bodinga	2680
31102	Dange	2680
31103	Gada	2680
31104	Goronyo	2680
31105	Gwadabawa	2680
31106	Illela	2680
31107	Kebbe	2680
31108	Kware	2680
31109	Rabah	2680
31110	Raka	2680
31111	Sabon Birni	2680
31112	Sokoto	2680
31113	Tambawel	2680
31114	Tureta	2680
31115	Wamako	2680
31116	Wurno	2680
31117	Bali	2681
31118	Gashaka	2681
31119	Gassol	2681
31120	Ibi	2681
31121	Jalingo	2681
31122	Lau	2681
31123	Takum	2681
31124	Wukari	2681
31125	Yorro	2681
31126	Damaturu	2682
31127	Fika	2682
31128	Gashua	2682
31129	Geidam	2682
31130	Gorgoram	2682
31131	Gujba	2682
31132	Gulani	2682
31133	Jakusko	2682
31134	Matsena	2682
31135	Nguru	2682
31136	Potiskum	2682
31137	Yusufari	2682
31138	Anka	2683
31139	Bungudu	2683
31140	Chafe	2683
31141	Gummi	2683
31142	Gusau	2683
31143	Isa	2683
31144	Kaura Namoda	2683
31145	Kiyawa	2683
31146	Maradun	2683
31147	Maru	2683
31148	Shinkafe	2683
31149	Talata Mafara	2683
31150	Zurmi	2683
31151	Niue	2684
31152	Songsong	2687
31153	Capital Hill	2688
31154	Chalan Kanoa	2688
31155	Dandan	2688
31156	Garapan	2688
31157	Gualo Rai	2688
31158	Kagman	2688
31159	Koblerville	2688
31160	San Antonio	2688
31161	San Jose	2688
31162	San Roque	2688
31163	San Vicente	2688
31164	Susupe	2688
31165	Tanapag	2688
31166	San Jose	2689
31167	Asker	2690
31168	Billingstad	2690
31169	Haslum	2690
31170	Hosle	2690
31171	Kjeller	2690
31172	Lillestrom	2690
31173	Lorenskog	2690
31174	Lysaker	2690
31175	LÃƒÂ¸renskog	2690
31176	Rud	2690
31177	Sandvika	2690
31178	Strommen	2690
31179	Kokstad	2692
31180	Drammen	2693
31181	Hokksund	2693
31182	Honefoss	2693
31183	Kongsberg	2693
31184	Lyngdal	2693
31185	NÃƒÂ¦rsnes	2693
31186	Vestby	2693
31187	Baatsfjord	2694
31188	Hammerfest	2694
31189	Brumunddal	2695
31190	Elverum	2695
31191	Hamar	2695
31192	Ilseng	2695
31193	Rena	2695
31194	Trysil	2695
31195	Bergen	2696
31196	HÃƒÂ¸ylandsbygd	2696
31197	Lonevag	2696
31198	Straume	2696
31199	Tysnes	2696
31200	Voss	2696
31201	Bodo	2699
31202	Mosjoen	2699
31203	Narvik	2699
31204	Nesna	2699
31205	Saltdal	2699
31206	Sortland	2699
31207	Steigen	2699
31208	Askim	2700
31209	Fredrikstad	2700
31210	Halden	2700
31211	Hovik	2700
31212	Moss	2700
31213	Mysen	2700
31214	Sarpsborg	2700
31215	Tistedal	2700
31216	Lena	2701
31217	Lillehammer	2701
31218	Oslo	2702
31219	Skedsmo	2702
31220	Skjetten	2702
31221	Egersund	2703
31222	Haugesund	2703
31223	Kleppe	2703
31224	Sandnes	2703
31225	Sola	2703
31226	Stavanger	2703
31227	Stavern	2706
31228	Sykkylven	2707
31229	Notodden	2708
31230	Skien	2708
31231	Harstad	2709
31232	Troms	2709
31233	TromsÃƒÂ¸	2709
31234	Horten	2711
31235	HusÃƒÂ¸ysund	2711
31236	Larvik	2711
31237	Rygge	2711
31238	Sandefjord	2711
31239	TÃƒÂ¸nsberg	2711
31240	Salalah	2714
31241	Azaiba	2715
31242	Bawshar	2715
31243	Madinat Qabus	2715
31244	Masqat	2715
31245	Matrah	2715
31246	Muscat	2715
31247	Muttrah	2715
31248	Qurayyat	2715
31249	Qurm	2715
31250	Ruwi	2715
31251	Wadi Al Kabir	2715
31252	as-Sib	2715
31253	Khasab	2716
31254	Rusayl	2717
31255	Bahla	2719
31256	Nizwa	2719
31257	Sumayl	2719
31258	Ibri	2720
31259	al-Buraymi	2720
31260	Al khuwair	2721
31261	Barkah	2721
31262	Saham	2721
31263	Shinas	2721
31264	Suhar	2721
31265	al-Khaburah	2721
31266	al-Masnaah	2721
31267	ar-Rustaq	2721
31268	as-Suwayq	2721
31269	Ibra	2722
31270	Sur	2722
31271	al-Mudaybi	2722
31272	Barkhan	2723
31273	Bela	2723
31274	Bhag	2723
31275	Chaman	2723
31276	Chitkan	2723
31277	Dalbandin	2723
31278	Dera Allah Yar	2723
31279	Dera Bugti	2723
31280	Dera Murad Jamali	2723
31281	Dhadar	2723
31282	Duki	2723
31283	Gaddani	2723
31284	Gwadar	2723
31285	Harnai	2723
31286	Hub	2723
31287	Jiwani	2723
31288	Kalat	2723
31289	Kharan	2723
31290	Khuzdar	2723
31291	Kohlu	2723
31292	Loralai	2723
31293	Mach	2723
31294	Mastung	2723
31295	Nushki	2723
31296	Ormara	2723
31297	Pasni	2723
31298	Pishin	2723
31299	Quetta	2723
31300	Sibi	2723
31301	Sohbatpur	2723
31302	Surab	2723
31303	Turbat	2723
31304	Usta Muhammad	2723
31305	Uthal	2723
31306	Wadh	2723
31307	Winder	2723
31308	Zehri	2723
31309	Zhob	2723
31310	Ziarat	2723
31311	Abdul Hakim	2728
31312	Ahmadpur East	2728
31313	Ahmadpur Lumma	2728
31314	Ahmadpur Sial	2728
31315	Ahmedabad	2728
31316	Alipur	2728
31317	Alipur Chatha	2728
31318	Arifwala	2728
31319	Attock	2728
31320	Baddomalhi	2728
31321	Bagh	2728
31322	Bahawalnagar	2728
31323	Bahawalpur	2728
31324	Bai Pheru	2728
31325	Basirpur	2728
31326	Begowala	2728
31327	Bhakkar	2728
31328	Bhalwal	2728
31329	Bhawana	2728
31330	Bhera	2728
31331	Bhopalwala	2728
31332	Burewala	2728
31333	Chak Azam Sahu	2728
31334	Chak Jhumra	2728
31335	Chak Sarwar Shahid	2728
31336	Chakwal	2728
31337	Chawinda	2728
31338	Chichawatni	2728
31339	Chiniot	2728
31340	Chishtian Mandi	2728
31341	Choa Saidan Shah	2728
31342	Chuhar Kana	2728
31343	Chunian	2728
31344	Dajal	2728
31345	Darya Khan	2728
31346	Daska	2728
31347	Daud Khel	2728
31348	Daultala	2728
31349	Dera Din Panah	2728
31350	Dera Ghazi Khan	2728
31351	Dhanote	2728
31352	Dhonkal	2728
31353	Dijkot	2728
31354	Dina	2728
31355	Dinga	2728
31356	Dipalpur	2728
31357	Dullewala	2728
31358	Dunga Bunga	2728
31359	Dunyapur	2728
31360	Eminabad	2728
31361	Faisalabad	2728
31362	Faqirwali	2728
31363	Faruka	2728
31364	Fateh Jang	2728
31365	Fatehpur	2728
31366	Fazalpur	2728
31367	Ferozwala	2728
31368	Fort Abbas	2728
31369	Garh Maharaja	2728
31370	Ghakar	2728
31371	Ghurgushti	2728
31372	Gojra	2728
31373	Gujar Khan	2728
31374	Gujranwala	2728
31375	Gujrat	2728
31376	Hadali	2728
31377	Hafizabad	2728
31378	Harnoli	2728
31379	Harunabad	2728
31380	Hasan Abdal	2728
31381	Hasilpur	2728
31382	Haveli	2728
31383	Hazro	2728
31384	Hujra Shah Muqim	2728
31385	Isa Khel	2728
31386	Jahanian	2728
31387	Jalalpur Bhattian	2728
31388	Jalalpur Jattan	2728
31389	Jalalpur Pirwala	2728
31390	Jalla Jeem	2728
31391	Jamke Chima	2728
31392	Jampur	2728
31393	Jand	2728
31394	Jandanwala	2728
31395	Jandiala Sherkhan	2728
31396	Jaranwala	2728
31397	Jatoi	2728
31398	Jauharabad	2728
31399	Jhang	2728
31400	Jhawarian	2728
31401	Jhelum	2728
31402	Kabirwala	2728
31403	Kahna Nau	2728
31404	Kahror Pakka	2728
31405	Kahuta	2728
31406	Kalabagh	2728
31407	Kalaswala	2728
31408	Kaleke	2728
31409	Kalur Kot	2728
31410	Kamalia	2728
31411	Kamar Mashani	2728
31412	Kamir	2728
31413	Kamoke	2728
31414	Kamra	2728
31415	Kanganpur	2728
31416	Karampur	2728
31417	Karor Lal Esan	2728
31418	Kasur	2728
31419	Khairpur Tamewali	2728
31420	Khanewal	2728
31421	Khangah Dogran	2728
31422	Khangarh	2728
31423	Khanpur	2728
31424	Kharian	2728
31425	Khewra	2728
31426	Khundian	2728
31427	Khurianwala	2728
31428	Khushab	2728
31429	Kot Abdul Malik	2728
31430	Kot Addu	2728
31431	Kot Mithan	2728
31432	Kot Moman	2728
31433	Kot Radha Kishan	2728
31434	Kot Samaba	2728
31435	Kotli Loharan	2728
31436	Kundian	2728
31437	Kunjah	2728
31438	Lahore	2728
31439	Lalamusa	2728
31440	Lalian	2728
31441	Liaqatabad	2728
31442	Liaqatpur	2728
31443	Lieah	2728
31444	Liliani	2728
31445	Lodhran	2728
31446	Ludhewala Waraich	2728
31447	Mailsi	2728
31448	Makhdumpur	2728
31449	Makhdumpur Rashid	2728
31450	Malakwal	2728
31451	Mamu Kanjan	2728
31452	Mananwala Jodh Singh	2728
31453	Mandi Bahauddin	2728
31454	Mandi Sadiq Ganj	2728
31455	Mangat	2728
31456	Mangla	2728
31457	Mankera	2728
31458	Mian Channun	2728
31459	Miani	2728
31460	Mianwali	2728
31461	Minchinabad	2728
31462	Mitha Tiwana	2728
31463	Multan	2728
31464	Muridke	2728
31465	Murree	2728
31466	Mustafabad	2728
31467	Muzaffargarh	2728
31468	Nankana Sahib	2728
31469	Narang	2728
31470	Narowal	2728
31471	Noorpur Thal	2728
31472	Nowshera	2728
31473	Nowshera Virkan	2728
31474	Okara	2728
31475	Pakpattan	2728
31476	Pasrur	2728
31477	Pattoki	2728
31478	Phalia	2728
31479	Phularwan	2728
31480	Pind Dadan Khan	2728
31481	Pindi Bhattian	2728
31482	Pindi Gheb	2728
31483	Pirmahal	2728
31484	Qadirabad	2728
31485	Qadirpur Ran	2728
31486	Qila Disar Singh	2728
31487	Qila Sobha Singh	2728
31488	Quaidabad	2728
31489	Rabwah	2728
31490	Rahim Yar Khan	2728
31491	Raiwind	2728
31492	Raja Jang	2728
31493	Rajanpur	2728
31494	Rasulnagar	2728
31495	Rawalpindi	2728
31496	Renala Khurd	2728
31497	Rojhan	2728
31498	Saddar Gogera	2728
31499	Sadiqabad	2728
31500	Safdarabad	2728
31501	Sahiwal	2728
31502	Samasatta	2728
31503	Sambrial	2728
31504	Sammundri	2728
31505	Sangala Hill	2728
31506	Sanjwal	2728
31507	Sarai Alamgir	2728
31508	Sarai Sidhu	2728
31509	Sargodha	2728
31510	Shadiwal	2728
31511	Shahkot	2728
31512	Shahpur City	2728
31513	Shahpur Saddar	2728
31514	Shakargarh	2728
31515	Sharqpur	2728
31516	Shehr Sultan	2728
31517	Shekhupura	2728
31518	Shujaabad	2728
31519	Sialkot	2728
31520	Sillanwali	2728
31521	Sodhra	2728
31522	Sohawa	2728
31523	Sukheke	2728
31524	Talagang	2728
31525	Tandlianwala	2728
31526	Taunsa	2728
31527	Taxila	2728
31528	Tibba Sultanpur	2728
31529	Toba Tek Singh	2728
31530	Tulamba	2728
31531	Uch	2728
31532	Vihari	2728
31533	Wah	2728
31534	Warburton	2728
31535	Wazirabad	2728
31536	Yazman	2728
31537	Zafarwal	2728
31538	Zahir Pir	2728
31539	Adilpur	2729
31540	Badah	2729
31541	Badin	2729
31542	Bagarji	2729
31543	Bakshshapur	2729
31544	Bandhi	2729
31545	Berani	2729
31546	Bhan	2729
31547	Bhiria City	2729
31548	Bhiria Road	2729
31549	Bhit Shah	2729
31550	Bozdar	2729
31551	Bulri	2729
31552	Chak	2729
31553	Chambar	2729
31554	Chohar Jamali	2729
31555	Chor	2729
31556	Dadu	2729
31557	Daharki	2729
31558	Daro	2729
31559	Darya Khan Mari	2729
31560	Daulatpur	2729
31561	Daur	2729
31562	Dhoronaro	2729
31563	Digri	2729
31564	Diplo	2729
31565	Dokri	2729
31566	Faqirabad	2729
31567	Gambat	2729
31568	Garello	2729
31569	Garhi Khairo	2729
31570	Garhi Yasin	2729
31571	Gharo	2729
31572	Ghauspur	2729
31573	Ghotki	2729
31574	Golarchi	2729
31575	Guddu	2729
31576	Gulistan-E-Jauhar	2729
31577	Hala	2729
31578	Hingorja	2729
31579	Hyderabad	2729
31580	Islamkot	2729
31581	Jacobabad	2729
31582	Jam Nawaz Ali	2729
31583	Jam Sahib	2729
31584	Jati	2729
31585	Jhol	2729
31586	Jhudo	2729
31587	Johi	2729
31588	Kadhan	2729
31589	Kambar	2729
31590	Kandhra	2729
31591	Kandiari	2729
31592	Kandiaro	2729
31593	Karachi	2729
31594	Karampur	2729
31595	Kario Ghanwar	2729
31596	Karoondi	2729
31597	Kashmor	2729
31598	Kazi Ahmad	2729
31599	Keti Bandar	2729
31600	Khadro	2729
31601	Khairpur	2729
31602	Khairpur Nathan Shah	2729
31603	Khandh Kot	2729
31604	Khanpur	2729
31605	Khipro	2729
31606	Khoski	2729
31607	Khuhra	2729
31608	Khyber	2729
31609	Kot Diji	2729
31610	Kot Ghulam Mohammad	2729
31611	Kotri	2729
31612	Kumb	2729
31613	Kunri	2729
31614	Lakhi	2729
31615	Larkana	2729
31616	Madeji	2729
31617	Matiari	2729
31618	Matli	2729
31619	Mehar	2729
31620	Mehrabpur	2729
31621	Miro Khan	2729
31622	Mirpur Bathoro	2729
31623	Mirpur Khas	2729
31624	Mirpur Mathelo	2729
31625	Mirpur Sakro	2729
31626	Mirwah	2729
31627	Mithi	2729
31628	Moro	2729
31629	Nabisar	2729
31630	Nasarpur	2729
31631	Nasirabad	2729
31632	Naudero	2729
31633	Naukot	2729
31634	Naushahro Firoz	2729
31635	Nawabshah	2729
31636	Oderolal Station	2729
31637	Pacca Chang	2729
31638	Padidan	2729
31639	Pano Aqil	2729
31640	Perumal	2729
31641	Phulji	2729
31642	Pirjo Goth	2729
31643	Piryaloi	2729
31644	Pithoro	2729
31645	Radhan	2729
31646	Rajo Khanani	2729
31647	Ranipur	2729
31648	Ratodero	2729
31649	Rohri	2729
31650	Rustam	2729
31651	Saeedabad	2729
31652	Sakrand	2729
31653	Samaro	2729
31654	Sanghar	2729
31655	Sann	2729
31656	Sarhari	2729
31657	Sehwan	2729
31658	Setharja	2729
31659	Shah Dipalli	2729
31660	Shahdadkot	2729
31661	Shahdadpur	2729
31662	Shahpur Chakar	2729
31663	Shahpur Jahania	2729
31664	Shikarpur	2729
31665	Sinjhoro	2729
31666	Sita Road	2729
31667	Sobhodero	2729
31668	Sujawal	2729
31669	Sukkur	2729
31670	Talhar	2729
31671	Tando Adam	2729
31672	Tando Allah Yar	2729
31673	Tando Bagho	2729
31674	Tando Ghulam Ali	2729
31675	Tando Jam	2729
31676	Tando Jan Mohammad	2729
31677	Tando Mitha Khan	2729
31678	Tando Muhammad Khan	2729
31679	Tangwani	2729
31680	Thano Bula Khan	2729
31681	Thari Mirwah	2729
31682	Tharushah	2729
31683	Thatta	2729
31684	Ther I	2729
31685	Ther I Mohabat	2729
31686	Thul	2729
31687	Ubauro	2729
31688	Umarkot	2729
31689	Warah	2729
31690	Ulimang	2730
31691	Airai	2731
31692	Ngaramash	2732
31693	Hatohobei	2733
31694	Kayangel	2734
31695	Koror	2735
31696	Meyungs	2735
31697	Melekeok	2736
31698	Ngermechau	2737
31699	Chol	2738
31700	Ollei	2739
31701	Oikul	2740
31702	Ngerkeai	2741
31703	Imeong	2742
31704	Ngetkip	2743
31705	Kloulklubed	2744
31706	Dongosaru	2745
31707	Ariha	2746
31708	Beit Jala	2748
31709	Dayr-al-Balah	2749
31710	al-Burayj	2749
31711	al-Insayrat	2749
31712	al-Maghazi	2749
31713	Ghazzah	2750
31714	Ghazzah	2751
31715	Janin	2752
31716	Qabatiyah	2752
31717	Nabulus	2754
31718	Qalqilyah	2755
31719	Rafah	2756
31720	Tall as-Sultan	2756
31721	Salfit	2758
31722	Tubas	2759
31723	Tulkarm	2760
31724	Dura	2761
31725	Halhul	2761
31726	Yattah	2761
31727	ad-Dahiriyah	2761
31728	al-Khalil	2761
31729	Maale Adummim	2762
31730	al-Quds	2762
31731	Alanje	2764
31732	Bajo Boquete	2764
31733	Boqueron	2764
31734	Bugaba	2764
31735	David	2764
31736	Dolega	2764
31737	Gualaca	2764
31738	Horconcitos	2764
31739	Las Lajas	2764
31740	Puerto Armuelles	2764
31741	Remedios	2764
31742	Rio Sereno	2764
31743	Tole	2764
31744	Aguadulce	2765
31745	Anton	2765
31746	La Pintada	2765
31747	Nata	2765
31748	Ola	2765
31749	Penonome	2765
31750	Colon	2766
31751	Miguel de la Borda	2766
31752	Nuevo Chagres	2766
31753	Portobelo	2766
31754	Santa Isabel	2766
31755	El Real de Santa Maria	2767
31756	La Palma	2767
31757	Cirilo Guainora	2768
31758	Rio Sabalo	2768
31759	Chitre	2769
31760	Las Minas	2769
31761	Los Pozos	2769
31762	Ocu	2769
31763	Parita	2769
31764	Pese	2769
31765	Santa Maria	2769
31766	Arraijan	2773
31767	Capira	2773
31768	Chame	2773
31769	Chepo	2773
31770	Chiman	2773
31771	La Chorrera	2773
31772	Panama	2773
31773	San Carlos	2773
31774	San Miguel	2773
31775	San Miguelito	2773
31776	Taboga	2773
31777	Atalaya	2774
31778	Calobre	2774
31779	Canazas	2774
31780	La Mesa	2774
31781	Las Palmas	2774
31782	Montijo	2774
31783	Rio de Jesus	2774
31784	San Francisco	2774
31785	Santa Fe	2774
31786	Santiago	2774
31787	Sona	2774
31788	Laiagam	2778
31789	Porgera	2778
31790	Wabag	2778
31791	Kerema	2780
31792	Finschhafen	2781
31793	Madang	2781
31794	Lorengau	2782
31795	Bulolo	2784
31796	Lae	2784
31797	Wau	2784
31798	Kokoda	2788
31799	Popondetta	2788
31800	Vanimo	2789
31801	Kundiawa	2790
31802	Bella Vista	2796
31803	Capitan Bado	2796
31804	Pedro Juan Caballero	2796
31805	Asuncion	2797
31806	Doctor Pedro P. Pena	2798
31807	Filadelfia	2798
31808	Marechal Estigarribia	2798
31809	Menno	2798
31810	Neuland	2798
31811	Caaguazu	2799
31812	Carayao	2799
31813	Coronel Oviedo	2799
31814	Doctor Cecilio Baez	2799
31815	Doctor Eulogio Estigarribia	2799
31816	Doctor Juan Manuel Frutos	2799
31817	Jose Ocampos	2799
31818	La Pastoria	2799
31819	Marechal Francisco Solano Lope	2799
31820	Mbutuy	2799
31821	Nueva Londres	2799
31822	Raul Arsenio Oviedo	2799
31823	Repatriacion	2799
31824	San Joaquin	2799
31825	San Jose de los Arroyos	2799
31826	Simon Bolivar	2799
31827	Tres Corrales	2799
31828	Tres de Febrero	2799
31829	Vaqueria	2799
31830	Yhu	2799
31831	Abai	2800
31832	Buena Vista	2800
31833	Caazapa	2800
31834	Doctor Moises Bertoni	2800
31835	General Higinio Morinigo	2800
31836	Maciel	2800
31837	San Juan Nepomuceno	2800
31838	Tavai	2800
31839	Yegros	2800
31840	Yuty	2800
31841	Corpus Christi	2801
31842	Curuguaty	2801
31843	General Francisco Alvarez	2801
31844	Itanara	2801
31845	Katuete	2801
31846	La Paloma	2801
31847	Nueva Esperanza	2801
31848	Salto del Guaira	2801
31849	Ygatimi	2801
31850	Ypehu	2801
31851	Aregua	2802
31852	Capiata	2802
31853	Fernando de la Mora	2802
31854	Guarambare	2802
31855	Ita	2802
31856	Itaugua	2802
31857	Juan Augusto Saldivar	2802
31858	Lambare	2802
31859	Limpio	2802
31860	Luque	2802
31861	Nemby	2802
31862	Nueva Italia	2802
31863	San Antonio	2802
31864	San Lorenzo	2802
31865	Villa Elisa	2802
31866	Villeta	2802
31867	Ypacarai	2802
31868	Ypane	2802
31869	Belen	2803
31870	Concepcion	2803
31871	Horqueta	2803
31872	Loreto	2803
31873	San Carlos	2803
31874	San Lazaro	2803
31875	Altos	2804
31876	Arroyos y Esteros	2804
31877	Atyra	2804
31878	Caacupe	2804
31879	Caraguatay	2804
31880	Emboscada	2804
31881	Eusebio Ayala	2804
31882	Isla Pucu	2804
31883	Itacurubi de la Cordillera	2804
31884	Juan de Mena	2804
31885	Loma Grande	2804
31886	Mbocayty del Yhaguy	2804
31887	Nueva Colombia	2804
31888	Piribebuy	2804
31889	Primero de Marzo	2804
31890	San Bernardino	2804
31891	San Jose Obrero	2804
31892	Santa Elena	2804
31893	Tobati	2804
31894	Valenzuela	2804
31895	Borja	2805
31896	Capitan Mauricio Jose Troche	2805
31897	Coronel Martinez	2805
31898	Doctor Botrell	2805
31899	Felix Perez Cardozo	2805
31900	General Eugenio Alejandrino Ga	2805
31901	Independencia	2805
31902	Itape	2805
31903	Iturbe	2805
31904	Jose Fasardi	2805
31905	Mbocayaty	2805
31906	Natalicio Talavera	2805
31907	Numi	2805
31908	Paso Yobai	2805
31909	San Salvador	2805
31910	Villarrica	2805
31911	Yataity	2805
31912	Alto Vera	2806
31913	Bella Vista	2806
31914	Cambyreta	2806
31915	Capitan Meza	2806
31916	Capitan Miranda	2806
31917	Carlos Antonio Lopez	2806
31918	Carmen del Parana	2806
31919	Coronel Bogado	2806
31920	Edelira	2806
31921	Encarnacion	2806
31922	Fram	2806
31923	General Artigas	2806
31924	General Delgado	2806
31925	Hohenau	2806
31926	Itapua Poty	2806
31927	Jesus	2806
31928	La Paz	2806
31929	Leandro Oviedo	2806
31930	Mayor Otano	2806
31931	Natalio	2806
31932	Nueva Alborada	2806
31933	Obligado	2806
31934	Pirapo	2806
31935	San Cosme y Damian	2806
31936	San Juan del Parana	2806
31937	San Pedro del Parana	2806
31938	San Rafael del Parana	2806
31939	Tomas Romero Pereira	2806
31940	Trinidad	2806
31941	Yatytay	2806
31942	Ayolas	2807
31943	San Ignacio	2807
31944	San Juan Bautista	2807
31945	San Miguel	2807
31946	San Patricio	2807
31947	Santa Maria	2807
31948	Santa Rosa	2807
31949	Santiago	2807
31950	Villa Florida	2807
31951	Yabebyry	2807
31952	Alberdi	2808
31953	Cerrito	2808
31954	Desmochados	2808
31955	General Jose Eduvigis Diaz	2808
31956	Guazu Cua	2808
31957	Humaita	2808
31958	Isla Umbu	2808
31959	Laureles	2808
31960	Mayor Jose Dejesus Martinez	2808
31961	Paso de Patria	2808
31962	Pilar	2808
31963	San Juan Bautista de Neembucu	2808
31964	Tacuaras	2808
31965	Villa Franca	2808
31966	Villa Oliva	2808
31967	Villalbin	2808
31968	Acahay	2809
31969	Caapucu	2809
31970	Carapegua	2809
31971	Escobar	2809
31972	General Bernardino Caballero	2809
31973	La Colmena	2809
31974	Mbuyapey	2809
31975	Paraguari	2809
31976	Pirayu	2809
31977	Quiindy	2809
31978	Quyquyho	2809
31979	San Roque Gonzalez de Santa Cr	2809
31980	Sapucai	2809
31981	Tebicuarymi	2809
31982	Yaguaron	2809
31983	Ybycui	2809
31984	Ybytimi	2809
31985	Bagua Grande	2812
31986	Cajaruro	2812
31987	Chachapoyas	2812
31988	Jazan	2812
31989	La Peca	2812
31990	Ancash	2813
31991	Caraz	2813
31992	Carhuaz	2813
31993	Casma	2813
31994	Chimbote	2813
31995	Choishco	2813
31996	Huallanca	2813
31997	Huaraz	2813
31998	Huari	2813
31999	Huarmey	2813
32000	Pomabamba	2813
32001	Santa	2813
32002	Yungay	2813
32003	Abancay	2814
32004	Andahuaylas	2814
32005	San Jeronimo	2814
32006	Talavera	2814
32007	Acari	2815
32008	Arequipa	2815
32009	Camana	2815
32010	Chivay	2815
32011	Cocachacra	2815
32012	Dean Valdivia	2815
32013	Lluta	2815
32014	Mollendo	2815
32015	Nicolas de Pierola	2815
32016	Orcopampa	2815
32017	Punta de Bombon	2815
32018	Rio Grande	2815
32019	Yura	2815
32020	Ayacucho	2816
32021	Ayna	2816
32022	Coracora	2816
32023	Huanta	2816
32024	Puquio	2816
32025	San Miguel	2816
32026	Santa Rosa	2816
32027	Silvia	2816
32028	Tambo	2816
32029	Bambamarca	2817
32030	Bellavista	2817
32031	Cajabamba	2817
32032	Cajamarca	2817
32033	Celendin	2817
32034	Chota	2817
32035	Cutervo	2817
32036	Jaen	2817
32037	Pedro Galvez	2817
32038	Pucara	2817
32039	San Ignacio	2817
32040	Santa Cruz	2817
32041	Yonan	2817
32042	Anta	2818
32043	Calca	2818
32044	Cusco	2818
32045	Espinar	2818
32046	Oropesa	2818
32047	Quillabamba	2818
32048	Santa Ana	2818
32049	Santo Tomas	2818
32050	Sicuani	2818
32051	Urcos	2818
32052	Urubamba	2818
32053	Huancavelica	2819
32054	Lircay	2819
32055	Pampas	2819
32056	Ambos	2820
32057	Huanuco	2820
32058	Jose Crespo y Castillo	2820
32059	La Union	2820
32060	Llata	2820
32061	Rupa-Rupa	2820
32062	San Miguel de Cauri	2820
32063	Tingo Maria	2820
32064	Chincha Alta	2821
32065	Ica	2821
32066	Los Aquijes	2821
32067	Marcona	2821
32068	Nazca	2821
32069	Pachacutec	2821
32070	Palpa	2821
32071	Pisco	2821
32072	Salas	2821
32073	San Andres	2821
32074	San Clemente	2821
32075	San Juan Bautista	2821
32076	Santiago	2821
32077	Subtanjalla	2821
32078	Tupac Amaru Inca	2821
32079	Vista Alegre	2821
32080	Acobamba	2822
32081	Acolla	2822
32082	Carhuamayo	2822
32083	Chanchamayo	2822
32084	Chupaca	2822
32085	Concepcion	2822
32086	Huancayo	2822
32087	Huasahuasi	2822
32088	Huayucachi	2822
32089	Jauja	2822
32090	Junin	2822
32091	La Oroya	2822
32092	Mazamari	2822
32093	Morococha	2822
32094	Orcotuna	2822
32095	Pangoa	2822
32096	Perene	2822
32097	Pichanaqui	2822
32098	Pilcomayo	2822
32099	San Agustin	2822
32100	San Jeronimo de Tunan	2822
32101	San Pedro de Cajas	2822
32102	San Ramon	2822
32103	Santa Rosa de Saco	2822
32104	Satipo	2822
32105	Sicaya	2822
32106	Tarma	2822
32107	Yauli	2822
32108	Yauya	2822
32109	Chiclayo	2824
32110	Chongoyape	2824
32111	Eten	2824
32112	Ferrenafe	2824
32113	Illimo	2824
32114	Jayanca	2824
32115	Lagunas	2824
32116	Lambayeque	2824
32117	Manuel Mesones Muro	2824
32118	Mochumi	2824
32119	Monsefu	2824
32120	Morrope	2824
32121	Motupe	2824
32122	Olmos	2824
32123	Oyotun	2824
32124	Picsi	2824
32125	Pimentel	2824
32126	Pueblo Nuevo	2824
32127	Reque	2824
32128	San Jose	2824
32129	Sana	2824
32130	Santa Rosa	2824
32131	Tucume	2824
32132	Barranca	2826
32133	Contamana	2826
32134	Fernando Lores	2826
32135	Iquitos	2826
32136	Lagunas	2826
32137	Nauta	2826
32138	Paucarpata	2826
32139	Ramon Castilla	2826
32140	Requena	2826
32141	Saquena	2826
32142	Vargas Guerra	2826
32143	Yurimaguas	2826
32144	Ilo	2828
32145	Moquegua	2828
32146	Pacocha	2828
32147	Torata	2828
32148	Cerro de Pasco	2829
32149	Chaupimarca	2829
32150	Oxapampa	2829
32151	Paucartambo	2829
32152	Simon Bolivar	2829
32153	Tinyahuarco	2829
32154	Villa Rica	2829
32155	Yanacancha	2829
32156	Yanahuanca	2829
32157	Ayabaca	2830
32158	Bernal	2830
32159	Buenos Aires	2830
32160	Catacaos	2830
32161	Chulucanas	2830
32162	Colan	2830
32163	Cura Mori	2830
32164	El Alto	2830
32165	Huancabamba	2830
32166	Ignacio Escudero	2830
32167	La Arena	2830
32168	La Brea	2830
32169	La Huaca	2830
32170	La Matanza	2830
32171	La Union	2830
32172	Las Lomas	2830
32173	Los Organos	2830
32174	Mancora	2830
32175	Marcavelica	2830
32176	Morropon	2830
32177	Paita	2830
32178	Piura	2830
32179	Querecotillo	2830
32180	Salitral	2830
32181	San Juan de Bigote	2830
32182	Sechura	2830
32183	Sullana	2830
32184	Talara	2830
32185	Tamarindo	2830
32186	Tambo Grande	2830
32187	Vice	2830
32188	Vichayal	2830
32189	Ayaviri	2831
32190	Azangaro	2831
32191	Desaguadero	2831
32192	Huancane	2831
32193	Ilave	2831
32194	Juli	2831
32195	Juliaca	2831
32196	Lampa	2831
32197	Macusani	2831
32198	Nunoa	2831
32199	Puno	2831
32200	Putina	2831
32201	Santa Lucia	2831
32202	Yanahuara	2831
32203	Yunguyo	2831
32204	Ilabaya	2833
32205	Tacna	2833
32206	Tarata	2833
32207	Aguas Verdes	2834
32208	Corrales	2834
32209	La Cruz	2834
32210	Papayal	2834
32211	San Jacinto	2834
32212	Tumbes	2834
32213	Zarumilla	2834
32214	Zorritos	2834
32215	Campoverde	2835
32216	Padre Abad	2835
32217	Pucallpa	2835
32218	Raymondi	2835
32219	San Juan	2836
32220	Albay	2837
32221	Daet	2837
32222	Iriga	2837
32223	Legaspi	2837
32224	Naga	2837
32225	Sorsogon	2837
32226	Bulacan	2838
32227	Marilao	2838
32228	Cagayan de Oro	2839
32229	Santiago	2839
32230	Solano	2839
32231	Tuguegarao	2839
32232	Bislig	2840
32233	Butuan	2840
32234	Surigao	2840
32235	Baguio	2844
32236	Bangued	2844
32237	Davao	2845
32238	Dagupan	2848
32239	Laoag	2848
32240	Manaoag	2848
32241	Mangaldan	2848
32242	San Fernando	2848
32243	Urdaneta	2848
32244	Vigan	2848
32245	Binan	2849
32246	Laguna	2849
32247	Pangil	2849
32248	San Pedro	2849
32249	Manila	2850
32250	Marikina	2850
32251	Mactan	2851
32252	Fabryczna	2861
32253	Bielawa	2862
32254	Bogatynia	2862
32255	Boguszow-Gorce	2862
32256	Boleslawiec	2862
32257	Brzeg Dolny	2862
32258	Bystrzyca Klodzka	2862
32259	Chojnow	2862
32260	Dzierzoniow	2862
32261	Glogow	2862
32262	Gora	2862
32263	Jawor	2862
32264	Jelcz-Laskowice	2862
32265	Jelenia Gora	2862
32266	Kamienna Gora	2862
32267	Klodzko	2862
32268	Kowary	2862
32269	Kudowa-Zdroj	2862
32270	Legnica	2862
32271	Luban	2862
32272	Lubin	2862
32273	Lwowek Slaski	2862
32274	Milicz	2862
32275	Nowa Ruda	2862
32276	Olawa	2862
32277	Olesnica	2862
32278	Piechowice	2862
32279	Pieszyce	2862
32280	Polkowice	2862
32281	Strzegom	2862
32282	Strzelin	2862
32283	Swidnica	2862
32284	Swiebodzice	2862
32285	Sycow	2862
32286	Trzebnica	2862
32287	Walbrzych	2862
32288	Wolow	2862
32289	Wroclaw	2862
32290	Zabkowice Slaskie	2862
32291	Zgorzelec	2862
32292	Ziebice	2862
32293	Zlotoryja	2862
32294	Hopowo	2864
32295	Chwaszczyno	2865
32296	Smigiel	2866
32297	Jerzmanowice	2867
32298	Zabierzow	2867
32299	Aleksandrow Kujawski	2868
32300	Brodnica	2868
32301	Bydgoszcz	2868
32302	Chelmno	2868
32303	Chelmza	2868
32304	Ciechocinek	2868
32305	Golub-Dobrzyn	2868
32306	Grudziadz	2868
32307	Inowroclaw	2868
32308	Janikowo	2868
32309	Koronowo	2868
32310	Kruszwica	2868
32311	Lipno	2868
32312	Mogilno	2868
32313	Naklo nad Notecia	2868
32314	Radziejow	2868
32315	Rypin	2868
32316	Sepolno Krajenskie	2868
32317	Solec Kujawski	2868
32318	Swiecie	2868
32319	Szubin	2868
32320	Torun	2868
32321	Tuchola	2868
32322	Wabrzezno	2868
32323	Wloclawek	2868
32324	Znin	2868
32325	Aleksandrow Lodzki	2869
32326	Belchatow	2869
32327	Bratoszewice	2869
32328	Brzeziny	2869
32329	Glowno	2869
32330	Koluszki	2869
32331	Konstantynow Lodzki	2869
32332	Kutno	2869
32333	Lask	2869
32334	Leczyca	2869
32335	Lodz	2869
32336	Lowicz	2869
32337	Opoczno	2869
32338	Ozorkow	2869
32339	Pabianice	2869
32340	Piotrkow Trybunalski	2869
32341	Radomsko	2869
32342	Rawa Mazowiecka	2869
32343	Sieradz	2869
32344	Skierniewice	2869
32345	Tomaszow Mazowiecki	2869
32346	Tuszyn	2869
32347	Wielun	2869
32348	Zdunska Wola	2869
32349	Zgierz	2869
32350	Zychlin	2869
32351	Biala Podlaska	2870
32352	Bilgoraj	2870
32353	Chelm	2870
32354	Deblin	2870
32355	Hrubieszow	2870
32356	Janow Lubelski	2870
32357	Krasnik	2870
32358	Krasnystaw	2870
32359	Leczna	2870
32360	Lubartow	2870
32361	Lublin	2870
32362	Lukow	2870
32363	Miedzyrzec Podlaski	2870
32364	Opole Lubelskie	2870
32365	Parczew	2870
32366	Poniatowa	2870
32367	Pulawy	2870
32368	Radzyn Podlaski	2870
32369	Ryki	2870
32370	Swidnik	2870
32371	Tomaszow Lubelski	2870
32372	Wlodawa	2870
32373	Zamosc	2870
32374	Drezdenko	2871
32375	Gorzow Wielkopolski	2871
32376	Gubin	2871
32377	Kostrzyn	2871
32378	Kozuchow	2871
32379	Krosno Odrzanskie	2871
32380	Lubsko	2871
32381	Miedzyrzecz	2871
32382	Nowa Sol	2871
32383	Skwierzyna	2871
32384	Slubice	2871
32385	Strzelce Krajenskie	2871
32386	Sulechow	2871
32387	Sulecin	2871
32388	Swiebodzin	2871
32389	Szprotawa	2871
32390	Wschowa	2871
32391	Zagan	2871
32392	Zary	2871
32393	Zielona Gora	2871
32394	Malomice	2872
32395	Andrychow	2873
32396	Bochnia	2873
32397	Brzesko	2873
32398	Brzeszcze	2873
32399	Bukowno	2873
32400	Chelmek	2873
32401	Chrzanow	2873
32402	Dabrowa Tarnowska	2873
32403	Gorlice	2873
32404	Kety	2873
32405	Krakow	2873
32406	Krynica	2873
32407	Krzeszowice	2873
32408	Libiaz	2873
32409	Limanowa	2873
32410	Miechow	2873
32411	Myslenice	2873
32412	Nowy Sacz	2873
32413	Nowy Targ	2873
32414	Olkusz	2873
32415	Oswiecim	2873
32416	Poronin	2873
32417	Rabka	2873
32418	Skawina	2873
32419	Stary Sacz	2873
32420	Sucha Beskidzka	2873
32421	Tarnow	2873
32422	Trzebinia	2873
32423	Wadowice	2873
32424	Wieliczka	2873
32425	Wolbrom	2873
32426	Zakopane	2873
32427	Blonie	2874
32428	Brwinow	2874
32429	Ciechanow	2874
32430	Garwolin	2874
32431	Gora Kalwaria	2874
32432	Gostynin	2874
32433	Grodzisk Mazowiecki	2874
32434	Grojec	2874
32435	Jozefow	2874
32436	Karczew	2874
32437	Kobylka	2874
32438	Konstancin-Jeziorna	2874
32439	Kozienice	2874
32440	Legionowo	2874
32441	Lomianki	2874
32442	Makow Mazowiecki	2874
32443	Marki	2874
32444	Milanowek	2874
32445	Minsk Mazowiecki	2874
32446	Mlawa	2874
32447	Nowy Dwor Mazowiecki	2874
32448	Ostroleka	2874
32449	Ostrow Mazowiecka	2874
32450	Otwock	2874
32451	Piaseczno	2874
32452	Piastow	2874
32453	Pionki	2874
32454	Plock	2874
32455	Plonsk	2874
32456	Pruszkow	2874
32457	Przasnysz	2874
32458	Pultusk	2874
32459	Radom	2874
32460	Siedlce	2874
32461	Sierpc	2874
32462	Sochaczew	2874
32463	Sokolow Podlaski	2874
32464	Sulejowek	2874
32465	Szydlowiec	2874
32466	Warka	2874
32467	Warszawa	2874
32468	Wegrow	2874
32469	Wesola	2874
32470	Wolomin	2874
32471	Wyszkow	2874
32472	Zabki	2874
32473	Zielonka	2874
32474	Zyrardow	2874
32475	Dlugoteka	2875
32476	Brzeg	2876
32477	Glubczyce	2876
32478	Glucholazy	2876
32479	Grodkow	2876
32480	Kedzierzyn-Kozle	2876
32481	Kluczbork	2876
32482	Krapkowice	2876
32483	Namyslow	2876
32484	Niemodlin	2876
32485	Nysa	2876
32486	Olesno	2876
32487	Opole	2876
32488	Ozimek	2876
32489	Prudnik	2876
32490	Strzelce Opolskie	2876
32491	Zawadzkie	2876
32492	Zdzieszowice	2876
32493	Cmielow	2877
32494	Debica	2878
32495	Jaroslaw	2878
32496	Jaslo	2878
32497	Krosno	2878
32498	Lancut	2878
32499	Lezajsk	2878
32500	Lubaczow	2878
32501	Mielec	2878
32502	Nisko	2878
32503	Nowa Deba	2878
32504	Przemysl	2878
32505	Przeworsk	2878
32506	Ropczyce	2878
32507	Rzeszow	2878
32508	Sanok	2878
32509	Stalowa Wola	2878
32510	Tarnobrzeg	2878
32511	Ustrzyki Dolne	2878
32512	Augustow	2879
32513	Bialystok	2879
32514	Bielsk Podlaski	2879
32515	Czarna Bialostocka	2879
32516	Grajewo	2879
32517	Hajnowka	2879
32518	Kolno	2879
32519	Lapy	2879
32520	Lomza	2879
32521	Monki	2879
32522	Siemiatycze	2879
32523	Sokolka	2879
32524	Suwalki	2879
32525	Wysokie Mazowieckie	2879
32526	Zambrow	2879
32527	Bogumilowice	2880
32528	Bytow	2881
32529	Chojnice	2881
32530	Czersk	2881
32531	Czluchow	2881
32532	Gdansk	2881
32533	Gdynia	2881
32534	Kartuzy	2881
32535	Koscierzyna	2881
32536	Kwidzyn	2881
32537	Lebork	2881
32538	Malbork	2881
32539	Miastko	2881
32540	Nowy Dwor Gdanski	2881
32541	Pruszcz Gdanski	2881
32542	Puck	2881
32543	Reda	2881
32544	Rumia	2881
32545	Slupsk	2881
32546	Sopot	2881
32547	Starogard Gdanski	2881
32548	Sztum	2881
32549	Tczew	2881
32550	Ustka	2881
32551	Wejherowo	2881
32552	Wladyslawowo	2881
32553	Komorniki	2882
32554	Steszew	2882
32555	Raszyn	2883
32556	Rymanowska	2884
32557	Glogow Malopolski	2885
32558	Bedzin	2886
32559	Bielsko-Biala	2886
32560	Bierun	2886
32561	Blachowania	2886
32562	Bytom	2886
32563	Chorzow	2886
32564	Cieszyn	2886
32565	Czechowice-Dziedzice	2886
32566	Czeladz	2886
32567	Czerwionka-Leszczyny	2886
32568	Czestochowa	2886
32569	Dabrowa Gornicza	2886
32570	Gliwice	2886
32571	Jastrzebie-Zdroj	2886
32572	Jaworzno	2886
32573	Kalety	2886
32574	Katowice	2886
32575	Klobuck	2886
32576	Knurow	2886
32577	Laziska Gorne	2886
32578	Ledziny	2886
32579	Lubliniec	2886
32580	Mikolow	2886
32581	Myslowice	2886
32582	Myszkow	2886
32583	Orzesze	2886
32584	Piekary Slaskie	2886
32585	Poreba	2886
32586	Pszczyna	2886
32587	Pszow	2886
32588	Pyskowice	2886
32589	Raciborz	2886
32590	Radlin	2886
32591	Radzionkow	2886
32592	Ruda Slaska	2886
32593	Rybnik	2886
32594	Rydultowy	2886
32595	Siemianowice Slaskie	2886
32596	Skoczow	2886
32597	Sosnowiec	2886
32598	Swietochlowice	2886
32599	Tarnowskie Gory	2886
32600	Tychy	2886
32601	Ustron	2886
32602	Wisla	2886
32603	Wodzislaw Slaski	2886
32604	Wojkowice	2886
32605	Zabrze	2886
32606	Zawiercie	2886
32607	Zory	2886
32608	Zywiec	2886
32609	Busko-Zdroj	2888
32610	Jedrzejow	2888
32611	Kielce	2888
32612	Konskie	2888
32613	Ostrowiec Swietokrzyski	2888
32614	Pinczow	2888
32615	Polaniec	2888
32616	Sandomierz	2888
32617	Skarzysko-Kamienna	2888
32618	Starachowice	2888
32619	Staszow	2888
32620	Suchedniow	2888
32621	Wloszczowa	2888
32622	Bartoszyce	2889
32623	Biskupiec	2889
32624	Braniewo	2889
32625	Dobre Miasto	2889
32626	Dzialdowo	2889
32627	Elblag	2889
32628	Elk	2889
32629	Gizycko	2889
32630	Goldap	2889
32631	Ilawa	2889
32632	Ketrzyn	2889
32633	Lidzbark Warminski	2889
32634	Lubawa	2889
32635	Morag	2889
32636	Mragowo	2889
32637	Nidzica	2889
32638	Nowe Miasto Lubawskie	2889
32639	Olecko	2889
32640	Olsztyn	2889
32641	Orneta	2889
32642	Ostroda	2889
32643	Paslek	2889
32644	Pisz	2889
32645	Szczytno	2889
32646	Wegorzewo	2889
32647	Nadarzyn	2890
32648	Szemud	2890
32649	Warsaw	2890
32650	Goscicino	2891
32651	Chodziez	2892
32652	Czarnkow	2892
32653	Gniezno	2892
32654	Gostyn	2892
32655	Grodzisk Wielkopolski	2892
32656	Jarocin	2892
32657	Kalisz	2892
32658	Kepno	2892
32659	Kolo	2892
32660	Konin	2892
32661	Koscian	2892
32662	Krotoszyn	2892
32663	Leszno	2892
32664	Lubon	2892
32665	Miedzychod	2892
32666	Mosina	2892
32667	Murowana Goslina	2892
32668	Nowy Tomysl	2892
32669	Oborniki	2892
32670	Opalenica	2892
32671	Ostrow Wielkopolski	2892
32672	Ostrzeszow	2892
32673	Pila	2892
32674	Pleszew	2892
32675	Poznan	2892
32676	Rawicz	2892
32677	Rogozno	2892
32678	Slupca	2892
32679	Srem	2892
32680	Sroda Wielkopolska	2892
32681	Swarzedz	2892
32682	Szamotuly	2892
32683	Trzcianka	2892
32684	Tuliszkow	2892
32685	Turek	2892
32686	Wagrowiec	2892
32687	Wolsztyn	2892
32688	Wronki	2892
32689	Wrzesnia	2892
32690	Zlotow	2892
32691	Borowa	2893
32692	Barlinek	2894
32693	Bialogard	2894
32694	Choszczno	2894
32695	Darlowo	2894
32696	Debno	2894
32697	Drawsko Pomorskie	2894
32698	Goleniow	2894
32699	Gryfice	2894
32700	Gryfino	2894
32701	Kamien Pomorski	2894
32702	Kolobrzeg	2894
32703	Koszalin	2894
32704	Lobez	2894
32705	Mysliborz	2894
32706	Nowogard	2894
32707	Polczyn-Zdroj	2894
32708	Police	2894
32709	Pyrzyce	2894
32710	Slawno	2894
32711	Stargard Szczecinski	2894
32712	Swidwin	2894
32713	Swinoujscie	2894
32714	Szczecin	2894
32715	Szczecinek	2894
32716	Trzebiatow	2894
32717	Walcz	2894
32718	Zlocieniec	2894
32719	Zukowskie	2895
32720	Tramagal	2896
32721	Angra	2897
32722	Arrifes	2897
32723	Faja de Baixo	2897
32724	Horta	2897
32725	Lagoa	2897
32726	Ponta Delgada	2897
32727	Praia da Vitoria	2897
32728	Rabo de Peixe	2897
32729	Ribeira Grande	2897
32730	Rosto do Cao	2897
32731	Vila Franca do Campo	2897
32732	Alcacer do Sal	2898
32733	Aljustrel	2898
32734	Beja	2898
32735	Borba	2898
32736	Caia e Sao Pedro	2898
32737	Campo Maior	2898
32738	Castro Verde	2898
32739	Cercal	2898
32740	Elvas	2898
32741	Estremoz	2898
32742	Evora	2898
32743	Ferreira do Alentejo	2898
32744	Grandola	2898
32745	Montemor-o-Novo	2898
32746	Moura	2898
32747	Odemira	2898
32748	Ponte de Sor	2898
32749	Portalegre	2898
32750	Redondo	2898
32751	Reguengos de Monsaraz	2898
32752	Santiago do Cacem	2898
32753	Santo Andre	2898
32754	Sao Teotonio	2898
32755	Serpa	2898
32756	Sines	2898
32757	Vendas Novas	2898
32758	Vila Nova de Milfontes	2898
32759	Vila Vicosa	2898
32760	Albufeira	2899
32761	Aljezur	2899
32762	Almancil	2899
32763	Alvor	2899
32764	Armacao de Pera	2899
32765	Boliqueime	2899
32766	Castro Marim	2899
32767	Estombar	2899
32768	Faro	2899
32769	Ferreiras	2899
32770	Guia	2899
32771	Lagoa	2899
32772	Lagos	2899
32773	Loule	2899
32774	Luz	2899
32775	Moncarapacho	2899
32776	Monchique	2899
32777	Monte Gordo	2899
32778	Montenegro	2899
32779	Olhao	2899
32780	Portimao	2899
32781	Quarteira	2899
32782	Santa Barbara de Nexe	2899
32783	Sao Bartolomeu de Messines	2899
32784	Sao Bras de Alportel	2899
32785	Silves	2899
32786	Tavira	2899
32787	Vila Real de Santo Antonio	2899
32788	Fafe	2900
32789	Forjaes	2900
32790	Vianna do Castello	2900
32791	Abraveses	2901
32792	Aguada de Cima	2901
32793	Agueda	2901
32794	Albergaria-A-Velha	2901
32795	Alcains	2901
32796	Alhadas	2901
32797	Amor	2901
32798	Aradas	2901
32799	Arazede	2901
32800	Arcos	2901
32801	Arganil	2901
32802	Avanca	2901
32803	Aveiro	2901
32804	Batalha	2901
32805	Beduido	2901
32806	Branca	2901
32807	Buarcos	2901
32808	Campo	2901
32809	Cantanhede	2901
32810	Caranguejeira	2901
32811	Castanheira de Pera	2901
32812	Castelo Branco	2901
32813	Castro Daire	2901
32814	Coimbra	2901
32815	Condeixa-A-Nova	2901
32816	Cortegaca	2901
32817	Covilha	2901
32818	Eixo	2901
32819	Esmoriz	2901
32820	Figueira da Foz	2901
32821	Fundao	2901
32822	Gafanha da Encarnacao	2901
32823	Gafanha da Nazare	2901
32824	Guarda	2901
32825	Ilhavo	2901
32826	Lavos	2901
32827	Leiria	2901
32828	Lorvao	2901
32829	Lourical	2901
32830	Lousa	2901
32831	Maceira	2901
32832	Mangualde	2901
32833	Marinha Grande	2901
32834	Mealhada	2901
32835	Mira	2901
32836	Mira de Aire	2901
32837	Miranda do Corvo	2901
32838	Monte Redondo	2901
32839	Nelas	2901
32840	Oia	2901
32841	Oliveira do Bairro	2901
32842	Oliveira do Hospital	2901
32843	Oliveirinha	2901
32844	Ovar	2901
32845	Pampilhosa	2901
32846	Pardilho	2901
32847	Poiares	2901
32848	Pombal	2901
32849	Porto de Mos	2901
32850	Proenca-A-Nova	2901
32851	Rio de Loba	2901
32852	Salreu	2901
32853	Sangalhos	2901
32854	Santa Catarina da Serra	2901
32855	Sao Joao	2901
32856	Sao Pedro do Sul	2901
32857	Satao	2901
32858	Seia	2901
32859	Serta	2901
32860	Soure	2901
32861	Souto da Carpalhosa	2901
32862	Tavarede	2901
32863	Teixoso	2901
32864	Tondela	2901
32865	Tortosendo	2901
32866	Vagos	2901
32867	Valega	2901
32868	Valongo do Vouga	2901
32869	Vieira de Leiria	2901
32870	Viseu	2901
32871	Camacha	2907
32872	Camara de Lobos	2907
32873	Campanario	2907
32874	Canico	2907
32875	Funchal	2907
32876	Machico	2907
32877	Ponta do Sol	2907
32878	Porto Santo	2907
32879	Ribeira Brava	2907
32880	Santa Cruz	2907
32881	A Ver-o-Mar	2908
32882	Adaufe	2908
32883	Aguas Santas	2908
32884	Agucadoura	2908
32885	Alfena	2908
32886	Alpendurada e Matos	2908
32887	Amarante	2908
32888	Anta	2908
32889	Antas	2908
32890	Apulia	2908
32891	Arcozelo	2908
32892	Areosa	2908
32893	Argoncilhe	2908
32894	Aroes	2908
32895	Arrifana	2908
32896	Arvore	2908
32897	Aves	2908
32898	Avintes	2908
32899	Baguim do Monte	2908
32900	Baltar	2908
32901	Barcelos	2908
32902	Barrosas	2908
32903	Bougado	2908
32904	Braga	2908
32905	Braganca	2908
32906	Brito	2908
32907	Caldas de Vizela	2908
32908	Caldelas	2908
32909	Calendario	2908
32910	Campo	2908
32911	Candoso	2908
32912	Canedo	2908
32913	Canelas	2908
32914	Canidelo	2908
32915	Carvalhosa	2908
32916	Casteloes de Cepeda	2908
32917	Chaves	2908
32918	Coronado	2908
32919	Couto	2908
32920	Custoias	2908
32921	Darque	2908
32922	Ermesinde	2908
32923	Espinho	2908
32924	Fafe	2908
32925	Fanzeres	2908
32926	Feira	2908
32927	Ferreira	2908
32928	Ferreiros	2908
32929	Fiaes	2908
32930	Figueiro	2908
32931	Foz do Sousa	2908
32932	Frazao	2908
32933	Freamunde	2908
32934	Galegos	2908
32935	Gandra	2908
32936	Gemunde	2908
32937	Godim	2908
32938	Gondomar	2908
32939	Grijo	2908
32940	Gueifaes	2908
32941	Guifoes	2908
32942	Guimaraes	2908
32943	Gulpilhares	2908
32944	Joane	2908
32945	Jovim	2908
32946	Lamego	2908
32947	Lavra	2908
32948	Leca da Palmeira	2908
32949	Leca do Bailio	2908
32950	Lobao	2908
32951	Lordelo	2908
32952	Lourosa	2908
32953	Lustosa	2908
32954	Macedo de Cavaleiros	2908
32955	Macieira de Cambra	2908
32956	Madalena	2908
32957	Maia	2908
32958	Margaride	2908
32959	Marinhas	2908
32960	Matosinhos	2908
32961	Meadela	2908
32962	Meinedo	2908
32963	Milheiros	2908
32964	Milheiros de Poiares	2908
32965	Mirandela	2908
32966	Mogadouro	2908
32967	Moreira	2908
32968	Moreira de Conegos	2908
32969	Mozelos	2908
32970	Negrelos	2908
32971	Nogueira	2908
32972	Nogueira da Regedoura	2908
32973	Olival	2908
32974	Oliveira	2908
32975	Oliveira de Azemeis	2908
32976	Oliveira do Douro	2908
32977	Pacos de Brandao	2908
32978	Pacos de Ferreira	2908
32979	Pedroso	2908
32980	Pedroucos	2908
32981	Penafiel	2908
32982	Perafita	2908
32983	Perozinho	2908
32984	Peso da Regua	2908
32985	Ponte	2908
32986	Porto	2908
32987	Povoa de Lanhoso	2908
32988	Povoa de Varzim	2908
32989	Real	2908
32990	Rebordosa	2908
32991	Recarei	2908
32992	Refojos de Basto	2908
32993	Ribeirao	2908
32994	Rio Meao	2908
32995	Rio Tinto	2908
32996	Ronfe	2908
32997	Sande	2908
32998	Sandim	2908
32999	Santa Cruz do Bispo	2908
33000	Santa Maria de Lamas	2908
33001	Santiago da Riba-Ul	2908
33002	Santo Tirso	2908
33003	Sao Felix da Marinha	2908
33004	Sao Joao da Madeira	2908
33005	Sao Joao de Ver	2908
33006	Sao Mamede de Infesta	2908
33007	Sao Pedro da Cova	2908
33008	Sao Pedro de Casteloes	2908
33009	Sao Roque	2908
33010	Selho	2908
33011	Senhora da Hora	2908
33012	Seroa	2908
33013	Serzedelo	2908
33014	Serzedo	2908
33015	Silvalde	2908
33016	Sobrado	2908
33017	Sobreira	2908
33018	Souto	2908
33019	Teloes	2908
33020	Urgezes	2908
33021	Valadares	2908
33022	Valbom	2908
33023	Vale	2908
33024	Valongo	2908
33025	Valpacos	2908
33026	Viana do Castelo	2908
33027	Vila Cha	2908
33028	Vila Frescainha	2908
33029	Vila Nova da Telha	2908
33030	Vila Nova de Famalicao	2908
33031	Vila Nova de Gaia	2908
33032	Vila Praia de Ancora	2908
33033	Vila Real	2908
33034	Vila Verde	2908
33035	Vila de Cucujaes	2908
33036	Vila de Prado	2908
33037	Vila do Conde	2908
33038	Vilar de Andorinho	2908
33039	Vilar do Paraiso	2908
33040	Vilarinho	2908
33041	Vilela	2908
33042	Vizela	2908
33043	Paivas	2909
33044	Arecibo	2910
33045	Barceloneta	2910
33046	Camuy	2910
33047	Dorado	2910
33048	Isabela	2910
33049	Manati	2910
33050	Vega Alta	2910
33051	Vega Baja	2910
33052	Bayamon	2911
33053	Catano	2911
33054	Guaynabo	2911
33055	Levittown	2911
33056	Valencia	2911
33057	Canovanas	2912
33058	Carolina	2912
33059	Trujillo Alto	2912
33060	Florida	2913
33061	Aibonito	2914
33062	Arroyo	2914
33063	Barranquitas	2914
33064	Cayey	2914
33065	Coamo	2914
33066	Corozal	2914
33067	Guayama	2914
33068	Juana Diaz	2914
33069	Aguas Buenas	2915
33070	Caguas	2915
33071	Culebra	2915
33072	Fajardo	2915
33073	Gurabo	2915
33074	Humacao	2915
33075	Juncos	2915
33076	Rio Grande	2915
33077	Vieques	2915
33078	Aguada	2916
33079	Aguadilla	2916
33080	Anasco	2916
33081	Cabo Rojo	2916
33082	Hormigueros	2916
33083	Mayaguez	2916
33084	San German	2916
33085	San Sebastian	2916
33086	Adjuntas	2917
33087	Guanica	2917
33088	Ponce	2917
33089	Utuado	2917
33090	Yauco	2917
33091	Salinas	2918
33092	Doha	2920
33093	Umm Bab	2921
33094	ad-Dawhah	2923
33095	al-Ghuwayriyah	2924
33096	Dukhan	2925
33097	al-Jumayliyah	2925
33098	al-Khawr	2926
33099	Musayid	2927
33100	al-Wakrah	2927
33101	al-Wukayr	2927
33102	ar-Rayyan	2928
33103	ash-Shahaniyah	2928
33104	ar-Ruways	2929
33105	Bras-Panon	2930
33106	Saint-Andre	2930
33107	Saint-Benoit	2930
33108	Sainte-Rose	2930
33109	Salazie	2930
33110	La Possession	2931
33111	Le Port	2931
33112	Saint-Denis	2931
33113	Sainte-Marie	2931
33114	Sainte-Suzanne	2931
33115	LEtang-Sale	2932
33116	Les Aviron	2932
33117	Les Trois-Bassins	2932
33118	Saint-Leu	2932
33119	Saint-Paul	2932
33120	Cilaos	2933
33121	Entre-Deux	2933
33122	Le Tampon	2933
33123	Petite-Ile	2933
33124	Saint-Joseph	2933
33125	Saint-Louis	2933
33126	Saint-Philippe	2933
33127	Saint-Pierre	2933
33128	Abrud	2934
33129	Aiud	2934
33130	Alba Iulia	2934
33131	Albac	2934
33132	Almasu Mare	2934
33133	Arieseni	2934
33134	Avram Iancu	2934
33135	Baia de Aries	2934
33136	Berghin	2934
33137	Bistra	2934
33138	Blaj	2934
33139	Blandiana	2934
33140	Bucium	2934
33141	Calnic	2934
33142	Campeni	2934
33143	Cenade	2934
33144	Cergau	2934
33145	Ceru-Bacainti	2934
33146	Cetatea de Balta	2934
33147	Ciugud	2934
33148	Ciuruleasa	2934
33149	Craciunelu de Jos	2934
33150	Cricau	2934
33151	Cugir	2934
33152	Daia Romana	2934
33153	Dostat	2934
33154	Farau	2934
33155	Galda de Jos	2934
33156	Garbova	2934
33157	Garda de Sus	2934
33158	Hoparta	2934
33159	Horea	2934
33160	Ighiu	2934
33161	Intregalde	2934
33162	Jidvei	2934
33163	Livezile	2934
33164	Lopadea Noua	2934
33165	Lunca Muresului	2934
33166	Lupsa	2934
33167	Metes	2934
33168	Mihalt	2934
33169	Miraslau	2934
33170	Mogos	2934
33171	Noslac	2934
33172	Ocna Mures	2934
33173	Ocolis	2934
33174	Ohaba	2934
33175	Pianu	2934
33176	Poiana Vadului	2934
33177	Ponor	2934
33178	Posaga	2934
33179	Radesti	2934
33180	Ramet	2934
33181	Rimetea	2934
33182	Rosia Montana	2934
33183	Rosia de Secas	2934
33184	Salciua	2934
33185	Salistea	2934
33186	Sancel	2934
33187	Santimbru	2934
33188	Sasciori	2934
33189	Scarisoara	2934
33190	Sebes	2934
33191	Sibot	2934
33192	Sohodol	2934
33193	Sona	2934
33194	Spring	2934
33195	Stremt	2934
33196	Sugag	2934
33197	Teius	2934
33198	Unirea	2934
33199	Vadu Motilor	2934
33200	Valea Lunga	2934
33201	Vidra	2934
33202	Vintu de Jos	2934
33203	Zlatna	2934
33204	Almas	2935
33205	Apateu	2935
33206	Arad	2935
33207	Archis	2935
33208	Barsa	2935
33209	Barzava	2935
33210	Bata	2935
33211	Beliu	2935
33212	Birchis	2935
33213	Bocsig	2935
33214	Brazii	2935
33215	Buteni	2935
33216	Carand	2935
33217	Cermei	2935
33218	Chisindia	2935
33219	Chisineu Cris	2935
33220	Conop	2935
33221	Covasint	2935
33222	Craiva	2935
33223	Curtici	2935
33224	Dezna	2935
33225	Dieci	2935
33226	Dorgos	2935
33227	Fantanele	2935
33228	Felnac	2935
33229	Ghioroc	2935
33230	Graniceri	2935
33231	Gurahont	2935
33232	Halmagel	2935
33233	Halmagiu	2935
33234	Hasmas	2935
33235	Ignesti	2935
33236	Ineu	2935
33237	Iratosu	2935
33238	Lipova	2935
33239	Livada	2935
33240	Macea	2935
33241	Masca	2935
33242	Moneasa	2935
33243	Nadlac	2935
33244	Olari	2935
33245	Pancota	2935
33246	Paulis	2935
33247	Pecica	2935
33248	Peregu Mare	2935
33249	Petris	2935
33250	Pilu	2935
33251	Plescuta	2935
33252	Sagu	2935
33253	Santana	2935
33254	Savarsin	2935
33255	Sebis	2935
33256	Secusigiu	2935
33257	Seitin	2935
33258	Seleus	2935
33259	Semlac	2935
33260	Sepreus	2935
33261	Sicula	2935
33262	Silindia	2935
33263	Simand	2935
33264	Sintea Mare	2935
33265	Siria	2935
33266	Sistarovat	2935
33267	Socodor	2935
33268	Sofronea	2935
33269	Tarnova	2935
33270	Taut	2935
33271	Varadia de Mures	2935
33272	Varfurile	2935
33273	Vinga	2935
33274	Vladimirescu	2935
33275	Zabrani	2935
33276	Zarand	2935
33277	Zerind	2935
33278	Zimandu Nou	2935
33279	Albesti	2936
33280	Albestii-Pamanteni	2936
33281	Albota	2936
33282	Aninoasa	2936
33283	Arefu	2936
33284	Babana	2936
33285	Baiculesti	2936
33286	Balilesti	2936
33287	Barla	2936
33288	Bascov	2936
33289	Beleti-Negresti	2936
33290	Berevoesti	2936
33291	Bogati	2936
33292	Boteni	2936
33293	Botesti	2936
33294	Bradu	2936
33295	Bradulet	2936
33296	Budeasa	2936
33297	Bughea de Jos	2936
33298	Buzoesti	2936
33299	Caldararu	2936
33300	Calinesti	2936
33301	Campulung	2936
33302	Cateasca	2936
33303	Cepari	2936
33304	Cetateni	2936
33305	Cicanesti	2936
33306	Ciofrangeni	2936
33307	Ciomagesti	2936
33308	Cocu	2936
33309	Corbeni	2936
33310	Corbi	2936
33311	Cosesti	2936
33312	Costesti	2936
33313	Cotmeana	2936
33314	Cuca	2936
33315	Curtea de Arges	2936
33316	Dambovicioara	2936
33317	Darmanesti	2936
33318	Davidesti	2936
33319	Dobresti	2936
33320	Domnesti	2936
33321	Draganu	2936
33322	Dragoslavele	2936
33323	Godeni	2936
33324	Harsesti	2936
33325	Hartiesti	2936
33326	Izvoru	2936
33327	Leordeni	2936
33328	Leresti	2936
33329	Lunca Corbului	2936
33330	Malureni	2936
33331	Maracineni	2936
33332	Merisani	2936
33333	Micesti	2936
33334	Mihaesti	2936
33335	Mioarele	2936
33336	Mioveni	2936
33337	Mirosi	2936
33338	Moraresti	2936
33339	Mosoaia	2936
33340	Mozaceni	2936
33341	Musatesti	2936
33342	Negrasi	2936
33343	Nucsoara	2936
33344	Oarja	2936
33345	Pietrosani	2936
33346	Pitesti	2936
33347	Poenari	2936
33348	Poiana Lacului	2936
33349	Popesti	2936
33350	Priboieni	2936
33351	Ratesti	2936
33352	Recea	2936
33353	Rociu	2936
33354	Rucar	2936
33355	Salatrucu	2936
33356	Sapata	2936
33357	Schitu-Golesti	2936
33358	Slobozia	2936
33359	Stalpeni	2936
33360	Stefan cel Mare	2936
33361	Stefanesti	2936
33362	Stoenesti	2936
33363	Stolnici	2936
33364	Suici	2936
33365	Suseni	2936
33366	Teiu	2936
33367	Tigveni	2936
33368	Titesti	2936
33369	Topoloveni	2936
33370	Uda	2936
33371	Ungheni	2936
33372	Valea Danului	2936
33373	Valea Iasului	2936
33374	Valea Mare-Pravat	2936
33375	Vedea	2936
33376	Vladesti	2936
33377	Agas	2937
33378	Ardeoani	2937
33379	Asau	2937
33380	Bacau	2937
33381	Balcani	2937
33382	Barsanesti	2937
33383	Beresti-Bistrita	2937
33384	Beresti-Tazlau	2937
33385	Berzunti	2937
33386	Blagesti	2937
33387	Bogdanesti	2937
33388	Brusturoasa	2937
33389	Buhoci	2937
33390	Buhusi	2937
33391	Caiuti	2937
33392	Casin	2937
33393	Cleja	2937
33394	Colonesti	2937
33395	Comanesti	2937
33396	Corbasca	2937
33397	Cotofanesti	2937
33398	Damienesti	2937
33399	Darmanesti	2937
33400	Dealu Morii	2937
33401	Dofteana	2937
33402	Faraoani	2937
33403	Filipeni	2937
33404	Filipesti	2937
33405	Gaiceana	2937
33406	Garleni	2937
33407	Ghimes-Faget	2937
33408	Glavanesti	2937
33409	Gura Vaii	2937
33410	Helegiu	2937
33411	Hemeius	2937
33412	Horgesti	2937
33413	Huruesti	2937
33414	Izvoru Berheciului	2937
33415	Letea Veche	2937
33416	Lipova	2937
33417	Livezi	2937
33418	Luizi-Calugara	2937
33419	Magiresti	2937
33420	Magura	2937
33421	Manastirea Casin	2937
33422	Margineni	2937
33423	Moinesti	2937
33424	Motoseni	2937
33425	Negri	2937
33426	Nicolae Balcescu	2937
33427	Oituz	2937
33428	Oncesti	2937
33429	Onesti	2937
33430	Orbeni	2937
33431	Palanca	2937
33432	Pancesti	2937
33433	Parava	2937
33434	Pargaresti	2937
33435	Parincea	2937
33436	Parjol	2937
33437	Plopana	2937
33438	Podu Turcului	2937
33439	Poduri	2937
33440	Racaciuni	2937
33441	Rachitoasa	2937
33442	Racova	2937
33443	Rosiori	2937
33444	Sanduleni	2937
33445	Sascut	2937
33446	Saucesti	2937
33447	Scorteni	2937
33448	Secuieni	2937
33449	Slanic-Moldova	2937
33450	Solont	2937
33451	Stanisesti	2937
33452	Stefan cel Mare	2937
33453	Strugari	2937
33454	Tamasi	2937
33455	Targu Ocna	2937
33456	Targu-Trotus	2937
33457	Tatarasti	2937
33458	Traian	2937
33459	Ungureni	2937
33460	Urechesti	2937
33461	Valea Seaca	2937
33462	Vultureni	2937
33463	Zemes	2937
33464	Abram	2938
33465	Abramut	2938
33466	Alesd	2938
33467	Astileu	2938
33468	Auseu	2938
33469	Avram Iancu	2938
33470	Balc	2938
33471	Batar	2938
33472	Beius	2938
33473	Biharia	2938
33474	Boianu Mare	2938
33475	Borod	2938
33476	Bors	2938
33477	Bratca	2938
33478	Brusturi	2938
33479	Budureasa	2938
33480	Buduslau	2938
33481	Bulz	2938
33482	Buntesti	2938
33483	Cabesti	2938
33484	Campani	2938
33485	Capalna	2938
33486	Carpinet	2938
33487	Cefa	2938
33488	Ceica	2938
33489	Cetariu	2938
33490	Cherechiu	2938
33491	Chislaz	2938
33492	Ciuhoiu	2938
33493	Ciumeghiu	2938
33494	Cociuba Mare	2938
33495	Copacel	2938
33496	Cristioru de Jos	2938
33497	Curatele	2938
33498	Curtuiseni	2938
33499	Derna	2938
33500	Diosig	2938
33501	Dobresti	2938
33502	Draganesti	2938
33503	Dragesti	2938
33504	Finis	2938
33505	Girisu de Cris	2938
33506	Hidiselu de Sus	2938
33507	Holod	2938
33508	Husasau de Tinca	2938
33509	Ineu	2938
33510	Lazareni	2938
33511	Lazuri de Beius	2938
33512	Lugasu de Jos	2938
33513	Lunca	2938
33514	Madaras	2938
33515	Magesti	2938
33516	Marghita	2938
33517	Nojorid	2938
33518	Nucet	2938
33519	Olcea	2938
33520	Oradea	2938
33521	Osorheiu	2938
33522	Pietroasa	2938
33523	Pocola	2938
33524	Pomezeu	2938
33525	Popesti	2938
33526	Rabagani	2938
33527	Remetea	2938
33528	Rieni	2938
33529	Rosia	2938
33530	Sacadat	2938
33531	Sacueni	2938
33532	Salacea	2938
33533	Salard	2938
33534	Salonta	2938
33535	Sambata	2938
33536	Sanmartin	2938
33537	Santandrei	2938
33538	Sarbi	2938
33539	Simian	2938
33540	Sinteu	2938
33541	Soimi	2938
33542	Spinus	2938
33543	Stei	2938
33544	Suncuius	2938
33545	Suplacu de Barcau	2938
33546	Tarcaia	2938
33547	Tarcea	2938
33548	Tauteu	2938
33549	Tetchea	2938
33550	Tileagd	2938
33551	Tinca	2938
33552	Tulca	2938
33553	Uileacu de Beius	2938
33554	Vadu Crisului	2938
33555	Valea lui Mihai	2938
33556	Varciorog	2938
33557	Vascau	2938
33558	Viisoara	2938
33559	Beclean	2939
33560	Bistrita	2939
33561	Bistrita Bargaului	2939
33562	Branistea	2939
33563	Budacu de Jos	2939
33564	Budesti	2939
33565	Caianu Mic	2939
33566	Cetate	2939
33567	Chiochis	2939
33568	Chiuza	2939
33569	Ciceu-Giurgesti	2939
33570	Cosbuc	2939
33571	Dumitra	2939
33572	Feldru	2939
33573	Galatii Bistritei	2939
33574	Ilva Mare	2939
33575	Ilva Mica	2939
33576	Josenii Bargaului	2939
33577	Lechinta	2939
33578	Lesu	2939
33579	Livezile	2939
33580	Lunca Ilvei	2939
33581	Magura Ilvei	2939
33582	Maieru	2939
33583	Mariselu	2939
33584	Matei	2939
33585	Micestii de Campie	2939
33586	Milas	2939
33587	Monor	2939
33588	Nasaud	2939
33589	Nimigea	2939
33590	Nuseni	2939
33591	Parva	2939
33592	Petru Rares	2939
33593	Prundu Bargaului	2939
33594	Rebra	2939
33595	Rebrisoara	2939
33596	Rodna	2939
33597	Romuli	2939
33598	Salva	2939
33599	Sangeorz-Bai	2939
33600	Sanmihaiu de Campie	2939
33601	Sant	2939
33602	Sieu	2939
33603	Sieu-Magherus	2939
33604	Sieu-Odorhei	2939
33605	Sieut	2939
33606	Silvasu de Campie	2939
33607	Sintereag	2939
33608	Spermezeu	2939
33609	Tarlisua	2939
33610	Teaca	2939
33611	Telciu	2939
33612	Tiha Bargaului	2939
33613	Uriu	2939
33614	Urmenis	2939
33615	Zagra	2939
33616	Albesti	2940
33617	Avrameni	2940
33618	Baluseni	2940
33619	Botosani	2940
33620	Braesti	2940
33621	Broscauti	2940
33622	Bucecea	2940
33623	Calarasi	2940
33624	Concesti	2940
33625	Copalau	2940
33626	Cordareni	2940
33627	Corlateni	2940
33628	Corni	2940
33629	Cotusca	2940
33630	Cristesti	2940
33631	Cristinesti	2940
33632	Curtesti	2940
33633	Dangeni	2940
33634	Darabani	2940
33635	Dersca	2940
33636	Dobarceni	2940
33637	Dorohoi	2940
33638	Draguseni	2940
33639	Durnesti	2940
33640	Flamanzi	2940
33641	Frumusica	2940
33642	George Enescu	2940
33643	Gorbanesti	2940
33644	Hanesti	2940
33645	Havarna	2940
33646	Hiliseu-Horia	2940
33647	Hlipiceni	2940
33648	Hudesti	2940
33649	Ibanesti	2940
33650	Leorda	2940
33651	Lunca	2940
33652	Manoleasa	2940
33653	Mihail Eminescu	2940
33654	Mihaileni	2940
33655	Mihalaseni	2940
33656	Mileanca	2940
33657	Mitoc	2940
33658	Nicseni	2940
33659	Paltinis	2940
33660	Pomarla	2940
33661	Prajeni	2940
33662	Rachiti	2940
33663	Radauti-Prut	2940
33664	Rauseni	2940
33665	Ripiceni	2940
33666	Roma	2940
33667	Romanesti	2940
33668	Santa-Maria	2940
33669	Saveni	2940
33670	Sendriceni	2940
33671	Stauceni	2940
33672	Stefanesti	2940
33673	Stiubieni	2940
33674	Suharau	2940
33675	Sulita	2940
33676	Todireni	2940
33677	Trusesti	2940
33678	Tudora	2940
33679	Ungureni	2940
33680	Unteni	2940
33681	Vaculesti	2940
33682	Varfu Campului	2940
33683	Viisoara	2940
33684	Vladeni	2940
33685	Vlasinesti	2940
33686	Vorniceni	2940
33687	Vorona	2940
33688	Baraganul	2941
33689	Bertestii de Jos	2941
33690	Bordei Verde	2941
33691	Braila	2941
33692	Chiscani	2941
33693	Ciocile	2941
33694	Ciresu	2941
33695	Dudesti	2941
33696	Faurei	2941
33697	Frecatei	2941
33698	Galbenu	2941
33699	Gemenele	2941
33700	Gradistea	2941
33701	Gropeni	2941
33702	Ianca	2941
33703	Insuratei	2941
33704	Jirlau	2941
33705	Marasu	2941
33706	Maxineni	2941
33707	Mircea Voda	2941
33708	Movila Miresei	2941
33709	Racovita	2941
33710	Ramnicelu	2941
33711	Romanu	2941
33712	Rosiori	2941
33713	Salcia Tudor	2941
33714	Scortaru Nou	2941
33715	Silistea	2941
33716	Stancuta	2941
33717	Surdila-Gaiseanca	2941
33718	Surdila-Greci	2941
33719	Sutesti	2941
33720	Tichilesti	2941
33721	Traian	2941
33722	Tudor Vladimirescu	2941
33723	Tufesti	2941
33724	Ulmu	2941
33725	Unirea	2941
33726	Vadeni	2941
33727	Victoria	2941
33728	Visani	2941
33729	Viziru	2941
33730	Zavoaia	2941
33731	Apata	2942
33732	Beclean	2942
33733	Bod	2942
33734	Bran	2942
33735	Brasov	2942
33736	Budila	2942
33737	Bunesti	2942
33738	Cata	2942
33739	Cincu	2942
33740	Codlea	2942
33741	Comana	2942
33742	Cristian	2942
33743	Dumbravita	2942
33744	Fagaras	2942
33745	Feldioara	2942
33746	Fundata	2942
33747	Ghimbav	2942
33748	Halchiu	2942
33749	Harman	2942
33750	Harseni	2942
33751	Hoghiz	2942
33752	Homorod	2942
33753	Jibert	2942
33754	Lisa	2942
33755	Maierus	2942
33756	Mandra	2942
33757	Moeciu	2942
33758	Ormenis	2942
33759	Parau	2942
33760	Poiana Marului	2942
33761	Predeal	2942
33762	Prejmer	2942
33763	Racos	2942
33764	Rasnov	2942
33765	Recea	2942
33766	Rupea	2942
33767	Sacele	2942
33768	Sanpetru	2942
33769	Sercaia	2942
33770	Sinca	2942
33771	Soars	2942
33772	Tarlungeni	2942
33773	Teliu	2942
33774	Ticusul	2942
33775	Ucea	2942
33776	Ungra	2942
33777	Vama Buzaului	2942
33778	Victoria	2942
33779	Vistea	2942
33780	Voila	2942
33781	Vulcan	2942
33782	Zarnesti	2942
33783	Bucharest	2943
33784	Bucuresti	2943
33785	Amaru	2944
33786	Balaceanu	2944
33787	Balta Alba	2944
33788	Beceni	2944
33789	Berca	2944
33790	Bisoca	2944
33791	Blajani	2944
33792	Boldu	2944
33793	Bozioru	2944
33794	Bradeanu	2944
33795	Braesti	2944
33796	Breaza	2944
33797	Buda	2944
33798	Buzau	2944
33799	Calvini	2944
33800	Canesti	2944
33801	Catina	2944
33802	Cernatesti	2944
33803	Chiliile	2944
33804	Chiojdu	2944
33805	Cilibia	2944
33806	Cislau	2944
33807	Cochirleanca	2944
33808	Colti	2944
33809	Constantin Rosetti	2944
33810	Costesti	2944
33811	Cozieni	2944
33812	Galbinasi	2944
33813	Gheraseni	2944
33814	Ghergheasa	2944
33815	Glodeanu-Silistea	2944
33816	Glodeanul Sarat	2944
33817	Grebanu	2944
33818	Gura Teghii	2944
33819	Largu	2944
33820	Lopatari	2944
33821	Luciu	2944
33822	Magura	2944
33823	Manzalesti	2944
33824	Maracineni	2944
33825	Margaritesti	2944
33826	Merei	2944
33827	Mihailesti	2944
33828	Movila Banului	2944
33829	Murgesti	2944
33830	Naeni	2944
33831	Nehoiu	2944
33832	Odaile	2944
33833	Padina	2944
33834	Panatau	2944
33835	Pardosi	2944
33836	Parscov	2944
33837	Patarlagele	2944
33838	Pietroasele	2944
33839	Podgoria	2944
33840	Pogoanele	2944
33841	Posta Calnau	2944
33842	Puiesti	2944
33843	Racoviteni	2944
33844	Ramnicelu	2944
33845	Ramnicu Sarat	2944
33846	Robeasca	2944
33847	Rusetu	2944
33848	Sageata	2944
33849	Sahateni	2944
33850	Sapoca	2944
33851	Sarulesti	2944
33852	Scortoasa	2944
33853	Scutelnici	2944
33854	Siriu	2944
33855	Smeeni	2944
33856	Stalpu	2944
33857	Tintesti	2944
33858	Tisau	2944
33859	Topliceni	2944
33860	Ulmeni	2944
33861	Vadu Pasii	2944
33862	Valcelele	2944
33863	Valea Ramnicului	2944
33864	Valea Salciei	2944
33865	Vernesti	2944
33866	Vintila Voda	2944
33867	Viperesti	2944
33868	Zarnesti	2944
33869	Ziduri	2944
33870	Alexandru Odobescu	2945
33871	Belciugatele	2945
33872	Borcea	2945
33873	Budesti	2945
33874	Calarasi	2945
33875	Cascioarele	2945
33876	Chirnogi	2945
33877	Chiselet	2945
33878	Ciocanesti	2945
33879	Curcani	2945
33880	Cuza Voda	2945
33881	Dichiseni	2945
33882	Dor Marunt	2945
33883	Dorobantu	2945
33884	Dragalina	2945
33885	Dragos Voda	2945
33886	Frasinet	2945
33887	Frumusani	2945
33888	Fundeni	2945
33889	Fundulea	2945
33890	Gradistea	2945
33891	Gurbanesti	2945
33892	Ileana	2945
33893	Independenta	2945
33894	Jegalia	2945
33895	Lehliu	2945
33896	Lehliu-Gara	2945
33897	Luica	2945
33898	Lupsanu	2945
33899	Manastirea	2945
33900	Mitreni	2945
33901	Modelu	2945
33902	Nana	2945
33903	Nicolae Balcescu	2945
33904	Oltenita	2945
33905	Perisoru	2945
33906	Plataresti	2945
33907	Radovanu	2945
33908	Roseti	2945
33909	Sarulesti	2945
33910	Sohatu	2945
33911	Soldanu	2945
33912	Spantov	2945
33913	Stefan Voda	2945
33914	Stefan cel Mare	2945
33915	Tamadau Mare	2945
33916	Ulmeni	2945
33917	Ulmu	2945
33918	Unirea	2945
33919	Valcelele	2945
33920	Valea Argovei	2945
33921	Vasilati	2945
33922	Vlad Tepes	2945
33923	Anina	2946
33924	Armenis	2946
33925	Baile Herculane	2946
33926	Bania	2946
33927	Bautar	2946
33928	Berliste	2946
33929	Berzasca	2946
33930	Berzovia	2946
33931	Bocsa	2946
33932	Bolvasnita	2946
33933	Bozovici	2946
33934	Brebu	2946
33935	Brebu Nou	2946
33936	Buchin	2946
33937	Bucosnita	2946
33938	Caransebes	2946
33939	Carasova	2946
33940	Carbunari	2946
33941	Ciclova Romana	2946
33942	Ciuchici	2946
33943	Ciudanovita	2946
33944	Constantin Daicoviciu	2946
33945	Copacele	2946
33946	Cornea	2946
33947	Cornereva	2946
33948	Coronini	2946
33949	Dalboset	2946
33950	Doclin	2946
33951	Dognecea	2946
33952	Domasnea	2946
33953	Eftimie Murgu	2946
33954	Ezeris	2946
33955	Farliug	2946
33956	Forotic	2946
33957	Garnic	2946
33958	Glimboca	2946
33959	Goruia	2946
33960	Gradinari	2946
33961	Iablanita	2946
33962	Lapusnicel	2946
33963	Lapusnicu Mare	2946
33964	Luncavita	2946
33965	Lupac	2946
33966	Marga	2946
33967	Maureni	2946
33968	Mehadia	2946
33969	Mehadica	2946
33970	Moldova Noua	2946
33971	Naidas	2946
33972	Obreja	2946
33973	Ocna de Fier	2946
33974	Oravita	2946
33975	Otelu Rosu	2946
33976	Paltinis	2946
33977	Pojejena	2946
33978	Prigor	2946
33979	Racasdia	2946
33980	Ramna	2946
33981	Resita	2946
33982	Rusca Montana	2946
33983	Sacu	2946
33984	Sasca Montana	2946
33985	Sichevita	2946
33986	Slatina-Timis	2946
33987	Socol	2946
33988	Sopotu Nou	2946
33989	Tarnova	2946
33990	Teregova	2946
33991	Ticvaniu Mare	2946
33992	Toplet	2946
33993	Turnu Ruieni	2946
33994	Valiug	2946
33995	Varadia	2946
33996	Vermes	2946
33997	Vrani	2946
33998	Zavoi	2946
33999	Zorlentu Mare	2946
34000	Aghiresu	2947
34001	Aiton	2947
34002	Alunis	2947
34003	Apahida	2947
34004	Aschileu	2947
34005	Baciu	2947
34006	Baisoara	2947
34007	Belis	2947
34008	Bobalna	2947
34009	Bontida	2947
34010	Borsa	2947
34011	Buza	2947
34012	Caianu	2947
34013	Calarasi	2947
34014	Calatele	2947
34015	Camarasu	2947
34016	Campia Turzii	2947
34017	Capusu Mare	2947
34018	Caseiu	2947
34019	Catcau	2947
34020	Catina	2947
34021	Ceanu Mare	2947
34022	Chinteni	2947
34023	Chiuiesti	2947
34024	Ciucea	2947
34025	Ciurila	2947
34026	Cluj-Napoca	2947
34027	Cojocna	2947
34028	Cornesti	2947
34029	Cuzdrioara	2947
34030	Dabaca	2947
34031	Dej	2947
34032	Feleacu	2947
34033	Fizesu Gherlii	2947
34034	Floresti	2947
34035	Frata	2947
34036	Garbau	2947
34037	Geaca	2947
34038	Gherla	2947
34039	Gilau	2947
34040	Huedin	2947
34041	Iara	2947
34042	Iclod	2947
34043	Izvoru Crisului	2947
34044	Jichisu de Jos	2947
34045	Jucu	2947
34046	Luna	2947
34047	Maguri-Racatau	2947
34048	Manastireni	2947
34049	Margau	2947
34050	Marisel	2947
34051	Mica	2947
34052	Mihai Viteazu	2947
34053	Mintiu Gherlii	2947
34054	Mociu	2947
34055	Moldovenesti	2947
34056	Palatca	2947
34057	Panticeu	2947
34058	Petrestii de Jos	2947
34059	Ploscos	2947
34060	Poieni	2947
34061	Rasca	2947
34062	Recea Cristur	2947
34063	Sacuieu	2947
34064	Sancraiu	2947
34065	Sandulesti	2947
34066	Sanmartin	2947
34067	Sanpaul	2947
34068	Savadisla	2947
34069	Sic	2947
34070	Suatu	2947
34071	Taga	2947
34072	Tritenii de Jos	2947
34073	Turda	2947
34074	Tureni	2947
34075	Unguras	2947
34076	Vad	2947
34077	Valea Ierii	2947
34078	Viisoara	2947
34079	Vultureni	2947
34080	Adamclisi	2948
34081	Agigea	2948
34082	Albesti	2948
34083	Aliman	2948
34084	Amzacea	2948
34085	Baneasa	2948
34086	Basarabi	2948
34087	Castelu	2948
34088	Cerchezu	2948
34089	Cernavoda	2948
34090	Chirnogeni	2948
34091	Ciobanu	2948
34092	Ciocarlia	2948
34093	Cobadin	2948
34094	Cogealac	2948
34095	Comana	2948
34096	Constanta	2948
34097	Corbu	2948
34098	Costinesti	2948
34099	Crucea	2948
34100	Cumpana	2948
34101	Deleni	2948
34102	Dobromir	2948
34103	Douazeci si Trei August	2948
34104	Dumbraveni	2948
34105	Eforie	2948
34106	Garliciu	2948
34107	Ghindaresti	2948
34108	Harsova	2948
34109	Horia	2948
34110	Independenta	2948
34111	Ion Corvin	2948
34112	Istria	2948
34113	Limanu	2948
34114	Lipnita	2948
34115	Lumina	2948
34116	Mangalia	2948
34117	Medgidia	2948
34118	Mereni	2948
34119	Mihai Viteazu	2948
34120	Mihail Kogalniceanu	2948
34121	Mircea Voda	2948
34122	Navodari	2948
34123	Negru Voda	2948
34124	Nicolae Balcescu	2948
34125	Oltina	2948
34126	Ostrov	2948
34127	Ovidiu	2948
34128	Pantelimon	2948
34129	Pecineaga	2948
34130	Pestera	2948
34131	Poarta Alba	2948
34132	Rasova	2948
34133	Sacele	2948
34134	Saraiu	2948
34135	Seimeni	2948
34136	Silistea	2948
34137	Targusor	2948
34138	Techirghiol	2948
34139	Topalu	2948
34140	Topraisar	2948
34141	Tortoman	2948
34142	Tuzla	2948
34143	Valu lui Traian	2948
34144	Vulturu	2948
34145	Aita Mare	2949
34146	Baraolt	2949
34147	Barcani	2949
34148	Batani	2949
34149	Belin	2949
34150	Bodoc	2949
34151	Borosneu Mare	2949
34152	Bradut	2949
34153	Brates	2949
34154	Bretcu	2949
34155	Catalina	2949
34156	Cernat	2949
34157	Chichis	2949
34158	Comandau	2949
34159	Covasna	2949
34160	Dobarlau	2949
34161	Ghelinta	2949
34162	Ghidfalau	2949
34163	Haghig	2949
34164	Ilieni	2949
34165	Intorsura Buzaului	2949
34166	Lemnia	2949
34167	Malnas	2949
34168	Moacsa	2949
34169	Ojdula	2949
34170	Ozun	2949
34171	Poian	2949
34172	Reci	2949
34173	Sanzieni	2949
34174	Sfantu Gheorghe	2949
34175	Sita Buzaului	2949
34176	Targu Secuiesc	2949
34177	Turia	2949
34178	Valcele	2949
34179	Valea Crisului	2949
34180	Valea Mare	2949
34181	Varghis	2949
34182	Zabala	2949
34183	Zagon	2949
34184	Aninoasa	2950
34185	Baleni	2950
34186	Barbuletu	2950
34187	Bezdead	2950
34188	Bilciuresti	2950
34189	Branesti	2950
34190	Branistea	2950
34191	Brezoaiele	2950
34192	Buciumeni	2950
34193	Bucsani	2950
34194	Butimanu	2950
34195	Candesti	2950
34196	Ciocanesti	2950
34197	Cobia	2950
34198	Cojasca	2950
34199	Comisani	2950
34200	Contesti	2950
34201	Corbii Mari	2950
34202	Cornatelu	2950
34203	Cornesti	2950
34204	Costestii din Vale	2950
34205	Crangurile de Sus	2950
34206	Crevedia	2950
34207	Darmanesti	2950
34208	Dobra	2950
34209	Doicesti	2950
34210	Dragodana	2950
34211	Dragomiresti	2950
34212	Edera de Jos	2950
34213	Fieni	2950
34214	Finta	2950
34215	Gaesti	2950
34216	Glodeni	2950
34217	Gura Foii	2950
34218	Gura Ocnitei	2950
34219	Gura Sutii	2950
34220	Hulubesti	2950
34221	Ion luca Caragiale	2950
34222	Lucieni	2950
34223	Ludesti	2950
34224	Lunguletu	2950
34225	Malu cu Flori	2950
34226	Manesti	2950
34227	Matasaru	2950
34228	Mogosani	2950
34229	Moreni	2950
34230	Moroeni	2950
34231	Morteni	2950
34232	Motaeni	2950
34233	Niculesti	2950
34234	Nucet	2950
34235	Ocnita	2950
34236	Odobesti	2950
34237	Petresti	2950
34238	Pietrosita	2950
34239	Poiana	2950
34240	Potlogi	2950
34241	Produlesti	2950
34242	Pucheni	2950
34243	Pucioasa	2950
34244	Racari	2950
34245	Razvad	2950
34246	Runcu	2950
34247	Salcioara	2950
34248	Selaru	2950
34249	Slobozia Moara	2950
34250	Sotanga	2950
34251	Targoviste	2950
34252	Tartasesti	2950
34253	Tatarani	2950
34254	Titu	2950
34255	Uliesti	2950
34256	Ulmi	2950
34257	Vacaresti	2950
34258	Valea Lunga	2950
34259	Valea Mare	2950
34260	Valeni-Dambovita	2950
34261	Varfuri	2950
34262	Visina	2950
34263	Visinesti	2950
34264	Voinesti	2950
34265	Vulcana Bai	2950
34266	Afumati	2951
34267	Almajiu	2951
34268	Amarastii de Jos	2951
34269	Amarastii de Sus	2951
34270	Apele Vii	2951
34271	Argetoaia	2951
34272	Bailesti	2951
34273	Barca	2951
34274	Bechet	2951
34275	Bistret	2951
34276	Botosesti-Paia	2951
34277	Brabova	2951
34278	Bradesti	2951
34279	Bralostita	2951
34280	Bratovoesti	2951
34281	Breasta	2951
34282	Bucovat	2951
34283	Bulzesti	2951
34284	Calafat	2951
34285	Calarasi	2951
34286	Calopar	2951
34287	Caraula	2951
34288	Carpen	2951
34289	Castra-Nova	2951
34290	Celaru	2951
34291	Ceratu	2951
34292	Cernatesti	2951
34293	Cetate	2951
34294	Cioroiasiu	2951
34295	Ciupercenii Noi	2951
34296	Cosoveni	2951
34297	Cotofenii din Dos	2951
34298	Craiova	2951
34299	Dabuleni	2951
34300	Daneti	2951
34301	Desa	2951
34302	Diosti	2951
34303	Dobresti	2951
34304	Dragotesti	2951
34305	Dranic	2951
34306	Farcasu	2951
34307	Filiasi	2951
34308	Galicea Mare	2951
34309	Gangiova	2951
34310	Ghercesti	2951
34311	Gighera	2951
34312	Giubega	2951
34313	Giurgita	2951
34314	Gogosu	2951
34315	Goicea	2951
34316	Goiesti	2951
34317	Grecesti	2951
34318	Isalnita	2951
34319	Izvoare	2951
34320	Leu	2951
34321	Lipovu	2951
34322	Macesu de Jos	2951
34323	Macesu de Sus	2951
34324	Maglavit	2951
34325	Malu Mare	2951
34326	Marsani	2951
34327	Melinesti	2951
34328	Mischii	2951
34329	Motatei	2951
34330	Murgasi	2951
34331	Negoi	2951
34332	Orodel	2951
34333	Ostroveni	2951
34334	Perisor	2951
34335	Pielesti	2951
34336	Piscu Vechi	2951
34337	Plenita	2951
34338	Podari	2951
34339	Poiana Mare	2951
34340	Predesti	2951
34341	Radovan	2951
34342	Rastu	2951
34343	Robanesti	2951
34344	Sadova	2951
34345	Salcuta	2951
34346	Scaesti	2951
34347	Seaca de Camp	2951
34348	Seaca de Padure	2951
34349	Secu	2951
34350	Segarcea	2951
34351	Silistea Crucii	2951
34352	Simnicu de Sus	2951
34353	Sopot	2951
34354	Teasc	2951
34355	Terpezita	2951
34356	Teslui	2951
34357	Tuglui	2951
34358	Unirea	2951
34359	Urzicuta	2951
34360	Valea Stanciului	2951
34361	Vartop	2951
34362	Varvoru	2951
34363	Vela	2951
34364	Verbita	2951
34365	Balabanesti	2952
34366	Balasesti	2952
34367	Baleni	2952
34368	Baneasa	2952
34369	Barcea	2952
34370	Beresti	2952
34371	Beresti-Sat	2952
34372	Brahasesti	2952
34373	Branistea	2952
34374	Buciumeni	2952
34375	Cavadinesti	2952
34376	Certesti	2952
34377	Corni	2952
34378	Corod	2952
34379	Cosmesti	2952
34380	Costache Negri	2952
34381	Cuca	2952
34382	Cudalbi	2952
34383	Draganesti	2952
34384	Draguseni	2952
34385	Fartanesti	2952
34386	Foltesti	2952
34387	Frumusita	2952
34388	Fundeni	2952
34389	Galati	2952
34390	Ghidigeni	2952
34391	Gohor	2952
34392	Grivita	2952
34393	Independenta	2952
34394	Ivesti	2952
34395	Jorasti	2952
34396	Liesti	2952
34397	Mastacani	2952
34398	Matca	2952
34399	Movileni	2952
34400	Munteni	2952
34401	Namoloasa	2952
34402	Nicoresti	2952
34403	Oancea	2952
34404	Pechea	2952
34405	Piscu	2952
34406	Priponesti	2952
34407	Rediu	2952
34408	Scanteiesti	2952
34409	Schela	2952
34410	Sendreni	2952
34411	Slobozia-Conachi	2952
34412	Smardan	2952
34413	Smulti	2952
34414	Suceveni	2952
34415	Targu Bujor	2952
34416	Tecuci	2952
34417	Tepu	2952
34418	Tudor Vladimirescu	2952
34419	Tulucesti	2952
34420	Umbraresti	2952
34421	Valea Marului	2952
34422	Vanatori	2952
34423	Varlezi	2952
34424	Vladesti	2952
34425	Adunatii-Copaceni	2953
34426	Baneasa	2953
34427	Bolintin Deal	2953
34428	Bolintinu-din-Vale	2953
34429	Bucsani	2953
34430	Bulbucata	2953
34431	Buturugeni	2953
34432	Calugareni	2953
34433	Clejani	2953
34434	Colibasi	2953
34435	Comana	2953
34436	Crevedia Mare	2953
34437	Daia	2953
34438	Floresti-Stoenesti	2953
34439	Fratesti	2953
34440	Gaiseni	2953
34441	Gaujani	2953
34442	Ghimpati	2953
34443	Giurgiu	2953
34444	Gogosari	2953
34445	Gostinari	2953
34446	Gostinu	2953
34447	Gradinari	2953
34448	Greaca	2953
34449	Hotarele	2953
34450	Iepuresti	2953
34451	Izvoarele	2953
34452	Joita	2953
34453	Letca Noua	2953
34454	Marsa	2953
34455	Mihai Bravu	2953
34456	Mihailesti	2953
34457	Ogrezeni	2953
34458	Oinacu	2953
34459	Prundu	2953
34460	Putineiu	2953
34461	Rasuceni	2953
34462	Roata de Jos	2953
34463	Schitu	2953
34464	Singureni	2953
34465	Slobozia	2953
34466	Stanesti	2953
34467	Stoenesti	2953
34468	Toporu	2953
34469	Ulmi	2953
34470	Valea Dragului	2953
34471	Vanatorii Mici	2953
34472	Varasti	2953
34473	Vedea	2953
34474	Albeni	2954
34475	Alimpesti	2954
34476	Aninoasa	2954
34477	Arcani	2954
34478	Baia de Fier	2954
34479	Balanesti	2954
34480	Balesti	2954
34481	Balteni	2954
34482	Barbatesti	2954
34483	Bengesti	2954
34484	Berlesti	2954
34485	Bolbosi	2954
34486	Borascu	2954
34487	Branesti	2954
34488	Bumbesti-Jiu	2954
34489	Bumbesti-Piticu	2954
34490	Bustuchin	2954
34491	Calnic	2954
34492	Capreni	2954
34493	Catunele	2954
34494	Ciuperceni	2954
34495	Crasna	2954
34496	Crusetu	2954
34497	Danciulesti	2954
34498	Danesti	2954
34499	Dragotesti	2954
34500	Dragutesti	2954
34501	Farcasesti	2954
34502	Glogova	2954
34503	Godinesti	2954
34504	Hurezani	2954
34505	Ionesti	2954
34506	Jupanesti	2954
34507	Lelesti	2954
34508	Licuriciu	2954
34509	Logresti	2954
34510	Matasari	2954
34511	Motru	2954
34512	Musetesti	2954
34513	Negomiru	2954
34514	Novaci	2954
34515	Pades	2954
34516	Pestisani	2954
34517	Plopsoru	2954
34518	Polovragi	2954
34519	Prigoria	2954
34520	Rosia de Amaradia	2954
34521	Rovinari	2954
34522	Runcu	2954
34523	Sacelu	2954
34524	Samarinesti	2954
34525	Saulesti	2954
34526	Schela	2954
34527	Scoarta	2954
34528	Slivilesti	2954
34529	Stanesti	2954
34530	Stejari	2954
34531	Stoina	2954
34532	Tantareni	2954
34533	Targu Carbunesti	2954
34534	Targu Jiu	2954
34535	Telesti	2954
34536	Ticleni	2954
34537	Tismana	2954
34538	Turburea	2954
34539	Turceni	2954
34540	Turcinesti	2954
34541	Urdari	2954
34542	Vagiulesti	2954
34543	Vladimir	2954
34544	Atid	2955
34545	Avramesti	2955
34546	Baile Tusnad	2955
34547	Balan	2955
34548	Bilbor	2955
34549	Borsec	2955
34550	Bradesti	2955
34551	Capalnita	2955
34552	Carta	2955
34553	Ciucsangeorgiu	2955
34554	Ciumani	2955
34555	Corbu	2955
34556	Corund	2955
34557	Cristuru Secuiesc	2955
34558	Danesti	2955
34559	Darjiu	2955
34560	Dealu	2955
34561	Ditrau	2955
34562	Feliceni	2955
34563	Frumoasa	2955
34564	Galautas	2955
34565	Gheorgheni	2955
34566	Joseni	2955
34567	Lazarea	2955
34568	Lueta	2955
34569	Lunca de Jos	2955
34570	Lunca de Sus	2955
34571	Lupeni	2955
34572	Martinis	2955
34573	Meresti	2955
34574	Miercurea-Ciuc	2955
34575	Mihaileni	2955
34576	Mugeni	2955
34577	Ocland	2955
34578	Odorheiu Secuiesc	2955
34579	Pauleni-Ciuc	2955
34580	Plaiesii-de-Jos	2955
34581	Praid	2955
34582	Remetea	2955
34583	Sacel	2955
34584	Sancraieni	2955
34585	Sandominic	2955
34586	Sanmartin	2955
34587	Sansimion	2955
34588	Sarmas	2955
34589	Secuieni	2955
34590	Siculeni	2955
34591	Simonesti	2955
34592	Subcetate	2955
34593	Suseni	2955
34594	Toplita	2955
34595	Tulghes	2955
34596	Tusnad	2955
34597	Ulies	2955
34598	Varsag	2955
34599	Vlahita	2955
34600	Voslobeni	2955
34601	Zetea	2955
34602	Aninoasa	2956
34603	Bacia	2956
34604	Baia de Cris	2956
34605	Baita	2956
34606	Balsa	2956
34607	Banita	2956
34608	Baru	2956
34609	Batrana	2956
34610	Beriu	2956
34611	Berthelot	2956
34612	Blajeni	2956
34613	Bosorod	2956
34614	Brad	2956
34615	Branisca	2956
34616	Bretea Romana	2956
34617	Buces	2956
34618	Bucuresci	2956
34619	Bulzesti	2956
34620	Bunila	2956
34621	Burjuc	2956
34622	Calan	2956
34623	Carjiti	2956
34624	Cerbal	2956
34625	Certeju de Sus	2956
34626	Criscior	2956
34627	Densus	2956
34628	Deva	2956
34629	Dobra	2956
34630	Geoagiu	2956
34631	Ghelari	2956
34632	Gurasada	2956
34633	Harau	2956
34634	Hateg	2956
34635	Hunedoara	2956
34636	Ilia	2956
34637	Lapugiu de Jos	2956
34638	Lelese	2956
34639	Lunca Cernii de Jos	2956
34640	Luncoiu de Jos	2956
34641	Lupeni	2956
34642	Martinesti	2956
34643	Orastie	2956
34644	Orastioara de Sus	2956
34645	Pestisu Mic	2956
34646	Petrila	2956
34647	Petrosani	2956
34648	Pui	2956
34649	Rachitova	2956
34650	Rapoltu Mare	2956
34651	Rau de Mori	2956
34652	Ribita	2956
34653	Romos	2956
34654	Salasu de Sus	2956
34655	Santamaria Orlea	2956
34656	Sarmizegetusa	2956
34657	Simeria	2956
34658	Soimus	2956
34659	Teliucu Inferior	2956
34660	Tomesti	2956
34661	Toplita	2956
34662	Totesti	2956
34663	Turdas	2956
34664	Uricani	2956
34665	Valisoara	2956
34666	Vata de Jos	2956
34667	Vetel	2956
34668	Vorta	2956
34669	Vulcan	2956
34670	Zam	2956
34671	Adancata	2957
34672	Albesti	2957
34673	Alexeni	2957
34674	Amara	2957
34675	Andrasesti	2957
34676	Armasesti	2957
34677	Axintele	2957
34678	Balaciu	2957
34679	Barcanesti	2957
34680	Bordusani	2957
34681	Brazii	2957
34682	Bucu	2957
34683	Cazanesti	2957
34684	Ciocarlia	2957
34685	Ciochina	2957
34686	Ciulnita	2957
34687	Cocora	2957
34688	Cosambesti	2957
34689	Cosereni	2957
34690	Dragoesti	2957
34691	Dridu	2957
34692	Facaeni	2957
34693	Fetesti	2957
34694	Fierbinti-Targ	2957
34695	Garbovi	2957
34696	Gheorghe Doja	2957
34697	Gheorghe Lazar	2957
34698	Giurgeni	2957
34699	Grindu	2957
34700	Grivita	2957
34701	Ion Roata	2957
34702	Jilavele	2957
34703	Manasia	2957
34704	Mihail Kogalniceanu	2957
34705	Milosesti	2957
34706	Movila	2957
34707	Movilita	2957
34708	Munteni Buzau	2957
34709	Perieti	2957
34710	Reviga	2957
34711	Salcioara	2957
34712	Saveni	2957
34713	Scanteia	2957
34714	Sfantu Gheorghe	2957
34715	Sinesti	2957
34716	Slobozia	2957
34717	Stelnica	2957
34718	Suditi	2957
34719	Tandarei	2957
34720	Urziceni	2957
34721	Valea Ciorii	2957
34722	Valea Macrisului	2957
34723	Vladeni	2957
34724	Alexandru Ioan Cuza	2958
34725	Andrieseni	2958
34726	Aroneanu	2958
34727	Baltati	2958
34728	Barnova	2958
34729	Belcesti	2958
34730	Bivolari	2958
34731	Braesti	2958
34732	Butea	2958
34733	Ceplenita	2958
34734	Ciortesti	2958
34735	Ciurea	2958
34736	Coarnele Caprei	2958
34737	Comarna	2958
34738	Costuleni	2958
34739	Cotnari	2958
34740	Cozmesti	2958
34741	Cristesti	2958
34742	Cucuteni	2958
34743	Dagata	2958
34744	Deleni	2958
34745	Dobrovat	2958
34746	Dolhesti	2958
34747	Dumesti	2958
34748	Erbiceni	2958
34749	Focuri	2958
34750	Golaesti	2958
34751	Gorban	2958
34752	Grajduri	2958
34753	Gropnita	2958
34754	Grozesti	2958
34755	Halaucesti	2958
34756	Harlau	2958
34757	Helesteni Harmaneasa	2958
34758	Holboca	2958
34759	Horlesti	2958
34760	Iasi	2958
34761	Ipatele	2958
34762	Lespezi	2958
34763	Letcani	2958
34764	Lungani	2958
34765	Madarjac	2958
34766	Mircesti	2958
34767	Mironeasa	2958
34768	Miroslava	2958
34769	Miroslovesti	2958
34770	Mogosesti	2958
34771	Mogosesti-Siret	2958
34772	Mosna	2958
34773	Motca	2958
34774	Movileni	2958
34775	Oteleni	2958
34776	Pascani	2958
34777	Plugari	2958
34778	Podu Iloaiei	2958
34779	Popesti	2958
34780	Popricani	2958
34781	Prisacani	2958
34782	Probota	2958
34783	Raducaneni	2958
34784	Rediu	2958
34785	Romanesti	2958
34786	Ruginoasa	2958
34787	Scanteia	2958
34788	Scheia	2958
34789	Schitu-Duca	2958
34790	Scobinti	2958
34791	Sinesti	2958
34792	Sipote	2958
34793	Siretel	2958
34794	Stolniceni-Prajescu	2958
34795	Strunga	2958
34796	Tansa	2958
34797	Targu Gangiulesti	2958
34798	Tatarusi	2958
34799	Tibana	2958
34800	Tibanesti	2958
34801	Tiganasi	2958
34802	Todiresti	2958
34803	Tomesti	2958
34804	Trifesti	2958
34805	Tutora	2958
34806	Ungheni	2958
34807	Valea Seaca	2958
34808	Vanatori	2958
34809	Victoria	2958
34810	Vladeni	2958
34811	Voinesti	2958
34812	Afumati	2959
34813	Balotesti	2959
34814	Berceni	2959
34815	Bragadiru	2959
34816	Branesti	2959
34817	Buftea	2959
34818	Cernica	2959
34819	Chiajna	2959
34820	Chitila	2959
34821	Ciolpani	2959
34822	Ciorogarla	2959
34823	Clinceni	2959
34824	Corbeanca	2959
34825	Cornetu	2959
34826	Darasti-Ilfov	2959
34827	Dascalu	2959
34828	Dobroesti	2959
34829	Domnesti	2959
34830	Dragomiresti-Vale	2959
34831	Ganeasa	2959
34832	Glina	2959
34833	Gradistea	2959
34834	Gruiu	2959
34835	Jilava	2959
34836	Magurele	2959
34837	Moara Vlasiei	2959
34838	Mogosoaia	2959
34839	Nuci	2959
34840	Otopeni	2959
34841	Pantelimon	2959
34842	Peris	2959
34843	Petrachioaia	2959
34844	Popesti-Leordeni	2959
34845	Prim Decembrie	2959
34846	Snagov	2959
34847	Stefanestii de Jos	2959
34848	Tunari	2959
34849	Vidra	2959
34850	Voluntari	2959
34851	Ardusat	2960
34852	Arinis	2960
34853	Asuaju de Sus	2960
34854	Baia Mare	2960
34855	Baia-Sprie	2960
34856	Baita de sub Codru	2960
34857	Baiut	2960
34858	Barsana	2960
34859	Basesti	2960
34860	Bicaz	2960
34861	Bistra	2960
34862	Bocicoiu Mare	2960
34863	Bogdan Voda	2960
34864	Boiu Mare	2960
34865	Borsa	2960
34866	Botiza	2960
34867	Budesti	2960
34868	Calinesti	2960
34869	Campulung la Tisa	2960
34870	Cavnic	2960
34871	Cernesti	2960
34872	Cicarlau	2960
34873	Copalnic Manastur	2960
34874	Coroieni	2960
34875	Cupseni	2960
34876	Desesti	2960
34877	Dragomiresti	2960
34878	Dumbravita	2960
34879	Farcasa	2960
34880	Giulesti	2960
34881	Grosi	2960
34882	Ieud	2960
34883	Lapus	2960
34884	Leordina	2960
34885	Miresu Mare	2960
34886	Moisei	2960
34887	Oarta de Jos	2960
34888	Ocna Sugatag	2960
34889	Petrova	2960
34890	Poienile Izei	2960
34891	Poienile de sub Munte	2960
34892	Recea	2960
34893	Remetea Chioarului	2960
34894	Remeti	2960
34895	Repedea	2960
34896	Rona de Jos	2960
34897	Rona de Sus	2960
34898	Rozavlea	2960
34899	Ruscova	2960
34900	Sacalaseni	2960
34901	Sacel	2960
34902	Salistea de Sus	2960
34903	Salsig	2960
34904	Sapanta	2960
34905	Sarasau	2960
34906	Sasar	2960
34907	Satulung	2960
34908	Seini	2960
34909	Sighetu Marmatiei	2960
34910	Sisesti	2960
34911	Somcuta Mare	2960
34912	Stramtura	2960
34913	Suciu de Sus	2960
34914	Targu-Lapus	2960
34915	Tautii Margheraus	2960
34916	Ulmeni	2960
34917	Vadu Izei	2960
34918	Valea Chioarului	2960
34919	Vima Mica	2960
34920	Viseu de Jos	2960
34921	Viseu de Sus	2960
34922	Baclesu	2961
34923	Baia de Arama	2961
34924	Bala	2961
34925	Balacita	2961
34926	Balta	2961
34927	Balvanesti	2961
34928	Breznita Ocol	2961
34929	Breznita-Motru	2961
34930	Brosteni	2961
34931	Burila Mare	2961
34932	Butoiesti	2961
34933	Cazanesti	2961
34934	Ciresu	2961
34935	Corcova	2961
34936	Corlatel	2961
34937	Cujmir	2961
34938	Darvari	2961
34939	Devesel	2961
34940	Drobeta-Turnu Severin	2961
34941	Dubova	2961
34942	Dumbrava	2961
34943	Eselnita	2961
34944	Floresti	2961
34945	Garla Mare	2961
34946	Godeanu	2961
34947	Gogosu	2961
34948	Greci	2961
34949	Grozesti	2961
34950	Gruia	2961
34951	Hinova	2961
34952	Husnicioara	2961
34953	Ilovat	2961
34954	Ilovita	2961
34955	Isverna	2961
34956	Izvoru Barzii	2961
34957	Jiana	2961
34958	Livezile	2961
34959	Malovat	2961
34960	Obarsia Noua	2961
34961	Obarsia-Closani	2961
34962	Oprisor	2961
34963	Orsova	2961
34964	Padina	2961
34965	Patulele	2961
34966	Podeni	2961
34967	Ponoarele	2961
34968	Poroina Mare	2961
34969	Pristol	2961
34970	Prunisor	2961
34971	Punghina	2961
34972	Rogova	2961
34973	Salcia	2961
34974	Simian	2961
34975	Sisesti	2961
34976	Sovarna	2961
34977	Stangaceaua	2961
34978	Strehaia	2961
34979	Svinita	2961
34980	Tamna	2961
34981	Vanatori	2961
34982	Vanju Mare	2961
34983	Vanjulet	2961
34984	Vladaia	2961
34985	Voloiac	2961
34986	Acatari	2962
34987	Adamus	2962
34988	Albesti	2962
34989	Alunis	2962
34990	Apold	2962
34991	Atintis	2962
34992	Bagaciu	2962
34993	Bahnea	2962
34994	Bala	2962
34995	Balauseri	2962
34996	Band	2962
34997	Batos	2962
34998	Beica de Jos	2962
34999	Bichis	2962
35000	Bogata	2962
35001	Brancovenesti	2962
35002	Breaza	2962
35003	Ceuasul-de Campie	2962
35004	Chetani	2962
35005	Chiheru de Jos	2962
35006	Coroisanmartin	2962
35007	Cozma	2962
35008	Craciunesti	2962
35009	Craiesti	2962
35010	Cristesti	2962
35011	Cucerdea	2962
35012	Cuci	2962
35013	Danes	2962
35014	Deda	2962
35015	Eremitu	2962
35016	Ernei	2962
35017	Fantanele	2962
35018	Faragau	2962
35019	Galesti	2962
35020	Ganesti	2962
35021	Gheorghe Doja	2962
35022	Ghindari	2962
35023	Glodeni	2962
35024	Gornesti	2962
35025	Grebenisu de Campie	2962
35026	Gurghiu	2962
35027	Hodac	2962
35028	Hodosa	2962
35029	Ibanesti	2962
35030	Iclanzel	2962
35031	Ideciu de Jos	2962
35032	Iernut	2962
35033	Livezeni	2962
35034	Ludus	2962
35035	Lunca	2962
35036	Lunca Bradului	2962
35037	Magherani	2962
35038	Mica	2962
35039	Miercurea Nirajului	2962
35040	Mihesu de Campie	2962
35041	Nades	2962
35042	Neaua	2962
35043	Ogra	2962
35044	Panet	2962
35045	Papiu Ilarian	2962
35046	Pasareni	2962
35047	Petelea	2962
35048	Pogaceaua	2962
35049	Raciu	2962
35050	Rastolita	2962
35051	Reghin	2962
35052	Rusii Munti	2962
35053	Sancraiul-de-Mures	2962
35054	Sangeorg-de Mures	2962
35055	Sangeorgiu-de-Padure	2962
35056	Sanger	2962
35057	Sanpaul	2962
35058	Sanpetru-de-Campie	2962
35059	Santana-de-Mures	2962
35060	Sarmasu	2962
35061	Saschiz	2962
35062	Saulia	2962
35063	Sighisoara	2962
35064	Sincai	2962
35065	Solovastru	2962
35066	Sovata	2962
35067	Stanceni	2962
35068	Suplac	2962
35069	Suseni	2962
35070	Targu-Mures	2962
35071	Tarnaveni	2962
35072	Taureni	2962
35073	Ungheni	2962
35074	Valea Larga	2962
35075	Vanatori	2962
35076	Vargata	2962
35077	Vatava	2962
35078	Vetca	2962
35079	Viisoara	2962
35080	Voivodeni	2962
35081	Zagar	2962
35082	Zau de Campie	2962
35083	Agapia	2963
35084	Bahna	2963
35085	Baltatesti	2963
35086	Bara	2963
35087	Bargaoani	2963
35088	Bicaz	2963
35089	Bicaz Chei	2963
35090	Bicazu Ardelean	2963
35091	Bodesti	2963
35092	Borca	2963
35093	Borlesti	2963
35094	Botesti	2963
35095	Bozieni	2963
35096	Brusturi-Draganesti	2963
35097	Candesti	2963
35098	Ceahlau	2963
35099	Cordun	2963
35100	Costisa	2963
35101	Cracaoani	2963
35102	Damuc	2963
35103	Dobreni	2963
35104	Doljesti	2963
35105	Dragomiresti	2963
35106	Dulcesti	2963
35107	Dumbrava Rosie	2963
35108	Farcasa	2963
35109	Faurei	2963
35110	Garcina	2963
35111	Gheraesti	2963
35112	Girov	2963
35113	Grinties	2963
35114	Grumazesti	2963
35115	Hangu	2963
35116	Horia	2963
35117	Icusesti	2963
35118	Ion Creanga	2963
35119	Margineni	2963
35120	Moldoveni	2963
35121	Oniceni	2963
35122	Pangarati	2963
35123	Pastraveni	2963
35124	Petricani	2963
35125	Piatra Neamt	2963
35126	Piatra Soimului	2963
35127	Pipirig	2963
35128	Podoleni	2963
35129	Poiana Teiului	2963
35130	Poienari	2963
35131	Raucesti	2963
35132	Razboieni	2963
35133	Rediu	2963
35134	Roman	2963
35135	Romani	2963
35136	Roznov	2963
35137	Sabaoani	2963
35138	Sagna	2963
35139	Savinesti	2963
35140	Secuieni	2963
35141	Stanita	2963
35142	Stefan cel Mare	2963
35143	Tamaseni	2963
35144	Tarcau	2963
35145	Targu-Neamt	2963
35146	Tasca	2963
35147	Tazlau	2963
35148	Tibucani	2963
35149	Timisesti	2963
35150	Trifesti	2963
35151	Tupilati	2963
35152	Urecheni	2963
35153	Valea Ursului	2963
35154	Vanatori-Neamt	2963
35155	Viisoara	2963
35156	Zanesti	2963
35157	Babiciu	2964
35158	Baldovinesti	2964
35159	Bals	2964
35160	Barasti	2964
35161	Barza	2964
35162	Bobicesti	2964
35163	Brancoveni	2964
35164	Brastavatu	2964
35165	Brebeni	2964
35166	Bucinisu	2964
35167	Caracal	2964
35168	Carlogani	2964
35169	Cezieni	2964
35170	Cilieni	2964
35171	Colonesti	2964
35172	Corabia	2964
35173	Corbu	2964
35174	Coteana	2964
35175	Crampoaia	2964
35176	Cungrea	2964
35177	Curtisoara	2964
35178	Daneasa	2964
35179	Deveselu	2964
35180	Dobretu	2964
35181	Dobrosloveni	2964
35182	Dobroteasa	2964
35183	Dobrun	2964
35184	Draganesti-Olt	2964
35185	Draghiceni	2964
35186	Fagetelu	2964
35187	Falcoiu	2964
35188	Farcasele	2964
35189	Ganeasa	2964
35190	Garcovu	2964
35191	Giuvarasti	2964
35192	Gostavatu	2964
35193	Gradinari	2964
35194	Grojdibodu	2964
35195	Ianca	2964
35196	Iancu Jianu	2964
35197	Icoana	2964
35198	Izbiceni	2964
35199	Izvoarele	2964
35200	Leleasca	2964
35201	Maruntei	2964
35202	Mihaesti	2964
35203	Milcov	2964
35204	Morunglav	2964
35205	Movileni	2964
35206	Nicolae Titulescu	2964
35207	Obarsia	2964
35208	Oboga	2964
35209	Oporelu	2964
35210	Optasi	2964
35211	Orlea	2964
35212	Osica de Sus	2964
35213	Parscoveni	2964
35214	Perieti	2964
35215	Piatra Olt	2964
35216	Plesoiu	2964
35217	Poboru	2964
35218	Potcoava	2964
35219	Priseaca	2964
35220	Radomiresti	2964
35221	Redea	2964
35222	Rotunda	2964
35223	Rusanesti	2964
35224	Samburesti	2964
35225	Scarisoara	2964
35226	Schitu	2964
35227	Scornicesti	2964
35228	Seaca	2964
35229	Serbanesti	2964
35230	Slatina	2964
35231	Slatioara	2964
35232	Spineni	2964
35233	Sprancenata	2964
35234	Stefan cel Mare	2964
35235	Stoenesti	2964
35236	Stoicanesti	2964
35237	Strejesti	2964
35238	Studina	2964
35239	Tatulesti	2964
35240	Teslui	2964
35241	Tia Mare	2964
35242	Topana	2964
35243	Traian	2964
35244	Tufeni	2964
35245	Urzica	2964
35246	Vadastra	2964
35247	Vadastrita	2964
35248	Valcele	2964
35249	Valea Mare	2964
35250	Valeni	2964
35251	Verguleasa	2964
35252	Visina	2964
35253	Vitomiresti	2964
35254	Vladila	2964
35255	Voineasa	2964
35256	Vulpeni	2964
35257	Vulturesti	2964
35258	Adunati	2965
35259	Albesti-Paleologu	2965
35260	Alunis	2965
35261	Apostolache	2965
35262	Aricestii-Rahtivani	2965
35263	Aricestii-Zeletin	2965
35264	Azuga	2965
35265	Baba Ana	2965
35266	Baicoi	2965
35267	Balta Doamnei	2965
35268	Baltesti	2965
35269	Banesti	2965
35270	Barcanesti	2965
35271	Berceni	2965
35272	Bertea	2965
35273	Blejoi	2965
35274	Boldesti	2965
35275	Boldesti-Scaeni	2965
35276	Brazi	2965
35277	Breaza	2965
35278	Brebu	2965
35279	Bucov	2965
35280	Busteni	2965
35281	Calugareni	2965
35282	Campina	2965
35283	Carbunesti	2965
35284	Ceptura	2965
35285	Cerasu	2965
35286	Chiojdeanca	2965
35287	Ciorani	2965
35288	Cocorastii-Misli	2965
35289	Colceag	2965
35290	Comarnic	2965
35291	Cornu	2965
35292	Cosminele	2965
35293	Doftana	2965
35294	Draganesti	2965
35295	Drajna	2965
35296	Dumbrava	2965
35297	Dumbravesti	2965
35298	Fantanele	2965
35299	Filipestii de Padure	2965
35300	Filipestii de Targ	2965
35301	Floresti	2965
35302	Fulga	2965
35303	Gherghita	2965
35304	Gorgota	2965
35305	Gornet	2965
35306	Gornet-Cricov	2965
35307	Gura Vadului	2965
35308	Gura Vitioarei	2965
35309	Iordacheanu	2965
35310	Izvoarele	2965
35311	Jugureni	2965
35312	Lapos	2965
35313	Lipanesti	2965
35314	Magurele	2965
35315	Magureni	2965
35316	Maneciu	2965
35317	Manesti	2965
35318	Mizil	2965
35319	Pacureti	2965
35320	Paulesti	2965
35321	Ploiesti	2965
35322	Plopeni	2965
35323	Plopu	2965
35324	Podenii Noi	2965
35325	Poenarii-Burchi	2965
35326	Poiana Campina	2965
35327	Posesti	2965
35328	Predeal-Sarari	2965
35329	Provita de Jos	2965
35330	Provita de Sus	2965
35331	Puchenii Mari	2965
35332	Rafov	2965
35333	Salcia	2965
35334	Salciile	2965
35335	Sangeru	2965
35336	Scorteni	2965
35337	Secaria	2965
35338	Sinaia	2965
35339	Sirna	2965
35340	Slanic	2965
35341	Soimari	2965
35342	Sotrile	2965
35343	Starchiojd	2965
35344	Stefesti	2965
35345	Surani	2965
35346	Talea	2965
35347	Targsorul-Vechi	2965
35348	Tataru	2965
35349	Teisani	2965
35350	Telega	2965
35351	Tinosu	2965
35352	Tomsani	2965
35353	Urlati	2965
35354	Valcanesti	2965
35355	Valea Calugareasca	2965
35356	Valenii de Munte	2965
35357	Varbilau	2965
35358	Agrij	2966
35359	Almasu	2966
35360	Babeni	2966
35361	Balan	2966
35362	Banisor	2966
35363	Benesat	2966
35364	Bobota	2966
35365	Bocsa	2966
35366	Buciumi	2966
35367	Camar	2966
35368	Carastelec	2966
35369	Cehu Silvaniei	2966
35370	Chiesd	2966
35371	Cizer	2966
35372	Coseiu	2966
35373	Crasna	2966
35374	Creaca	2966
35375	Criseni	2966
35376	Cristolt	2966
35377	Cuzaplac	2966
35378	Dobrin	2966
35379	Dragu	2966
35380	Fildu de Jos	2966
35381	Galgau	2966
35382	Garbou	2966
35383	Halmasd	2966
35384	Hereclean	2966
35385	Hida	2966
35386	Horoatu Crasnei	2966
35387	Ileanda	2966
35388	Ip	2966
35389	Jibou	2966
35390	Letca	2966
35391	Lozna	2966
35392	Maeriste	2966
35393	Marca	2966
35394	Mesesenii de Jos	2966
35395	Mirsid	2966
35396	Napradea	2966
35397	Nusfalau	2966
35398	Periceiu	2966
35399	Plopis	2966
35400	Poiana Blenchii	2966
35401	Romanasi	2966
35402	Rus	2966
35403	Sag	2966
35404	Salatig	2966
35405	Samsud	2966
35406	Sanmihaiul-Almasului	2966
35407	Sarmasag	2966
35408	Simleu Silvaniei	2966
35409	Somes-Odorhei	2966
35410	Surduc	2966
35411	Treznea	2966
35412	Valcau de Jos	2966
35413	Varsolt	2966
35414	Zalau	2966
35415	Zalha	2966
35416	Zimbor	2966
35417	Agnita	2968
35418	Altina	2968
35419	Apoldu de Jos	2968
35420	Arpasu de Jos	2968
35421	Atel	2968
35422	Avrig	2968
35423	Axente Sever	2968
35424	Barghis	2968
35425	Bazna	2968
35426	Biertan	2968
35427	Blajel	2968
35428	Bradeni	2968
35429	Brateiu	2968
35430	Bruiu	2968
35431	Carta	2968
35432	Cartisoara	2968
35433	Chirpar	2968
35434	Cisnadie	2968
35435	Copsa Mica	2968
35436	Cristian	2968
35437	Darlos	2968
35438	Dumbraveni	2968
35439	Gura Raului	2968
35440	Hoghilag	2968
35441	Iacobeni	2968
35442	Jina	2968
35443	Laslea	2968
35444	Loamnes	2968
35445	Ludos	2968
35446	Marpod	2968
35447	Medias	2968
35448	Merghindeal	2968
35449	Micasasa	2968
35450	Miercurea Sibiului	2968
35451	Mihaileni	2968
35452	Mosna	2968
35453	Nocrich	2968
35454	Ocna Sibiului	2968
35455	Orlat	2968
35456	Pauca	2968
35457	Poiana Sibiului	2968
35458	Poplaca	2968
35459	Porumbacu de Jos	2968
35460	Racovita	2968
35461	Rasinari	2968
35462	Rau Sadului	2968
35463	Rosia	2968
35464	Sadu	2968
35465	Saliste	2968
35466	Seica Mare	2968
35467	Seica Mica	2968
35468	Selimbar	2968
35469	Sibiu	2968
35470	Slimnic	2968
35471	Sura Mare	2968
35472	Sura Mica	2968
35473	Talmaciu	2968
35474	Tarnava	2968
35475	Tilisca	2968
35476	Turnu Rosu	2968
35477	Valea Viilor	2968
35478	Vurpar	2968
35479	Sondelor	2969
35480	Adancata	2970
35481	Arbore	2970
35482	Baia	2970
35483	Balcauti	2970
35484	Bilca	2970
35485	Bogdanesti	2970
35486	Boroaia	2970
35487	Bosanci	2970
35488	Botosana	2970
35489	Breaza	2970
35490	Brodina	2970
35491	Brosteni	2970
35492	Bunesti	2970
35493	Cacica	2970
35494	Cajvana	2970
35495	Calafindesti	2970
35496	Campulung Moldovenesc	2970
35497	Carlibaba	2970
35498	Ciprian Porumbescu	2970
35499	Cornu Luncii	2970
35500	Crucea	2970
35501	Darmanesti	2970
35502	Dolhasca	2970
35503	Dolhesti	2970
35504	Dorna	2970
35505	Dorna Candrenilor	2970
35506	Dornesti	2970
35507	Dragoesti	2970
35508	Draguseni	2970
35509	Dumbraveni	2970
35510	Falticeni	2970
35511	Fantanele	2970
35512	Forasti	2970
35513	Frasin	2970
35514	Fratautii Noi	2970
35515	Fratautii Vechi	2970
35516	Frumosu	2970
35517	Fundu Moldovei	2970
35518	Galanesti	2970
35519	Gramesti	2970
35520	Granicesti	2970
35521	Gura Humorului	2970
35522	Horodniceni	2970
35523	Horodnicu	2970
35524	Iacobeni	2970
35525	Ipotesti	2970
35526	Izvoarele Sucevei	2970
35527	Liteni	2970
35528	Malini	2970
35529	Manastirea Homorului	2970
35530	Marginea	2970
35531	Milisauti	2970
35532	Mitocu Dragomirnei	2970
35533	Moara	2970
35534	Moldova Sulita	2970
35535	Moldovita	2970
35536	Musenita	2970
35537	Ostra	2970
35538	Paltinoasa	2970
35539	Panaci	2970
35540	Partestii de Jos	2970
35541	Patrauti	2970
35542	Poiana Stampei	2970
35543	Pojorata	2970
35544	Preutesti	2970
35545	Putna	2970
35546	Radaseni	2970
35547	Radauti	2970
35548	Rasca	2970
35549	Sadova	2970
35550	Salcea	2970
35551	Saru Dornei	2970
35552	Satu Mare	2970
35553	Scheia	2970
35554	Siminicea	2970
35555	Siret	2970
35556	Slatina	2970
35557	Solca	2970
35558	Straja	2970
35559	Stroiesti	2970
35560	Stulpicani	2970
35561	Suceava	2970
35562	Sucevita	2970
35563	Todiresti	2970
35564	Udesti	2970
35565	Ulma	2970
35566	Vadu Moldovei	2970
35567	Valea Moldovei	2970
35568	Vama	2970
35569	Vatra Dornei	2970
35570	Vatra Moldovitei	2970
35571	Veresti	2970
35572	Vicovu de Jos	2970
35573	Vicovu de Sus	2970
35574	Volovat	2970
35575	Vulturesti	2970
35576	Zamostea	2970
35577	Zvoristea	2970
35578	Alexandria	2971
35579	Babaita	2971
35580	Balaci	2971
35581	Blejesti	2971
35582	Bogdana	2971
35583	Botoroaga	2971
35584	Bragadiru	2971
35585	Branceni	2971
35586	Bujoreni	2971
35587	Bujoru	2971
35588	Buzescu	2971
35589	Calinesti	2971
35590	Calmatuiu	2971
35591	Cervenia	2971
35592	Ciolanesti	2971
35593	Ciuperceni	2971
35594	Contesti	2971
35595	Cosmesti	2971
35596	Crangeni	2971
35597	Crangu	2971
35598	Crevenicu	2971
35599	Didesti	2971
35600	Dobrotesti	2971
35601	Dracsenei	2971
35602	Draganesti de Vede	2971
35603	Draganesti-Vlasca	2971
35604	Frumoasa	2971
35605	Furculesti	2971
35606	Galateni	2971
35607	Gratia	2971
35608	Islaz	2971
35609	Izvoarele	2971
35610	Lisa	2971
35611	Lita	2971
35612	Lunca	2971
35613	Magura	2971
35614	Maldaeni	2971
35615	Marzanesti	2971
35616	Mavrodin	2971
35617	Mereni	2971
35618	Mosteni	2971
35619	Nanov	2971
35620	Nasturelu	2971
35621	Necsesti	2971
35622	Olteni	2971
35623	Orbeasca	2971
35624	Peretu	2971
35625	Piatra	2971
35626	Pietrosani	2971
35627	Plopii Slavitesti	2971
35628	Plosca	2971
35629	Poeni	2971
35630	Poroschia	2971
35631	Putineiu	2971
35632	Radoiesti	2971
35633	Rasmiresti	2971
35634	Rosiori de Vede	2971
35635	Saceni	2971
35636	Salcia	2971
35637	Sarbeni	2971
35638	Scrioastea	2971
35639	Scurtu Mare	2971
35640	Seaca	2971
35641	Segarcea Vale	2971
35642	Sfintesti	2971
35643	Silistea	2971
35644	Silistea-Gumesti	2971
35645	Slobozia-Mandra	2971
35646	Smardioasa	2971
35647	Stejaru	2971
35648	Storobaneasa	2971
35649	Suhaia	2971
35650	Talpa	2971
35651	Tatarastii de Jos	2971
35652	Tatarastii de Sus	2971
35653	Tiganesti	2971
35654	Traian	2971
35655	Trivalea-Mosteni	2971
35656	Troianul	2971
35657	Turnu Magurele	2971
35658	Vartoapele-de-Jos	2971
35659	Vedea	2971
35660	Videle	2971
35661	Viisoara	2971
35662	Vitanesti	2971
35663	Zambreasca	2971
35664	Zimnicea	2971
35665	Balint	2972
35666	Banloc	2972
35667	Bara	2972
35668	Barna	2972
35669	Beba Veche	2972
35670	Becicherecu Mic	2972
35671	Belint	2972
35672	Bethausen	2972
35673	Biled	2972
35674	Bogda	2972
35675	Boldur	2972
35676	Brestovat	2972
35677	Buzias	2972
35678	Carpinis	2972
35679	Cenad	2972
35680	Cenei	2972
35681	Cheveresu Mare	2972
35682	Ciacova	2972
35683	Comlosu Mare	2972
35684	Costeiu	2972
35685	Criciova	2972
35686	Curtea	2972
35687	Darova	2972
35688	Denta	2972
35689	Deta	2972
35690	Dudestii Vechi	2972
35691	Dumbrava	2972
35692	Dumbravita	2972
35693	Faget	2972
35694	Fardea	2972
35695	Foeni	2972
35696	Gataia	2972
35697	Gavojdia	2972
35698	Ghiroda	2972
35699	Ghizela	2972
35700	Giarmata	2972
35701	Giera	2972
35702	Giroc	2972
35703	Giulvaz	2972
35704	Jamu Mare	2972
35705	Jebel	2972
35706	Jimbolia	2972
35707	Lenauheim	2972
35708	Liebling	2972
35709	Lovrin	2972
35710	Lugoj	2972
35711	Manastiur	2972
35712	Margina	2972
35713	Masloc	2972
35714	Moravita	2972
35715	Mosnita Noua	2972
35716	Nadrag	2972
35717	Nitchidorf	2972
35718	Ohaba Lunga	2972
35719	Ortisoara	2972
35720	Peciu Nou	2972
35721	Periam	2972
35722	Pietroasa	2972
35723	Pischia	2972
35724	Racovita	2972
35725	Recas	2972
35726	Remetea Mare	2972
35727	Sacalaz	2972
35728	Sacosu Turcesc	2972
35729	Sag	2972
35730	Sanandrei	2972
35731	Sanmihaiu Roman	2972
35732	Sannicolaul Mare	2972
35733	Sanpetrul-Mare	2972
35734	Satchinez	2972
35735	Secas	2972
35736	Stiuca	2972
35737	Teremia Mare	2972
35738	Timisoara	2972
35739	Tomesti	2972
35740	Topolovatu Mare	2972
35741	Tormac	2972
35742	Traian Vuia	2972
35743	Uivar	2972
35744	Varias	2972
35745	Victor Vlad Delamarina	2972
35746	Voiteg	2972
35747	Babadag	2973
35748	Baia	2973
35749	Beidaud	2973
35750	Carcaliu	2973
35751	Casimcea	2973
35752	Ceamurlia de Jos	2973
35753	Ceatalchioi	2973
35754	Cerna	2973
35755	Chilia Veche	2973
35756	Ciucurova	2973
35757	Constantin Rosetti	2973
35758	Crisan	2973
35759	Daeni	2973
35760	Dorobantu	2973
35761	Frecatei	2973
35762	Greci	2973
35763	Grindu	2973
35764	Hamcearca	2973
35765	Horia	2973
35766	Ion Bratianu	2973
35767	Isaccea	2973
35768	Izvoarele	2973
35769	Jijila	2973
35770	Jurilovca	2973
35771	Luncavita	2973
35772	Macin	2973
35773	Mahmudia	2973
35774	Malnas	2973
35775	Mihai Bravu	2973
35776	Mihail Kogalniceanu	2973
35777	Murighiol	2973
35778	Nalbant	2973
35779	Niculitel	2973
35780	Nufaru	2973
35781	Ostrov	2973
35782	Pardina	2973
35783	Peceneaga	2973
35784	Sarichioi	2973
35785	Sfantu Gheorghe	2973
35786	Slava Cercheza	2973
35787	Smardan	2973
35788	Somova	2973
35789	Stejaru	2973
35790	Sulina	2973
35791	Topolog	2973
35792	Tulcea	2973
35793	Turcoaia	2973
35794	Valea Nucarilor	2973
35795	Alunu	2974
35796	Amarasti	2974
35797	Babeni	2974
35798	Baile Govora	2974
35799	Baile Olanesti	2974
35800	Balcesti	2974
35801	Barbatesti	2974
35802	Berbesti	2974
35803	Berislavesti	2974
35804	Boisoara	2974
35805	Brezoi	2974
35806	Budesti	2974
35807	Bujoreni	2974
35808	Bunesti	2974
35809	Caineni	2974
35810	Calimanesti	2974
35811	Cernisoara	2974
35812	Copaceni	2974
35813	Costesti	2974
35814	Creteni	2974
35815	Daesti	2974
35816	Danicei	2974
35817	Dragasani	2974
35818	Dragoesti	2974
35819	Fartatesti	2974
35820	Fauresti	2974
35821	Francesti	2974
35822	Galicea	2974
35823	Ghioroiu	2974
35824	Glavile	2974
35825	Golesti	2974
35826	Gradistea	2974
35827	Gusoeni	2974
35828	Horezu	2974
35829	Ionesti	2974
35830	Ladesti	2974
35831	Lalosu	2974
35832	Lapusata	2974
35833	Livezi	2974
35834	Lungesti	2974
35835	Maciuca	2974
35836	Madulari	2974
35837	Malaia	2974
35838	Maldaresti	2974
35839	Mateesti	2974
35840	Mihaesti	2974
35841	Milcoiu	2974
35842	Muereasca	2974
35843	Nicolae Balcescu	2974
35844	Ocnele Mari	2974
35845	Olanu	2974
35846	Orlesti	2974
35847	Otesani	2974
35848	Pausesti	2974
35849	Pausesti-Maglasi	2974
35850	Perisani	2974
35851	Pesceana	2974
35852	Pietrari	2974
35853	Popesti	2974
35854	Prundeni	2974
35855	Racovita	2974
35856	Ramnicu Valcea	2974
35857	Roesti	2974
35858	Rosiile	2974
35859	Runcu	2974
35860	Salatrucel	2974
35861	Scundu	2974
35862	Sinesti	2974
35863	Sirineasa	2974
35864	Slatioara	2974
35865	Stanesti	2974
35866	Stefanesti	2974
35867	Stoenesti	2974
35868	Stoilesti	2974
35869	Stroesti	2974
35870	Susani	2974
35871	Sutesti	2974
35872	Tetoiu	2974
35873	Tomsani	2974
35874	Vaideeni	2974
35875	Valea Mare	2974
35876	Vladesti	2974
35877	Voicesti	2974
35878	Voineasa	2974
35879	Zatreni	2974
35880	Albesti	2975
35881	Alexandru Vlahuta	2975
35882	Arsura	2975
35883	Bacani	2975
35884	Bacesti	2975
35885	Balteni	2975
35886	Banca	2975
35887	Barlad	2975
35888	Berezeni	2975
35889	Blagesti	2975
35890	Bogdana	2975
35891	Bogdanesti	2975
35892	Bogdanita	2975
35893	Botesti	2975
35894	Bunesti	2975
35895	Codaesti	2975
35896	Coroiesti	2975
35897	Costesti	2975
35898	Cretesti	2975
35899	Danesti	2975
35900	Deleni	2975
35901	Delesti	2975
35902	Dimitrie Cantemir	2975
35903	Dragomiresti	2975
35904	Dranceni Sat	2975
35905	Duda	2975
35906	Dumesti	2975
35907	Epureni	2975
35908	Falciu	2975
35909	Gagesti	2975
35910	Garceni	2975
35911	Gherghesti	2975
35912	Grivita	2975
35913	Hoceni	2975
35914	Husi	2975
35915	Iana	2975
35916	Ivanesti	2975
35917	Ivesti	2975
35918	Laza	2975
35919	Lipovat	2975
35920	Lunca Banului	2975
35921	Malusteni	2975
35922	Miclesti	2975
35923	Muntenii de Jos	2975
35924	Murgeni	2975
35925	Negresti	2975
35926	Oltenesti	2975
35927	Osesti	2975
35928	Padureni	2975
35929	Perieni	2975
35930	Pogana	2975
35931	Poienesti	2975
35932	Puiesti	2975
35933	Pungesti	2975
35934	Rebricea	2975
35935	Rosiesti	2975
35936	Solesti	2975
35937	Stanilesti	2975
35938	Stefan cel Mare	2975
35939	Suletea	2975
35940	Tacuta	2975
35941	Tanacu	2975
35942	Tatarani	2975
35943	Todiresti	2975
35944	Tutova	2975
35945	Valeni	2975
35946	Vaslui	2975
35947	Vetrisoaia	2975
35948	Viisoara	2975
35949	Vinderei	2975
35950	Voinesti	2975
35951	Vulturesti	2975
35952	Vutcani	2975
35953	Zapodeni	2975
35954	Zorleni	2975
35955	Adjud	2976
35956	Andreiasu de Jos	2976
35957	Balesti	2976
35958	Barsesti	2976
35959	Boghesti	2976
35960	Bolotesti	2976
35961	Bordesti	2976
35962	Brosteni	2976
35963	Campineanca	2976
35964	Campuri	2976
35965	Carligele	2976
35966	Chiojdeni	2976
35967	Ciorasti	2976
35968	Corbita	2976
35969	Cotesti	2976
35970	Dumbraveni	2976
35971	Dumitresti	2976
35972	Fitionesti	2976
35973	Focsani	2976
35974	Garoafa	2976
35975	Golesti	2976
35976	Gugesti	2976
35977	Gura Calitei	2976
35978	Homocea	2976
35979	Jaristea	2976
35980	Jitia	2976
35981	Maicanesti	2976
35982	Marasesti	2976
35983	Mera	2976
35984	Milcovul	2976
35985	Movilita	2976
35986	Nanesti	2976
35987	Naruja	2976
35988	Nereju	2976
35989	Nistoresti	2976
35990	Odobesti	2976
35991	Paltin	2976
35992	Panciu	2976
35993	Paunesti	2976
35994	Poiana Cristei	2976
35995	Pufesti	2976
35996	Racoasa	2976
35997	Reghiu	2976
35998	Ruginesti	2976
35999	Sihlea	2976
36000	Slobozia Bradului	2976
36001	Slobozia-Ciorasti	2976
36002	Soveja	2976
36003	Straoane	2976
36004	Suraia	2976
36005	Tamboesti	2976
36006	Tanasoaia	2976
36007	Tataranu	2976
36008	Tifesti	2976
36009	Tulnici	2976
36010	Urechesti	2976
36011	Valea Sarii	2976
36012	Vanatori	2976
36013	Vartescoiu	2976
36014	Vidra	2976
36015	Vintileasca	2976
36016	Vizantea	2976
36017	Vrancioaia	2976
36018	Vulturu	2976
36019	Adygejsk	2977
36020	Enem	2977
36021	Jablonovskij	2977
36022	Kamennomostskij	2977
36023	Majkop	2977
36024	Tulskij	2977
36025	Aginskoje	2978
36026	Alagir	2979
36027	Ardon	2979
36028	Beslan	2979
36029	Digora	2979
36030	Mozdok	2979
36031	Vladikavkaz	2979
36032	Zavodskoj	2979
36033	Alejsk	2980
36034	Barnaul	2980
36035	Belojarsk	2980
36036	Belokuriha	2980
36037	Bijsk	2980
36038	Blagoveshchenka	2980
36039	Gornjak	2980
36040	Jarovoe	2980
36041	Juzhnyj	2980
36042	Kamen-na-Obi	2980
36043	Novoaltajsk	2980
36044	Novosilikatnyj	2980
36045	Rubcovsk	2980
36046	Sibirskiy	2980
36047	Slavgorod	2980
36048	Talmenka	2980
36049	Zarinsk	2980
36050	Zmeinogorsk	2980
36051	Arhara	2981
36052	Belogorsk	2981
36053	Blagoveshchensk	2981
36054	Jerofej Pavlovich	2981
36055	Magdagachi	2981
36056	Novoburejskij	2981
36057	Progress	2981
36058	Rajchihinsk	2981
36059	Seryshevo	2981
36060	Shimanovsk	2981
36061	Skovorodino	2981
36062	Svobodnyj	2981
36063	Tynda	2981
36064	Urusha	2981
36065	Zavitinsk	2981
36066	Zeja	2981
36067	Arhangelsk	2982
36068	Jemca	2982
36069	Jercevo	2982
36070	Kargopol	2982
36071	Konosha	2982
36072	Korjazhma	2982
36073	Kotlas	2982
36074	Kuloj	2982
36075	Maloshujka	2982
36076	Mirnyj	2982
36077	Njandoma	2982
36078	Novodvinsk	2982
36079	Obozjorskij	2982
36080	Oktjabrskij	2982
36081	Onega	2982
36082	Plesetsk	2982
36083	Podjuga	2982
36084	Puksoozero	2982
36085	Samoded	2982
36086	Savinskij	2982
36087	Severodvinsk	2982
36088	Shenkursk	2982
36089	Udimskij	2982
36090	Urdoma	2982
36091	Velsk	2982
36092	Vychegodskij	2982
36093	Ahtubinsk	2983
36094	Astrahan	2983
36095	Harabali	2983
36096	Kamyzjak	2983
36097	Kapustin Jar	2983
36098	Liman	2983
36099	Narimanov	2983
36100	Verhnij Baskunchak	2983
36101	Volodarskij	2983
36102	Znamensk	2983
36103	Agidel	2984
36104	Bajmak	2984
36105	Belebej	2984
36106	Beloreck	2984
36107	Birsk	2984
36108	Blagoveshchensk	2984
36109	Chishmy	2984
36110	Davlekanovo	2984
36111	Djurtjuli	2984
36112	Iglino	2984
36113	Ishimbaj	2984
36114	Janaul	2984
36115	Jermolajevo	2984
36116	Kandry	2984
36117	Krasnousolskij	2984
36118	Kumertau	2984
36119	Meleuz	2984
36120	Mezhgorje	2984
36121	Neftekamsk	2984
36122	Oktjabrskij	2984
36123	Oktyabrsky	2984
36124	Prijutovo	2984
36125	Rajevskij	2984
36126	Salavat	2984
36127	Serafimovskij	2984
36128	Sibaj	2984
36129	Sterlitamak	2984
36130	Tujmazy	2984
36131	Uchaly	2984
36132	Ufa	2984
36133	Aleksejevka	2985
36134	Belgorod	2985
36135	Borisovka	2985
36136	Chernjanka	2985
36137	Grajvoron	2985
36138	Gubkin	2985
36139	Novyj Oskol	2985
36140	Rakitnoe	2985
36141	Razumnoe	2985
36142	Shebekino	2985
36143	Staryj Oskol	2985
36144	Stroitel	2985
36145	Tomarovka	2985
36146	Valujki	2985
36147	Volokonovka	2985
36148	Belye Berega	2986
36149	Brjansk	2986
36150	Djatkovo	2986
36151	Fokino	2986
36152	Karachev	2986
36153	Kletnja	2986
36154	Klimovo	2986
36155	Klincy	2986
36156	Lokot	2986
36157	Navlja	2986
36158	Novozybkov	2986
36159	Pochjop	2986
36160	Pogar	2986
36161	Selco	2986
36162	Starodub	2986
36163	Surazh	2986
36164	Suzjomka	2986
36165	Trubchjovsk	2986
36166	Unecha	2986
36167	Zhukovka	2986
36168	Gusinoozjorsk	2987
36169	Kamensk	2987
36170	Kjahta	2987
36171	Novyj Uojan	2987
36172	Onohoj	2987
36173	Selenginsk	2987
36174	Severobajkalsk	2987
36175	Taksimo	2987
36176	Ulan-Ude	2987
36177	Zakamensk	2987
36178	Zarechnyj	2987
36179	Groznyj	2988
36180	Gudermes	2988
36181	Malgobek	2988
36182	Urus-Martan	2988
36183	Asha	2989
36184	Bakal	2989
36185	Bazhovo	2989
36186	Berdjaush	2989
36187	Chebarkul	2989
36188	Cheljabinsk	2989
36189	Chelyabinsk	2989
36190	Gornjak	2989
36191	Jemanzhelinsk	2989
36192	Jurjuzan	2989
36193	Juznouralsk	2989
36194	Karabash	2989
36195	Kartaly	2989
36196	Kasli	2989
36197	Katav-Ivanovsk	2989
36198	Kopejsk	2989
36199	Korkino	2989
36200	Krasnogorskij	2989
36201	Kusa	2989
36202	Kyshtym	2989
36203	Lokomotivnyj	2989
36204	Magnitka	2989
36205	Magnitogorsk	2989
36206	Miass	2989
36207	Minjar	2989
36208	Njazepetrovsk	2989
36209	Novosineglazovskij	2989
36210	Ozjorsk	2989
36211	Pervomajskij	2989
36212	Plast	2989
36213	Roza	2989
36214	Satka	2989
36215	Sim	2989
36216	Snezhinsk	2989
36217	Starokamyshinsk	2989
36218	Suleja	2989
36219	Trjohgornij	2989
36220	Troick	2989
36221	Ust-Katav	2989
36222	Verhneuralsk	2989
36223	Verhnij Ufalej	2989
36224	Zlatoust	2989
36225	Atamanovka	2990
36226	Balej	2990
36227	Borzja	2990
36228	Bukachacha	2990
36229	Chernyshevsk	2990
36230	Chita	2990
36231	Darasun	2990
36232	Gornyy	2990
36233	Hilok	2990
36234	Karymskoje	2990
36235	Krasnokamensk	2990
36236	Mogocha	2990
36237	Nerchinsk	2990
36238	Novaja Chara	2990
36239	Novokruchuninskij	2990
36240	Olovjannaja	2990
36241	Pervomajskij	2990
36242	Petrovsk-Zabajkalskij	2990
36243	Sherlovaja Gora	2990
36244	Shilka	2990
36245	Sretensk	2990
36246	Vershino-Darasunskij	2990
36247	Zabajkalsk	2990
36248	Anadyr	2991
36249	Bilibino	2991
36250	Pevek	2991
36251	Ugolnyje Kopi	2991
36252	Alatyr	2992
36253	Cheboksary	2992
36254	Civilsk	2992
36255	Ibresi	2992
36256	Jadrin	2992
36257	Kanash	2992
36258	Kozlovka	2992
36259	Kugesy	2992
36260	Mariinskij Posad	2992
36261	Novocheboksarsk	2992
36262	Shumerlja	2992
36263	Vurnary	2992
36264	Belidzhi	2993
36265	Bujnaksk	2993
36266	Dagestanskije Ogni	2993
36267	Derbent	2993
36268	Hasavjurt	2993
36269	Izberbash	2993
36270	Juzhno-Suhokumsk	2993
36271	Kaspijsk	2993
36272	Kiziljurt	2993
36273	Kizljar	2993
36274	Mahackala	2993
36275	Tura	2994
36276	Gorno-Altajsk	2995
36277	Amursk	2996
36278	Bikin	2996
36279	Chegdomyn	2996
36280	Cherdomyn	2996
36281	Habarovsk	2996
36282	Hor	2996
36283	Jelban	2996
36284	Komsomolsk-na-Amure	2996
36285	Litovko	2996
36286	Nikolajevsk-na-Amure	2996
36287	Ohotsk	2996
36288	Perejaslavka	2996
36289	Solnechnyj	2996
36290	Sovetskaja Gavan	2996
36291	Uglegorsk	2996
36292	Vanino	2996
36293	Vjazemskij	2996
36294	Zavety Iljicha	2996
36295	Abakan	2997
36296	Abaza	2997
36297	Cherjomushki	2997
36298	Chernogorsk	2997
36299	Sajanogorsk	2997
36300	Shira	2997
36301	Sorsk	2997
36302	Ust-Abakan	2997
36303	Belojarskij	2998
36304	Belyj Jar	2998
36305	Fjodorovskij	2998
36306	Hanty-Mansijsk	2998
36307	Igrim	2998
36308	Izluchinsk	2998
36309	Jugorsk	2998
36310	Kogalym	2998
36311	Langepas	2998
36312	Ljantor	2998
36313	Megion	2998
36314	Mezhdurechenskij	2998
36315	Neftejugansk	2998
36316	Nizhnevartovsk	2998
36317	Njagan	2998
36318	Novoagansk	2998
36319	Pojkovskij	2998
36320	Pokachi	2998
36321	Raduzhnyj	2998
36322	Sovetskij	2998
36323	Surgut	2998
36324	Uraj	2998
36325	Karabulak	2999
36326	Nazran	2999
36327	Angarsk	3000
36328	Bajkalsk	3000
36329	Balagansk	3000
36330	Birjusinsk	3000
36331	Bodajbo	3000
36332	Bratsk	3000
36333	Cheremhovo	3000
36334	Chunskij	3000
36335	Irkutsk	3000
36336	Kirensk	3000
36337	Kujtun	3000
36338	Mihajlovka	3000
36339	Nizhneudinsk	3000
36340	Novaja Igirma	3000
36341	Sajansk	3000
36342	Shelehov	3000
36343	Sljudjanka	3000
36344	Svirsk	3000
36345	Tajshet	3000
36346	Tulun	3000
36347	Usolje-Sibirskoje	3000
36348	Ust-Ilimsk	3000
36349	Ust-Kut	3000
36350	Vihorevka	3000
36351	Zalari	3000
36352	Zheleznodorozhnyj	3000
36353	Zheleznogorsk-Ilimskij	3000
36354	Zima	3000
36355	Furmanov	3001
36356	Ivanovo	3001
36357	Jurjevec	3001
36358	Juzha	3001
36359	Kineshma	3001
36360	Kohma	3001
36361	Komsomolsk	3001
36362	Lezhnjovo	3001
36363	Navoloki	3001
36364	Privolzhsk	3001
36365	Puchezh	3001
36366	Rodniki	3001
36367	Shuja	3001
36368	Tejkovo	3001
36369	Vichuga	3001
36370	Gubkinskij	3002
36371	Korotchajevo	3002
36372	Labytnangi	3002
36373	Muravlenko	3002
36374	Nadym	3002
36375	Nojabrsk	3002
36376	Novyj Urengoj	3002
36377	Pangody	3002
36378	Salehard	3002
36379	Tarko-Sale	3002
36380	Urengoj	3002
36381	Danilov	3003
36382	Gavrilov-Jam	3003
36383	Jaroslavl	3003
36384	Pereslavl-Zalesskij	3003
36385	Rostov	3003
36386	Rybinsk	3003
36387	Tutajev	3003
36388	Uglich	3003
36389	Birakan	3004
36390	Birobidzhan	3004
36391	Imeni Telmana	3004
36392	Izvestkovyj	3004
36393	Londoko	3004
36394	Obluchje	3004
36395	Teploozjorsk	3004
36396	Baksan	3005
36397	Chegem Pervyj	3005
36398	Majskij	3005
36399	Nalchik	3005
36400	Nartkala	3005
36401	Prohladnyj	3005
36402	Terek	3005
36403	Tyrnyauz	3005
36404	Bagrationovsk	3006
36405	Baltijsk	3006
36406	Chernjahovsk	3006
36407	Gurjevsk	3006
36408	Gusev	3006
36409	Gvardejsk	3006
36410	Kaliningrad	3006
36411	Mamonovo	3006
36412	Neman	3006
36413	Nesterov	3006
36414	Ozjorsk	3006
36415	Pionerskij	3006
36416	Sovetsk	3006
36417	Svetlogorsk	3006
36418	Svetlyj	3006
36419	Zeljenogradsk	3006
36420	Znamensk	3006
36421	Elista	3007
36422	Gorodovikovsk	3007
36423	Lagan	3007
36424	Balabanovo	3008
36425	Belousovo	3008
36426	Borovsk	3008
36427	Jermolino	3008
36428	Kaluga	3008
36429	Kirov	3008
36430	Kondrovo	3008
36431	Kozelsk	3008
36432	Kremenki	3008
36433	Ljudinovo	3008
36434	Malojaroslavec	3008
36435	Obninsk	3008
36436	Sosenskij	3008
36437	Suhinichi	3008
36438	Tarusa	3008
36439	Tovarkovo	3008
36440	Zhukov	3008
36441	Jelizovo	3009
36442	Kljuchi	3009
36443	Mohovaja	3009
36444	Petropavlovsk-Kamchatskij	3009
36445	Ust-Kamchatsk	3009
36446	Viljuchinsk	3009
36447	Vulkannyj	3009
36448	Cherkessk	3010
36449	Karachajevsk	3010
36450	Ust-Dzheguta	3010
36451	Belomorsk	3011
36452	Kem	3011
36453	Kondopoga	3011
36454	Kostomuksha	3011
36455	Lahdenpohja	3011
36456	Medvezhjegorsk	3011
36457	Nadvoicy	3011
36458	Olonec	3011
36459	Petrozavodsk	3011
36460	Pitkjaranta	3011
36461	Pudozh	3011
36462	Segezha	3011
36463	Sortavala	3011
36464	Suojarvi	3011
36465	Anzhero-Sudzhensk	3012
36466	Bachatskij	3012
36467	Belovo	3012
36468	Berjozovskij	3012
36469	Gramoteino	3012
36470	Gurjevsk	3012
36471	Inskoj	3012
36472	Jashkino	3012
36473	Jurga	3012
36474	Kaltan	3012
36475	Kedrovka	3012
36476	Kemerovo	3012
36477	Kiseljovsk	3012
36478	Krasnobrodskij	3012
36479	Leninsk-Kuzneckij	3012
36480	Malinovka	3012
36481	Mariinsk	3012
36482	Mezhdurechensk	3012
36483	Myski	3012
36484	Novokuzneck	3012
36485	Novokuznetsk	3012
36486	Novyj Gorodok	3012
36487	Osinniki	3012
36488	Polsaevo	3012
36489	Prokopjevsk	3012
36490	Promyshlennaja	3012
36491	Promyshlennovskij	3012
36492	Salair	3012
36493	Starobachaty	3012
36494	Tajga	3012
36495	Tajzhina	3012
36496	Tashtagol	3012
36497	Temirtau	3012
36498	Tisul	3012
36499	Tjazhinskij	3012
36500	Topki	3012
36501	Belaja Holunica	3014
36502	Jaransk	3014
36503	Jurja	3014
36504	Kirov	3014
36505	Kirovo-Chepeck	3014
36506	Kirs	3014
36507	Kotelnich	3014
36508	Ljangasovo	3014
36509	Luza	3014
36510	Malmyzh	3014
36511	Murashi	3014
36512	Nolinsk	3014
36513	Omutninsk	3014
36514	Orichi	3014
36515	Orlov	3014
36516	Pervomajskij	3014
36517	Peskovka	3014
36518	Slobodskoj	3014
36519	Sosnovka	3014
36520	Sovetsk	3014
36521	Urzhum	3014
36522	Vahrushi	3014
36523	Vjatskije Poljany	3014
36524	Zujevka	3014
36525	Blagoevo	3015
36526	Inta	3015
36527	Jarega	3015
36528	Jeletskij	3015
36529	Jemva	3015
36530	Komsomolskij	3015
36531	Krasnozatonskij	3015
36532	Mikun	3015
36533	Nizhnij Odes	3015
36534	Pechora	3015
36535	Promyshlennyj	3015
36536	Severnyj	3015
36537	Sosnogorsk	3015
36538	Syktyvkar	3015
36539	Troicko-Pechorsk	3015
36540	Uhta	3015
36541	Usinsk	3015
36542	Usogorsk	3015
36543	Vorgashor	3015
36544	Vorkuta	3015
36545	Vuktyl	3015
36546	Zheshart	3015
36547	Kudymkar	3016
36548	Palana	3017
36549	Buj	3018
36550	Galich	3018
36551	Kostroma	3018
36552	Makarjev	3018
36553	Manturovo	3018
36554	Neja	3018
36555	Nerehta	3018
36556	Sharja	3018
36557	Vetluzhskij	3018
36558	Volgorechensk	3018
36559	Zavolzhsk	3018
36560	Abinsk	3019
36561	Achujevo	3019
36562	Afipskij	3019
36563	Ahtyrskij	3019
36564	Anapa	3019
36565	Apsheronsk	3019
36566	Armavir	3019
36567	Belorechensk	3019
36568	Gelendzhik	3019
36569	Gorjachi Kljuch	3019
36570	Gulkevichi	3019
36571	Hadyzhensk	3019
36572	Ilskij	3019
36573	Jejsk	3019
36574	Kalinino	3019
36575	Korenovsk	3019
36576	Krasnodar	3019
36577	Kropotkin	3019
36578	Krymsk	3019
36579	Kurganinsk	3019
36580	Labinsk	3019
36581	Mostovskoj	3019
36582	Neftegorsk	3019
36583	Novokubansk	3019
36584	Novomihajlovskij	3019
36585	Novorossijsk	3019
36586	Pashkovskij	3019
36587	Primorsko-Ahtarsk	3019
36588	Psebaj	3019
36589	Slavjansk-na-Kubani	3019
36590	Sochi	3019
36591	Srednjaja Ahtuba	3019
36592	Temrjuk	3019
36593	Tihoreck	3019
36594	Timashevsk	3019
36595	Tuapse	3019
36596	Ust-Labinsk	3019
36597	Aban	3020
36598	Achinsk	3020
36599	Artjomovsk	3020
36600	Berjozovka	3020
36601	Bogotol	3020
36602	Borodino	3020
36603	Divnogorsk	3020
36604	Dubinino	3020
36605	Igarka	3020
36606	Ilanskij	3020
36607	Jemeljanovo	3020
36608	Jenisejsk	3020
36609	Kajerkan	3020
36610	Kansk	3020
36611	Kedrovyj	3020
36612	Kodinsk	3020
36613	Krasnojarsk	3020
36614	Kuragino	3020
36615	Lesosibirsk	3020
36616	Minusinsk	3020
36617	Nazarovo	3020
36618	Nizhnjaja Pojma	3020
36619	Norilsk	3020
36620	Podgornyj	3020
36621	Sharypovo	3020
36622	Shushenskoe	3020
36623	Solnechnyj	3020
36624	Sosnovoborsk	3020
36625	Talnah	3020
36626	Ujar	3020
36627	Uzhur	3020
36628	Zaozjornyj	3020
36629	Zelenogorsk	3020
36630	Zheleznogorsk	3020
36631	Dalmatovo	3022
36632	Kargapolje	3022
36633	Katajsk	3022
36634	Kurgan	3022
36635	Kurtamysh	3022
36636	Makushino	3022
36637	Petuhovo	3022
36638	Shadrinsk	3022
36639	Shumiha	3022
36640	Vargashi	3022
36641	Dmitriev Lgovskij	3023
36642	Imeni Karla Libknehta	3023
36643	Kurchatov	3023
36644	Kursk	3023
36645	Lgov	3023
36646	Obojan	3023
36647	Rylsk	3023
36648	Shchigry	3023
36649	Shchuchje	3023
36650	Sudzha	3023
36651	Zheleznogorsk	3023
36652	Boksitogorsk	3024
36653	Dubrovka	3024
36654	Gatchina	3024
36655	Imeni Morozova	3024
36656	Ivangorod	3024
36657	Kingisepp	3024
36658	Kirishi	3024
36659	Kirovsk	3024
36660	Kolpino	3024
36661	Kommunar	3024
36662	Kuzmolovskiy	3024
36663	Lodejnoje Pole	3024
36664	Luga	3024
36665	Nikolskoe	3024
36666	Novaja Ladoga	3024
36667	Otradnoe	3024
36668	Pikaljovo	3024
36669	Podporozhje	3024
36670	Priozjorsk	3024
36671	Sertolovo	3024
36672	Shlisselburg	3024
36673	Siverskij	3024
36674	Sjasstroj	3024
36675	Slancy	3024
36676	Sosnovyj Bor	3024
36677	Svetogorsk	3024
36678	Tihvin	3024
36679	Tosno	3024
36680	Uljanovka	3024
36681	Volhov	3024
36682	Volosovo	3024
36683	Vsevolozhsk	3024
36684	Vyborg	3024
36685	Vyrica	3024
36686	Zarskoje Selo	3024
36687	Chaplygin	3025
36688	Dankov	3025
36689	Dobrinka	3025
36690	Grjazi	3025
36691	Jelec	3025
36692	Lebedjan	3025
36693	Lipeck	3025
36694	Usman	3025
36695	Zadonsk	3025
36696	Jagodnoje	3026
36697	Magadan	3026
36698	Ola	3026
36699	Omsukchan	3026
36700	Palatka	3026
36701	Sinegorje	3026
36702	Susuman	3026
36703	Ust-Omchug	3026
36704	Ardatov	3028
36705	Chamzinka	3028
36706	Insar	3028
36707	Komsomolskij	3028
36708	Kovylkino	3028
36709	Krasnoslobodsk	3028
36710	Luhovka	3028
36711	Romodanovo	3028
36712	Ruzajevka	3028
36713	Saransk	3028
36714	Temnikov	3028
36715	Torbeevo	3028
36716	Zubova Poljana	3028
36717	Moscow	3029
36718	Moskva	3032
36719	Vostochnyj	3032
36720	Zeljenograd	3032
36721	Apatity	3033
36722	Gadzhievo	3033
36723	Kandalaksha	3033
36724	Kirovsk	3033
36725	Kola	3033
36726	Kovdor	3033
36727	Monchegorsk	3033
36728	Murmansk	3033
36729	Murmashi	3033
36730	Nikel	3033
36731	Olenegorsk	3033
36732	Ostrovnoj	3033
36733	Poljarnye Zory	3033
36734	Poljarnyj	3033
36735	Revda	3033
36736	Severomorsk	3033
36737	Snezhnogorsk	3033
36738	Zaozjorsk	3033
36739	Zapoljarnyj	3033
36740	Zeljenoborskij	3033
36741	Narjan-Mar	3034
36742	Borovichi	3036
36743	Chudovo	3036
36744	Krestcy	3036
36745	Malaja Vishera	3036
36746	Okulovka	3036
36747	Pestovo	3036
36748	Proletarij	3036
36749	Solcy	3036
36750	Staraja Russa	3036
36751	Uglovka	3036
36752	Valdaj	3036
36753	Velikij Novgorod	3036
36754	Novokusnezk	3037
36755	Barabinsk	3038
36756	Berdsk	3038
36757	Bolotnoe	3038
36758	Chany	3038
36759	Cherepanovo	3038
36760	Chulym	3038
36761	Iskitim	3038
36762	Karasuk	3038
36763	Kargat	3038
36764	Kochenjovo	3038
36765	Kolcovo	3038
36766	Kolyvan	3038
36767	Krasnoobsk	3038
36768	Krasnozerskoe	3038
36769	Kujbyshev	3038
36770	Kupino	3038
36771	Linjovo	3038
36772	Masljanino	3038
36773	Novosibirsk	3038
36774	Ob	3038
36775	Suzun	3038
36776	Tatarsk	3038
36777	Toguchin	3038
36778	Bolsherechje	3039
36779	Cherlak	3039
36780	Isilkul	3039
36781	Kalachinsk	3039
36782	Kormilovka	3039
36783	Ljubinskij	3039
36784	Moskaljoni	3039
36785	Muromcevo	3039
36786	Nazyvajevsk	3039
36787	Omsk	3039
36788	Tara	3039
36789	Tavricheskoje	3039
36790	Tjukalinsk	3039
36791	Abdulino	3040
36792	Buguruslan	3040
36793	Buzuluk	3040
36794	Jasnyj	3040
36795	Komarovskiy	3040
36796	Kuvandyk	3040
36797	Mednogorsk	3040
36798	Novotroick	3040
36799	Orenburg	3040
36800	Orsk	3040
36801	Sol-Ileck	3040
36802	Sorochinsk	3040
36803	Bolhov	3041
36804	Gaj	3041
36805	Livny	3041
36806	Mcensk	3041
36807	Orjol	3041
36808	Znamenka	3041
36809	Bashmakovo	3042
36810	Bekovo	3042
36811	Belinskiy	3042
36812	Kamenka	3042
36813	Kolyshlej	3042
36814	Kuzneck	3042
36815	Mokshan	3042
36816	Nikolsk	3042
36817	Nizhnij Lomov	3042
36818	Pachelma	3042
36819	Penza	3042
36820	Serdobsk	3042
36821	Sursk	3042
36822	Zarechnyj	3042
36823	Zemetchino	3042
36824	Aleksandrovsk	3043
36825	Berezniki	3043
36826	Chajkovskij	3043
36827	Chermoz	3043
36828	Chernushka	3043
36829	Chusovoj	3043
36830	Dobrjanka	3043
36831	Gornozavodsk	3043
36832	Gremjachinsk	3043
36833	Gubaha	3043
36834	Jajva	3043
36835	Kizel	3043
36836	Komsomolsky	3043
36837	Krasnokamsk	3043
36838	Krasnovishersk	3043
36839	Kungur	3043
36840	Lysva	3043
36841	Novye Ljady	3043
36842	Nytva	3043
36843	Ocher	3043
36844	Oktjabrskij	3043
36845	Osa	3043
36846	Pashija	3043
36847	Perm	3043
36848	Polazna	3043
36849	Skalnyj	3043
36850	Solikamsk	3043
36851	Ugleuralskij	3043
36852	Uralskij	3043
36853	Usolje	3043
36854	Vereshchagino	3043
36855	Zvjozdnyj	3043
36856	Arsenjev	3044
36857	Artjom	3044
36858	Artjomovskij	3044
36859	Bolshoj Kamen	3044
36860	Dalnegorsk	3044
36861	Dalnerechensk	3044
36862	Dunaj	3044
36863	Fokino	3044
36864	Jaroslavskij	3044
36865	Kavalerovo	3044
36866	Kirovskiy	3044
36867	Lesozavodsk	3044
36868	Lipovcy	3044
36869	Livadija	3044
36870	Luchegorsk	3044
36871	Nahodka	3044
36872	Novoshahtinskij	3044
36873	Partizansk	3044
36874	Pogranichnyj	3044
36875	Preobrazhenie	3044
36876	Putjatin	3044
36877	Sibircevo	3044
36878	Slavjanka	3044
36879	Spassk-Dalnij	3044
36880	Tavrichanka	3044
36881	Trudovoe	3044
36882	Uglekamensk	3044
36883	Uglovoe	3044
36884	Ussurijsk	3044
36885	Vladivostok	3044
36886	Vrangel	3044
36887	Zavodskoj	3044
36888	Dedovichi	3045
36889	Dno	3045
36890	Nevel	3045
36891	Novosokolniki	3045
36892	Opochka	3045
36893	Ostrov	3045
36894	Pechory	3045
36895	Porhov	3045
36896	Pskov	3045
36897	Sebezh	3045
36898	Strugi-Krasnye	3045
36899	Velikije Luki	3045
36900	Kasimov	3047
36901	Korablino	3047
36902	Mihajlov	3047
36903	Novomichurinsk	3047
36904	Rjazan	3047
36905	Rjazhsk	3047
36906	Rybnoje	3047
36907	Sasovo	3047
36908	Shilovo	3047
36909	Skopin	3047
36910	Ajutinskij	3048
36911	Aksaj	3048
36912	Azov	3048
36913	Batajsk	3048
36914	Belaja Kalitva	3048
36915	Cimljansk	3048
36916	Doneck	3048
36917	Donskoj	3048
36918	Gigant	3048
36919	Glubokij	3048
36920	Gornjackij	3048
36921	Gukovo	3048
36922	Kamenolomni	3048
36923	Kamensk-Shahtinskij	3048
36924	Konstantinovsk	3048
36925	Krasnyj Sulin	3048
36926	Lihovskoj	3048
36927	Majskij	3048
36928	Millerovo	3048
36929	Morozovsk	3048
36930	Novocherkassk	3048
36931	Novoshahtinsk	3048
36932	Proletarsk	3048
36933	Rostov	3048
36934	Rostov-na-Donu	3048
36935	Salsk	3048
36936	Semikarakorsk	3048
36937	Shahty	3048
36938	Sholohovskij	3048
36939	Sinegorskij	3048
36940	Sokolovo	3048
36941	Taganrog	3048
36942	Ust-Doneckij	3048
36943	Volgodonsk	3048
36944	Zernograd	3048
36945	Zhirnov	3048
36946	Zverevo	3048
36947	Ajhan	3049
36948	Aldan	3049
36949	Cherskij	3049
36950	Chulman	3049
36951	Deputatskij	3049
36952	Jakutsk	3049
36953	Lensk	3049
36954	Marha	3049
36955	Mirnyj	3049
36956	Nerjungri	3049
36957	Njurba	3049
36958	Oljokminsk	3049
36959	Pokrovsk	3049
36960	Sangar	3049
36961	Serebrjanyj Bor	3049
36962	Tiksi	3049
36963	Tommot	3049
36964	Udachnyj	3049
36965	Ust-Nera	3049
36966	Verhojansk	3049
36967	Viljujsk	3049
36968	Aleksandrovsk-Sahalinskij	3050
36969	Dolinsk	3050
36970	Gornozavodsk	3050
36971	Holmsk	3050
36972	Juzhno-Sahalinsk	3050
36973	Korsakov	3050
36974	Makarov	3050
36975	Nevelsk	3050
36976	Nogliki	3050
36977	Oha	3050
36978	Poronajsk	3050
36979	Shahtjorsk	3050
36980	Tymovskoje	3050
36981	Uglegorsk	3050
36982	Aleksejevka	3051
36983	Bezenchuk	3051
36984	Chapajevsk	3051
36985	Fjodorovka	3051
36986	Kinel	3051
36987	Mirnyj	3051
36988	Novokujbyshevsk	3051
36989	Novosemejkino	3051
36990	Oktjabrsk	3051
36991	Otradnyj	3051
36992	Pohvistnevo	3051
36993	Povolzhskij	3051
36994	Pribrezhnyj	3051
36995	Roscinskij	3051
36996	Samara	3051
36997	Smyshljaevka	3051
36998	Suhodol	3051
36999	Syzran	3051
37000	Timashjovo	3051
37001	Toljatti	3051
37002	Zhigulevsk	3051
37003	Togliatti	3052
37004	Saint Petersburg	3053
37005	Sankt Peterburg	3053
37006	Arkadak	3054
37007	Atkarsk	3054
37008	Balakovo	3054
37009	Balashov	3054
37010	Bazarnyj Karabulak	3054
37011	Dergachi	3054
37012	Engels	3054
37013	Hvalynsk	3054
37014	Jershov	3054
37015	Kalininsk	3054
37016	Krasnoarmejsk	3054
37017	Krasnyj Kut	3054
37018	Marks	3054
37019	Novouzensk	3054
37020	Ozinki	3054
37021	Petrovsk	3054
37022	Privolzhskij	3054
37023	Pugachjov	3054
37024	Rtishchevo	3054
37025	Saratov	3054
37026	Shihany	3054
37027	Stepnoe	3054
37028	Svetlyj	3054
37029	Tatishchevo	3054
37030	Volsk	3054
37031	Demidov	3055
37032	Desnogorsk	3055
37033	Dorogobuzh	3055
37034	Gagarin	3055
37035	Hislavichi	3055
37036	Jarcevo	3055
37037	Jelnja	3055
37038	Pochinok	3055
37039	Roslavl	3055
37040	Rudnja	3055
37041	Safonovo	3055
37042	Smolensk	3055
37043	Verhnedneprovskij	3055
37044	Vjazma	3055
37045	Blagodarnyj	3056
37046	Budjonnovsk	3056
37047	Georgijevsk	3056
37048	Gorjachevodskij	3056
37049	Inozemcevo	3056
37050	Ipatovo	3056
37051	Izobilnyj	3056
37052	Jessentuki	3056
37053	Kislovodsk	3056
37054	Lermontov	3056
37055	Mihajlovsk	3056
37056	Mineralnyje Vody	3056
37057	Neftekumsk	3056
37058	Nevinnomyssk	3056
37059	Novoaleksandrovsk	3056
37060	Novopavlovsk	3056
37061	Pjatigorsk	3056
37062	Solnechnodolsk	3056
37063	Stavropol	3056
37064	Svetlograd	3056
37065	Svobody	3056
37066	Zeljenokumsk	3056
37067	Zheleznovodsk	3056
37068	Alapajevsk	3057
37069	Aramil	3057
37070	Arti	3057
37071	Artjomovskij	3057
37072	Asbest	3057
37073	Baranchinskij	3057
37074	Belojarskij	3057
37075	Berjozovskij	3057
37076	Bisert	3057
37077	Bogdanovich	3057
37078	Bulanash	3057
37079	Degtjarsk	3057
37080	Ekaterinburg	3057
37081	Irbit	3057
37082	Ivdel	3057
37083	Izumrud	3057
37084	Jekaterinburg	3057
37085	Kachkanar	3057
37086	Kamensk-Uralskij	3057
37087	Kamyshlov	3057
37088	Karpinsk	3057
37089	Kirovgrad	3057
37090	Kolcovo	3057
37091	Krasnoturinsk	3057
37092	Krasnoufimsk	3057
37093	Krasnouralsk	3057
37094	Kushva	3057
37095	Lesnoj	3057
37096	Leviha	3057
37097	Lobva	3057
37098	Malysheva	3057
37099	Mihajlovsk	3057
37100	Monetnyj	3057
37101	Nevjansk	3057
37102	Nizhnie Sergi	3057
37103	Nizhnij Tagil	3057
37104	Nizhnjaja Salda	3057
37105	Nizhnjaja Tura	3057
37106	Novaja Ljalja	3057
37107	Novouralsk	3057
37108	Pervouralsk	3057
37109	Polevskoj	3057
37110	Pyshma	3057
37111	Pyt-Jah	3057
37112	Reftinskij	3057
37113	Revda	3057
37114	Rezh	3057
37115	Serov	3057
37116	Severouralsk	3057
37117	Sosva	3057
37118	Sredneuralsk	3057
37119	Suhoj Log	3057
37120	Svobodnyj	3057
37121	Sysert	3057
37122	Talica	3057
37123	Tavda	3057
37124	Troickij	3057
37125	Turinsk	3057
37126	Uralskij	3057
37127	Verhnij Tagil	3057
37128	Verhnjaja Pyshma	3057
37129	Verhnjaja Salda	3057
37130	Verhnjaja Sinyachiha	3057
37131	Verhnjaja Tura	3057
37132	Verhoturje	3057
37133	Volchansk	3057
37134	Yekaterinburg	3057
37135	Zarechnyj	3057
37136	Zjuzelskij	3057
37137	Dudinka	3058
37138	Dmitrievka	3059
37139	Inzhavino	3059
37140	Kirsanov	3059
37141	Kotovsk	3059
37142	Michurinsk	3059
37143	Morshansk	3059
37144	Pervomajskij	3059
37145	Rasskazovo	3059
37146	Sosnovka	3059
37147	Tambov	3059
37148	Uvarovo	3059
37149	Zherdevka	3059
37150	Znamenka	3059
37151	Agryz	3060
37152	Aksubajevo	3060
37153	Aktjubinskij	3060
37154	Aleksejevskoje	3060
37155	Almetjevsk	3060
37156	Arsk	3060
37157	Aznakajevo	3060
37158	Bavly	3060
37159	Bugulma	3060
37160	Buinsk	3060
37161	Chistopol	3060
37162	Dzhalil	3060
37163	Jelabuga	3060
37164	Kamskie Poljany	3060
37165	Kazan	3060
37166	Kukmor	3060
37167	Leninogorsk	3060
37168	Mamadysh	3060
37169	Mendelejevsk	3060
37170	Menzelinsk	3060
37171	Naberezhnyje Chelny	3060
37172	Nizhnekamsk	3060
37173	Niznjaja Maktama	3060
37174	Nurlat	3060
37175	Tetjushi	3060
37176	Urussu	3060
37177	Vasiljevo	3060
37178	Zainsk	3060
37179	Zeljonodolsk	3060
37180	Bogandinskij	3061
37181	Borovskij	3061
37182	Golyshmanovo	3061
37183	Ishim	3061
37184	Jalutorovosk	3061
37185	Tjumen	3061
37186	Tobolsk	3061
37187	Vinzili	3061
37188	Zavodoukovsk	3061
37189	Asino	3062
37190	Jaja	3062
37191	Kolpashevo	3062
37192	Seversk	3062
37193	Strezhevoj	3062
37194	Tomsk	3062
37195	Agejevo	3063
37196	Aleksin	3063
37197	Beljov	3063
37198	Bogoroditsk	3063
37199	Bolohovo	3063
37200	Donskoj	3063
37201	Dubovka	3063
37202	Jasnogorsk	3063
37203	Jefremov	3063
37204	Kimovsk	3063
37205	Kirejevsk	3063
37206	Kosaja Gora	3063
37207	Leninskij	3063
37208	Lipki	3063
37209	Mendelejevskij	3063
37210	Novomoskovsk	3063
37211	Pervomajskij	3063
37212	Plavsk	3063
37213	Severo-Zadonsk	3063
37214	Shchjokino	3063
37215	Skuratovskij	3063
37216	Sokolniki	3063
37217	Sovetsk	3063
37218	Suvorov	3063
37219	Tovarkovskij	3063
37220	Tula	3063
37221	Uzlovaja	3063
37222	Venjov	3063
37223	Andreapol	3064
37224	Bezheck	3064
37225	Bologoe	3064
37226	Kaljazin	3064
37227	Kashin	3064
37228	Kimry	3064
37229	Konakovo	3064
37230	Kuvshinovo	3064
37231	Lihoslavl	3064
37232	Maksatiha	3064
37233	Ostashkov	3064
37234	Ozjornyj	3064
37235	Pelidovo	3064
37236	Rameshki	3064
37237	Redkino	3064
37238	Rzhev	3064
37239	Solnechnyj	3064
37240	Starica	3064
37241	Toropec	3064
37242	Torzhok	3064
37243	Tver	3064
37244	Udomlja	3064
37245	Vyshnij Volochok	3064
37246	Zapadnaja Dvina	3064
37247	Ak-Dovurak	3065
37248	Kyzyl	3065
37249	Balezino	3066
37250	Glazov	3066
37251	Igra	3066
37252	Izhevsk	3066
37253	Kambarka	3066
37254	Kez	3066
37255	Kizner	3066
37256	Mozhga	3066
37257	Sarapul	3066
37258	Uva	3066
37259	Votkinsk	3066
37260	Barysh	3067
37261	Cherdakly	3067
37262	Dimitrovgrad	3067
37263	Inza	3067
37264	Isheevka	3067
37265	Novospasskoe	3067
37266	Novouljanovsk	3067
37267	Sengilej	3067
37268	Uljanovsk	3067
37269	Ust-Ordynskij	3069
37270	Aleksandrov	3070
37271	Balakirevo	3070
37272	Gorohovec	3070
37273	Gus-Hrustalnyj	3070
37274	Jurjev Polskij	3070
37275	Kameshkovo	3070
37276	Karabanovo	3070
37277	Kirzhach	3070
37278	Kolchugino	3070
37279	Kosterovo	3070
37280	Kovrov	3070
37281	Krasnaja Gorbatka	3070
37282	Krasnyj Oktjabr	3070
37283	Lakinsk	3070
37284	Melenki	3070
37285	Murom	3070
37286	Novovjazniki	3070
37287	Pokrov	3070
37288	Raduzhnyj	3070
37289	Sobinka	3070
37290	Strunino	3070
37291	Sudogda	3070
37292	Suzdal	3070
37293	Vjazniki	3070
37294	Vladimir	3070
37295	Dubovka	3071
37296	Frolovo	3071
37297	Gorkovskij	3071
37298	Gorodishche	3071
37299	Ilovlja	3071
37300	Jelan	3071
37301	Kalach-na-Donu	3071
37302	Kamyshin	3071
37303	Kotelnikovo	3071
37304	Kotovo	3071
37305	Krasnoslobodsk	3071
37306	Leninsk	3071
37307	Mihajlovka	3071
37308	Nikolajevsk	3071
37309	Nizhny Novgorod	3071
37310	Novoanninskij	3071
37311	Novonikolajevskij	3071
37312	Pallasovka	3071
37313	Petrov Val	3071
37314	Serafimovich	3071
37315	Surovikino	3071
37316	Svetlyj Jar	3071
37317	Urjupinsk	3071
37318	Volgograd	3071
37319	Volzhskij	3071
37320	Zhirnovsk	3071
37321	Babajevo	3072
37322	Belozjorsk	3072
37323	Cherepovec	3072
37324	Grjazovec	3072
37325	Harovsk	3072
37326	Kaduj	3072
37327	Krasavino	3072
37328	Sheksna	3072
37329	Sokol	3072
37330	Totma	3072
37331	Velikij Ustjug	3072
37332	Vologda	3072
37333	Vytegra	3072
37334	Anna	3073
37335	Bobrov	3073
37336	Boguchar	3073
37337	Borisoglebsk	3073
37338	Buturlinovka	3073
37339	Ertil	3073
37340	Gribanovskij	3073
37341	Kalach	3073
37342	Kamenka	3073
37343	Kantemirovka	3073
37344	Liski	3073
37345	Novohopjorsk	3073
37346	Novovoronezh	3073
37347	Ostrogozhsk	3073
37348	Pavlovsk	3073
37349	Povorino	3073
37350	Pridonskij	3073
37351	Rossosh	3073
37352	Semiluki	3073
37353	Somovo	3073
37354	Talovaja	3073
37355	Voronezh	3073
37356	Butare	3074
37357	Nyanza	3074
37358	Byumba	3075
37359	Cyangugu	3076
37360	Gikongoro	3077
37361	Gisenyi	3078
37362	Gitarama	3079
37363	Kibungo	3080
37364	Rwamagana	3080
37365	Kibuye	3081
37366	Kigali	3082
37367	Ruhengeri	3083
37368	Georgetown	3084
37369	Anse-la-Raye	3102
37370	Canaries	3103
37371	Castries	3104
37372	Choc	3104
37373	Choiseul	3105
37374	Dennery	3106
37375	Laborie	3108
37376	Micoud	3109
37377	Soufriere	3110
37378	Miquelon	3112
37379	Saint-Pierre	3113
37380	Biabou	3114
37381	Byera	3114
37382	Georgetown	3114
37383	Dovers	3115
37384	Hamilton	3115
37385	Port Elizabeth	3115
37386	Falelatai	3120
37387	Mulifanua	3121
37388	Solosolo	3122
37389	Safotulafai	3123
37390	Samalaeulu	3124
37391	Aopo	3125
37392	Taga	3126
37393	Gautavai	3127
37394	Apia	3128
37395	Samamea	3129
37396	Neiafu	3130
37397	Acquaviva	3131
37398	Chiesanuova	3133
37399	Domagnano	3134
37400	Faetano	3135
37401	Fiorentino	3136
37402	Montegiardino	3137
37403	Serravalle	3139
37404	Santana	3141
37405	Neves	3142
37406	Santo Amaro	3143
37407	Trindade	3144
37408	Santo Antonio	3145
37409	Mahayel	3147
37410	Abha	3149
37411	Abu Aris	3149
37412	Khamis Mushayt	3149
37413	Qalat Bishah	3149
37414	Hail	3152
37415	Jawf	3153
37416	Sakakah	3153
37417	Jizan	3154
37418	Sabya	3154
37419	Makkah	3155
37420	Rabig	3155
37421	al-Hawiyah	3155
37422	at-Taif	3155
37423	Dariyah	3156
37424	Najran	3156
37425	Sharurah	3156
37426	Unayzah	3157
37427	Buraydah	3157
37428	ar-Rass	3157
37429	Tabuk	3158
37430	Umm Lajj	3158
37431	al-Bahah	3160
37432	Araar	3161
37433	Rafha	3161
37434	Turayf	3161
37435	al-Qurayyat	3161
37436	Yanbu	3162
37437	al-Madinah	3162
37438	Afif	3163
37439	ad-Dawadimi	3163
37440	ad-Dilam	3163
37441	al-Kharj	3163
37442	al-Majmaah	3163
37443	ar-Riyad	3163
37444	az-Zulfi	3163
37445	Dakar	3164
37446	Bambey	3165
37447	Diourbel	3165
37448	Mbacke	3165
37449	Touba	3165
37450	Diofior	3166
37451	Fatick	3166
37452	Foundiougne	3166
37453	Gossas	3166
37454	Guinguineo	3166
37455	Kahone	3166
37456	Passy	3166
37457	Sokone	3166
37458	Gandiaye	3167
37459	Kaffrine	3167
37460	Kaolack	3167
37461	Koungheul	3167
37462	Medina	3167
37463	Ndoffane Lagheme	3167
37464	Nioro du Rip	3167
37465	Toubakouta	3167
37466	Dabo	3168
37467	Goudomp	3168
37468	Kolda	3168
37469	Marsassoum	3168
37470	Medina Gounas	3168
37471	Sedhiou	3168
37472	Velingara	3168
37473	Wassadou	3168
37474	Dahra	3169
37475	Kebemer	3169
37476	Linguere	3169
37477	Louga	3169
37478	Dagana	3170
37479	Gollere	3170
37480	Kanel	3170
37481	Matam	3170
37482	Ndioum	3170
37483	Ourossogui	3170
37484	Podor	3170
37485	Richard Toll	3170
37486	Saint-Louis	3170
37487	Semme	3170
37488	Thilogne	3170
37489	Waounde	3170
37490	Bakel	3171
37491	Kedougou	3171
37492	Tambacounda	3171
37493	Joal-Fadiouth	3172
37494	Kayar	3172
37495	Khombole	3172
37496	Mbour	3172
37497	Meckhe	3172
37498	Nguekhokh	3172
37499	Pout	3172
37500	Thiadiaye	3172
37501	Thies	3172
37502	Tivaouane	3172
37503	Bignona	3173
37504	Oussouye	3173
37505	Thionck-Essyl	3173
37506	Ziguinchor	3173
37507	Cascade	3179
37508	Takamaka	3180
37509	Mahe	3181
37510	Biama	3182
37511	Daru	3182
37512	Kailahun	3182
37513	Kenema	3182
37514	Koidu	3182
37515	Koindu	3182
37516	Pendembu	3182
37517	Sefadu	3182
37518	Segbwema	3182
37519	Yengema	3182
37520	Kabala	3183
37521	Kambia	3183
37522	Lungi	3183
37523	Lunsar	3183
37524	Magburaka	3183
37525	Makeni	3183
37526	Mambolo	3183
37527	Moyamba	3183
37528	Pepel	3183
37529	Port Loko	3183
37530	Yele	3183
37531	Binkolo	3184
37532	Bo	3184
37533	Bonthe	3184
37534	Bumpe	3184
37535	Matru	3184
37536	Pujehun	3184
37537	Taiama	3184
37538	Freetown	3185
37539	York	3185
37540	Singapore	3186
37541	Banska Bystrica	3187
37542	Banska Shtiavnica	3187
37543	Brezno	3187
37544	Chierny Balog	3187
37545	Detva	3187
37546	Filakovo	3187
37547	Hnushta	3187
37548	Hrinova	3187
37549	Kremnica	3187
37550	Krupina	3187
37551	Luchenec	3187
37552	Nova Bana	3187
37553	Podbrezova	3187
37554	Poltar	3187
37555	Revuca	3187
37556	Rimavska Sobota	3187
37557	Sliach	3187
37558	Tisovec	3187
37559	Tornala	3187
37560	Velky Krtish	3187
37561	Vlkanova	3187
37562	Zharnovica	3187
37563	Zhiar	3187
37564	Ziar nad Hronom	3187
37565	Zvolen	3187
37566	Bernolakovo	3188
37567	Bratislava	3188
37568	Ivanka pri Dunaji	3188
37569	Malacky	3188
37570	Modra	3188
37571	Pezinok	3188
37572	Senec	3188
37573	Shenkvice	3188
37574	Stupava	3188
37575	Svaty Jur	3188
37576	Chana	3189
37577	Chierna nad Tisou	3189
37578	Dobshina	3189
37579	Gelnica	3189
37580	Kosice	3189
37581	Kralovsky Chlmec	3189
37582	Krompachy	3189
37583	Medzev	3189
37584	Michalovce	3189
37585	Moldava nad Bodvou	3189
37586	Pavlovce nad Uhom	3189
37587	Rozhnava	3189
37588	Sechovce	3189
37589	Smizhany	3189
37590	Sobrance	3189
37591	Strazhske	3189
37592	Trebishov	3189
37593	Velke Kapushany	3189
37594	Vranov	3189
37595	Dvory nad Zhitavou	3190
37596	Hurbanovo	3190
37597	Kolarovo	3190
37598	Komarno	3190
37599	Komjatice	3190
37600	Levice	3190
37601	Levocha	3190
37602	Mocenok	3190
37603	Nesvady	3190
37604	Nitra	3190
37605	Nove Zamky	3190
37606	Palarikovo	3190
37607	Shahy	3190
37608	Shala	3190
37609	Shturovo	3190
37610	Shurany	3190
37611	Svodin	3190
37612	Tlmache	3190
37613	Tvrdoshovce	3190
37614	Vrable	3190
37615	Zlate Moravce	3190
37616	Bardejov	3191
37617	Giraltovce	3191
37618	Humenne	3191
37619	Jarovnice	3191
37620	Kezhmarok	3191
37621	Lipany	3191
37622	Medzilaborce	3191
37623	Podolinec	3191
37624	Poprad	3191
37625	Preshov	3191
37626	Presov	3191
37627	Sabinov	3191
37628	Snina	3191
37629	Spishska Bela	3191
37630	Spishska Nova Ves	3191
37631	Spishske Podhradie	3191
37632	Stara Lubovna	3191
37633	Stropkov	3191
37634	Svidnik	3191
37635	Svit	3191
37636	Velky Sharish	3191
37637	Vysoke Tatry	3191
37638	Banovce	3192
37639	Belusha	3192
37640	Bojnice	3192
37641	Boshany	3192
37642	Dubnica	3192
37643	Handlova	3192
37644	Ilava	3192
37645	Lednicke Rovne	3192
37646	Lendak	3192
37647	Myjava	3192
37648	Nemshova	3192
37649	Nova Dubnica	3192
37650	Novaky	3192
37651	Nove Mesto	3192
37652	Partizanske	3192
37653	Povazhska Bystrica	3192
37654	Prievidza	3192
37655	Puchov	3192
37656	Stara Tura	3192
37657	Topolchany	3192
37658	Trenchianske Teplice	3192
37659	Trenchin	3192
37660	Trencin	3192
37661	Brezova pod Bradlom	3193
37662	Dunajska Streda	3193
37663	Gabchikovo	3193
37664	Galanta	3193
37665	Gbely	3193
37666	Hlohovec	3193
37667	Holich	3193
37668	Kuty	3193
37669	Leopoldov	3193
37670	Pieshtany	3193
37671	Piestany	3193
37672	Senica	3193
37673	Sered	3193
37674	Shamorin	3193
37675	Shashtin-Strazhe	3193
37676	Shoporna	3193
37677	Skalica	3193
37678	Sladkovichovo	3193
37679	Trnava	3193
37680	Velke Ulany	3193
37681	Velky Meder	3193
37682	Vrbove	3193
37683	Bytcha	3194
37684	Chadca	3194
37685	Chierne	3194
37686	Dolny Kubin	3194
37687	Krasno nad Kysucou	3194
37688	Kysucke Nove Mesto	3194
37689	Liptovsky Hradok	3194
37690	Liptovsky Mikulash	3194
37691	Martin	3194
37692	Namestovo	3194
37693	Nizhna	3194
37694	Oshchadnica	3194
37695	Rabcha	3194
37696	Rajec	3194
37697	Rakova	3194
37698	Ruzhomberok	3194
37699	Ruzomberok	3194
37700	Shtiavnik	3194
37701	Skalite	3194
37702	Suchany	3194
37703	Terchova	3194
37704	Trstena	3194
37705	Turany	3194
37706	Turchianske Teplice	3194
37707	Turzovka	3194
37708	Tvrdoshin	3194
37709	Velke Rovne	3194
37710	Vrutky	3194
37711	Zakamenne	3194
37712	Zhilina	3194
37713	Zilina	3194
37714	Semic	3195
37715	Skofljica	3195
37716	Zelezniki	3195
37717	Begunje na Gorenjskem	3196
37718	Bistrica ob Trzhichu	3196
37719	Bled	3196
37720	Blejska Dobrava	3196
37721	Bohinjska Bistrica	3196
37722	Britof	3196
37723	Cerklje na Gorenjskem	3196
37724	Golnik	3196
37725	Gorenja Vas	3196
37726	Hrastje	3196
37727	Hrushica	3196
37728	Jesenice	3196
37729	Kokrica	3196
37730	Koroshka Bela	3196
37731	Kranj	3196
37732	Kranjska Gora	3196
37733	Krizhe	3196
37734	Kropa	3196
37735	Lesce	3196
37736	Mlaka pri Kranju	3196
37737	Mojstrana	3196
37738	Preddvor	3196
37739	Predoslje	3196
37740	Pristava	3196
37741	Radovljica	3196
37742	Shenchur	3196
37743	Shkofja Loka	3196
37744	Slovenski Javornik	3196
37745	Spodnja Besnica	3196
37746	Spodnje Gorje	3196
37747	Stara Loka	3196
37748	Sveti Duh	3196
37749	Trzhich	3196
37750	Visoko	3196
37751	Zasip	3196
37752	Zgornje Bitnje	3196
37753	Zhelezniki	3196
37754	Zhiri	3196
37755	Ajdovshchina	3197
37756	Bilje	3197
37757	Bovec	3197
37758	Branik	3197
37759	Cerkno	3197
37760	Deskle	3197
37761	Idrija	3197
37762	Kanal	3197
37763	Kobarid	3197
37764	Kromberk	3197
37765	Lokavec	3197
37766	Miren	3197
37767	Nova Gorica	3197
37768	Prvachina	3197
37769	Renche	3197
37770	Rozhna Dolina	3197
37771	Shempas	3197
37772	Shempeter	3197
37773	Solkan	3197
37774	Spodnja Idrija	3197
37775	Tolmin	3197
37776	Vipava	3197
37777	Vrtojba	3197
37778	Chrna na Koroshkem	3199
37779	Dravograd	3199
37780	Legen	3199
37781	Mezhica	3199
37782	Mislinja	3199
37783	Muta	3199
37784	Otishki Vrh	3199
37785	Pameche	3199
37786	Podgorje	3199
37787	Prevalje	3199
37788	Radlje ob Dravi	3199
37789	Ravne	3199
37790	Shmartno pri Slovenj Gradcu	3199
37791	Slovenj Gradec	3199
37792	Vuhred	3199
37793	Vuzenica	3199
37794	Cerknica	3200
37795	Ilirska Bistrica	3200
37796	Pivka	3200
37797	Postojna	3200
37798	Rakek	3200
37799	Stari trg pri Lozhu	3200
37800	Ankaran	3201
37801	Bertoki	3201
37802	Dekani	3201
37803	Divacha	3201
37804	Hrvatni	3201
37805	Izola	3201
37806	Jagodje	3201
37807	Koper	3201
37808	Lucija	3201
37809	Pareceg	3201
37810	Piran	3201
37811	Pobegi	3201
37812	Portorozh	3201
37813	Prade	3201
37814	Secha	3201
37815	Sezhana	3201
37816	Spodnje Shkofije	3201
37817	Sveti Anton	3201
37818	Borovnica	3204
37819	Brezovica pri Ljubljani	3204
37820	Dob	3204
37821	Dobrova	3204
37822	Domzhale	3204
37823	Dragomer	3204
37824	Grosuplje	3204
37825	Horjul	3204
37826	Ig	3204
37827	Ivanchna Gorica	3204
37828	Kamnik	3204
37829	Komenda	3204
37830	Lavrica	3204
37831	Litija	3204
37832	Ljubljana	3204
37833	Log pri Brezovici	3204
37834	Logatec	3204
37835	Medvode	3204
37836	Mekinje	3204
37837	Mengesh	3204
37838	Moravche	3204
37839	Notranje	3204
37840	Podgorje	3204
37841	Preserje pri Radomljah	3204
37842	Radomlje	3204
37843	Rovte	3204
37844	Shentvid pri Stichni	3204
37845	Shkofljica	3204
37846	Shmarca	3204
37847	Shmartno pri Litiji	3204
37848	Smarje-Sap	3204
37849	Trzin	3204
37850	Verd	3204
37851	Vir	3204
37852	Vishnja Gora	3204
37853	Vnanje Gorice	3204
37854	Vodice	3204
37855	Vrhnika	3204
37856	Zgornje Pirniche	3204
37857	Bistrica ob Dravi	3205
37858	Bresternica	3205
37859	Bukovci	3205
37860	Dogoshe	3205
37861	Dornava	3205
37862	Fram	3205
37863	Hotinja Vas	3205
37864	Kamnica	3205
37865	Kidrichevo	3205
37866	Koshaki	3205
37867	Krchevina pri Vurbergu	3205
37868	Lenart	3205
37869	Limbush	3205
37870	Lovrenc na Pohorju	3205
37871	Maribor	3205
37872	Miklavzh na Dravskem Polju	3205
37873	Ormozh	3205
37874	Pekre	3205
37875	Pesnica pri Mariboru	3205
37876	Pobrezhje	3205
37877	Podvinci	3205
37878	Poljchane	3205
37879	Pragersko	3205
37880	Ptuj	3205
37881	Rache	3205
37882	Radizel	3205
37883	Razvanje	3205
37884	Rogoza	3205
37885	Rushe	3205
37886	Selnica ob Dravi	3205
37887	Selnica ob Muri	3205
37888	Shentilj	3205
37889	Skoke	3205
37890	Slovenska Bistrica	3205
37891	Spodnja Polskava	3205
37892	Spodnje Hoche	3205
37893	Spodnji Duplek	3205
37894	Spuhlja	3205
37895	Sredishche ob Dravi	3205
37896	Stojnci	3205
37897	Zgornja Polskava	3205
37898	Zgornje Poljchane	3205
37899	Zgornji Duplek	3205
37900	Bakovci	3206
37901	Beltinci	3206
37902	Chernelavci	3206
37903	Chrenshovci	3206
37904	Dobrovnik	3206
37905	Doklezhovje	3206
37906	Ganchani	3206
37907	Gornja Radgona	3206
37908	Izhakovci	3206
37909	Krog	3206
37910	Lendava	3206
37911	Lipovci	3206
37912	Ljutomer	3206
37913	Melinci	3206
37914	Murska Sobota	3206
37915	Odranci	3206
37916	Petishovci	3206
37917	Radenci	3206
37918	Rakichan	3206
37919	Turnishche	3206
37920	Velika Polana	3206
37921	Verzej	3206
37922	Breg pri Polzeli	3207
37923	Celje	3207
37924	Gornji Grad	3207
37925	Gotovlje	3207
37926	Kasaze	3207
37927	Lashko	3207
37928	Ljubechna	3207
37929	Ljubno ob Savinji	3207
37930	Loka pri Zusmu	3207
37931	Lokovica	3207
37932	Mozirje	3207
37933	Naklo	3207
37934	Nazarje	3207
37935	Oplotnica	3207
37936	Petrovche	3207
37937	Polzela	3207
37938	Prebold	3207
37939	Radeche	3207
37940	Ravne	3207
37941	Rimske Toplica	3207
37942	Rogashka Slatina	3207
37943	Rogatec	3207
37944	Sentjernej	3207
37945	Shempeter	3207
37946	Shentjur	3207
37947	Shkale	3207
37948	Shmarje pri Jelshah	3207
37949	Shoshtanj	3207
37950	Shtore	3207
37951	Slovenske Konjice	3207
37952	Topolshica	3207
37953	Trnovlje pri Celju	3207
37954	Velenje	3207
37955	Vitanje	3207
37956	Vojnik	3207
37957	Zabukovica	3207
37958	Zadobrova	3207
37959	Zhalec	3207
37960	Zreche	3207
37961	Brestanica	3209
37962	Brezhice	3209
37963	Krshko	3209
37964	Leskovac pri Krshkem	3209
37965	Senovo	3209
37966	Sevnica	3209
37967	Dol pri Hrastniku	3210
37968	Hrastnik	3210
37969	Izlake	3210
37970	Kisovec	3210
37971	Trbovlje	3210
37972	Zagorje ob Savi	3210
37973	Adamstown	3211
37974	Tulagi	3212
37975	Taro Island	3213
37976	Honiara	3214
37977	Buala	3215
37978	Auki	3217
37979	Lata	3219
37980	Gizo	3220
37981	Baki	3221
37982	Borama	3221
37983	Gebilay	3221
37984	Sayla	3221
37985	Tayeglo	3222
37986	Xuddur	3222
37987	Yet	3222
37988	Muqdisho	3223
37989	Alula	3224
37990	Bandarbeyla	3224
37991	Bandarmuayo	3224
37992	Bargal	3224
37993	Bereda	3224
37994	Bosaso	3224
37995	Iskushuban	3224
37996	Qandala	3224
37997	Qardho	3224
37998	Xafun	3224
37999	Baydhabo	3225
38000	Bur Hakkaba	3225
38001	Dinsor	3225
38002	Elbur	3226
38003	Eldhere	3226
38004	Dhusa Marreb	3226
38005	Bardhere	3227
38006	Dolaw	3227
38007	Dujuma	3227
38008	Garbaharey	3227
38009	Luq	3227
38010	Sao	3227
38011	Wajid	3227
38012	Balad	3228
38013	Beled Weyne	3228
38014	Bulobarde	3228
38015	Jalalassi	3228
38016	Galkayo	3231
38017	Hobyo	3231
38018	Xarardhere	3231
38019	Eyl	3232
38020	Garowe	3232
38021	Lasanod	3232
38022	Erigabo	3233
38023	Lasqoray	3233
38024	Ek	3236
38025	Buro	3236
38026	Odweyne	3236
38027	Alberton	3240
38028	Alrode	3240
38029	Benmore	3240
38030	Benoni	3240
38031	Boksburg	3240
38032	Booysens	3240
38033	Brakpan	3240
38034	Bronkhorstspruit	3240
38035	Bryanston	3240
38036	Carltonville	3240
38037	Centurion	3240
38038	Cullinan	3240
38039	Dainfern	3240
38040	Edenvale	3240
38041	Ferndale	3240
38042	Fourways	3240
38043	Gardenview	3240
38044	Gauteng	3240
38045	Grant Park	3240
38046	Heidelberg	3240
38047	Isando	3240
38048	Johannesburg	3240
38049	Kelvin	3240
38050	Krugersdorp	3240
38051	Linmeyer	3240
38052	Maraisburg	3240
38053	Midrand	3240
38054	Nigel	3240
38055	Northmead	3240
38056	Petervale	3240
38057	Pinegowrie	3240
38058	Pretoria	3240
38059	Primrose	3240
38060	Randburg	3240
38061	Randfontein	3240
38062	Randvaal	3240
38063	Rivonia	3240
38064	Robertville	3240
38065	Soweto	3240
38066	Springs	3240
38067	Temba	3240
38068	Tembisa	3240
38069	Troyeville	3240
38070	Vanderbijlpark	3240
38071	Vereeniging	3240
38072	Verwoerdburg	3240
38073	Vorna Valley	3240
38074	Wadeville	3240
38075	Westonaria	3240
38076	Sandton	3242
38077	Bela-Bela	3244
38078	Dendron	3244
38079	Duiwelskloof	3244
38080	Ellisras	3244
38081	Giyani	3244
38082	Lebowakgomo	3244
38083	Louis Trichardt	3244
38084	Lulekani	3244
38085	Mankweng	3244
38086	Messina	3244
38087	Mogalakwena	3244
38088	Mutale	3244
38089	Nkowakowa	3244
38090	Nylstroom	3244
38091	Phalaborwa	3244
38092	Pietersburg	3244
38093	Polokwane	3244
38094	Soekmekaar	3244
38095	Southdale	3244
38096	Thabazimbi	3244
38097	Thohoyandou	3244
38098	Thulamahashe	3244
38099	Tzaneen	3244
38100	Botleng	3245
38101	Ekangala	3245
38102	Embalenhle	3245
38103	Emjindini	3245
38104	Empuluzi	3245
38105	Emzinoni	3245
38106	Ermelo	3245
38107	Ethandakukhanja	3245
38108	Groblersdal	3245
38109	Komatipoort	3245
38110	Kriel	3245
38111	KwaZanele	3245
38112	Kwazamokuhle	3245
38113	Lebohang	3245
38114	Marblehall	3245
38115	Mashishing	3245
38116	Mhluzi	3245
38117	Nelspruit	3245
38118	Phola	3245
38119	Sakhile	3245
38120	Secunda	3245
38121	Siyabuswa	3245
38122	Siyathemba	3245
38123	Siyathuthuka	3245
38124	Vukuzakhe	3245
38125	Witbank	3245
38126	Witrivier	3245
38127	eLukwatini	3245
38128	Parow	3248
38129	Umtentweni	3250
38130	ALbatera	3255
38131	Alacant	3255
38132	Alcoi	3255
38133	Almoradi	3255
38134	Altea	3255
38135	Aspe	3255
38136	Benidorm	3255
38137	Benissa	3255
38138	Callosa de Segura	3255
38139	Calp	3255
38140	Cocentaina	3255
38141	Crevillent	3255
38142	Denia	3255
38143	El Campello	3255
38144	Elda	3255
38145	Elx	3255
38146	Guardamar del Segura	3255
38147	Ibi	3255
38148	LAlfas del Pi	3255
38149	La Vila Joiosa	3255
38150	Monover	3255
38151	Mutxamel	3255
38152	Novelda	3255
38153	Orihuela	3255
38154	Pedreguer	3255
38155	Pego	3255
38156	Petrer	3255
38157	Pilar de la Horadada	3255
38158	Pinoso	3255
38159	Rojales	3255
38160	Sant Joan dAlacant	3255
38161	Sant Vicent del Raspeig	3255
38162	Santa Pola	3255
38163	Sax	3255
38164	Teulada	3255
38165	Torrevieja	3255
38166	Villena	3255
38167	Xabia	3255
38168	Amurrio	3256
38169	Llodio	3256
38170	Vitoria	3256
38171	Albacete	3257
38172	Almansa	3257
38173	Caudete	3257
38174	Hellin	3257
38175	La Roda	3257
38176	Villarrobledo	3257
38177	Adra	3258
38178	Albox	3258
38179	Almeria	3258
38180	Berja	3258
38181	Cuevas del Almanzora	3258
38182	El Ejido	3258
38183	Huercal de Almeria	3258
38184	Huercal-Overa	3258
38185	Nijar	3258
38186	Roquetas de Mar	3258
38187	Vicar	3258
38188	Benalmadena	3259
38189	Aller	3260
38190	Aviles	3260
38191	C/ Pena Salon	3260
38192	Cangas del Narcea	3260
38193	Carreno	3260
38194	Castrillon	3260
38195	Corvera de Asturias	3260
38196	Gijon	3260
38197	Gozon	3260
38198	Grado	3260
38199	Langreo	3260
38200	Laviana	3260
38201	Lena	3260
38202	Llanera	3260
38203	Llanes	3260
38204	Mieres	3260
38205	Navia	3260
38206	Oviedo	3260
38207	Pilona	3260
38208	Pravia	3260
38209	San Martin del Rey Aurelio	3260
38210	Siero	3260
38211	Tineo	3260
38212	Valdes	3260
38213	Villaviciosa	3260
38214	Avila	3261
38215	Almendralejo	3262
38216	Azuaga	3262
38217	Badajoz	3262
38218	Don Benito	3262
38219	Jerez de los Caballeros	3262
38220	Merida	3262
38221	Montijo	3262
38222	Olivenza	3262
38223	Villafranca de los Barros	3262
38224	Villanueva de la Serena	3262
38225	Zafra	3262
38226	Alayor-Menorca	3263
38227	Alcudia	3263
38228	Calvia	3263
38229	Capdepera	3263
38230	Ciutadella de Menorca	3263
38231	Eivissa	3263
38232	Felanitx	3263
38233	Inca	3263
38234	Llucmajor	3263
38235	Mahon	3263
38236	Manacor	3263
38237	Marratxi	3263
38238	Palma	3263
38239	Pollenca	3263
38240	Sa Pobla	3263
38241	Sant Antoni de Portmany	3263
38242	Sant Josep de sa Talaia	3263
38243	Santa Eulalia del Rio	3263
38244	Santanyi	3263
38245	Soller	3263
38246	Abrera	3264
38247	Alella	3264
38248	Arenys de Mar	3264
38249	Argentona	3264
38250	Badalona	3264
38251	Badia del Valles	3264
38252	Barbera del Valles	3264
38253	Barcelona	3264
38254	Berga	3264
38255	Cabrera de Mar	3264
38256	Caldes de Montbui	3264
38257	Calella	3264
38258	Canet de Mar	3264
38259	Canovelles	3264
38260	Cardedeu	3264
38261	Castellar del Valles	3264
38262	Castellbisbal	3264
38263	Castelldefels	3264
38264	Cerdanyola	3264
38265	Corbera de Llobregat	3264
38266	Cornella	3264
38267	El Masnou	3264
38268	El Prat de Llobregat	3264
38269	Esparreguera	3264
38270	Esplugues de Llobregat	3264
38271	Gava	3264
38272	Granollers	3264
38273	Igualada	3264
38274	LHospitalet de Llobregat	3264
38275	La Garriga	3264
38276	La Llagosta	3264
38277	Les Franquesas del Valles	3264
38278	Llica dAmunt	3264
38279	Malgrat de Mar	3264
38280	Manlleu	3264
38281	Manresa	3264
38282	Martorell	3264
38283	Mataro	3264
38284	Molins de Rei	3264
38285	Mollet del Valles	3264
38286	Montcada i Reixac	3264
38287	Montgat	3264
38288	Montmelo	3264
38289	Montornes del Valles	3264
38290	Olesa de Montserrat	3264
38291	Palau-solita i Plegamans	3264
38292	Palleja	3264
38293	Parets del Valles	3264
38294	Piera	3264
38295	Pineda de Mar	3264
38296	Premia de Dalt	3264
38297	Premia de Mar	3264
38298	Ripollet	3264
38299	Rubi	3264
38300	Sabadell	3264
38301	Sant Adria de Besos	3264
38302	Sant Andreu de la Barca	3264
38303	Sant Boi de Llobregat	3264
38304	Sant Celoni	3264
38305	Sant Cugat del Valles	3264
38306	Sant Feliu de Llobregat	3264
38307	Sant Joan Despi	3264
38308	Sant Joan de Vilatorrada	3264
38309	Sant Just Desvern	3264
38310	Sant Pere de Ribes	3264
38311	Sant Quirze del Valles	3264
38312	Sant Sadurni dAnoia	3264
38313	Sant Vicenc dels Horts	3264
38314	Santa Coloma de Gramenet	3264
38315	Santa Margarida de Montbui	3264
38316	Santa Perpetua de Mogoda	3264
38317	Sitges	3264
38318	Son Servera	3264
38319	Terrassa	3264
38320	Tordera	3264
38321	Torello	3264
38322	Vallirana	3264
38323	Vic	3264
38324	Viladecans	3264
38325	Viladecavalls	3264
38326	Vilafranca del Penedes	3264
38327	Vilanova del Cami	3264
38328	Vilanova i la Geltru	3264
38329	Vilassar del Mar	3264
38330	Bertamirans	3265
38331	Berriatua	3266
38332	Derio	3266
38333	Elorio	3266
38334	Loiu	3266
38335	Aranda de Duero	3267
38336	Burgos	3267
38337	Miranda de Ebro	3267
38338	Caceres	3268
38339	Coria	3268
38340	Miajadas	3268
38341	Navalmoral de la Mata	3268
38342	Plasencia	3268
38343	Talayuela	3268
38344	Trujillo	3268
38345	Algeciras	3269
38346	Arcos de la Frontera	3269
38347	Barbate	3269
38348	Cadiz	3269
38349	Chiclana	3269
38350	Chipiona	3269
38351	Conil	3269
38352	El Puerto de Santa Maria	3269
38353	Jerez	3269
38354	Jimena de la Frontera	3269
38355	La Linea	3269
38356	Los Barrios	3269
38357	Medina-Sidonia	3269
38358	Olvera	3269
38359	Puerto Real	3269
38360	Rota	3269
38361	San Fernando	3269
38362	San Roque	3269
38363	Sanlucar de Barrameda	3269
38364	Tarifa	3269
38365	Ubrique	3269
38366	Vejer de la Frontera	3269
38367	Villamartin	3269
38368	Camargo	3270
38369	Castro-Urdiales	3270
38370	El Astillero	3270
38371	Laredo	3270
38372	Los Corrales de Buelna	3270
38373	Pielagos	3270
38374	Reinosa	3270
38375	San Felices De Buelna	3270
38376	Santa Cruz de Bezana	3270
38377	Santander	3270
38378	Santona	3270
38379	Torrelavega	3270
38380	Almassora	3271
38381	Benicarlo	3271
38382	Benicassim	3271
38383	Burriana	3271
38384	Castello	3271
38385	LAlcora	3271
38386	La Vall dUixo	3271
38387	Nules	3271
38388	Onda	3271
38389	Segorbe	3271
38390	Vila-real	3271
38391	Vinaros	3271
38392	Barcelona	3272
38393	Ceuta	3273
38394	Aguilar de la Frontera	3281
38395	Baena	3281
38396	Bujalance	3281
38397	Cabra	3281
38398	Cordoba	3281
38399	Fernan-Nunez	3281
38400	Fuente Palmera	3281
38401	La Carlota	3281
38402	Lucena	3281
38403	Luque	3281
38404	Montilla	3281
38405	Montoro	3281
38406	Palma del Rio	3281
38407	Penarroya-Pueblonuevo	3281
38408	Pozoblanco	3281
38409	Priego de Cordoba	3281
38410	Puente Genil	3281
38411	Rute	3281
38412	Villanueva de Cordoba	3281
38413	Cuenca	3282
38414	Tarancon	3282
38415	Aduna	3283
38416	Lazakao	3283
38417	Banyoles	3284
38418	Blanes	3284
38419	Empuriabrava	3284
38420	Figueres	3284
38421	Girona	3284
38422	La Bisbal dEmporda	3284
38423	Lloret de Mar	3284
38424	Massanet de la Selva	3284
38425	Olot	3284
38426	Palafrugell	3284
38427	Palamos	3284
38428	Ripoll	3284
38429	Roses	3284
38430	Salt	3284
38431	Sant Feliu de Guixols	3284
38432	Santa Coloma de Farners	3284
38433	Torroella de Montgri	3284
38434	Albolote	3285
38435	Almunecar	3285
38436	Armilla	3285
38437	Atarfe	3285
38438	Baza	3285
38439	Granada	3285
38440	Guadix	3285
38441	Huescar	3285
38442	Huetor Tajar	3285
38443	Huetor Vega	3285
38444	Illora	3285
38445	La Zubia	3285
38446	Las Gabias	3285
38447	Loja	3285
38448	Maracena	3285
38449	Motril	3285
38450	Ogijares	3285
38451	Peligros	3285
38452	Pinos Puente	3285
38453	Salobrena	3285
38454	Santa Fe	3285
38455	Azuqueca de Henares	3286
38456	Guadalajara	3286
38457	Andoain	3287
38458	Anoeta	3287
38459	Arrasate	3287
38460	Azkoitia	3287
38461	Azpeitia	3287
38462	Beasain	3287
38463	Bergara	3287
38464	Donostia	3287
38465	Eibar	3287
38466	Elgoibar	3287
38467	Errenteria	3287
38468	Guipuuzcoa	3287
38469	Hernani	3287
38470	Hondarribia	3287
38471	Irun	3287
38472	Legazpi	3287
38473	Mendaro	3287
38474	Mondragon	3287
38475	Oiartzun	3287
38476	Onati	3287
38477	Ordizia	3287
38478	Oria	3287
38479	Pasaia	3287
38480	Tolosa	3287
38481	Zarautz	3287
38482	Zumaia	3287
38483	Zumarraga	3287
38484	Aljaraque	3288
38485	Almonte	3288
38486	Ayamonte	3288
38487	Bollullos Par del Condado	3288
38488	Cartaya	3288
38489	Gibraleon	3288
38490	Huelva	3288
38491	Isla Cristina	3288
38492	La Palma del Condado	3288
38493	Lepe	3288
38494	Moguer	3288
38495	Punta Umbria	3288
38496	Valverde del Camino	3288
38497	Barbastro	3289
38498	Binefar	3289
38499	Fraga	3289
38500	Huesca	3289
38501	Jaca	3289
38502	Monzon	3289
38503	Sabinanigo	3289
38504	Alcala la Real	3290
38505	Alcaudete	3290
38506	Andujar	3290
38507	Baeza	3290
38508	Bailen	3290
38509	Cazorla	3290
38510	Jaen	3290
38511	Jodar	3290
38512	La Carolina	3290
38513	Linares	3290
38514	Mancha Real	3290
38515	Martos	3290
38516	Mengibar	3290
38517	Torre del Campo	3290
38518	Torredonjimeno	3290
38519	Ubeda	3290
38520	Villacarrillo	3290
38521	Villanueva del Arzobispo	3290
38522	Astorga	3293
38523	Bembibre	3293
38524	La Baneza	3293
38525	Leon	3293
38526	Ponferrada	3293
38527	San Andres del Rabanedo	3293
38528	Villablino	3293
38529	Villaquilambre	3293
38530	Tora	3294
38531	Balaguer	3295
38532	La Seu dUrgell	3295
38533	Lleida	3295
38534	Mollerussa	3295
38535	Tarrega	3295
38536	Burela	3296
38537	Cervo	3296
38538	Chantada	3296
38539	Foz	3296
38540	Lugo	3296
38541	Monforte de Lemos	3296
38542	Ribadeo	3296
38543	Sarria	3296
38544	Vilalba	3296
38545	Viveiro	3296
38546	Alcala de Henares	3297
38547	Alcobendas	3297
38548	Alcorcon	3297
38549	Algete	3297
38550	Alpedrete	3297
38551	Aranjuez	3297
38552	Arganda del Rey	3297
38553	Boadilla del Monte	3297
38554	Ciempozuelos	3297
38555	Collado Villalba	3297
38556	Colmenar Viejo	3297
38557	Coslada	3297
38558	El Escorial	3297
38559	Fuenlabrada	3297
38560	Galapagar	3297
38561	Getafe	3297
38562	Guadarrama	3297
38563	Humanes de Madrid	3297
38564	Las Rozas de Madrid	3297
38565	Leganes	3297
38566	Madrid	3297
38567	Majadahonda	3297
38568	Meco	3297
38569	Mejorada del Campo	3297
38570	Mostoles	3297
38571	Navalcarnero	3297
38572	Parla	3297
38573	Pinto	3297
38574	Pozuelo de Alarcon	3297
38575	Rivas-Vaciamadrid	3297
38576	San Fernando de Henares	3297
38577	San Lorenzo de El Escorial	3297
38578	San Martin de la Vega	3297
38579	San Sebastian de los Reyes	3297
38580	Torrejon de Ardoz	3297
38581	Torrelodones	3297
38582	Tres Cantos	3297
38583	Valdemoro	3297
38584	Velilla de San Antonio	3297
38585	Villanueva de la Canada	3297
38586	Villaviciosa de Odon	3297
38587	Alhaurin de la Torre	3298
38588	Alhaurin el Grande	3298
38589	Alora	3298
38590	Antequera	3298
38591	Apartado	3298
38592	Archidona	3298
38593	Benalmadena	3298
38594	Cartama	3298
38595	Coin	3298
38596	Estepona	3298
38597	Fuengirola	3298
38598	Malaga	3298
38599	Marbella	3298
38600	Mijas	3298
38601	Nerja	3298
38602	Rincon de la Victoria	3298
38603	Ronda	3298
38604	Torremolinos	3298
38605	Torrox	3298
38606	Velez-Malaga	3298
38607	maro	3298
38608	Melilla	3299
38609	Abaran	3300
38610	Aguilas	3300
38611	Alcantarilla	3300
38612	Alhama de Murcia	3300
38613	Archena	3300
38614	Beniel	3300
38615	Bullas	3300
38616	Calasparra	3300
38617	Caravaca de la Cruz	3300
38618	Cartagena	3300
38619	Cehegin	3300
38620	Cieza	3300
38621	Fuente Alamo de Murcia	3300
38622	Jumilla	3300
38623	La Union	3300
38624	Las Torres de Cotillas	3300
38625	Lorca	3300
38626	Los Alcazares	3300
38627	Mazarron	3300
38628	Molina de Segura	3300
38629	Moratella	3300
38630	Mula	3300
38631	Murcia	3300
38632	Puerto Lumbreras	3300
38633	San Javier	3300
38634	San Pedro del Pinatar	3300
38635	Santomera	3300
38636	Torre Pacheco	3300
38637	Torre-Pacheco	3300
38638	Totana	3300
38639	Yecla	3300
38640	Ansoain	3301
38641	Atarrabia	3301
38642	Baranain	3301
38643	Burlata	3301
38644	Iruna	3301
38645	Lizarra	3301
38646	Navarra	3301
38647	Orkoien	3301
38648	Tafalla	3301
38649	Tudela	3301
38650	Zizur Nagusia	3301
38651	O Barco de Valdeorras	3302
38652	O Carballino	3302
38653	Ourense	3302
38654	Verin	3302
38655	Xinzo de Limia	3302
38656	Guardo	3304
38657	Palencia	3304
38658	A Estrada	3305
38659	A Guarda	3305
38660	Baiona	3305
38661	Bueu	3305
38662	Caldas de Reis	3305
38663	Cambados	3305
38664	Cangas	3305
38665	Cangas De Morrazo	3305
38666	Gondomar	3305
38667	Lalin	3305
38668	Marin	3305
38669	Moana	3305
38670	Mos	3305
38671	Nigran	3305
38672	O Grove	3305
38673	O Porrino	3305
38674	Poio	3305
38675	Ponteareas	3305
38676	Pontevedra	3305
38677	Redondela	3305
38678	Salvaterra de Mino	3305
38679	Sanxenxo	3305
38680	Silleda	3305
38681	Tomino	3305
38682	Tui	3305
38683	Vigo	3305
38684	Vilagarcia de Arousa	3305
38685	Vilanova de Arousa	3305
38686	Bejar	3306
38687	Ciudad Rodrigo	3306
38688	Salamanca	3306
38689	Santa Marta de Tormes	3306
38690	Cuellar	3308
38691	Segovia	3308
38692	Alcala de Guadaira	3309
38693	Alcala del Rio	3309
38694	Arahal	3309
38695	Bormujos	3309
38696	Brenes	3309
38697	Camas	3309
38698	Cantillana	3309
38699	Carmona	3309
38700	Castilleja de la Cuesta	3309
38701	Coria del Rio	3309
38702	Dos Hermanas	3309
38703	Ecija	3309
38704	El Viso del Alcor	3309
38705	Estepa	3309
38706	Gines	3309
38707	Guillena	3309
38708	La Algaba	3309
38709	La Puebla de Cazalla	3309
38710	La Puebla del Rio	3309
38711	La Rinconada	3309
38712	Las Cabezas de San Juan	3309
38713	Lebrija	3309
38714	Lora del Rio	3309
38715	Los Palacios y Villafranca	3309
38716	Mairena del Alcor	3309
38717	Mairena del Aljarafe	3309
38718	Marchena	3309
38719	Moron de la Frontera	3309
38720	Olivares	3309
38721	Osuna	3309
38722	Pilas	3309
38723	San Juan de Aznalfarache	3309
38724	Sanlucar la Mayor	3309
38725	Sevilla	3309
38726	Tocina	3309
38727	Tomares	3309
38728	Utrera	3309
38729	Soria	3310
38730	Alcanar	3311
38731	Amposta	3311
38732	Calafell	3311
38733	Cambrils	3311
38734	Deltrebe	3311
38735	El Vendrell	3311
38736	Reus	3311
38737	Salou	3311
38738	Sant Carles de la Rapita	3311
38739	Tarragona	3311
38740	Torredembarra	3311
38741	Tortosa	3311
38742	Valls	3311
38743	Vila-seca	3311
38744	Tenerife	3312
38745	Alcaniz	3313
38746	Teruel	3313
38747	Consuegra	3314
38748	Illescas	3314
38749	Madridejos	3314
38750	Mora	3314
38751	Pepino	3314
38752	Quintanar de la Orden	3314
38753	Sonseca	3314
38754	Talavera de la Reina	3314
38755	Toledo	3314
38756	Torrijos	3314
38757	Villacanas	3314
38758	Agullent	3315
38759	Alaquas	3315
38760	Albal	3315
38761	Alberic	3315
38762	Alboraya	3315
38763	Aldaia	3315
38764	Alfafar	3315
38765	Algemesi	3315
38766	Alginet	3315
38767	Alzira	3315
38768	Benaguasil	3315
38769	Benetusser	3315
38770	Benifaio	3315
38771	Beniparrell	3315
38772	Betera	3315
38773	Bunol	3315
38774	Burjassot	3315
38775	Canals	3315
38776	Carcaixent	3315
38777	Carlet	3315
38778	Catarroja	3315
38779	Chiva	3315
38780	Cullera	3315
38781	Elche	3315
38782	Gandia	3315
38783	Godella	3315
38784	LAlcudia	3315
38785	LEliana	3315
38786	La Pobla de Vallbona	3315
38787	Lliria	3315
38788	Los Montesinos	3315
38789	Manises	3315
38790	Massamagrell	3315
38791	Meliana	3315
38792	Mislata	3315
38793	Moncada	3315
38794	Oliva	3315
38795	Ontinyent	3315
38796	Paiporta	3315
38797	Paterna	3315
38798	Picanya	3315
38799	Picassent	3315
38800	Pucol	3315
38801	Quart de Poblet	3315
38802	Requena	3315
38803	Riba-roja de Turia	3315
38804	Sagunt	3315
38805	Sedavi	3315
38806	Silla	3315
38807	Sueca	3315
38808	Tavernes Blanques	3315
38809	Tavernes de la Valldigna	3315
38810	Torrent	3315
38811	Utiel	3315
38812	Valencia	3315
38813	Xativa	3315
38814	Xirivella	3315
38815	Laguna de Duero	3316
38816	Medina del Campo	3316
38817	Tordesillas	3316
38818	Valladolid	3316
38819	Abadiano	3317
38820	Abanto Zierbena	3317
38821	Amorebieta	3317
38822	Arrigorriaga	3317
38823	Barakaldo	3317
38824	Basauri	3317
38825	Bermeo	3317
38826	Berriz	3317
38827	Bilbao	3317
38828	Durango	3317
38829	Erandio	3317
38830	Ermua	3317
38831	Etxano	3317
38832	Galdakao	3317
38833	Gernika-Lumo	3317
38834	Getxo	3317
38835	Igorre	3317
38836	Leioa	3317
38837	Mungia	3317
38838	Ondarroa	3317
38839	Ortuella	3317
38840	Portugalete	3317
38841	Santurtzi	3317
38842	Sestao	3317
38843	Sopelana	3317
38844	Trapagaran	3317
38845	Zamudio	3317
38846	Benavente	3318
38847	Toro	3318
38848	Zamora	3318
38849	Calatayud	3319
38850	Ejea de los Caballeros	3319
38851	Tarazona	3319
38852	Utebo	3319
38853	Zaragoza	3319
38854	Amparai	3320
38855	Galmune	3320
38856	Anuradhapuraya	3321
38857	Badulla	3322
38858	Bandarawela	3322
38859	Haputale	3322
38860	Boralesgamuwa	3323
38861	Battaramulla	3324
38862	Colombo	3324
38863	Dehiwala-Mount Lavinia	3324
38864	Homagama	3324
38865	Jayawardanapura	3324
38866	Kolonnawa	3324
38867	Kotikawatta	3324
38868	Maharagama	3324
38869	Moratuwa	3324
38870	Mulleriyawa	3324
38871	Ratmalana	3324
38872	Seethawakapura	3324
38873	Sri Jayawardanapura	3324
38874	Ambalamgoda	3325
38875	Galla	3325
38876	Daluguma	3326
38877	Gampaha	3326
38878	Hendala	3326
38879	Jaela	3326
38880	Kandana	3326
38881	Katunayaka	3326
38882	Kelaniya	3326
38883	Migamuwa	3326
38884	Minuwangoda	3326
38885	Peliyagoda	3326
38886	Ragama	3326
38887	Wattala	3326
38888	Welesara	3326
38889	Hambantota	3327
38890	Tanggalla	3327
38891	Beruwala	3328
38892	Horana	3328
38893	Kalutara	3328
38894	Keselwatta	3328
38895	Panadraya	3328
38896	Kegalla	3329
38897	Kilinochchi	3330
38898	Kuliyapitiya	3331
38899	Kurunegala	3331
38900	Polgahawela	3331
38901	Eravur	3332
38902	Katankudi	3332
38903	Madakalpuwa	3332
38904	Malwana	3334
38905	Mannarama	3335
38906	Dambulla	3336
38907	Matale	3336
38908	Sigiriya	3336
38909	Matara	3337
38910	Weligama	3337
38911	Monaragala	3338
38912	Wattegama	3338
38913	Mullaitivu	3339
38914	Polonnaruwa	3343
38915	Halawata	3344
38916	Puttalama	3344
38917	Balangoda	3345
38918	Ratnapuraya	3345
38919	Tirikunamalaya	3347
38920	Querceta	3348
38921	Vavuniyawa	3349
38922	Chavakachcheri	3351
38923	Peduru Tuduwa	3351
38924	Valvedditturai	3351
38925	Yapanaya	3351
38926	Mahara	3352
38927	Kodok	3353
38928	Malakal	3353
38929	Nasir	3353
38930	ar-Rank	3353
38931	Juba	3354
38932	Yei	3354
38933	Maridi	3359
38934	Nzara	3359
38935	Tambura	3359
38936	Yambio	3359
38937	Bur	3362
38938	Aruma	3363
38939	Halfa al-Jadidah	3363
38940	Kassala	3363
38941	Khashm-al-Qirbah	3363
38942	Wagar	3363
38943	al-Masnah	3363
38944	Atbarah	3364
38945	Barbar	3364
38946	Kabushiyah	3364
38947	Shandi	3364
38948	ad-Damir	3364
38949	al-Bawga	3364
38950	al-Matammah	3364
38951	Kapoeta	3368
38952	Torit	3368
38953	Abu Hijar	3369
38954	Galgani	3369
38955	Hajj Abdallah	3369
38956	Karkawj	3369
38957	Mayurnu	3369
38958	Sinjah	3369
38959	Sinnar	3369
38960	Sinnar-at-Tagatu	3369
38961	Umm Shawkah	3369
38962	ad-Dindar	3369
38963	as-Suki	3369
38964	Mashra ar-Raqq	3370
38965	Tonj	3370
38966	Warab	3370
38967	Bur Sudan	3372
38968	Gabait	3372
38969	Sawakin	3372
38970	Sinkat	3372
38971	Tawkar	3372
38972	Rumbik	3373
38973	Yirol	3373
38974	Abu Usar	3374
38975	Arbaatun wa Ishrun-al-Qurash	3374
38976	Maharaybah	3374
38977	Miallayab	3374
38978	Rufaa	3374
38979	Sharafat	3374
38980	Tabat	3374
38981	Tambul	3374
38982	Wad Madani	3374
38983	Wad Rawah	3374
38984	al-Hawsh	3374
38985	al-Hilaliyah	3374
38986	al-Huda	3374
38987	al-Husayhisah	3374
38988	al-Kamilin	3374
38989	al-Karaymat	3374
38990	al-Manaqil	3374
38991	al-Musadiyah	3374
38992	al-Musallamiyah	3374
38993	Umm Dawm	3375
38994	Umm Durman	3375
38995	al-Khartum	3375
38996	al-Khartum Bahri	3375
38997	Doka	3376
38998	Qala-an-Nahl	3376
38999	Shuwak	3376
39000	al-Faw	3376
39001	al-Hawatah	3376
39002	al-Qadarif	3376
39003	Bentiu	3377
39004	Ler	3377
39005	Asalaya	3378
39006	Bufi	3378
39007	Gulli	3378
39008	Kinanah	3378
39009	Kusti	3378
39010	Marabba	3378
39011	Rabak	3378
39012	Shabashah	3378
39013	Tandalti	3378
39014	Umm Jarr	3378
39015	Wad-az-Zaki	3378
39016	ad-Duwaym	3378
39017	al-Jazirah	3378
39018	al-Kawah	3378
39019	al-Qutaynah	3378
39020	ad-Damazin	3379
39021	al-Kurumuk	3379
39022	al-Quwaysi	3379
39023	ar-Rusayris	3379
39024	Argu	3380
39025	Dalqu	3380
39026	Dunqulah	3380
39027	Kanisah	3380
39028	Karmah-an-Nuzul	3380
39029	Kuraymah	3380
39030	Kurti	3380
39031	Marawi	3380
39032	Tangasi-ar-Ruays	3380
39033	Wadi Halfa	3380
39034	ad-Dabbah	3380
39035	Brokopondo	3381
39036	Brownsweg	3381
39037	Marienburg	3382
39038	Meerzorg	3382
39039	Nieuw Amsterdam	3382
39040	Totness	3383
39041	Albina	3384
39042	Moengo	3384
39043	Nieuw Nickerie	3385
39044	Wageningen	3385
39045	Onverwacht	3386
39046	Paramaribo	3387
39047	Groningen	3388
39048	Lelydorp	3389
39049	Barentsburg	3390
39050	Hornsund	3390
39051	Isfjord Radio	3390
39052	Longyearbyen	3390
39053	Ny-Alesund	3390
39054	Bulembu	3391
39055	Ezulwini	3391
39056	Mbabane	3391
39057	Ngwenya	3391
39058	Piggs Peak	3391
39059	Big Bend	3392
39060	Mhlume	3392
39061	Mpaka	3392
39062	Nsoko	3392
39063	Simunye	3392
39064	Siteki	3392
39065	Tshaneni	3392
39066	Bhunya	3393
39067	Kwaluseni	3393
39068	Lobamba	3393
39069	Malkerns	3393
39070	Mankayane	3393
39071	Manzini	3393
39072	Matsapha	3393
39073	Mhlambanyatsi	3393
39074	Sidvokodvo	3393
39075	Hlatikulu	3394
39076	Hluti	3394
39077	Kubuta	3394
39078	Lavumisa	3394
39079	Nhlangano	3394
39080	Karlshamn	3397
39081	Karlskrona	3397
39082	Ronneby	3397
39083	Stenungsund	3398
39084	Avesta	3399
39085	Borlange	3399
39086	Falun	3399
39087	Hedemora	3399
39088	Ludvika	3399
39089	Malung	3399
39090	Bollnas	3400
39091	Bro	3400
39092	Gavle	3400
39093	Hudiksvall	3400
39094	Sandviken	3400
39095	Soderhamn	3400
39096	Skara	3402
39097	Visby	3402
39098	Anderstorp	3403
39099	Falkenberg	3403
39100	Halmstad	3403
39101	Ullared	3403
39102	Varberg	3403
39103	Farjestaden	3404
39104	Ostersund	3404
39105	Gislaved	3405
39106	Jonkoping	3405
39107	Nassjo	3405
39108	Tranas	3405
39109	Varnamo	3405
39110	Vetlanda	3405
39111	Blomstermala	3406
39112	Kalmar	3406
39113	Nybro	3406
39114	Oskarshamn	3406
39115	Solna	3406
39116	Torsas	3406
39117	Vastervik	3406
39118	Habo	3407
39119	Limhamn	3407
39120	Segeltorp	3407
39121	Svedala	3407
39122	Ljungby	3408
39123	Vaxjo	3408
39124	Boden	3409
39125	Kiruna	3409
39126	Lulea	3409
39127	Pitea	3409
39128	Askersund	3410
39129	Karlskoga	3410
39130	Kumla	3410
39131	Orebro	3410
39132	Finspang	3411
39133	Follinge	3411
39134	Kisa	3411
39135	Linkoping	3411
39136	Mjolby	3411
39137	Motala	3411
39138	Norrkoping	3411
39139	Vadstena	3411
39140	Skarpovagen	3412
39141	Angelholm	3413
39142	Arlov	3413
39143	Bastad	3413
39144	Eslov	3413
39145	Hassleholm	3413
39146	Helsingborg	3413
39147	Hjarup	3413
39148	Hoganas	3413
39149	Horby	3413
39150	Jonstorp	3413
39151	Klagstorp	3413
39152	Kristianstad	3413
39153	Landskrona	3413
39154	Lund	3413
39155	Malmo	3413
39156	Skanor	3413
39157	Staffanstorp	3413
39158	Trelleborg	3413
39159	Ystad	3413
39160	Hillerstorp	3414
39161	Markaryd	3414
39162	Smalandsstenar	3414
39163	Eskilstuna	3415
39164	Gnesta	3415
39165	Katrineholm	3415
39166	Nacka Strand	3415
39167	Nykoping	3415
39168	Strangnas	3415
39169	Vingaker	3415
39170	Akersberga	3416
39171	Boo	3416
39172	Bromma	3416
39173	Djursholm	3416
39174	Hallstavik	3416
39175	Jarfalla	3416
39176	Johannesfred	3416
39177	Lidingo	3416
39178	Marsta	3416
39179	Norrtalje	3416
39180	Norsborg	3416
39181	Nynashamn	3416
39182	Rosersberg	3416
39183	Sodertalje	3416
39184	Sollentuna	3416
39185	Stockholm	3416
39186	Sundbyberg	3416
39187	Taby	3416
39188	Tumba	3416
39189	Upplands-Vasby	3416
39190	Vallentuna	3416
39191	Vasterhaninge	3416
39192	Balsta	3417
39193	Enkoping	3417
39194	Knivsta	3417
39195	Skyttorp	3417
39196	Storvreta	3417
39197	Uppsala	3417
39198	Arvika	3418
39199	Hammaro	3418
39200	Karlstad	3418
39201	Kristinehamn	3418
39202	Skoghall	3418
39203	Guglingen	3419
39204	Robertsfors	3419
39205	Skelleftea	3419
39206	Umea	3419
39207	Gothenburg	3420
39208	Kallered	3420
39209	Kvanum	3420
39210	Timmersdala	3420
39211	Harnosand	3421
39212	Ornskoldsvik	3421
39213	Sundsvall	3421
39214	Arboga	3422
39215	Fagersta	3422
39216	Hallstahammar	3422
39217	Koping	3422
39218	Sala	3422
39219	Vasteras	3422
39220	Aarau	3424
39221	Aarburg	3424
39222	Baden	3424
39223	Bevilard	3424
39224	Bremgarten	3424
39225	Brugg	3424
39226	Buchs	3424
39227	Chevenez	3424
39228	Fislisbach	3424
39229	Granichen	3424
39230	Hagglingen	3424
39231	Kaiseraugst	3424
39232	Kleindoettingen	3424
39233	Klingnau	3424
39234	Kuttigen	3424
39235	Lenzburg	3424
39236	Menziken	3424
39237	Mohlin	3424
39238	Mumpf	3424
39239	Muri	3424
39240	Neuenhof	3424
39241	Niederlenz	3424
39242	Niederwangen	3424
39243	Niederwil	3424
39244	Oberentfelden	3424
39245	Obersiggenthal	3424
39246	Oftringen	3424
39247	Reinach	3424
39248	Rheinfelden	3424
39249	Rosshausern	3424
39250	Rothrist	3424
39251	Rupperswil	3424
39252	Schmitten	3424
39253	Seon	3424
39254	Spreitenbach	3424
39255	Stein	3424
39256	Suhr	3424
39257	Trogen	3424
39258	Untersiggenthal	3424
39259	Villmergen	3424
39260	Wettingen	3424
39261	Windisch	3424
39262	Wohlen	3424
39263	Wurenlos	3424
39264	Zofingen	3424
39265	Aesch	3427
39266	Allschwil	3427
39267	Arlesheim	3427
39268	Binningen	3427
39269	Birsfelden	3427
39270	Bottmingen	3427
39271	Ettingen	3427
39272	Frenkendorf	3427
39273	Gelterkinden	3427
39274	Laufen	3427
39275	Lausen	3427
39276	Liestal	3427
39277	Munchenstein	3427
39278	Muttenz	3427
39279	Oberwil	3427
39280	Pratteln	3427
39281	Reinach	3427
39282	Sissach	3427
39283	Therwil	3427
39284	Basel	3428
39285	Riehen	3428
39286	Belp	3429
39287	Bern	3429
39288	Berne	3429
39289	Biel	3429
39290	Biel-Bienne	3429
39291	Bolligen	3429
39292	Burgdorf	3429
39293	Frutigen	3429
39294	Heimberg	3429
39295	Herzogenbuchsee	3429
39296	Huttwil	3429
39297	Interlaken	3429
39298	Ittigen	3429
39299	Kirchberg	3429
39300	Koniz	3429
39301	Konolfingen	3429
39302	Langenthal	3429
39303	Langnau	3429
39304	Lengnau	3429
39305	Lyss	3429
39306	Meiringen	3429
39307	Moutier	3429
39308	Munchenbuchsee	3429
39309	Munsingen	3429
39310	Muri	3429
39311	Nidau	3429
39312	Orpund	3429
39313	Ostermundingen	3429
39314	Pieterlen	3429
39315	Saanen	3429
39316	Saint-Imier	3429
39317	Sonceboz	3429
39318	Spiez	3429
39319	Steffisburg	3429
39320	Sumiswald	3429
39321	Thun	3429
39322	Uetendorf	3429
39323	Unterseen	3429
39324	Urtenen	3429
39325	Vechingen	3429
39326	Wahlern	3429
39327	Wohlen	3429
39328	Worb	3429
39329	Zollikofen	3429
39330	Bulle	3431
39331	Dudingen	3431
39332	Fribourg	3431
39333	Granges-Paccot	3431
39334	Marly	3431
39335	Muntelier	3431
39336	Murten	3431
39337	Remaufens	3431
39338	Villars-sur-Glane	3431
39339	Villaz-Saint-Pierre	3431
39340	Wunnewil-Flamatt	3431
39341	Bernex	3432
39342	Carouge	3432
39343	Chene-Bougeries	3432
39344	Chene-Bourg	3432
39345	Collonge-Bellerive	3432
39346	Cologny	3432
39347	Geneva	3432
39348	Geneve	3432
39349	Lancy	3432
39350	Le Grand-Saconnex	3432
39351	Meyrin	3432
39352	Onex	3432
39353	Plan-les-Ouates	3432
39354	Thonex	3432
39355	Vernier	3432
39356	Versoix	3432
39357	Veyrier	3432
39358	Glarus	3433
39359	Nafels	3433
39360	Arosa	3434
39361	Chur	3434
39362	Davos	3434
39363	Domat	3434
39364	Igis	3434
39365	Landquart	3434
39366	Maienfeld	3434
39367	Sankt Moritz	3434
39368	Heerbrugg	3435
39369	Delemont	3436
39370	Glovelier	3436
39371	Le Noirmont	3436
39372	Porrentruy	3436
39373	Adligenswil	3438
39374	Ballwil	3438
39375	Buchrain	3438
39376	Ebikon	3438
39377	Emmen	3438
39378	Hochdorf	3438
39379	Horw	3438
39380	Kriens	3438
39381	Littau	3438
39382	Luzern	3438
39383	Malters	3438
39384	Meggen	3438
39385	Neuenkirch	3438
39386	Perlern	3438
39387	Rothenburg	3438
39388	Ruswil	3438
39389	Sursee	3438
39390	Muhen	3440
39391	Bole	3441
39392	Boudry	3441
39393	Colombier	3441
39394	La Chaux-de-Fonds	3441
39395	Le Locle	3441
39396	Neuchatel	3441
39397	Peseux	3441
39398	Buochs	3442
39399	Hergiswil	3442
39400	Stans	3442
39401	Stansstad	3442
39402	Alpnach	3443
39403	Kerns	3443
39404	Sachseln	3443
39405	Sarnen	3443
39406	Neuhausen	3445
39407	Schaffhausen	3445
39408	Altendorf	3446
39409	Arth	3446
39410	Buron	3446
39411	Einsiedeln	3446
39412	Feusisberg	3446
39413	Freienbach	3446
39414	Ingenbohl	3446
39415	Kussnacht	3446
39416	Lachen	3446
39417	Schubelbach	3446
39418	Schwyz	3446
39419	Wangen	3446
39420	Wollerau	3446
39421	Balsthal	3447
39422	Bellach	3447
39423	Bettlach	3447
39424	Biberist	3447
39425	Derendingen	3447
39426	Dornach	3447
39427	Dulliken	3447
39428	Feldbrunnen	3447
39429	Gerlafingen	3447
39430	Grenchen	3447
39431	Hagendorf	3447
39432	Olten	3447
39433	Schonenwerd	3447
39434	Solothurn	3447
39435	Trimbach	3447
39436	Wangen	3447
39437	Zuchwil	3447
39438	Aadorf	3448
39439	Amriswil	3448
39440	Arbon	3448
39441	Bischofszell	3448
39442	Felben-Wellhausen	3448
39443	Frauenfeld	3448
39444	Guttingen	3448
39445	Kreuzlingen	3448
39446	Romanshorn	3448
39447	Sirnach	3448
39448	Sulgen	3448
39449	Tagerwilen	3448
39450	Weinfelden	3448
39451	Ascona	3449
39452	Bellinzona	3449
39453	Biasca	3449
39454	Breganzona	3449
39455	Cadempino	3449
39456	Chiasso	3449
39457	Giubiasco	3449
39458	Locarno	3449
39459	Losone	3449
39460	Lugano	3449
39461	Massagno	3449
39462	Melide	3449
39463	Mendrisio	3449
39464	Mezzovico	3449
39465	Minusio	3449
39466	Porza	3449
39467	Pregassona	3449
39468	Viganello	3449
39469	Altdorf	3450
39470	Schattdorf	3450
39471	Bagnes	3451
39472	Brig-Glis	3451
39473	Collombey-Muraz	3451
39474	Conthey	3451
39475	Evionnaz	3451
39476	Fully	3451
39477	Martigny	3451
39478	Monthey	3451
39479	Naters	3451
39480	Nendaz	3451
39481	Niederwald	3451
39482	Saviese	3451
39483	Sierre	3451
39484	Sion	3451
39485	Visp	3451
39486	Vouvry	3451
39487	Zermatt	3451
39488	Aigle	3452
39489	Ballaigues	3452
39490	Bex	3452
39491	Blonay	3452
39492	Bussigny	3452
39493	Chavannes	3452
39494	Crissier	3452
39495	Ecublens	3452
39496	Epalinges	3452
39497	Gland	3452
39498	La Tour-de-Peilz	3452
39499	Lausanne	3452
39500	Le Mont-sur-Lausanne	3452
39501	Lucerne	3452
39502	Lutry	3452
39503	Montreux	3452
39504	Morges	3452
39505	Nyon	3452
39506	Ollon	3452
39507	Orbe	3452
39508	Payerne	3452
39509	Prilly	3452
39510	Puidoux	3452
39511	Pully	3452
39512	Renens	3452
39513	Romainmotier	3452
39514	Saint Sulpice	3452
39515	Vevey	3452
39516	Yverdon	3452
39517	Vauffelin	3453
39518	Baar	3454
39519	Cham	3454
39520	Hunenberg	3454
39521	Menzingen	3454
39522	Neuheim	3454
39523	Oberageri	3454
39524	Risch	3454
39525	Risch-Rotkreuz	3454
39526	Steinhausen	3454
39527	Unterageri	3454
39528	Zug	3454
39529	Adliswil	3455
39530	Affoltern	3455
39531	Bachenbulach	3455
39532	Bassersdorf	3455
39533	Birmensdorf	3455
39534	Bubikon	3455
39535	Bulach	3455
39536	Dielsdorf	3455
39537	Dietikon	3455
39538	Dietlikon	3455
39539	Dubendorf	3455
39540	Durnten	3455
39541	Ebmatingen	3455
39542	Egg	3455
39543	Embrach	3455
39544	Erlenbach	3455
39545	Fallanden	3455
39546	Fehraltdorf	3455
39547	Geroldswil	3455
39548	Gossau	3455
39549	Greifensee	3455
39550	Herrliberg	3455
39551	Hinwil	3455
39552	Hombrechtikon	3455
39553	Horgen	3455
39554	Illnau-Effretikon	3455
39555	Kilchberg	3455
39556	Kloten	3455
39557	Kusnacht	3455
39558	Langnau	3455
39559	Mannedorf	3455
39560	Maur	3455
39561	Meilen	3455
39562	Neftenbach	3455
39563	Niederhasli	3455
39564	Nurensdorf	3455
39565	Oberengstringen	3455
39566	Oberglatt	3455
39567	Oberrieden	3455
39568	Opfikon	3455
39569	Pfaffikon	3455
39570	Rafz	3455
39571	Regensdorf	3455
39572	Richterswil	3455
39573	Rumlang	3455
39574	Ruschlikon	3455
39575	Ruti	3455
39576	Schlieren	3455
39577	Schwerzenbach	3455
39578	Seuzach	3455
39579	Stafa	3455
39580	Thalwil	3455
39581	Uetikon	3455
39582	Urdorf	3455
39583	Uster	3455
39584	Volketswil	3455
39585	Wadenswil	3455
39586	Wald	3455
39587	Wallisellen	3455
39588	Wangen-Bruttisellen	3455
39589	Weiningen	3455
39590	Wetzikon	3455
39591	Winterthur	3455
39592	Zell	3455
39593	Zollikon	3455
39594	Zumikon	3455
39595	Zurich	3455
39596	Aleppo	3456
39597	Dara	3457
39598	Nawa	3457
39599	Abu Kamal	3458
39600	Dayr az-Zawr	3458
39601	al-Mayadin	3458
39602	Damascus	3459
39603	Darayya	3459
39604	Duma	3459
39605	Hajar Aswad	3459
39606	Harasta al-Bas	3459
39607	Jaramanah	3459
39608	Kabir-as-Sit	3459
39609	Kesweh	3459
39610	Qatana	3459
39611	Yabrud	3459
39612	al-Qutayfah	3459
39613	an-Nabk	3459
39614	at-Tall	3459
39615	az-Zabadani	3459
39616	Afrin	3460
39617	Ayn-al-Arab	3460
39618	Azaz	3460
39619	Halab	3460
39620	Manbij	3460
39621	al-Bab	3460
39622	as-Safirah	3460
39623	Hamah	3461
39624	Masyaf	3461
39625	Muhradah	3461
39626	Salamiyah	3461
39627	Hims	3462
39628	Homs	3462
39629	Tudmur	3462
39630	al-Qusayr	3462
39631	ar-Rastan	3462
39632	Ariha	3463
39633	Idlib	3463
39634	Jisr-ash-Shughur	3463
39635	Maarrat-an-Numan	3463
39636	Baniyas	3465
39637	Safita	3465
39638	Tartus	3465
39639	Ras-al-Ayn	3466
39640	al-Hasakah	3466
39641	al-Malikiyah	3466
39642	al-Qamishli	3466
39643	Jablah	3467
39644	Lattakia	3467
39645	al-Ladhiqiyah	3467
39646	al-Qunaytirah	3468
39647	ar-Raqqah	3469
39648	ath-Thawrah	3469
39649	as-Suwayda	3470
39650	Changhua City	3471
39651	Changhwa	3471
39652	Chihu	3471
39653	Erhlin	3471
39654	Hemei	3471
39655	Homei	3471
39656	Hua Tan Hsiang	3471
39657	Huatan Township	3471
39658	Lukang	3471
39659	Peitou	3471
39660	Puyen Hsiang	3471
39661	Tienchung	3471
39662	Yuanlin	3471
39663	Fenglin	3477
39664	Hualian	3477
39665	Yuli	3477
39666	Ilan	3478
39667	Lotung	3478
39668	Suao	3478
39669	Toucheng	3478
39670	Kincheng	3482
39671	Kinhsia	3482
39672	Kinhu	3482
39673	Cholan	3483
39674	Chunan	3483
39675	Houlung	3483
39676	Miaoli	3483
39677	Toufen	3483
39678	Tunghsiao	3483
39679	Yuanli	3483
39680	Zaociao	3483
39681	Chichi	3484
39682	Chushan	3484
39683	Nantou	3484
39684	Puli	3484
39685	Tsaotun	3484
39686	Makung	3486
39687	Chaochou	3487
39688	Hengchun	3487
39689	Pingtung	3487
39690	Tungkang	3487
39691	Dali	3488
39692	South District	3488
39693	Ta-Ya Shang	3488
39694	Dali	3489
39695	South District	3489
39696	Ta-Ya Shang	3489
39697	Dali	3490
39698	South District	3490
39699	Ta-Ya Shang	3490
39700	Kuanshan	3495
39701	Taitung	3495
39702	Chengkung	3496
39703	Chungli	3496
39704	Kuan Yin	3496
39705	Pate	3496
39706	Pingchen	3496
39707	Ta Yuan	3496
39708	Tachi	3496
39709	Taoyuan	3496
39710	Tungshih	3496
39711	Yangmei	3496
39712	Wujie	3497
39713	Hsilo	3499
39714	Huwei	3499
39715	Peikang	3499
39716	Touliu	3499
39717	Tounan	3499
39718	Tuku	3499
39719	Dushanbe	3500
39720	Khorug	3501
39721	Murgob	3501
39722	Garm	3502
39723	Hisor	3502
39724	Kofarnihon	3502
39725	Leninskiy	3502
39726	Rogun	3502
39727	Shakhrinau	3502
39728	Tursunzoda	3502
39729	Dangara	3503
39730	Farkhor	3503
39731	Jilikul	3503
39732	Khojamaston	3503
39733	Kolhozobod	3503
39734	Kulob	3503
39735	Kumsangir	3503
39736	Moskva	3503
39737	Muminobod	3503
39738	Nurak	3503
39739	Pyanj	3503
39740	Qurgonteppa	3503
39741	Sarband	3503
39742	Shaartuz	3503
39743	Sovetskiy	3503
39744	Vakhsh	3503
39745	Vose	3503
39746	Yovon	3503
39747	Adrasmon	3504
39748	Asht	3504
39749	Ayni	3504
39750	Buston	3504
39751	Chkalov	3504
39752	Chorku	3504
39753	Gafurov	3504
39754	Ganchi	3504
39755	Isfara	3504
39756	Khujand	3504
39757	Konibodom	3504
39758	Matcha	3504
39759	Nau	3504
39760	Panjakent	3504
39761	Proletarsk	3504
39762	Qayroqqum	3504
39763	Shurob	3504
39764	Taboshar	3504
39765	Uroteppa	3504
39766	Zafarobod	3504
39767	Arusha	3505
39768	Dodoma	3507
39769	Kondoa	3507
39770	Mpwapwa	3507
39771	Iringa	3508
39772	Njombe	3508
39773	Bukoba	3509
39774	Bwanga	3509
39775	Ngara	3509
39776	Kasulu	3510
39777	Kigoma	3510
39778	Uvinza	3510
39779	Moshi	3511
39780	Same	3511
39781	Kilwa Kivinje	3512
39782	Lindi	3512
39783	Nachingwea	3512
39784	Musoma	3513
39785	Tarime	3513
39786	Mbeya	3514
39787	Mwaya	3514
39788	Tukuyu	3514
39789	Kilosa	3515
39790	Mahenge	3515
39791	Morogoro	3515
39792	Masasi	3516
39793	Mikindani	3516
39794	Mtwara	3516
39795	Newala	3516
39796	Magu	3517
39797	Mwanza	3517
39798	Nansio	3517
39799	Sengerama	3517
39800	Bagamoyo	3518
39801	Kibaha	3518
39802	Rufiji	3518
39803	Utete	3518
39804	Mpanda	3519
39805	Sumbawanga	3519
39806	Songea	3520
39807	Tunduru	3520
39808	Kahama	3521
39809	Maswa	3521
39810	Mwadui	3521
39811	Old Shinyanga	3521
39812	Shinyanga	3521
39813	Manyoni	3522
39814	Singida	3522
39815	Bukene	3523
39816	Nzega	3523
39817	Tabora	3523
39818	Urambo	3523
39819	Korogwe	3524
39820	Muheza	3524
39821	Pangani	3524
39822	Tanga	3524
39823	Bangkhen	3528
39824	Bangkok	3528
39825	Phatumthanee	3528
39826	Bang Khla	3530
39827	Bang Pakong	3530
39828	Bangpakong	3530
39829	Chachoengsao	3530
39830	Phanom Sarakham	3530
39831	Plaeng Yao	3530
39832	Bamnet Narong	3532
39833	Chaiyaphum	3532
39834	Kaeng Khlo	3532
39835	Kaset Sombun	3532
39836	Phu Khieo	3532
39837	Chanthaburi	3534
39838	Khlung	3534
39839	Laem Sing	3534
39840	Soydow	3534
39841	Tha Mai	3534
39842	Chumphon	3538
39843	Lang Suan	3538
39844	Huai Mek	3539
39845	Kalasin	3539
39846	Kamalasai	3539
39847	Khao Wong	3539
39848	Kuchinarai	3539
39849	Nong Kung Si	3539
39850	Yang Talat	3539
39851	Bo Phloi	3541
39852	Kanchanaburi	3541
39853	Phanom Thuan	3541
39854	Tha Maka	3541
39855	Tha Muang	3541
39856	Ao Luk	3543
39857	Krabi	3543
39858	Lampang	3545
39859	Thoen	3545
39860	Lamphun	3546
39861	Mae Tha	3546
39862	Pa Sang	3546
39863	Loei	3547
39864	Phu Kra Dung	3547
39865	Wang Saphung	3547
39866	Mukdahan	3551
39867	Chiang Klang	3558
39868	Nan	3558
39869	Bacho	3559
39870	Narathiwat	3559
39871	Rangae	3559
39872	Sungai Kolok	3559
39873	Sungai Padi	3559
39874	Tak Bai	3559
39875	Bang Bo Thong	3562
39876	Bang Kruai	3562
39877	Bang Yai	3562
39878	Nonthaburi	3562
39879	Pak Kret	3562
39880	Sainoi	3562
39881	Nong Chik	3564
39882	Pattani	3564
39883	Sai Buri	3564
39884	Yaring	3564
39885	Phangnga	3565
39886	Phatthalung	3566
39887	Chiang Kham	3567
39888	Dok Kham Tai	3567
39889	Phayao	3567
39890	Pong	3567
39891	Chon Daen	3568
39892	Lom Sak	3568
39893	Nong Phai	3568
39894	Phetchabun	3568
39895	Wichian Buri	3568
39896	Ban Laem	3569
39897	Chaam	3569
39898	Khao Yoi	3569
39899	Phetchaburi	3569
39900	Tha Yang	3569
39901	Bang Mun Nak	3570
39902	Phichit	3570
39903	Taphan Hin	3570
39904	Thap Khlo	3570
39905	Bang Krathum	3571
39906	Bang Rakam	3571
39907	Nakhon Thai	3571
39908	Phitsanulok	3571
39909	Den Chai	3573
39910	Long	3573
39911	Phrae	3573
39912	Rong Kwang	3573
39913	Kathu	3574
39914	Phuket	3574
39915	Ranong	3577
39916	Ban Pong	3578
39917	Bang Phae	3578
39918	Chom Bung	3578
39919	Damnoen Saduak	3578
39920	Photharam	3578
39921	Ratchaburi	3578
39922	Ban Chang	3579
39923	Klaeng	3579
39924	Rayong	3579
39925	Ban Mo	3586
39926	Kaeng Khoi	3586
39927	Nong Khae	3586
39928	Phra Phutthabat	3586
39929	Saraburi	3586
39930	Satun	3587
39931	Hat Yai	3590
39932	Ranot	3590
39933	Sadao	3590
39934	Singha Nakhon	3590
39935	Songkhla	3590
39936	Khiri Mat	3591
39937	Sawankhalok	3591
39938	Si Satchanalai	3591
39939	Sukhothai	3591
39940	Phasat	3594
39941	Surin	3594
39942	Ban Tak	3595
39943	Mae Ramat	3595
39944	Mae Sot	3595
39945	Tak	3595
39946	Huai Yot	3596
39947	Kantang	3596
39948	Trang	3596
39949	Bo Rai	3597
39950	Trat	3597
39951	Laplae	3601
39952	Uttaradit	3601
39953	Betong	3602
39954	Yala	3602
39955	Yasothon	3603
39956	Guerin Kouka	3604
39957	Sokode	3604
39958	Sotouboua	3604
39959	Tchamba	3604
39960	Bafilo	3605
39961	Bassar	3605
39962	Kande	3605
39963	Kara	3605
39964	Kpagouda	3605
39965	Niamtougou	3605
39966	Agbelouve	3606
39967	Aneho	3606
39968	Lome	3606
39969	Tabligbo	3606
39970	Tsevie	3606
39971	Vogan	3606
39972	Amlame	3607
39973	Anie	3607
39974	Atakpame	3607
39975	Badou	3607
39976	Blitta	3607
39977	Kouve	3607
39978	Kpalime	3607
39979	Kpessi	3607
39980	Notse	3607
39981	Dapaong	3608
39982	Mango	3608
39983	Tandjouare	3608
39984	Atafu	3609
39985	Fakaofo	3610
39986	Nukunonu	3611
39987	Ohonua	3612
39988	Pangai	3613
39989	Hihifo	3614
39990	Haveloloto	3615
39991	Mua	3615
39992	Nukualofa	3615
39993	Tofoa-Koloua	3615
39994	Vaini	3615
39995	Neiafu	3616
39996	Arima	3617
39997	Arouca	3617
39998	Tacarigua	3617
39999	Tunapuna	3617
40000	Carapichaima	3618
40001	Claxton Bay	3618
40002	Chaguanas	3619
40003	Couva	3620
40004	Tabaquite	3620
40005	Glencoe	3622
40006	Siparia	3631
40007	Scarborough	3632
40008	Aryanah	3633
40009	Bordj Aalouine	3633
40010	Burj-al-Amri	3633
40011	La Soukra	3633
40012	Qalat-al-Andalus	3633
40013	Sidi Thabit	3633
40014	Taburbah	3633
40015	Wadi al-Layl	3633
40016	ad-Dandan	3633
40017	al-Battan	3633
40018	al-Jadidah	3633
40019	al-Murnaqiyah	3633
40020	at-Tadaman Dawwar Hishar	3633
40021	Bajah	3634
40022	Majaz-al-Bab	3634
40023	Nafzah	3634
40024	Quballat	3634
40025	Tabursuq	3634
40026	Tastur	3634
40027	Zahrat Madina	3634
40028	al-Maqulah	3634
40029	Awsajah	3636
40030	Binzart	3636
40031	Ghar-al-Milh	3636
40032	Manzil Abd-ar-Rahman	3636
40033	Manzil Bu Ruqaybah	3636
40034	Manzil Jamil	3636
40035	Matir	3636
40036	Rafraf	3636
40037	Ras-al-Jabal	3636
40038	Sajanan	3636
40039	Tinjah	3636
40040	al-Aliyah	3636
40041	al-Matlin	3636
40042	Ayn Darahim	3641
40043	Bani Matir	3641
40044	Bu Salim	3641
40045	Firnanah	3641
40046	Ghar-ad-Dima	3641
40047	Jundubah	3641
40048	Tabarqah	3641
40049	Wadi Maliz	3641
40050	Bani Khaddash	3642
40051	Bin Qirdan	3642
40052	Jarbah Ajim	3642
40053	Jarbah Hawmat-as-Suq	3642
40054	Jarbah Midun	3642
40055	Jarjis	3642
40056	Madaniyin	3642
40057	Manubah	3643
40058	Monastir	3644
40059	Azimur	3645
40060	Bani Hiyar	3645
40061	Bani Khallad	3645
40062	Bu Urqub	3645
40063	Dar Alush	3645
40064	Dar Shaban	3645
40065	Hammam-al-Aghzaz	3645
40066	Manzil Bu Zalafah	3645
40067	Manzil Hurr	3645
40068	Manzil Tamim	3645
40069	Nabul	3645
40070	Qalibiyah	3645
40071	Qurbah	3645
40072	Qurbus	3645
40073	Qurunbaliyah	3645
40074	Sulayman	3645
40075	Taklisah	3645
40076	Tazirkah	3645
40077	Zawiyat-al-Jadidi	3645
40078	al-Hammamat	3645
40079	al-Huwariyah	3645
40080	al-Mamurah	3645
40081	al-Middah	3645
40082	as-Samaah	3645
40083	Ghannush	3646
40084	Marath	3646
40085	Matmatat-al-Jadidah	3646
40086	Matmatat-al-Qadimah	3646
40087	Qabis	3646
40088	Sanini an-Nahal	3646
40089	Wadhraf	3646
40090	al-Hammah	3646
40091	al-Matwiyah	3646
40092	az-Zarat	3646
40093	Qafsah	3647
40094	Umm-al-Arais	3647
40095	al-Madilah	3647
40096	al-Mitlawi	3647
40097	al-Qasr	3647
40098	al-Qatar	3647
40099	ar-Rudayyif	3647
40100	as-Sanad	3647
40101	Duz	3648
40102	Jamnah	3648
40103	Qibili	3648
40104	Suq-al-Ahad	3648
40105	al-Qalah	3648
40106	Aqarib	3649
40107	Bir Ali Bin Khalifah	3649
40108	Jabinyanah	3649
40109	Manzil Shakir	3649
40110	Qarmadah	3649
40111	Qarqannah	3649
40112	Safaqis	3649
40113	Saqiyat-ad-Dair	3649
40114	Saqiyat-az-Zayt	3649
40115	Sfax	3649
40116	Tinah	3649
40117	al-Ayn	3649
40118	al-Hanashah	3649
40119	al-Mahras	3649
40120	as-Sukhayrah	3649
40121	ash-Shayhiyah	3649
40122	Sfax	3650
40123	Barqu	3652
40124	Bu Aradah	3652
40125	Bu Ruwis	3652
40126	Kasra	3652
40127	Makthar	3652
40128	Qaafur	3652
40129	Silyanah	3652
40130	al-Arusah	3652
40131	al-Karib	3652
40132	ar-Rawhiyah	3652
40133	Akkudah	3653
40134	Bu Fishah	3653
40135	Hammam Susah	3653
40136	Harqalah	3653
40137	Masakin	3653
40138	Qusaybat-ath-Thurayat	3653
40139	Sidi Bu Ali	3653
40140	Sidi al-Hani	3653
40141	Susah	3653
40142	Zawiyat Susah	3653
40143	al-Masadin	3653
40144	al-Qalat-al-Kabirah	3653
40145	al-Qalat-as-Saghirah	3653
40146	an-Nafidah	3653
40147	az-Zuhur	3653
40148	Bir-al-Ahmar	3654
40149	Dhahibah	3654
40150	Ghumrassin	3654
40151	Rimadah	3654
40152	Tatawin	3654
40153	Daqash	3655
40154	Hammat-al-Jarid	3655
40155	Naftah	3655
40156	Tamaghzah	3655
40157	Tawzar	3655
40158	Bardaw	3656
40159	Ben Arous	3656
40160	Carthage	3656
40161	Halq-al-Wadi	3656
40162	Megrine	3656
40163	Qartaj	3656
40164	Sidi Bu Said	3656
40165	Tunis	3656
40166	al-Marsa	3656
40167	Bir Mashariqah	3657
40168	Jabal-al-Wust	3657
40169	Zaghwan	3657
40170	al-Fahs	3657
40171	an-Nazur	3657
40172	az-Zaribah	3657
40173	Manzil Salim	3658
40174	Nibbar	3658
40175	Qalat-as-Sanan	3658
40176	Saqiyat Sidi Yussuf	3658
40177	Tajarwin	3658
40178	ad-Dahmani	3658
40179	al-Jarissah	3658
40180	al-Kaf	3658
40181	al-Qalat-al-Khasba	3658
40182	al-Qusur	3658
40183	as-Sars	3658
40184	at-Tawiraf	3658
40185	Awlad ash-Shamakh	3659
40186	Bumirdas	3659
40187	Habirah	3659
40188	Karkar	3659
40189	Mallulash	3659
40190	Qusur-as-Saf	3659
40191	Rajish	3659
40192	Shurban	3659
40193	Sidi Ulwan	3659
40194	al-Baradiah	3659
40195	al-Jamm	3659
40196	al-Mahdiyah	3659
40197	as-Sawasi	3659
40198	ash-Shabbah	3659
40199	Amirat-al-Fahul	3660
40200	Amirat-al-Hajjaj	3660
40201	Amirat-at-Tawazarah	3660
40202	Banan Budar	3660
40203	Banblat wal-Manarah	3660
40204	Bani Hassan	3660
40205	Bu Hajjar	3660
40206	Ghanadah	3660
40207	Jammal	3660
40208	Khunays	3660
40209	Lamtah	3660
40210	Manzil Farsi	3660
40211	Manzil Hayah	3660
40212	Manzil Kamil	3660
40213	Manzil Nur	3660
40214	Qasr Hallal	3660
40215	Qusaybat-al-Madyuni	3660
40216	Sahilin Maatmar	3660
40217	Sayyadah	3660
40218	Sidi Amara	3660
40219	Sidi Bin Nur	3660
40220	Tabulbah	3660
40221	Tuzah	3660
40222	Zaramidin	3660
40223	Zawiyat Quntash	3660
40224	al-Baqalitah	3660
40225	al-Masdur	3660
40226	al-Muknin	3660
40227	al-Munastir	3660
40228	al-Wardanin	3660
40229	ash-Sharahil	3660
40230	Firyanah	3661
40231	Fussanah	3661
40232	Haydrah	3661
40233	Jadliyan	3661
40234	Majal Bal Abbas	3661
40235	Sabibah	3661
40236	Subaytilah	3661
40237	Talabat	3661
40238	Talah	3661
40239	al-Qasrayn	3661
40240	Ayn Jalulah	3662
40241	Buhajlah	3662
40242	Haffuz	3662
40243	Hajib-al-Ayun	3662
40244	Manzil Mahidi	3662
40245	Nasr Allah	3662
40246	al-Ala	3662
40247	al-Qayrawan	3662
40248	al-Waslatiyah	3662
40249	as-Subaykhah	3662
40250	ash-Shabikah	3662
40251	ash-Sharardah	3662
40252	Adana	3663
40253	Aladag	3663
40254	Ceyhan	3663
40255	Feke	3663
40256	Imamoglu	3663
40257	Karaisali	3663
40258	Karatas	3663
40259	Kozan	3663
40260	Pozanti	3663
40261	Saimbeyli	3663
40262	Tufanbeyli	3663
40263	Yumurtalik	3663
40264	Adiyaman	3664
40265	Besni	3664
40266	Celikhan	3664
40267	Gerger	3664
40268	Golbasi	3664
40269	Kahta	3664
40270	Samsat	3664
40271	Sincik	3664
40272	Tut	3664
40273	Afyonkarahisar	3665
40274	Basmakci	3665
40275	Bayat	3665
40276	Bolvadin	3665
40277	Cay	3665
40278	Dazkiri	3665
40279	Dinar	3665
40280	Emirdag	3665
40281	Evciler	3665
40282	Hocalar	3665
40283	Ihsaniye	3665
40284	Iscehisar	3665
40285	Kiziloren	3665
40286	Sandikli	3665
40287	Sincanli	3665
40288	Suhut	3665
40289	Sultandagi	3665
40290	Diyadin	3666
40291	Dogubeyazit	3666
40292	Eleskirt	3666
40293	Hamur	3666
40294	Karakose	3666
40295	Patnos	3666
40296	Taslicay	3666
40297	Tutak	3666
40298	Agacoren	3667
40299	Aksaray	3667
40300	Eskil	3667
40301	Gulagac	3667
40302	Guzelyurt	3667
40303	Ortakoy	3667
40304	Sariyahsi	3667
40305	Amasya	3668
40306	Goynucek	3668
40307	Gumushacikoy	3668
40308	Hamamozu	3668
40309	Merzifon	3668
40310	Suluova	3668
40311	Tasova	3668
40312	Akyurt	3669
40313	Ankara	3669
40314	Ayas	3669
40315	Beypazari	3669
40316	Camlidere	3669
40317	Cubuk	3669
40318	Elmadag	3669
40319	Evren	3669
40320	Gudul	3669
40321	Haymana	3669
40322	Kalecik	3669
40323	Kazan	3669
40324	Kizilcahamam	3669
40325	Nallihan	3669
40326	Polatli	3669
40327	Sereflikochisar	3669
40328	Yenisehir	3669
40329	Akseki	3670
40330	Alanya	3670
40331	Antalya	3670
40332	Elmali	3670
40333	Finike	3670
40334	Gazipasa	3670
40335	Gundogmus	3670
40336	Ibradi	3670
40337	Kale	3670
40338	Kas	3670
40339	Kemer	3670
40340	Konya	3670
40341	Korkuteli	3670
40342	Kumluca	3670
40343	Manavgat	3670
40344	Serik	3670
40345	Ardahan	3671
40346	Damal	3671
40347	Gole	3671
40348	Hanak	3671
40349	Posof	3671
40350	Ardanuc	3672
40351	Arhavi	3672
40352	Artvin	3672
40353	Borcka	3672
40354	Hopa	3672
40355	Murgul	3672
40356	Savsat	3672
40357	Yusufeli	3672
40358	Aydin	3673
40359	Bozdogan	3673
40360	Buharkent	3673
40361	Cine	3673
40362	Didim	3673
40363	Germencik	3673
40364	Incirliova	3673
40365	Karacasu	3673
40366	Karpuzlu	3673
40367	Kocarli	3673
40368	Kosk	3673
40369	Kusadasi	3673
40370	Kuyucak	3673
40371	Nazilli	3673
40372	Soke	3673
40373	Sultanhisar	3673
40374	Yenipazar	3673
40375	Ayvalik	3674
40376	Balikesir	3674
40377	Balya	3674
40378	Bandirma	3674
40379	Bigadic	3674
40380	Burhaniye	3674
40381	Dursunbey	3674
40382	Edremit	3674
40383	Erdek	3674
40384	Gomec	3674
40385	Gonen	3674
40386	Havran	3674
40387	Ivrindi	3674
40388	Kepsut	3674
40389	Manyas	3674
40390	Marmara	3674
40391	Sakarya	3674
40392	Savastepe	3674
40393	Sindirgi	3674
40394	Susurluk	3674
40395	Amasra	3675
40396	Bartin	3675
40397	Kurucasile	3675
40398	Ulus	3675
40399	Batman	3676
40400	Besiri	3676
40401	Gercus	3676
40402	Hasankeyf	3676
40403	Kozluk	3676
40404	Sason	3676
40405	Aydintepe	3677
40406	Bayburt	3677
40407	Demirozu	3677
40408	Bilecik	3678
40409	Bozuyuk	3678
40410	Golpazari	3678
40411	Inhisar	3678
40412	Osmaneli	3678
40413	Pazaryeri	3678
40414	Sogut	3678
40415	Yenipazar	3678
40416	Adakli	3679
40417	Bingol	3679
40418	Genc	3679
40419	Karliova	3679
40420	Kigi	3679
40421	Solhan	3679
40422	Yayladere	3679
40423	Yedisu	3679
40424	Adilcevaz	3680
40425	Ahlat	3680
40426	Bitlis	3680
40427	Guroymak	3680
40428	Hizan	3680
40429	Mutki	3680
40430	Tatvan	3680
40431	Akcakoca	3681
40432	Bolu	3681
40433	Dortdivan	3681
40434	Gerede	3681
40435	Goynuk	3681
40436	Kibriscik	3681
40437	Mengen	3681
40438	Mudurnu	3681
40439	Seben	3681
40440	Yenicaga	3681
40441	Aglasun	3682
40442	Altinyayla	3682
40443	Bucak	3682
40444	Burdur	3682
40445	Golhisar	3682
40446	Karamanli	3682
40447	Kemer	3682
40448	Tefenni	3682
40449	Yesilova	3682
40450	Bursa	3683
40451	Buyukorhan	3683
40452	Gemlik	3683
40453	Gursu	3683
40454	Harmancik	3683
40455	Inegol	3683
40456	Iznik	3683
40457	Karacabey	3683
40458	Keles	3683
40459	Kestel	3683
40460	Mudanya	3683
40461	Mustafakemalpasa	3683
40462	Orhaneli	3683
40463	Orhangazi	3683
40464	Yenisehir	3683
40465	Ayvacik	3684
40466	Bayramic	3684
40467	Biga	3684
40468	Bozcaada	3684
40469	Can	3684
40470	Canakkale	3684
40471	Eceabat	3684
40472	Ezine	3684
40473	Gelibolu	3684
40474	Gokceada	3684
40475	Lapseki	3684
40476	Yenice	3684
40477	Atkaracalar	3685
40478	Bayramoren	3685
40479	Cankiri	3685
40480	Cerkes	3685
40481	Eldivan	3685
40482	Ilgaz	3685
40483	Kizilirmak	3685
40484	Korgun	3685
40485	Kursunlu	3685
40486	Orta	3685
40487	Sabanozu	3685
40488	Yaprakli	3685
40489	Alaca	3686
40490	Bayat	3686
40491	Corum	3686
40492	Dodurga	3686
40493	Iskilip	3686
40494	Kargi	3686
40495	Lacin	3686
40496	Mecitozu	3686
40497	Oguzlar	3686
40498	Ortakoy	3686
40499	Osmancik	3686
40500	Sungurlu	3686
40501	Ugurludag	3686
40502	Acipayam	3687
40503	Akkoy	3687
40504	Babadag	3687
40505	Baklan	3687
40506	Bekilli	3687
40507	Bozkurt	3687
40508	Buldan	3687
40509	Cardak	3687
40510	Civril	3687
40511	Denizli	3687
40512	Guney	3687
40513	Honaz	3687
40514	Kale	3687
40515	Saraykoy	3687
40516	Serinhisar	3687
40517	Tavas	3687
40518	Bismil	3688
40519	Cermik	3688
40520	Cinar	3688
40521	Cungus	3688
40522	Dicle	3688
40523	Diyarbakir	3688
40524	Egil	3688
40525	Ergani	3688
40526	Hani	3688
40527	Hazro	3688
40528	Kocakoy	3688
40529	Kulp	3688
40530	Lice	3688
40531	Silvan	3688
40532	Cumayeri	3689
40533	Duzce	3689
40534	Golyaka	3689
40535	Gumusova	3689
40536	Kaynasli	3689
40537	Yigilca	3689
40538	Edirne	3690
40539	Enez	3690
40540	Havsa	3690
40541	Ipsala	3690
40542	Kesan	3690
40543	Lalapasa	3690
40544	Meric	3690
40545	Suleoglu	3690
40546	Uzunkopru	3690
40547	Agin	3691
40548	Alacakaya	3691
40549	Aricak	3691
40550	Baskil	3691
40551	Elazig	3691
40552	Karakocan	3691
40553	Keban	3691
40554	Kovancilar	3691
40555	Maden	3691
40556	Palu	3691
40557	Sivrice	3691
40558	Erzincan	3692
40559	Ilic	3692
40560	Kemah	3692
40561	Kemaliye	3692
40562	Otlukbeli	3692
40563	Refahiye	3692
40564	Tercan	3692
40565	Uzumlu	3692
40566	Askale	3693
40567	Erzurum	3693
40568	Hinis	3693
40569	Horasan	3693
40570	Ilica	3693
40571	Ispir	3693
40572	Karacoban	3693
40573	Karayazi	3693
40574	Koprukoy	3693
40575	Narman	3693
40576	Oltu	3693
40577	Olur	3693
40578	Pasinler	3693
40579	Pazaryolu	3693
40580	Senkaya	3693
40581	Tekman	3693
40582	Tortum	3693
40583	Uzundere	3693
40584	Alpu	3694
40585	Beylikova	3694
40586	Cifteler	3694
40587	Eskisehir	3694
40588	Gunyuzu	3694
40589	Han	3694
40590	Inonu	3694
40591	Mahmudiye	3694
40592	Mihalgazi	3694
40593	Mihaliccik	3694
40594	Saricakaya	3694
40595	Seyitgazi	3694
40596	Sivrihisar	3694
40597	Araban	3695
40598	Gaziantep	3695
40599	Islahiye	3695
40600	Karkamis	3695
40601	Nizip	3695
40602	Nurdagi	3695
40603	Oguzeli	3695
40604	Sehitkamil	3695
40605	Yavuzeli	3695
40606	Aluca	3696
40607	Bulancak	3696
40608	Dereli	3696
40609	Dogankent	3696
40610	Espiye	3696
40611	Eynesil	3696
40612	Giresun	3696
40613	Gorele	3696
40614	Guce	3696
40615	Kesap	3696
40616	Piraziz	3696
40617	Sebinkarahisar	3696
40618	Tirebolu	3696
40619	Yaglidere	3696
40620	Gumushane	3697
40621	Kelkit	3697
40622	Kose	3697
40623	Kurtun	3697
40624	Siran	3697
40625	Torul	3697
40626	Cukurca	3698
40627	Hakkari	3698
40628	Semdinli	3698
40629	Yuksekova	3698
40630	Altinozu	3699
40631	Antakya	3699
40632	Belen	3699
40633	Dortyol	3699
40634	Erzin	3699
40635	Hassa	3699
40636	Iskenderun	3699
40637	Kirikhan	3699
40638	Kumlu	3699
40639	Reyhanli	3699
40640	Samandag	3699
40641	Yayladagi	3699
40642	Anamur	3700
40643	Aydincik	3700
40644	Bozyazi	3700
40645	Erdemli	3700
40646	Gulnar	3700
40647	Mersin	3700
40648	Mut	3700
40649	Silifke	3700
40650	Tarsus	3700
40651	Aralik	3701
40652	Igdir	3701
40653	Karakoyunlu	3701
40654	Tuzluca	3701
40655	Aksu	3702
40656	Atabey	3702
40657	Egirdir	3702
40658	Gelendost	3702
40659	Gonen	3702
40660	Isparta	3702
40661	Keciborlu	3702
40662	Sarkikaraagac	3702
40663	Senirkent	3702
40664	Sutculer	3702
40665	Uluborlu	3702
40666	Yalvac	3702
40667	Yenisarbademli	3702
40668	Buyukcekmece	3703
40669	Catalca	3703
40670	Eminonu	3703
40671	Esenler	3703
40672	Istanbul	3703
40673	KadÃ„Â±koy	3703
40674	Sile	3703
40675	Silivri	3703
40676	Sultanbeyli	3703
40677	TopkapÃ„Â±	3703
40678	Tuzla	3703
40679	Umraniye	3703
40680	Aliaga	3704
40681	Alsancak	3704
40682	Bayindir	3704
40683	Bergama	3704
40684	Beyagac	3704
40685	Bornova	3704
40686	Cesme	3704
40687	Digor	3704
40688	Dikili	3704
40689	Foca	3704
40690	Izmir	3704
40691	Karaburun	3704
40692	Kemalpasa	3704
40693	Kinik	3704
40694	Kiraz	3704
40695	Menderes	3704
40696	Menemen	3704
40697	Merkezi	3704
40698	Mersinli	3704
40699	Odemis	3704
40700	Seferihisar	3704
40701	Selcuk	3704
40702	Tire	3704
40703	Torbali	3704
40704	Urla	3704
40705	Afsin	3705
40706	Andirin	3705
40707	Caglayancerit	3705
40708	Ekinozu	3705
40709	Elbistan	3705
40710	Goksun	3705
40711	Kahramanmaras	3705
40712	Nurhak	3705
40713	Pazarcik	3705
40714	Turkoglu	3705
40715	Eflani	3706
40716	Eskipazar	3706
40717	Karabuk	3706
40718	Ovacik	3706
40719	Safranbolu	3706
40720	Yenice	3706
40721	Ayranci	3707
40722	Basyayla	3707
40723	Ermenek	3707
40724	Karaman	3707
40725	Kazimkarabekir	3707
40726	Sariveliler	3707
40727	Akyaka	3708
40728	Arpacay	3708
40729	Kagizman	3708
40730	Kars	3708
40731	Sarikamis	3708
40732	Selim	3708
40733	Susuz	3708
40734	Karsiyaka	3709
40735	Abana	3710
40736	Agli	3710
40737	Arac	3710
40738	Azdavay	3710
40739	Bozkurt	3710
40740	Daday	3710
40741	Devrekani	3710
40742	Doganyurt	3710
40743	Hanonu	3710
40744	Ihsangazi	3710
40745	Inebolu	3710
40746	Kastamonu	3710
40747	Kure	3710
40748	Pinarbasi	3710
40749	Senpazar	3710
40750	Seydiler	3710
40751	Taskopru	3710
40752	Tosya	3710
40753	Akkisla	3711
40754	Bunyan	3711
40755	Develi	3711
40756	Felahiye	3711
40757	Hacilar	3711
40758	Incesu	3711
40759	Kayseri	3711
40760	Ozvatan	3711
40761	Pinarbasi	3711
40762	Sarioglan	3711
40763	Sariz	3711
40764	Talas	3711
40765	Tomarza	3711
40766	Yahyali	3711
40767	Yesilhisar	3711
40768	Elbeyli	3712
40769	Kilis	3712
40770	Musabeyli	3712
40771	Polateli	3712
40772	Bahsili	3713
40773	Baliseyh	3713
40774	Delice	3713
40775	Karakecili	3713
40776	Keskin	3713
40777	Kirikkale	3713
40778	Sulakyurt	3713
40779	Yahsihan	3713
40780	Babaeski	3714
40781	Demirkoy	3714
40782	Kirklareli	3714
40783	Kofcaz	3714
40784	Kumkoy	3714
40785	Luleburgaz	3714
40786	Pehlivankoy	3714
40787	Pinarhisar	3714
40788	Vize	3714
40789	Akcakent	3715
40790	Akpinar	3715
40791	Boztepe	3715
40792	Kaman	3715
40793	Kirsehir	3715
40794	Mucur	3715
40795	CayÃ„Â±rova	3716
40796	Derince	3716
40797	DilovasÃ„Â±	3716
40798	Gebze	3716
40799	Golcuk	3716
40800	Izmit	3716
40801	Kandira	3716
40802	Karamursel	3716
40803	Kocaeli	3716
40804	Korfez	3716
40805	Ahirli	3717
40806	Akoren	3717
40807	Aksehir	3717
40808	Altinekin	3717
40809	Beysehir	3717
40810	Bozkir	3717
40811	Cihanbeyli	3717
40812	Cumra	3717
40813	Derbent	3717
40814	Derebucak	3717
40815	Doganhisar	3717
40816	Emirgazi	3717
40817	Eregli	3717
40818	Guneysinir	3717
40819	Hadim	3717
40820	Halkapinar	3717
40821	Huyuk	3717
40822	Ilgin	3717
40823	Kadinhani	3717
40824	Karapinar	3717
40825	Konya	3717
40826	Kulu	3717
40827	Sarayonu	3717
40828	Seydisehir	3717
40829	Taskent	3717
40830	Tuzlukcu	3717
40831	Yalihuyuk	3717
40832	Yunak	3717
40833	Altinas	3718
40834	Aslanapa	3718
40835	Domanic	3718
40836	Dumlupinar	3718
40837	Emet	3718
40838	Gediz	3718
40839	Kutahya	3718
40840	Pazarlar	3718
40841	Saphane	3718
40842	Simav	3718
40843	Tavsanli	3718
40844	Lefkosa	3719
40845	Akcadag	3720
40846	Arapkir	3720
40847	Arguvan	3720
40848	Battalgazi	3720
40849	Darende	3720
40850	Dogansehir	3720
40851	Doganyol	3720
40852	Hekimhan	3720
40853	Kale	3720
40854	Kuluncak	3720
40855	Malatya	3720
40856	Poturge	3720
40857	Yazihan	3720
40858	Yesilyurt	3720
40859	Ahmetli	3721
40860	Akhisar	3721
40861	Alasehir	3721
40862	Demirci	3721
40863	Golmarmara	3721
40864	Gordes	3721
40865	Kirkagac	3721
40866	Koprubasi	3721
40867	Kula	3721
40868	Manisa	3721
40869	Salihli	3721
40870	Sarigol	3721
40871	Saruhanli	3721
40872	Selendi	3721
40873	Soma	3721
40874	Turgutlu	3721
40875	Dargecit	3722
40876	Derik	3722
40877	Kiziltepe	3722
40878	Mardin	3722
40879	Mazidagi	3722
40880	Midyat	3722
40881	Nusaybin	3722
40882	Omerli	3722
40883	Savur	3722
40884	Yesilli	3722
40885	Bodrum	3723
40886	Dalaman	3723
40887	Datca	3723
40888	Fethiye	3723
40889	Kavaklidere	3723
40890	Koycegiz	3723
40891	Marmaris	3723
40892	Milas	3723
40893	Mugla	3723
40894	Ortaca	3723
40895	Ula	3723
40896	Yatagan	3723
40897	Bulanik	3724
40898	Haskoy	3724
40899	Korkut	3724
40900	Malazgirt	3724
40901	Mus	3724
40902	Varto	3724
40903	Acigol	3725
40904	Avanos	3725
40905	Derinkuyu	3725
40906	Gulsehir	3725
40907	Hacibektas	3725
40908	Kozakli	3725
40909	Nevsehir	3725
40910	Urgup	3725
40911	Altunhisar	3726
40912	Bor	3726
40913	Nigde	3726
40914	Ulukisla	3726
40915	Akkus	3727
40916	Aybasti	3727
40917	Camas	3727
40918	Fatsa	3727
40919	Golkoy	3727
40920	Gulyali	3727
40921	Gurgentepe	3727
40922	Ikizce	3727
40923	Kabaduz	3727
40924	Kabatas	3727
40925	Korgan	3727
40926	Kumru	3727
40927	Mesudiye	3727
40928	Ordu	3727
40929	Persembe	3727
40930	Ulubey	3727
40931	Unye	3727
40932	Bahce	3728
40933	Duzici	3728
40934	Hasanbeyli	3728
40935	Kadirli	3728
40936	Osmaniye	3728
40937	Sumbas	3728
40938	Toprakkale	3728
40939	Ardesen	3729
40940	Cayeli	3729
40941	Derepazan	3729
40942	Findikli	3729
40943	Guneysu	3729
40944	Hemsin	3729
40945	Ikizdere	3729
40946	Iyidere	3729
40947	Kalkandere	3729
40948	Pazar	3729
40949	Rize	3729
40950	Adapazari	3730
40951	Akyazi	3730
40952	Ferizli	3730
40953	Geyve	3730
40954	Hendek	3730
40955	Karapurcek	3730
40956	Karasu	3730
40957	Kaynarca	3730
40958	Kocaali	3730
40959	Pamukova	3730
40960	Sapanca	3730
40961	Sogutlu	3730
40962	Tarakli	3730
40963	Akcakale	3731
40964	Alacam	3731
40965	Asarcik	3731
40966	Ayvacik	3731
40967	Bafra	3731
40968	Carsamba	3731
40969	Havza	3731
40970	Kavak	3731
40971	Ladik	3731
40972	Mayis 19	3731
40973	Salipazan	3731
40974	Samsun	3731
40975	Tekkekoy	3731
40976	Terme	3731
40977	Vezirkopru	3731
40978	Yakakent	3731
40979	Birecik	3732
40980	Bozova	3732
40981	Ceylanpinar	3732
40982	Halfeti	3732
40983	Harran	3732
40984	Hilvan	3732
40985	Sanliurfa	3732
40986	Siverek	3732
40987	Suruc	3732
40988	Urfa	3732
40989	Viransehir	3732
40990	Aydinlar	3733
40991	Baykan	3733
40992	Eruh	3733
40993	Kurtalan	3733
40994	Pervari	3733
40995	Siirt	3733
40996	Sirvan	3733
40997	Ayancik	3734
40998	Boyabat	3734
40999	Dikmen	3734
41000	Duragan	3734
41001	Erfelek	3734
41002	Gerze	3734
41003	Sarayduzu	3734
41004	Sinop	3734
41005	Turkeli	3734
41006	Beytussebap	3735
41007	Cizre	3735
41008	Guclukonak	3735
41009	Idil	3735
41010	Silopi	3735
41011	Sirnak	3735
41012	Uludere	3735
41013	Akincilar	3736
41014	Altinyayla	3736
41015	Divrigi	3736
41016	Dogansar	3736
41017	Gemerek	3736
41018	Golova	3736
41019	Gurun	3736
41020	Hafik	3736
41021	Imranli	3736
41022	Kangal	3736
41023	Koyulhisar	3736
41024	Sarkisla	3736
41025	Sivas	3736
41026	Susehri	3736
41027	Ulas	3736
41028	Yildizeli	3736
41029	Zara	3736
41030	Cerkezkoy	3737
41031	Corlu	3737
41032	Hayrabolu	3737
41033	Malkara	3737
41034	Marmaraereglisi	3737
41035	Muratli	3737
41036	Saray	3737
41037	Sarkoy	3737
41038	Tekirdag	3737
41039	Almus	3738
41040	Artova	3738
41041	Basciftlik	3738
41042	Erbaa	3738
41043	Niksar	3738
41044	Pazar	3738
41045	Resadiye	3738
41046	Sulusaray	3738
41047	Tokat	3738
41048	Turhal	3738
41049	Yesilyurt	3738
41050	Zile	3738
41051	Akcaabat	3739
41052	Arakli	3739
41053	Arsin	3739
41054	Besikduzu	3739
41055	Caykara	3739
41056	Dernekpazari	3739
41057	Duzkoy	3739
41058	Hayrat	3739
41059	Koprubasi	3739
41060	Macka	3739
41061	Of	3739
41062	Salpazari	3739
41063	Surmene	3739
41064	Tonya	3739
41065	Trabzon	3739
41066	Vakfikebir	3739
41067	Yomra	3739
41068	Hozat	3740
41069	Mazgirt	3740
41070	Nazimiye	3740
41071	Ovacik	3740
41072	Pertek	3740
41073	Pulumur	3740
41074	Tunceli	3740
41075	Banaz	3741
41076	Esme	3741
41077	Karahalli	3741
41078	Sivasli	3741
41079	Ulubey	3741
41080	Usak	3741
41081	Bahcesaray	3742
41082	Baskale	3742
41083	Caldiran	3742
41084	Edremit	3742
41085	Ercis	3742
41086	Gevas	3742
41087	Gurpinar	3742
41088	Muradiye	3742
41089	Ozalp	3742
41090	Saray	3742
41091	Van	3742
41092	Altinova	3743
41093	Armutlu	3743
41094	Ciftlikkoy	3743
41095	Cinarcik	3743
41096	Termal	3743
41097	Yalova	3743
41098	Akdagmadeni	3744
41099	Aydincik	3744
41100	Bogaziliyan	3744
41101	Candir	3744
41102	Cayiralan	3744
41103	Cekerek	3744
41104	Kadisehri	3744
41105	Saraykent	3744
41106	Sarikaya	3744
41107	Sefaatli	3744
41108	Sorgun	3744
41109	Yenifakili	3744
41110	Yerkoy	3744
41111	Yozgat	3744
41112	Alapli	3745
41113	Caycuma	3745
41114	Devrek	3745
41115	Eregli	3745
41116	Gokcebey	3745
41117	Zonguldak	3745
41118	Ahchadepe	3746
41119	Annau	3746
41120	Babadayhan	3746
41121	Baherden	3746
41122	Birleshik Pervi	3746
41123	Buzmeyin	3746
41124	Dushak	3746
41125	Gokedepe	3746
41126	Kaka	3746
41127	Miana	3746
41128	Ovaz Jalatay	3746
41129	Saragt	3746
41130	Tecen	3746
41131	Asgabat	3747
41132	Adyndaky	3748
41133	Balkanabat	3748
41134	Bekdash	3748
41135	Gasanguli	3748
41136	Gazanjyk	3748
41137	Goturdepe	3748
41138	Gumdag	3748
41139	Jebel	3748
41140	Karakala	3748
41141	Khazar	3748
41142	Serdar	3748
41143	Sharlawuk	3748
41144	Turkmenbasi	3748
41145	Akdepe	3749
41146	Boldumsaz	3749
41147	Dasoguz	3749
41148	Gubadag	3749
41149	Kohne Urgenc	3749
41150	Moskva	3749
41151	Tagta	3749
41152	Yilanli	3749
41153	Darganata	3750
41154	Esenmengli	3750
41155	Farap	3750
41156	Gazojak	3750
41157	Govurdak	3750
41158	Halac	3750
41159	Kerki	3750
41160	Komsomolsk	3750
41161	Mukri	3750
41162	Sayat	3750
41163	Seydi	3750
41164	Turkmenabat	3750
41165	Bayramali	3751
41166	Eloten	3751
41167	Mari	3751
41168	Murgab	3751
41169	Sakarchage	3751
41170	Tagtabazar	3751
41171	Turkmengala	3751
41172	Vaiaku	3754
41173	Tonga	3755
41174	Lolua	3756
41175	Kua	3757
41176	Tanrake	3758
41177	Savave	3759
41178	Fangaua	3760
41179	Asau	3761
41180	Bombo	3762
41181	Bweyogerere	3762
41182	Entebbe	3762
41183	Jinja-Kawempe	3762
41184	Kajansi	3762
41185	Kalangala	3762
41186	Kampala	3762
41187	Kayunga	3762
41188	Kiboga	3762
41189	Kireka	3762
41190	Kyotera	3762
41191	Lugazi	3762
41192	Lukaya	3762
41193	Luwero	3762
41194	Lyantonde	3762
41195	Masaka	3762
41196	Mityana	3762
41197	Mpigi	3762
41198	Mubende	3762
41199	Mukono	3762
41200	Nakasongola	3762
41201	Namasuba	3762
41202	Njeru	3762
41203	Nkonkonjeru	3762
41204	Rakai	3762
41205	Sembabule	3762
41206	Wakiso	3762
41207	Wobulenzi	3762
41208	Bugembe	3763
41209	Bugiri	3763
41210	Busembatia	3763
41211	Busia	3763
41212	Buwenge	3763
41213	Iganga	3763
41214	Jinja	3763
41215	Kaberamaido	3763
41216	Kamuli	3763
41217	Kapchorwa	3763
41218	Katakwi	3763
41219	Kumi	3763
41220	Malaba	3763
41221	Mayuge	3763
41222	Mbale	3763
41223	Ngora	3763
41224	Pallisa	3763
41225	Sironko	3763
41226	Soroti	3763
41227	Tororo	3763
41228	Adjumani	3764
41229	Amudat	3764
41230	Apac	3764
41231	Arua	3764
41232	Gulu	3764
41233	Kaabong	3764
41234	Kitgum	3764
41235	Koboko	3764
41236	Kotido	3764
41237	Lira	3764
41238	Moroto	3764
41239	Moyo	3764
41240	Nakapiripirit	3764
41241	Nebbi	3764
41242	Pader	3764
41243	Paidha	3764
41244	Pakwach	3764
41245	Yumbe	3764
41246	Bundibugyo	3765
41247	Bushenyi	3765
41248	Fort Portal	3765
41249	Hima	3765
41250	Hoima	3765
41251	Ibanda	3765
41252	Kabale	3765
41253	Kabwohe-Itendero	3765
41254	Kagadi	3765
41255	Kamwenge	3765
41256	Kanungu	3765
41257	Kasese	3765
41258	Katwe	3765
41259	Kibaale	3765
41260	Kigorobya	3765
41261	Kilembe	3765
41262	Kisoro	3765
41263	Kyenjojo	3765
41264	Masindi	3765
41265	Masindi-Port	3765
41266	Mbarara	3765
41267	Muhororo	3765
41268	Ntungamo	3765
41269	Rukungiri	3765
41270	Cherkasy	3766
41271	Smila	3766
41272	Uman	3766
41273	Chernihiv	3767
41274	Nizhyn	3767
41275	Pryluky	3767
41276	Chernivtsi	3768
41277	Alushta	3769
41278	Sevastopol	3769
41279	Dneprodzerzhinsk	3770
41280	Dnipropetrovsk	3770
41281	Kryvyy Rih	3770
41282	Marhanets	3770
41283	Nikopol	3770
41284	Novomoskovsk	3770
41285	Pavlohrad	3770
41286	Plekhanov	3770
41287	Zhovti Vody	3770
41288	Artemivsk	3771
41289	Donetsk	3771
41290	Donetsk	3771
41291	Druzhkivka	3771
41292	Dymytrov	3771
41293	Dzerzhynsk	3771
41294	Horlivka	3771
41295	Khartsyzk	3771
41296	Kostyantynivka	3771
41297	Kramatorsk	3771
41298	Krasnoarmiysk	3771
41299	Makiyivka	3771
41300	Mariupol	3771
41301	Shakhtarsk	3771
41302	Slovyansk	3771
41303	Snizhne	3771
41304	Torez	3771
41305	Yenakiyeve	3771
41306	Ivano-Frankivsk	3772
41307	Kalush	3772
41308	Kolomyya	3772
41309	Izyum	3773
41310	Kharkiv	3773
41311	Lozova	3773
41312	Volchansk	3774
41313	Kherson	3775
41314	Nova Kakhovka	3775
41315	Geologov	3776
41316	Kamyanets-Podilskyy	3776
41317	Khmelnytskyy	3776
41318	Shepetivka	3776
41319	khmelnitskiy	3776
41320	Kirovohrad	3777
41321	Oleksandriya	3777
41322	Svidlovodsk	3777
41323	Dzhankoy	3778
41324	Feodosiya	3778
41325	Kerch	3778
41326	Simferopol	3778
41327	Yalta	3778
41328	Yevpatoriya	3778
41329	Kiev	3779
41330	Kyyiv	3779
41331	Bila Tserkva	3780
41332	Boryspil	3780
41333	Brovary	3780
41334	Fastiv	3780
41335	Chervonohrad	3781
41336	Drohobych	3781
41337	Lviv	3781
41338	Stryy	3781
41339	Yavoriv	3781
41340	Alchevsk	3782
41341	Antratsyt	3782
41342	Bryanka	3782
41343	Krasnodon	3782
41344	Krasnyy Luch	3782
41345	Luhansk	3782
41346	Luhansk	3782
41347	Lysychansk	3782
41348	Pervomaysk	3782
41349	Rovenky	3782
41350	Rubizhne	3782
41351	Stakhanov	3782
41352	Sverdlovsk	3782
41353	Syeverodonetsk	3782
41354	Mykolayiv	3783
41355	Pervomaysk	3783
41356	Bilhorod-Dnistrovskyy	3784
41357	Illichivsk	3784
41358	Izmayil	3784
41359	Odesa	3784
41360	Odessa	3785
41361	Komsomolsk	3786
41362	Kremenchuh	3786
41363	Lubny	3786
41364	Poltava	3786
41365	Rivne	3787
41366	Konotop	3789
41367	Okhtyrka	3789
41368	Romny	3789
41369	Shostka	3789
41370	Sumy	3789
41371	Ternopil	3790
41372	Kovel	3791
41373	Lutsk	3791
41374	Novovolynsk	3791
41375	Vinnitsa	3792
41376	Vinnytsya	3792
41377	Mukacheve	3793
41378	Uzhhorod	3793
41379	Berdyansk	3794
41380	Enerhodar	3794
41381	Melitpol	3794
41382	Zaporizhia	3794
41383	Berdychiv	3795
41384	Korosten	3795
41385	Novohrad-Volynskyy	3795
41386	Zhytomyr	3795
41387	Ajman	3797
41388	Al Qusais	3798
41389	Deira	3798
41390	Dubai	3798
41391	Jebel Ali	3798
41392	Sharjah	3800
41393	Khawr Fakkan	3803
41394	al-Fujayrah	3803
41395	Cleveland	3805
41396	Gilberdyke	3805
41397	Llanrwst	3805
41398	Swadlincote	3805
41399	Turriff	3805
41400	Westhill	3806
41401	Oban	3807
41402	Craigavon	3808
41403	Barton-le-Clay	3809
41404	Bedford	3809
41405	Biggleswade	3809
41406	Caddington	3809
41407	Flitton	3809
41408	Flitwick	3809
41409	Leighton Buzzard	3809
41410	Marston Moretaine	3809
41411	Sandy	3809
41412	Westoning	3809
41413	Dundonald	3810
41414	Holywood	3810
41415	Berkshire	3811
41416	Bracknell	3811
41417	Littlewick Green	3811
41418	Maidenhead	3811
41419	Newbury	3811
41420	Reading	3811
41421	Sandhurst	3811
41422	Slough	3811
41423	Sunninghill	3811
41424	Twyford	3811
41425	Windsor	3811
41426	Wokingham	3811
41427	Woodley	3811
41428	Coleshill	3812
41429	Edgbaston	3812
41430	Hockley	3812
41431	Ladywood	3812
41432	Nechells	3812
41433	Rubery	3812
41434	Small Heath	3812
41435	Angus	3813
41436	Bridgnorth	3814
41437	Avon	3815
41438	Fishponds	3815
41439	Henleaze	3815
41440	Thornbury	3815
41441	Warmley	3815
41442	Amersham	3816
41443	Aston Clinton	3816
41444	Beaconsfield	3816
41445	Bletchley	3816
41446	Bourne End	3816
41447	Buckingham	3816
41448	High Wycombe	3816
41449	Iver	3816
41450	Marlow	3816
41451	Milton Keynes	3816
41452	Newport Pagnell	3816
41453	Piddington	3816
41454	Princes Risborough	3816
41455	Rowsham	3816
41456	Cambridge	3817
41457	Ely	3817
41458	Huntingdon	3817
41459	Peterborough	3817
41460	Cambridge	3818
41461	Haddenham	3818
41462	Sawtry	3818
41463	Wisbech	3818
41464	Alderley Edge	3820
41465	Altrincham	3820
41466	Betley	3820
41467	Cheadle Gatley	3820
41468	Cheadle Hulme	3820
41469	Crewe	3820
41470	Dukinfield	3820
41471	Holmes Chapel	3820
41472	Hyde	3820
41473	Knuntsford	3820
41474	Knutsford	3820
41475	Lymm	3820
41476	Malpas	3820
41477	Merseyside	3820
41478	Middlewich	3820
41479	Mobberley	3820
41480	Nantwich	3820
41481	Saltney	3820
41482	Sandbach	3820
41483	Stalybridge	3820
41484	Stockport	3820
41485	Tarporley	3820
41486	Timperley	3820
41487	Widnes	3820
41488	Winsford	3820
41489	Redcar	3821
41490	Stockton-on-Tees	3821
41491	Conwy	3823
41492	Llandudno	3823
41493	Bude	3824
41494	Camborne	3824
41495	Fowey	3824
41496	Hayle	3824
41497	Helston	3824
41498	Launceston	3824
41499	Liskeard	3824
41500	Looe	3824
41501	Mevegissey	3824
41502	Newquay	3824
41503	Penryn	3824
41504	Penzance	3824
41505	St. Ives	3824
41506	Truro	3824
41507	Wadebridge	3824
41508	Holbrooks	3825
41509	Askam-in-Furness	3827
41510	Flookburgh	3827
41511	Grasmere	3827
41512	Kendal	3827
41513	Keswick	3827
41514	Kirkby Stephen	3827
41515	Milnthorpe	3827
41516	Penrith	3827
41517	Ulverston	3827
41518	Windermere	3827
41519	Denbigh	3828
41520	Ashbourne	3829
41521	Buxton	3829
41522	Chesterfield	3829
41523	Eckington	3829
41524	Bakewell	3830
41525	Belper	3830
41526	Breaston	3830
41527	Derby	3830
41528	Ilkeston	3830
41529	Matlock	3830
41530	Ripley	3830
41531	Axminster	3831
41532	Barnstaple	3831
41533	Beaworthy	3831
41534	Bideford	3831
41535	Bovey Tracey	3831
41536	Braunton	3831
41537	Brixham	3831
41538	Chudleigh	3831
41539	Crediton	3831
41540	Dalwood	3831
41541	Dartmouth	3831
41542	Dawlish	3831
41543	Exeter	3831
41544	Exmouth	3831
41545	Great Torrington	3831
41546	Holsworthy	3831
41547	Kingsbridge	3831
41548	Modbury	3831
41549	Newton Abbot	3831
41550	Okehampton	3831
41551	Plymouth	3831
41552	Plympton	3831
41553	Salcombe	3831
41554	Tiverton	3831
41555	Torquay	3831
41556	Totnes	3831
41557	Winkleigh	3831
41558	Woodburyd	3831
41559	Yelverton	3831
41560	Didcot	3833
41561	Beaminster	3834
41562	Blandford Forum	3834
41563	Christchurch	3834
41564	Dorset	3834
41565	Poole	3834
41566	Sherborne	3834
41567	Sturminster Newton	3834
41568	Swanage	3834
41569	Verwood	3834
41570	Wimborne	3834
41571	Alexandria	3835
41572	Crook	3836
41573	Spennymoor	3836
41574	Abingdon	3842
41575	Accrington	3842
41576	Aldershot	3842
41577	Alfreton	3842
41578	Altrincham	3842
41579	Amersham	3842
41580	Andover	3842
41581	Arnold	3842
41582	Ashford	3842
41583	Ashington	3842
41584	Ashton-in-Makerfield	3842
41585	Ashton-under-Lyne	3842
41586	Atherton	3842
41587	Aylesbury	3842
41588	Aylesford-East Malling	3842
41589	Banbury	3842
41590	Banstead-Tadworth	3842
41591	Barnsley	3842
41592	Barnstaple	3842
41593	Barrow-in-Furness	3842
41594	Basildon	3842
41595	Basingstoke	3842
41596	Bath	3842
41597	Batley	3842
41598	Bebington	3842
41599	Bedford	3842
41600	Bedworth	3842
41601	Beeston and Stapleford	3842
41602	Benfleet	3842
41603	Bentley	3842
41604	Berwick-upon-Tweed	3842
41605	Beverley	3842
41606	Bexhil	3842
41607	Bicester	3842
41608	Bideford	3842
41609	Billericay	3842
41610	Billingham	3842
41611	Birkenhead	3842
41612	Birmingham	3842
41613	Bishop Auckland	3842
41614	Bishops Stortford	3842
41615	Blackburn	3842
41616	Blackpool	3842
41617	Bletchley	3842
41618	Blyth	3842
41619	Bodmin	3842
41620	Bognor Regis	3842
41621	Bolton	3842
41622	Bootle	3842
41623	Boston	3842
41624	Bournemouth	3842
41625	Bracknell	3842
41626	Bradford	3842
41627	Braintree	3842
41628	Bredbury and Romiley	3842
41629	Brentwood	3842
41630	Bridgwater	3842
41631	Bridlington	3842
41632	Brigg	3842
41633	Brighouse	3842
41634	Brighton	3842
41635	Bristol	3842
41636	Broadstairs	3842
41637	Bromley Cross-Bradshaw	3842
41638	Bromsgrove-Catshill	3842
41639	Burgess Hill	3842
41640	Burnley	3842
41641	Burntwood	3842
41642	Burton-upon-Trent	3842
41643	Bury	3842
41644	Bury Saint Edmunds	3842
41645	Camberley-Frimley	3842
41646	Cambourne-Redruth	3842
41647	Cambridge	3842
41648	Cannock	3842
41649	Canterbury	3842
41650	Canvey Island	3842
41651	Carlisle	3842
41652	Carlton	3842
41653	Castleford	3842
41654	Caterham and Warlingham	3842
41655	Chadderton	3842
41656	Chapeltown	3842
41657	Chatham	3842
41658	Cheadle and Gatley	3842
41659	Chelmsford	3842
41660	Cheltenham	3842
41661	Chesham	3842
41662	Cheshunt	3842
41663	Chessington	3842
41664	Chester	3842
41665	Chester-le-Street	3842
41666	Chesterfield	3842
41667	Chichester	3842
41668	Chippenham	3842
41669	Chipping Sodbury	3842
41670	Chorley	3842
41671	Christchurch	3842
41672	Clacton-on-Sea	3842
41673	Clay Cross-North Wingfield	3842
41674	Cleethorpes	3842
41675	Clevedon	3842
41676	Coalville	3842
41677	Colchester	3842
41678	Congleton	3842
41679	Consett	3842
41680	Corby	3842
41681	Coventry	3842
41682	Cramlington	3842
41683	Crawley	3842
41684	Crosby	3842
41685	Crowthorne	3842
41686	Darlington	3842
41687	Dartford	3842
41688	Darwen	3842
41689	Deal	3842
41690	Denton	3842
41691	Derby	3842
41692	Dewsbury	3842
41693	Doncaster	3842
41694	Dorchester	3842
41695	Dover	3842
41696	Droitwich	3842
41697	Dronfield	3842
41698	Droylsden	3842
41699	Dudley	3842
41700	Dunstable	3842
41701	Durham	3842
41702	East Grinstead	3842
41703	East Retford	3842
41704	Eastbourne	3842
41705	Eastleigh	3842
41706	Eaton Socon-Saint Neots	3842
41707	Eccles	3842
41708	Egham	3842
41709	Ellesmere Port	3842
41710	Epsom and Ewell	3842
41711	Esher-Molesey	3842
41712	Eston and South Bank	3842
41713	Exeter	3842
41714	Failsworth	3842
41715	Falmouth-Penryn	3842
41716	Fareham	3842
41717	Farnborough	3842
41718	Farnham	3842
41719	Farnworth	3842
41720	Farring	3842
41721	Felixtowe	3842
41722	Felling	3842
41723	Ferndown	3842
41724	Fleetwood	3842
41725	Folkestone	3842
41726	Formby	3842
41727	Frome	3842
41728	Fulham	3842
41729	Gateshead	3842
41730	Gillingham	3842
41731	Glossop	3842
41732	Gloucester	3842
41733	Godalming	3842
41734	Golborne	3842
41735	Gosforth	3842
41736	Gosport	3842
41737	Grantham	3842
41738	Gravesend	3842
41739	Grays	3842
41740	Greasby	3842
41741	Great Malvern	3842
41742	Great Sankey	3842
41743	Great Yarmouth	3842
41744	Grimsby	3842
41745	Guildford	3842
41746	Guiseley-Yeadon	3842
41747	Halesowen	3842
41748	Halifax	3842
41749	Harlow	3842
41750	Harpenden	3842
41751	Harrogate	3842
41752	Hartlepool	3842
41753	Hastings	3842
41754	Hatfield	3842
41755	Hatfield-Stainforth	3842
41756	Havant	3842
41757	Haywards Heath	3842
41758	Hazel Grove and Bramhill	3842
41759	Hazlemere	3842
41760	Heanor	3842
41761	Hemel Hempstead	3842
41762	Hereford	3842
41763	Herne Bay	3842
41764	Hertford	3842
41765	Heswall	3842
41766	Heywood	3842
41767	High Wycombe	3842
41768	Hinckley	3842
41769	Hindley	3842
41770	Hitchin	3842
41771	Hoddesdon	3842
41772	Holmfirth-Honley	3842
41773	Honiton	3842
41774	Horsham	3842
41775	Houghton-le-Spring	3842
41776	Hove	3842
41777	Hoylake-West Kirby	3842
41778	Hucknall	3842
41779	Huddersfield	3842
41780	Huyton-with-Roby	3842
41781	Hyde	3842
41782	Ilfracombe	3842
41783	Ilkeston	3842
41784	Ipswich	3842
41785	Ivybridge	3842
41786	Jarrow	3842
41787	Keighley	3842
41788	Kendal	3842
41789	Kenilworth	3842
41790	Kettering	3842
41791	Kidderminster	3842
41792	Kidsgrove	3842
41793	Kings Lynn	3842
41794	Kingsteignton	3842
41795	Kingston upon Hull	3842
41796	Kingswood	3842
41797	Kirby in Ashfield	3842
41798	Kirkby	3842
41799	Lancaster	3842
41800	Leamington	3842
41801	Leatherhead	3842
41802	Leeds	3842
41803	Leicester	3842
41804	Leigh	3842
41805	Leighton Buzzard	3842
41806	Letchworth	3842
41807	Lewes	3842
41808	Leyland	3842
41809	Lichfield	3842
41810	Lincoln	3842
41811	Litherland	3842
41812	Littlehampton	3842
41813	Liverpool	3842
41814	Locks Heath	3842
41815	London	3842
41816	Long Benton-Killingworth	3842
41817	Long Eaton	3842
41818	Loughborough	3842
41819	Loughton	3842
41820	Louth	3842
41821	Lowestoft	3842
41822	Luton	3842
41823	Lyminge	3842
41824	Lytham Saint Annes	3842
41825	Mablethorpe and Sutton	3842
41826	Macclesfield	3842
41827	Maghull-Lydiate	3842
41828	Maidenhead	3842
41829	Maidstone	3842
41830	Manchester	3842
41831	Mangotsfield	3842
41832	Mansfield	3842
41833	Margate	3842
41834	Matlock	3842
41835	Melton Mowbray	3842
41836	Middlesbrough	3842
41837	Middleton	3842
41838	Midsomer Norton	3842
41839	Milton Keynes	3842
41840	Morecambe	3842
41841	Morley	3842
41842	Nailsea	3842
41843	Nantwich	3842
41844	Nelson	3842
41845	New Addington	3842
41846	New Milton-Barton-on-Sea	3842
41847	Newark-on-Trent	3842
41848	Newburn	3842
41849	Newbury	3842
41850	Newcastle upon Tyne	3842
41851	Newcastle-under-Lyme	3842
41852	Newport	3842
41853	Newton Abbot	3842
41854	Newton Aycliffe	3842
41855	North Hykeham	3842
41856	North Shields	3842
41857	Northallerton	3842
41858	Northam	3842
41859	Northampton	3842
41860	Northfleet	3842
41861	Northwich	3842
41862	Norwich	3842
41863	Nottingham	3842
41864	Nuneaton	3842
41865	Oakengates-Donnington	3842
41866	Oakham	3842
41867	Oldbury-Smethwick	3842
41868	Oldham	3842
41869	Ormskirk	3842
41870	Ossett	3842
41871	Oxford	3842
41872	Paignton	3842
41873	Penzance	3842
41874	Peterborough	3842
41875	Peterlee	3842
41876	Plymouth	3842
41877	Pontefract	3842
41878	Poole	3842
41879	Portsmouth	3842
41880	Potters Bar	3842
41881	Prescot	3842
41882	Preston	3842
41883	Prestwich	3842
41884	Prestwood	3842
41885	Pudsey	3842
41886	Radcliffe	3842
41887	Ramsgate	3842
41888	Rawtenstall	3842
41889	Rayleigh	3842
41890	Reading	3842
41891	Redcar	3842
41892	Redditch	3842
41893	Reigate	3842
41894	Rochdale	3842
41895	Rochester	3842
41896	Rotherham	3842
41897	Rottingdean	3842
41898	Royal Tunbridge Wells	3842
41899	Royton	3842
41900	Rugby	3842
41901	Rugeley	3842
41902	Runcorn	3842
41903	Rushden	3842
41904	Ryde	3842
41905	Saint Albans	3842
41906	Saint Austell	3842
41907	Saint Helens	3842
41908	Sale	3842
41909	Salford	3842
41910	Salisbury	3842
41911	Scarborough	3842
41912	Scunthorpe	3842
41913	Seaham	3842
41914	Sevenoaks	3842
41915	Sheffield	3842
41916	Shipley	3842
41917	Shrewsbury	3842
41918	Sidmouth	3842
41919	Sittingbourne	3842
41920	Skegness	3842
41921	Skelmersdale	3842
41922	Sleaford	3842
41923	Slough	3842
41924	Solihull	3842
41925	Sompting-Lancing	3842
41926	South Shields	3842
41927	Southampton	3842
41928	Southend-on-Sea	3842
41929	Southport	3842
41930	Spalding-Pinchbeck	3842
41931	St. Helens	3842
41932	Stafford	3842
41933	Staines	3842
41934	Stalybridge	3842
41935	Stamford	3842
41936	Stanford le Hope-Corringham	3842
41937	Stanley-Annfield Plain	3842
41938	Staveley	3842
41939	Stevenage	3842
41940	Stockport	3842
41941	Stockton Heath-Thelwall	3842
41942	Stockton-on-Tees	3842
41943	Stoke-on-Trent	3842
41944	Stourbridge	3842
41945	Stratford-upon-Avon	3842
41946	Stretford	3842
41947	Strood	3842
41948	Stubbington	3842
41949	Sunbury	3842
41950	Sunderland	3842
41951	Sutton Coldfield	3842
41952	Sutton in Ashfield	3842
41953	Swadlincote	3842
41954	Swanley-Hextable	3842
41955	Swindon	3842
41956	Swinton and Pendlebury	3842
41957	Tamworth	3842
41958	Taunton	3842
41959	Tavistock	3842
41960	Teignmouth	3842
41961	Telford	3842
41962	Tenbury Wells	3842
41963	Thatcham	3842
41964	The Deepings	3842
41965	Thetford	3842
41966	Thornaby	3842
41967	Thornton-Cleveleys	3842
41968	Tiverton	3842
41969	Tonbridge	3842
41970	Torquay	3842
41971	Totton	3842
41972	Trowbridge	3842
41973	Truro	3842
41974	Tyldesley	3842
41975	Urmston	3842
41976	Wakefield	3842
41977	Walkden	3842
41978	Wallasey	3842
41979	Wallsend	3842
41980	Walsall	3842
41981	Walton and Weybridge	3842
41982	Warrington	3842
41983	Warwick	3842
41984	Washington	3842
41985	Waterlooville	3842
41986	Watford	3842
41987	Wellingborough	3842
41988	Welwyn Garden City	3842
41989	West Bridgeford	3842
41990	West Bromwich	3842
41991	Westhoughton	3842
41992	Weston-super-Mare	3842
41993	Weymouth	3842
41994	Whitefield	3842
41995	Whitehaven	3842
41996	Whitley Bay	3842
41997	Wickford	3842
41998	Widnes	3842
41999	Wigan	3842
42000	Wigston	3842
42001	Wilmslow	3842
42002	Wimbourne Minster	3842
42003	Winchester	3842
42004	Windsor Berks	3842
42005	Windsor-Eton	3842
42006	Winsford	3842
42007	Wisbech	3842
42008	Witham	3842
42009	Witney	3842
42010	Woking-Byfleet	3842
42011	Wokingham	3842
42012	Wolverhampton	3842
42013	Wolverton-Stony Stratford	3842
42014	Worcester	3842
42015	Worcestershire	3842
42016	Workington	3842
42017	Worksop	3842
42018	Worthing	3842
42019	Yeovil	3842
42020	York	3842
42021	Barking	3843
42022	Basildon	3843
42023	Brentwood	3843
42024	Cambrridge	3843
42025	Canvey Island	3843
42026	Chelmsford	3843
42027	Clacton-on-Sea	3843
42028	Colchester	3843
42029	Dagenham	3843
42030	Dunmow	3843
42031	Epping	3843
42032	Essex	3843
42033	Grays	3843
42034	Harlow	3843
42035	Ilford	3843
42036	Ingatestone	3843
42037	Leigh on Sea	3843
42038	Rainham	3843
42039	Romford	3843
42040	Saffron Walden	3843
42041	Stansted	3843
42042	Wickford	3843
42043	Ballinamallard	3844
42044	Kirkcaldy	3845
42045	Ewloe	3846
42046	Greenfield	3846
42047	Imperial Wharf	3847
42048	Kirton-in-Lindsey	3848
42049	Berkeley	3849
42050	Cheltenham	3849
42051	Churchham	3849
42052	Cirencester	3849
42053	East Kilbride	3849
42054	Gloucester	3849
42055	Lechlade	3849
42056	Lydney	3849
42057	Moreton in Marsh	3849
42058	Stroud	3849
42059	Tewkesbury	3849
42060	Blackwood	3850
42061	Blaenavon	3850
42062	Newport	3850
42063	Tredegar	3850
42064	Aldershot	3851
42065	Alton	3851
42066	Andover	3851
42067	Bordon	3851
42068	Botley	3851
42069	Fareham	3851
42070	Farnborough	3851
42071	Fleet	3851
42072	Fordingbridge	3851
42073	Havant	3851
42074	Hayling Island	3851
42075	Hook	3851
42076	Isle of wight	3851
42077	Liphook	3851
42078	Longparish	3851
42079	Old Bishopstoke	3851
42080	Petersfield	3851
42081	Portsmouth	3851
42082	Ringwood	3851
42083	Romsey	3851
42084	South Harting	3851
42085	Southampton	3851
42086	Waterlooville	3851
42087	West Wellow	3851
42088	Winchester	3851
42089	Lymington	3852
42090	Pennington	3852
42091	Southampton	3852
42092	Kington	3853
42093	Ledbury	3853
42094	Leominster	3853
42095	Saint Albans	3853
42096	Barnet	3854
42097	Bishops Stortford	3854
42098	Borehamwood	3854
42099	Brookmans Park	3854
42100	Bushey	3854
42101	Cheshunt	3854
42102	Cuffley	3854
42103	Elstree	3854
42104	Hemel Hempstead	3854
42105	Hertfordshire	3854
42106	Kings Langley	3854
42107	Much Hadham	3854
42108	Radlett	3854
42109	Rickmansworth	3854
42110	Royston	3854
42111	Stevenage	3854
42112	Waltham Cross	3854
42113	Watford	3854
42114	Welwyn	3854
42115	Newmarket	3858
42116	Ashford	3859
42117	Beckenham	3859
42118	Bromley	3859
42119	Brookland	3859
42120	Charing	3859
42121	Chatam	3859
42122	Crayford	3859
42123	Edenbridge	3859
42124	Erith	3859
42125	Faversham	3859
42126	Five Oak Green	3859
42127	Folkestone	3859
42128	Gillingham	3859
42129	Gravesend	3859
42130	Hartlip	3859
42131	Hayes	3859
42132	Herne Bay	3859
42133	Hythe	3859
42134	Lenham	3859
42135	Maidstone	3859
42136	Minster	3859
42137	New Romney	3859
42138	Orpington	3859
42139	Paddock Wood	3859
42140	Royal Tunbridge Wells	3859
42141	Sandwich	3859
42142	Sheerness	3859
42143	Sidcup	3859
42144	Sittingbourne	3859
42145	Staplehurst	3859
42146	Tunbridge Wells	3859
42147	West Malling	3859
42148	Westerham	3859
42149	Whitstable	3859
42150	canterbury	3859
42151	Ayrshire	3860
42152	Airdrie	3861
42153	Glasgow	3861
42154	Accrington	3862
42155	Blackburn	3862
42156	Blackpool	3862
42157	Burnley	3862
42158	Clayton-Le-Moors	3862
42159	Cleveleys	3862
42160	Darwen	3862
42161	Gisburn	3862
42162	Glasgow	3862
42163	Greater Manchester	3862
42164	Hamilton	3862
42165	Kirkby Lonsdale	3862
42166	Leyland	3862
42167	Littleborough	3862
42168	Lytham St Annes	3862
42169	Nelson	3862
42170	Oldham	3862
42171	Out Rawcliffe	3862
42172	Padiham	3862
42173	Preston	3862
42174	Rochdale	3862
42175	Rossendale	3862
42176	Tarleton	3862
42177	Todmorden	3862
42178	West Lancashire	3862
42179	Coalville	3863
42180	Fleckney	3863
42181	Leicester	3863
42182	Loughborough	3863
42183	Lutterworth	3863
42184	Market Harborough	3863
42185	Tur Langton	3863
42186	Alford	3864
42187	Bourne	3864
42188	Casewick	3864
42189	Digby	3864
42190	Gainsborough	3864
42191	Grimsby	3864
42192	Immingham	3864
42193	Laceby	3864
42194	Lincoln	3864
42195	Louth	3864
42196	Market Deeping	3864
42197	Market Rasen	3864
42198	Spalding	3864
42199	Spilsby	3864
42200	Swinderby	3864
42201	Thurlby	3864
42202	Witham St Hughs	3864
42203	Llanymynech	3865
42204	Abbeywood	3866
42205	Aldgate	3866
42206	Alperton	3866
42207	Castledawson	3866
42208	Edmonton	3866
42209	Enfield	3866
42210	Forest Gate	3866
42211	Greenwich	3866
42212	Hainault	3866
42213	Hampstead	3866
42214	Harrow Weald	3866
42215	Hendon	3866
42216	Kensington	3866
42217	Leyton	3866
42218	London	3866
42219	Magherafelt	3866
42220	Mill Hill	3866
42221	Southwark	3866
42222	Suffolk	3866
42223	Sulham	3866
42224	Victoria	3866
42225	Walthamstow	3866
42226	Wandsworth	3866
42227	Wembley	3866
42228	Wimbledon	3866
42229	Woolwich	3866
42230	Ludlow	3867
42231	Manchester	3868
42232	Prestwich	3868
42233	Salford	3868
42234	Swinton	3868
42235	Worsley	3868
42236	Mayfair	3869
42237	Southport	3870
42238	Brentford	3872
42239	Brimsdown	3872
42240	Drayton	3872
42241	Edgware	3872
42242	Feltham	3872
42243	Greenford	3872
42244	Hampton	3872
42245	Harmondsworth	3872
42246	Harrow	3872
42247	Hayes	3872
42248	Isleworth	3872
42249	Northolt	3872
42250	Northwood	3872
42251	Perivale	3872
42252	Pinner	3872
42253	Ruislip	3872
42254	Ruislip Manor	3872
42255	South Harrow	3872
42256	Southall	3872
42257	Staines	3872
42258	Stamore	3872
42259	Stanmore	3872
42260	Stanwell	3872
42261	Sunbury	3872
42262	Teddington	3872
42263	Twickenham	3872
42264	Uxbridge	3872
42265	Watford	3872
42266	Wembley	3872
42267	West Drayton	3872
42268	Wraysbury	3872
42269	hounslow	3872
42270	Mildenhall	3873
42271	Abergavenny	3874
42272	Monmouth	3874
42273	Attleborough	3876
42274	Bacton	3876
42275	Briston	3876
42276	Dereham	3876
42277	Diss	3876
42278	Downham Market	3876
42279	Fakenham	3876
42280	Garboldisham	3876
42281	Gayton	3876
42282	Glandford	3876
42283	Great Yarmouth	3876
42284	Heacham	3876
42285	Hopton	3876
42286	Kings Lynn	3876
42287	Little Cressingham	3876
42288	Norwich	3876
42289	Sheringham	3876
42290	Thetford	3876
42291	Trunch	3876
42292	Winordhan	3876
42293	Wymondham	3876
42294	Daventry	3879
42295	Irthlingborough	3879
42296	Middleton Cheney	3879
42297	Oundle	3879
42298	Towcester	3879
42299	Welford	3879
42300	Wellingborough	3879
42301	Woodford Halse	3879
42302	Brackley	3880
42303	Desborough	3880
42304	weedon	3880
42305	Bedlington	3882
42306	Corbridge	3882
42307	Cramlington	3882
42308	Morpeth	3882
42309	Northumberland	3882
42310	Ponteland	3882
42311	Wooler	3882
42312	Burton Joyce	3883
42313	Cotgraves	3883
42314	Gonalston	3883
42315	Mansfield	3883
42316	Newark	3883
42317	Nottingham	3883
42318	Pennyfoot Street	3883
42319	Sandiacre	3883
42320	Southwell	3883
42321	Whatton	3883
42322	Bampton	3884
42323	Banbury	3884
42324	Bicester	3884
42325	Blewbury	3884
42326	Cheltenham	3884
42327	Chipping Norton	3884
42328	Drayton	3884
42329	Eynsham	3884
42330	Farringdon	3884
42331	Henely on Thames	3884
42332	Henley-on-Thames	3884
42333	Oxford	3884
42334	Shenington	3884
42335	Thame	3884
42336	Wantage	3884
42337	Builth Wells	3885
42338	Knighton	3885
42339	Llanbrynmair	3885
42340	New town	3885
42341	Newtown	3885
42342	Rhaeadr	3885
42343	Welshpool	3885
42344	Hill of Fearn	3886
42345	Shoreham	3887
42346	Sark	3888
42347	Aberdeen	3889
42348	Alloa	3889
42349	Alness	3889
42350	Annan	3889
42351	Arbroath	3889
42352	Ardrossan	3889
42353	Armadale	3889
42354	Ayr	3889
42355	Bathgate	3889
42356	Blairgowrie	3889
42357	Blantyre-Hamilton	3889
42358	Boness	3889
42359	Bonnybridge	3889
42360	Broxburn	3889
42361	Broxham	3889
42362	Buckhaven	3889
42363	Burntisland	3889
42364	Carluke	3889
42365	Carnoustie	3889
42366	Coatbridge	3889
42367	Cowdenbeath	3889
42368	Cumbernauld	3889
42369	Cumnock	3889
42370	Cupar	3889
42371	Dalbeattie	3889
42372	Dalkeith	3889
42373	Dingwall	3889
42374	Dumbarton	3889
42375	Dumfries	3889
42376	Dundee	3889
42377	Dunfermline	3889
42378	Dunoon	3889
42379	East Kilbride	3889
42380	Edimburah	3889
42381	Edinburgh	3889
42382	Elgin	3889
42383	Ellon	3889
42384	Erskine	3889
42385	Falkirk	3889
42386	Forfar	3889
42387	Forres	3889
42388	Fort William	3889
42389	Fraserburgh	3889
42390	Galashiels	3889
42391	Galston-Newmilns	3889
42392	Girvan	3889
42393	Glasgow	3889
42394	Glenrothes	3889
42395	Greengairs	3889
42396	Greenock	3889
42397	Haddington	3889
42398	Hawick	3889
42399	Helensburgh	3889
42400	Insch	3889
42401	Inverkeithing-Dalgety Bay	3889
42402	Inverness	3889
42403	Inverurie	3889
42404	Irvine	3889
42405	Isle of Lewis	3889
42406	Kilmarnock	3889
42407	Kilsyth	3889
42408	Kilwinning	3889
42409	Kirkcaldy	3889
42410	Kirkintilloch-Lenzie	3889
42411	Kirkwall	3889
42412	Lanark	3889
42413	Largs	3889
42414	Larkhall	3889
42415	Lerwick	3889
42416	Linlithgow	3889
42417	Livingston	3889
42418	Loanhead	3889
42419	Montrose	3889
42420	Motherwell	3889
42421	Nairn	3889
42422	Newtown Saint Boswells	3889
42423	Paisley	3889
42424	Penicuik	3889
42425	Perth	3889
42426	Peterhead	3889
42427	Saint Andrews	3889
42428	Selkirkshire	3889
42429	Shotts	3889
42430	Stirling	3889
42431	Stonehaven	3889
42432	Stornoway	3889
42433	Stranraer	3889
42434	Tranent	3889
42435	Troon	3889
42436	Whitburn	3889
42437	Bishops Castle	3891
42438	Bridgnorth	3891
42439	Bucknell	3891
42440	Drayton	3891
42441	Greete	3891
42442	Hinstock	3891
42443	Jackfield	3891
42444	Ludlow	3891
42445	Much Wenlock	3891
42446	Oswestry	3891
42447	Ryton	3891
42448	Shifnal	3891
42449	Shrewsbury	3891
42450	Telford	3891
42451	Whitchurch	3891
42452	Bath	3892
42453	Brent Knoll	3892
42454	Castle Cary	3892
42455	Shepton Mallet	3892
42456	Somerset	3892
42457	Taunton	3892
42458	Wedmore	3892
42459	Wellington	3892
42460	Weston-super-Mare	3892
42461	Burton-on-Trent	3897
42462	Hednesford	3897
42463	Stoke on Trent	3897
42464	Stone	3897
42465	Strabane	3898
42466	Bury St Edmunds	3899
42467	Felixstowe	3899
42468	Haverhill	3899
42469	Leiston	3899
42470	Lowestoft	3899
42471	Stowmarket	3899
42472	Sudbury	3899
42473	Woodbridge	3899
42474	Ashtead	3900
42475	Bagshot	3900
42476	Betchworth	3900
42477	Bletchingley	3900
42478	Carshalton	3900
42479	Chertsey	3900
42480	Claygate	3900
42481	Croydon	3900
42482	Dorking	3900
42483	Effingham	3900
42484	Epsom	3900
42485	Farnham	3900
42486	Haslemere	3900
42487	Kingston Upon Thames	3900
42488	Leatherhead	3900
42489	Mitcham	3900
42490	New Malden	3900
42491	Redhill	3900
42492	Richmond	3900
42493	Salfords	3900
42494	Shepperton	3900
42495	Stoneleigh	3900
42496	Surbiton	3900
42497	Surrey	3900
42498	Tadworth	3900
42499	Walton on Thames	3900
42500	West Molesey	3900
42501	Wisley	3900
42502	Woking	3900
42503	Brighton	3901
42504	Henfield	3901
42505	Sussex	3901
42506	Worthing	3901
42507	Twickenham	3902
42508	Omagh	3904
42509	Santaquin	3905
42510	Aberdare	3906
42511	Aberystwyth	3906
42512	Barry	3906
42513	Brecon	3906
42514	Bridgend	3906
42515	Brynmawr	3906
42516	Caernarfon	3906
42517	Caerphily	3906
42518	Caldicot	3906
42519	Cardiff	3906
42520	Carmarthen	3906
42521	Colwyn Bay	3906
42522	Connahs Quay	3906
42523	Cwmbran	3906
42524	Dolgellau	3906
42525	Ebbw Vale	3906
42526	Gaerwen	3906
42527	Gwynedd	3906
42528	Haverfordwest	3906
42529	Isle of Anglesey	3906
42530	Islwyn	3906
42531	Llandrindod Wells	3906
42532	Llanelli	3906
42533	Llangefni	3906
42534	Maesteg	3906
42535	Merthyr Tydfil	3906
42536	Mold	3906
42537	Mountain Ash-Abercynon	3906
42538	Neath	3906
42539	Newport	3906
42540	Pembrokeshire	3906
42541	Penarth	3906
42542	Pencader	3906
42543	Pontypool	3906
42544	Pontypridd	3906
42545	Port Talbot	3906
42546	Queensferry	3906
42547	Rhondda	3906
42548	Rhyl	3906
42549	Ruthin	3906
42550	Shotton-Hawarden	3906
42551	St. Asaph	3906
42552	Swansea	3906
42553	West Glamorgan	3906
42554	Wrexham	3906
42555	Alcester	3907
42556	Coventry	3907
42557	Henley in Arden	3907
42558	Nuneaton	3907
42559	Pershore	3907
42560	Southam	3907
42561	Warwick	3907
42562	Whissendine	3912
42563	Amesbury	3913
42564	Bradford on Avon	3913
42565	Calne	3913
42566	Chippenham	3913
42567	Corsham	3913
42568	Cosham	3913
42569	Devizes	3913
42570	Downton	3913
42571	Malmesbury	3913
42572	Marlborough	3913
42573	Melksham	3913
42574	Pewsey	3913
42575	Salisbury	3913
42576	Southwick	3913
42577	Swindon	3913
42578	Warminster	3913
42579	Westbury	3913
42580	Winnersh	3914
42581	Evesham	3915
42582	Hartlebury	3915
42583	Kidderminster	3915
42584	Pershore	3915
42585	Redditch	3915
42586	Worcester	3915
42587	Caergwrle	3916
42588	Ruabon	3916
42589	Neuffen	3917
42590	Beverley	3918
42591	Malton	3918
42592	Mexborough	3918
42593	Alabaster	3919
42594	Albertville	3919
42595	Alexander City	3919
42596	Anniston	3919
42597	Arab	3919
42598	Ashville	3919
42599	Athens	3919
42600	Atmore	3919
42601	Auburn	3919
42602	Bessemer	3919
42603	Birmingham	3919
42604	Capshaw	3919
42605	Center Point	3919
42606	Childersburg	3919
42607	Cullman	3919
42608	Daleville	3919
42609	Daphne	3919
42610	Decatur	3919
42611	Dothan	3919
42612	Enterprise	3919
42613	Eufaula	3919
42614	Fairfield	3919
42615	Fairhope	3919
42616	Florence	3919
42617	Fort Payne	3919
42618	Gadsden	3919
42619	Grand Bay	3919
42620	Grove Hill	3919
42621	Guntersville	3919
42622	Hampton Cove	3919
42623	Hanceville	3919
42624	Hartselle	3919
42625	Headland	3919
42626	Helena	3919
42627	Hodges	3919
42628	Homewood	3919
42629	Hoover	3919
42630	Hueytown	3919
42631	Huntsville	3919
42632	Jacksonville	3919
42633	Jasper	3919
42634	Leeds	3919
42635	Luverne	3919
42636	Madison	3919
42637	Mobile	3919
42638	Montgomery	3919
42639	Mountain Brook	3919
42640	Muscle Shoals	3919
42641	Northport	3919
42642	Notasulga	3919
42643	Opelika	3919
42644	Oxford	3919
42645	Ozark	3919
42646	Pelham	3919
42647	Pell City	3919
42648	Pennsylvania	3919
42649	Phenix City	3919
42650	Prattville	3919
42651	Prichard	3919
42652	Ramer	3919
42653	Roanoke	3919
42654	Saraland	3919
42655	Scottsboro	3919
42656	Selma	3919
42657	Sheffield	3919
42658	Smiths	3919
42659	Sumiton	3919
42660	Sylacauga	3919
42661	Talladega	3919
42662	Thomasville	3919
42663	Trafford	3919
42664	Troy	3919
42665	Trussville	3919
42666	Tuscaloosa	3919
42667	Tuskegee	3919
42668	Vestavia Hills	3919
42669	Anchorage	3920
42670	Barrow	3920
42671	Bethel	3920
42672	College	3920
42673	Fairbanks	3920
42674	Homer	3920
42675	Juneau	3920
42676	Kenai	3920
42677	Ketchikan	3920
42678	Kodiak	3920
42679	Nome	3920
42680	Palmer	3920
42681	Sitka	3920
42682	Soldotna	3920
42683	Sterling	3920
42684	Unalaska	3920
42685	Valdez	3920
42686	Wasilla	3920
42687	Apache Junction	3921
42688	Avondale	3921
42689	Bisbee	3921
42690	Bouse	3921
42691	Bullhead City	3921
42692	Carefree	3921
42693	Casa Grande	3921
42694	Casas Adobes	3921
42695	Chandler	3921
42696	Clarkdale	3921
42697	Cottonwood	3921
42698	Douglas	3921
42699	Drexel Heights	3921
42700	El Mirage	3921
42701	Flagstaff	3921
42702	Florence	3921
42703	Flowing Wells	3921
42704	Fort Mohave	3921
42705	Fortuna Foothills	3921
42706	Fountain Hills	3921
42707	Gilbert	3921
42708	Glendale	3921
42709	Globe	3921
42710	Goodyear	3921
42711	Green Valley	3921
42712	Kingman	3921
42713	Lake Havasu City	3921
42714	Laveen	3921
42715	Litchfield Park	3921
42716	Marana	3921
42717	Mesa	3921
42718	New Kingman-Butler	3921
42719	Nogales	3921
42720	Oracle	3921
42721	Oro Valley	3921
42722	Paradise Valley	3921
42723	Parker	3921
42724	Payson	3921
42725	Peoria	3921
42726	Phoenix	3921
42727	Pine	3921
42728	Pinetop	3921
42729	Prescott	3921
42730	Prescott Valley	3921
42731	Quartzsite	3921
42732	Queen Creek	3921
42733	Rio Rico	3921
42734	Safford	3921
42735	San Luis	3921
42736	Scottsdale	3921
42737	Sedona	3921
42738	Sierra Vista	3921
42739	Sierra Vista Southeast	3921
42740	Sun City	3921
42741	Sun City West	3921
42742	Surprise	3921
42743	Tempe	3921
42744	Tombstone	3921
42745	Tucson	3921
42746	Winslow	3921
42747	Yuma	3921
42748	Alexander	3922
42749	Arkadelphia	3922
42750	Batesville	3922
42751	Bella Vista	3922
42752	Benton	3922
42753	Bentonville	3922
42754	Berryville	3922
42755	Blytheville	3922
42756	Cabot	3922
42757	Camden	3922
42758	Cherry Valley	3922
42759	Conway	3922
42760	Corning	3922
42761	El Dorado	3922
42762	Fayetteville	3922
42763	Forrest City	3922
42764	Fort Smith	3922
42765	Harrison	3922
42766	Hope	3922
42767	Hot Springs	3922
42768	Jacksonville	3922
42769	Jonesboro	3922
42770	Lake City	3922
42771	Little Rock	3922
42772	Magnolia	3922
42773	Mount Vernon	3922
42774	Mountain Home	3922
42775	Norfork	3922
42776	North Little Rock	3922
42777	Paragould	3922
42778	Piggott	3922
42779	Pine Bluff	3922
42780	Pocahontas	3922
42781	Prescott	3922
42782	Quitman	3922
42783	Rogers	3922
42784	Russellville	3922
42785	Searcy	3922
42786	Sheridan	3922
42787	Sherwood	3922
42788	Siloam Springs	3922
42789	Springdale	3922
42790	Stuttgart	3922
42791	Texarkana	3922
42792	Van Buren	3922
42793	Ward	3922
42794	West Helena	3922
42795	West Memphis	3922
42796	Wynne	3922
42797	Acton	3924
42798	Adelanto	3924
42799	Agoura Hills	3924
42800	Aguanga	3924
42801	Alameda	3924
42802	Alamo	3924
42803	Albany	3924
42804	Alhambra	3924
42805	Aliso Viejo	3924
42806	Alondra Park	3924
42807	Alpine	3924
42808	Alta Loma	3924
42809	Altadena	3924
42810	American Canyon	3924
42811	Anaheim	3924
42812	Anderson	3924
42813	Antelope	3924
42814	Antioch	3924
42815	Apple Valley	3924
42816	Aptos	3924
42817	Arcadia	3924
42818	Arcata	3924
42819	Arden-Arcade	3924
42820	Arroyo Grande	3924
42821	Artesia	3924
42822	Arvin	3924
42823	Ashland	3924
42824	Atascadero	3924
42825	Atwater	3924
42826	Auburn	3924
42827	Avalon	3924
42828	Avenal	3924
42829	Avocado Heights	3924
42830	Azusa	3924
42831	Bakersfield	3924
42832	Baldwin Park	3924
42833	Banning	3924
42834	Barstow	3924
42835	Bay Point	3924
42836	Baywood-Los Osos	3924
42837	Bear Valley Springs	3924
42838	Beaumont	3924
42839	Bell	3924
42840	Bell Gardens	3924
42841	Bellflower	3924
42842	Belmont	3924
42843	Ben Lomond	3924
42844	Benicia	3924
42845	Berkeley	3924
42846	Beverly Hills	3924
42847	Big Bear Lake	3924
42848	Bloomington	3924
42849	Blythe	3924
42850	Bonita	3924
42851	Bostonia	3924
42852	Brawley	3924
42853	Brea	3924
42854	Brentwood	3924
42855	Brisbane	3924
42856	Brookdale	3924
42857	Buena Park	3924
42858	Burbank	3924
42859	Burlingame	3924
42860	Burnham	3924
42861	Byron	3924
42862	Calabasas	3924
42863	Calexico	3924
42864	California City	3924
42865	Camarillo	3924
42866	Cameron Park	3924
42867	Camino	3924
42868	Camp Pendleton North	3924
42869	Camp Pendleton South	3924
42870	Campbell	3924
42871	Canoga Park	3924
42872	Canyon Lake	3924
42873	Capitola	3924
42874	Carlsbad	3924
42875	Carmel	3924
42876	Carmel Valley	3924
42877	Carmichael	3924
42878	Carpinteria	3924
42879	Carson	3924
42880	Casa de Oro-Mount Helix	3924
42881	Castaic	3924
42882	Castro Valley	3924
42883	Cathedral City	3924
42884	Cayucos	3924
42885	Ceres	3924
42886	Cerritos	3924
42887	Charter Oak	3924
42888	Chatsworth	3924
42889	Cherryland	3924
42890	Chico	3924
42891	Chino	3924
42892	Chino Hills	3924
42893	Chula Vista	3924
42894	Citrus	3924
42895	Citrus Heights	3924
42896	City of Commerce	3924
42897	City of Industry	3924
42898	Claremont	3924
42899	Clearlake	3924
42900	Clovis	3924
42901	Coachella	3924
42902	Coalinga	3924
42903	Colfax	3924
42904	Colton	3924
42905	Colusa	3924
42906	Commerce	3924
42907	Compton	3924
42908	Concord	3924
42909	Corcoran	3924
42910	Corning	3924
42911	Corona	3924
42912	Coronado	3924
42913	Corte Madera	3924
42914	Costa Mesa	3924
42915	Cotati	3924
42916	Cottonwood	3924
42917	Country Club	3924
42918	Covina	3924
42919	Crestline	3924
42920	Cudahy	3924
42921	Culver City	3924
42922	Cupertino	3924
42923	Cypress	3924
42924	Daly City	3924
42925	Dana Point	3924
42926	Danville	3924
42927	Davis	3924
42928	Del Mar	3924
42929	Delano	3924
42930	Desert Hot Springs	3924
42931	Diamond Bar	3924
42932	Dinuba	3924
42933	Dixon	3924
42934	Downey	3924
42935	Duarte	3924
42936	Dublin	3924
42937	East Foothills	3924
42938	East Hemet	3924
42939	East La Mirada	3924
42940	East Palo Alto	3924
42941	East San Gabriel	3924
42942	El Cajon	3924
42943	El Centro	3924
42944	El Cerrito	3924
42945	El Granada	3924
42946	El Monte	3924
42947	El Paso de Robles	3924
42948	El Segundo	3924
42949	El Sobrante	3924
42950	Elk Grove	3924
42951	Emeryville	3924
42952	Encinitas	3924
42953	Encino	3924
42954	Escondido	3924
42955	Etna	3924
42956	Eureka	3924
42957	Exeter	3924
42958	Fair Oaks	3924
42959	Fairfax	3924
42960	Fairfield	3924
42961	Fairview	3924
42962	Fallbrook	3924
42963	Ferndale	3924
42964	Fillmore	3924
42965	Florence-Graham	3924
42966	Florin	3924
42967	Folsom	3924
42968	Fontana	3924
42969	Foothill Farms	3924
42970	Foothill Ranch	3924
42971	Forestville	3924
42972	Fort Bragg	3924
42973	Fortuna	3924
42974	Foster City	3924
42975	Fountain Valley	3924
42976	Freedom	3924
42977	Fremont	3924
42978	Fresno	3924
42979	Fullerton	3924
42980	Galt	3924
42981	Garberville	3924
42982	Garden Acres	3924
42983	Garden Grove	3924
42984	Gardena	3924
42985	Georgetown	3924
42986	Gilroy	3924
42987	Glen Avon	3924
42988	Glendale	3924
42989	Glendora	3924
42990	Goleta	3924
42991	Gonzales	3924
42992	Granada Hills	3924
42993	Grand Terrace	3924
42994	Grass Valley	3924
42995	Greenfield	3924
42996	Grover Beach	3924
42997	Gualala	3924
42998	Guerneville	3924
42999	Hacienda Heights	3924
43000	Half Moon Bay	3924
43001	Hanford	3924
43002	Harbor City	3924
43003	Hawaiian Gardens	3924
43004	Hawthorne	3924
43005	Hayward	3924
43006	Hemet	3924
43007	Hercules	3924
43008	Hermosa Beach	3924
43009	Hesperia	3924
43010	Highland	3924
43011	Hillsborough	3924
43012	Hollister	3924
43013	Hollywood	3924
43014	Huntington Beach	3924
43015	Huntington Park	3924
43016	Idyllwild	3924
43017	Imperial Beach	3924
43018	Indio	3924
43019	Industry	3924
43020	Inglewood	3924
43021	Irvine	3924
43022	Irwindale	3924
43023	Isla Vista	3924
43024	Jackson	3924
43025	Jamul	3924
43026	La Canada Flintridge	3924
43027	La Crescenta-Montrose	3924
43028	La Habra	3924
43029	La Jolla	3924
43030	La Mesa	3924
43031	La Mirada	3924
43032	La Palma	3924
43033	La Presa	3924
43034	La Puente	3924
43035	La Quinta	3924
43036	La Riviera	3924
43037	La Verne	3924
43038	LaVerne	3924
43039	Ladera Ranch	3924
43040	Lafayette	3924
43041	Laguna	3924
43042	Laguna Beach	3924
43043	Laguna Hills	3924
43044	Laguna Niguel	3924
43045	Lake Elsinore	3924
43046	Lake Forest	3924
43047	Lakeside	3924
43048	Lakewood	3924
43049	Lamont	3924
43050	Lancaster	3924
43051	Larkspur	3924
43052	Lawndale	3924
43053	Laytonville	3924
43054	Lemon Grove	3924
43055	Lemoore	3924
43056	Lennox	3924
43057	Linda	3924
43058	Lindsay	3924
43059	Live Oak	3924
43060	Livermore	3924
43061	Livingston	3924
43062	Lodi	3924
43063	Loma Linda	3924
43064	Lomita	3924
43065	Lompoc	3924
43066	Long Beach	3924
43067	Los Alamitos	3924
43068	Los Altos	3924
43069	Los Angeles	3924
43070	Los Angeles East	3924
43071	Los Banos	3924
43072	Los Gatos	3924
43073	Los Olivos	3924
43074	Lynwood	3924
43075	MacKinleyville	3924
43076	Madera	3924
43077	Magalia	3924
43078	Malibu	3924
43079	Mammoth Lakes	3924
43080	Manhattan Beach	3924
43081	Manteca	3924
43082	Marina	3924
43083	Marina del Rey	3924
43084	Mariposa	3924
43085	Marshall	3924
43086	Martinez	3924
43087	Marysville	3924
43088	Maywood	3924
43089	Menlo Park	3924
43090	Merced	3924
43091	Middletown	3924
43092	Midway City	3924
43093	Mill Valley	3924
43094	Millbrae	3924
43095	Milpitas	3924
43096	Mira Loma	3924
43097	Miranda	3924
43098	Mission Viejo	3924
43099	Modesto	3924
43100	Monclair	3924
43101	Monrovia	3924
43102	Montara	3924
43103	Montclair	3924
43104	Montebello	3924
43105	Montecito	3924
43106	Monterey	3924
43107	Monterey Park	3924
43108	Moorpark	3924
43109	Moraga Town	3924
43110	Moreno Valley	3924
43111	Morgan Hill	3924
43112	Morro Bay	3924
43113	Moss Beach	3924
43114	Mount Shasta	3924
43115	Mountain View	3924
43116	Murrieta	3924
43117	N. Hollywood	3924
43118	Napa	3924
43119	National City	3924
43120	Nevada City	3924
43121	Newark	3924
43122	Newport Beach	3924
43123	Norco	3924
43124	North Auburn	3924
43125	North Fair Oaks	3924
43126	North Fork	3924
43127	North Highlands	3924
43128	North Hills	3924
43129	North Hollywood	3924
43130	Northridge	3924
43131	Norwalk	3924
43132	Novato	3924
43133	Nuevo	3924
43134	Oak View	3924
43135	Oakdale	3924
43136	Oakhurst	3924
43137	Oakland	3924
43138	Oakley	3924
43139	Oceanside	3924
43140	Oildale	3924
43141	Ojai	3924
43142	Olivehurst	3924
43143	Ontario	3924
43144	Orange	3924
43145	Orangevale	3924
43146	Orcutt	3924
43147	Oregon House	3924
43148	Orinda	3924
43149	Oroville	3924
43150	Oxnard	3924
43151	Pacific Grove	3924
43152	Pacific Palisades	3924
43153	Pacifica	3924
43154	Pacoima	3924
43155	Pajaro	3924
43156	Palm Desert	3924
43157	Palm Springs	3924
43158	Palmdale	3924
43159	Palo Alto	3924
43160	Palos Verdes Estates	3924
43161	Pamona	3924
43162	Panorama City	3924
43163	Paradise	3924
43164	Paramount	3924
43165	Parkway-South Sacramento	3924
43166	Parlier	3924
43167	Pasadena	3924
43168	Patterson	3924
43169	Pedley	3924
43170	Perris	3924
43171	Petaluma	3924
43172	Pico Rivera	3924
43173	Piedmont	3924
43174	Pinole	3924
43175	Pismo Beach	3924
43176	Pittsburg	3924
43177	Placentia	3924
43178	Placerville	3924
43179	Playa del Rey	3924
43180	Pleasant Hill	3924
43181	Pleasanton	3924
43182	Plymouth	3924
43183	Point Reyes Station	3924
43184	Pollock Pines	3924
43185	Pomona	3924
43186	Port Costa	3924
43187	Port Hueneme	3924
43188	Porterville	3924
43189	Poway	3924
43190	Quartz Hill	3924
43191	Ramona	3924
43192	Rancho Cordova	3924
43193	Rancho Cucamonga	3924
43194	Rancho Dominguez	3924
43195	Rancho Mirage	3924
43196	Rancho Murieta	3924
43197	Rancho Palos Verdes	3924
43198	Rancho San Diego	3924
43199	Rancho Santa Margarita	3924
43200	Red Bluff	3924
43201	Redding	3924
43202	Redlands	3924
43203	Redondo Beach	3924
43204	Redway	3924
43205	Redwood City	3924
43206	Reedley	3924
43207	Reseda	3924
43208	Rialto	3924
43209	Richmond	3924
43210	Ridgecrest	3924
43211	Rio Linda	3924
43212	Rio Nido	3924
43213	Rio del Mar	3924
43214	Riverbank	3924
43215	Riverside	3924
43216	Rocklin	3924
43217	Rohnert Park	3924
43218	Rolling Hills	3924
43219	Rosamond	3924
43220	Roseland	3924
43221	Rosemead	3924
43222	Rosemont	3924
43223	Roseville	3924
43224	Rossmoor	3924
43225	Rowland Heights	3924
43226	Rubidoux	3924
43227	Sacramento	3924
43228	Salinas	3924
43229	San Anselmo	3924
43230	San Bernardino	3924
43231	San Bruno	3924
43232	San Buenaventura	3924
43233	San Carlos	3924
43234	San Clemente	3924
43235	San Diego	3924
43236	San Dimas	3924
43237	San Fernando	3924
43238	San Francisco	3924
43239	San Gabriel	3924
43240	San Jacinto	3924
43241	San Jose	3924
43242	San Juan Capistrano	3924
43243	San Leandro	3924
43244	San Lorenzo	3924
43245	San Luis Obispo	3924
43246	San Marcos	3924
43247	San Marino	3924
43248	San Mateo	3924
43249	San Pablo	3924
43250	San Pedro	3924
43251	San Rafael	3924
43252	San Ramon	3924
43253	San Ysidro	3924
43254	Sanger	3924
43255	Santa Ana	3924
43256	Santa Barbara	3924
43257	Santa Clara	3924
43258	Santa Clarita	3924
43259	Santa Cruz	3924
43260	Santa Fe Springs	3924
43261	Santa Maria	3924
43262	Santa Monica	3924
43263	Santa Paula	3924
43264	Santa Rosa	3924
43265	Santa Ynez	3924
43266	Santee	3924
43267	Saratoga	3924
43268	Sausalito	3924
43269	Scotts Valley	3924
43270	Seal Beach	3924
43271	Seaside	3924
43272	Sebastopol	3924
43273	Selma	3924
43274	Shafter	3924
43275	Sherman Oaks	3924
43276	Sierra Madre	3924
43277	Signal Hill	3924
43278	Simi Valley	3924
43279	Solana Beach	3924
43280	Soledad	3924
43281	Solvang	3924
43282	Sonoma	3924
43283	Sonora	3924
43284	Soquel	3924
43285	South El Monte	3924
43286	South Gate	3924
43287	South Lake Tahoe	3924
43288	South Pasadena	3924
43289	South San Francisco	3924
43290	South San Jose Hills	3924
43291	South Whittier	3924
43292	South Yuba City	3924
43293	Spring Valley	3924
43294	St. Helena	3924
43295	Stanford	3924
43296	Stanton	3924
43297	Stevenson Ranch	3924
43298	Stockton	3924
43299	Strathmore	3924
43300	Studio City	3924
43301	Suisun City	3924
43302	Sun City	3924
43303	Sun Valley	3924
43304	Sunland	3924
43305	Sunnyvale	3924
43306	Susanville	3924
43307	Sutter	3924
43308	Sylmar	3924
43309	Tahoe City	3924
43310	Tamalpais-Homestead Valley	3924
43311	Tarzana	3924
43312	Tehachapi	3924
43313	Temecula	3924
43314	Temple City	3924
43315	Thousand Oaks	3924
43316	Tiburon	3924
43317	Topanga	3924
43318	Torrance	3924
43319	Trabuco Canyon	3924
43320	Tracy	3924
43321	Trinidad	3924
43322	Trona	3924
43323	Truckee	3924
43324	Tujunga	3924
43325	Tulare	3924
43326	Turlock	3924
43327	Tustin	3924
43328	Tustin Foothills	3924
43329	Twentynine Palms	3924
43330	Twentynine Palms Base	3924
43331	Ukiah	3924
43332	Union City	3924
43333	Upland	3924
43334	Vacaville	3924
43335	Valencia	3924
43336	Valinda	3924
43337	Valle Vista	3924
43338	Vallejo	3924
43339	Valley Center	3924
43340	Valley Glen	3924
43341	Valley Village	3924
43342	Van Nuys	3924
43343	Vandenberg Air Force Base	3924
43344	Venice	3924
43345	Ventura	3924
43346	Vernon	3924
43347	Victorville	3924
43348	View Park-Windsor Hills	3924
43349	Vincent	3924
43350	Visalia	3924
43351	Vista	3924
43352	Walnut	3924
43353	Walnut Creek	3924
43354	Walnut Park	3924
43355	Wasco	3924
43356	Waterford	3924
43357	Watsonville	3924
43358	West Athens	3924
43359	West Carson	3924
43360	West Covina	3924
43361	West Hills	3924
43362	West Hollywood	3924
43363	West Puente Valley	3924
43364	West Sacramento	3924
43365	West Whittier-Los Nietos	3924
43366	Westlake Village	3924
43367	Westminster	3924
43368	Westmont	3924
43369	Whittier	3924
43370	Wildomar	3924
43371	Willits	3924
43372	Willowbrook	3924
43373	Wilmington	3924
43374	Windsor	3924
43375	Woodland	3924
43376	Woodland Hills	3924
43377	Yorba Linda	3924
43378	Yreka	3924
43379	Yuba City	3924
43380	Yucaipa	3924
43381	Yucca Valley	3924
43382	Air Force Academy	3926
43383	Alamosa	3926
43384	Applewood	3926
43385	Arvada	3926
43386	Aspen	3926
43387	Aurora	3926
43388	Avon	3926
43389	Basalt	3926
43390	Bellvue	3926
43391	Black Forest	3926
43392	Boulder	3926
43393	Brighton	3926
43394	Broomfield	3926
43395	Canon City	3926
43396	Carbondale	3926
43397	Castle Rock	3926
43398	Castlewood	3926
43399	Centennial	3926
43400	Cimarron Hills	3926
43401	Clifton	3926
43402	Colorado Springs	3926
43403	Columbine	3926
43404	Commerce City	3926
43405	Cortez	3926
43406	Crawford	3926
43407	Denver	3926
43408	Durango	3926
43409	Edwards	3926
43410	Elizabeth	3926
43411	Englewood	3926
43412	Estes Park	3926
43413	Evergreen	3926
43414	Federal Heights	3926
43415	Fort Carson	3926
43416	Fort Collins	3926
43417	Fort Morgan	3926
43418	Fountain	3926
43419	Golden	3926
43420	Grand Junction	3926
43421	Greeley	3926
43422	Greenwood Village	3926
43423	Gunbarrel	3926
43424	Highlands Ranch	3926
43425	Holly	3926
43426	Ken Caryl	3926
43427	Lafayette	3926
43428	Lakewood	3926
43429	Littleton	3926
43430	Longmont	3926
43431	Louisville	3926
43432	Loveland	3926
43433	Lyons	3926
43434	Montrose	3926
43435	Monument	3926
43436	Nederland	3926
43437	Niwot	3926
43438	Northglenn	3926
43439	Pagosa Springs	3926
43440	Parker	3926
43441	Penrose	3926
43442	Peyton	3926
43443	Pueblo	3926
43444	Redlands	3926
43445	Ridgway	3926
43446	Rifle	3926
43447	Rocky Ford	3926
43448	Sanford	3926
43449	Security-Widefield	3926
43450	Sherrelwood	3926
43451	Silver Cliff	3926
43452	Snowmass Village	3926
43453	Southglenn	3926
43454	Steamboat Springs	3926
43455	Sterling	3926
43456	Superior	3926
43457	Telluride	3926
43458	Thornton	3926
43459	Vail	3926
43460	Welby	3926
43461	Westcliffe	3926
43462	Westminster	3926
43463	Wheat Ridge	3926
43464	Woodland Park	3926
43465	Ansonia	3927
43466	Avon	3927
43467	Bethel	3927
43468	Bethlehem	3927
43469	Bloomfield	3927
43470	Branford	3927
43471	Bridgeport	3927
43472	Bristol	3927
43473	Canaan	3927
43474	Canton	3927
43475	Central Manchester	3927
43476	Cheshire	3927
43477	Colchester	3927
43478	Conning Towers-Nautilus Park	3927
43479	Coscob	3927
43480	Cranbury	3927
43481	Cromwell	3927
43482	Danbury	3927
43483	Darien	3927
43484	Dayville	3927
43485	Derby	3927
43486	East Hartford	3927
43487	East Haven	3927
43488	Ellington	3927
43489	Enfield	3927
43490	Fairfield	3927
43491	Farmington	3927
43492	Glastonbury	3927
43493	Greens Farms	3927
43494	Greenwich	3927
43495	Groton	3927
43496	Guilford	3927
43497	Haddam	3927
43498	Hamden	3927
43499	Hartford	3927
43500	Harwinton	3927
43501	Lakeville	3927
43502	Lyme	3927
43503	Madison	3927
43504	Manchester	3927
43505	Meriden	3927
43506	Middletown	3927
43507	Milford	3927
43508	Monroe	3927
43509	Mystic	3927
43510	Naugatuck	3927
43511	New Britain	3927
43512	New Canaan	3927
43513	New Hartford	3927
43514	New Haven	3927
43515	New London	3927
43516	New Milford	3927
43517	New Town	3927
43518	Newington	3927
43519	North Haven	3927
43520	North Stonington	3927
43521	Norwalk	3927
43522	Norwich	3927
43523	Old Saybrook	3927
43524	Oneco	3927
43525	Orange	3927
43526	Pawcatuck	3927
43527	Plainville	3927
43528	Portland	3927
43529	Putnam	3927
43530	Riverside	3927
43531	Rocky Hill	3927
43532	Rowayton	3927
43533	Sandy Hook	3927
43534	Seymour	3927
43535	Sharon	3927
43536	Shelton	3927
43537	South Windsor	3927
43538	Southington	3927
43539	Southport	3927
43540	Stamford	3927
43541	Sterling	3927
43542	Storrs	3927
43543	Stratford	3927
43544	Suffield	3927
43545	Taftville	3927
43546	Terryville	3927
43547	Tolland	3927
43548	Torrington	3927
43549	Trumbull	3927
43550	Vernon	3927
43551	Wallingford Center	3927
43552	Waterbury	3927
43553	Watertown	3927
43554	West Hartford	3927
43555	West Haven	3927
43556	Weston	3927
43557	Westport	3927
43558	Wethersfield	3927
43559	Willimantic	3927
43560	Wilton	3927
43561	Windsor	3927
43562	Windsor Locks	3927
43563	Winsted	3927
43564	Woodbury	3927
43565	Woodstock	3927
43566	pomfret	3927
43567	Bear	3928
43568	Brookside	3928
43569	Claymont	3928
43570	Dover	3928
43571	Dover Base Housing	3928
43572	Edgemoor	3928
43573	Elsmere	3928
43574	Georgetown	3928
43575	Greenville	3928
43576	Middletown	3928
43577	Milford	3928
43578	Milton	3928
43579	Newark	3928
43580	Pike Creek	3928
43581	Seaford	3928
43582	Smyrna	3928
43583	Stanton	3928
43584	Talleyville	3928
43585	Wilmington	3928
43586	Wilmington Manor	3928
43587	Alachua	3930
43588	Altamonte Springs	3930
43589	Apopka	3930
43590	Atlantic Beach	3930
43591	Auburndale	3930
43592	Aventura	3930
43593	Avon Park	3930
43594	Azalea Park	3930
43595	Bal Harbour	3930
43596	Bartow	3930
43597	Bayonet Point	3930
43598	Bayshore Gardens	3930
43599	Beach	3930
43600	Bellair-Meadowbrook Terrace	3930
43601	Belle Glade	3930
43602	Bellview	3930
43603	Beverly Hills	3930
43604	Bloomingdale	3930
43605	Boca Raton	3930
43606	Boca del Mar	3930
43607	Bonita Springs	3930
43608	Boynton Beach	3930
43609	Bradenton	3930
43610	Brandon	3930
43611	Brent	3930
43612	Brooksville	3930
43613	Brownsville	3930
43614	Buena Ventura Lakes	3930
43615	Bunnell	3930
43616	Callaway	3930
43617	Cape Coral	3930
43618	Carol City	3930
43619	Casselberry	3930
43620	Catalina Foothills	3930
43621	Celebration	3930
43622	Century Village	3930
43623	Citrus Park	3930
43624	Clearwater	3930
43625	Clermont	3930
43626	Cocoa	3930
43627	Cocoa Beach	3930
43628	Coconut Creek	3930
43629	Coconut Grove	3930
43630	Conway	3930
43631	Cooper City	3930
43632	Coral Gables	3930
43633	Coral Springs	3930
43634	Coral Terrace	3930
43635	Cortlandt Manor	3930
43636	Country Club	3930
43637	Crestview	3930
43638	Crystal River	3930
43639	Cutler	3930
43640	Cutler Ridge	3930
43641	Cypress Gardens	3930
43642	Cypress Lake	3930
43643	Dania	3930
43644	Dania Beach	3930
43645	Davie	3930
43646	Daytona Beach	3930
43647	De Bary	3930
43648	De Funiak Springs	3930
43649	De Land	3930
43650	Debary	3930
43651	Deer Park	3930
43652	Deerfield Beach	3930
43653	Del Rio	3930
43654	Delray Beach	3930
43655	Deltona	3930
43656	Destin	3930
43657	Doctor Phillips	3930
43658	Dora	3930
43659	Doral	3930
43660	Dundee	3930
43661	Dunedin	3930
43662	East Lake	3930
43663	Edgewater	3930
43664	Eglin Air Force Base	3930
43665	Egypt Lake-Leto	3930
43666	Elfers	3930
43667	Englewood	3930
43668	Ensley	3930
43669	Eustis	3930
43670	Fairview Shores	3930
43671	Fern Park	3930
43672	Fernandina Beach	3930
43673	Ferry Pass	3930
43674	Flagler Beach	3930
43675	Floral City	3930
43676	Florida City	3930
43677	Florida Ridge	3930
43678	Forest City	3930
43679	Fort Lauderdale	3930
43680	Fort Myers	3930
43681	Fort Myers Beach	3930
43682	Fort Pierce	3930
43683	Fort Walton Beach	3930
43684	Freeport	3930
43685	Fruitville	3930
43686	Ft. Lauderdale	3930
43687	Gainesville	3930
43688	Gladeview	3930
43689	Glenvar Heights	3930
43690	Golden Gate	3930
43691	Golden Glades	3930
43692	Goldenrod	3930
43693	Greater Carrollwood	3930
43694	Greater Northdale	3930
43695	Green Cove Springs	3930
43696	Greenacres	3930
43697	Gulf Gate Estates	3930
43698	Gulfport	3930
43699	Haines City	3930
43700	Hallandale	3930
43701	Hallandale Beach	3930
43702	Hammocks	3930
43703	Hamptons at Boca Raton	3930
43704	Havana	3930
43705	Hialeah	3930
43706	Hialeah Gardens	3930
43707	Highpoint	3930
43708	Hobe Sound	3930
43709	Holiday	3930
43710	Holly Hill	3930
43711	Hollywood	3930
43712	Homestead	3930
43713	Homosassa	3930
43714	Hudson	3930
43715	Immokalee	3930
43716	Inverness	3930
43717	Iona	3930
43718	Ives Estates	3930
43719	Jacksonville	3930
43720	Jacksonville Beach	3930
43721	Jasmine Estates	3930
43722	Jensen Beach	3930
43723	Jupiter	3930
43724	Kendale Lakes	3930
43725	Kendall	3930
43726	Kendall West	3930
43727	Key Biscayne	3930
43728	Key Largo	3930
43729	Key West	3930
43730	Kings Point	3930
43731	Kissimmee	3930
43732	Lady Lake	3930
43733	Lake Alfred	3930
43734	Lake City	3930
43735	Lake Lucerne	3930
43736	Lake Magdalene	3930
43737	Lake Mary	3930
43738	Lake Placid	3930
43739	Lake Wales	3930
43740	Lake Worth	3930
43741	Lakeland	3930
43742	Lakeland Highlands	3930
43743	Lakeside	3930
43744	Land OLakes	3930
43745	Largo	3930
43746	Lauderdale Lakes	3930
43747	Lauderhill	3930
43748	Laurel	3930
43749	Lecanto	3930
43750	Leesburg	3930
43751	Lehigh Acres	3930
43752	Leisure City	3930
43753	Lighthouse Point	3930
43754	Lockhart	3930
43755	Longwood	3930
43756	Loxahatchee	3930
43757	Lutz	3930
43758	Lynn Haven	3930
43759	Madison	3930
43760	Maitland	3930
43761	Mango	3930
43762	Marathon	3930
43763	Marco	3930
43764	Margate	3930
43765	Medley	3930
43766	Melbourne	3930
43767	Merritt Island	3930
43768	Miami	3930
43769	Miami Beach	3930
43770	Miami Gardens	3930
43771	Miami Lakes	3930
43772	Miami Shores	3930
43773	Miami Springs	3930
43774	Micco	3930
43775	Milton	3930
43776	Mims	3930
43777	Miramar	3930
43778	Mulberry	3930
43779	Myrtle Grove	3930
43780	Naples	3930
43781	Naples Park	3930
43782	Naranja	3930
43783	New Port Richey	3930
43784	New Port Richey East	3930
43785	New Smyrna Beach	3930
43786	Niceville	3930
43787	Nokomis	3930
43788	Norland	3930
43789	North Andrews Gardens	3930
43790	North Fort Myers	3930
43791	North Lauderdale	3930
43792	North Miami	3930
43793	North Miami Beach	3930
43794	North Naples	3930
43795	North Palm Beach	3930
43796	North Port	3930
43797	Oak Ridge	3930
43798	Oakland Park	3930
43799	Ocala	3930
43800	Ocoee	3930
43801	Ojus	3930
43802	Okeechobee	3930
43803	Oldsmar	3930
43804	Olympia Heights	3930
43805	Opa-locka	3930
43806	Orange City	3930
43807	Orange Park	3930
43808	Orlando	3930
43809	Ormond Beach	3930
43810	Ormond-by-the-Sea	3930
43811	Osprey	3930
43812	Oviedo	3930
43813	Palatka	3930
43814	Palm Bay	3930
43815	Palm Beach	3930
43816	Palm Beach Gardens	3930
43817	Palm City	3930
43818	Palm Coast	3930
43819	Palm Harbor	3930
43820	Palm River-Clair Mel	3930
43821	Palm Valley	3930
43822	Palmetto	3930
43823	Palmetto Estates	3930
43824	Panama City	3930
43825	Parkland	3930
43826	Pembroke Park	3930
43827	Pembroke Pines	3930
43828	Pensacola	3930
43829	Perrine	3930
43830	Pine Castle	3930
43831	Pine Hills	3930
43832	Pinellas Park	3930
43833	Pinewood	3930
43834	Plant City	3930
43835	Plantation	3930
43836	Pompano Beach	3930
43837	Pompano Beach Highlands	3930
43838	Ponte Vedra	3930
43839	Port Charlotte	3930
43840	Port Orange	3930
43841	Port Saint John	3930
43842	Port Saint Lucie	3930
43843	Punta Gorda	3930
43844	Quincy	3930
43845	Redington Shores	3930
43846	Richmond Heights	3930
43847	Richmond West	3930
43848	Riverview	3930
43849	Riviera Beach	3930
43850	Rockledge	3930
43851	Royal Palm Beach	3930
43852	Safety Harbor	3930
43853	Saint Augustine	3930
43854	Saint Cloud	3930
43855	Saint Petersburg	3930
43856	Saint Petersburg Beach	3930
43857	San Carlos Park	3930
43858	Sandalfoot Cove	3930
43859	Sanford	3930
43860	Sanibel	3930
43861	Sarasota	3930
43862	Sarasota Springs	3930
43863	Satellite Beach	3930
43864	Scott Lake	3930
43865	Sebastian	3930
43866	Seminole	3930
43867	Shalimar	3930
43868	South Bradenton	3930
43869	South Daytona	3930
43870	South Miami	3930
43871	South Miami Heights	3930
43872	South Patrick Shores	3930
43873	South Venice	3930
43874	Spring Hill	3930
43875	Stuart	3930
43876	Sun City Center	3930
43877	Sunny Isles	3930
43878	Sunrise	3930
43879	Sunset	3930
43880	Sweetwater	3930
43881	Tallahassee	3930
43882	Tamarac	3930
43883	Tamiami	3930
43884	Tampa	3930
43885	Tarpon Springs	3930
43886	Temple Terrace	3930
43887	The Crossings	3930
43888	The Hammocks	3930
43889	Titusville	3930
43890	TownnCountry	3930
43891	University	3930
43892	University Park	3930
43893	Valrico	3930
43894	Venice	3930
43895	Vero Beach	3930
43896	Vero Beach South	3930
43897	Villas	3930
43898	Warrington	3930
43899	Wekiva Springs	3930
43900	Wellington	3930
43901	Wesley Chapel	3930
43902	West Little River	3930
43903	West Palm Beach	3930
43904	West Park	3930
43905	West Pensacola	3930
43906	West and East Lealman	3930
43907	Westchester	3930
43908	Weston	3930
43909	Westview	3930
43910	Westwood Lakes	3930
43911	Wilton Manors	3930
43912	Windermere	3930
43913	Winston	3930
43914	Winter Garden	3930
43915	Winter Haven	3930
43916	Winter Park	3930
43917	Winter Springs	3930
43918	Wright	3930
43919	Yeehaw Junction	3930
43920	Acworth	3931
43921	Adel	3931
43922	Albany	3931
43923	Alma	3931
43924	Alpharetta	3931
43925	Americus	3931
43926	Athens	3931
43927	Athens-Clarke	3931
43928	Atlanta	3931
43929	Auburn	3931
43930	Augusta-Richmond	3931
43931	Austell	3931
43932	Bainbridge	3931
43933	Barnesville	3931
43934	Belvedere Park	3931
43935	Bogart	3931
43936	Bowdon	3931
43937	Braselton	3931
43938	Brunswick	3931
43939	Buford	3931
43940	Byron	3931
43941	Cairo	3931
43942	Calhoun	3931
43943	Candler-MacAfee	3931
43944	Canton	3931
43945	Carrollton	3931
43946	Cartersville	3931
43947	Chamblee	3931
43948	Clarkston	3931
43949	Cochran	3931
43950	College Park	3931
43951	Columbus	3931
43952	Comer	3931
43953	Conley	3931
43954	Conyers	3931
43955	Cordele	3931
43956	Covington	3931
43957	Culloden	3931
43958	Cumming	3931
43959	Dacula	3931
43960	Dahlonega	3931
43961	Dallas	3931
43962	Dalton	3931
43963	Decatur	3931
43964	Dewy Rose	3931
43965	Doraville	3931
43966	Douglas	3931
43967	Douglasville	3931
43968	Druid Hills	3931
43969	Dublin	3931
43970	Duluth	3931
43971	Dunwoody	3931
43972	East Point	3931
43973	Elberton	3931
43974	Ellenwood	3931
43975	Ellijay	3931
43976	Evans	3931
43977	Fairmount	3931
43978	Fayetteville	3931
43979	Flowery Branch	3931
43980	Folkston	3931
43981	Forest Park	3931
43982	Fort Benning South	3931
43983	Fort Gordon	3931
43984	Fort Stewart	3931
43985	Fort Valley	3931
43986	Foxborough	3931
43987	Gaines School	3931
43988	Gainesville	3931
43989	Glennville	3931
43990	Gresham Park	3931
43991	Griffin	3931
43992	Grovetown	3931
43993	Hampton	3931
43994	Hartwell	3931
43995	Hinesville	3931
43996	Jackson	3931
43997	Jonesboro	3931
43998	Kennesaw	3931
43999	Kingsland	3931
44000	LaGrange	3931
44001	Lawrenceville	3931
44002	Lilburn	3931
44003	Lithia Springs	3931
44004	Lithonia	3931
44005	Locust Grove	3931
44006	Loganville	3931
44007	Louisville	3931
44008	Mableton	3931
44009	Macon	3931
44010	Madison	3931
44011	Marietta	3931
44012	Martinez	3931
44013	McDonough	3931
44014	Milledgeville	3931
44015	Monroe	3931
44016	Morrow	3931
44017	Moultrie	3931
44018	Mountain	3931
44019	Mountain Park	3931
44020	Newnan	3931
44021	Norcross	3931
44022	North Atlanta	3931
44023	North Decatur	3931
44024	North Druid Hills	3931
44025	Oakwood	3931
44026	Panthersville	3931
44027	Peachtree City	3931
44028	Powder Springs	3931
44029	Redan	3931
44030	Rex	3931
44031	Riverdale	3931
44032	Rome	3931
44033	Rossville	3931
44034	Roswell	3931
44035	Saint Marys	3931
44036	Saint Simons	3931
44037	Sandy Springs	3931
44038	Savannah	3931
44039	Scottdale	3931
44040	Sharpsburg	3931
44041	Smyrna	3931
44042	Snellville	3931
44043	Sparks	3931
44044	Statesboro	3931
44045	Stockbridge	3931
44046	Stone Mountain	3931
44047	Suwanee	3931
44048	Thomasville	3931
44049	Tifton	3931
44050	Tucker	3931
44051	Tybee Island	3931
44052	Union City	3931
44053	Valdosta	3931
44054	Vidalia	3931
44055	Villa Rica	3931
44056	Warner Robins	3931
44057	Waycross	3931
44058	Wilmington Island	3931
44059	Winder	3931
44060	Woodbine	3931
44061	Woodstock	3931
44062	Ahuimanu	3932
44063	Aiea	3932
44064	Aliamanu	3932
44065	Ewa Beach	3932
44066	Haiku	3932
44067	Halawa	3932
44068	Hanalei	3932
44069	Hilo	3932
44070	Holualoa	3932
44071	Honolulu	3932
44072	Kahului	3932
44073	Kailua	3932
44074	Kalaheo	3932
44075	Kamuela	3932
44076	Kaneohe	3932
44077	Kaneohe Station	3932
44078	Kapaa	3932
44079	Kapolei	3932
44080	Kihei	3932
44081	Kula	3932
44082	Lahaina	3932
44083	Lanai City	3932
44084	Lihue	3932
44085	Makaha	3932
44086	Makakilo City	3932
44087	Makawao	3932
44088	Mi-Wuk Village	3932
44089	Mililani Town	3932
44090	Naalehu	3932
44091	Nanakuli	3932
44092	Pahoa	3932
44093	Pearl City	3932
44094	Schofield Barracks	3932
44095	Wahiawa	3932
44096	Waialua	3932
44097	Waianae	3932
44098	Wailuku	3932
44099	Waimalu	3932
44100	Waipahu	3932
44101	Waipio	3932
44102	Blackfoot	3933
44103	Boise	3933
44104	Boise City	3933
44105	Boulder Hill	3933
44106	Burley	3933
44107	Caldwell	3933
44108	Coeur dAlene	3933
44109	Eagle	3933
44110	Garden City	3933
44111	Idaho Falls	3933
44112	Lewiston	3933
44113	Meridian	3933
44114	Moscow	3933
44115	Mountain Home	3933
44116	Nampa	3933
44117	Payette	3933
44118	Pocatello	3933
44119	Post Falls	3933
44120	Preston	3933
44121	Rexburg	3933
44122	Rigby	3933
44123	Sandpoint	3933
44124	Troy	3933
44125	Twin Falls	3933
44126	Addison	3934
44127	Algonquin	3934
44128	Alsip	3934
44129	Alton	3934
44130	Arlington Heights	3934
44131	Aurora	3934
44132	Bannockburn	3934
44133	Barrington	3934
44134	Bartlett	3934
44135	Batavia	3934
44136	Beach Park	3934
44137	Beardstown	3934
44138	Bedford Park	3934
44139	Belleville	3934
44140	Bellwood	3934
44141	Belvidere	3934
44142	Bensenville	3934
44143	Berwyn	3934
44144	Bloomingdale	3934
44145	Bloomington	3934
44146	Blue Island	3934
44147	Boling Brook	3934
44148	Bolingbrook	3934
44149	Bourbonnais	3934
44150	Bradley	3934
44151	Breese	3934
44152	Bridgeview	3934
44153	Brimfield	3934
44154	Broadview	3934
44155	Brookfield	3934
44156	Buffalo Grove	3934
44157	Burbank	3934
44158	Burr Ridge	3934
44159	Cahokia	3934
44160	Calumet City	3934
44161	Canton	3934
44162	Carbondale	3934
44163	Carlinville	3934
44164	Carol Stream	3934
44165	Carpentersville	3934
44166	Carthage	3934
44167	Cary	3934
44168	Centralia	3934
44169	Champaign	3934
44170	Channahon	3934
44171	Charleston	3934
44172	Chicago	3934
44173	Chicago Heights	3934
44174	Chicago Ridge	3934
44175	Cicero	3934
44176	Coal City	3934
44177	Collinsville	3934
44178	Congerville	3934
44179	Country Club Hills	3934
44180	Crest Hill	3934
44181	Crestwood	3934
44182	Crystal Lake	3934
44183	Danville	3934
44184	Darien	3934
44185	DeKalb	3934
44186	Decatur	3934
44187	Deerfield	3934
44188	Des Plaines	3934
44189	Dixon	3934
44190	Dolton	3934
44191	Downers Grove	3934
44192	Earlville	3934
44193	East Dundee	3934
44194	East Moline	3934
44195	East Peoria	3934
44196	East Saint Louis	3934
44197	Edwardsville	3934
44198	Effingham	3934
44199	Elburn	3934
44200	Elgin	3934
44201	Elk Grove	3934
44202	Elk Grove Village	3934
44203	Elmhurst	3934
44204	Elmwood Park	3934
44205	Evanston	3934
44206	Evergreen Park	3934
44207	Fairview Heights	3934
44208	Flossmoor	3934
44209	Forest Park	3934
44210	Frankfort	3934
44211	Franklin Park	3934
44212	Freeport	3934
44213	Galena	3934
44214	Galesburg	3934
44215	Geneva	3934
44216	Genoa	3934
44217	Glen Carbon	3934
44218	Glen Ellyn	3934
44219	Glencoe	3934
44220	Glendale Heights	3934
44221	Glenview	3934
44222	Godfrey	3934
44223	Goodings Grove	3934
44224	Granite City	3934
44225	Grayslake	3934
44226	Gurnee	3934
44227	Hamilton	3934
44228	Hampshire	3934
44229	Hanover Park	3934
44230	Harvard	3934
44231	Harvey	3934
44232	Hawthorn Woods	3934
44233	Hazel Crest	3934
44234	Herrin	3934
44235	Hickory Hills	3934
44236	Highland Park	3934
44237	Hinsdale	3934
44238	Hoffman Estates	3934
44239	Homewood	3934
44240	Huntley	3934
44241	Illinois City	3934
44242	Ingleside	3934
44243	Itasca	3934
44244	Jacksonville	3934
44245	Johnston City	3934
44246	Joliet	3934
44247	Justice	3934
44248	Kankakee	3934
44249	Kenilworth	3934
44250	Kewanee	3934
44251	La Grange	3934
44252	La Grange Park	3934
44253	La Salle	3934
44254	Lake Bluff	3934
44255	Lake Forest	3934
44256	Lake Zurich	3934
44257	Lake in the Hills	3934
44258	Lansing	3934
44259	Lemont	3934
44260	Libertyville	3934
44261	Lincoln	3934
44262	Lincolnwood	3934
44263	Lindenhurst	3934
44264	Lindenwood	3934
44265	Lisle	3934
44266	Lockport	3934
44267	Lombard	3934
44268	Long Grove	3934
44269	Loves Park	3934
44270	Lyons	3934
44271	MacHenry	3934
44272	Machesney Park	3934
44273	Macomb	3934
44274	Marion	3934
44275	Markham	3934
44276	Marshall	3934
44277	Martinsville	3934
44278	Maryville	3934
44279	Matteson	3934
44280	Mattoon	3934
44281	Maywood	3934
44282	McHenry	3934
44283	Melrose Park	3934
44284	Midlothian	3934
44285	Milan	3934
44286	Minooka	3934
44287	Mokena	3934
44288	Moline	3934
44289	Momence	3934
44290	Montgomery	3934
44291	Monticello	3934
44292	Morris	3934
44293	Morton	3934
44294	Morton Grove	3934
44295	Mossville	3934
44296	Mount Prospect	3934
44297	Mount Vernon	3934
44298	Mount Zion	3934
44299	Mundelein	3934
44300	Naperville	3934
44301	New Lenox	3934
44302	Niles	3934
44303	Normal	3934
44304	Norridge	3934
44305	North Aurora	3934
44306	North Chicago	3934
44307	Northbrook	3934
44308	Northfield	3934
44309	Northlake	3934
44310	OFallon	3934
44311	Oak Forest	3934
44312	Oak Lawn	3934
44313	Oak Park	3934
44314	Oakbrook	3934
44315	Oakwood	3934
44316	Olney	3934
44317	Orland Park	3934
44318	Osco	3934
44319	Ottawa	3934
44320	Palatine	3934
44321	Palos Heights	3934
44322	Palos Hills	3934
44323	Park Forest	3934
44324	Park Ridge	3934
44325	Pekin	3934
44326	Peoria	3934
44327	Peru	3934
44328	Plainfield	3934
44329	Pontiac	3934
44330	Princeton	3934
44331	Prospect Heights	3934
44332	Quincy	3934
44333	Ramsey	3934
44334	Rantoul	3934
44335	Richmond	3934
44336	Richton Park	3934
44337	River Forest	3934
44338	Riverdale	3934
44339	Rochelle	3934
44340	Rock Island	3934
44341	Rockford	3934
44342	Rolling Meadows	3934
44343	Romeoville	3934
44344	Roscoe	3934
44345	Roselle	3934
44346	Round Lake Beach	3934
44347	Saint Charles	3934
44348	Sauget	3934
44349	Sauk Village	3934
44350	Schaumburg	3934
44351	Schiller Park	3934
44352	Shumway	3934
44353	Skokie	3934
44354	South Elgin	3934
44355	South Holland	3934
44356	Spring Valley	3934
44357	Springfield	3934
44358	Sterling	3934
44359	Streamwood	3934
44360	Streator	3934
44361	Swansea	3934
44362	Sycamore	3934
44363	Taylorville	3934
44364	Tinley Park	3934
44365	Trenton	3934
44366	Urbana	3934
44367	Ursa	3934
44368	Vernon Hills	3934
44369	Villa Park	3934
44370	Walnut	3934
44371	Warrenville	3934
44372	Washington	3934
44373	Waukegan	3934
44374	West Chicago	3934
44375	West Dundee	3934
44376	Westchester	3934
44377	Western Springs	3934
44378	Westmont	3934
44379	Wheaton	3934
44380	Wheeling	3934
44381	Willowbrook	3934
44382	Wilmette	3934
44383	Winnebago	3934
44384	Winnetka	3934
44385	Wood Dale	3934
44386	Wood River	3934
44387	Woodridge	3934
44388	Woodstock	3934
44389	Worth	3934
44390	Zion	3934
44391	Albion	3935
44392	Anderson	3935
44393	Angola	3935
44394	Auburn	3935
44395	Bedford	3935
44396	Beech Grove	3935
44397	Bloomington	3935
44398	Brownsburg	3935
44399	Carmel	3935
44400	Cedar Lake	3935
44401	Chesterton	3935
44402	Clarksville	3935
44403	Columbus	3935
44404	Connersville	3935
44405	Crawfordsville	3935
44406	Crown Point	3935
44407	Dyer	3935
44408	East Chicago	3935
44409	Elkhart	3935
44410	Evansville	3935
44411	Fishers	3935
44412	Fort Wayne	3935
44413	Frankfort	3935
44414	Franklin	3935
44415	Gary	3935
44416	Goshen	3935
44417	Gosport	3935
44418	Granger	3935
44419	Greenfield	3935
44420	Greensburg	3935
44421	Greenwood	3935
44422	Griffith	3935
44423	Hammond	3935
44424	Helmsburg	3935
44425	Highland	3935
44426	Hobart	3935
44427	Huntington	3935
44428	Indianapolis	3935
44429	Jasper	3935
44430	Jeffersonville	3935
44431	Knightstown	3935
44432	Kokomo	3935
44433	La Porte	3935
44434	Lafayette	3935
44435	Lake Station	3935
44436	Lawrence	3935
44437	Lebanon	3935
44438	Liberty	3935
44439	Logansport	3935
44440	Madison	3935
44441	Marion	3935
44442	Martinsville	3935
44443	Merrillville	3935
44444	Michigan City	3935
44445	Mishawaka	3935
44446	Muncie	3935
44447	Munster	3935
44448	N. Albany	3935
44449	Nashville	3935
44450	New Albany	3935
44451	New Castle	3935
44452	New Haven	3935
44453	New Trenton	3935
44454	Noblesville	3935
44455	North Vernon	3935
44456	Osceola	3935
44457	Peru	3935
44458	Plainfield	3935
44459	Plymouth	3935
44460	Poland	3935
44461	Portage	3935
44462	Richmond	3935
44463	Rising Sun	3935
44464	Roanoke	3935
44465	Rockport	3935
44466	Schererville	3935
44467	Scottsburg	3935
44468	Seymour	3935
44469	Shelbyville	3935
44470	South Bend	3935
44471	Speedway	3935
44472	St. John	3935
44473	Terre Haute	3935
44474	Thorntown	3935
44475	Tippecanoe	3935
44476	Troy	3935
44477	Valparaiso	3935
44478	Vermont	3935
44479	Vincennes	3935
44480	Wabash	3935
44481	Warsaw	3935
44482	Washington	3935
44483	West Lafayette	3935
44484	Williams	3935
44485	Altoona	3936
44486	Ames	3936
44487	Ankeny	3936
44488	Bettendorf	3936
44489	Boone	3936
44490	Burlington	3936
44491	Carroll	3936
44492	Cedar Falls	3936
44493	Cedar Rapids	3936
44494	Clarinda	3936
44495	Clinton	3936
44496	Clive	3936
44497	Coralville	3936
44498	Council Bluffs	3936
44499	Davenport	3936
44500	Des Moines	3936
44501	Dubuque	3936
44502	Eldridge	3936
44503	Elkader	3936
44504	Essex	3936
44505	Fairfield	3936
44506	Fayette	3936
44507	Fort Dodge	3936
44508	Fort Madison	3936
44509	Harlan	3936
44510	Indianola	3936
44511	Iowa City	3936
44512	Kalona	3936
44513	Keokuk	3936
44514	Marion	3936
44515	Marshalltown	3936
44516	Mason City	3936
44517	Muscatine	3936
44518	Newton	3936
44519	Orange City	3936
44520	Oskaloosa	3936
44521	Ottumwa	3936
44522	Pella	3936
44523	Sioux City	3936
44524	Spencer	3936
44525	Storm Lake	3936
44526	Urbandale	3936
44527	Waterloo	3936
44528	West Des Moines	3936
44529	Arkansas City	3937
44530	Atchison	3937
44531	Coffeyville	3937
44532	Derby	3937
44533	Dodge City	3937
44534	El Dorado	3937
44535	Elk City	3937
44536	Emporia	3937
44537	Fort Riley North	3937
44538	Garden City	3937
44539	Great Bend	3937
44540	Hays	3937
44541	Hutchinson	3937
44542	Independence	3937
44543	Junction City	3937
44544	Kansas City	3937
44545	Kingman	3937
44546	Lawrence	3937
44547	Leavenworth	3937
44548	Leawood	3937
44549	Lenexa	3937
44550	Liberal	3937
44551	MacPherson	3937
44552	Manhattan	3937
44553	Merriam	3937
44554	Minneapolis	3937
44555	Moscow	3937
44556	Moundridge	3937
44557	Nashville	3937
44558	Newton	3937
44559	Olathe	3937
44560	Ottawa	3937
44561	Overland Park	3937
44562	Parsons	3937
44563	Pittsburg	3937
44564	Prairie Village	3937
44565	Rose Hill	3937
44566	Salina	3937
44567	Shawnee	3937
44568	Topeka	3937
44569	Wichita	3937
44570	Winfield	3937
44571	tecumseh	3937
44572	Albany	3938
44573	Ashland	3938
44574	Bardstown	3938
44575	Berea	3938
44576	Bowling Green	3938
44577	Campbellsville	3938
44578	Catlettsburg	3938
44579	Covington	3938
44580	Crescent Springs	3938
44581	Danville	3938
44582	Dawson Springs	3938
44583	Eastview	3938
44584	Eddyville	3938
44585	Elizabethtown	3938
44586	Erlanger	3938
44587	Evarts	3938
44588	Fern Creek	3938
44589	Florence	3938
44590	Fort Campbell North	3938
44591	Fort Knox	3938
44592	Fort Mitchell	3938
44593	Fort Thomas	3938
44594	Frankfort	3938
44595	Georgetown	3938
44596	Glasgow	3938
44597	Grays Knob	3938
44598	Henderson	3938
44599	Highview	3938
44600	Hopkinsville	3938
44601	Independence	3938
44602	Jeffersontown	3938
44603	Lawrenceburg	3938
44604	Lebanon	3938
44605	Lexington	3938
44606	Lexington-Fayette	3938
44607	Louisville	3938
44608	Madisonville	3938
44609	Marion	3938
44610	Mayfield	3938
44611	Maysville	3938
44612	Middlesborough	3938
44613	Murray	3938
44614	Nebo	3938
44615	Newburg	3938
44616	Newport	3938
44617	Nicholasville	3938
44618	Okolona	3938
44619	Olive Hill	3938
44620	Owensboro	3938
44621	Paducah	3938
44622	Paris	3938
44623	Pikeville	3938
44624	Pleasure Ridge Park	3938
44625	Queens	3938
44626	Radcliff	3938
44627	Richmond	3938
44628	Saint Dennis	3938
44629	Saint Matthews	3938
44630	Scottsville	3938
44631	Shively	3938
44632	Somerset	3938
44633	South Shore	3938
44634	Tollesboro	3938
44635	Valley Station	3938
44636	Wallins Creek	3938
44637	Walton	3938
44638	Winchester	3938
44639	Abbeville	3939
44640	Alexandria	3939
44641	Amite	3939
44642	Baker	3939
44643	Bastrop	3939
44644	Baton Rouge	3939
44645	Bayou Cane	3939
44646	Bogalusa	3939
44647	Bossier City	3939
44648	Broussard	3939
44649	Calhoun	3939
44650	Chalmette	3939
44651	Covington	3939
44652	Crowley	3939
44653	De Ridder	3939
44654	Delcambre	3939
44655	Denham Springs	3939
44656	Estelle	3939
44657	Eunice	3939
44658	Fort Polk South	3939
44659	Franklin	3939
44660	French Settlement	3939
44661	Garyville	3939
44662	Geismar	3939
44663	Gretna	3939
44664	Hammond	3939
44665	Harahan	3939
44666	Harvey	3939
44667	Houma	3939
44668	Independence	3939
44669	Jefferson	3939
44670	Jennings	3939
44671	Kenner	3939
44672	Lafayette	3939
44673	Lake Charles	3939
44674	Laplace	3939
44675	Mandeville	3939
44676	Marrero	3939
44677	Merrydale	3939
44678	Metairie	3939
44679	Minden	3939
44680	Monroe	3939
44681	Morgan City	3939
44682	Natchitoches	3939
44683	New Iberia	3939
44684	New Orleans	3939
44685	Opelousas	3939
44686	Pineville	3939
44687	Pioneer	3939
44688	Prairieville	3939
44689	River Ridge	3939
44690	Ruston	3939
44691	Saint Amant	3939
44692	Saint Martinville	3939
44693	Shenandoah	3939
44694	Shreveport	3939
44695	Slidell	3939
44696	Sulphur	3939
44697	Terrytown	3939
44698	Thibodaux	3939
44699	Timberlane	3939
44700	Vinton	3939
44701	Waggaman	3939
44702	West Monroe	3939
44703	Westwego	3939
44704	Zachary	3939
44705	Manchester	3940
44706	Washington	3940
44707	Auburn	3941
44708	Augusta	3941
44709	Bangor	3941
44710	Bath	3941
44711	Biddeford	3941
44712	Brunswick	3941
44713	Cornish	3941
44714	Dover-Foxcroft	3941
44715	Ellsworth	3941
44716	Etna	3941
44717	Freeport	3941
44718	Gorham	3941
44719	Greene	3941
44720	Harmony	3941
44721	Lewiston	3941
44722	Liberty	3941
44723	Limerick	3941
44724	Lyman	3941
44725	Maine	3941
44726	New Gloucester	3941
44727	Norridgewock	3941
44728	North Yarmouth	3941
44729	Old Town	3941
44730	Orono	3941
44731	Portland	3941
44732	Presque Isle	3941
44733	Saco	3941
44734	Sanford	3941
44735	Scarborough	3941
44736	South Portland	3941
44737	Spruce Head	3941
44738	Thomaston	3941
44739	Waldoboro	3941
44740	Waterville	3941
44741	West Buxton	3941
44742	Westbrook	3941
44743	Whitefield	3941
44744	Windham	3941
44745	Yarmouth	3941
44746	York Harbor	3941
44747	stockton springs	3941
44748	Aberdeen	3942
44749	Accokeek	3942
44750	Adelphi	3942
44751	Andrews Air Force Base	3942
44752	Annapolis	3942
44753	Arbutus	3942
44754	Arnold	3942
44755	Aspen Hill	3942
44756	Baltimore	3942
44757	Bel Air North	3942
44758	Bel Air South	3942
44759	Beltsville	3942
44760	Berlin	3942
44761	Bethesda	3942
44762	Bladensburg	3942
44763	Boonsboro	3942
44764	Bowie	3942
44765	Brookeville	3942
44766	Brooklandville	3942
44767	Brooklyn Park	3942
44768	Burtonsville	3942
44769	Calverton	3942
44770	Cambridge	3942
44771	Camp Springs	3942
44772	Capitol Heights	3942
44773	Carney	3942
44774	Catonsville	3942
44775	Chestertown	3942
44776	Chillum	3942
44777	Clarksburg	3942
44778	Clarksville	3942
44779	Clinton	3942
44780	Cockeysville	3942
44781	Colesville	3942
44782	College Park	3942
44783	Columbia	3942
44784	Cooksville	3942
44785	Coral Hills	3942
44786	Crofton	3942
44787	Cumberland	3942
44788	Damascus	3942
44789	Darlington	3942
44790	District Heights	3942
44791	Dundalk	3942
44792	East Riverdale	3942
44793	Easton	3942
44794	Edgemere	3942
44795	Edgewood	3942
44796	Eldersburg	3942
44797	Elkridge	3942
44798	Elkton	3942
44799	Ellicott City	3942
44800	Essex	3942
44801	Fairland	3942
44802	Ferndale	3942
44803	Forest Hill	3942
44804	Forestville	3942
44805	Fort Meade	3942
44806	Fort Washington	3942
44807	Frederick	3942
44808	Fredrick	3942
44809	Friendly	3942
44810	Gaithersburg	3942
44811	Germantown	3942
44812	Glen Burnie	3942
44813	Glenn Dale	3942
44814	Greater Landover	3942
44815	Greater Upper Marlboro	3942
44816	Green Haven	3942
44817	Green Valley	3942
44818	Greenbelt	3942
44819	Hagerstown	3942
44820	Hanover	3942
44821	Harmans	3942
44822	Havre de Grace	3942
44823	Hillandale	3942
44824	Hillcrest Heights	3942
44825	Hunt Valley	3942
44826	Hurlock	3942
44827	Hyattsville	3942
44828	Ijamsville	3942
44829	Jefferson	3942
44830	Jessup	3942
44831	Joppatowne	3942
44832	Kettering	3942
44833	Lake Shore	3942
44834	Langley Park	3942
44835	Lanham	3942
44836	Lanham-Seabrook	3942
44837	Lansdowne-Baltimore Highlands	3942
44838	Largo	3942
44839	Laurel	3942
44840	Lexington Park	3942
44841	Lochearn	3942
44842	Lutherville-Timonium	3942
44843	Marriottsville	3942
44844	Maryland City	3942
44845	Mays Chapel	3942
44846	Middle River	3942
44847	Milford Mill	3942
44848	Millersville	3942
44849	Mitchellville	3942
44850	Montgomery Village	3942
44851	National Harbor	3942
44852	New Carrollton	3942
44853	North Bethesda	3942
44854	North Laurel	3942
44855	North Potomac	3942
44856	Odenton	3942
44857	Olney	3942
44858	Overlea	3942
44859	Owings Mills	3942
44860	Oxon Hill-Glassmanor	3942
44861	Parkville	3942
44862	Parole	3942
44863	Pasadena	3942
44864	Perry Hall	3942
44865	Pikesville	3942
44866	Poolesville	3942
44867	Potomac	3942
44868	Randallstown	3942
44869	Redland	3942
44870	Reisterstown	3942
44871	Riviera Beach	3942
44872	Rockville	3942
44873	Rosaryville	3942
44874	Rosedale	3942
44875	Rossville	3942
44876	Saint Charles	3942
44877	Salisbury	3942
44878	Sandy Spring	3942
44879	Savage Guilford	3942
44880	Severn	3942
44881	Severna Park	3942
44882	Silver Spring	3942
44883	Snow Hill	3942
44884	South Gate	3942
44885	South Laurel	3942
44886	Suitland-Silver Hill	3942
44887	Takoma Park	3942
44888	Temple Hill	3942
44889	Thurmont	3942
44890	Timonium	3942
44891	Towson	3942
44892	Upper Marlboro	3942
44893	Waldorf	3942
44894	Walker Mill	3942
44895	Washington Grove	3942
44896	Westminster	3942
44897	Wheaton-Glenmont	3942
44898	White Oak	3942
44899	Windsor Mill	3942
44900	Woodlawn	3942
44901	Abington	3943
44902	Acton	3943
44903	Agawam	3943
44904	Amesbury	3943
44905	Amherst Center	3943
44906	Arlington	3943
44907	Ashland	3943
44908	Athol	3943
44909	Attleboro	3943
44910	Barnstable Town	3943
44911	Baxboro	3943
44912	Becket	3943
44913	Bedford	3943
44914	Belmont	3943
44915	Beverly	3943
44916	Billerica	3943
44917	Boston	3943
44918	Boylston	3943
44919	Braintree	3943
44920	Brockton	3943
44921	Brookfield	3943
44922	Brookline	3943
44923	Burlington	3943
44924	Cambridge	3943
44925	Canton	3943
44926	Charlestown	3943
44927	Chelmsford	3943
44928	Chelsea	3943
44929	Chicopee	3943
44930	Clinton	3943
44931	Concord	3943
44932	Danvers	3943
44933	Dedham	3943
44934	Devens	3943
44935	Devenscrest	3943
44936	Duxbury	3943
44937	Easthampton	3943
44938	Everett	3943
44939	Fairhaven	3943
44940	Fall River	3943
44941	Fitchburg	3943
44942	Florence	3943
44943	Framingham	3943
44944	Franklin	3943
44945	Gardner	3943
44946	Gloucester	3943
44947	Great Barrington	3943
44948	Greenfield	3943
44949	Groton	3943
44950	Hadley	3943
44951	Harvard	3943
44952	Haverhill	3943
44953	Hingham	3943
44954	Holbrook	3943
44955	Holliston	3943
44956	Holyoke	3943
44957	Hopedale	3943
44958	Housatonic	3943
44959	Hubbardston	3943
44960	Hudson	3943
44961	Hull	3943
44962	Hyannis	3943
44963	Ipswich	3943
44964	Jamaica Plain	3943
44965	Lawrence	3943
44966	Lee	3943
44967	Lenox	3943
44968	Leominster	3943
44969	Lexington	3943
44970	Longmeadow	3943
44971	Lowell	3943
44972	Lynn	3943
44973	Lynnfield	3943
44974	Malden	3943
44975	Manchester	3943
44976	Marblehead	3943
44977	Marion	3943
44978	Marlborough	3943
44979	Marshfield	3943
44980	Massachusetts	3943
44981	Maynard	3943
44982	Medfield	3943
44983	Medford	3943
44984	Medway	3943
44985	Melrose	3943
44986	Methuen	3943
44987	Middleboro	3943
44988	Milford	3943
44989	Milton	3943
44990	Monson	3943
44991	Montague	3943
44992	Nantucket	3943
44993	Natick	3943
44994	Needham	3943
44995	New Bedford	3943
44996	Newburyport	3943
44997	Newton	3943
44998	North Adams	3943
44999	North Andover	3943
45000	North Attleborough Center	3943
45001	North Easton	3943
45002	Northampton	3943
45003	Northborough	3943
45004	Norwood	3943
45005	Orleans	3943
45006	Peabody	3943
45007	Pepperell	3943
45008	Pittsfield	3943
45009	Plainfield	3943
45010	Plymouth	3943
45011	Provincetown	3943
45012	Quincy	3943
45013	Randolph	3943
45014	Reading	3943
45015	Rehoboth	3943
45016	Revere	3943
45017	Rockland	3943
45018	Rockport	3943
45019	Roslindale	3943
45020	Salem	3943
45021	Saugus	3943
45022	Scituate	3943
45023	Seekonk	3943
45024	Shelburne Falls	3943
45025	Sherborn	3943
45026	Shrewsbury	3943
45027	Somerset	3943
45028	Somerville	3943
45029	South Boston	3943
45030	South Deerfield	3943
45031	South Hadley	3943
45032	South Lee	3943
45033	South Yarmouth	3943
45034	Southborough	3943
45035	Southbridge	3943
45036	Southwick	3943
45037	Springfield	3943
45038	Stoneham	3943
45039	Sturbridge	3943
45040	Swampscott	3943
45041	Swansea	3943
45042	Taunton	3943
45043	Tewksbury	3943
45044	Three Rivers	3943
45045	Truro	3943
45046	Upton	3943
45047	Vineyard Haven	3943
45048	Wakefield	3943
45049	Waltham	3943
45050	Ware	3943
45051	Wareham	3943
45052	Watertown	3943
45053	Wayland	3943
45054	Webster	3943
45055	Wellesley	3943
45056	Wellesley Hills	3943
45057	West Concord	3943
45058	West Roxbury	3943
45059	West Springfield	3943
45060	West Yarmouth	3943
45061	Westborough	3943
45062	Westfield	3943
45063	Westford	3943
45064	Weston	3943
45065	Weymouth	3943
45066	Wilbraham	3943
45067	Wilmington	3943
45068	Winchester	3943
45069	Winthrop	3943
45070	Woburn	3943
45071	Worcester	3943
45072	Yarmouthport	3943
45073	Adrian	3945
45074	Albion	3945
45075	Allegan	3945
45076	Allen Park	3945
45077	Alma	3945
45078	Alpena	3945
45079	Ann Arbor	3945
45080	Attica	3945
45081	Auburn Hills	3945
45082	Battle Creek	3945
45083	Bay City	3945
45084	Beecher	3945
45085	Belleville	3945
45086	Benton Harbor	3945
45087	Berkley	3945
45088	Beverly Hills	3945
45089	Big Rapids	3945
45090	Birmingham	3945
45091	Bloomfield Hills	3945
45092	Bloomfield Township	3945
45093	Boyne City	3945
45094	Brighton	3945
45095	Burt	3945
45096	Burton	3945
45097	Cadillac	3945
45098	Canton	3945
45099	Charlotte	3945
45100	Chesterfield	3945
45101	Clarkston	3945
45102	Clawson	3945
45103	Clinton	3945
45104	Commerce	3945
45105	Comstock Park	3945
45106	Coopersville	3945
45107	Cornell	3945
45108	Cutlerville	3945
45109	Davisburg	3945
45110	Dearborn	3945
45111	Dearborn Heights	3945
45112	Delton	3945
45113	Detroit	3945
45114	Dexter	3945
45115	Dowagiac	3945
45116	East Grand Rapids	3945
45117	East Lansing	3945
45118	Eastpointe	3945
45119	Ecorse	3945
45120	Escanaba	3945
45121	Evart	3945
45122	Fair Haven	3945
45123	Fairgrove	3945
45124	Farmington	3945
45125	Farmington Hills	3945
45126	Fenton	3945
45127	Ferndale	3945
45128	Flint	3945
45129	Forest Hills	3945
45130	Fowlerville	3945
45131	Frankenmuth	3945
45132	Fraser	3945
45133	Fremont	3945
45134	Fruitport	3945
45135	Garden City	3945
45136	Goodrich	3945
45137	Grand Blanc	3945
45138	Grand Haven	3945
45139	Grand Rapids	3945
45140	Grandville	3945
45141	Grosse Ile	3945
45142	Grosse Pointe Farms	3945
45143	Grosse Pointe Park	3945
45144	Grosse Pointe Woods	3945
45145	Gwinn	3945
45146	Hamtramck	3945
45147	Hancock	3945
45148	Harper Woods	3945
45149	Harrison	3945
45150	Haslett	3945
45151	Hazel Park	3945
45152	Highland Park	3945
45153	Holland	3945
45154	Holly	3945
45155	Holt	3945
45156	Houghton	3945
45157	Hudsonville	3945
45158	Huntington Woods	3945
45159	Imlay	3945
45160	Inkster	3945
45161	Jackon	3945
45162	Jackson	3945
45163	Jenison	3945
45164	Kalamazoo	3945
45165	Kalkaska	3945
45166	Kentwood	3945
45167	Kingsford	3945
45168	Lansing	3945
45169	Lapeer	3945
45170	Lincoln Park	3945
45171	Litchfield	3945
45172	Livonia	3945
45173	Ludington	3945
45174	Macomb	3945
45175	Madison Heights	3945
45176	Manistee	3945
45177	Marquette	3945
45178	Marysville	3945
45179	Melvindale	3945
45180	Midland	3945
45181	Monroe	3945
45182	Mount Clemens	3945
45183	Mount Morris	3945
45184	Mount Pleasant	3945
45185	Mt. Pleasant	3945
45186	Muskegon	3945
45187	Muskegon Heights	3945
45188	New Hudson	3945
45189	Newaygo	3945
45190	Niles	3945
45191	Northview	3945
45192	Northville	3945
45193	Norton Shores	3945
45194	Novi	3945
45195	Oak Park	3945
45196	Okemos	3945
45197	Oscoda	3945
45198	Owosso	3945
45199	Oxford	3945
45200	Petoskey	3945
45201	Pinckney	3945
45202	Plymouth Township	3945
45203	Pontiac	3945
45204	Port Huron	3945
45205	Portage	3945
45206	Redford	3945
45207	Reese	3945
45208	River Rouge	3945
45209	Riverview	3945
45210	Rochester Hills	3945
45211	Rockford	3945
45212	Romeo	3945
45213	Romulus	3945
45214	Roseville	3945
45215	Royal Oak	3945
45216	Saginaw	3945
45217	Saginaw Township North	3945
45218	Saginaw Township South	3945
45219	Saint Clair Shores	3945
45220	Saint Louis	3945
45221	Saline	3945
45222	Saugatuck	3945
45223	Sault Sainte Marie	3945
45224	Schoolcraft	3945
45225	Shelby	3945
45226	Southfield	3945
45227	Southgate	3945
45228	Sterling Heights	3945
45229	Sturgis	3945
45230	Taylor	3945
45231	Traverse City	3945
45232	Trenton	3945
45233	Troy	3945
45234	Walker	3945
45235	Walled Lake	3945
45236	Warren	3945
45237	Waterford	3945
45238	Waverly	3945
45239	Wayne	3945
45240	West Bloomfield Township	3945
45241	Westland	3945
45242	White Lake	3945
45243	Whitmore Lake	3945
45244	Williamston	3945
45245	Wixom	3945
45246	Woodhaven	3945
45247	Wyandotte	3945
45248	Wyoming	3945
45249	Ypsilanti	3945
45250	Albert Lea	3946
45251	Alger	3946
45252	Andover	3946
45253	Annandale	3946
45254	Anoka	3946
45255	Apple Valley	3946
45256	Austin	3946
45257	Baxter	3946
45258	Bemidji	3946
45259	Blaine	3946
45260	Blomkest	3946
45261	Bloomington	3946
45262	Blue Earth	3946
45263	Brainerd	3946
45264	Brooklyn Center	3946
45265	Brooklyn Park	3946
45266	Burnsville	3946
45267	Champlin	3946
45268	Chanhassen	3946
45269	Chaska	3946
45270	Chatfield	3946
45271	Circle Pines	3946
45272	Cloquet	3946
45273	Cokato	3946
45274	Columbia Heights	3946
45275	Coon Rapids	3946
45276	Cottage Grove	3946
45277	Crystal	3946
45278	Duluth	3946
45279	Eagan	3946
45280	East Bethel	3946
45281	Eden Prairie	3946
45282	Edina	3946
45283	Elk River	3946
45284	Ely	3946
45285	Fairmont	3946
45286	Faribault	3946
45287	Farmington	3946
45288	Fergus Falls	3946
45289	Frazee	3946
45290	Fridley	3946
45291	Golden Valley	3946
45292	Grand Rapids	3946
45293	Ham Lake	3946
45294	Hamel	3946
45295	Hastings	3946
45296	Hibbing	3946
45297	Hopkins	3946
45298	Houston	3946
45299	Hutchinson	3946
45300	Inver Grove Heights	3946
45301	Isanti	3946
45302	LaCrescent	3946
45303	Lakeville	3946
45304	Le Sueur	3946
45305	Lino Lakes	3946
45306	Litchfield	3946
45307	Mankato	3946
45308	Maple Grove	3946
45309	Maplewood	3946
45310	Marshall	3946
45311	Mendota Heights	3946
45312	Minneapolis	3946
45313	Minnetonka	3946
45314	Moorhead	3946
45315	Mounds View	3946
45316	Nelson	3946
45317	New Brighton	3946
45318	New Hope	3946
45319	New Ulm	3946
45320	North Mankato	3946
45321	North Saint Paul	3946
45322	Northfield	3946
45323	Oakdale	3946
45324	Onamia	3946
45325	Owatonna	3946
45326	Pequot Lakes	3946
45327	Plymouth	3946
45328	Prior Lake	3946
45329	Ramsey	3946
45330	Red Wing	3946
45331	Renville	3946
45332	Richfield	3946
45333	Robbinsdale	3946
45334	Rochester	3946
45335	Rosemount	3946
45336	Roseville	3946
45337	Royalton	3946
45338	Saint Cloud	3946
45339	Saint Louis Park	3946
45340	Saint Michael	3946
45341	Saint Paul	3946
45342	Saint Peter	3946
45343	Sauk Rapids	3946
45344	Savage	3946
45345	Shakopee	3946
45346	Shoreview	3946
45347	South Saint Paul	3946
45348	St. Paul	3946
45349	Stewartville	3946
45350	Stillwater	3946
45351	Vadnais Heights	3946
45352	Waconia	3946
45353	Wadena	3946
45354	West Saint Paul	3946
45355	White Bear Lake	3946
45356	Willmar	3946
45357	Winona	3946
45358	Woodbury	3946
45359	Worthington	3946
45360	Bay Saint Louis	3947
45361	Biloxi	3947
45362	Brandon	3947
45363	Brookhaven	3947
45364	Byhalia	3947
45365	Byram	3947
45366	Canton	3947
45367	Clarksdale	3947
45368	Cleveland	3947
45369	Clinton	3947
45370	Columbus	3947
45371	Corinth	3947
45372	Diamondhead	3947
45373	Gautier	3947
45374	Greenville	3947
45375	Greenwood	3947
45376	Grenada	3947
45377	Gulfport	3947
45378	Hattiesburg	3947
45379	Hernando	3947
45380	Horn Lake	3947
45381	Indianola	3947
45382	Jackson	3947
45383	Laurel	3947
45384	Long Beach	3947
45385	Lucedale	3947
45386	MacComb	3947
45387	Madison	3947
45388	Magnolia	3947
45389	Meridian	3947
45390	Michigan City	3947
45391	Moselle	3947
45392	Moss Point	3947
45393	Natchez	3947
45394	Ocean Springs	3947
45395	Olive Branch	3947
45396	Orange Grove	3947
45397	Oxford	3947
45398	Pascagoula	3947
45399	Pearl	3947
45400	Pelahatchie	3947
45401	Picayune	3947
45402	Quitman	3947
45403	Ridgeland	3947
45404	Senatobia	3947
45405	Southaven	3947
45406	Southhaven	3947
45407	Starkville	3947
45408	Tupelo	3947
45409	Utica	3947
45410	Vicksburg	3947
45411	Yazoo City	3947
45412	Affton	3948
45413	Annapolis	3948
45414	Arnold	3948
45415	Ballwin	3948
45416	Belgique	3948
45417	Bellefontaine Neighbors	3948
45418	Belton	3948
45419	Berkeley	3948
45420	Blue Springs	3948
45421	Branson	3948
45422	Bridgeton	3948
45423	Brighton	3948
45424	California	3948
45425	Camdenton	3948
45426	Cape Girardeau	3948
45427	Carthage	3948
45428	Chaffee	3948
45429	Chesterfield	3948
45430	Chillicothe	3948
45431	Clayton	3948
45432	Clever	3948
45433	Columbia	3948
45434	Concord	3948
45435	Crestwood	3948
45436	Creve Coeur	3948
45437	Desloge	3948
45438	Dora	3948
45439	Earth City	3948
45440	Excelsior Springs	3948
45441	Farmington	3948
45442	Fenton	3948
45443	Ferguson	3948
45444	Florissant	3948
45445	Forsyth	3948
45446	Fort Leonard Wood	3948
45447	Fulton	3948
45448	Gladstone	3948
45449	Grain Valley	3948
45450	Grandview	3948
45451	Gravois Mills	3948
45452	Hannibal	3948
45453	Harrisonville	3948
45454	Hazelwood	3948
45455	High Ridge	3948
45456	Independence	3948
45457	Jackson	3948
45458	Jefferson City	3948
45459	Jennings	3948
45460	Joplin	3948
45461	Kansas City	3948
45462	Kennett	3948
45463	Kirksville	3948
45464	Kirkwood	3948
45465	Kissee Mills	3948
45466	Lamar	3948
45467	Lebanon	3948
45468	Lees Summit	3948
45469	Lemay	3948
45470	Liberty	3948
45471	Lone Jack	3948
45472	Marshall	3948
45473	Maryland Heights	3948
45474	Maryville	3948
45475	Mehlville	3948
45476	Mexico	3948
45477	Moberly	3948
45478	Murphy	3948
45479	Nixa	3948
45480	OFallon	3948
45481	Oakville	3948
45482	Overland	3948
45483	Pacific	3948
45484	Park Hills	3948
45485	Parkville	3948
45486	Peculiar	3948
45487	Poplar Bluff	3948
45488	Raytown	3948
45489	Richmond Heights	3948
45490	Rolla	3948
45491	Saint Ann	3948
45492	Saint Charles	3948
45493	Saint Clair	3948
45494	Saint Joseph	3948
45495	Saint Louis	3948
45496	Saint Peters	3948
45497	Sappington	3948
45498	Sedalia	3948
45499	Sikeston	3948
45500	Spanish Lake	3948
45501	Springfield	3948
45502	St. Louis	3948
45503	Steelville	3948
45504	Sunrise Beach	3948
45505	Town and Country	3948
45506	Trimble	3948
45507	Troy	3948
45508	University City	3948
45509	Warrensburg	3948
45510	Washington	3948
45511	Webb City	3948
45512	Webster Groves	3948
45513	Wentzville	3948
45514	West Plains	3948
45515	Wildwood	3948
45516	Anaconda-Deer Lodge County	3949
45517	Arlee	3949
45518	Belgrade	3949
45519	Billings	3949
45520	Bozeman	3949
45521	Butte	3949
45522	Butte-Silver Bow	3949
45523	Great Falls	3949
45524	Hamilton	3949
45525	Havre	3949
45526	Helena	3949
45527	Helena Valley Southeast	3949
45528	Helena Valley West Central	3949
45529	Kalispell	3949
45530	Lame Deer	3949
45531	Laurel	3949
45532	Lewistown	3949
45533	Livingston	3949
45534	Malmstrom Air Force Base	3949
45535	Manhattan	3949
45536	Miles City	3949
45537	Missoula	3949
45538	Orchard Homes	3949
45539	Pablo	3949
45540	Polson	3949
45541	Roberts	3949
45542	Ryegate	3949
45543	Sidney	3949
45544	Stevensville	3949
45545	Whitefish	3949
45546	Beatrice	3950
45547	Bellevue	3950
45548	Central City	3950
45549	Columbus	3950
45550	Cozad	3950
45551	Creighton	3950
45552	Fremont	3950
45553	Gering	3950
45554	Grand Island	3950
45555	Hastings	3950
45556	Homer	3950
45557	Keamey	3950
45558	Kearney	3950
45559	La Vista	3950
45560	Lexington	3950
45561	Lincoln	3950
45562	McCook	3950
45563	Norfolk	3950
45564	North Platte	3950
45565	Offutt Air Force Base West	3950
45566	Ogallala	3950
45567	Omaha	3950
45568	Papillion	3950
45569	Scottsbluff	3950
45570	South Sioux City	3950
45571	Boulder City	3951
45572	Carson City	3951
45573	Elko	3951
45574	Goldfield	3951
45575	Henderson	3951
45576	Las Vegas	3951
45577	Laughlin	3951
45578	Lovelock	3951
45579	Mesquite	3951
45580	Nellis Air Force Base	3951
45581	North Las Vegas	3951
45582	Pahrump	3951
45583	Paradise	3951
45584	Reno	3951
45585	Sparks	3951
45586	Spring Valley	3951
45587	Sun Valley	3951
45588	Sunrise Manor	3951
45589	Winchester	3951
45590	Winnemucca	3951
45591	Akron	3959
45592	Alledonia	3959
45593	Alliance	3959
45594	Amherst	3959
45595	Apple Creek	3959
45596	Archbold	3959
45597	Ashland	3959
45598	Ashtabula	3959
45599	Athens	3959
45600	Atwater	3959
45601	Aurora	3959
45602	Austintown	3959
45603	Avon Lake	3959
45604	Barberton	3959
45605	Batavia	3959
45606	Bay Village	3959
45607	Beachwood	3959
45608	Beavercreek	3959
45609	Bedford	3959
45610	Bedford Heights	3959
45611	Bellaire	3959
45612	Bellefontaine	3959
45613	Bellevue	3959
45614	Berea	3959
45615	Bexley	3959
45616	Blacklick	3959
45617	Blacklick Estates	3959
45618	Blanchester	3959
45619	Blue Ash	3959
45620	Boardman	3959
45621	Bowling Green	3959
45622	Brecksville	3959
45623	Bridgetown North	3959
45624	Bristolville	3959
45625	Broadview Heights	3959
45626	Brook Park	3959
45627	Brooklyn	3959
45628	Brunswick	3959
45629	Bryan	3959
45630	Bucyrus	3959
45631	Burton	3959
45632	Cambridge	3959
45633	Campbell	3959
45634	Canal Winchester	3959
45635	Canton	3959
45636	Carlisle	3959
45637	Celina	3959
45638	Centerville	3959
45639	Chagrin Falls	3959
45640	Chardon	3959
45641	Cheshire	3959
45642	Chillicothe	3959
45643	Chippewa Lake	3959
45644	Cincinnati	3959
45645	Circleville	3959
45646	Cleveland	3959
45647	Cleveland Heights	3959
45648	Columbus	3959
45649	Conneaut	3959
45650	Coshocton	3959
45651	Cuyahoga Falls	3959
45652	Dayton	3959
45653	Defiance	3959
45654	Delaware	3959
45655	Dover	3959
45656	Dublin	3959
45657	East Cleveland	3959
45658	East Liverpool	3959
45659	Eastlake	3959
45660	Elyria	3959
45661	Englewood	3959
45662	Euclid	3959
45663	Fairborn	3959
45664	Fairfield	3959
45665	Fairview Park	3959
45666	Findlay	3959
45667	Finneytown	3959
45668	Forest Park	3959
45669	Fort MacKinley	3959
45670	Fostoria	3959
45671	Fremont	3959
45672	Gahanna	3959
45673	Galion	3959
45674	Garfield Heights	3959
45675	Girard	3959
45676	Glenwillow	3959
45677	Green	3959
45678	Greenville	3959
45679	Grove City	3959
45680	Hamilton	3959
45681	Harrison	3959
45682	Hilliard	3959
45683	Hiram	3959
45684	Holland	3959
45685	Huber Heights	3959
45686	Hudson	3959
45687	Ironton	3959
45688	Kent	3959
45689	Kettering	3959
45690	Kidron	3959
45691	Lakewood	3959
45692	Lancaster	3959
45693	Lebanon	3959
45694	Lewis Center	3959
45695	Lima	3959
45696	Lincoln Village	3959
45697	Lorain	3959
45698	Loveland	3959
45699	Lyndhurst	3959
45700	Macedonia	3959
45701	Madison	3959
45702	Maineville	3959
45703	Mansfield	3959
45704	Maple Heights	3959
45705	Marietta	3959
45706	Marion	3959
45707	Marysville	3959
45708	Mason	3959
45709	Massillon	3959
45710	Maumee	3959
45711	Mayfield Heights	3959
45712	Medina	3959
45713	Mentor	3959
45714	Miamisburg	3959
45715	Middleburg Heights	3959
45716	Middletown	3959
45717	Milford	3959
45718	Millbury	3959
45719	Mineral City	3959
45720	Minster	3959
45721	Mount Gilead	3959
45722	Mount Vernon	3959
45723	Nelsonville	3959
45724	New Albany	3959
45725	New Philadelphia	3959
45726	Newark	3959
45727	Niles	3959
45728	North Canton	3959
45729	North College Hill	3959
45730	North Lewisburg	3959
45731	North Olmsted	3959
45732	North Ridgeville	3959
45733	North Royalton	3959
45734	Northbrook	3959
45735	Northfield	3959
45736	Northview	3959
45737	Norton	3959
45738	Norwalk	3959
45739	Norwood	3959
45740	Oberlin	3959
45741	Ohio	3959
45742	Oregon	3959
45743	Overlook-Page Manor	3959
45744	Oxford	3959
45745	Painesville	3959
45746	Parma	3959
45747	Parma Heights	3959
45748	Peninsula	3959
45749	Perrysburg	3959
45750	Pickerington	3959
45751	Piqua	3959
45752	Portage Lakes	3959
45753	Portsmouth	3959
45754	Powell	3959
45755	Ravenna	3959
45756	Reading	3959
45757	Reynoldsburg	3959
45758	Rittman	3959
45759	Riverside	3959
45760	Rocky River	3959
45761	Rossford	3959
45762	Salem	3959
45763	Sandusky	3959
45764	Seven Hills	3959
45765	Seville	3959
45766	Shaker Heights	3959
45767	Sharonville	3959
45768	Sheffield Lake	3959
45769	Shelby	3959
45770	Sidney	3959
45771	Solon	3959
45772	South Euclid	3959
45773	Springdale	3959
45774	Springfield	3959
45775	Steubenville	3959
45776	Stow	3959
45777	Streetsboro	3959
45778	Strongsville	3959
45779	Struthers	3959
45780	Sylvania	3959
45781	Tallmadge	3959
45782	Tiffin	3959
45783	Toledo	3959
45784	Trotwood	3959
45785	Troy	3959
45786	Twinsburg	3959
45787	University Heights	3959
45788	Upper Arlington	3959
45789	Urbana	3959
45790	Valley Glen	3959
45791	Van Wert	3959
45792	Vandalia	3959
45793	Vermilion	3959
45794	Wadsworth	3959
45795	Warren	3959
45796	Warrensville Heights	3959
45797	Washington	3959
45798	Waverly	3959
45799	West Carrollton City	3959
45800	West Chester	3959
45801	Westerville	3959
45802	Westlake	3959
45803	White Oak	3959
45804	Whitehall	3959
45805	Wickliffe	3959
45806	Willoughby	3959
45807	Willowick	3959
45808	Wilmington	3959
45809	Winesburg	3959
45810	Wooster	3959
45811	Worthington	3959
45812	Xenia	3959
45813	Yellow Springs	3959
45814	Youngstown	3959
45815	Zanesville	3959
45816	Ada	3960
45817	Altus	3960
45818	Ardmore	3960
45819	Bartlesville	3960
45820	Bethany	3960
45821	Bixby	3960
45822	Broken Arrow	3960
45823	Catoosa	3960
45824	Chickasha	3960
45825	Choctaw	3960
45826	Claremore	3960
45827	Del City	3960
45828	Duncan	3960
45829	Durant	3960
45830	Edmond	3960
45831	El Reno	3960
45832	Elk City	3960
45833	Enid	3960
45834	Fort Sill	3960
45835	Grove	3960
45836	Guthrie	3960
45837	Heavener	3960
45838	Hugo	3960
45839	Lawton	3960
45840	Lindsay	3960
45841	MacAlester	3960
45842	Miami	3960
45843	Midwest City	3960
45844	Moore	3960
45845	Morrison	3960
45846	Muskogee	3960
45847	Mustang	3960
45848	Norman	3960
45849	Oklahoma City	3960
45850	Okmulgee	3960
45851	Owasso	3960
45852	Pawnee	3960
45853	Ponca City	3960
45854	Rattan	3960
45855	Sand Springs	3960
45856	Sapulpa	3960
45857	Shawnee	3960
45858	Stillwater	3960
45859	Sulphur	3960
45860	Tahlequah	3960
45861	The Village	3960
45862	Tulsa	3960
45863	Weatherford	3960
45864	Welch	3960
45865	Woodward	3960
45866	Yukon	3960
45867	Point Edward	3961
45868	Woodbridge	3961
45869	Albany	3962
45870	Aloha	3962
45871	Altamont	3962
45872	Arleta	3962
45873	Ashland	3962
45874	Astoria	3962
45875	Baker City	3962
45876	Beaverton	3962
45877	Bend	3962
45878	Canby	3962
45879	Cave Junction	3962
45880	Cedar Hills	3962
45881	Cedar Mill	3962
45882	Central Point	3962
45883	City of The Dalles	3962
45884	Coos Bay	3962
45885	Corvallis	3962
45886	Creswell	3962
45887	Dallas	3962
45888	Donald	3962
45889	Eugene	3962
45890	Forest Grove	3962
45891	Four Corners	3962
45892	Gladstone	3962
45893	Glide	3962
45894	Grants Pass	3962
45895	Gresham	3962
45896	Hayesville	3962
45897	Hazelwood	3962
45898	Hermiston	3962
45899	Hillsboro	3962
45900	Hood River	3962
45901	Hubbard	3962
45902	John Day	3962
45903	Jordan Valley	3962
45904	Keizer	3962
45905	Klamath Falls	3962
45906	La Grande	3962
45907	Lake Oswego	3962
45908	Lebanon	3962
45909	Lincoln	3962
45910	MacMinnville	3962
45911	Medford	3962
45912	Milwaukie	3962
45913	Newberg	3962
45914	Newport	3962
45915	North Bend	3962
45916	OBrien	3962
45917	Oak Grove	3962
45918	Oatfield	3962
45919	Ontario	3962
45920	Oregon City	3962
45921	Pendleton	3962
45922	Portland	3962
45923	Redmond	3962
45924	Riddle	3962
45925	River Road	3962
45926	Roseburg	3962
45927	Salem	3962
45928	Sherwood	3962
45929	Springfield	3962
45930	Sublimity	3962
45931	Sutherlin	3962
45932	Talent	3962
45933	Tigard	3962
45934	Troutdale	3962
45935	Tualatin	3962
45936	Turner	3962
45937	Vaughn	3962
45938	West Linn	3962
45939	Wilsonville	3962
45940	Woodburn	3962
45941	Akron	3963
45942	Aliquippa	3963
45943	Allentown	3963
45944	Altoona	3963
45945	Ambler	3963
45946	Amityville	3963
45947	Ardmore	3963
45948	Audubon	3963
45949	Back Mountain	3963
45950	Baldwin	3963
45951	Bangor	3963
45952	Beaver Falls	3963
45953	Belle Vernon	3963
45954	Bensalem	3963
45955	Berwick	3963
45956	Berwyn	3963
45957	Bethel Park	3963
45958	Bethlehem	3963
45959	Bloomsburg	3963
45960	Boyertown	3963
45961	Bradford	3963
45962	Brentwood	3963
45963	Bridgeport	3963
45964	Bristol	3963
45965	Brockway	3963
45966	Broomall	3963
45967	Bushkill	3963
45968	Butler	3963
45969	Camp Hill	3963
45970	Canonsburg	3963
45971	Carbondale	3963
45972	Carlisle	3963
45973	Carnegie	3963
45974	Carnot Moon	3963
45975	Chambersburg	3963
45976	Chester	3963
45977	Chester Springs	3963
45978	Clarks Summit	3963
45979	Coatesville	3963
45980	Colonial Park	3963
45981	Columbia	3963
45982	Conshohocken	3963
45983	Coraopolis	3963
45984	Corry	3963
45985	Cranberry Township	3963
45986	Cresco	3963
45987	Croydon	3963
45988	Dallas	3963
45989	Dallastown	3963
45990	Darby	3963
45991	Darby Township	3963
45992	Downingtown	3963
45993	Drexel Hill	3963
45994	Duncansville	3963
45995	Dunmore	3963
45996	East Norriton	3963
45997	East Stroudsburg	3963
45998	Easton	3963
45999	Economy	3963
46000	Edinboro	3963
46001	Elizabethtown	3963
46002	Elkins Park	3963
46003	Emmaus	3963
46004	Ephrata	3963
46005	Erdenheim	3963
46006	Erie	3963
46007	Erwinna	3963
46008	Exton	3963
46009	Feasterville	3963
46010	Folcroft	3963
46011	Franklin	3963
46012	Franklin Park	3963
46013	Frederick	3963
46014	Fullerton	3963
46015	Furlong	3963
46016	Gettysburg	3963
46017	Gibsonia	3963
46018	Glenside	3963
46019	Gordonville	3963
46020	Greensburg	3963
46021	Gwynedd	3963
46022	Hampden Township	3963
46023	Hanover	3963
46024	Harleysville	3963
46025	Harrisburg	3963
46026	Harrison Township	3963
46027	Hatboro	3963
46028	Haverford	3963
46029	Havertown	3963
46030	Hazleton	3963
46031	Hermitage	3963
46032	Hershey	3963
46033	Hollidaysburg	3963
46034	Horsham	3963
46035	Huntingdon Valley	3963
46036	Indiana	3963
46037	Irvine	3963
46038	Ivyland	3963
46039	Jeannette	3963
46040	Jefferson	3963
46041	Jenkintown	3963
46042	Johnstown	3963
46043	Kempton	3963
46044	Kennett Square	3963
46045	King of Prussia	3963
46046	Kingston	3963
46047	Kutztown	3963
46048	Lafayette Hill	3963
46049	Lancaster	3963
46050	Landenberg	3963
46051	Langhorne	3963
46052	Lansdale	3963
46053	Lansdowne	3963
46054	Lansford	3963
46055	Laurys Station	3963
46056	Lebanon	3963
46057	Lehighton	3963
46058	Levittown	3963
46059	Lincoln University	3963
46060	Linesville	3963
46061	Linwood	3963
46062	Lower Burrell	3963
46063	Lower Merion	3963
46064	MacCandless Township	3963
46065	MacKeesport	3963
46066	Malvern	3963
46067	Meadville	3963
46068	Mechanicsburg	3963
46069	Media	3963
46070	Merion Station	3963
46071	Middleburg	3963
46072	Mifflinville	3963
46073	Milanville	3963
46074	Milford	3963
46075	Millersburg	3963
46076	Monessen	3963
46077	Moscow	3963
46078	Mount Carmel	3963
46079	Mount Lebanon	3963
46080	Mountville	3963
46081	Munhall	3963
46082	Municipality of Monroeville	3963
46083	Municipality of Murrysville	3963
46084	N. Charleroi	3963
46085	Nanticoke	3963
46086	Narberth	3963
46087	Natrona Heights	3963
46088	Nazareth	3963
46089	Nether Providence Township	3963
46090	New Buffalo	3963
46091	New Carlisle	3963
46092	New Castle	3963
46093	New Cumberland	3963
46094	New Hope	3963
46095	New Kensington	3963
46096	Newton	3963
46097	Newtown	3963
46098	Newville	3963
46099	Norristown	3963
46100	North East	3963
46101	North Versailles	3963
46102	North Wales	3963
46103	Oaks	3963
46104	Oil City	3963
46105	Olyphant	3963
46106	Orrtanna	3963
46107	Orwigsburg	3963
46108	Oxford	3963
46109	Paoli	3963
46110	Parksburg	3963
46111	Penn Hills	3963
46112	Philadelphia	3963
46113	Phildelphia	3963
46114	Phoenixville	3963
46115	Pipersville	3963
46116	Pittsburgh	3963
46117	Pleasantville	3963
46118	Plum	3963
46119	Pocono Summit	3963
46120	Pottstown	3963
46121	Pottsville	3963
46122	Primos	3963
46123	Progress	3963
46124	Prospect	3963
46125	Quakertown	3963
46126	Radnor Township	3963
46127	Reading	3963
46128	Robinson Township	3963
46129	Roseto	3963
46130	Ross Township	3963
46131	Royersford	3963
46132	Saint Marys	3963
46133	Sarver	3963
46134	Saxonburg	3963
46135	Scott Township	3963
46136	Scranton	3963
46137	Seward	3963
46138	Sewickley	3963
46139	Shaler Township	3963
46140	Sharon	3963
46141	Shermans Dale	3963
46142	Somerset	3963
46143	Souderton	3963
46144	South Park Township	3963
46145	Southampton	3963
46146	Springfield	3963
46147	State College	3963
46148	Strasburg	3963
46149	Sunbury	3963
46150	Susquehanna	3963
46151	Swissvale	3963
46152	Tamaqua	3963
46153	Taylor	3963
46154	Telford	3963
46155	Trevose	3963
46156	Turtle Creek	3963
46157	Tyrone	3963
46158	Uniontown	3963
46159	Upper Darby	3963
46160	Upper Providence Township	3963
46161	Upper Saint Clair	3963
46162	Vanderbilt	3963
46163	Warminster	3963
46164	Warren	3963
46165	Warrendale	3963
46166	Washington	3963
46167	Waterford	3963
46168	Waverly	3963
46169	Wayne	3963
46170	Waynesboro	3963
46171	West Chester	3963
46172	West Mifflin	3963
46173	West Norriton	3963
46174	West Point	3963
46175	Wexford	3963
46176	Whitehall	3963
46177	Wilcox	3963
46178	Wilkes-Barre	3963
46179	Wilkinsburg	3963
46180	Williamsport	3963
46181	Willow Grove	3963
46182	Womelsdorf	3963
46183	Woodlyn	3963
46184	Woolrich	3963
46185	Wyncote	3963
46186	Wyndmoor	3963
46187	Wynnewood	3963
46188	Yardley	3963
46189	Yeadon	3963
46190	York	3963
46191	Ramey	3964
46192	Adamsville	3969
46193	Alcoa	3969
46194	Antioch	3969
46195	Arlington	3969
46196	Athens	3969
46197	Bartlett	3969
46198	Bell Buckle	3969
46199	Bloomingdale	3969
46200	Blountville	3969
46201	Brentwood	3969
46202	Bristol	3969
46203	Brownsville	3969
46204	Burns	3969
46205	Chattanooga	3969
46206	Clarksville	3969
46207	Cleveland	3969
46208	Collierville	3969
46209	Columbia	3969
46210	Cookeville	3969
46211	Cornersville	3969
46212	Crossville	3969
46213	Dayton	3969
46214	Dickson	3969
46215	Dyersburg	3969
46216	East Brainerd	3969
46217	East Ridge	3969
46218	Elizabethton	3969
46219	Farragut	3969
46220	Franklin	3969
46221	Gainesboro	3969
46222	Gallatin	3969
46223	Gatlinburg	3969
46224	Germantown	3969
46225	Goodlettsville	3969
46226	Greeneville	3969
46227	Hendersonville	3969
46228	Hixson	3969
46229	Jackson	3969
46230	Johnson City	3969
46231	Kingsport	3969
46232	Knoxville	3969
46233	Kodak	3969
46234	La Vergne	3969
46235	Lawrenceburg	3969
46236	Lebanon	3969
46237	Lenoir City	3969
46238	Lewisburg	3969
46239	MacMinnville	3969
46240	Maryville	3969
46241	Memphis	3969
46242	Middle Valley	3969
46243	Millington	3969
46244	Morristown	3969
46245	Mulberry	3969
46246	Murfreesboro	3969
46247	Nashville	3969
46248	Oak Ridge	3969
46249	Ooltewah	3969
46250	Pinson	3969
46251	Red Bank	3969
46252	Selmer	3969
46253	Sevierville	3969
46254	Shelbyville	3969
46255	Smithville	3969
46256	Smyrna	3969
46257	Spring City	3969
46258	Springfield	3969
46259	Tazewell	3969
46260	Trenton	3969
46261	Tullahoma	3969
46262	Union City	3969
46263	Abilene	3970
46264	Addison	3970
46265	Alamo	3970
46266	Aldine	3970
46267	Alice	3970
46268	Allen	3970
46269	Alvin	3970
46270	Amarillo	3970
46271	Anderson Mill	3970
46272	Andrews	3970
46273	Angleton	3970
46274	Argyle	3970
46275	Arlington	3970
46276	Aspermont	3970
46277	Atascocita	3970
46278	Athens	3970
46279	Austin	3970
46280	Austinn	3970
46281	Azle	3970
46282	Balch Springs	3970
46283	Barry	3970
46284	Bay City	3970
46285	Baytown	3970
46286	Beaumont	3970
46287	Bedford	3970
46288	Beeville	3970
46289	Bellaire	3970
46290	Belton	3970
46291	Benbrook	3970
46292	Big Spring	3970
46293	Bluff Dale	3970
46294	Boerne	3970
46295	Borger	3970
46296	Breckenridge	3970
46297	Brenham	3970
46298	Brownfield	3970
46299	Brownsville	3970
46300	Brownwood	3970
46301	Bryan	3970
46302	Buda	3970
46303	Burkburnett	3970
46304	Burleson	3970
46305	Campbell	3970
46306	Canyon	3970
46307	Canyon Lake	3970
46308	Carrollton	3970
46309	Cat Spring	3970
46310	Cedar Hill	3970
46311	Cedar Park	3970
46312	Celina	3970
46313	Center	3970
46314	Channelview	3970
46315	City of Dallas	3970
46316	Cleburne	3970
46317	Cloverleaf	3970
46318	Clute	3970
46319	College Station	3970
46320	Colleyville	3970
46321	Columbus	3970
46322	Comanche	3970
46323	Conroe	3970
46324	Converse	3970
46325	Coppell	3970
46326	Copperas Cove	3970
46327	Corinth	3970
46328	Corpus Christi	3970
46329	Corsicana	3970
46330	Cotulla	3970
46331	Crandall	3970
46332	Cypress	3970
46333	Dallas	3970
46334	Dayton	3970
46335	DeSoto	3970
46336	Deer Park	3970
46337	Del Rio	3970
46338	Denison	3970
46339	Denton	3970
46340	Dickinson	3970
46341	Donna	3970
46342	Dumas	3970
46343	Duncanville	3970
46344	Eagle Pass	3970
46345	Edinburg	3970
46346	El Campo	3970
46347	El Paso	3970
46348	Elmendorf	3970
46349	Ennis	3970
46350	Euless	3970
46351	Fairfield	3970
46352	Farmers Branch	3970
46353	Flower Mound	3970
46354	Forest Hill	3970
46355	Forney	3970
46356	Fort Bliss	3970
46357	Fort Hood	3970
46358	Fort Worth	3970
46359	Freeport	3970
46360	Friendswood	3970
46361	Frisco	3970
46362	Gainesville	3970
46363	Galena Park	3970
46364	Galveston	3970
46365	Garland	3970
46366	Gatesville	3970
46367	Georgetown	3970
46368	Grand Prairie	3970
46369	Grandview	3970
46370	Grapeland	3970
46371	Grapevine	3970
46372	Greenville	3970
46373	Gregory	3970
46374	Groves	3970
46375	Haltom City	3970
46376	Harker Heights	3970
46377	Harlingen	3970
46378	Henderson	3970
46379	Hereford	3970
46380	Hewitt	3970
46381	Highland Village	3970
46382	Hillsboro	3970
46383	Houston	3970
46384	Humble	3970
46385	Huntsville	3970
46386	Hurst	3970
46387	Ingleside	3970
46388	Irving	3970
46389	Jacksonville	3970
46390	Jefferson	3970
46391	Jollyville	3970
46392	Justin	3970
46393	Katy	3970
46394	Kaufman	3970
46395	Keller	3970
46396	Kemah	3970
46397	Kemp	3970
46398	Kerrville	3970
46399	Kilgore	3970
46400	Killeen	3970
46401	Kingsville	3970
46402	Kingwood	3970
46403	La Marque	3970
46404	La Porte	3970
46405	Lackland Air Force Base	3970
46406	Lago Vista	3970
46407	Lake Jackson	3970
46408	Lamesa	3970
46409	Lampasas	3970
46410	Lancaster	3970
46411	Laredo	3970
46412	League City	3970
46413	Leon Valley	3970
46414	Levelland	3970
46415	Lewisville	3970
46416	Liberty Hill	3970
46417	Lindsay	3970
46418	Little Elm	3970
46419	Live Oak	3970
46420	Llano	3970
46421	Lockhart	3970
46422	Longview	3970
46423	Lubbock	3970
46424	Lufkin	3970
46425	Lumberton	3970
46426	MacAllen	3970
46427	MacKinney	3970
46428	Magnolia	3970
46429	Malakoff	3970
46430	Mansfield	3970
46431	Marshall	3970
46432	McAllen	3970
46433	McKinney	3970
46434	Medina	3970
46435	Mercedes	3970
46436	Mesquite	3970
46437	Midland	3970
46438	Mineral Wells	3970
46439	Mission	3970
46440	Mission Bend	3970
46441	Missouri City	3970
46442	Montgomery	3970
46443	Mount Pleasant	3970
46444	Murphy	3970
46445	Nacogdoches	3970
46446	Nederland	3970
46447	New Braunfels	3970
46448	New Caney	3970
46449	North Richland Hills	3970
46450	North Zulch	3970
46451	Odessa	3970
46452	Orange	3970
46453	Ovalo	3970
46454	Palestine	3970
46455	Pampa	3970
46456	Paris	3970
46457	Pasadena	3970
46458	Pearland	3970
46459	Pecan Grove	3970
46460	Pecos	3970
46461	Pflugerville	3970
46462	Pharr	3970
46463	Pinehurst	3970
46464	Plainview	3970
46465	Plano	3970
46466	Pontotoc	3970
46467	Port Arthur	3970
46468	Port Lavaca	3970
46469	Port Neches	3970
46470	Portland	3970
46471	Pottsboro	3970
46472	Princeton	3970
46473	Richardson	3970
46474	Richmond	3970
46475	Rio Grande City	3970
46476	Robstown	3970
46477	Rockport	3970
46478	Rockwall	3970
46479	Roma	3970
46480	Rosenberg	3970
46481	Round Rock	3970
46482	Rowlett	3970
46483	Royse City	3970
46484	Sachse	3970
46485	Saginaw	3970
46486	San Angelo	3970
46487	San Antonio	3970
46488	San Benito	3970
46489	San Juan	3970
46490	San Marcos	3970
46491	Santa Fe	3970
46492	Schertz	3970
46493	Seabrook	3970
46494	Seagoville	3970
46495	Seguin	3970
46496	Sherman	3970
46497	Slaton	3970
46498	Smithville	3970
46499	Snyder	3970
46500	Socorro	3970
46501	South Houston	3970
46502	South Padre Island	3970
46503	Southlake	3970
46504	Spring	3970
46505	Stafford	3970
46506	Stephenville	3970
46507	Strawn	3970
46508	Sugar Land	3970
46509	Sulphur Springs	3970
46510	Sweetwater	3970
46511	Taylor	3970
46512	Temple	3970
46513	Terrell	3970
46514	Texarkana	3970
46515	Texas City	3970
46516	The Colony	3970
46517	The Woodlands	3970
46518	Tomball	3970
46519	Tyler	3970
46520	Universal City	3970
46521	University Park	3970
46522	Uvalde	3970
46523	Vernon	3970
46524	Victoria	3970
46525	Vidor	3970
46526	Waco	3970
46527	Watauga	3970
46528	Waxahachie	3970
46529	Weatherford	3970
46530	Weslaco	3970
46531	West Odessa	3970
46532	West University Place	3970
46533	White Settlement	3970
46534	Wichita Falls	3970
46535	Winnsboro	3970
46536	Woodway	3970
46537	Wylie	3970
46538	Yoakum	3970
46539	austinn	3970
46540	Bedford Kentucky	3971
46541	Alpine	3972
46542	American Fork	3972
46543	Bluffdale	3972
46544	Bountiful	3972
46545	Brigham City	3972
46546	Canyon Rim	3972
46547	Castle Dale	3972
46548	Cedar City	3972
46549	Centerville	3972
46550	Clearfield	3972
46551	Clinton	3972
46552	Cottonwood Heights	3972
46553	Cottonwood West	3972
46554	Draper	3972
46555	East Millcreek	3972
46556	Farmington	3972
46557	Holladay-Cottonwood	3972
46558	Ivins	3972
46559	Kaysville	3972
46560	Kearns	3972
46561	Layton	3972
46562	Lehi	3972
46563	Logan	3972
46564	Magna	3972
46565	Mapleton	3972
46566	Midvale	3972
46567	Millcreek	3972
46568	Moab	3972
46569	Monticello	3972
46570	Murray	3972
46571	North Logan	3972
46572	North Ogden	3972
46573	Ogden	3972
46574	Orem	3972
46575	Panguitch	3972
46576	Park City	3972
46577	Payson	3972
46578	Pleasant Grove	3972
46579	Provo	3972
46580	Riverton	3972
46581	Roy	3972
46582	Saint George	3972
46583	Salt Lake City	3972
46584	Sandy	3972
46585	Santaquin	3972
46586	South Jordan	3972
46587	South Ogden	3972
46588	South Salt Lake	3972
46589	Spanish Fork	3972
46590	Springville	3972
46591	Taylorsville	3972
46592	Tooele	3972
46593	Tremonton	3972
46594	Union	3972
46595	Washington	3972
46596	West Jordan	3972
46597	West Valley City	3972
46598	Woods Cross	3972
46599	Barre	3973
46600	Bennington	3973
46601	Brattleboro	3973
46602	Bristol	3973
46603	Burlington	3973
46604	Cabot	3973
46605	Colchester	3973
46606	Danville	3973
46607	Dorset	3973
46608	Dummerston	3973
46609	East Corinth	3973
46610	East Fairfield	3973
46611	East Randolph	3973
46612	Essex	3973
46613	Essex Junction	3973
46614	Grand Isle	3973
46615	Hartford	3973
46616	Jericho	3973
46617	Manchester	3973
46618	Manchester Center	3973
46619	Middlebury	3973
46620	Milton	3973
46621	Montpelier	3973
46622	Putney	3973
46623	Randolph	3973
46624	Rochester	3973
46625	Rutland	3973
46626	Saint Albans	3973
46627	Saint Johnsbury	3973
46628	Saxtons River	3973
46629	South Burlington	3973
46630	South Strafford	3973
46631	Springfield	3973
46632	Townshend	3973
46633	Tunbridge	3973
46634	Van	3973
46635	Vernon	3973
46636	Wallingford	3973
46637	Watisfield	3973
46638	West Brookfield	3973
46639	West Charleston	3973
46640	West Newbury	3973
46641	Williston	3973
46642	Winooski	3973
46643	Abingdon	3974
46644	Alexandria	3974
46645	Annandale	3974
46646	Arlington	3974
46647	Ashburn	3974
46648	Ashland	3974
46649	Aylett	3974
46650	Baileys Crossroads	3974
46651	Blacksburg	3974
46652	Bland	3974
46653	Bluefield	3974
46654	Bon Air	3974
46655	Bristol	3974
46656	Burke	3974
46657	Cave Spring	3974
46658	Centreville	3974
46659	Chantilly	3974
46660	Charlottesville	3974
46661	Chesapeake	3974
46662	Chester	3974
46663	Christiansburg	3974
46664	Churchville	3974
46665	Clifton	3974
46666	Colonial Heights	3974
46667	Culloden	3974
46668	Dale City	3974
46669	Danville	3974
46670	Dublin	3974
46671	Eagle Rock	3974
46672	East Highland Park	3974
46673	Faber	3974
46674	Fairfax	3974
46675	Falls Church	3974
46676	Fishersville	3974
46677	Fort Hunt	3974
46678	Fort Valley	3974
46679	Franconia	3974
46680	Franklin	3974
46681	Fredericksburg	3974
46682	Front Royal	3974
46683	Gainesville	3974
46684	Glen Allen	3974
46685	Gloucester	3974
46686	Goochland	3974
46687	Great Falls	3974
46688	Groveton	3974
46689	Hampton	3974
46690	Harrisonburg	3974
46691	Henrico	3974
46692	Herndon	3974
46693	Highland Springs	3974
46694	Hollins	3974
46695	Hopewell	3974
46696	Hybla Valley	3974
46697	Idylwood	3974
46698	Irvington	3974
46699	Jamesville	3974
46700	Jefferson	3974
46701	Keen Mountain	3974
46702	Keswick	3974
46703	Lake Ridge	3974
46704	Lakeside	3974
46705	Laurel	3974
46706	Leesburg	3974
46707	Lincolnia	3974
46708	Lorton	3974
46709	Lynchburg	3974
46710	MacLean	3974
46711	Madison	3974
46712	Madison Heights	3974
46713	Manassas	3974
46714	Marion	3974
46715	Martinsville	3974
46716	Mclean	3974
46717	Mechanicsville	3974
46718	Melfa	3974
46719	Midlothian	3974
46720	Montclair	3974
46721	Montross	3974
46722	Mount Vernon	3974
46723	Newington	3974
46724	Newport News	3974
46725	Norfolk	3974
46726	North Springfield	3974
46727	Oakton	3974
46728	Orange	3974
46729	Petersburg	3974
46730	Poquoson	3974
46731	Portsmouth	3974
46732	Radford	3974
46733	Reston	3974
46734	Richmond	3974
46735	Roanoke	3974
46736	Rose Hill	3974
46737	Salem	3974
46738	Seaford	3974
46739	South Boston	3974
46740	Springfield	3974
46741	Stafford	3974
46742	Staffordshire	3974
46743	Staunton	3974
46744	Sterling	3974
46745	Suffolk	3974
46746	Sugarland Run	3974
46747	Tappahannock	3974
46748	Timberlake	3974
46749	Triangle	3974
46750	Tuckahoe	3974
46751	Tysons Corner	3974
46752	Vienna	3974
46753	Virginia Beach	3974
46754	Warrenton	3974
46755	Washington	3974
46756	Waterford	3974
46757	Waynesboro	3974
46758	West Springfield	3974
46759	Williamsburg	3974
46760	Winchester	3974
46761	Wolf Trap	3974
46762	Woodbridge	3974
46763	Wytheville	3974
46764	Yorktown	3974
46765	Aberdeen	3975
46766	Airway Heights	3975
46767	Alderwood Manor	3975
46768	Anacortes	3975
46769	Arlington	3975
46770	Auburn	3975
46771	Bainbridge Island	3975
46772	Battle Ground	3975
46773	Bellevue	3975
46774	Bellingham	3975
46775	Bingen	3975
46776	Blaine	3975
46777	Bothell	3975
46778	Bremerton	3975
46779	Bryn Mawr-Skyway	3975
46780	Buckley	3975
46781	Burien	3975
46782	Burlington	3975
46783	Camano Island	3975
46784	Camas	3975
46785	Cascade-Fairwood	3975
46786	Centralia	3975
46787	Chehalis	3975
46788	Cheney	3975
46789	Clear Lake	3975
46790	Colbert	3975
46791	Cottage Lake	3975
46792	Covington-Sawyer-Wilderness	3975
46793	Des Moines	3975
46794	Duvall	3975
46795	East Hill-Meridian	3975
46796	East Renton Highlands	3975
46797	East Wenatchee Bench	3975
46798	Eastsound	3975
46799	Eatonville	3975
46800	Edgewood-North Hill	3975
46801	Edmonds	3975
46802	Elk Plain	3975
46803	Ellensburg	3975
46804	Enumclaw	3975
46805	Esperance	3975
46806	Everett	3975
46807	Evergreen	3975
46808	Fairchild	3975
46809	Federal Way	3975
46810	Ferndale	3975
46811	Fircrest	3975
46812	Ford	3975
46813	Fort Lewis	3975
46814	Friday Harbor	3975
46815	Gig Harbor	3975
46816	Graham	3975
46817	Harbour Pointe	3975
46818	Inglewood-Finn Hill	3975
46819	Issaquah	3975
46820	Kelso	3975
46821	Kenmore	3975
46822	Kennewick	3975
46823	Kent	3975
46824	Kingsgate	3975
46825	Kirkland	3975
46826	Lacey	3975
46827	Lake Serene-North Lynnwood	3975
46828	Lakeland North	3975
46829	Lakeland South	3975
46830	Lakewood	3975
46831	Longview	3975
46832	Lynnwood	3975
46833	Martha Lake	3975
46834	Marysville	3975
46835	Mercer Island	3975
46836	Minnehaha	3975
46837	Monroe	3975
46838	Moses Lake	3975
46839	Mossyrock	3975
46840	Mount Vernon	3975
46841	Mountlake Terrace	3975
46842	Mukilteo	3975
46843	Newport Hills	3975
46844	North City-Ridgecrest	3975
46845	North Creek	3975
46846	North Marysville	3975
46847	Oak Harbor	3975
46848	Ocean Shores	3975
46849	Olympia	3975
46850	Opportunity	3975
46851	Orchards South	3975
46852	Orting	3975
46853	Paine Field-Lake Stickney	3975
46854	Parkland	3975
46855	Pasco	3975
46856	Picnic Point-North Lynnwood	3975
46857	Pine Lake	3975
46858	Port Angeles	3975
46859	Port Hadlock	3975
46860	Port Ludlow	3975
46861	Port Orchard	3975
46862	Poulsbo	3975
46863	Pullman	3975
46864	Puyallup	3975
46865	Redmond	3975
46866	Renton	3975
46867	Republic	3975
46868	Richland	3975
46869	Riverton-Boulevard Park	3975
46870	Sahalee	3975
46871	Salmon Creek	3975
46872	Sammamish	3975
46873	SeaTac	3975
46874	Seattle	3975
46875	Seattle Hill-Silver Firs	3975
46876	Sedro Woolley	3975
46877	Shelton	3975
46878	Shoreline	3975
46879	Silverdale	3975
46880	Snohomish	3975
46881	South Hill	3975
46882	South Prairie	3975
46883	South Seattle	3975
46884	Spanaway	3975
46885	Spokane	3975
46886	Sumas	3975
46887	Sumner	3975
46888	Sunnyside	3975
46889	Tacoma	3975
46890	Tukwila	3975
46891	Tumwater	3975
46892	University Place	3975
46893	Vancouver	3975
46894	Vashon	3975
46895	Walla Walla	3975
46896	Washougal	3975
46897	Wenatchee	3975
46898	West Lake Stevens	3975
46899	White Center	3975
46900	White Salmon	3975
46901	White Swan	3975
46902	Woodinville	3975
46903	Yakima	3975
46904	Yelm	3975
46905	Adams	3977
46906	Allouez	3977
46907	Appleton	3977
46908	Ashland	3977
46909	Ashwaubenon	3977
46910	Baraboo	3977
46911	Beaver Dam	3977
46912	Beloit	3977
46913	Brookfield	3977
46914	Brown Deer	3977
46915	Burlington	3977
46916	Caledonia	3977
46917	Carter	3977
46918	Cedarburg	3977
46919	Chippewa Falls	3977
46920	Cudahy	3977
46921	De Pere	3977
46922	Deer Park	3977
46923	Delafield	3977
46924	Eau Claire	3977
46925	Elkhorn	3977
46926	Elroy	3977
46927	Fitchburg	3977
46928	Fond du Lac	3977
46929	Fort Atkinson	3977
46930	Franklin	3977
46931	Galesville	3977
46932	Germantown	3977
46933	Glen Flora	3977
46934	Glendale	3977
46935	Goodman	3977
46936	Grafton	3977
46937	Green Bay	3977
46938	Greendale	3977
46939	Greenfield	3977
46940	Hartford	3977
46941	Hartland	3977
46942	Howard	3977
46943	Hudson	3977
46944	Janesville	3977
46945	Jefferson	3977
46946	Junction City	3977
46947	Kaukauna	3977
46948	Kenosha	3977
46949	Kiel	3977
46950	Kohler	3977
46951	La Crosse	3977
46952	Little Chute	3977
46953	Madison	3977
46954	Manitowoc	3977
46955	Marinette	3977
46956	Marshfield	3977
46957	Medford	3977
46958	Menasha	3977
46959	Menomonee Falls	3977
46960	Menomonie	3977
46961	Mequon	3977
46962	Merrill	3977
46963	Middleton	3977
46964	Milwaukee	3977
46965	Mineral Point	3977
46966	Monroe	3977
46967	Mount Pleasant	3977
46968	Mukwonago	3977
46969	Muskego	3977
46970	Neenah	3977
46971	New Berlin	3977
46972	New Richmond	3977
46973	Oak Creek	3977
46974	Oconomowoc	3977
46975	Onalaska	3977
46976	Orfordville	3977
46977	Oshkosh	3977
46978	Pigeon Falls	3977
46979	Platteville	3977
46980	Pleasant Prairie	3977
46981	Plover	3977
46982	Port Washington	3977
46983	Portage	3977
46984	Pound	3977
46985	Racine	3977
46986	Reedsburg	3977
46987	Rhinelander	3977
46988	River Falls	3977
46989	Saint Francis	3977
46990	Sheboygan	3977
46991	Shorewood	3977
46992	South Milwaukee	3977
46993	Spring Valley	3977
46994	Stevens Point	3977
46995	Stoughton	3977
46996	Strum	3977
46997	Sturtevant	3977
46998	Sun Prairie	3977
46999	Superior	3977
47000	Three Lakes	3977
47001	Tomah	3977
47002	Two Rivers	3977
47003	Washington Island	3977
47004	Waterford	3977
47005	Watertown	3977
47006	Waukesha	3977
47007	Waupun	3977
47008	Wausau	3977
47009	Wautoma	3977
47010	Wauwatosa	3977
47011	West Allis	3977
47012	West Bend	3977
47013	Weston	3977
47014	Whitefish Bay	3977
47015	Whitewater	3977
47016	Wisconsin Rapids	3977
47017	Buffalo	3978
47018	Casper	3978
47019	Cheyenne	3978
47020	Cody	3978
47021	Douglas	3978
47022	Evanston	3978
47023	Gillette	3978
47024	Green River	3978
47025	Jackson	3978
47026	Lander	3978
47027	Laramie	3978
47028	Powell	3978
47029	Rawlins	3978
47030	Riverton	3978
47031	Rock Springs	3978
47032	Sheridan	3978
47033	Torrington	3978
47034	Worland	3978
47035	Artigas	3980
47036	Bella Union	3980
47037	Camino Maldonado	3981
47038	Canelones	3981
47039	Ciudad de la Costa	3981
47040	Juan Antonio Artigas	3981
47041	Las Piedras	3981
47042	Pando	3981
47043	Paso de Carrasco	3981
47044	Progreso	3981
47045	Santa Lucia	3981
47046	Carmelo	3983
47047	Colonia	3983
47048	Juan Lacaze	3983
47049	Nueva Helvecia	3983
47050	Durazno	3984
47051	Florida	3985
47052	Trinidad	3986
47053	Minas	3987
47054	Maldonado	3988
47055	San Carlos	3988
47056	La Paz	3989
47057	Montevideo	3989
47058	Paysandu	3990
47059	Rivera	3992
47060	Chuy	3993
47061	Rocha	3993
47062	Salto	3994
47063	Dolores	3996
47064	Mercedes	3996
47065	Paso de los Toros	3997
47066	Tacuarembo	3997
47067	Ahunabayev	3999
47068	Andijon	3999
47069	Asaka	3999
47070	Boz	3999
47071	Hakkulobod	3999
47072	Hocaobod	3999
47073	Honobod	3999
47074	Ilyichevsk	3999
47075	Karabagis	3999
47076	Kurgontepa	3999
47077	Marhomat	3999
47078	Pahtaobod	3999
47079	Paytug	3999
47080	Sahrihan	3999
47081	Buhoro	4000
47082	Cangeldi	4000
47083	Galaosiye	4000
47084	Gazli	4000
47085	Gijduvon	4000
47086	Kizilravbe	4000
47087	Kogon	4000
47088	Korakul	4000
47089	Korovulbazar	4000
47090	Kukca	4000
47091	Olot	4000
47092	Oyokkuduk	4000
47093	Romitan	4000
47094	Safirkon	4000
47095	Vobkent	4000
47096	Cizah	4002
47097	Dustlik	4002
47098	Gagarin	4002
47099	Gallaorol	4002
47100	Marcanbulok	4002
47101	Pahtakor	4002
47102	Ulyanovo	4002
47103	Zomin	4002
47104	Altyarik	4003
47105	Avval	4003
47106	Besarik	4003
47107	Fargona	4003
47108	Hamza	4003
47109	Kirgili	4003
47110	Kukon	4003
47111	Kuva	4003
47112	Kuvasoy	4003
47113	Margilon	4003
47114	Rapkan	4003
47115	Riston	4003
47116	Toslok	4003
47117	Yaypan	4003
47118	Drujba	4004
47119	Gurlan	4004
47120	Hazorasp	4004
47121	Heva	4004
47122	Honko	4004
47123	Kuskupir	4004
47124	Mesekli	4004
47125	Sovot	4004
47126	Turpokkala	4004
47127	Urgenc	4004
47128	Beskent	4005
47129	Ceynau	4005
47130	Cirakci	4005
47131	Dehkanobod	4005
47132	Dinau	4005
47133	Guzor	4005
47134	Kallig	4005
47135	Kamasi	4005
47136	Karabag	4005
47137	Karsi	4005
47138	Kasbi	4005
47139	Kitob	4005
47140	Koson	4005
47141	Madaniyat	4005
47142	Maydayap	4005
47143	Maymanak	4005
47144	Muborak	4005
47145	Oktyabrskiy	4005
47146	Sahrisabz	4005
47147	Talimarcon	4005
47148	Urtacim	4005
47149	Yakkabog	4005
47150	Yaninison	4005
47151	Beruni	4006
47152	Buston	4006
47153	Cimboy	4006
47154	Halkobod	4006
47155	Hucayli	4006
47156	Karauzyak	4006
47157	Kegayli	4006
47158	Kizketken	4006
47159	Kozokdaryo	4006
47160	Kungirot	4006
47161	Mangit	4006
47162	Muynok	4006
47163	Nukus	4006
47164	Tahiatos	4006
47165	Tahtakupir	4006
47166	Turtkul	4006
47167	Aytim	4007
47168	Besbulok	4007
47169	Cartak	4007
47170	Cingeldi	4007
47171	Cust	4007
47172	Gozgon	4007
47173	Iskavat	4007
47174	Kalkuduk	4007
47175	Konimeh	4007
47176	Kosonsoy	4007
47177	Minbulok	4007
47178	Namangan	4007
47179	Nurota	4007
47180	Pop	4007
47181	Tomdibulok	4007
47182	Tosbulok	4007
47183	Turakurgon	4007
47184	Uckurgon	4007
47185	Unhoyat	4007
47186	Uyci	4007
47187	Uzunkuduk	4007
47188	Yanikurgon	4007
47189	Karmana	4008
47190	Kiziltepa	4008
47191	Navoi	4008
47192	Uckuduk	4008
47193	Zarafson	4008
47194	Bulungur	4009
47195	Camboy	4009
47196	Carhin	4009
47197	Celak	4009
47198	Cuma	4009
47199	Dahbed	4009
47200	Istihon	4009
47201	Kattakurgon	4009
47202	Kusrobod	4009
47203	Nurobod	4009
47204	Oktos	4009
47205	Paysanba	4009
47206	Samarkand	4009
47207	Superfosfatniy	4009
47208	Urgut	4009
47209	Yanirobod	4009
47210	Ziadin	4009
47211	Baht	4010
47212	Guliston	4010
47213	Hovos	4010
47214	Sirdare	4010
47215	Sirin	4010
47216	Yaniyer	4010
47217	Akkurgon	4011
47218	Boysun	4011
47219	Carkurgon	4011
47220	Denau	4011
47221	Kumkurgon	4011
47222	Paskurd	4011
47223	Sargun	4011
47224	Sariasiya	4011
47225	Serobod	4011
47226	Surci	4011
47227	Termiz	4011
47228	Zan	4011
47229	Almazar	4012
47230	Angren	4012
47231	Bekobod	4012
47232	Bektemir	4012
47233	Buka	4012
47234	Cinoz	4012
47235	Circik	4012
47236	Gazalkent	4012
47237	Iskandar	4012
47238	Keles	4012
47239	Kibray	4012
47240	Krasnogorskiy	4012
47241	Kuyluk	4012
47242	Ohangaron	4012
47243	Olmalik	4012
47244	Parkent	4012
47245	Pskent	4012
47246	Salar	4012
47247	Soldatski	4012
47248	Tashkent	4012
47249	Toskent	4012
47250	Tuytepa	4012
47251	Urtaaul	4012
47252	Yaniobod	4012
47253	Yaniyul	4012
47254	Lakatoro	4013
47255	Norsup	4013
47256	Longana	4014
47257	Luganville	4015
47258	Port Olry	4015
47259	Vila	4016
47260	Isangel	4017
47261	Sola	4018
47262	Puerto Ayacucho	4020
47263	Anaco	4021
47264	Barcelona	4021
47265	Cantaura	4021
47266	El Tigre	4021
47267	Puerto la Cruz	4021
47268	San Jose de Guanipa	4021
47269	Guasdualito	4022
47270	San Fernando	4022
47271	Cagua	4023
47272	El Limon	4023
47273	La Victoria	4023
47274	Las Teyerias	4023
47275	Maracay	4023
47276	Palo Negro	4023
47277	San Mateo	4023
47278	Turmero	4023
47279	Villa de Cura	4023
47280	Barinas	4024
47281	Barinitas	4024
47282	Ciudad Bolivar	4025
47283	Ciudad Guayana	4025
47284	Upata	4025
47285	Goaigoaza	4026
47286	Guacara	4026
47287	Guigue	4026
47288	Mariara	4026
47289	Moron	4026
47290	Puerto Cabello	4026
47291	San Joaquin	4026
47292	Tacarigua	4026
47293	Valencia	4026
47294	San Carlos	4027
47295	Tinaquillo	4027
47296	Coro	4030
47297	Punta Cardon	4030
47298	Punto Fijo	4030
47299	Altagracia de Orituco	4031
47300	Calabozo	4031
47301	San Juan de los Morros	4031
47302	Valle de la Pascua	4031
47303	Zaraza	4031
47304	Barquisimeto	4032
47305	Cabudare	4032
47306	Carora	4032
47307	El Tocuyo	4032
47308	Los Rastrojos	4032
47309	Quibor	4032
47310	Ejido	4033
47311	El Vigia	4033
47312	Merida	4033
47313	Baruta	4034
47314	Carrizal	4034
47315	Catia La Mar	4034
47316	Caucaguita	4034
47317	Chacao	4034
47318	Charallave	4034
47319	Cua	4034
47320	El Cafetal	4034
47321	El Hatillo	4034
47322	Filas de Mariche	4034
47323	Guarenas	4034
47324	Guatire	4034
47325	La Dolorita	4034
47326	Los Dos Caminos	4034
47327	Los Teques	4034
47328	Ocumare del Tuy	4034
47329	Petare	4034
47330	San Antonio de los Altos	4034
47331	Santa Teresa	4034
47332	Maturin	4035
47333	Acarigua	4037
47334	Araure	4037
47335	Guanare	4037
47336	Villa Bruzual	4037
47337	Carupano	4038
47338	Cumana	4038
47339	La Fria	4039
47340	Rubio	4039
47341	San Antonio del Tachira	4039
47342	San Cristobal	4039
47343	San Juan de Colon	4039
47344	Tariba	4039
47345	Trujillo	4040
47346	Valera	4040
47347	Caraballeda	4041
47348	La Guaira	4041
47349	Maiquetia	4041
47350	Chivacoa	4042
47351	Nirgua	4042
47352	San Felipe	4042
47353	Yaritagua	4042
47354	Bachaquero	4043
47355	Cabimas	4043
47356	Ciudad Ojeda	4043
47357	Lagunillas	4043
47358	Machiques	4043
47359	Maracaibo	4043
47360	San Carlos del Zulia	4043
47361	Santa Rita	4043
47362	Villa del Rosario	4043
47363	Ha noi	4053
47364	Hoang Mai	4053
47365	Lang Ha	4053
47366	Settlement	4064
47367	East End-Long Look	4066
47368	Road Town	4066
47369	West End	4066
47370	Kolia	4070
47371	Malae	4070
47372	Ono	4070
47373	Poi	4070
47374	Tamana	4070
47375	Taoa	4070
47376	Tuatafa	4070
47377	Vele	4070
47378	Fiua	4071
47379	Leava	4071
47380	Nuku	4071
47381	Tavai	4071
47382	Toloke	4071
47383	Vaisei	4071
47384	Ahoa	4072
47385	Aka Aka	4072
47386	Alele	4072
47387	Falaleu	4072
47388	Gahi	4072
47389	Haafuasia	4072
47390	Haatofo	4072
47391	Halalo	4072
47392	Kolopopo	4072
47393	Lavegahau	4072
47394	Liku	4072
47395	Malae	4072
47396	Malaefoou	4072
47397	MataUtu	4072
47398	Teesi	4072
47399	Tepa	4072
47400	Utuofa	4072
47401	Vailala	4072
47402	Vaimalau	4072
47403	Vaitupu	4072
47404	ad-Dakhlah	4074
47405	al-Ayun	4075
47406	as-Samarah	4076
47407	Adan	4077
47408	Aden	4077
47409	Ahwar	4078
47410	Jaar	4078
47411	Zinjibar	4078
47412	Dhamar	4079
47413	Shaqra	4080
47414	al-Mukalla	4080
47415	ash-Shahir	4080
47416	Hajjah	4081
47417	Hodaidah	4082
47418	Dhi Sufal	4083
47419	Ibb	4083
47420	Jiblah	4083
47421	Qatabah	4083
47422	Yarim	4083
47423	Tuban	4084
47424	Marib	4085
47425	Sadah	4087
47426	Amran	4088
47427	Sahar	4088
47428	Sanaa	4088
47429	Sayyan	4088
47430	Ataq	4089
47431	Habban	4089
47432	Taiz	4089
47433	Taizz	4090
47434	al-Mukha	4090
47435	Raydah	4091
47436	al-Bayda	4091
47437	Bajil	4092
47438	Bayt-al-Faqih	4092
47439	Zabid	4092
47440	al-Hudaydah	4092
47441	al-Marawiah	4092
47442	az-Zaydiyah	4092
47443	al-Hazm	4093
47444	al-Ghaydah	4094
47445	Mahwit	4095
47446	Nikshic	4098
47447	Pljevlja	4098
47448	Podgorica	4098
47449	Ulcinj	4098
47450	Gjakove	4100
47451	Novi Banovci	4100
47452	Senta	4100
47453	Serbia	4100
47454	Uzice	4100
47455	Ada	4101
47456	Alibunar	4101
47457	Apatin	4101
47458	Bach	4101
47459	Bachka Palanka	4101
47460	Bachka Petrovac	4101
47461	Bachka Topola	4101
47462	Bachki Jarak	4101
47463	Banacki Karlovac	4101
47464	Bechej	4101
47465	Bela Crkva	4101
47466	Beochin	4101
47467	Choka	4101
47468	Churug	4101
47469	Crvenka	4101
47470	Futog	4101
47471	Indhija	4101
47472	Irig	4101
47473	Kac	4101
47474	Kanjizha	4101
47475	Kikinda	4101
47476	Kovachica	4101
47477	Kovin	4101
47478	Kula	4101
47479	Mol	4101
47480	Nova Pazova	4101
47481	Novi Bechej	4101
47482	Novi Knezhevac	4101
47483	Novi Sad	4101
47484	Odzhaci	4101
47485	Pacarak	4101
47486	Palic	4101
47487	Panchevo	4101
47488	Petrovaradin	4101
47489	Ruma	4101
47490	Senta	4101
47491	Shid	4101
47492	Sivac	4101
47493	Sombor	4101
47494	Srbobran	4101
47495	Sremska Kamenica	4101
47496	Sremska Mitrovica	4101
47497	Sremski Karlovci	4101
47498	Stara Pazova	4101
47499	Subotica	4101
47500	Temerin	4101
47501	Veternik	4101
47502	Vrbas	4101
47503	Vrshac	4101
47504	Zhabalj	4101
47505	Zhitishte	4101
47506	Zrenjanin	4101
47507	Kabwe	4102
47508	Kapiri Mposhi	4102
47509	Mkushi	4102
47510	Mumbwa	4102
47511	Serenje	4102
47512	Chambishi	4103
47513	Chililabombwe	4103
47514	Chingola	4103
47515	Kalulushi	4103
47516	Kitwe	4103
47517	Luanshya	4103
47518	Mpongwe	4103
47519	Mufulira	4103
47520	Ndola	4103
47521	Chipata	4104
47522	Katete	4104
47523	Lundazi	4104
47524	Petauke	4104
47525	Mansa	4105
47526	Mwansabombwe	4105
47527	Nchelenge	4105
47528	Samfya	4105
47529	Chilanga	4106
47530	Kafue	4106
47531	Lusaka	4106
47532	Kalengwa	4107
47533	Kansanshi	4107
47534	Mwinilunga	4107
47535	Solwezi	4107
47536	Zambezi	4107
47537	Chinsali	4108
47538	Isoka	4108
47539	Kasama	4108
47540	Mbala	4108
47541	Mpika	4108
47542	Choma	4109
47543	Itezhi-Tezhi	4109
47544	Kalomo	4109
47545	Livingstone	4109
47546	Maamba	4109
47547	Mazabuka	4109
47548	Monze	4109
47549	Nakambala	4109
47550	Siavonga	4109
47551	Kalabo	4110
47552	Kaoma	4110
47553	Limulunga	4110
47554	Mongu	4110
47555	Senanga	4110
47556	Sesheke	4110
47557	Bulawayo	4111
47558	Chitungwiza	4112
47559	Harare	4112
47560	Chimanimani	4113
47561	Chipinge	4113
47562	Mutare	4113
47563	Nyanga	4113
47564	Rusape	4113
47565	Sakubva	4113
47566	Chiredzi	4117
47567	Gaths	4117
47568	Masvingo	4117
47569	Chivhu	4120
47570	Gweru	4120
47571	Kwekwe	4120
47572	Mvuma	4120
47573	Redcliffe	4120
47574	Shurugwi	4120
47575	Zvishavane	4120
47576	Manchester	3952
47577	Nashua	3952
47578	Concord	3952
47579	Derry	3952
47580	Dover	3952
47581	Rochester	3952
47582	Salem	3952
47583	Merrimack	3952
47584	Hudson	3952
47585	Londonderry	3952
47586	Keene	3952
47587	Bedford	3952
47588	Portsmouth	3952
47589	Goffstown	3952
47590	Laconia	3952
47591	Hampton	3952
47592	Milford	3952
47593	Durham	3952
47594	Exeter	3952
47595	Windham	3952
47596	Hooksett	3952
47597	Claremont	3952
47598	Lebanon	3952
47599	Pelham	3952
47600	Somersworth	3952
47601	Hanover	3952
47602	Amherst	3952
47603	Raymond	3952
47604	Conway	3952
47605	Berlin	3952
47606	Newmarket	3952
47607	Weare	3952
47608	Seabrook	3952
47609	Barrington	3952
47610	Hampstead	3952
47611	Franklin	3952
47612	Litchfield	3952
47613	Hollis	3952
47614	Plaistow	3952
47615	Bow	3952
47616	Belmont	3952
47617	Stratham	3952
47618	Swanzey	3952
47619	Gilford	3952
47620	Pembroke	3952
47621	Plymouth	3952
47622	Farmington	3952
47623	Atkinson	3952
47624	Newport	3952
47625	Epping	3952
47626	Peterborough	3952
47627	Wolfeboro	3952
47628	Meredith	3952
47629	Kingston	3952
47630	Rindge	3952
47631	Hillsborough	3952
47632	Newark	3953
47633	Jersey City	3953
47634	Paterson	3953
47635	Elizabeth	3953
47636	Edison	3953
47637	Woodbridge	3953
47638	Lakewood	3953
47639	Toms River	3953
47640	Hamilton	3953
47641	Trenton	3953
47642	Clifton	3953
47643	Camden	3953
47644	Brick	3953
47645	Cherry Hill	3953
47646	Passaic	3953
47647	Middletown	3953
47648	Union City	3953
47649	Old Bridge	3953
47650	Gloucester Township	3953
47651	East Orange	3953
47652	Bayonne	3953
47653	Franklin	3953
47654	North Bergen	3953
47655	Vineland	3953
47656	Union	3953
47657	Piscataway	3953
47658	New Brunswick	3953
47659	Jackson	3953
47660	Wayne	3953
47661	Irvington	3953
47662	Parsippany-Troy Hills	3953
47663	Howell	3953
47664	Perth Amboy	3953
47665	Hoboken	3953
47666	Plainfield	3953
47667	West New York	3953
47668	Washington Township	3953
47669	East Brunswick	3953
47670	Bloomfield	3953
47671	West Orange	3953
47672	Evesham	3953
47673	Bridgewater	3953
47674	South Brunswick	3953
47675	Egg Harbor	3953
47676	Manchester	3953
47677	Hackensack	3953
47678	Sayreville	3953
47679	Mount Laurel	3953
47680	Berkeley	3953
47681	North Brunswick	3953
47682	Kearny	3953
47683	Linden	3953
47684	Marlboro	3953
47685	Teaneck	3953
47686	Atlantic City	3953
47687	Winslow	3953
47688	Monroe	3953
47689	Manalapan	3953
47690	Hillsborough	3953
47691	Montclair	3953
47692	Galloway	3953
47693	Freehold Township	3953
47694	Monroe Township	3953
47695	Belleville	3953
47696	Pennsauken	3953
47697	Ewing	3953
47698	Fort Lee	3953
47699	Lawrence	3953
47700	Fair Lawn	3953
47701	Willingboro	3953
47702	Long Branch	3953
47703	Deptford	3953
47704	Garfield	3953
47705	Westfield	3953
47706	City of Orange	3953
47707	Livingston	3953
47708	Voorhees	3953
47709	Princeton	3953
47710	Millville	3953
47711	Nutley	3953
47712	Mount Olive	3953
47713	Neptune	3953
47714	Pemberton Township	3953
47715	Lacey	3953
47716	Rahway	3953
47717	Ocean Township	3953
47718	East Windsor	3953
47719	West Windsor	3953
47720	Englewood	3953
47721	Bergenfield	3953
47722	Bernards Township	3953
47723	Stafford Township	3953
47724	Hamilton Township	3953
47725	Paramus	3953
47726	Wall	3953
47727	Mahwah	3953
47728	West Milford	3953
47729	Randolph	3953
47730	Bridgeton	3953
47731	Ridgewood	3953
47732	Rockaway Township	3953
47733	Lodi	3953
47734	Vernon	3953
47735	Maplewood	3953
47736	Cliffside Park	3953
47737	Scotch Plains	3953
47738	South Plainfield	3953
47739	Roxbury	3953
47740	Medford	3953
47741	Plainsboro	3953
47742	Lower Township	3953
47743	Carteret	3953
47744	Cranford	3953
47745	Burlington Township	3953
47746	Morris Township	3953
47747	Montgomery	3953
47748	Raritan Township	3953
47749	North Plainfield	3953
47750	West Deptford	3953
47751	Montville	3953
47752	Summit	3953
47753	Hillside	3953
47754	Jefferson	3953
47755	Roselle	3953
47756	Barnegat	3953
47757	Moorestown	3953
47758	Lyndhurst	3953
47759	Hazlet	3953
47760	Pleasantville	3953
47761	Millburn	3953
47762	Little Egg Harbor	3953
47763	Sparta	3953
47764	Palisades Park	3953
47765	Elmwood Park	3953
47766	Maple Shade	3953
47767	Middle Township	3953
47768	Hawthorne	3953
47769	Glassboro	3953
47770	Washington Township	3953
47771	Morristown	3953
47772	Point Pleasant	3953
47773	Aberdeen	3953
47774	Dover	3953
47775	Rutherford	3953
47776	Tinton Falls	3953
47777	Lindenwold	3953
47778	Dumont	3953
47779	Hopewell Township	3953
47780	Delran	3953
47781	Franklin Township	3953
47782	Holmdel	3953
47783	Wyckoff	3953
47784	Denville	3953
47785	New Milford	3953
47786	Secaucus	3953
47787	South Orange Village	3953
47788	Readington	3953
47789	Asbury Park	3953
47790	South River	3953
47791	Madison	3953
47792	Springfield	3953
47793	Cinnaminson	3953
47794	Pequannock	3953
47795	North Arlington	3953
47796	Warren	3953
47797	Mantua	3953
47798	Hopatcong	3953
47799	Phillipsburg	3953
47800	Hammonton	3953
47801	Clark	3953
47802	Haddon Township	3953
47803	Tenafly	3953
47804	Ramsey	3953
47805	Branchburg	3953
47806	Little Falls	3953
47807	Highland Park	3953
47808	Collingswood	3953
47809	Fairview	3953
47810	Hanover	3953
47811	Saddle Brook	3953
47812	Robbinsville	3953
47813	Middlesex	3953
47814	Harrison	3953
47815	Metuchen	3953
47816	Clinton Township	3953
47817	Pennsville	3953
47818	Verona	3953
47819	Albuquerque	3955
47820	Las Cruces	3955
47821	Rio Rancho	3955
47822	Santa Fe	3955
47823	Roswell	3955
47824	Farmington	3955
47825	South Valley	3955
47826	Clovis	3955
47827	Hobbs	3955
47828	Alamogordo	3955
47829	Carlsbad	3955
47830	Gallup	3955
47831	Deming	3955
47832	Los Lunas	3955
47833	Chaparral	3955
47834	Sunland Park	3955
47835	Las Vegas	3955
47836	Portales	3955
47837	Los Alamos	3955
47838	North Valley	3955
47839	Artesia	3955
47840	Lovington	3955
47841	Silver City	3955
47842	Espanola	3955
47843	Anthony	3955
47844	Grants	3955
47845	Socorro	3955
47846	Corrales	3955
47847	Bernalillo	3955
47848	Shiprock	3955
47849	Bloomfield	3955
47850	Ruidoso	3955
47851	Kirtland	3955
47852	Belen	3955
47853	Airmont	3956
47854	Albany	3956
47855	Alden	3956
47856	Amherst	3956
47857	Amityville	3956
47858	Amsterdam	3956
47859	Arcadia	3956
47860	Auburn	3956
47861	Aurora	3956
47862	Babylon	3956
47863	Baldwinsville	3956
47864	Ballston	3956
47865	Batavia	3956
47866	Bath	3956
47867	Beacon	3956
47868	Bedford	3956
47869	Beekman	3956
47870	Bethlehem	3956
47871	Binghamton	3956
47872	Blooming Grove	3956
47873	Briarcliff Manor	3956
47874	Brighton	3956
47875	Brockport	3956
47876	Brookhaven	3956
47877	Brunswick	3956
47878	Buffalo	3956
47879	Camillus	3956
47880	Canandaigua	3956
47881	Canton	3956
47882	Carmel	3956
47883	Catskill	3956
47884	Cheektowaga	3956
47885	Chenango	3956
47886	Chester	3956
47887	Chestnut Ridge	3956
47888	Chili	3956
47889	Cicero	3956
47890	Clarence	3956
47891	Clarkstown	3956
47892	Clay	3956
47893	Clifton Park	3956
47894	Cohoes	3956
47895	Colonie	3956
47896	Corning	3956
47897	Cornwall	3956
47898	Cortland	3956
47899	Cortlandt	3956
47900	Crawford	3956
47901	Croton-on-Hudson	3956
47902	Depew	3956
47903	DeWitt (De Witt)	3956
47904	Dobbs Ferry	3956
47905	Dryden	3956
47906	Dunkirk	3956
47907	East Fishkill	3956
47908	East Greenbush	3956
47909	East Hampton	3956
47910	East Hills	3956
47911	East Rockaway	3956
47912	Eastchester	3956
47913	Elma	3956
47914	Elmira	3956
47915	Endicott	3956
47916	Esopus	3956
47917	Evans	3956
47918	Fallsburg	3956
47919	Farmingdale	3956
47920	Farmington	3956
47921	Fishkill	3956
47922	Floral Park	3956
47923	Fredonia	3956
47924	Freeport	3956
47925	Fulton	3956
47926	Garden City	3956
47927	Gates	3956
47928	Geddes	3956
47929	Geneseo	3956
47930	Geneva	3956
47931	German Flatts	3956
47932	Glen Cove	3956
47933	Glens Falls	3956
47934	Glenville	3956
47935	Gloversville	3956
47936	Goshen	3956
47937	Grand Island	3956
47938	Great Neck	3956
47939	Greece	3956
47940	Greenburgh	3956
47941	Guilderland	3956
47942	Halfmoon	3956
47943	Hamburg	3956
47944	Hamlin	3956
47945	Harrison	3956
47946	Hastings	3956
47947	Hastings-on-Hudson	3956
47948	Haverstraw	3956
47949	Hempstead	3956
47950	Henrietta	3956
47951	Herkimer	3956
47952	Highlands	3956
47953	Hornell	3956
47954	Horseheads	3956
47955	Hudson	3956
47956	Hudson Falls	3956
47957	Huntington	3956
47958	Hyde Park	3956
47959	Ilion	3956
47960	Irondequoit	3956
47961	Islip	3956
47962	Ithaca	3956
47963	Jamestown	3956
47964	Johnson City	3956
47965	Johnstown	3956
47966	Kenmore	3956
47967	Kent	3956
47968	Kingsbury	3956
47969	Kingston	3956
47970	Kirkland	3956
47971	Kiryas Joel	3956
47972	Lackawanna	3956
47973	LaGrange (La Grange)	3956
47974	Lake Grove	3956
47975	Lancaster	3956
47976	Lansing	3956
47977	Le Ray	3956
47978	Lenox	3956
47979	Lewisboro	3956
47980	Lewiston	3956
47981	Liberty	3956
47982	Lindenhurst	3956
47983	Little Falls	3956
47984	Lloyd	3956
47985	Lockport	3956
47986	Long Beach	3956
47987	Lynbrook	3956
47988	Lysander	3956
47989	Macedon	3956
47990	Malone	3956
47991	Malta	3956
47992	Malverne	3956
47993	Mamakating	3956
47994	Mamaroneck	3956
47995	Manchester	3956
47996	Manlius	3956
47997	Massapequa Park	3956
47998	Massena	3956
47999	Mastic Beach	3956
48000	Mechanicville	3956
48001	Mendon	3956
48002	Middletown	3956
48003	Milton	3956
48004	Mineola	3956
48005	Monroe	3956
48006	Montgomery	3956
48007	Moreau	3956
48008	Mount Kisco	3956
48009	Mount Pleasant	3956
48010	Mount Vernon	3956
48011	New Castle	3956
48012	New Hartford	3956
48013	New Hyde Park	3956
48014	New Paltz	3956
48015	New Rochelle	3956
48016	New Square	3956
48017	New Windsor	3956
48018	New York	3956
48019	Newark	3956
48020	Newburgh	3956
48021	Newfane	3956
48022	Niagara Falls	3956
48023	Niskayuna	3956
48024	North Castle	3956
48025	North Greenbush	3956
48026	North Hempstead	3956
48027	North Syracuse	3956
48028	North Tonawanda	3956
48029	Northport	3956
48030	Norwich	3956
48031	Nyack	3956
48032	Ogden	3956
48033	Ogdensburg	3956
48034	Olean	3956
48035	Oneida	3956
48036	Oneonta	3956
48037	Onondaga	3956
48038	Ontario	3956
48039	Orangetown	3956
48040	Orchard Park	3956
48041	Ossining	3956
48042	Oswego	3956
48043	Owego	3956
48044	Oyster Bay	3956
48045	Parma	3956
48046	Patchogue	3956
48047	Patterson	3956
48048	Peekskill	3956
48049	Pelham	3956
48050	Penfield	3956
48051	Perinton	3956
48052	Philipstown	3956
48053	Pittsford	3956
48054	Plattekill	3956
48055	Plattsburgh	3956
48056	Pleasant Valley	3956
48057	Pleasantville	3956
48058	Pomfret	3956
48059	Port Chester	3956
48060	Port Jefferson	3956
48061	Port Jervis	3956
48062	Potsdam	3956
48063	Poughkeepsie	3956
48064	Putnam Valley	3956
48065	Queensbury	3956
48066	Ramapo	3956
48067	Red Hook	3956
48068	Rensselaer	3956
48069	Riverhead	3956
48070	Rochester	3956
48071	Rockville Centre	3956
48072	Rome	3956
48073	Rotterdam	3956
48074	Rye	3956
48075	Rye Brook	3956
48076	Salamanca	3956
48077	Salina	3956
48078	Saratoga Springs	3956
48079	Saugerties	3956
48080	Scarsdale	3956
48081	Schenectady	3956
48082	Schodack	3956
48083	Scotia	3956
48084	Seneca Falls	3956
48085	Shawangunk	3956
48086	Sherrill	3956
48087	Sleepy Hollow	3956
48088	Smithtown	3956
48089	Somers	3956
48090	Southampton	3956
48091	Southeast	3956
48092	Southold	3956
48093	Southport	3956
48094	Spring Valley	3956
48095	Stony Point	3956
48096	Suffern	3956
48097	Sullivan	3956
48098	Sweden	3956
48099	Syracuse	3956
48100	Tarrytown	3956
48101	Thompson	3956
48102	Tonawanda	3956
48103	Troy	3956
48104	Ulster	3956
48105	Union	3956
48106	Utica	3956
48107	Valley Stream	3956
48108	Van Buren	3956
48109	Vestal	3956
48110	Victor	3956
48111	Walden	3956
48112	Wallkill	3956
48113	Walworth	3956
48114	Wappinger	3956
48115	Warwick	3956
48116	Watertown	3956
48117	Watervliet	3956
48118	Wawarsing	3956
48119	Webster	3956
48120	West Haverstraw	3956
48121	West Seneca	3956
48122	Westbury	3956
48123	Wheatfield	3956
48124	White Plains	3956
48125	Whitestown	3956
48126	Williston Park	3956
48127	Wilton	3956
48128	Woodbury	3956
48129	Yonkers	3956
48130	Yorktown	3956
48131	Charlotte	3957
48132	Raleigh	3957
48133	Greensboro	3957
48134	Durham	3957
48135	Winston-Salem	3957
48136	Fayetteville	3957
48137	Cary	3957
48138	Wilmington	3957
48139	High Point	3957
48140	Greenville	3957
48141	Asheville	3957
48142	Concord	3957
48143	Gastonia	3957
48144	Jacksonville	3957
48145	Chapel Hill	3957
48146	Rocky Mount	3957
48147	Burlington	3957
48148	Huntersville	3957
48149	Wilson	3957
48150	Kannapolis	3957
48151	Apex	3957
48152	Hickory	3957
48153	Wake Forest	3957
48154	Indian Trail	3957
48155	Goldsboro	3957
48156	Mooresville	3957
48157	Monroe	3957
48158	Salisbury	3957
48159	New Bern	3957
48160	Holly Springs	3957
48161	Matthews	3957
48162	Sanford	3957
48163	Garner	3957
48164	Cornelius	3957
48165	Thomasville	3957
48166	Asheboro	3957
48167	Statesville	3957
48168	Mint Hill	3957
48169	Kernersville	3957
48170	Morrisville	3957
48171	Fuquay-Varina	3957
48172	Lumberton	3957
48173	Kinston	3957
48174	Carrboro	3957
48175	Havelock	3957
48176	Shelby	3957
48177	Clemmons	3957
48178	Lexington	3957
48179	Clayton	3957
48180	Boone	3957
48181	Fargo	3958
48182	Bismarck	3958
48183	Grand Forks	3958
48184	Minot	3958
48185	West Fargo	3958
48186	Williston	3958
48187	Dickinson	3958
48188	Mandan	3958
48189	Jamestown	3958
48190	Wahpeton	3958
48191	Devils Lake	3958
48192	Valley City	3958
48193	Providence	3965
48194	Warwick	3965
48195	Cranston	3965
48196	Pawtucket	3965
48197	East Providence	3965
48198	Woonsocket	3965
48199	Coventry	3965
48200	Cumberland	3965
48201	North Providence	3965
48202	South Kingstown	3965
48203	West Warwick	3965
48204	Johnston	3965
48205	North Kingstown	3965
48206	Newport	3965
48207	Bristol	3965
48208	Westerly	3965
48209	Smithfield	3965
48210	Lincoln	3965
48211	Central Falls	3965
48212	Portsmouth	3965
48213	Barrington	3965
48214	Middletown	3965
48215	Burrillville	3965
48216	Narragansett	3965
48217	Tiverton	3965
48218	East Greenwich	3965
48219	North Smithfield	3965
48220	Warren	3965
48221	Scituate	3965
48222	Glocester	3965
48223	Hopkinton	3965
48224	Charlestown	3965
48225	Richmond	3965
48226	Columbia	3966
48227	Charleston	3966
48228	North Charleston	3966
48229	Mount Pleasant	3966
48230	Rock Hill	3966
48231	Greenville	3966
48232	Summerville	3966
48233	Sumter	3966
48234	Hilton Head Island	3966
48235	Spartanburg	3966
48236	Florence	3966
48237	Goose Creek	3966
48238	Aiken	3966
48239	Myrtle Beach	3966
48240	Anderson	3966
48241	Greer	3966
48242	Mauldin	3966
48243	Greenwood	3966
48244	North Augusta	3966
48245	Easley	3966
48246	Simpsonville	3966
48247	Hanahan	3966
48248	Lexington	3966
48249	Conway	3966
48250	West Columbia	3966
48251	North Myrtle Beach	3966
48252	Clemson	3966
48253	Orangeburg	3966
48254	Cayce	3966
48255	Bluffton	3966
48256	Beaufort	3966
48257	Gaffney	3966
48258	Irmo	3966
48259	Fort Mill	3966
48260	Port Royal	3966
48261	Forest Acres	3966
48262	Newberry	3966
48263	Sioux Falls	3967
48264	Rapid City	3967
48265	Aberdeen	3967
48266	Brookings	3967
48267	Watertown	3967
48268	Mitchell	3967
48269	Yankton	3967
48270	Pierre	3967
48271	Huron	3967
48272	Spearfish	3967
48273	Vermillion	3967
48274	Brandon	3967
48275	Box Elder	3967
48276	Madison	3967
48277	Sturgis	3967
48278	Belle Fourche	3967
48279	Harrisburg	3967
48280	Charleston	3976
48281	Huntington	3976
48282	Morgantown	3976
48283	Parkersburg	3976
48284	Wheeling	3976
48285	Weirton	3976
48286	Fairmont	3976
48287	Martinsburg	3976
48288	Beckley	3976
48289	Clarksburg	3976
48290	South Charleston	3976
48291	St. Albans	3976
48292	Vienna	3976
48293	Bluefield	3976
48294	Moundsville	3976
48295	Bridgeport	3976
48296	Oak Hill	3976
48297	Dunbar	3976
48298	Elkins	3976
48299	Nitro	3976
48300	Hurricane	3976
48301	Princeton	3976
48302	Charles Town	3976
48303	Buckhannon	3976
48304	Keyser	3976
48305	New Martinsville	3976
48306	Grafton	3976
48307	Ranson	3976
48308	Point Pleasant	3976
48309	Westover	3976
48310	Weston	3976
48311	Lewisburg	3976
48312	Ravenswood	3976
48313	Summersville	3976
\.


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 185
-- Name: city_pk_id_city_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('city_pk_id_city_seq', 48313, true);


--
-- TOC entry 2316 (class 0 OID 58169)
-- Dependencies: 197
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY country (pk_id_country, country_code, country_name, phone_code) FROM stdin;
1	AF	Afghanistan	93
2	AL	Albania	355
3	DZ	Algeria	213
4	AS	American Samoa	1684
5	AD	Andorra	376
6	AO	Angola	244
7	AI	Anguilla	1264
8	AQ	Antarctica	0
9	AG	Antigua And Barbuda	1268
10	AR	Argentina	54
11	AM	Armenia	374
12	AW	Aruba	297
13	AU	Australia	61
14	AT	Austria	43
15	AZ	Azerbaijan	994
16	BS	Bahamas The	1242
17	BH	Bahrain	973
18	BD	Bangladesh	880
19	BB	Barbados	1246
20	BY	Belarus	375
21	BE	Belgium	32
22	BZ	Belize	501
23	BJ	Benin	229
24	BM	Bermuda	1441
25	BT	Bhutan	975
26	BO	Bolivia	591
27	BA	Bosnia and Herzegovina	387
28	BW	Botswana	267
29	BV	Bouvet Island	0
30	BR	Brazil	55
31	IO	British Indian Ocean Territory	246
32	BN	Brunei	673
33	BG	Bulgaria	359
34	BF	Burkina Faso	226
35	BI	Burundi	257
36	KH	Cambodia	855
37	CM	Cameroon	237
38	CA	Canada	1
39	CV	Cape Verde	238
40	KY	Cayman Islands	1345
41	CF	Central African Republic	236
42	TD	Chad	235
43	CL	Chile	56
44	CN	China	86
45	CX	Christmas Island	61
46	CC	Cocos (Keeling) Islands	672
47	CO	Colombia	57
48	KM	Comoros	269
49	CG	Republic Of The Congo	242
50	CD	Democratic Republic Of The Congo	242
51	CK	Cook Islands	682
52	CR	Costa Rica	506
53	CI	Cote D'Ivoire (Ivory Coast)	225
54	HR	Croatia (Hrvatska)	385
55	CU	Cuba	53
56	CY	Cyprus	357
57	CZ	Czech Republic	420
58	DK	Denmark	45
59	DJ	Djibouti	253
60	DM	Dominica	1767
61	DO	Dominican Republic	1809
62	TP	East Timor	670
63	EC	Ecuador	593
64	EG	Egypt	20
65	SV	El Salvador	503
66	GQ	Equatorial Guinea	240
67	ER	Eritrea	291
68	EE	Estonia	372
69	ET	Ethiopia	251
70	XA	External Territories of Australia	61
71	FK	Falkland Islands	500
72	FO	Faroe Islands	298
73	FJ	Fiji Islands	679
74	FI	Finland	358
75	FR	France	33
76	GF	French Guiana	594
77	PF	French Polynesia	689
78	TF	French Southern Territories	0
79	GA	Gabon	241
80	GM	Gambia The	220
81	GE	Georgia	995
82	DE	Germany	49
83	GH	Ghana	233
84	GI	Gibraltar	350
85	GR	Greece	30
86	GL	Greenland	299
87	GD	Grenada	1473
88	GP	Guadeloupe	590
89	GU	Guam	1671
90	GT	Guatemala	502
91	XU	Guernsey and Alderney	44
92	GN	Guinea	224
93	GW	Guinea-Bissau	245
94	GY	Guyana	592
95	HT	Haiti	509
96	HM	Heard and McDonald Islands	0
97	HN	Honduras	504
98	HK	Hong Kong S.A.R.	852
99	HU	Hungary	36
100	IS	Iceland	354
101	IN	India	91
102	ID	Indonesia	62
103	IR	Iran	98
104	IQ	Iraq	964
105	IE	Ireland	353
106	IL	Israel	972
107	IT	Italy	39
108	JM	Jamaica	1876
109	JP	Japan	81
110	XJ	Jersey	44
111	JO	Jordan	962
112	KZ	Kazakhstan	7
113	KE	Kenya	254
114	KI	Kiribati	686
115	KP	Korea North	850
116	KR	Korea South	82
117	KW	Kuwait	965
118	KG	Kyrgyzstan	996
119	LA	Laos	856
120	LV	Latvia	371
121	LB	Lebanon	961
122	LS	Lesotho	266
123	LR	Liberia	231
124	LY	Libya	218
125	LI	Liechtenstein	423
126	LT	Lithuania	370
127	LU	Luxembourg	352
128	MO	Macau S.A.R.	853
129	MK	Macedonia	389
130	MG	Madagascar	261
131	MW	Malawi	265
132	MY	Malaysia	60
133	MV	Maldives	960
134	ML	Mali	223
135	MT	Malta	356
136	XM	Man (Isle of)	44
137	MH	Marshall Islands	692
138	MQ	Martinique	596
139	MR	Mauritania	222
140	MU	Mauritius	230
141	YT	Mayotte	269
142	MX	Mexico	52
143	FM	Micronesia	691
144	MD	Moldova	373
145	MC	Monaco	377
146	MN	Mongolia	976
147	MS	Montserrat	1664
148	MA	Morocco	212
149	MZ	Mozambique	258
150	MM	Myanmar	95
151	NA	Namibia	264
152	NR	Nauru	674
153	NP	Nepal	977
154	AN	Netherlands Antilles	599
155	NL	Netherlands The	31
156	NC	New Caledonia	687
157	NZ	New Zealand	64
158	NI	Nicaragua	505
159	NE	Niger	227
160	NG	Nigeria	234
161	NU	Niue	683
162	NF	Norfolk Island	672
163	MP	Northern Mariana Islands	1670
164	NO	Norway	47
165	OM	Oman	968
166	PK	Pakistan	92
167	PW	Palau	680
168	PS	Palestinian Territory Occupied	970
169	PA	Panama	507
170	PG	Papua new Guinea	675
171	PY	Paraguay	595
172	PE	Peru	51
173	PH	Philippines	63
174	PN	Pitcairn Island	0
175	PL	Poland	48
176	PT	Portugal	351
177	PR	Puerto Rico	1787
178	QA	Qatar	974
179	RE	Reunion	262
180	RO	Romania	40
181	RU	Russia	70
182	RW	Rwanda	250
183	SH	Saint Helena	290
184	KN	Saint Kitts And Nevis	1869
185	LC	Saint Lucia	1758
186	PM	Saint Pierre and Miquelon	508
187	VC	Saint Vincent And The Grenadines	1784
188	WS	Samoa	684
189	SM	San Marino	378
190	ST	Sao Tome and Principe	239
191	SA	Saudi Arabia	966
192	SN	Senegal	221
193	RS	Serbia	381
194	SC	Seychelles	248
195	SL	Sierra Leone	232
196	SG	Singapore	65
197	SK	Slovakia	421
198	SI	Slovenia	386
199	XG	Smaller Territories of the UK	44
200	SB	Solomon Islands	677
201	SO	Somalia	252
202	ZA	South Africa	27
203	GS	South Georgia	0
204	SS	South Sudan	211
205	ES	Spain	34
206	LK	Sri Lanka	94
207	SD	Sudan	249
208	SR	Suriname	597
209	SJ	Svalbard And Jan Mayen Islands	47
210	SZ	Swaziland	268
211	SE	Sweden	46
212	CH	Switzerland	41
213	SY	Syria	963
214	TW	Taiwan	886
215	TJ	Tajikistan	992
216	TZ	Tanzania	255
217	TH	Thailand	66
218	TG	Togo	228
219	TK	Tokelau	690
220	TO	Tonga	676
221	TT	Trinidad And Tobago	1868
222	TN	Tunisia	216
223	TR	Turkey	90
224	TM	Turkmenistan	7370
225	TC	Turks And Caicos Islands	1649
226	TV	Tuvalu	688
227	UG	Uganda	256
228	UA	Ukraine	380
229	AE	United Arab Emirates	971
230	GB	United Kingdom	44
231	US	United States	1
232	UM	United States Minor Outlying Islands	1
233	UY	Uruguay	598
234	UZ	Uzbekistan	998
235	VU	Vanuatu	678
236	VA	Vatican City State (Holy See)	39
237	VE	Venezuela	58
238	VN	Vietnam	84
239	VG	Virgin Islands (British)	1284
240	VI	Virgin Islands (US)	1340
241	WF	Wallis And Futuna Islands	681
242	EH	Western Sahara	212
243	YE	Yemen	967
244	YU	Yugoslavia	38
245	ZM	Zambia	260
246	ZW	Zimbabwe	263
\.


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 186
-- Name: country_pk_id_country_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('country_pk_id_country_seq', 246, true);


--
-- TOC entry 2317 (class 0 OID 58176)
-- Dependencies: 198
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY migrations (id, migration, batch) FROM stdin;
\.


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 187
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('migrations_id_seq', 1, false);


--
-- TOC entry 2332 (class 0 OID 58309)
-- Dependencies: 213
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY observation (pk_id_observation, observation_value, observation_date, fk_id_agent, fk_id_sensor) FROM stdin;
\.


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 188
-- Name: observation_pk_id_observation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('observation_pk_id_observation_seq', 1, false);


--
-- TOC entry 2318 (class 0 OID 58182)
-- Dependencies: 199
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY password_resets (email, token, created_at) FROM stdin;
\.


--
-- TOC entry 2329 (class 0 OID 58280)
-- Dependencies: 210
-- Data for Name: sensor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sensor (pk_id_sensor, sensor_state, installation_date, descryption, port, min_value, max_value, fk_id_sensor_type, fk_id_agent) FROM stdin;
\.


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 189
-- Name: sensor_pk_id_sensor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sensor_pk_id_sensor_seq', 1, false);


--
-- TOC entry 2330 (class 0 OID 58293)
-- Dependencies: 211
-- Data for Name: sensor_rfid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sensor_rfid (pk_id_sensor_rfid, fk_id_agent) FROM stdin;
1	1
\.


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 190
-- Name: sensor_rfid_pk_id_sensor_rfid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sensor_rfid_pk_id_sensor_rfid_seq', 1, true);


--
-- TOC entry 2319 (class 0 OID 58192)
-- Dependencies: 200
-- Data for Name: sensor_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sensor_type (pk_id_sensor_type, sensor_type, fk_id_unit, communication_protocol) FROM stdin;
1	Light	1	No se que protocolo 
2	Loudness	2	No se que protocolo 
3	Vibration	3	No se que protocolo 
4	Accelerometer	4	No se que protocolo 
5	Temperature Int	4	No se que protocolo 
6	Temperature Ext	4	No se que protocolo 
\.


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 191
-- Name: sensor_type_pk_id_sensor_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sensor_type_pk_id_sensor_type_seq', 6, true);


--
-- TOC entry 2326 (class 0 OID 58251)
-- Dependencies: 207
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY site (pk_id_site, description, site_date, fk_id_user, fk_id_ubication) FROM stdin;
1	Agentes en ENES MORELIA	2018-01-11	3	1
\.


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 192
-- Name: site_pk_id_site_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('site_pk_id_site_seq', 1, true);


--
-- TOC entry 2320 (class 0 OID 58200)
-- Dependencies: 201
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY state (pk_id_state, state_name, fk_id_country) FROM stdin;
1	Andaman and Nicobar Islands	101
2	Andhra Pradesh	101
3	Arunachal Pradesh	101
4	Assam	101
5	Bihar	101
6	Chandigarh	101
7	Chhattisgarh	101
8	Dadra and Nagar Haveli	101
9	Daman and Diu	101
10	Delhi	101
11	Goa	101
12	Gujarat	101
13	Haryana	101
14	Himachal Pradesh	101
15	Jammu and Kashmir	101
16	Jharkhand	101
17	Karnataka	101
18	Kenmore	101
19	Kerala	101
20	Lakshadweep	101
21	Madhya Pradesh	101
22	Maharashtra	101
23	Manipur	101
24	Meghalaya	101
25	Mizoram	101
26	Nagaland	101
27	Narora	101
28	Natwar	101
29	Odisha	101
30	Paschim Medinipur	101
31	Pondicherry	101
32	Punjab	101
33	Rajasthan	101
34	Sikkim	101
35	Tamil Nadu	101
36	Telangana	101
37	Tripura	101
38	Uttar Pradesh	101
39	Uttarakhand	101
40	Vaishali	101
41	West Bengal	101
42	Badakhshan	1
43	Badgis	1
44	Baglan	1
45	Balkh	1
46	Bamiyan	1
47	Farah	1
48	Faryab	1
49	Gawr	1
50	Gazni	1
51	Herat	1
52	Hilmand	1
53	Jawzjan	1
54	Kabul	1
55	Kapisa	1
56	Khawst	1
57	Kunar	1
58	Lagman	1
59	Lawghar	1
60	Nangarhar	1
61	Nimruz	1
62	Nuristan	1
63	Paktika	1
64	Paktiya	1
65	Parwan	1
66	Qandahar	1
67	Qunduz	1
68	Samangan	1
69	Sar-e Pul	1
70	Takhar	1
71	Uruzgan	1
81	Fier	2