USE StudentPerformance;

DROP TABLE student_performance;

CREATE TABLE student_performance (
    gender NVARCHAR(10),
    race_ethnicity NVARCHAR(20),
    parental_education NVARCHAR(50),
    lunch NVARCHAR(20),
    test_preparation NVARCHAR(20),
    math_score INT,
    reading_score INT,
    writing_score INT
);

BULK INSERT student_performance
FROM 'C:\Users\MKcomputer\Documents\Students_Performance\StudentsPerformance_clean.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK
);

SELECT COUNT(*) AS Total_Rows
FROM student_performance;

select top 5 * from student_performance;


select gender,
       count(*) as total,
	   cast(count(*)*100/ sum(count(*)) over() as decimal(5,2)) as percentage
from student_performance
group by gender;


select * from student_performance;

select race_ethnicity,
       count(*) as total,
	   cast(count(*)*100/ sum(count(*)) over() as decimal (5,2)) as percentage
from student_performance
group by race_ethnicity
order by total desc;

select avg(math_score) as avg_math,
       avg(reading_score) as avg_reading,
	   avg(writing_score)as avg_writing
from student_performance


select 
       max(math_score) as max_math,
	   min(math_score) as min_math,
	   max(reading_score) as max_reading,
	   min(reading_score) as min_reading,
	   max(writing_score) as max_writing,
	   min(writing_score) as min_writing
from student_performance;



select * from student_performance;


select test_preparation,
       avg(math_score) as avg_math,
	   avg(reading_score) as avg_reading,
	   avg(writing_score) avg_writing
from student_performance
group by test_preparation;


select parental_education,
       avg(math_score) as avg_math,
	   avg(reading_score) as avg_reading,
	   avg(writing_score) as avg_writing
from student_performance
group by parental_education
order by avg_math desc; 

select lunch,
       avg(math_score) as avg_math,
	   avg(reading_score) as avg_reading,
	   avg(writing_score) as avg_writing
from student_performance
group by lunch;

  select 
  Case
	   when math_score >=50 and reading_score>=50 and writing_score>=50
	   then 'Pass'
	   else 'Fail'
  end as status,
  count(*) as total,
  cast(count(*)*100/ sum(count(*)) over() as decimal(5,2)) as percentage
from student_performance
group by 
     Case
	     when math_score >=50 and reading_score>=50 and writing_score>=50
		 then 'Pass'
		 else 'Fail'
	end;

	select * from student_performance;
