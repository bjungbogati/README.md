# library(furrr)
library(purrr)
# future::plan(multisession)

qmd_files <- list.files(here::here("_posts"), ".qmd", recursive = T, full.names = T)


# purrr::map(rmd_files, rmarkdown::render)

# future_map(rmd_files, rmarkdown::render)
#source("minify.R")


# remotes::install_github("colinfay/minifyr")


minify::minify("_site")
