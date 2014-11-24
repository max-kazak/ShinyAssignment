Stock Return Analyzer
========================================================
author: Max
date: Mon Nov 24 19:54:19 2014

Idea
========================================================

Stock Return Analyzer is the web-application that shluld help people understand how particular componies/stocks perform.  

It's especially important if you are willing to invest in one of them.


Technologies
========================================================
To create such application I've used following technologies:  

- **Shiny** helped me to create the server-client application itself ;  
- **tseries** library was used to obtain stock prices from the *Yahoo! finance* ;  
- **rCharts** creates beautiful charts in my application .  


Returns
========================================================
Return is the amount of money you get/lose if you invest in company in the begining of the period and sell your stock in the end of period. Returns are measured in percents.  
So if you've invested M dollars and sold your stocks later, you can calculate your income by multiplying M by return.

How do we calculate it?  
If $P_{i}$ is the price of the stock in the beginning of the period, then return is :  

$$
\begin{aligned}
R_{i} = \frac{P_{i}-P_{i-1}}{P_{i-1}}
\end{aligned}
$$

Yahoo! finance
=======================================================
Stock price history can be easyly downloaded from *Yahoo! Finance* with **tseries** library:  

```r
library(tseries)
price <- get.hist.quote(instrument='MSFT', provider="yahoo",
                        start="2011-01-01", end="2012-01-01")
```

```r
head(price, n=3)
```

```
            Open  High   Low Close
2011-01-03 28.05 28.18 27.92 27.98
2011-01-04 27.94 28.17 27.85 28.09
2011-01-05 27.90 28.01 27.77 28.00
```




