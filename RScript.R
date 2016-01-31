install.packages('shiny')
install.packages('shinydashboard')
install.packages('devtools')
require(devtools)
install_github('rCharts', 'ramnathv')
install.packages("leaflet")
require(ggmap)

library(shiny)
runExample(example = "01_hello")

x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap")
install.packages(x)
lapply(x, library, character.only = TRUE)

mean(x)
x[2] = NA
is.na(x)


library(leaflet)
x = Sys.Date()
x
x - 1000

#To check for nulls or empty 
is.na(x)
or is.nan(x)

na.rm = TRUE

# to convert character to date use as.Date



mapImageData3 <- get_map(location = "UK",
                         color = "color",
                        source = "google",
                      maptype = "roadmap",
)
                         



###Start of Project Work

#Remember to add the argument stringAsFactors = FALSE this will import it as a character and without it it will come in as factor
Accidents0513 <- read.csv("~/Desktop/AccidentData/Accidents0513.csv")



#Remove all unwanted columns

#First check what columsn are in the dataset

head(Accidents0513)

colnames(Accidents0513)
#Create data.frame with columns required

#Date time data type is follows eg. date <- as.POSIXct("2012-06-28 17:42")


#Leaflet playaround 

leaflet(london)


##Shiny  playaround
leaflet() 

AccidentsAll <- leaflet() %>%
addMarkers(lng=Accidents0513$Longitude, lat=Accidents0513$Latitude, popup="T")

AccidentsAll

AccidentsAll <- leaflet() %>%
  addMarkers(lng=--0.191170, lat=51.48910, popup="T")
library(leaflet)
AccidentsAll

################################################################

#Need to first of all clear the columns not needed

Accidents0513 <- Accidents0513[,c("Longitude","Latitude","Time","Date","Day_of_Week","Accident_Index")]
#Now we have the columns we want

# The Accident Index is included below to make sure the accident recorded is not a duplicate.
#We can check for duplicates using the following command

length(unique(Accidents0513$Accident_Index))
#This returns 1494275 which is the exact number of rows and show there are no duplicaes in each of the unique rows recorded in the dataset.

# Use the following to look for null or incomplete values for each column
is.na(Accidents0513$Longitude)

##Still got to get code to show if any values are missing na



library(rgdal)
lnd <- readOGR(dsn = "data", layer = "london_sport")


library(leaflet)
library(magrittr)
leaflet()

#Create  a subset of the data for the first ten results

TopTenRows <-Accidents0513[1:10, ]
TopTenRows


#we can use this data to test plots rather than using almost 1.4 million rows everytime.

# Below is the code required to test a plot with this Data

AccidentsTopTen <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=TopTenRows$Longitude, lat=TopTenRows$Latitude, popup="Accidents")
  # Print the map
AccidentsTopTen

#When this is run the plot works fine, So now we can try the top 200 and start to customise the markers to perform cluster analysis which is better for normal people to analyse.

TopThousandRows <-Accidents0513[1:1000, ]
TopThousandRows

#TopThousandRows now shows the top thousand rows and we plot these to test

AccidentsTopThousand <- leaflet() %>% 
  addTiles() %>% 
  setView(-0.191170, 51.48910, zoom = 13) %>% 
  addMarkers(lng=TopThousandRows$Longitude, lat=TopThousandRows$Latitude, popup="Accidents")
AccidentsTopThousand

#Test to plot all
AllAccidents0513 <- leaflet() %>% 
  addTiles() %>% 
  setView(-0.191170, 51.48910, zoom = 13) %>% 
  addMarkers(lng=Accidents0513$Longitude, lat=Accidents0513$Latitude, popup="Accidents")
AllAccidents0513



#To Write about - We stuck to the default OpenStreetMap base tiles and map as we need to make the process as simple as possible and have the best end result for people trying to replicate this.

#For Marker Clusters the following URL needs to be used to implement this and develop it.
#https://github.com/Leaflet/Leaflet.markercluster

AccidentsClustered <- leaflet() %>% 
addTiles() %>% 
  setView(-0.191170, 51.48910, zoom = 13) %>%
  addCircleMarkers(lng=TopThousandRows$Longitude, lat=TopThousandRows$Latitude, radius = 5,
                   clusterOptions = markerClusterOptions())
AccidentsClustered

##In the above we tested the top 1000 rows and now we want to plot for all UK from 2005 to 2013

Accidents0513

AllAccidentsClustered <- leaflet(na.omit(Accidents0513)) %>% 
  addTiles() %>% 
  setView(-0.191170, 51.48910, zoom = 10) %>%
  addCircleMarkers(lng=Accidents0513$Longitude, lat=Accidents0513$Latitude,
clusterOptions = markerClusterOptions())
AllAccidentsClustered



mean(TopThousandRows$Longitude)
mean(TopThousandRows$Latitude)
is.na()
!is.na(TopThousandRows$Longitude)
library(leaflet)
library(magrittr)

