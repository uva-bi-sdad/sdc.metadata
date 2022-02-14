library(jsonlite)

ncr_measure_info <- read_json("~/ncr_measure_info.json")
va_measure_info <- read_json("~/va_measure_info.json")
ncr_names <- names(ncr_measure_info)
va_names <- names(va_measure_info)

test <- va_measure_info[1:2]
names(ncr_measure_info) <- stringr::str_trim(names(ncr_measure_info))
some_names <- setdiff(names(va_measure_info), names(ncr_measure_info))
for(i in some_names) {
  write_json(va_measure_info[i], paste0("data/measure_info/",i,".json"),
                            pretty = TRUE, auto_unbox = TRUE)
}

file_names <- list.files("data/measure_info/")
library(stringr)
measure_names <- str_extract(file_names, "^.*(?=(\\.json))")
library(jsonlite)
measure_name <- NULL
measure <- NULL
measure_info <- NULL
for(i in 1:80){
  measure_name < str_extract(file_names[i], "^.*(?=(\\.json))")
  measure <- read_json(paste0("data/measure_info/", file_names[i]))
  measure_info <- measure_info %>%
    append(measure)
  measure_info
}

# select measure names for file

measure_info <- measure_info[order(names(measure_info))]

write_json(measure_info, "data/measure_info.json", pretty = TRUE, auto_unbox = TRUE)

ncr_measure_info <- measure_info[ncr_names]
vdh_measure_info <- measure_info[va_names]

write_json(ncr_measure_info, "data/ncr_measure_info.json", pretty = TRUE, auto_unbox = TRUE)
write_json(vdh_measure_info, "data/vdh_measure_info.json", pretty = TRUE, auto_unbox = TRUE)
