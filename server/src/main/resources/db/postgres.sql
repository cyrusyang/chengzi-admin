--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Debian 12.12-1.pgdg110+1)
-- Dumped by pg_dump version 15.3

-- Started on 2024-10-24 10:47:56

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
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--



ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 20810)
-- Name: permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(50) NOT NULL,
    type character varying(255) NOT NULL,
    parent_id integer,
    path character varying(255) DEFAULT NULL::character varying,
    redirect character varying(255) DEFAULT NULL::character varying,
    icon character varying(255) DEFAULT NULL::character varying,
    component character varying(255) DEFAULT NULL::character varying,
    layout character varying(255) DEFAULT NULL::character varying,
    keep_alive boolean,
    method character varying(255) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    show boolean DEFAULT true NOT NULL,
    enable boolean DEFAULT true NOT NULL,
    "order" integer
);


ALTER TABLE public.permission OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 20808)
-- Name: permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_id_seq OWNER TO postgres;

--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 210
-- Name: permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permission_id_seq OWNED BY public.permission.id;


--
-- TOC entry 203 (class 1259 OID 20759)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    gender integer,
    avatar character varying(255) DEFAULT 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80'::character varying NOT NULL,
    address character varying(255) DEFAULT NULL::character varying,
    email character varying(255) DEFAULT NULL::character varying,
    user_id integer NOT NULL,
    nick_name character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 20757)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_id_seq OWNER TO postgres;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 202
-- Name: profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profile_id_seq OWNED BY public.profile.id;


--
-- TOC entry 205 (class 1259 OID 20776)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    enable boolean DEFAULT true NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 20774)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 204
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- TOC entry 206 (class 1259 OID 20785)
-- Name: role_permissions_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_permissions_permission (
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.role_permissions_permission OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 20792)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    enable boolean DEFAULT true NOT NULL,
    create_time timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_time timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 20790)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 207
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 209 (class 1259 OID 20803)
-- Name: user_roles_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles_role (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles_role OWNER TO postgres;

--
-- TOC entry 2866 (class 2604 OID 20813)
-- Name: permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission ALTER COLUMN id SET DEFAULT nextval('public.permission_id_seq'::regclass);


--
-- TOC entry 2855 (class 2604 OID 20762)
-- Name: profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile ALTER COLUMN id SET DEFAULT nextval('public.profile_id_seq'::regclass);


--
-- TOC entry 2860 (class 2604 OID 20779)
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 2862 (class 2604 OID 20795)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3031 (class 0 OID 20810)
-- Dependencies: 211
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.permission VALUES (1, '资源管理', 'Resource_Mgt', 'MENU', 2, '/pms/resource', NULL, 'i-fe:list', '/src/views/pms/resource/index.vue', NULL, NULL, NULL, NULL, true, true, 1);
INSERT INTO public.permission VALUES (2, '系统管理', 'SysMgt', 'MENU', NULL, NULL, NULL, 'i-fe:grid', NULL, NULL, NULL, NULL, NULL, true, true, 2);
INSERT INTO public.permission VALUES (3, '角色管理', 'RoleMgt', 'MENU', 2, '/pms/role', NULL, 'i-fe:user-check', '/src/views/pms/role/index.vue', NULL, NULL, NULL, NULL, true, true, 2);
INSERT INTO public.permission VALUES (4, '用户管理', 'UserMgt', 'MENU', 2, '/pms/user', NULL, 'i-fe:user', '/src/views/pms/user/index.vue', NULL, true, NULL, NULL, true, true, 3);
INSERT INTO public.permission VALUES (5, '分配用户', 'RoleUser', 'MENU', 3, '/pms/role/user/:roleId', NULL, 'i-fe:user-plus', '/src/views/pms/role/role-user.vue', NULL, NULL, NULL, NULL, false, true, 1);
INSERT INTO public.permission VALUES (6, '业务示例', 'Demo', 'MENU', NULL, NULL, NULL, 'i-fe:grid', NULL, NULL, NULL, NULL, NULL, true, true, 1);
INSERT INTO public.permission VALUES (7, '图片上传', 'ImgUpload', 'MENU', 6, '/demo/upload', NULL, 'i-fe:image', '/src/views/demo/upload/index.vue', NULL, true, NULL, NULL, true, true, 2);
INSERT INTO public.permission VALUES (8, '个人资料', 'UserProfile', 'MENU', NULL, '/profile', NULL, 'i-fe:user', '/src/views/profile/index.vue', NULL, NULL, NULL, NULL, false, true, 99);
INSERT INTO public.permission VALUES (9, '基础功能', 'Base', 'MENU', NULL, '/base', NULL, 'i-fe:grid', NULL, NULL, NULL, NULL, NULL, true, true, 0);
INSERT INTO public.permission VALUES (10, '基础组件', 'BaseComponents', 'MENU', 9, '/base/components', NULL, 'i-me:awesome', '/src/views/base/index.vue', NULL, NULL, NULL, NULL, true, true, 1);
INSERT INTO public.permission VALUES (11, 'Unocss', 'Unocss', 'MENU', 9, '/base/unocss', NULL, 'i-me:awesome', '/src/views/base/unocss.vue', NULL, NULL, NULL, NULL, true, true, 2);
INSERT INTO public.permission VALUES (12, 'KeepAlive', 'KeepAlive', 'MENU', 9, '/base/keep-alive', NULL, 'i-me:awesome', '/src/views/base/keep-alive.vue', NULL, true, NULL, NULL, true, true, 3);
INSERT INTO public.permission VALUES (13, '创建新用户', 'AddUser', 'BUTTON', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, true, 1);
INSERT INTO public.permission VALUES (14, '图标 Icon', 'Icon', 'MENU', 9, '/base/icon', NULL, 'i-fe:feather', '/src/views/base/unocss-icon.vue', NULL, NULL, NULL, NULL, true, true, 0);
INSERT INTO public.permission VALUES (15, 'MeModal', 'TestModal', 'MENU', 9, '/testModal', NULL, 'i-me:dialog', '/src/views/base/test-modal.vue', NULL, NULL, NULL, NULL, true, true, 5);


--
-- TOC entry 3023 (class 0 OID 20759)
-- Dependencies: 203
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profile VALUES (1, NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80', NULL, NULL, 1, 'Admin');


--
-- TOC entry 3025 (class 0 OID 20776)
-- Dependencies: 205
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role VALUES (1, 'SUPER_ADMIN', '超级管理员', true);
INSERT INTO public.role VALUES (2, 'ROLE_QA', '质检员', true);


--
-- TOC entry 3026 (class 0 OID 20785)
-- Dependencies: 206
-- Data for Name: role_permissions_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role_permissions_permission VALUES (2, 1);
INSERT INTO public.role_permissions_permission VALUES (2, 2);
INSERT INTO public.role_permissions_permission VALUES (2, 3);
INSERT INTO public.role_permissions_permission VALUES (2, 4);
INSERT INTO public.role_permissions_permission VALUES (2, 5);
INSERT INTO public.role_permissions_permission VALUES (2, 9);
INSERT INTO public.role_permissions_permission VALUES (2, 10);
INSERT INTO public.role_permissions_permission VALUES (2, 11);
INSERT INTO public.role_permissions_permission VALUES (2, 12);
INSERT INTO public.role_permissions_permission VALUES (2, 14);
INSERT INTO public.role_permissions_permission VALUES (2, 15);


--
-- TOC entry 3028 (class 0 OID 20792)
-- Dependencies: 208
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" VALUES (1, 'admin', '$2a$10$FsAafxTTVVGXfIkJqvaiV.1vPfq4V9HW298McPldJgO829PR52a56', true, '2023-11-18 16:18:59.150632', '2023-11-18 16:18:59.150632');


--
-- TOC entry 3029 (class 0 OID 20803)
-- Dependencies: 209
-- Data for Name: user_roles_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_roles_role VALUES (1, 1);
INSERT INTO public.user_roles_role VALUES (1, 2);
INSERT INTO public.user_roles_role VALUES (2, 1);


--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 210
-- Name: permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permission_id_seq', 15, true);


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 202
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 2, true);


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 204
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 2, true);


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 207
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- TOC entry 2893 (class 2606 OID 20829)
-- Name: permission permission_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_code_key UNIQUE (code);


--
-- TOC entry 2895 (class 2606 OID 20827)
-- Name: permission permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 20771)
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 20773)
-- Name: profile profile_userId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT "profile_userId_key" UNIQUE (user_id);


--
-- TOC entry 2881 (class 2606 OID 20782)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2883 (class 2606 OID 20784)
-- Name: role unique_code_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT unique_code_name UNIQUE (code, name);


--
-- TOC entry 2885 (class 2606 OID 20789)
-- Name: role_permissions_permission unique_roleid_permissionid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_permissions_permission
    ADD CONSTRAINT unique_roleid_permissionid PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2891 (class 2606 OID 20807)
-- Name: user_roles_role unique_userid_roleid; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles_role
    ADD CONSTRAINT unique_userid_roleid PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2887 (class 2606 OID 20800)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 20802)
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-10-24 10:47:56

--
-- PostgreSQL database dump complete
--

