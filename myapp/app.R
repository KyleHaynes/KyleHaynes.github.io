# Install and load the required libraries
install.packages(c("shiny", "plotly"))
library(shiny)
library(plotly)

# UI definition
ui <- fluidPage(
  titlePanel("Interactive Waterfall Chart"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("starting_point", "Starting Point:", min = -20, max = 20, value = 0),
      sliderInput("category1_value", "Category 1 Value:", min = -20, max = 20, value = 10),
      sliderInput("category2_value", "Category 2 Value:", min = -20, max = 20, value = -5),
      sliderInput("category3_value", "Category 3 Value:", min = -20, max = 20, value = 8)
    ),
    mainPanel(
      plotlyOutput("waterfall_chart")
    )
  )
)

# Server logic
server <- function(input, output) {
  output$waterfall_chart <- renderPlotly({
    # Sample data for the waterfall chart
    data <- data.frame(
      Category = c("Starting Point", "Category 1", "Category 2", "Category 3", "Ending Point"),
      Value = c(input$starting_point, input$category1_value, input$category2_value, input$category3_value, 0)
    )

    # Calculate the cumulative values for the waterfall chart
    data$Cumulative <- cumsum(data$Value)

    # Create the waterfall chart using plot_ly with custom colors
    waterfall_chart <- plot_ly(
      type = "waterfall",
      x = data$Category,
      y = data$Value,
      text = paste("Value: ", data$Value),
      connector = list(mode = "between", line = list(color = "rgb(63, 63, 63)")),
      increasing = list(marker = list(color = "rgba(0, 150, 0, 0.8)")),  # Dark green
      decreasing = list(marker = list(color = "rgba(200, 0, 0, 0.8)")),   # Dark red
      totals = list(marker = list(color = "rgba(100, 149, 237, 0.8)", line = list(color = "rgb(63, 63, 63)")))
    )

    # Return the chart
    waterfall_chart
  })
}

# Run the Shiny app
shinyApp(ui, server)


