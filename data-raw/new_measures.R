library(jsonlite)
library(purrr)
## load json functions
source("~/git/dc.template/R/json_functions.R")

#dmv_measure_info <- read_json("~/dmv_measure_info.json")
va_measure_info <- read_json("~/va_measure_info.json")

# search measure_infos
#search(dmv_measure_info)
search(va_measure_info)
measure_info <- va_measure_info

# get all measure names
measure_names <- NULL
for(i in 1:length(measure_info)){
  measure_name <- names(measure_info[i])
  measure_names <- append(measure_names, measure_name)
}
duplicated(measure_names)
# Nothing is repeated except time
measure_info <- measure_info[-1]

# sort alphabetically
measure_info <- measure_info[order(names(measure_info))]

"food_insecurity_and_cost:Food_Insecurity_Rate" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "food_insecurity_and_cost",
  "full_name" = "food_insecurity_and_cost:Food_Insecurity_Rate",
  "measure" = "Food_Insecurity_Rate",
  "type" = "percent",
  "short_name" = "Food insecurity rate",
  "long_name" = "Food insecurity rate",
  "short_description" = "Food insecurity refers to USDA’s measure of lack of access, at times, to enough food for an active, healthy life for all household members and limited or uncertain availability of nutritionally adequate foods.",
  "long_description" = "Food insecurity refers to USDA’s measure of lack of access, at times, to enough food for an active, healthy life for all household members and limited or uncertain availability of nutritionally adequate foods. Food-insecure households are not necessarily food insecure all the time. Food insecurity may reflect a household’s need to make trade-offs between important basic needs, such as housing or medical bills, and purchasing nutritionally adequate foods.",
  "statement" = "The food insecurity rate in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Feeding America",
      "date_accessed" = "2021",
      "url" = "https://www.feedingamerica.org/"
    )
  )
 )
"food_insecurity_and_cost:Num_Child_Food_Insecure" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "food_insecurity_and_cost",
  "full_name" = "food_insecurity_and_cost:Num_Child_Food_Insecure",
  "measure" = "Num_Child_Food_Insecure",
  "type" = "count",
  "short_name" = "Population of food insecure children",
  "long_name" = "Count of population of food insecure children",
  "short_description" = "Food insecure children are those children living in households experiencing food insecurity (a lack of access to enough food for an active, healthy life).",
  "long_description" = "Food insecurity refers to USDA’s measure of lack of access, at times, to enough food for an active, healthy life for all household members and limited or uncertain availability of nutritionally adequate foods. Food insecurity refers to USDA’s measure of lack of access, at times, to enough food for an active, healthy life for all household members and limited or uncertain availability of nutritionally adequate foods. Food insecure children are those children living in households experiencing food insecurity.Food-insecure households are not necessarily food insecure all the time. Food insecurity may reflect a household’s need to make trade-offs between important basic needs, such as housing or medical bills, and purchasing nutritionally adequate foods.",
  "statement" = "The population of food insecure children in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Feeding America",
      "date_accessed" = "2021",
      "url" = "https://www.feedingamerica.org/"
    )
  )
)
"food_insecurity_and_cost:Child_Food_Insecurity_Rate" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "Child_Food_Insecurity_Rate",
  "full_name" = "food_insecurity_and_cost:Child_Food_Insecurity_Rate",
  "measure" = "Child_Food_Insecurity_Rate",
  "type" = "percent",
  "short_name" = "Childhood food insecurity rate",
  "long_name" = "Childhood food insecurity rate",
  "short_description" = "Food insecure children are those children living in households experiencing food insecurity (a lack of access to enough food for an active, healthy life).",
  "long_description" = "Food insecurity refers to USDA’s measure of lack of access, at times, to enough food for an active, healthy life for all household members and limited or uncertain availability of nutritionally adequate foods. Food insecurity refers to USDA’s measure of lack of access, at times, to enough food for an active, healthy life for all household members and limited or uncertain availability of nutritionally adequate foods. Food insecure children are those children living in households experiencing food insecurity.Food-insecure households are not necessarily food insecure all the time. Food insecurity may reflect a household’s need to make trade-offs between important basic needs, such as housing or medical bills, and purchasing nutritionally adequate foods.",
  "statement" = "The childhood food insecurity rate in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Feeding America",
      "date_accessed" = "2021",
      "url" = "https://www.feedingamerica.org/"
    )
  )
)
"food_insecurity_and_cost:Cost_Per_Meal" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "food_insecurity_and_cost",
  "full_name" = "food_insecurity_and_cost:Cost_Per_Meal",
  "measure" = "Cost_Per_Meal",
  "type" = "float",
  "short_name" = "Average meal cost",
  "long_name" = "Average meal cost",
  "short_description" = "The average weekly dollar amount food-secure individuals report spending on food.",
  "long_description" = "The average weekly dollar amount food-secure individuals report spending on food, as estimated by the Current Population Survey, divided by 21 (assuming three meals a day, seven days a week). This amount has been adjusted to reflect local food prices and relevant taxes.",
  "statement" = "The average meal cost in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Feeding America",
      "date_accessed" = "2021",
      "url" = "https://www.feedingamerica.org/"
    )
  )
)
"food_insecurity_and_cost:Num_Food_Insecure" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "food_insecurity_and_cost",
  "full_name" = "food_insecurity_and_cost:Num_Food_Insecure",
  "measure" = "Num_Food_Insecure",
  "type" = "count",
  "short_name" = "Population of food insecure",
  "long_name" = "Count of food insecure population",
  "short_description" = "Food insecurity refers to USDA’s measure of lack of access, at times, to enough food for an active, healthy life for all household members and limited or uncertain availability of nutritionally adequate foods.",
  "long_description" = "Food insecurity refers to USDA’s measure of lack of access, at times, to enough food for an active, healthy life for all household members and limited or uncertain availability of nutritionally adequate foods. Food-insecure households are not necessarily food insecure all the time. Food insecurity may reflect a household’s need to make trade-offs between important basic needs, such as housing or medical bills, and purchasing nutritionally adequate foods.",
  "statement" = "The food insecure population in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Feeding America",
      "date_accessed" = "2021",
      "url" = "https://www.feedingamerica.org/"
    )
  )
)

"drug_overdose_ed_visits:avg_overdose_per_100k" <- list(
  "category" = "Behavioral Health, Substance Use Disorder and Recovery",
  "measure_table" = "drug_overdose_ed_visits",
  "full_name" = "drug_overdose_ed_visits:avg_overdose_per_100",
  "measure" = "avg_overdose_per_100k",
  "type" = "rate",
  "short_name" = "Drug overdose deaths",
  "long_name" = "Death rate per 100,000 residents (All-drug overdose deaths)",
  "short_description" = "Counts of deaths of Virginia residents by utilizing both the underlying cause of death as well as the contributory/multiple causes of death codes.",
  "long_description" = "Counts of deaths of Virginia residents by utilizing both the underlying cause of death as well as the contributory/multiple causes of death codes. The processes in deriving drug overdose-related death counts follows the guidelines set forth by the Centers for Disease Control and Prevention’s (CDC) Opioid Overdose Indicator Support Toolkit, Version 3.0 (March 2018).",
  "statement" = "The drug overdose death rate in {features.name} is {value} per 100,000 residents",
  "sources" = list(
    list(
      "name" = "Virginia Department of Health",
      "date_accessed" = "2021",
      "url" = "https://www.vdh.virginia.gov/opioid-data/deaths/"
    )
  )
)

"civilian_employment_rate:employment_rate" <- list(
  "category" = "Employment/Workforce Development",
  "measure_table" = "civilian_employment_rate",
  "full_name" = "civilian_employment_rate:employment_rate",
  "measure" = "employment_rate",
  "type" = "percent",
  "short_name" = "Employment rate",
  "long_name" = "Civilian employment rate",
  "short_description" = "Population self-reported as employed divided by total civilian workforce population.",
  "long_description" = "Population self-reported as employed divided by total civilian workforce population. Based on American Community Survey Table B23025 ACS 2015/2019 5-year estimates.",
  "statement" = "The employment rate in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "American Community Survey",
      "date_accessed" = "2021",
      "url" = "https://www.census.gov/programs-surveys/acs.html"
    )
  )
)

"earnings_per_job:earnings_per_job" <- list(
  "category" = "Employment/Workforce Development",
  "measure_table" = "earnings_per_job",
  "full_name" = "earnings_per_job:earnings_per_job",
  "measure" = "earnings_per_job",
  "type" = "ratio",
  "short_name" = "Earnings per job",
  "long_name" = "Earnings per job",
  "short_description" = "Earnings per job.",
  "long_description" = "Earnings per job.",
  "statement" = "Earnings per job in {features.name} is ${value}",
  "sources" = list(
    list(
      "name" = "Bureau of Economic Analysis",
      "date_accessed" = "2021"
    )
  )
)

measure_info <- measure_info %>% append(list("earnings_per_job:earnings_per_job" = `earnings_per_job:earnings_per_job`))

# sort alphabetically
measure_info <- measure_info[order(names(measure_info))]

write_json(measure_info, "~/git/community_example/docs/data/measure_info.json", pretty = TRUE,  auto_unbox = TRUE)

library(jsonlite)
measure_info <- read_json("~/git/capital_region/docs/data/measure_info.json")

# all all_ecdf_idx
"latino_east_african_gravity_models:all_ecdf_idx" <- list(
"category" = "Nutrition and Food Security",
"measure_table" = "latino_east_african_gravity_models",
"full_name" = "latino_east_african_gravity_models:all_ecdf_idx",
"measure" = "all_ecdf_idx",
"type" = "float",
"short_name" = "Staple food basket access score",
"long_name" = "Staple food basket access score (Empirical cumulative density function)",
"short_description" = "Staple food basket access score by item availability using an empirical cumulative density function",
"long_description" = "Staple food basket access score by item availability using an empirical cumulative density function. Item availbility determined by webscraping grocery retailer with an online presence. Staple foods are defined by The Food Group.",
"statement" = "The staple food access score in {features.name} is {value}",
"sources" = list(
  list(
    "name" = "Grocery Retailers with Online Presence",
    "date_accessed" = "2021"
  )
)
)
# teff teff_ecdf_idx
"latino_east_african_gravity_models:teff_ecdf_idx" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "latino_east_african_gravity_models",
  "full_name" = "latino_east_african_gravity_models:teff_ecdf_idx",
  "measure" = "teff_ecdf_idx",
  "type" = "float",
  "short_name" = "Teff access score",
  "long_name" = "Teff access score (Empirical cumulative density function)",
  "short_description" = "Teff access score by item availability using an empirical cumulative density function",
  "long_description" = "Teff access score by item availability using an empirical cumulative density function. Item availbility determined by webscraping grocery retailer with an online presence. Teff is defined as an East African staple food by The Food Group.",
  "statement" = "The teff access score in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Grocery Retailers with Online Presence",
      "date_accessed" = "2021"
    )
  )
)
# fava favabeans_ecdf_idx
"latino_east_african_gravity_models:favabeans_ecdf_idx" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "latino_east_african_gravity_models",
  "full_name" = "latino_east_african_gravity_models:favabeans_ecdf_idx",
  "measure" = "favabeans_ecdf_idx",
  "type" = "float",
  "short_name" = "Fava bean access score",
  "long_name" = "Fava bean access score (Empirical cumulative density function)",
  "short_description" = "Fava bean access score by item availability using an empirical cumulative density function",
  "long_description" = "Fava bean access score by item availability using an empirical cumulative density function. Item availbility determined by webscraping grocery retailer with an online presence. Fava beans is defined as an East African staple food by The Food Group",
  "statement" = "The fava bean access score in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Grocery Retailers with Online Presence",
      "date_accessed" = "2021"
    )
  )
)
# avocado avocado_ecdf_idx
"latino_east_african_gravity_models:avocado_ecdf_idx" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "latino_east_african_gravity_models",
  "full_name" = "latino_east_african_gravity_models:avocado_ecdf_idx",
  "measure" = "avocado_ecdf_idx",
  "type" = "float",
  "short_name" = "Avocado access score",
  "long_name" = "Avocado access score (Empirical cumulative density function)",
  "short_description" = "Avocado access score by item availability using an empirical cumulative density function",
  "long_description" = "Avocado access score by item availability using an empirical cumulative density function. Item availbility determined by webscraping grocery retailer with an online presence. Avocado is defined as a Latino staple food by The Food Group",
  "statement" = "The avocado access score in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Grocery Retailers with Online Presence",
      "date_accessed" = "2021"
    )
  )
)
# tomatillo tomatillos_ecdf_idx
"latino_east_african_gravity_models:tomatillos_ecdf_idx" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "latino_east_african_gravity_models",
  "full_name" = "latino_east_african_gravity_models:tomatillos_ecdf_idx",
  "measure" = "tomatillos_ecdf_idx",
  "type" = "float",
  "short_name" = "Tomatillo access score",
  "long_name" = "Tomatillo access score (Empirical cumulative density function)",
  "short_description" = "Tomatillo access score by item availability using an empirical cumulative density function",
  "long_description" = "Tomatillo access score by item availability using an empirical cumulative density function. Item availbility determined by webscraping grocery retailer with an online presence. Tomatillo is defined as a Latino staple food by The Food Group",
  "statement" = "The tomatillo access score in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Grocery Retailers with Online Presence",
      "date_accessed" = "2021"
    )
  )
)
# nopalito nopalitos_ecdf_idx
"latino_east_african_gravity_models:nopalitos_ecdf_idx" <- list(
  "category" = "Nutrition and Food Security",
  "measure_table" = "latino_east_african_gravity_models",
  "full_name" = "latino_east_african_gravity_models:nopalitos_ecdf_idx",
  "measure" = "nopalitos_ecdf_idxnopalitos_ecdf_idx",
  "type" = "float",
  "short_name" = "Nopalito access score",
  "long_name" = "Nopalito access score (Empirical cumulative density function)",
  "short_description" = "Nopalito access score by item availability using an empirical cumulative density function.",
  "long_description" = "Nopalito access score by item availability using an empirical cumulative density function. Item availbility determined by webscraping grocery retailer with an online presence. Nopalito is defined as a Latino staple food by The Food Group",
  "statement" = "The nopalito access score in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "Grocery Retailers with Online Presence",
      "date_accessed" = "2021"
    )
  )
)

measure_info <- measure_info %>% append(list("latino_east_african_gravity_models:nopalitos_ecdf_idx" = `latino_east_african_gravity_models:nopalitos_ecdf_idx`)) %>%
  append(list("latino_east_african_gravity_models:tomatillos_ecdf_idx" = `latino_east_african_gravity_models:tomatillos_ecdf_idx`)) %>%
  append(list("latino_east_african_gravity_models:avocado_ecdf_idx" = `latino_east_african_gravity_models:avocado_ecdf_idx`)) %>%
  append(list("latino_east_african_gravity_models:favabeans_ecdf_idx" =
                `latino_east_african_gravity_models:favabeans_ecdf_idx`)) %>%
  append(list("latino_east_african_gravity_models:teff_ecdf_idx" = `latino_east_african_gravity_models:teff_ecdf_idx`)) %>%
  append(list("latino_east_african_gravity_models:avocado_ecdf_idx" = `latino_east_african_gravity_models:avocado_ecdf_idx`))

measure_info <- measure_info[order(names(measure_info))]

write_json(measure_info, "measure_info.json", pretty = TRUE, auto_unbox = TRUE)

# Demographics

library(jsonlite)
measure_info <- read_json("~/git/capital_region/docs/data/measure_info.json")

# demographics:amr_ind_alone
"demographics:amr_ind_alone" <- list(
  "category" = "Demographics",
  "measure_table" = "va_ca_sdad_2019_demographics",
  "full_name" = "demographics:amr_ind_alone",
  "measure" = "amr_ind_alone",
  "type" = "count",
  "short_name" = "American Indian Population",
  "long_name" = "American Indian Population (count)",
  "short_description" = "The American Indian population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "long_description" = "The American Indian population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "statement" = "The American Indian population in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "American Community Survey",
      "date_accessed" = "2021",
      "url" = "https://www.census.gov/programs-surveys/acs.html"
    )
  )
)

# demographics:asian_alone
"demographics:asian_alone" <- list(
  "category" = "Demographics",
  "measure_table" = "va_ca_sdad_2019_demographics",
  "full_name" = "demographics:asian_alone",
  "measure" = "asian_alone",
  "type" = "count",
  "short_name" = "Asian Population",
  "long_name" = "Asian Population (count)",
  "short_description" = "The Asian population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "long_description" = "The Asian population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "statement" = "The Asian population in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "American Community Survey",
      "date_accessed" = "2021",
      "url" = "https://www.census.gov/programs-surveys/acs.html"
    )
  )
)

# demographics:female
"demographics:female" <- list(
  "category" = "Demographics",
  "measure_table" = "va_ca_sdad_2019_demographics",
  "full_name" = "demographics:female",
  "measure" = "female",
  "type" = "count",
  "short_name" = "Female Population",
  "long_name" = "Female Population (count)",
  "short_description" = "The female population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "long_description" = "The female population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "statement" = "The female population in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "American Community Survey",
      "date_accessed" = "2021",
      "url" = "https://www.census.gov/programs-surveys/acs.html"
    )
  )
)

# demographics:male
"demographics:male" <- list(
  "category" = "Demographics",
  "measure_table" = "va_ca_sdad_2019_demographics",
  "full_name" = "demographics:male",
  "measure" = "male",
  "type" = "count",
  "short_name" = "Male Population",
  "long_name" = "Male Population (count)",
  "short_description" = "The male population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "long_description" = "The male population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "statement" = "The male population in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "American Community Survey",
      "date_accessed" = "2021",
      "url" = "https://www.census.gov/programs-surveys/acs.html"
    )
  )
)

# demographics:total_pop
"demographics:total_pop" <- list(
  "category" = "Demographics",
  "measure_table" = "va_ca_sdad_2019_demographics",
  "full_name" = "demographics:total_pop",
  "measure" = "total_pop",
  "type" = "count",
  "short_name" = "Total Population",
  "long_name" = "Total Population (count)",
  "short_description" = "The total population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "long_description" = "The total population count. Based on American Community Survey ACS 2015/2019 5-year estimates.",
  "statement" = "The total population in {features.name} is {value}",
  "sources" = list(
    list(
      "name" = "American Community Survey",
      "date_accessed" = "2021",
      "url" = "https://www.census.gov/programs-surveys/acs.html"
    )
  )
)

measure_info <- measure_info %>% append(list("demographics:total_pop" = `demographics:total_pop`)) %>%
  append(list("demographics:male" = `demographics:male`)) %>%
  append(list("demographics:female" = `demographics:female`)) %>%
  append(list("demographics:asian_alone" = `demographics:asian_alone`)) %>%
  append(list("demographics:amr_ind_alone" = `demographics:amr_ind_alone`))

measure_info <- measure_info[order(names(measure_info))]

write_json(measure_info, "~/git/capital_region/docs/data/measure_info.json", pretty = TRUE, auto_unbox = TRUE)

dc_working.va_013_cabg_sdad_2021_latino_east_african_gravity_model

dc_population_characteristics.va_013_arl_2020_civic_association_demographics

# dbListSchemas(con)
# dbListTables(con, c("schema.name"))
# dbListFields(con, c("schema.name", "table.name"))
