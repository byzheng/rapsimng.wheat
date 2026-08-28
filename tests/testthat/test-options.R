
test_that("get returns correct default values", {
    expect_equal(wheat$get("phenology.thermal_time.x"), c(0, 26, 37))
    expect_equal(wheat$get("phenology.thermal_time.y"), c(0, 26, 0))
    expect_equal(wheat$get("phenology.thermal_time.method"), "3hr")
})

test_that("set updates values correctly", {
    wheat$set(phenology = list(thermal_time = list(x = c(5, 25, 40), y = c(0, 20, 0))))
    expect_equal(wheat$get("phenology.thermal_time.x"), c(5, 25, 40))
    expect_equal(wheat$get("phenology.thermal_time.y"), c(0, 20, 0))

    wheat$set(phenology = list(thermal_time = list(method = "HourlySinPpAdjusted")))
    expect_equal(wheat$get("phenology.thermal_time.method"), "HourlySinPpAdjusted")
})

test_that("set enforces group validation", {
    # Missing y
    expect_no_error(
        wheat$set(phenology = list(thermal_time = list(x = c(1, 2, 3))))
    )

    # x and y different length
    expect_error(
        wheat$set(phenology = list(thermal_time = list(x = c(1, 2), y = c(0, 1, 2))))
    )

    expect_error(
        wheat$set(phenology = list(thermal_time = list(method = "default")))
    )
})

test_that("reset restores defaults", {
    wheat$reset()
    expect_equal(wheat$get("phenology.thermal_time.x"), c(0, 26, 37))
    expect_equal(wheat$get("phenology.thermal_time.y"), c(0, 26, 0))
})
