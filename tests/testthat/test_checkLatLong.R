#http://r-pkgs.had.co.nz/tests.html

#Test files
context("checkLatLong")


test_that("Wrong inputs give error",{
  expect_error(checkLatLong(58.314960600000006))
  expect_error(checkLatLong(seoul))
})
