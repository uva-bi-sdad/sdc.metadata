library(jsonlite)

ncr_measure_info <- read_json("~/ncr_measure_info.json")
va_measure_info <- read_json("~/va_measure_info.json")

test <- va_measure_info[1:2]
names(ncr_measure_info) <- stringr::str_trim(names(ncr_measure_info))
some_names <- setdiff(names(va_measure_info), names(ncr_measure_info))
for(i in some_names) {
  write_json(va_measure_info[i], paste0("data/measure_info/",i,".json"),
                            pretty = TRUE, auto_unbox = TRUE)
}

file_names <- list.files("data/measure_info/")
library(stringr)
measure_names < str_extract(file_names, "^.*(?=(\\.json))")

measure_info <- NULL
foreach(file_names[i]) %do% {
  measure_name < str_extract(file, "^.*(?=(\\.json))")
  measure <- read_json(paste0("data/measure_info/", file))
  measure_info <- measure_info %>%
    append(list(measure_name = `measure`))
}

# select measure names for file

measure_info <- measure_info[order(names(measure_info))]

write_json(measure_info, "~/git/capital_region/docs/data/measure_info.json", pretty = TRUE, auto_unbox = TRUE)
