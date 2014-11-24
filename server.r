library(shiny);library(zoo);library(tseries);library(rCharts)
shinyServer(
    function(input, output) {
        output$sdate<-renderPrint({input$startdate})
        output$edate<-renderPrint({input$enddate})
        
        output$myChart <- renderChart({
            stocks<-input$stocks
            if(length(stocks)==0){
                stocks<-c('MSFT')
            }
            prices <- NA
            
            for(s in stocks){
                price <- get.hist.quote(instrument=s, 
                                        start=input$startdate, end=input$enddate, 
                                        quote="AdjClose", provider="yahoo", 
                                        origin="1970-01-01", compression="m", retclass="zoo")
                if(is.na(prices))
                    prices <- price
                else
                    prices <- merge(prices, price)
            }
            prices = diff(prices)/lag(prices, k=-1);
            prices.df<-data.frame(Date=format(time(prices), "%Y-%m-%d"), prices, check.names=FALSE, row.names=NULL)
            names(prices.df)<-c('Date',stocks)
            
            cat(prices.df$Date[1])
            plot<-mPlot(x='Date',y=stocks,data=prices.df,type='Bar')
            plot$set( labels = stocks )
            plot$set(pointSize = 0, lineWidth = 1)
            plot$addParams(dom = 'myChart')
            
            return(plot)
        })
    }
)