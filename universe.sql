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
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(30) NOT NULL,
    atomic_mass integer
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.elements_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elements_element_id_seq OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.elements_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_in_light_years numeric(4,1),
    description text,
    color character varying(30)
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
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_circumference_in_km integer,
    orbit_circumference_in_km integer,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    has_water boolean,
    has_intelligent_life boolean,
    star_id integer NOT NULL,
    size_circumference_in_km integer
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
    name character varying(30) NOT NULL,
    star_type character varying(30),
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL
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
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.elements_element_id_seq'::regclass);


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
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element VALUES (1, 'Hydrogen', 1);
INSERT INTO public.element VALUES (2, 'Helium', 2);
INSERT INTO public.element VALUES (3, 'Carbon', 6);
INSERT INTO public.element VALUES (4, 'Nitrogen', 7);
INSERT INTO public.element VALUES (5, 'Oxygen', 8);
INSERT INTO public.element VALUES (6, 'Sulfur', 16);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'narnia', 1.0, 'through the wardrobe; lots of snow', 'white');
INSERT INTO public.galaxy VALUES (7, 'special k', 30.0, 'vitamins and minerals', 'white');
INSERT INTO public.galaxy VALUES (8, 'tralfamador', 770.0, 'really out there', 'purple');
INSERT INTO public.galaxy VALUES (2, 'yoohoo', 50.5, 'also kind of milky', 'yellow/brown');
INSERT INTO public.galaxy VALUES (3, 'tapestry', 225.0, 'on a distant wall', 'purple');
INSERT INTO public.galaxy VALUES (1, 'milky way', 0.0, 'our home galaxy', 'red/blue');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon 1', 1234, 57035, 1);
INSERT INTO public.moon VALUES (2, 'moon 2', 1414, 90665, 1);
INSERT INTO public.moon VALUES (3, 'moon 3', 743, 76767, 1);
INSERT INTO public.moon VALUES (4, 'moon 4', 644, 64467, 1);
INSERT INTO public.moon VALUES (5, 'moon 5', 124, 15367, 2);
INSERT INTO public.moon VALUES (6, 'moon 6', 125, 14650, 2);
INSERT INTO public.moon VALUES (7, 'moon 7', 425, 25250, 3);
INSERT INTO public.moon VALUES (8, 'moon 8', 424, 25240, 3);
INSERT INTO public.moon VALUES (9, 'moon 9', 420, 46000, 4);
INSERT INTO public.moon VALUES (10, 'moon 10', 420, 46000, 5);
INSERT INTO public.moon VALUES (11, 'moon 11', 420, 46000, 5);
INSERT INTO public.moon VALUES (12, 'moon 12', 420, 46000, 5);
INSERT INTO public.moon VALUES (13, 'moon 13', 420, 46000, 5);
INSERT INTO public.moon VALUES (14, 'moon 14', 500, 15050, 6);
INSERT INTO public.moon VALUES (15, 'moon 15', 1000, 10000, 8);
INSERT INTO public.moon VALUES (16, 'moon 16', 1050, 10500, 8);
INSERT INTO public.moon VALUES (17, 'moon 17', 1070, 10700, 8);
INSERT INTO public.moon VALUES (18, 'moon 18', 1080, 10800, 8);
INSERT INTO public.moon VALUES (19, 'moon 19', 1090, 10900, 8);
INSERT INTO public.moon VALUES (20, 'moon 20', 2020, 20200, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'earth', true, true, 1, 40075);
INSERT INTO public.planet VALUES (2, 'planet a', true, false, 1, 32755);
INSERT INTO public.planet VALUES (3, 'planet c', true, false, 2, 24755);
INSERT INTO public.planet VALUES (4, 'planet d', true, false, 2, 28885);
INSERT INTO public.planet VALUES (5, 'planet e', false, false, 3, 28885);
INSERT INTO public.planet VALUES (6, 'planet f', false, false, 3, 22000);
INSERT INTO public.planet VALUES (7, 'planet g', false, false, 4, 12700);
INSERT INTO public.planet VALUES (8, 'planet h', false, false, 4, 16700);
INSERT INTO public.planet VALUES (9, 'planet j', false, false, 5, 16700);
INSERT INTO public.planet VALUES (10, 'planet k', false, false, 5, 30910);
INSERT INTO public.planet VALUES (11, 'planet L', false, false, 6, 20220);
INSERT INTO public.planet VALUES (12, 'planet m', false, false, 6, 21010);
INSERT INTO public.planet VALUES (13, 'planet M', true, false, 7, 1220);
INSERT INTO public.planet VALUES (14, 'planet N', false, false, 7, 2220);
INSERT INTO public.planet VALUES (15, 'planet O', false, false, 8, 6260);
INSERT INTO public.planet VALUES (16, 'planet P', false, true, 8, 76260);
INSERT INTO public.planet VALUES (17, 'planet Q', false, true, 9, 17600);
INSERT INTO public.planet VALUES (18, 'planet R', false, false, 9, 16700);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'zappa', 'A', 32000, 3);
INSERT INTO public.star VALUES (6, 'zorn', 'K', 38340, 3);
INSERT INTO public.star VALUES (5, 'apaak', 'G', 48600, 2);
INSERT INTO public.star VALUES (1, 'vai', 'O', 50000, 2);
INSERT INTO public.star VALUES (8, 'flanary', 'O', 60, 1);
INSERT INTO public.star VALUES (4, 'dillinger', 'B', 52500, 6);
INSERT INTO public.star VALUES (7, 'beejuice', 'K', 40, 7);
INSERT INTO public.star VALUES (9, 'garner', 'K', 383, 7);
INSERT INTO public.star VALUES (3, 'halvorson', 'F', 34500, 8);


--
-- Name: elements_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.elements_element_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: element elements_element_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT elements_element_id_key UNIQUE (element_id);


--
-- Name: element elements_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT elements_pkey PRIMARY KEY (element_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

