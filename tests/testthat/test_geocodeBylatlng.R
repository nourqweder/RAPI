#http://r-pkgs.had.co.nz/tests.html

#Test files

context("geocodeBylatlng")

test_that("Wrong inputs give error",{
  expect_error(geocodeBylatlng(37.56654))
  expect_error(geocodeBylatlng(seoul))
})

test_that("Proper error message",{
  expect_error(geocodeBylatlng("99999999999, 0000000000"))
  expect_error(geocodeBylatlng("+-!@#$%^&*&"))
})

