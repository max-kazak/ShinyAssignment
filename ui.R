library(shiny);library(rCharts)
shinyUI(pageWithSidebar(
    headerPanel("Stocks return analyzer."),
    sidebarPanel(
        h3('Stocks'),
        p('What stocks do you wish to analyze?'),
        checkboxGroupInput("stocks", "Checkbox",
                           c("Microsoft (MSFT)" = "MSFT",
                             "Apple (AAPL)" = "AAPL",
                             "Google (GOOGL)" = "GOOGL")),
        h3('Dates'),
        p('Specify start and end dates of the period of interest.'),
        dateInput('startdate', 'Start date:',value='2011-01-01', startview = "year"),
        dateInput('enddate', 'End date:',value='2013-01-01', startview = "year"),
        submitButton('Analyze')
    ),
    mainPanel(
        h2('Welcome!'),
        p('This is web-application for calculation of market stock returns in specified period. Data is provided by Yahoo!'),
        p('To start your analyzes, please choose stocks and date period on the left side of the window. As soon as you finished click Analyze button and wait until plot appear.'),
        p('Enjoy! =)'),
        h3('Bar plot of monthly stock returns'),
        showOutput("myChart", "morris"),
        h4('Thanks...'),
        p('Here I\'d like to say thanks to team of DevelopingDataProducts Coursera course for help in cretion of this app.')
    )
))