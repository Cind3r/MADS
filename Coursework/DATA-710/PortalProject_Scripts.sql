--1.	Find all genus and species of the rodent taxa.

SELECT genus, species FROM species s 
WHERE taxa = 'Rodent';

--2.	Find all species (genus, species, and taxa) that were found by survey in 1987.

SELECT genus, species, taxa, year FROM species s 
JOIN surveys sv ON sv.species_id = s.species_id
WHERE sv.year = 1987

--3.	Print hindfoot length and weight of all species found in “Long-term Krat Exclosure.”

SELECT hindfoot_length, weight, plot_type, species, genus, taxa FROM surveys s 
INNER JOIN plots p ON p.plot_id = s.plot_id 
INNER JOIN species sp on sp.species_id = s.species_id
WHERE p.plot_type = 'Long-term Krat Exclosure';

SELECT AVG(hindfoot_length), AVG(weight), plot_type, species, genus, taxa FROM surveys s 
INNER JOIN plots p ON p.plot_id = s.plot_id 
INNER JOIN species sp on sp.species_id = s.species_id
WHERE p.plot_type = 'Long-term Krat Exclosure' AND s.hindfoot_length IS NOT NULL AND s.weight IS NOT NULL
GROUP BY sp.species;

--4.	Find the dominant species in “Spectab exclosure.” What if you restrict to only 1998?

SELECT plot_type AS Enclosure, species, COUNT(*) AS [Number of Species] FROM surveys s 
INNER JOIN plots p ON p.plot_id = s.plot_id 
INNER JOIN species sp on sp.species_id = s.species_id
WHERE p.plot_type = 'Spectab exclosure'
GROUP BY sp.species
ORDER BY [Number of Species] DESC;

SELECT plot_type AS Enclosure, species, COUNT(*) AS [Number of Species] FROM surveys s 
INNER JOIN plots p ON p.plot_id = s.plot_id 
INNER JOIN species sp on sp.species_id = s.species_id
WHERE p.plot_type = 'Spectab exclosure' AND s.year = 1998
GROUP BY sp.species
ORDER BY [Number of Species] DESC;


-------------- testing hw ---------------

