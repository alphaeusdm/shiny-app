library(shiny)
library(datasets)
library(dplyr)
library(ggplot2)
data("quakes")

model1 <- lm(mag~lat+long+depth,data = quakes)

shinyServer(function(input, output) {
    output$mag <- renderText({
        df <- data.frame(lat=input$lat,long=input$long,depth=input$depth)
        p <- predict(model1,newdata = df)
    })

    output$plot <- renderPlot({
        df <- data.frame(lat=input$lat,long=input$long,depth=input$depth)
        p <- predict(model1,newdata = df)
        yvals <- c("lat", "long", "depth", "mag")
        df <- data.frame(x = factor(yvals, levels = yvals, ordered = TRUE),
                         y = c(input$lat,input$long,input$depth,p))
        ggplot(df, aes(x=x, y=y, color=c("red", "green", "blue", "black"), fill=c("red", "green", "blue", "black"))) +
            geom_bar(stat="identity", width=0.5) +
            xlab("") +
            ylab("") +
            theme_minimal() +
            theme(legend.position="none")
    })

})
