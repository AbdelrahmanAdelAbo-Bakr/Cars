

-- Explore Data

Select* From car;


-- Check if there Null Values

Select * from car
Where name is null OR selling_price IS Null OR Year is Null;


-- Check for Duplicate Rows

Select Distinct * from car;

Select name , year, fuel , seller_type , owner , Count(*)AS "Repeat Count"
From car
Group by name , year , fuel , seller_type , owner
Having Count(*) >1 
Order by "Repeat Count" asc;




-- Creating View to analyze Data without removing any Rows

Create View car_v 
AS(
Select Distinct * from car);

select * from car_v;


-- Total Cars

 Select count(*) From car_v;
 
 
 -- How many Cars will be Available in 2023
 
Select count(*) AS "Total Cars"
From car_v
Where year=2023;


-- How many Cars is Available in 2020-2021-2022

Select year ,count(*) AS "Total Cars" 
From car_v
Where year IN (2020,2021,2022)
Group by year
Order by year;


-- Total Cars by Year

Select year,count(*) AS "Total Cars"
From car_v
Group by year
Order by year desc;


-- How many Diesel Cars will be there in 2020

Select fuel,Count(*) AS "Total Cars" 
From car_v
Where year=2020 AND fuel ='Diesel'
Group by fuel;


-- How many Petrol Cars will be in 2020?

Select fuel,Count(*) AS "Total Cars"
From car_v
Where year=2020 AND fuel ='Petrol' 
Group by fuel;



-- All Fuel Cars Come by Year

Select year , fuel , Count(*) AS "Total Cars" , SUM(selling_price) AS "Total Come"
From car_v
Group by year , fuel 
Having fuel IN ( 'Petrol','Diesel','CNG');



-- Which Year had more than 100 Cars

Select year,Count(*) AS "Total Cars" 
From car_v
Group by year 
Having Count(*) > 100 ;

Select year,Count(*)AS "Total Cars" 
From car_v
Group by year 
Having Count(*) < 50 ;


-- A list with All Cars Count Details between 2015-2023

Select Count(*)  AS "Total Cars"
From car_v
Where year between 2015 and 2023 ;



-- A list with All Cars Details between 2015-2023

Select *
From car_v
Where year between 2015 and 2023 ;
 
