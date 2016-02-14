library(shiny)
library(ggplot2)
library(sqldf)

shinyServer(function(input, output, session) {
  
  points <- eventReactive(input$recalc, {
    cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("MapQuestOpen.OSM",
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
    
    addCircleMarkers(lng=TopThousandRows$Longitude, lat=TopThousandRows$Latitude, radius = 5,
                     clusterOptions = markerClusterOptions())
  })
})

