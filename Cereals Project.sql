create database cereals_data;
use cereals;

select * from cereals_data;

#1. Add index name fast on name 
create index fast on cereals_data(Name(50));



#2. Describe the schema of table 
describe cereals;


#3. Create view name as see where users can not see type column [first run appropriate query 
#then create view] 

create view see as
select name,mfr,calories,protein,fat,sodium,fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating
from cereals;

select * from cereals;

#4. Rename the view as saw 

RENAME VIEW see TO saw;


#5. Count how many are cold cereals 
select * from cereals where type = "c";

#6. Count how many cereals are kept in shelf 3 
select * from cereals where shelf = 3;


#7. Arrange the table from high to low according to ratings 
select * from cereals order by rating desc;


#8. Suggest some column/s which can be Primary key 
select name, count(name) from cereals group by name having count(name) >=1 order by count(name) desc;


#9. Find average of calories of hot cereal and cold cereal in one query 

select Type, avg(calories) from cereals group by type;

#10. Add new column as HL_Calories where more than average calories should be categorized as 
#HIGH and less than average calories should be categorized as LOW 

alter table cereals
add column HL_Calories enum ("High", "Low");

CREATE TEMPORARY TABLE TempCalo as select calories from cereals;
UPDATE cereals
SET HL_calories = CASE
    WHEN calories > (select avg(calories) from TempCalo) then "High"
    Else "Low"
    End;
    
select * from cereals;

#11. List only those cereals whose name begins with B 

select * from cereals where name like "B%";

#12. List only those cereals whose name begins with F 

select * from cereals where name like "F%";

#13. List only those cereals whose name ends with s 

select * from cereals where name like "%S";

#14. Select only those records which are HIGH in column HL_calories and mail to 
#jeevan.raj@imarticus.com [save/name your file as <your first name_cereals_high>] 

select * from cereals where HL_calories = "High";

#15. Find maximum of ratings

select max(rating) from cereals;

#16. Find average ratings of those were High and Low calories 

select HL_calories, round(avg(rating),2) from cereals group by HL_calories;

#17. Create two examples of Sub Queries of your choice and give explanation in the script 
#itself with remarks by using # 
select * from cereals;

select avg(calories) from cereals where calories in
(select calories from cereals order by calories desc);


#18. Remove column fat 
alter table cereals 
drop fat;


#19. Count records for each manufacturer [mfr] 

select mfr, count(mfr) from cereals group by mfr;

#20. Select name, calories and ratings only 

select name, calories, rating from cereals; 

