/*
The full database
select * 
from Mental_Health
*/

/*
1. The countries with the highest average age of participants.
select Country ,round(avg(Age),0) as avg_age, (select round(avg(age),0) from Mental_Health)as total_age
from Mental_Health
group by Country
order by avg_age desc

2. The countries with the highest and lowest average health days
select min(h.get_healt_day) as min_get_healt_day, max(h.get_healt_day) as max_get_healt_day
from (select Country, count(health_days) as get_healt_day
		from Mental_Health
		where health_days in ('Somewhat easy', 'Very easy')
		group by Country) as h

3. The precentage of people who get health days easy by country
select Country, (count(case when health_days in ('Somewhat easy', 'Very easy') then 1 end) * 100 / count(*)) as precent_get_days
from Mental_Health
group by Country
order by precent_get_days desc


4. The relationship between age and seeking help for mental health.
-- the avg age to seek for help
select seek_help, round(avg(age),0) as avg_age
from Mental_Health
where seek_help = 'Yes'
group by seek_help

-- The amount of people for each age
select Age, count(seek_help) as seek_help
from Mental_Health
where seek_help = 'Yes'
group by Age
order by seek_help desc


5. The percentage of participants who have a family history of mental health issues for each gender.
SELECT gender,
    COUNT(case when family_history = 'Yes' then 1 end) * 100 / COUNT(*) as percent_family_history,
    COUNT(case when family_history = 'Yes' then 1 end) as sum_family_history,
    COUNT(*) as sum_gender
FROM Mental_Health
GROUP BY gender


6. The percentage of participants by gender
select gender, (count(*) * 100 / (select count(*) from Mental_Health)) as gender_precent, count(*) as sum_gender
from Mental_Health
group by Gender
order by gender_precent desc


7. The states with a significant number of participants who are self-employed and have a family history of mental health issues.
select state, count(*) as num_participants
from Mental_Health
where self_employed = 'Yes' and family_history = 'Yes'
group by state
order by num_participants desc


8. The number of participants who get health days and work remotely versus those who dont.
select remote_work, count(*) as participants_easy_health_day
from Mental_Health
where health_days in ('Somewhat easy', 'Very easy')
group by remote_work


9. The mental health consequences of participants who work remotely versus those who work in a tech company office.
select remote_work, COUNT(*) as mental_health_make_consequence
from Mental_Health
where mental_health_consequence = 'Yes'
group by remote_work


10. Top 5 countries with the highest percentage of self-employed participants.
select top 5 Country, COUNT(self_employed) * 100 / (select COUNT(*) from Mental_Health) AS precent_self_employed
from Mental_Health
where self_employed = 'Yes'
group by Country
order by precent_self_employed desc


11. Top 5 countries with the highest percentage of participants taking treatment.
select top 5 Country, COUNT(treatment) * 100 / (select COUNT(*) from Mental_Health) AS precent_self_employed
from Mental_Health
where treatment = 'Yes'
group by Country
order by precent_self_employed desc


12. The average age for participants who take treatment.
select treatment, round(avg(age),0) as avg_age
from Mental_Health
where treatment = 'Yes'
group by treatment


13. The average age for participants who report work interference.
select work_interfere, round(avg(age),0) as avg_age, count(*) as num_participants
from Mental_Health
where work_interfere = 'Often'
group by work_interfere


14. The percentage of participants facing physical health consequences and the average age
select phys_health_consequence, COUNT(*) * 100 / (select COUNT(*) from Mental_Health) AS precent_physical_consequences, round(avg(age),0) as avg_age, COUNT(*) as num_participants
from Mental_Health
where phys_health_consequence = 'Yes'
group by phys_health_consequence


15. The country with the most participants considering their coworkers understanding about mental health and theprecent of understanding.
select Country, COUNT(case when coworkers = 'Yes' then 1 end) * 100 / COUNT(*) as percent_coworker_know, COUNT(case when coworkers = 'No' then 1 end) * 100 / COUNT(*) as percent_coworker_dont_know, COUNT(case when coworkers = 'Some of them' then 1 end) * 100 / COUNT(*) as percent_some_know, COUNT(*) as num_participants
from Mental_Health
group by Country
order by num_participants desc



-16. The percentage of people with positive responses to both mental health and physical health interviews.
select COUNT(*) * 100 / (select COUNT(*) from Mental_Health) as per_mental_physical_health_interviews, count(*) as num_participants
from Mental_Health
where mental_health_interview = 'Yes' and phys_health_interview = 'Yes'


17. The company size with the most participants.
select no_employees, count(*) as num_participants
from Mental_Health
group by no_employees
order by num_participants desc


18. The percentage of participants who don't have access to wellness program.
select COUNT(*) * 100 / (select COUNT(*) from Mental_Health) as per_no_program
from Mental_Health
where wellness_program = 'No'


-- 19. The total number of participants whose supervisors are aware of their mental health.
select count(*) as num_supervisors_aware
from Mental_Health
where supervisor = 'Yes'
*/

-- 20. The median and the avg age of survey participants.






