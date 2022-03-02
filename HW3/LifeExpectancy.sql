use ids15db;

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

select * 
from Life_Expectancy_Mac;

#Delete all rows with population = 0. 
DELETE FROM Life_Expectancy_Mac 
WHERE population = 0;


#Display total count of countries after data cleaning.
select count(country)
from Life_Expectancy_Mac;
#90

#List of countries with the highest and lowest average mortality rates (years 2010-2015)
select country, Adult_Mortality
from Life_Expectancy_Mac
where Adult_Mortality = (select max(Adult_Mortality) from Life_Expectancy_Mac) || Adult_Mortality = (select min(Adult_Mortality) from Life_Expectancy_Mac);
# angola 365, australia 6

#List of countries with the highest and lowest average population (years 2010-2015)
select country, Population
from Life_Expectancy_Mac
where Population = (select max(Population) from Life_Expectancy_Mac) || (Population = (select min(Population) from Life_Expectancy_Mac));
#Bangladesh 157571292, Albania 2941

#List of countries with the highest and lowest average GDP (years 2010-2015)
select country, GDP
from Life_Expectancy_Mac
where GDP = (select max(GDP) from Life_Expectancy_Mac) || (GDP = (select min(GDP) from Life_Expectancy_Mac));
#Australia 67792.3386, Azerbaijan 55.31382

#List of countries with the highest and lowest average Schooling  (years 2010-2015)
select country, Schooling
from Life_Expectancy_Mac
where Schooling = (select max(Schooling) from Life_Expectancy_Mac) || (Schooling = (select min(Schooling) from Life_Expectancy_Mac));
#australia 20.4, Bangladesh 8.9

#Which countries have the highest and lowest average alcohol consumption (years 2010-2015)?
select country, Alcohol
from Life_Expectancy_Mac
where Alcohol = (select max(Alcohol) from Life_Expectancy_Mac) || (Alcohol = (select min(Alcohol) from Life_Expectancy_Mac));
#belaruse 17.31, (Algeria, Angola, Argentina, Armenia, Australia, Austria, Azerbaijan, Bangladesh, Belaruse, belgium, belize, benin, bhutan) 0

#Do densely populated countries tend to have lower life expectancy?
select country, Life_Expectancy
from Life_Expectancy_Mac
order by Population desc;
#no 

  