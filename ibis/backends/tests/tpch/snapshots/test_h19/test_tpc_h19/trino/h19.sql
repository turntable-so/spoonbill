SELECT
  SUM("t7"."l_extendedprice" * (
    1 - "t7"."l_discount"
  )) AS "revenue"
FROM (
  SELECT
    *
  FROM (
    SELECT
      "t4"."l_orderkey",
      "t4"."l_partkey",
      "t4"."l_suppkey",
      "t4"."l_linenumber",
      "t4"."l_quantity",
      "t4"."l_extendedprice",
      "t4"."l_discount",
      "t4"."l_tax",
      "t4"."l_returnflag",
      "t4"."l_linestatus",
      "t4"."l_shipdate",
      "t4"."l_commitdate",
      "t4"."l_receiptdate",
      "t4"."l_shipinstruct",
      "t4"."l_shipmode",
      "t4"."l_comment",
      "t5"."p_partkey",
      "t5"."p_name",
      "t5"."p_mfgr",
      "t5"."p_brand",
      "t5"."p_type",
      "t5"."p_size",
      "t5"."p_container",
      "t5"."p_retailprice",
      "t5"."p_comment"
    FROM (
      SELECT
        "t0"."l_orderkey",
        "t0"."l_partkey",
        "t0"."l_suppkey",
        "t0"."l_linenumber",
        CAST("t0"."l_quantity" AS DECIMAL(15, 2)) AS "l_quantity",
        CAST("t0"."l_extendedprice" AS DECIMAL(15, 2)) AS "l_extendedprice",
        CAST("t0"."l_discount" AS DECIMAL(15, 2)) AS "l_discount",
        CAST("t0"."l_tax" AS DECIMAL(15, 2)) AS "l_tax",
        "t0"."l_returnflag",
        "t0"."l_linestatus",
        "t0"."l_shipdate",
        "t0"."l_commitdate",
        "t0"."l_receiptdate",
        "t0"."l_shipinstruct",
        "t0"."l_shipmode",
        "t0"."l_comment"
      FROM "hive"."ibis_sf1"."lineitem" AS "t0"
    ) AS "t4"
    INNER JOIN (
      SELECT
        "t1"."p_partkey",
        "t1"."p_name",
        "t1"."p_mfgr",
        "t1"."p_brand",
        "t1"."p_type",
        "t1"."p_size",
        "t1"."p_container",
        CAST("t1"."p_retailprice" AS DECIMAL(15, 2)) AS "p_retailprice",
        "t1"."p_comment"
      FROM "hive"."ibis_sf1"."part" AS "t1"
    ) AS "t5"
      ON "t5"."p_partkey" = "t4"."l_partkey"
  ) AS "t6"
  WHERE
    (
      (
        (
          (
            (
              (
                (
                  (
                    "t6"."p_brand" = 'Brand#12'
                  )
                  AND "t6"."p_container" IN ('SM CASE', 'SM BOX', 'SM PACK', 'SM PKG')
                )
                AND (
                  "t6"."l_quantity" >= 1
                )
              )
              AND (
                "t6"."l_quantity" <= 11
              )
            )
            AND "t6"."p_size" BETWEEN 1 AND 5
          )
          AND "t6"."l_shipmode" IN ('AIR', 'AIR REG')
        )
        AND (
          "t6"."l_shipinstruct" = 'DELIVER IN PERSON'
        )
      )
      OR (
        (
          (
            (
              (
                (
                  (
                    "t6"."p_brand" = 'Brand#23'
                  )
                  AND "t6"."p_container" IN ('MED BAG', 'MED BOX', 'MED PKG', 'MED PACK')
                )
                AND (
                  "t6"."l_quantity" >= 10
                )
              )
              AND (
                "t6"."l_quantity" <= 20
              )
            )
            AND "t6"."p_size" BETWEEN 1 AND 10
          )
          AND "t6"."l_shipmode" IN ('AIR', 'AIR REG')
        )
        AND (
          "t6"."l_shipinstruct" = 'DELIVER IN PERSON'
        )
      )
    )
    OR (
      (
        (
          (
            (
              (
                (
                  "t6"."p_brand" = 'Brand#34'
                )
                AND "t6"."p_container" IN ('LG CASE', 'LG BOX', 'LG PACK', 'LG PKG')
              )
              AND (
                "t6"."l_quantity" >= 20
              )
            )
            AND (
              "t6"."l_quantity" <= 30
            )
          )
          AND "t6"."p_size" BETWEEN 1 AND 15
        )
        AND "t6"."l_shipmode" IN ('AIR', 'AIR REG')
      )
      AND (
        "t6"."l_shipinstruct" = 'DELIVER IN PERSON'
      )
    )
) AS "t7"