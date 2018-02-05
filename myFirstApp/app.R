#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel(date()),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("Markers",
                     "Number of Markers:",
                     min = 1,
                     max = 20,
                     value = 5)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
              leafletOutput("mymap")

      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
      output$location <- renderText(
              input$Markers
      )
      output$mymap <- renderLeaflet({
              espiralinkIcon <- makeIcon(
                      iconUrl = "http://www.espiralink.com/logo.png",
                      iconWidth = 31*215/230, iconHeight = 31,
                      iconAnchorX = 31*215/230/2, iconAnchorY = 16
              )
              espiralinklatlng <- data.frame (
                      lat = runif(input$Markers, min = 40.5, max = 41.2),
                      lng = runif(input$Markers, min = -3.9, max = -3.4)
              )
              espiralinkSites <- c(
                      "<a href=http://www.espiralink.com> eSpiralink </a>"
              )
              # draw the map with the specified number of markers
              espiralinklatlng %>%
                      leaflet() %>%
                      addTiles() %>%
                      addMarkers(icon = espiralinkIcon, popup = espiralinkSites)
             
              
      })
}

# Run the application 
shinyApp(ui = ui, server = server)

