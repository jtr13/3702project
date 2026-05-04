library(arrow)
library(dplyr)

input_dir <- "data/citibike"
output_dir <- "data/citibike_parquet"

ds_input <- open_dataset(input_dir, format = "csv", partitioning = "month")

write_dataset(
  dataset = ds_input, 
  path = output_dir, 
  format = "parquet", 
  partitioning = "month",
  hive_style = FALSE,        
  max_rows_per_file = 1000000, # 1 million rows(matches how .csv files are seperated)
  existing_data_behavior = "overwrite")

message("Done!")