--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size_in_yl integer NOT NULL,
    distance_in_yl integer NOT NULL,
    constellation character varying(20),
    description text,
    speed_miles_sec numeric
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_km integer,
    discovery_year integer NOT NULL,
    discover_name character varying(30) NOT NULL
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
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    moons integer,
    discovery_year integer,
    magnitude numeric NOT NULL,
    kepler_discovery boolean,
    tess_discovery boolean,
    direct_obs boolean
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
    galaxy_id integer,
    name character varying(20) NOT NULL,
    size_in_km integer NOT NULL,
    distance_in_ly numeric NOT NULL,
    known_planets integer,
    magnitude numeric,
    stellar_class_id integer NOT NULL
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
-- Name: stellar_class; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.stellar_class (
    stellar_class_id integer NOT NULL,
    name character varying(20) NOT NULL,
    effective_temp_min_k integer NOT NULL,
    effective_temp_max_k integer NOT NULL,
    chromacity character varying(20) NOT NULL
);


ALTER TABLE public.stellar_class OWNER TO freecodecamp;

--
-- Name: stellar_class_stellar_class_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stellar_class_stellar_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stellar_class_stellar_class_id_seq OWNER TO freecodecamp;

--
-- Name: stellar_class_stellar_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stellar_class_stellar_class_id_seq OWNED BY public.stellar_class.stellar_class_id;


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
-- Name: stellar_class stellar_class_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_class ALTER COLUMN stellar_class_id SET DEFAULT nextval('public.stellar_class_stellar_class_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 53000, 8, 'Sagitarius', 'The Milky Way is the galaxy that includes our Solar System, with the name describing the galaxy s appearance from Earth a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 130.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000, 2537, 'Andromeda', 'Barred Spiral galaxy', 70.0);
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxy', 113446, 45000000, 'Corvus', 'The Antennae Galaxies (also known as NGC 4038/NGC 4039 or Caldwell 60/Caldwell 61) are a pair of interacting galaxies in the constellation Corvus.', 410.0);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 122732, 111000000, 'Centaurus', 'Spiral galaxy', 5000.0);
INSERT INTO public.galaxy VALUES (5, 'Malin 1 Galaxy', 107100, 17000000, 'Comae Berenice', 'Malin 1 is a giant low surface brightness (LSB) spiral galaxy. It is located 1.19 billion light-years (366 Mpc) away in the constellation Coma Berenices', 169000.0);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 269000, 73000000, 'Ursa Major', 'Messier 81 is a grand design spiral galaxy about 12 million light-years away, with a diameter of 90,000 light years, in the constellation Ursa Major.', 3400.0);
INSERT INTO public.galaxy VALUES (7, 'Messier 85', 125000, 60000000, 'Comae Berenice', 'Messier 85 is a lenticular galaxy, or elliptical galaxy for other authors, in the Coma Berenices constellation. It is 60 million light-years away', 196340.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', 1080, -1000, 'Babylonians');
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 7, 1877, 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 4, 1877, 'Asaph Hall');
INSERT INTO public.moon VALUES (4, 5, 'Io', 1821, 1610, 'Galileo');
INSERT INTO public.moon VALUES (5, 5, 'Europa', 1560, 1610, 'Galileo');
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 1070, 1610, 'Galileo');
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 2410, 1610, 'Galileo');
INSERT INTO public.moon VALUES (8, 5, 'Amalthea', 84, 1892, 'Barnard');
INSERT INTO public.moon VALUES (9, 5, 'Himalia', 70, 1904, 'Perrine');
INSERT INTO public.moon VALUES (10, 5, 'Elara', 43, 1905, 'Perrine');
INSERT INTO public.moon VALUES (11, 5, 'Pasiphae', 30, 1908, 'Melotte');
INSERT INTO public.moon VALUES (12, 5, 'Sinope', 19, 1914, 'Nicholson');
INSERT INTO public.moon VALUES (13, 5, 'Lysithea', 18, 1938, 'Nicholson');
INSERT INTO public.moon VALUES (14, 5, 'Carme', 23, 1938, 'Nicholson');
INSERT INTO public.moon VALUES (15, 5, 'Ananke', 14, 1951, 'Nicholson');
INSERT INTO public.moon VALUES (16, 5, 'Leda', 10, 1974, 'Kowal');
INSERT INTO public.moon VALUES (17, 5, 'Thebe', 50, 1979, 'Synnott');
INSERT INTO public.moon VALUES (18, 5, 'Adrastea', 8, 1979, 'Jewitt');
INSERT INTO public.moon VALUES (19, 5, 'Metis', 22, 1979, 'Synnott');
INSERT INTO public.moon VALUES (20, 5, 'Callirrhoe', 5, 2000, 'Scotti');
INSERT INTO public.moon VALUES (21, 5, 'Themisto', 4, 1975, 'Kowal');
INSERT INTO public.moon VALUES (22, 5, 'Megaclite', 3, 2000, 'Sheppard');
INSERT INTO public.moon VALUES (23, 5, 'Taygete', 3, 2000, 'Sheppard');
INSERT INTO public.moon VALUES (24, 5, 'Chaldene', 2, 2000, 'Sheppard');
INSERT INTO public.moon VALUES (25, 5, 'Harpalyke', 2, 2000, 'Sheppard');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 0, 1631, 0.56, false, false, true);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 0, 1610, 1, false, false, true);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 1, 0, 1, false, false, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 2, 1610, -2.94, false, false, true);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 53, 1610, -2.85, false, false, true);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 82, 1610, -2.94, false, false, true);
INSERT INTO public.planet VALUES (7, 1, 'Neptune', 14, 1846, 7.8, false, false, true);
INSERT INTO public.planet VALUES (8, 1, 'Uranus', 27, 1781, 5.7, false, false, true);
INSERT INTO public.planet VALUES (9, 2, 'Proxima Centauri b', 0, 2016, 10.43, false, true, false);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri c', 0, 2020, 11.1, false, true, false);
INSERT INTO public.planet VALUES (11, 2, 'Proxima Centauri d', 0, 2020, 10.9, false, true, false);
INSERT INTO public.planet VALUES (12, 10, 'Comae Berenice b', 0, 2007, 4.72, true, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1390000, 0.00001581, 8, 4.85, 5);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 213308, 4, 3, 11.5, 5);
INSERT INTO public.star VALUES (3, 1, 'Barnard Star', 160000, 6, 1, 9.5, 4);
INSERT INTO public.star VALUES (4, 1, 'Wolf 359', 69166666, 7.9, 2, 13.5, 6);
INSERT INTO public.star VALUES (5, 1, 'Lalande 21185', 13181000, 8.3, 2, 7.5, 1);
INSERT INTO public.star VALUES (6, 1, 'Sirius A', 11800000, 8.6, 0, -1.3, 5);
INSERT INTO public.star VALUES (7, 1, 'Sirius B', 10890000, 8.6, 0, -1.33, 5);
INSERT INTO public.star VALUES (8, 1, 'Vega', 1021100, 25, 1, 0.03, 3);
INSERT INTO public.star VALUES (9, 1, 'KY Cygni', 26000000, 11.41, 1, -2.56, 5);
INSERT INTO public.star VALUES (10, 7, 'Comae Berenice', 43000000, 33000000, 5, 11, 7);


--
-- Data for Name: stellar_class; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.stellar_class VALUES (1, 'O', 30000, 30000, 'blue');
INSERT INTO public.stellar_class VALUES (2, 'B', 10000, 30000, 'blue white');
INSERT INTO public.stellar_class VALUES (3, 'A', 7500, 30000, 'white');
INSERT INTO public.stellar_class VALUES (4, 'F', 6000, 7500, 'yellow white');
INSERT INTO public.stellar_class VALUES (5, 'G', 5200, 6000, 'yellow');
INSERT INTO public.stellar_class VALUES (6, 'K', 3700, 5200, 'light orange');
INSERT INTO public.stellar_class VALUES (7, 'M', 2400, 3700, 'orange red');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: stellar_class_stellar_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stellar_class_stellar_class_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key PRIMARY KEY (star_id);


--
-- Name: stellar_class stellar_class_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_class
    ADD CONSTRAINT stellar_class_name_key UNIQUE (name);


--
-- Name: stellar_class stellar_class_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.stellar_class
    ADD CONSTRAINT stellar_class_pkey PRIMARY KEY (stellar_class_id);


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
-- Name: star star_stellar_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_stellar_class_id_fkey FOREIGN KEY (stellar_class_id) REFERENCES public.stellar_class(stellar_class_id);


--
-- PostgreSQL database dump complete
--

