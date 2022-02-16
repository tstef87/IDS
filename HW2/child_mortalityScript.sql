use ids15db;

select *
from child_mortality;

set SQL_SAFE_UPDATES = 0;
set SQL_SAFE_UPDATES = 1;

select 
	@medianUnderFive :=  format(avg(UnderFive),1)
    from child_mortality;
select 
	@medianInfant := format(avg(Infant),1)
    from child_mortality;
select 
	@medianNeoatal := format(avg(Neonatal),1) 
    from child_mortality;
    
update child_mortality
set UnderFive = @medianUnderFive
where UnderFive is null;

update child_mortality
set Infant = @medianInfant
where Infant = null;

update child_mortality
set Neonatal = @medianNeoatal
where Neonatal is null;

select *
from child_mortality;

select year, infant
from child_mortality
where Infant = (SELECT MIN(Infant) FROM child_mortality) or Infant = (SELECT MAX(Infant) FROM child_mortality);
# 1990 (64.8), 2016 (30.5)

select year, neonatal
from child_mortality
where Neonatal > @medianNeoatal; #1990-2004

select year, infant 
from child_mortality
order by Infant desc;

select min(underfive) as "min Under Five", min(infant) as "min Infant", min(neonatal) as "min Neonatal"
from child_mortality;

select max(underfive) as "max Under Five", max(infant) as "max Infant", max(neonatal) as "max Neonatal"
from child_mortality;

select format(avg(underfive),1) as "avg Under Five", format(avg(infant),1) as "avg Infant", format(avg(neonatal),1) as "avg Neonatal"
from child_mortality;

update child_mortality
set OverFive = 100;

select *
from child_mortality;



