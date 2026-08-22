# Wheat model options manager

An options manager for configuring wheat model parameters. This object
provides methods to get and set wheat related parameters.

## Usage

``` r
wheat
```

## Format

An object of class `list` of length 3.

## Available Options

- phenology.thermal_time.x:

  Cardinal temperatures for thermal time calculation. Default: c(0, 26,
  37)

- phenology.thermal_time.y:

  Effective thermal time at corresponding cardinal temperatures.
  Default: c(0, 26, 0)

## Methods

- get(key):

  Retrieve the value of an option by its key (e.g.,
  "phenology.thermal_time.x")

- set(key, value):

  Set the value of an option by its key

- reset():

  Reset all options to their default values

## Examples

``` r
# Get default thermal time cardinal temperatures
wheat$get("phenology.thermal_time.x")
#> [1]  0 26 37

# Set custom values
wheat$set("phenology.thermal_time.x" = c(0, 26, 37))
wheat$set("phenology.thermal_time.y" = c(0, 26, 0))

# Reset to defaults
wheat$reset()
```
