# library(furrr)
library(purrr)
# future::plan(multisession)

rmd_files <- list.files(here::here("_posts"), ".Rmd", recursive = T, full.names = T)
purrr::map(rmd_files, rmarkdown::render)

# future_map(rmd_files, rmarkdown::render)
#source("minify.R")

minify::minify("_site")
