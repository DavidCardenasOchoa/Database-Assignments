select top 5 sum(Shooting_2022), FacilityName
from  TPS, NEIGHBOURHOODS
where tps.shape.STIntersects(neighbourhoods.shape.STBuffer(3000)) = 1 
group by FacilityName
order by sum(Shooting_2022) desc