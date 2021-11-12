awesome_rladies <- function(v) {

  sapply(v, function(x) {
    if (x == 1) {
      verb <- "is"
      noun <- "RLady"
    }

    if (x > 1) {
      verb <- "are"
      noun <- "RLadies"
    }

    as.character(glue::glue("There {verb} {x} awesome {noun}!"))
  })
}


write_rladies <- function(x){

  # another more brief option to below
  # stopifnot(is.numeric(x))

  if ( !(is.numeric(x) & (x >= 1)) ){
    usethis::ui_stop("Input must be numeric and greater than or equal to 1.")
  }

  if (x == 1) {
    verb <- "is"
    noun <- "RLady"
  }

  if (x > 1) {
    verb <- "are"
    noun <- "RLadies"
  }

  as.character(glue::glue("There {verb} {x} awesome {noun}!"))

}

compose_rladies <- function(x){
  purrr::map_chr(x, write_rladies)
}

