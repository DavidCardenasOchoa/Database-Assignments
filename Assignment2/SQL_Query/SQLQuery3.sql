select top 1 tps_id, sum(minority), FacilityName
from  TPS, NEIGHBOURHOODS
where tps.shape.STIntersects(neighbourhoods.shape.STBuffer(2000)) = 1 
group by TPS_ID, tps.FacilityName
order by sum(minority) desc