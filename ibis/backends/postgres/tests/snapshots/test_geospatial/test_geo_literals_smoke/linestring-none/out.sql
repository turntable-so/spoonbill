SELECT
  ST_ASEWKB("t0"."<LINESTRING (30 10, 10 30, 40 40)>") AS "<LINESTRING (30 10, 10 30, 40 40)>"
FROM (
  SELECT
    ST_GEOMFROMTEXT('LINESTRING (30 10, 10 30, 40 40)') AS "<LINESTRING (30 10, 10 30, 40 40)>"
) AS "t0"