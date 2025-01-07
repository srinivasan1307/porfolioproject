select* from [portfolio project]..CovidVaccinations$
order by 3,4

select* from [portfolio project]..CovidDeaths$
order by 3,4

--select the data that we are going to use..
select location,date,new_cases,total_cases,total_deaths,population
from [portfolio project]..CovidDeaths$
order by 1,2

--looking at total_cases vs total_death
-- shows likelihood of covid dying in india
select location,date,total_cases,total_deaths,(total_cases/total_deaths) as percentage_death
from [portfolio project]..CovidDeaths$
where location='india'
order by 1,2

--looking at total cases vs population
--shows what percentage of population got covid
select location,date,total_cases,population,(total_cases/population) 
from [portfolio project]..CovidDeaths$
where location='india'
order by 1,2

--looking at  countries with highest infection rate compared to population
select location,population,max(total_cases) as highestinfectioncount,max((total_cases/population)) as percentagepopulationinfected
from [portfolio project]..CovidDeaths$
--where location='india'
group by population,location
order by percentagepopulationinfected asc


--showing  countries with highest death count per population
select location,max(total_deaths) as totaldeathcount
from [portfolio project]..CovidDeaths$
--where location='india'
group by location
order by totaldeathcount desc

--lets break down this by continent
select continent,max(total_deaths) as totaldeathcount
from [portfolio project]..CovidDeaths$
--where location='india'
where continent is not null
group by continent
order by totaldeathcount desc

--highest new cases 
select location,max(new_cases) as highestnewcases
from [portfolio project]..CovidDeaths$
where location='india'
group by location


--looking at totalnewcases 
select location,sum(new_cases) as totalnewcases
from [portfolio project]..CovidDeaths$
--where location='india'
group by location
order by totalnewcases desc

--by using join clause on location and date or looking at total population vs vaccination
select* from [portfolio project]..CovidDeaths$ cov
join [portfolio project]..CovidVaccinations$ vac
on cov.location=vac.location and 
cov.date=vac.date

--using between clause
select* from [portfolio project]..CovidVaccinations$
where date between 2020-02-20 and 2022-08-21

--using left join 
select* from [portfolio project]..CovidDeaths$ cov
left join [portfolio project]..CovidVaccinations$ vac
on cov.location=vac.location and 
cov.date=vac.date

--using right join 
select* from [portfolio project]..CovidDeaths$ cov
right join [portfolio project]..CovidVaccinations$ vac
on cov.location=vac.location and 
cov.date=vac.date

select * from [portfolio project]..CovidDeaths$
select* from [portfolio project]..CovidVaccinations$

--by using union 

select total_cases,location from [portfolio project]..CovidDeaths$
union
select total_tests,location from [portfolio project]..CovidVaccinations$

--by using case statement 

SELECT 
    location,
    total_cases,
    total_deaths,
    CASE 
        WHEN total_deaths >= 100 THEN 'the death rate is higher'
        WHEN total_deaths <= 100 THEN 'the death rate is lower'
        ELSE 'the death rate is low'
    END AS death_rate_description
FROM [portfolio project]..CovidDeaths$





