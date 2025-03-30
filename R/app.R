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
  bsicons
)


# APP UI ------------------------------------------------------------------

ui <- bslib::page_sidebar(
  title = "EXPLORATORY DATA ANALYSIS",
  sidebar = sidebar("Sidebar", title = "Filters"),
  value_box(
    title = "Total Pop",
    value = "6,000,000,000",
    fill = "green4",
    showcase = bsicons::bs_icon("bar-chart")
  ),
  card(
    card_header("Map"),
    card_footer("Disclaimer: This map does not in anyway reflect the views of UNFPA on International Boarders!")
  ),
  lang =  "en"
)


# APP SERVER --------------------------------------------------------------

server <- function(input, output){
  
}


# APP RUN -----------------------------------------------------------------

shiny::shinyApp(ui = ui, server = server)






