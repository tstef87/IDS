use ids15db;

select format(avg(Assault),0)  
from USArrests;

select 
	@avg_assault := format(avg(Assault),0)
    from USArrests 
    where Assault = 0;

set SQL_SAFE_UPDATES =0;
set SQL_SAFE_UPDATES =1;

update USArrests
set Assault = @avg_assault
where Assault = 0;

select min(Murder), max(Murder), AVG(Murder)
from USArrests; #0.8, 17.4, 7.788

select min(Assault), max(Assault), AVG(Assault)
from USArrests; #45, 337, 169.88

select min(UrbanPop), max(UrbanPop), AVG(UrbanPop)
from USArrests; #32, 91, 65.54

select State, Murder
from USArrests
where murder = (SELECT MIN(murder) FROM USArrests); #North Dakota, 0.8

select state, urbanpop
from USArrests
order by UrbanPop;

select count(state)
from USArrests
where murder > (select murder from USArrests where state = 'Arizona'); #21



