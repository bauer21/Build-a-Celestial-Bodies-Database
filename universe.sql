--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: cometa; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cometa (
    cometa_id integer NOT NULL,
    name character varying(100) NOT NULL,
    speed_kmh numeric NOT NULL,
    description text,
    has_tail boolean NOT NULL,
    discovered_year integer
);


ALTER TABLE public.cometa OWNER TO freecodecamp;

--
-- Name: cometa_cometa_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cometa_cometa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cometa_cometa_id_seq OWNER TO freecodecamp;

--
-- Name: cometa_cometa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cometa_cometa_id_seq OWNED BY public.cometa.cometa_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    galaxy_type character varying(20),
    distance_to_earth double precision NOT NULL,
    number_of_satellites integer NOT NULL,
    active_core boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20),
    moon_id integer NOT NULL,
    diameter double precision NOT NULL,
    mass double precision NOT NULL,
    distance_to_earth double precision,
    orbital_period integer,
    visible_from_earth boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    planet_diameter double precision NOT NULL,
    planet_mass double precision NOT NULL,
    number_of_moons integer,
    atmosphere boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    spectral_type character varying(3),
    star_mass double precision NOT NULL,
    star_radiu double precision NOT NULL,
    binary_sistem boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: cometa cometa_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cometa ALTER COLUMN cometa_id SET DEFAULT nextval('public.cometa_cometa_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cometa; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cometa VALUES (1, 'Halley', 157838, 'Famoso cometa que es visible desde la Tierra aproximadamente cada 75-76 años.', true, -240);
INSERT INTO public.cometa VALUES (2, 'Hale-Bopp', 157200, 'Uno de los cometas más brillantes y más grandes que se ha observado.', true, 1995);
INSERT INTO public.cometa VALUES (3, 'Encke', 68500, 'Cometa periódico que tiene uno de los periodos orbitales más cortos.', true, 1786);
INSERT INTO public.cometa VALUES (4, 'Lovejoy', 145000, 'Cometa descubierto por el astrónomo aficionado Terry Lovejoy.', true, 2011);
INSERT INTO public.cometa VALUES (5, 'Swift-Tuttle', 58900, 'El cometa de mayor tamaño conocido que pasa regularmente cerca de la Tierra.', true, 1862);
INSERT INTO public.cometa VALUES (6, 'Shoemaker-Levy 9', 60000, 'Cometa que se fragmentó y chocó con Júpiter en 1994.', false, 1993);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'espiral', 27000, 50, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'espiral', 2537000, 14, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'espiral', 31000000, 5, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulo', 'espiral', 3000000, 54, false);
INSERT INTO public.galaxy VALUES (5, 'M87', 'elliptical', 53000000, 12, true);
INSERT INTO public.galaxy VALUES (6, 'IC 1101', 'elliptical', 1045000000, 0, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 3474.8, 384400, NULL, 27, true, 1);
INSERT INTO public.moon VALUES ('Europa', 2, 3121.6, 670900, NULL, 4, false, 1);
INSERT INTO public.moon VALUES ('Ganymede', 3, 5268.2, 1070400, NULL, 7, false, 1);
INSERT INTO public.moon VALUES ('Callisto', 4, 4820.6, 1882700, NULL, 17, false, 1);
INSERT INTO public.moon VALUES ('Io', 5, 3643.2, 421700, NULL, 2, false, 1);
INSERT INTO public.moon VALUES ('Titan', 6, 5149.5, 1221870, NULL, 16, false, 1);
INSERT INTO public.moon VALUES ('Rhea', 7, 1527.6, 527040, NULL, 5, false, 1);
INSERT INTO public.moon VALUES ('Iapetus', 8, 1469, 3560820, NULL, 79, false, 1);
INSERT INTO public.moon VALUES ('Dione', 9, 1122.8, 377400, NULL, 3, false, 1);
INSERT INTO public.moon VALUES ('Triton', 10, 2706.8, 354759, NULL, 6, false, 1);
INSERT INTO public.moon VALUES ('Enceladus', 11, 504.2, 237948, NULL, 1, false, 1);
INSERT INTO public.moon VALUES ('Mimas', 12, 396.4, 185520, NULL, 1, false, 1);
INSERT INTO public.moon VALUES ('Oberon', 13, 1522.8, 583520, NULL, 13, false, 1);
INSERT INTO public.moon VALUES ('Titania', 14, 1577.8, 435840, NULL, 9, false, 1);
INSERT INTO public.moon VALUES ('Miranda', 15, 471.6, 129870, NULL, 1, false, 1);
INSERT INTO public.moon VALUES ('Ariel', 16, 1157.8, 191020, NULL, 3, false, 1);
INSERT INTO public.moon VALUES ('Umbriel', 17, 1169.4, 265970, NULL, 4, false, 1);
INSERT INTO public.moon VALUES ('Phobos', 18, 22.4, 9377, NULL, 0, false, 1);
INSERT INTO public.moon VALUES ('Deimos', 19, 12.4, 23460, NULL, 1, false, 1);
INSERT INTO public.moon VALUES ('Charon', 20, 1212, 19591, NULL, 6, false, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4880, 0.055, 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 0.815, 0, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12742, 1, 1, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6779, 0.107, 2, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139820, 317.8, 79, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 116460, 95.2, 83, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 50724, 14.5, 27, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49244, 17.1, 14, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2377, 0.0022, 5, true, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 25000, 36, 9, true, 1);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 12000, 1.27, 0, true, 1);
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 11900, 0.692, 0, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'G2V', 1, 1, false, 1);
INSERT INTO public.star VALUES (2, 'Sirio A', 'A1V', 2.06, 1.71, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'M12', 11.6, 764, false, 1);
INSERT INTO public.star VALUES (4, 'Alfa Centauri', 'G2V', 1.1, 1.22, true, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'M5V', 0.12, 0.14, true, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'B8I', 18, 78, false, 1);


--
-- Name: cometa_cometa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cometa_cometa_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: cometa cometa_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cometa
    ADD CONSTRAINT cometa_name_key UNIQUE (name);


--
-- Name: cometa cometa_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cometa
    ADD CONSTRAINT cometa_pkey PRIMARY KEY (cometa_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

