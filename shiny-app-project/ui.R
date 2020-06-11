library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Johnson & Johnson Stock Predictor"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(p(strong("Documentation:",style="color:red"), a("User Help Page",href="https://rpubs.com/alpha2707/626551")),
            sliderInput("lat",
                        "Latitude",
                        min = -40,
                        max = -8,
                        value = -20,
                        step = 0.01),
            sliderInput("long",
                        "Longitude",
                        min = 162,
                        max = 190,
                        value = 175,
                        step = 0.01),
            sliderInput("depth",
                        "Depth(km)",
                        min = 40,
                        max = 700,
                        value = 200)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            em("Predicted Richter Magnitude:"),
            textOutput("mag"),
            plotOutput("plot")
        )
    )
))
