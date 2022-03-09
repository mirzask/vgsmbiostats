## code to prepare `DATASET` dataset goes here

library(rvest)
library(crayon)

site <- read_html("https://regression.ucsf.edu/second-edition/data-examples-and-problems")
links <- site %>%
  html_elements("#node-1 a") %>%
  html_attr("href")

# Return all text ending with `dta`
dta_files <- grep("dta$", links, value=TRUE)

dta_links <- paste0("https://regression.ucsf.edu", dta_files)

# basename(dta_files)
# basename(fs::dir_ls('data-raw', glob = "*.dta"))
dta_diff <- setdiff( basename(dta_files), basename(fs::dir_ls('data-raw', glob = "*.dta")) )

if (length(dta_diff) >= 1){
  for (file in dta_links) {
    tryCatch(
      {
        cat(green("Downloading " %+% basename(file) %+% " \n"))
        download.file(file, destfile = here::here('data-raw', basename(file)))
        cat(green("Load .dta file: " %+% basename(file) %+% " \n"))
        tools::file_path_sans_ext(basename(file)) <- haven::read_dta(here::here('data-raw', basename(file)))
        usethis::use_data(tools::file_path_sans_ext(basename(file)))
      },
      error = function(e){
        message(paste("Error occurred trying to download ", basename(file)))
      }
    )
  }
} else{
  cat(green("All data files appear to already exist in 'data-raw/' folder"))
}


for (file in fs::dir_ls('data-raw', glob = "*.dta")){
  # cat(green("Loading file: " %+% basename(file) %+% " \n"))
  var_name <- basename(file)
  print( glue::glue("{tools::file_path_sans_ext(var_name)} <- haven::read_dta(here::here('data-raw', '{var_name}'))") )
  print( glue::glue("usethis::use_data({tools::file_path_sans_ext(var_name)})") )
}

FITglm <- haven::read_dta(here::here('data-raw', 'FITglm.dta'))
usethis::use_data(FITglm)
actg019 <- haven::read_dta(here::here('data-raw', 'actg019.dta'))
usethis::use_data(actg019)
esoph <- haven::read_dta(here::here('data-raw', 'esoph.dta'))
usethis::use_data(esoph)
fecfat <- haven::read_dta(here::here('data-raw', 'fecfat.dta'))
usethis::use_data(fecfat)
figure4_1 <- haven::read_dta(here::here('data-raw', 'figure4_1.dta'))
usethis::use_data(figure4_1)
figure4_12 <- haven::read_dta(here::here('data-raw', 'figure4_12.dta'))
usethis::use_data(figure4_12)
figure4_6 <- haven::read_dta(here::here('data-raw', 'figure4_6.dta'))
usethis::use_data(figure4_6)
fit <- haven::read_dta(here::here('data-raw', 'fit.dta'))
usethis::use_data(fit)
fitdata <- haven::read_dta(here::here('data-raw', 'fitdata.dta'))
usethis::use_data(fitdata)
gababies <- haven::read_dta(here::here('data-raw', 'gababies.dta'))
usethis::use_data(gababies)
hers_long_base_visit1_only_saved <- haven::read_dta(here::here('data-raw', 'hers_long_base_visit1_only_saved.dta'))
usethis::use_data(hers_long_base_visit1_only_saved)
hers_nodm_longitudinal <- haven::read_dta(here::here('data-raw', 'hers_nodm_longitudinal.dta'))
usethis::use_data(hers_nodm_longitudinal)
hers_nodm_visit4_only <- haven::read_dta(here::here('data-raw', 'hers_nodm_visit4_only.dta'))
usethis::use_data(hers_nodm_visit4_only)
hersdata <- haven::read_dta(here::here('data-raw', 'hersdata.dta'))
usethis::use_data(hersdata)
leuk <- haven::read_dta(here::here('data-raw', 'leuk.dta'))
usethis::use_data(leuk)
mira_hsv <- haven::read_dta(here::here('data-raw', 'mira_hsv.dta'))
usethis::use_data(mira_hsv)
mros <- haven::read_dta(here::here('data-raw', 'mros.dta'))
usethis::use_data(mros)
needle_sharing <- haven::read_dta(here::here('data-raw', 'needle_sharing.dta'))
usethis::use_data(needle_sharing)
nhanes3 <- haven::read_dta(here::here('data-raw', 'nhanes3.dta'))
usethis::use_data(nhanes3)
pbc <- haven::read_dta(here::here('data-raw', 'pbc.dta'))
usethis::use_data(pbc)
phototherapy <- haven::read_dta(here::here('data-raw', 'phototherapy.dta'))
usethis::use_data(phototherapy)
sof <- haven::read_dta(here::here('data-raw', 'sof.dta'))
usethis::use_data(sof)
sof2 <- haven::read_dta(here::here('data-raw', 'sof2.dta'))
usethis::use_data(sof2)
unos <- haven::read_dta(here::here('data-raw', 'unos.dta'))
usethis::use_data(unos)
wcgs <- haven::read_dta(here::here('data-raw', 'wcgs.dta'))
usethis::use_data(wcgs)
whickham <- haven::read_dta(here::here('data-raw', 'whickham.dta'))
usethis::use_data(whickham)

