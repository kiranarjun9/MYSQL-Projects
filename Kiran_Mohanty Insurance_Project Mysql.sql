create database insurance;
use insurance;
desc insurance_info;
select * from insurance_info;
-- 1. Count for each categories of ‘region
select region,count(region) as Total_regions from insurance_info group by region;
-- 2. Find 50 records of highest ‘age’ and export data/table to desktop
select age as highest_ages from insurance_info order by age desc limit 50;
-- 3. Add index name ‘quick’ on ‘id’
CREATE INDEX quick ON insurance_info(id);
desc insurance_info;
select * from insurance_info;
-- 4. Describe the schema of table
desc insurance_info;
describe insurance_info;
-- 5. Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view]
create view gender as select id,age,bmi,children,smoker,region,charges from insurance_info;
select * from insurance_info;
-- 6. Rename the view as ‘type’
alter table insurance_info rename column view to type;
-- 7. Count how many are ‘northwest’ insurance holders
select region,count(region) from insurance_info where region='northwest';
-- 8. Count how many insurance holders were ‘female’
select sex,count(sex) from insurance_info where sex='female';
alter table insurance_info modify column id int primary key;
-- 10. Create a new column ‘ratio’ which is age multiply by bmi
alter table insurance_info add column ratio int;
update insurance_info  set ratio=(bmi*age);
select bmi,age,ratio as ratio_multiplyed_with_bmi_and_age from insurance_info;
-- 11. Arrange the table from high to low according to charges
select * from insurance_info order by charges desc;
-- 12. Find MAX of ‘charges’
select max(charges) from insurance_info;
-- 13. Find MIN of ‘charges’
select min(charges) from insurance_info;
-- 14. Find average of ‘charges’ of male and female
select sex,avg(charges) from insurance_info group by sex;
-- 15. Write a Query to rename column name sex to Gender
alter table insurance_info rename column sex to gender;
select * from insurance_info;
-- 16. Add new column as HL_Charges where more than average charges should be categorized as HIGH and less than average charges should be categorized as LOW
alter table insurance_info add column HL_Charges int;
update insurance_info set HL_Charges=case
when charges > (select avg(charges) from insurance_info) then 'High' else 'Low' end;
select * from insurance_info;
-- 17. Change location/position of ‘smoker’ and bring before ‘children’
alter table insurance_info modify column smoker text after bmi;
-- 18. Show top 20 records
select * from insurance_info order by id asc limit 20;
-- 19. Show bottom 20 records
select * from insurance_info order by id desc limit 20;
-- 20. Randomly select 20% of records and export to desktop

-- 21. Remove column ‘ratio’
alter table insurance_info drop column ratio;
-- 22. Craete one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in the script itself with remarks by using #

-- 23. Create a view called Female_HL_Charges that shows only those data where HL_Charges is High, Female, Smokers and with 0 children
create view Female_HL_Charges as select HL_Charges, gender, Smoker,childern from insurance_info where HL_Charges= 'High', gender='female', Smokers,childerns=0;
-- 24. Update children column if there is 0 children then make it as Zero Children, if 1 then one_children, if 2 then two_children, if 3 then three_children, if 4 then four_children if 5 then five_children else print it as More_than_five_children.
alter table insurance_info add column Children_1 varchar(30) after children;
update insurance_info 
set children_1 =case 
when children = 0 then 'Zero Children'
when children = 1 then 'One Children'
when children= 2 then 'Two Children'
when children= 3 then 'Three Children'
when children= 4 then 'Four Children'
when children= 5 then 'Five Children'
else
'More then Five Children'
end;
select * from insurance_info;

