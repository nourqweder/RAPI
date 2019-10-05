#http://r-pkgs.had.co.nz/tests.html

#Test files
context("getGeoaddress")

test_that("Outputs are correct", {
  test <- getGeoaddress("mjolby")
  
  expect_output(print(test), "    address      lat      lng")
  expect_output(print(test), "Mjölby 58.41081 15.62137")
})

test_that("Wrong inputs give error",{
  expect_error(getGeoaddress(58.314960600000006))
  expect_error(getGeoaddress(seoul))
})
