# # Readme

Script written to assist graduates in writing shiny application. Exemplifies how to create a function that chooses an aesthetic to plot to a map. 

• Shapefile is 2011 Welsh LSOAs.  Rds object was originally .shp file imported with the ‘sf’ package, as described in script. 

• Dataframe is Welsh Indicators of Multiple Deprivation. Source: [Stats Wales](https://statswales.gov.wales/Catalogue/Community-Safety-and-Social-Inclusion/Welsh-Index-of-Multiple-Deprivation)

• Function created takes the shape file as first argument and column from data frame as second argument. Supports dollar notation (dataframe$column). 

• Function maps selected column to the colour scale & popup of rendered chloropleth.

• Dependencies - leaflet for the map and magrittr for the pipes (%>%).  
