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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type_id integer NOT NULL,
    distance_from_earth numeric(3,1),
    age_in_millions_of_years integer,
    messier_number character varying(10)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    moon_type_id integer NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet numeric(6,1),
    age_in_millions_of_years integer
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
-- Name: moon_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_type (
    moon_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.moon_type OWNER TO freecodecamp;

--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_type_moon_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_type_moon_type_id_seq OWNER TO freecodecamp;

--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_type_moon_type_id_seq OWNED BY public.moon_type.moon_type_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    planet_type_id integer NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    distance_from_star numeric(5,2),
    age_in_millions_of_years integer,
    has_rings boolean
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    distance_from_earth numeric(5,2),
    age_in_millions_of_years integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_type moon_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type ALTER COLUMN moon_type_id SET DEFAULT nextval('public.moon_type_moon_type_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Nearest large galaxy to our own (Milky Way)', 1, 2.5, 2500, 'M31');
INSERT INTO public.galaxy VALUES (2, 'Whirpool', 'Face-on spiral galaxy with prominent dust lanes', 1, 23.0, 15000, 'M51');
INSERT INTO public.galaxy VALUES (3, 'Bode', 'Part of a small group of galaxies', 1, 12.0, 11000, 'M81');
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'Starburst galaxy with intense star formation', 3, 11.5, 60000, 'M82');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Face-on spiral galaxy with well-defined arms', 1, 21.0, 10000, 'M101');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Edge-on elliptical galaxy with a prominent dust lane', 2, 28.0, 13000, 'M104');
INSERT INTO public.galaxy VALUES (7, 'Triangulum', 'Third-largest member of the Local Group (after Milky Way and Andromeda)', 1, 2.9, 10000, 'M33');
INSERT INTO public.galaxy VALUES (8, 'NGC 4621', 'Elliptical galaxy known for its smooth, featureless appearance', 2, 23.0, 13000, 'M59');
INSERT INTO public.galaxy VALUES (9, 'NGC 1427A', 'Irregular galaxy with a complex structure and active star formation', 3, 52.0, 14000, NULL);
INSERT INTO public.galaxy VALUES (10, 'Milky Way', 'Our home galaxy', 4, 0.0, 13500, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'elliptical', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'irregular', NULL);
INSERT INTO public.galaxy_type VALUES (4, 'barred spiral', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', 'Small, potato-shaped moon with many craters', 1, 7, 9.0, 4500);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Smaller, oddly shaped moon with few craters', 1, 7, 23.5, 4500);
INSERT INTO public.moon VALUES (3, 'Io', 'Volcanic moon with sulfurous activity', 2, 8, 422.0, 4500);
INSERT INTO public.moon VALUES (4, 'Europa', 'Icy moon with potential subsurface ocean', 2, 8, 471.0, 4500);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the solar system, with a tenuous atmosphere', 2, 8, 1070.0, 4500);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Heavily cratered moon with possible internal ocean', 2, 8, 1883.0, 4500);
INSERT INTO public.moon VALUES (7, 'Mimas', 'Small, heavily cratered moon with a large central crater', 2, 9, 186.0, 4500);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Icy moon with water plumes erupting from its surface', 2, 9, 238.0, 4500);
INSERT INTO public.moon VALUES (9, 'Tethys', 'Icy moon with a large canyon system', 2, 9, 335.0, 4500);
INSERT INTO public.moon VALUES (10, 'Dione', 'Icy moon with a network of valleys and fractures', 2, 9, 377.0, 4500);
INSERT INTO public.moon VALUES (11, 'Rhea', 'Second-largest moon of Saturn, with a ring system', 2, 9, 523.0, 4500);
INSERT INTO public.moon VALUES (12, 'Titan', 'Largest moon of Saturn with a thick atmosphere and lakes', 2, 9, 1222.0, 4500);
INSERT INTO public.moon VALUES (13, 'Hyperion', 'Irregular moon with a sponge-like appearance', 2, 9, 1463.0, 4500);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Two-toned moon with a dark leading hemisphere', 2, 9, 3560.0, 4500);
INSERT INTO public.moon VALUES (15, 'Ariel', 'Bright, icy moon with a smooth surface', 2, 10, 120.0, 4500);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'Dark, icy moon with few craters', 2, 10, 266.0, 4500);
INSERT INTO public.moon VALUES (17, 'Titania', 'Largest moon of Uranus with a network of canyons', 2, 10, 436.0, 4500);
INSERT INTO public.moon VALUES (18, 'Oberon', 'Second-largest moon of Uranus with a dark surface', 2, 10, 563.0, 4500);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Small, irregularly shaped moon with a chaotic surface', 2, 10, 129.0, 4500);
INSERT INTO public.moon VALUES (20, 'Triton', 'Largest moon of Neptune with a retrograde orbit and nitrogen geysers', 2, 11, 3548.0, 4000);
INSERT INTO public.moon VALUES (21, 'Proteus', 'Irregular moon with a dark surface and several craters', 2, 11, 117.0, 4000);
INSERT INTO public.moon VALUES (22, 'Nereid', 'Irregular moon with an elongated orbit', 2, 11, 5513.0, 4000);
INSERT INTO public.moon VALUES (23, 'Larissa', 'Small, irregularly shaped moon with a cratered surface', 2, 11, 73.0, 4000);
INSERT INTO public.moon VALUES (24, 'Thalassa', 'Irregular moon with a dark surface', 2, 11, 80.0, 4000);


--
-- Data for Name: moon_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_type VALUES (1, 'rocky', NULL);
INSERT INTO public.moon_type VALUES (2, 'icy', NULL);
INSERT INTO public.moon_type VALUES (3, 'other', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Mercury', 'Smallest and innermost planet, rocky with no atmosphere', 1, 1, false, 0.40, 4568, NULL);
INSERT INTO public.planet VALUES (5, 'Venus', 'Hottest planet, thick atmosphere of carbon dioxide', 1, 1, false, 0.70, 4568, NULL);
INSERT INTO public.planet VALUES (7, 'Mars', 'Red planet, thin atmosphere, icy polar caps', 1, 1, NULL, 1.50, 4568, NULL);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'Largest planet, gas giant with many moons', 2, 1, false, 5.20, 4568, NULL);
INSERT INTO public.planet VALUES (9, 'Saturn', 'Second largest planet, gas giant with prominent rings', 2, 1, false, 9.60, 4568, NULL);
INSERT INTO public.planet VALUES (10, 'Uranus', 'Ice giant with tilted axis and blue atmosphere', 4, 1, false, 19.20, 4568, NULL);
INSERT INTO public.planet VALUES (11, 'Neptune', 'Farthest planet, ice giant with strong winds and a dark blue spot', 4, 1, false, 30.10, 4568, NULL);
INSERT INTO public.planet VALUES (6, 'Earth', 'Third planet, only known planet with life, has liquid water oceans', 1, 1, true, 1.00, 4568, NULL);
INSERT INTO public.planet VALUES (1, 'Proxima Centauri B', 'Potentially rocky planet, tidally locked to its star (meaning one side always faces the star). May have a tenuous atmosphere.', 1, 3, NULL, 0.10, 4800, NULL);
INSERT INTO public.planet VALUES (3, 'Proxima Centauri C', 'A faint signal suggests a potential second planet, but its existence remains unconfirmed.', 3, 3, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', 'Earth-sized planet within the habitable zone.', 1, 9, false, 0.32, 5000, NULL);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 'Earth-sized planet potentially with a subsurface ocean, tidally locked.', 1, 10, false, 0.02, 7500, NULL);
INSERT INTO public.planet VALUES (14, 'Gliese 581g', 'Super-Earth within the habitable zone (if confirmed).', 3, 11, false, NULL, 6000, NULL);
INSERT INTO public.planet VALUES (15, 'LHS 1140b', 'Rocky super-Earth, likely tidally locked.', 3, 12, false, 0.14, 7000, NULL);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'rocky planet', 'Terrestrial planet, or rocky planet, is composed primarily of rock and metal.');
INSERT INTO public.planet_type VALUES (2, 'gas giant', NULL);
INSERT INTO public.planet_type VALUES (3, 'super-earth', NULL);
INSERT INTO public.planet_type VALUES (4, 'ice giant', NULL);
INSERT INTO public.planet_type VALUES (5, 'dwarf planet', NULL);
INSERT INTO public.planet_type VALUES (6, 'hot jupiter', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow dwarf star, our solar systems star', 10, 0.00, 4568);
INSERT INTO public.star VALUES (2, 'Sirius A', 'Brightest star in night sky, binary system', 10, 8.60, 230);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'Red dwarf, closest star to Sun', 10, 4.20, 4800);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 'Sun-like star, part of Alpha Centauri triple system', 10, 4.30, 6500);
INSERT INTO public.star VALUES (6, 'Regulus', 'Blue-white main sequence star, brightest in Leo constellation', 10, 77.40, 160);
INSERT INTO public.star VALUES (7, 'Fomalhaut', 'White A-type star, debris disk', 10, 25.00, 200);
INSERT INTO public.star VALUES (8, 'Vega', 'Bright white star, fifth brightest in night sky', 10, 25.00, 450);
INSERT INTO public.star VALUES (9, 'Kepler-186', 'Red dwarf star', 10, 512.00, 4600);
INSERT INTO public.star VALUES (10, 'TRAPPIST-1', 'Ultra-cool dwarf star', 10, 40.70, 500);
INSERT INTO public.star VALUES (11, 'Gliese 581', 'Red dwarf star', 10, 20.40, 5000);
INSERT INTO public.star VALUES (12, 'LHS 1140', 'Red dwarf star', 10, 39.00, 4500);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 10, true);


--
-- Name: galaxy_types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: moon_type_moon_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_type_moon_type_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: moon_type moon_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_name_key UNIQUE (name);


--
-- Name: moon_type moon_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_type
    ADD CONSTRAINT moon_type_pkey PRIMARY KEY (moon_type_id);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: galaxy unique_galaxies_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxies_name UNIQUE (name);


--
-- Name: galaxy galaxies_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_moon_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_type_id_fkey FOREIGN KEY (moon_type_id) REFERENCES public.moon_type(moon_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

