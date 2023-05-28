-- Show the total population of the world.

SELECT SUM(population)
FROM world

-- List all the continents - just once each.

SELECT DISTINCT continent
FROM world;

-- Give the total GDP of Africa

SELECT SUM(gdp) AS total_gdp
FROM world
WHERE continent='Africa';

-- How many countries have an area of at least 1000000

SELECT COUNT(*)
FROM world
WHERE area >= 1000000;

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- For each continent show the continent and number of countries.

SELECT continent, COUNT(name)
FROM world
GROUP BY continent;

-- For each continent show the continent and number of countries 
-- with populations of at least 10 million.

SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

-- List the continents that have a total population of at least 100 million.

SELECT continent FROM world x
WHERE (SELECT SUM(population) from world y
       WHERE x.continent=y.continent) >= 100000000
GROUP BY continent;