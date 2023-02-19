# 1. Quelle est la proportion de superheroes par genre ?
SELECT count(superhero.id) AS ProportionSuperHeroes, gender FROM gender JOIN superhero ON superhero.gender_id = gender.id GROUP BY gender.gender ;

# 2. Afficher le nom, les pouvoirs et les attributs des superhéros ayant une couleur des yeux Hazel ou Magenta
SELECT superhero.superhero_name, superpower.power_name, attribute.attribute_name
FROM superhero
JOIN hero_power ON superhero.id = hero_power.hero_id
JOIN superpower ON superpower.id = hero_power.power_id
JOIN hero_attribute ON superhero.id = hero_attribute.hero_id
JOIN attribute ON attribute.id = hero_attribute.attribute_id
JOIN colour ON superhero.eye_colour_id = colour.id
WHERE eye_colour_id =16 OR eye_colour_id=18 ;

/*3. Afficher la moyenne de taille et de poids par race de superhéros qui ont une moyenne de taille ou de poids strictement supérieur à 0*/
SELECT avg(height_cm), avg(weight_kg), race
FROM superhero
JOIN race ON race.id = superhero.race_id
GROUP BY race
HAVING (SELECT avg(height_cm) > 0 or avg(weight_kg) > 0 );

#4. Combien a-t-on de superhéros par alignement et genre ?
SELECT count(superhero.id), alignment, gender
FROM superhero
JOIN alignment ON superhero.alignment_id = alignment.id
JOIN gender  ON superhero.gender_id = gender.id
GROUP BY alignment, gender ;

#5. Afficher les noms des TOP 10 superhéros de genre Male qui ont la plus grande taille
SELECT superhero.superhero_name
FROM superhero
JOIN gender ON superhero.gender_id = gender.id
WHERE gender = "Male"
ORDER BY height_cm  DESC
LIMIT 10 ;

/*6. Afficher le Nom, le Publisher_Name, le nombre de pouvoirs et d’attributs pour chacun des superhéros en filtrant uniquement ceux qui ont une couleur de cheveux commençant par un B */
SELECT superhero.superhero_name, publisher.publisher_name, COUNT(DISTINCT power_name), COUNT(distinct attribute_name)
FROM superhero
JOIN publisher ON superhero.publisher_id = publisher.id
JOIN hero_power ON superhero.id = hero_power.hero_id
JOIN superpower ON superpower.id = hero_power.power_id
JOIN hero_attribute ON superhero.id = hero_attribute.hero_id
JOIN attribute ON attribute.id = hero_attribute.attribute_id
JOIN colour ON superhero.hair_colour_id = colour.id
WHERE colour.colour LIKE 'B%'
GROUP BY superhero.superhero_name, publisher.publisher_name ;
