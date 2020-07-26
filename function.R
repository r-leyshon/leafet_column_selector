"purpose of script - create a function that allows control over which feature
from shapefile to plot to colour aesthetic of map"


# call packages -----------------------------------------------------------
library(pacman)
p_load(leaflet, magrittr)

# read data ---------------------------------------------------------------
"import shapefile of all lsoas in Wales. Note that this shapefile was originally
imported with the 'sf' package - the newer way of working with shapefiles in R.
A lot of the code online references the tried & tested 'sp' package." 
lsoa_wales_2011Polygon_projected <- readRDS("data/lsoa_wales_2011Polygon_projected.rds")

#import WIMD data. Dataframe that has every lsoa in Wales ranked by indicators of deprivation.
wimd <- readRDS("data/dataView2445.78.rds")




# create map --------------------------------------------------------------
#function that takes a sf shapefile & also a variable dataframe column to
#colour by & contorl popup info
colour_by_column <- function(shapefile, dataframe_column){
#create map
interactive_map <- leaflet() %>% 
  #add tiles to map
  addProviderTiles("Stamen.TonerLite") %>% 
  #add chloropleth
  addPolygons(
    #use geometry from sf
    data = shapefile,
    #boundary lines to grey hex code
    color = "#444444",
    #specify boundary line weight
    weight = 1,
    #specify the degree of smoothing to the lsoa polygons
    smoothFactor = 0.5,
    #set opacity of boundary lines
    opacity = 0.5,
    #set opacity of polygon fill
    fillOpacity = 0.5,
    #control the colour of the polygon fill
    fillColor = ~colorFactor('viridis', dataframe_column)(dataframe_column),
    #control the behaviour on hover 
    highlightOptions = highlightOptions(color = "white", weight = 2,
                                        bringToFront = F),
    #info on click
    popup = ~dataframe_column
  ) %>%
  #set the starting view
  setView(lng = -3.8, lat = 52.5, zoom = 8)

#call the map
interactive_map

}



# apply function ----------------------------------------------------------

colour_by_column(shapefile = lsoa_wales_2011Polygon_projected,
                 dataframe_column = wimd$overall_rank_2019)

#and another column
colour_by_column(shapefile = lsoa_wales_2011Polygon_projected,
                 dataframe_column = wimd$quintile)

"This approach appears to work with dollar notation but not [slicing columns].
Also this will work as the data & the shapefile have a common LSOA code to use
as a key."

