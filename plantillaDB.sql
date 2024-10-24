--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

-- Started on 2024-08-05 23:23:27

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 231 (class 1259 OID 168561)
-- Name: d008t_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d008t_usuarios (
    co_usuario integer NOT NULL,
    usuario character varying(60) NOT NULL,
    nu_clave character varying(100) NOT NULL,
    nb_usuario character varying(160) NOT NULL,
    nb2_usuario character varying(160),
    ap_usuario character varying(160) NOT NULL,
    ap2_usuario character varying(160),
    cedula_usr character varying(15) NOT NULL,
    gerencia character varying(60) NOT NULL,
    co_rol integer,
    tx_correo character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.d008t_usuarios OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 168560)
-- Name: d008t_usuarios_co_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d008t_usuarios_co_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d008t_usuarios_co_usuario_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 230
-- Name: d008t_usuarios_co_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.d008t_usuarios_co_usuario_seq OWNED BY public.d008t_usuarios.co_usuario;


--
-- TOC entry 215 (class 1259 OID 168368)
-- Name: d009t_personal_co_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d009t_personal_co_personal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d009t_personal_co_personal_seq OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 168373)
-- Name: d010t_especialidad_personal_co_especialidad_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d010t_especialidad_personal_co_especialidad_personal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d010t_especialidad_personal_co_especialidad_personal_seq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 168378)
-- Name: d011t_horarios_personal_co_horario_personal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d011t_horarios_personal_co_horario_personal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d011t_horarios_personal_co_horario_personal_seq OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 171253)
-- Name: d012t_fotoperfil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d012t_fotoperfil (
    id_fotoperfil integer NOT NULL,
    tx_archivo character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    id_usuario integer NOT NULL
);


ALTER TABLE public.d012t_fotoperfil OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 171252)
-- Name: d012t_fotoperfil_id_fotoperfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d012t_fotoperfil_id_fotoperfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d012t_fotoperfil_id_fotoperfil_seq OWNER TO postgres;

--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 232
-- Name: d012t_fotoperfil_id_fotoperfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.d012t_fotoperfil_id_fotoperfil_seq OWNED BY public.d012t_fotoperfil.id_fotoperfil;


--
-- TOC entry 218 (class 1259 OID 168383)
-- Name: d013t_permisos_id_permiso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.d013t_permisos_id_permiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.d013t_permisos_id_permiso_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 168384)
-- Name: d013t_permisos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.d013t_permisos (
    id_permiso bigint DEFAULT nextval('public.d013t_permisos_id_permiso_seq'::regclass) NOT NULL,
    co_rol integer NOT NULL,
    id_ruta integer NOT NULL,
    tx_permisos boolean[] NOT NULL
);


ALTER TABLE public.d013t_permisos OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 168390)
-- Name: e001m_especialidades_co_especialidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.e001m_especialidades_co_especialidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.e001m_especialidades_co_especialidad_seq OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 168403)
-- Name: r004m_roles_co_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.r004m_roles_co_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.r004m_roles_co_rol_seq OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 168404)
-- Name: i005t_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i005t_roles (
    co_rol integer DEFAULT nextval('public.r004m_roles_co_rol_seq'::regclass) NOT NULL,
    nb_rol character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.i005t_roles OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 168408)
-- Name: i008t_parentescos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i008t_parentescos (
    co_parentesco smallint NOT NULL,
    nb_parentesco character varying(50) NOT NULL
);


ALTER TABLE public.i008t_parentescos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 168411)
-- Name: i009t_rutas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i009t_rutas (
    id_ruta integer NOT NULL,
    nb_ruta character varying NOT NULL,
    tx_tag_name character varying
);


ALTER TABLE public.i009t_rutas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 168416)
-- Name: i009t_rutas_id_ruta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i009t_rutas_id_ruta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i009t_rutas_id_ruta_seq OWNER TO postgres;

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 225
-- Name: i009t_rutas_id_ruta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i009t_rutas_id_ruta_seq OWNED BY public.i009t_rutas.id_ruta;


--
-- TOC entry 226 (class 1259 OID 168417)
-- Name: i010t_menus_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i010t_menus_id_menu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i010t_menus_id_menu_seq OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 168418)
-- Name: i010t_menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i010t_menus (
    id_menu integer DEFAULT nextval('public.i010t_menus_id_menu_seq'::regclass) NOT NULL,
    co_rol integer NOT NULL,
    tx_menu jsonb NOT NULL
);


ALTER TABLE public.i010t_menus OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 168424)
-- Name: i011t_items_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i011t_items_menu (
    id_item integer NOT NULL,
    id_ruta integer NOT NULL,
    json_item jsonb NOT NULL
);


ALTER TABLE public.i011t_items_menu OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 168429)
-- Name: i011t_items_menu_id_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i011t_items_menu_id_item_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i011t_items_menu_id_item_seq OWNER TO postgres;

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 229
-- Name: i011t_items_menu_id_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i011t_items_menu_id_item_seq OWNED BY public.i011t_items_menu.id_item;


--
-- TOC entry 4731 (class 2604 OID 168564)
-- Name: d008t_usuarios co_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d008t_usuarios ALTER COLUMN co_usuario SET DEFAULT nextval('public.d008t_usuarios_co_usuario_seq'::regclass);


--
-- TOC entry 4733 (class 2604 OID 171256)
-- Name: d012t_fotoperfil id_fotoperfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d012t_fotoperfil ALTER COLUMN id_fotoperfil SET DEFAULT nextval('public.d012t_fotoperfil_id_fotoperfil_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 168431)
-- Name: i009t_rutas id_ruta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i009t_rutas ALTER COLUMN id_ruta SET DEFAULT nextval('public.i009t_rutas_id_ruta_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 168432)
-- Name: i011t_items_menu id_item; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i011t_items_menu ALTER COLUMN id_item SET DEFAULT nextval('public.i011t_items_menu_id_item_seq'::regclass);


--
-- TOC entry 4911 (class 0 OID 168561)
-- Dependencies: 231
-- Data for Name: d008t_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d008t_usuarios (co_usuario, usuario, nu_clave, nb_usuario, nb2_usuario, ap_usuario, ap2_usuario, cedula_usr, gerencia, co_rol, tx_correo, created_at, updated_at) FROM stdin;
2	gmarcano	8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92	gabriel	\N	marcano	\N	28415452	altamira	1	gabrielmarcano141@gmail.com	2024-07-28 02:41:18.671961	\N
\.


--
-- TOC entry 4913 (class 0 OID 171253)
-- Dependencies: 233
-- Data for Name: d012t_fotoperfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d012t_fotoperfil (id_fotoperfil, tx_archivo, created_at, updated_at, id_usuario) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 168384)
-- Dependencies: 219
-- Data for Name: d013t_permisos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.d013t_permisos (id_permiso, co_rol, id_ruta, tx_permisos) FROM stdin;
4	1	4	{t,t,t,t}
14	1	9	{t,t,t,t}
\.


--
-- TOC entry 4902 (class 0 OID 168404)
-- Dependencies: 222
-- Data for Name: i005t_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i005t_roles (co_rol, nb_rol, created_at, updated_at) FROM stdin;
1	SUPERUSER	\N	\N
\.


--
-- TOC entry 4903 (class 0 OID 168408)
-- Dependencies: 223
-- Data for Name: i008t_parentescos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i008t_parentescos (co_parentesco, nb_parentesco) FROM stdin;
0	TITULAR
1	HIJO
2	CÓNYUGE
3	MADRE
4	PADRE
5	CARGA ESPECIAL
\.


--
-- TOC entry 4904 (class 0 OID 168411)
-- Dependencies: 224
-- Data for Name: i009t_rutas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i009t_rutas (id_ruta, nb_ruta, tx_tag_name) FROM stdin;
4	/gestion-usuarios	Gestión Usuarios
9	/perfil	Perfil
\.


--
-- TOC entry 4907 (class 0 OID 168418)
-- Dependencies: 227
-- Data for Name: i010t_menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i010t_menus (id_menu, co_rol, tx_menu) FROM stdin;
1	1	[{"icon": "pi pi-fw pi-user", "label": "Perfil", "command": "() => { router.push('/perfil')}"}, {"icon": "pi pi-fw pi-id-card", "label": "Gestion de Usuarios", "command": "() => { router.push('/gestion-usuarios')}"}]
\.


--
-- TOC entry 4908 (class 0 OID 168424)
-- Dependencies: 228
-- Data for Name: i011t_items_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i011t_items_menu (id_item, id_ruta, json_item) FROM stdin;
4	4	{"icon": "pi pi-fw pi-id-card", "label": "Gestion de Usuarios", "command": "() => { router.push('/gestion-usuarios')}"}
10	9	{"icon": "pi pi-fw pi-user", "label": "Perfil", "command": "() => { router.push('/perfil')}"}
\.


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 230
-- Name: d008t_usuarios_co_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d008t_usuarios_co_usuario_seq', 3, true);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 215
-- Name: d009t_personal_co_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d009t_personal_co_personal_seq', 3, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 216
-- Name: d010t_especialidad_personal_co_especialidad_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d010t_especialidad_personal_co_especialidad_personal_seq', 3, true);


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 217
-- Name: d011t_horarios_personal_co_horario_personal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d011t_horarios_personal_co_horario_personal_seq', 5, true);


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 232
-- Name: d012t_fotoperfil_id_fotoperfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d012t_fotoperfil_id_fotoperfil_seq', 2, true);


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 218
-- Name: d013t_permisos_id_permiso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.d013t_permisos_id_permiso_seq', 14, true);


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 220
-- Name: e001m_especialidades_co_especialidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.e001m_especialidades_co_especialidad_seq', 3, true);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 225
-- Name: i009t_rutas_id_ruta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i009t_rutas_id_ruta_seq', 9, true);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 226
-- Name: i010t_menus_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i010t_menus_id_menu_seq', 5, true);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 229
-- Name: i011t_items_menu_id_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i011t_items_menu_id_item_seq', 10, true);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 221
-- Name: r004m_roles_co_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.r004m_roles_co_rol_seq', 5, true);


--
-- TOC entry 4746 (class 2606 OID 168567)
-- Name: d008t_usuarios d008t_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d008t_usuarios
    ADD CONSTRAINT d008t_usuarios_pkey PRIMARY KEY (co_usuario);


--
-- TOC entry 4736 (class 2606 OID 168442)
-- Name: d013t_permisos d013t_permisos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d013t_permisos
    ADD CONSTRAINT d013t_permisos_pkey PRIMARY KEY (id_permiso);


--
-- TOC entry 4740 (class 2606 OID 168448)
-- Name: i009t_rutas i009t_rutas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i009t_rutas
    ADD CONSTRAINT i009t_rutas_pkey PRIMARY KEY (id_ruta);


--
-- TOC entry 4742 (class 2606 OID 168450)
-- Name: i010t_menus i010t_menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i010t_menus
    ADD CONSTRAINT i010t_menus_pkey PRIMARY KEY (id_menu);


--
-- TOC entry 4744 (class 2606 OID 168452)
-- Name: i011t_items_menu i011t_items_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i011t_items_menu
    ADD CONSTRAINT i011t_items_menu_pkey PRIMARY KEY (id_item);


--
-- TOC entry 4738 (class 2606 OID 168454)
-- Name: i005t_roles r004m_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i005t_roles
    ADD CONSTRAINT r004m_roles_pkey PRIMARY KEY (co_rol);


--
-- TOC entry 4751 (class 2606 OID 168568)
-- Name: d008t_usuarios fk_co_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d008t_usuarios
    ADD CONSTRAINT fk_co_rol FOREIGN KEY (co_rol) REFERENCES public.i005t_roles(co_rol);


--
-- TOC entry 4750 (class 2606 OID 168490)
-- Name: i011t_items_menu fk_item_ruta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i011t_items_menu
    ADD CONSTRAINT fk_item_ruta FOREIGN KEY (id_ruta) REFERENCES public.i009t_rutas(id_ruta) NOT VALID;


--
-- TOC entry 4749 (class 2606 OID 168495)
-- Name: i010t_menus fk_menu_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i010t_menus
    ADD CONSTRAINT fk_menu_rol FOREIGN KEY (co_rol) REFERENCES public.i005t_roles(co_rol) NOT VALID;


--
-- TOC entry 4747 (class 2606 OID 168500)
-- Name: d013t_permisos fk_permisos_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d013t_permisos
    ADD CONSTRAINT fk_permisos_rol FOREIGN KEY (co_rol) REFERENCES public.i005t_roles(co_rol) NOT VALID;


--
-- TOC entry 4748 (class 2606 OID 168505)
-- Name: d013t_permisos fk_permisos_rutas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.d013t_permisos
    ADD CONSTRAINT fk_permisos_rutas FOREIGN KEY (id_ruta) REFERENCES public.i009t_rutas(id_ruta) NOT VALID;


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-08-05 23:23:28

--
-- PostgreSQL database dump complete
--

