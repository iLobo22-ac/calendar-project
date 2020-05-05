library(shiny)
library(tidyverse)
library(shinythemes)

#dataset
dds_final <- read_csv("dds_final.csv")


# Define UI for application that draws 
ui <- fluidPage(
  
  # Application title
  titlePanel("Diary of A Data Scientist by Isabelle Lobo"),
  
  #creatr two tabs and first tab about timeslot second about time of day
    tabsetPanel(type = "tabs",
            tabPanel("Average Timeslot Duration/ Number of Timeslots by Activity Type",
                sidebarLayout(sidebarPanel(
                  # Select type of timeslot data you want
                  selectInput( inputId = "dt",
                                      label= "Select Timeslot Data to Analyze",
                                      choices = c("avg_timeslot", "num_timselots"),
                                      selected = "avg_timeslot"),
                  
                  checkboxGroupInput( inputId = "activity", 
                                      label = "Select Activity Type", 
                                      choices = c("Academics", "Athletics", "Extracurricular", "Health_Wellness", "Meals"),
                  mainPanel(
                    plotOutput(outputId ="timeslot")
                  )
                  
                )
                )  
            ),

    )         
    )
)

# Run the application 
shinyApp(ui = ui, server = server)
