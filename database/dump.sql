--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
181	45	1	2999
182	47	2	2595
183	48	1	2999
184	49	1	2999
185	49	2	2595
186	49	3	2900
187	49	6	830
188	49	6	830
189	49	6	830
190	49	6	830
191	50	1	2999
192	50	2	2595
193	51	1	2999
194	51	2	2595
195	52	1	2999
196	53	1	2999
197	54	1	2999
198	54	2	2595
199	55	2	2595
200	56	2	2595
201	57	2	2595
202	58	1	2999
203	59	1	2999
204	59	3	2900
205	60	3	2900
206	61	1	2999
207	62	1	2999
208	63	1	2999
209	64	1	2999
210	65	1	2999
211	66	1	2999
212	66	2	2595
213	67	1	2999
214	67	2	2595
215	68	1	2999
216	68	2	2595
217	69	3	2900
218	70	1	2999
219	71	1	2999
220	72	1	2999
221	73	1	2999
222	74	1	2999
223	75	1	2999
224	76	1	2999
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
47	2020-05-20 01:25:49.54826+00
48	2020-05-30 21:27:52.520839+00
49	2020-05-30 21:28:15.659647+00
50	2020-05-30 21:34:03.2332+00
51	2020-05-30 22:17:13.092341+00
52	2020-05-30 22:39:11.120313+00
53	2020-05-30 22:41:12.426664+00
54	2020-05-30 22:42:58.532976+00
55	2020-05-30 22:46:39.378511+00
56	2020-05-30 23:21:42.882729+00
57	2020-05-31 00:04:26.71077+00
58	2020-06-01 18:44:27.939797+00
59	2020-06-01 19:46:21.707521+00
60	2020-06-02 20:32:37.112168+00
61	2020-06-02 21:19:36.355081+00
62	2020-06-02 21:43:33.279007+00
63	2020-06-03 20:00:22.204951+00
64	2020-06-03 21:01:49.843676+00
65	2020-06-03 21:53:08.639131+00
66	2020-06-03 22:16:59.951768+00
67	2020-06-03 22:30:44.496242+00
68	2020-06-04 22:12:53.473069+00
69	2020-06-04 22:35:08.062352+00
70	2020-06-04 22:41:19.598835+00
71	2020-06-04 22:52:48.243982+00
72	2020-06-04 22:57:21.135139+00
73	2020-06-04 23:09:01.919703+00
74	2020-06-04 23:14:31.934546+00
75	2020-06-04 23:21:19.79598+00
76	2020-06-08 17:28:35.789276+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
1	47	bob	21221	21221	2020-05-20 01:26:48.460985+00
2	56	frank	282828	heello	2020-05-30 23:22:46.699405+00
3	57	frank	282828	heello	2020-05-31 00:04:41.720427+00
4	64	sdsd	2323	sds	2020-06-03 21:17:48.381003+00
5	65	ssdsdsd	212212112	oi1e0921u03 2j103j 2103	2020-06-03 21:53:50.207295+00
6	66	dsdsd	222	2222	2020-06-03 22:30:38.616598+00
7	67	sdsadsad	2132132132132	cewd2ed12e123	2020-06-03 22:31:15.713994+00
8	68	John	1029102910920129	OAisoij2091 he0921j e09j 	2020-06-04 22:27:33.950834+00
9	69	dsadas	232323	adwdawd	2020-06-04 22:35:15.416735+00
10	70	dsadsa	32343243	2dadawdwadwad	2020-06-04 22:41:26.802036+00
11	71	dsadsad	132312321	dwqd2112	2020-06-04 22:53:21.350284+00
12	72	dsadasdasd	123213123	dsad2	2020-06-04 23:04:01.750323+00
13	73	dsadasd	123213213213	sadasdsadsad	2020-06-04 23:09:09.512401+00
14	74	sdsad	32121	sadasdas	2020-06-04 23:15:45.092657+00
15	75	sdadasd	211212	asd21ed	2020-06-04 23:21:26.741367+00
16	76	dsdsd	23232323	sad2321ed12e21e21e21e12e	2020-06-08 18:28:28.847567+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
1	Pro Stand	99900	https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWUG2_AV2?wid=1000&hei=1000&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1572391499434	Every aspect of Pro Stand was designed with pros in mind. Height, tilt, rotation — it’s completely adjustable, allowing your Pro Display XDR to fit seamlessly into any work environment.	With precision tilting and 120 mm of total height adjustment, Pro Stand helps Pro Display XDR adapt to any viewing condition. When you adjust the height, the angle of the display stays true. Thanks to a highly sophisticated mechanism in the arm, the display feels weightless, moves effortlessly, and stays exactly where you want it.
4	Apple Mac Pro Feet Kit	29900	https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MXNM2?wid=1144&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5%2C0.5&.v=1585846655927	Use the Mac Pro Feet Kit to install stainless steel feet to the bottom of your Mac Pro. 	The standard Mac Pro comes with four feet already installed, but if you purchased a Mac Pro with wheels, you can replace each of them with feet for improved stability. Installation required. A 1/4-inch to 4 mm hex bit is included, but additional tools are necessary. Replacing the Mac Pro wheels with feet reduces approximately one inch to the height of the frame.
5	VESA mount Adapter	19900	https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWUF2?wid=1144&hei=1144&fmt=jpeg&qlt=80&op_usm=0.5%2C0.5&.v=1572475284878	For pros who use a VESA stand, mount, or arm instead of a traditional stand, the VESA Mount Adapter is the perfect way to seamlessly add Pro Display XDR to your workspace.	It works with any VESA-compatible 100 by 100 mm wall mount, desk mount, stand, or articulating arm that can support the 16.49-pound (7.48 kg) Pro Display XDR.¹ And it can be placed and secured quickly and easily using the included Apple-designed lock key.
3	Apple Mac Pro Wheels Kit	69900	https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MX572?wid=1144&hei=1144&fmt=jpeg&qlt=95&op_usm=0.5%2C0.5&.v=1585846657704	Put your Mac Pro on wheels with the Mac Pro Wheels Kit.	The custom-designed stainless steel and rubber wheels make it easy to move your Mac Pro around, whether sliding it out from under your desk or across your studio. Installation required. A 1/4-inch to 4 mm hex bit is included, but additional tools are necessary. Replacing the Mac Pro feet with wheels adds approximately one inch to the height of the frame.
2	Apple Pen	12900	https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MK0C2?wid=1144&hei=1144&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1564075356758	Apple Pencil expands the power of iPad mini, iPad Air and iPad, and opens up new creative possibilities. 	It’s sensitive to pressure and tilt so you can easily vary line weight, create subtle shading and produce a wide range of artistic effects — just like a conventional pencil, but with pixel-perfect precision.
6	Apple Watch Hermès - 44mm Fauve Barénia Leather Single Tour Deployment Buckle	54900	https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MTQF2?wid=572&hei=572&fmt=jpeg&qlt=95&op_usm=0.5,0.5&.v=1566949149373	A sleek twist on an Hermès classic. 	The iconic, extra-long Double Tour wraps elegantly twice around the wrist. Handmade by artisans in France from buttery-smooth Barenia leather, textured Epsom leather, or supple Swift leather.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 224, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 76, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 16, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

