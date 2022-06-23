library(fs)
library(stringr)
library(readr)

rmd_names <- dir_ls(path = "./posts",recurse= T, glob = "*.Rmd")
qmd_names <- str_replace(string = rmd_names,
                         pattern = basename(rmd_names),
                         replacement = "index.qmd")

non_rmd_files <- dir_ls(path = "./posts",recurse= T, glob = "*_cache|*_files|*.html", type ="file")
non_rmd_dirs <- dir_ls(path = "./posts",recurse= T, glob = "*_cache|*_files", type ="directory")

file_delete(non_rmd_files)
dir_delete(non_rmd_dirs)


# 
# dir_exists(non_rmd_dirs)
# 
# dir_delete(non_rmd_dirs)

file_move(path = rmd_names,
          new_path = qmd_names)

remove_distill_meta <- \(file) {
  
  quarto_yaml_rmd <- read_lines(file)
  
  replace_meta <- str_replace_all(string = quarto_yaml_rmd,
                                  c("preview:" = "image:", 
                                    "output:" = "",
                                    "  distill::distill_article:" = "", 
                                    "    self_contained: false" = "", 
                                    "    highlight: null" = "execute: 
  echo: false"
   )) |>
    str_replace_all(fixed("```{r setup, include=FALSE}") , "") |>
    str_replace_all(fixed("knitr::opts_chunk$set(echo = FALSE)") , "") |>
    str_replace_all(fixed("```") , "")
  
    
  
  write_lines(
    x = replace_meta,
    file = file
  ) |> invisible()
}


purrr::map(qmd_names, remove_distill_meta)
