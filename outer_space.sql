CREATE TABLE stars (
    name TEXT PRIMARY KEY,
    temp_in_kelvin INT NOT NULL
);

CREATE TABLE planets (
    name TEXT PRIMARY KEY,
    orbital_period FLOAT,
    star TEXT NOT NULL REFERENCES stars
);

CREATE TABLE moons (
    name TEXT PRIMARY KEY,
    planet TEXT REFERENCES planets
);

INSERT INTO stars (name, temp_in_kelvin)
VALUES ('The Sun', 5800), ('Proxima Centauri', 3042), ('Gliese 876', 3192);

INSERT INTO planets (name, orbital_period, star)
VALUES ('Earth', 1.00, 'The Sun'),
('Mars', 1.882, 'The Sun'),
('Venus', 0.62, 'The Sun'),
('Proxima Centauri b', 0.03, 'Proxima Centauri'),
('Gliese 876 b', 0.236, 'Gliese 876');

INSERT INTO moons (name, planet)
VALUES ('The Moon', 'Earth'), ('Phobos', 'Mars'), ('Deimos', 'Mars');

SELECT planets.name, planets.star, COUNT(moons.planet) AS moon_count
FROM planets
LEFT OUTER JOIN moons
ON planets.name = moons.planet
GROUP BY planets.name;