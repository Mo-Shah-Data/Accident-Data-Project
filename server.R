library(shiny)
library(datasets)


shinyServer (function(input, output, session) {
  
  points <- eventReactive(input$recalc, {
    cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  }, ignoreNULL = FALSE)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("Stamen.TonerLite",
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addCircleMarkers(lng=Accidents0513$Longitude, lat=Accidents0513$Latitude,
                       clusterOptions = markerClusterOptions(maxBytes = Inf))
  })
}