#' Computes a tidy correlation
#'
#' more information goes here
#'
#'
#' @param data input data set
#' @param var1 name of variable 1
#' @param var2 name of variable 2
#'
#' @return A tibble with the Pearson correlation and p-value
#' @export
#'
#' @examples
#' compute_corr(data = faithful, var1 = eruptions, var2 = waiting)
#'
#' @importFrom rlang .data
compute_corr <- function(data, var1, var2){

  # compute correlation ----
  stats::cor.test(
    x = data %>% dplyr::pull({{var1}}),
    y = data %>% dplyr::pull({{var2}})
  ) %>%
  # tidy up results ----
  broom::tidy() %>%
  # retain and rename relevant bits ----
  dplyr::select(
    correlation = .data$estimate,
    pval = .data$p.value
  )

}
