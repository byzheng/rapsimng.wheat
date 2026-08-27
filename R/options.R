
#' Wheat model options manager
#'
#' An options manager for configuring wheat model parameters. This object provides
#' methods to get and set wheat related parameters.
#'
#' @section Available Options:
#' \describe{
#'   \item{phenology.thermal_time.x}{Cardinal temperatures for thermal time calculation. Default: c(0, 26, 37)}
#'   \item{phenology.thermal_time.y}{Effective thermal time at corresponding cardinal temperatures. Default: c(0, 26, 0)}
#' }
#'
#' @section Methods:
#' \describe{
#'   \item{get(key)}{Retrieve the value of an option by its key (e.g., "phenology.thermal_time.x")}
#'   \item{set(key, value)}{Set the value of an option by its key}
#'   \item{reset()}{Reset all options to their default values}
#' }
#'
#' @export
#' @importFrom optree create_options_manager
#' @importFrom optree v_xypair
#' @examples
#' # Get default thermal time cardinal temperatures
#' wheat$get("phenology.thermal_time.x")
#' 
#' # Set custom values
#' wheat$set("phenology.thermal_time.x" = c(0, 26, 37))
#' wheat$set("phenology.thermal_time.y" = c(0, 26, 0))
#' 
#' # Reset to defaults
#' wheat$reset()
wheat <- optree::create_options_manager(
    defaults = list(
        phenology = list(
            thermal_time = list(
                x = c(0, 26, 37),
                y = c(0, 26, 0)
            )
        )
    ),
    validators = list(
        "phenology.thermal_time" = v_xypair(min_len = 3)
    )
)
