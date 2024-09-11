select count(FacilityName)
from  TPS, SUBWAY
where tps.shape.STIntersects(subway.shape.STBuffer(1000)) = 1 
