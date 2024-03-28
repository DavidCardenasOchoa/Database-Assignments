WITH SchoolDistances AS (
    SELECT
        s.School_ID,
        s.Name AS SchoolName,
        t.TPS_ID,
        t.FacilityName,
        t.LATITUDE AS TPS_LATITUDE,
        t.LONGITUDE AS TPS_LONGITUDE,
        s.Shape.STDistance(t.Shape) AS Distance
    FROM
        SCHOOLS s
    CROSS JOIN
        TPS t
)
SELECT TOP 5
    sd.School_ID,
    sd.SchoolName,
    sd.TPS_ID,
    sd.FacilityName,
    sd.TPS_LATITUDE,
    sd.TPS_LONGITUDE,
    sd.Distance
FROM
    SchoolDistances sd
ORDER BY
    sd.Distance DESC;