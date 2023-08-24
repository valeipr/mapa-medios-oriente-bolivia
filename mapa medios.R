library(tidyverse)
library(leaflet)

datos <- read_csv("data/input/datos.csv")

leaflet(datos) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addCircles(radius = ~sqrt(seguidores*500),
             popup = ~nombre,
             weight = 3)
