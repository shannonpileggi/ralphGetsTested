test_that("assess_compute_corr", {
  expected <- compute_corr(data = faithful, var1 = eruptions, var2 = waiting)
  expect_s3_class(expected, "data.frame")
  expect_equal(dim(expected), c(1,2))
  expect_named(expected, c("correlation", "pval"))
  expect_equal(expected[["correlation"]], 0.901, tolerance = 0.001)
  # catching errors
  expect_error(compute_corr(data = faithful, var1 = erruptions, var2 = waiting))
})
