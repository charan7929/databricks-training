-- =====================================================
-- INTERVIEW-ORIENTED PRACTICE
-- =====================================================

-- 1. Difference between map and flatMap.
-- map: one input produces one output, structure is preserved.
-- flatMap: one input produces multiple outputs, structure is flattened.
-- Key difference: map = 1 to 1, flatMap = 1 to many.

-- 2. Difference between groupBy and reduceByKey.
-- groupBy: works on DataFrame/RDD, performs full shuffle, slower.
-- reduceByKey: works on RDD only, does local aggregation before shuffle, faster.
-- Key difference: reduceByKey is optimized.

-- 3. Difference between repartition and coalesce.
-- repartition: increases/decreases partitions, full shuffle.
-- coalesce: reduces partitions only, avoids full shuffle.
-- Key difference: repartition = expensive shuffle, coalesce = optimized.

-- 4. Difference between cache and persist.
-- cache: stores data in memory only.
-- persist: stores data in memory or disk with storage levels.
-- Key difference: persist is flexible.

-- 5. Difference between union and unionByName.
-- union: combines by position, column order must match.
-- unionByName: combines by column name, order not required.
-- Key difference: union = position-based, unionByName = name-based.

-- 6. Difference between inner join and left join.
-- inner join: returns only matching rows from both tables.
-- left join: returns all rows from left table + matched right table, unmatched = null.
-- Key difference: left join keeps all left records.

-- 7. Difference between distinct and dropDuplicates.
-- distinct: removes duplicate rows from entire DataFrame.
-- dropDuplicates: removes duplicates based on selected columns.
-- Key difference: dropDuplicates gives column-level control.

-- 8. Difference between rank and dense_rank.
-- rank: gives rank with gaps when ties occur.
-- dense_rank: gives rank without gaps.
-- Key difference: rank skips numbers, dense_rank does not.

-- 9. Difference between explode and explode_outer.
-- explode: expands array/map into rows, removes nulls.
-- explode_outer: expands array/map but keeps nulls.
-- Key difference: explode_outer preserves nulls.

-- 10. Difference between rollup and cube.
-- rollup: hierarchical aggregation.
-- cube: all possible grouping combinations.
-- Key difference: cube gives more detailed aggregation.
