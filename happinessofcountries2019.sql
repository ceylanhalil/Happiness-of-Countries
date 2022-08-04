use happiness
select * from [2019]

select 

--- countries with higest and lowest gdp per capita---
select top 5 Country,GDP
from [2019]
order by GDP desc

select top 5 country,gdp
from [2019]
order by GDP 

---AVG GDP is 905--
Select avg(gdp)
from [2019]

--- countries below and above the avgGDP---
select country,
		gdp
from [2019]
where GDP<= 905
order by GDP desc

select Country,
GDP
from[2019]
where  GDP>=905
order by GDP desc


--- median GDP is the 960---
select country,
gdp, 
ROW_NUMBER() over (order by gdp desc)
from [2019]

--- distance to median---
select Country, 
(GDP-960) as 'distancetoMedian'
from [2019]
order by 2 desc

-- stddev of GDP--

select STDEV(gdp)
from [2019]

---range of gdp---
declare @rangeofGdp smallint
set @rangeofGdp= (select MAX(GDP)- MIN(GDP) FROM[2019])

--- distancetoRange--
select Country,
(gdp-(select max(gdp) - min(gdp)as 'distancetoRange'))
from [2019]
group by Country,GDP

--- 5 most happy and sad countries--
select top 5 country,
Score
from [2019]
order by score desc

select top 5 country,
score
from[2019]
order by score 

--- mean of the happiness---
select
avg(score) as 'avgofscore'
from[2019]


---countries that below the avg score---
select Country,
Score
from[2019]
group by country,score
having Score>=5407
order by Score desc


--- case stament for determining the avg location---
select country, Score,
case
when Score <= 5407 then 'below the average'
else 'above the average'
end as 'aboveorbelowtheavg'
from [2019]


---median of the score---
select country,
score, 
ROW_NUMBER() over (order by score desc)
from [2019]

--- 5379 is the median of score---

---countries that most away from median of score---

select country,
(score- 5379)
from [2019]
order by 2 desc