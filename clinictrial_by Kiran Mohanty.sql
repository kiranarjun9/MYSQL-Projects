show databases;
show tables;
create database  if not exists clinical;
show databases;
drop database clinical;
create database clinictrial;
use clinictrial;
show tables;
select * from clinictrial;
-- Queries 
# 1.Add index name fast on Name 
create index fast on clinictrial(Name(50));
select * from clinictrial;
#2.Describe the schema of table 
desc clinictrial;
# 3.	Find average of Age 
select avg(Age) from clinictrial;  
#4.	Find minimum of Age 
select min(Age) from clinictrial;
#5.	Find maximum of Age 
select max(Age) from clinictrial;
# 6.Find average age of those were pregnant and not pregnant
select * from clinictrial;
select Pregnant,avg(Age) from clinictrial group by Pregnant; 
# 7.Find average blood pressure of those had drug reaction and did not had drug reaction 
select Drug_Reaction,avg(BP) from clinictrial group by Drug_Reaction;
# 8.Add new column name as ‘Age_group’ and those having age between 16 & 21 should be categorized as Low,
# more than 21 and less than 35 should be categorized as Middle and above 35 should be categorized as High. 
Alter table clinictrial add('Age_Group') 
 
9.	Change ‘Age’ of Reetika to 32 
10.	Change name of Reena as Shara’ 
11.	Remove Chlstrl column 
12.	Select only Name, Age and BP 
13.	Select ladies whose first name starts with ‘E’ 
14.	Select ladies whose Age_group were Low 
15.	Select ladies whose Age_group were High 
16.	Select ladies whose name starts with ‘A’ and those were pregnant  
17.	Identify ladies whose BP was more than 120  
18.	Identify ladies whose BP was between 100 and 120  
19.	Identify ladies who had low anxiety aged less than 30 
20.	Select ladies whose name ends with ‘i’ 
21.	Select ladies whose name ends with ‘a’  
22.	Select ladies whose name starts with ‘K’ 
23.	Select ladies whose name have ‘a’ anywhere  
24.	Order ladies in ascending way based on ‘BP’ 
25.	Order ladies in descending way based on ‘Age’ 
 
