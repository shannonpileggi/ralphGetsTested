# ralphGetsTested

An R-Ladies Philly workshop on unit testing on Nov 11, 2021.

# Abstract

In this workshop, Shannon Pileggi and Gordon Shotwell discuss how to get started with unit testing in R, which is formal automated testing of functions within packages. We demonstrate handy functions in `usethis` and `devtools`, strategies for writing tests, debugging techniques, and broad concepts in function writing that facilitate a smoother testing process.

This workshop picks up exactly where we left our little `ralph` (aka **R**-**L**adies **Ph**illy) package one year ago with [“Your first R package in 1 hour: Tools that make R package development easy”](https://www.pipinghotdata.com/posts/2020-10-25-your-first-r-package-in-1-hour/). Participants will get the most out of this workshop if they review those materials in advance, or if they are already familiar with building R packages with `devtools` and `usethis`.


# Packages

Please install, or update, the following packages in advance of the workshop: 

* `usethis`, `devtools`, `testthat`, `covr`, and `DT`

* `broom`, `glue`

* `dplyr`, `purrr`, `magrittr`, and `rlang`  (or `tidyverse`)


# Get started

You can work either (1) locally or (2) with GitHub.

1. To work locally, click the green `Code` button and download the zipped `ralphGetsTested` repository.

2. To work through GitHub, fork and clone this repository with
`usethis::create_from_github("shannonpileggi/ralphGetsTested")`.

# Keyboard shortcuts

* `Ctrl + S` for save file

* `Ctrl + Shift + L` for `devtools::load_all()`

* `Ctrl + Shift + F10` to restart R

# Resources

* R package developement [cheat sheet](https://rklopotek.blog.uksw.edu.pl/files/2017/09/package-development.pdf)

* [Ch. 12 Testing](https://r-pkgs.org/tests.html) in R packages by Hadley Wickham and Jenny Bryan

* [Ch. 8.2 Signalling conditions](https://adv-r.hadley.nz/conditions.html#signalling-conditions) in Advanced R by  Hadley Wickham

* [testthat documentation](https://testthat.r-lib.org/)

* {usethis} [user interface functions](https://usethis.r-lib.org/reference/ui.html)

* [covr package](https://covr.r-lib.org/)

* Debugging
   
   + RStudio blog post by Jonathan McPherson [Debugging with the RStudio IDE](https://support.rstudio.com/hc/en-us/articles/205612627-Debugging-with-the-RStudio-IDE)
   
   + [Ch 22 Debugging](https://adv-r.hadley.nz/debugging.html) in Advanced R by  Hadley Wickham

* Indrajeet Patil's curated list of [awesome tools to assist R package development](https://indrajeetpatil.github.io/awesome-r-pkgtools/).

# Part 1: testing `compute_corr()`

Review the [`compute_corr()`](https://github.com/shannonpileggi/ralph/blob/master/R/compute_corr.R) function and the [available expectations](https://testthat.r-lib.org/reference/index.html) in `testthat`.

* What _can_ we test in `compute_corr()`?
  
* What _should_ we test in `compute_corr()`?
  
* How much of the function code is covered by tests?

# Part 2: challenge function

Add the `awesome_rladies` function to the package.

```
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
```

and execute the function with:

```
awesome_rladies(1)
awesome_rladies(2)
awesome_rladies(1:2)
```

* Can we break this up to make it easier to test?

* What type of object should the function output?

* What type of object does this function expect? Can we put up guardrails so the user doesn’t send the wrong thing? How do we test those guardrails?
