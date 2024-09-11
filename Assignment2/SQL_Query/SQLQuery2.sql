select top 5 sum(pop_den_sq_km), FacilityName
from  TPS, NEIGHBOURHOODS
where tps.shape.STIntersects(neighbourhoods.shape.STBuffer(1500)) = 1 
group by FacilityName
order by sum(Pop_Den_SQ_Km) asc