library(tidyverse)
library(leaflet)
library(sf)

# leer y filtrar datos
datos <- read_file("data/lpz.geojson") %>%
  geojsonsf::geojson_sf()

# path imagenes
datos <- datos %>%
  mutate(img = paste0("img2/", img))

st_write(datos, "output/prueba.geojson")

limites <- read_file("data/Bolivia-Municipalities.geojson") %>%
  geojsonsf::geojson_sf()

leaflet(limites) %>%
  addProviderTiles(providers$CartoDB.Positron) %>%
  addPolygons(fillColor = "transparent",
              color = "#000", weight = 1, dashArray = 2, opacity = 0.6,
              group = "Todos") %>%
  addMarkers(data = datos)

save_html(mapa, file="output/mapa_preliminar.html")