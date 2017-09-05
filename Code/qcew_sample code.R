setwd("/Users/Wei/PDX Google Drive/Street Improvements/Data/Portland/QCEW/")

files_to_load <- list.files(pattern = "*.shp$",full.names = TRUE)

qcew <- lapply(files_to_load, st_read)
qcew <- bind_rows(qcew)

library(sf)
library(tigris)
library(dplyr)

ret_sf <- st_read("Ret_2015.shp")

pdx_blocks <- blocks("or")
pdx_blocks <- st_transform(pdx_blocks, crs = " +proj=longlat +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +no_defs")

blocks_ret <-st_join(pdx_blocks, ret_sf, join =st_intersects, left = FALSE)
