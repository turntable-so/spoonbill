SELECT
  t0.c AS c,
  t0.f AS f,
  t0.foo_id AS foo_id,
  t0.bar_id AS bar_id
FROM star1 AS t0
INNER JOIN star1 AS t1
  ON t0.foo_id = t1.bar_id