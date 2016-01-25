paste("There are","5","books")
x = c(2,5,1,0)
mean(x)
x[2] = NA
is.na(x)

x = Sys.Date()
x
x - 1000

# to convert character to date use as.Date

require(ggmap)

mapImageData3 <- get_map(location = "UK",
                         color = "color",
                        source = "google",
                      maptype = "roadmap",
)
                         

ggmap(mapImageData3, 
      extent = "auto")
