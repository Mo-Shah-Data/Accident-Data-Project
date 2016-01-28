install.packages('shiny')
install.packages('shinydashboard')
install.packages('devtools')
require(devtools)
install_github('rCharts', 'ramnathv')
install.packages("leaflet")
require(ggmap)

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





AccidentsAll <- leaflet() %>%
addMarkers(lng=Accidents0513$Longitude, lat=Accidents0513$Latitude, popup="T")

AccidentsAll








