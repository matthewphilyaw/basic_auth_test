--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, username, password, salt, inserted_at, updated_at) VALUES (1, 'admin', '\x517f7da888fcee2755adc3805c3ff28afbadbc1ec4da5c78b1a52aa44ead339b', '\x916ccb4d5eac695e570753433c0be4fb8798fcee', '2015-09-03 02:46:11', '2015-09-03 02:46:11');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

