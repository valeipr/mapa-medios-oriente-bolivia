library(tidyverse)
library(leaflet)

datos <- read_csv("data/input/datos.csv")

mapa <- leaflet(datos) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addCircles(radius = ~sqrt(seguidores*500),
             popup = ~nombre,
             fillColor = "transparent",
             weight = 3)

save_html(mapa, file="output/mapa_preliminar.html")