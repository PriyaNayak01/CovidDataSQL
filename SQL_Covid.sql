SELECT *
FROM Project1..CovidDeaths
ORDER BY 3,4

SELECT *
FROM Project1..CovidVaccination
ORDER BY 3,4

SELECT location, date, total_cases, new_cases, total_deaths, [population]
FROM Project1..CovidDeaths
ORDER BY 1,2

--Total Cases vs Total Deaths
--Liklelihood of dying if you contract covid in India

SELECT location, date, total_cases, total_deaths, (CAST(total_deaths AS FLOAT)/CAST(total_cases AS FLOAT))*100 AS death_rate
FROM Project1..CovidDeaths
WHERE location = 'india'
ORDER BY 1,2


SELECT location, date, total_cases, total_deaths, (CAST(total_deaths AS FLOAT)/CAST(total_cases AS FLOAT))*100 AS death_rate
FROM Project1..CovidDeaths
WHERE location = 'italy'
ORDER BY 1,2

-- Total cases vs Population
-- shows what percent of populaion got covid

SELECT location, date, [population], total_cases, (CAST(total_cases AS FLOAT)/CAST([population] AS FLOAT))*100 AS infection_rate
FROM Project1..CovidDeaths
WHERE location = 'india'
ORDER BY 1,2


SELECT location, date, [population], total_cases, (CAST(total_cases AS FLOAT)/CAST([population] AS FLOAT))*100 AS infection_rate
FROM Project1..CovidDeaths
WHERE location LIKE '%states%'
ORDER BY 1,2


SELECT location, date, [population], total_cases, (CAST(total_cases AS FLOAT)/CAST([population] AS FLOAT))*100 AS infection_rate
FROM Project1..CovidDeaths
WHERE location = 'italy'
ORDER BY 1,2

--Looking at highest infection rate


SELECT location, [population], MAX(CAST(total_cases AS FLOAT))as highest_infection_count, MAX((CAST(total_cases AS FLOAT)/CAST([population] AS FLOAT)))*100 AS highest_infection_rate
FROM Project1..CovidDeaths
group by location, population
ORDER BY highest_infection_rate DESC


--Looking at highest Death count per Population

SELECT location, CAST(total_cases AS FLOAT), [population]
FROM Project1..CovidDeaths
WHERE location = 'india'
ORDER BY 2 desc

SELECT location,date, total_cases 
FROM Project1..CovidDeaths
where date between 2020-10-02 and 2023-02-25
