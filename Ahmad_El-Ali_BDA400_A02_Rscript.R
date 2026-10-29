library(quantmod)
library(TTR)


symbols <- readLines("C:/Users/ThinPad/Downloads/portfolio.txt")

stock_data <- list()
for (sym in symbols) {
  stock_data[[sym]] <- getSymbols(sym, src = "yahoo", auto.assign = FALSE)
}

for (sym in symbols) {
  prices <- Cl(stock_data[[sym]])
  
  mean_price <- mean(prices, na.rm = TRUE)
  median_price <- median(prices, na.rm = TRUE)
  sd_price <- sd(prices, na.rm = TRUE)
  ma_50 <- SMA(prices, n = 50)
  
  cat("\n-----------------------------------\n")
  cat("Stock:", sym, "\n")
  cat("Mean Price:", mean_price, "\n")
  cat("Median Price:", median_price, "\n")
  cat("Standard Deviation:", sd_price, "\n")
  cat("Latest 50-day Moving Average:", tail(ma_50, 1), "\n")
}

chartSeries(stock_data[[1]], name = symbols[1], TA = "addBBands()")