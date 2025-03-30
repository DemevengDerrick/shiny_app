################################################################################
#                        By Derrick Demeveng                                   #
#                                                                              #
################################################################################

# LOAD PACKAGES -----------------------------------------------------------

# check if pacman exist and install if not
if (!require("pacman")) install.packages("pacman")

pacman::p_load(
  shiny,
  bslib,
  bsicons,
  maps,
  mapproj
)

source("helpers.R")
# LOAD DATA ---------------------------------------------------------------

countries <- readRDS("../data/counties.rds")

# APP UI ------------------------------------------------------------------

ui <- bslib::page_sidebar(
  # side bar
  title = "censusVis",
  
  sidebar = sidebar(
    helpText(
      "Create demographic maps with information from the 2010 US Census."
    ),
    selectInput(
      "var",
      label = "Choose a variable to display",
      choices =
        c(
          "white",
          "black",
          "hispanic",
          "asian"
        ),
      selected = "white"
    ),
    sliderInput(
      "range",
      label = "Range of interest:",
      min = 0, 
      max = 100, 
      value = c(0, 100)
    )
  ),
  # map card
  card(plotOutput("map")),
  # language
  lang =  "en"
)


# APP SERVER --------------------------------------------------------------

server <- function(input, output){
  # update text box
  output$map <- renderPlot({
    percent_map(var = countries[[input$var]],
                legend.title = "Map",
                color = "green4")
    #print("derrick")
  })
  
  # Update value_box
}


# APP RUN -----------------------------------------------------------------

shiny::shinyApp(ui = ui, server = server)






