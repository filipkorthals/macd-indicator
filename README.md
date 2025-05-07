# MACD indicator

A university project completed as part of the Numerical Methods course. The goal was to implement the MACD (Moving Average Convergence/Divergence) indicator, analyze its strengths and weaknesses, and use it in a simple trading algorithm that buys and sells CD Projekt SA stocks based on generated signals.

---

## Project Description

The MACD indicator might be useful for detecting trend changes in stock prices. 
This project includes:

- implementation of the MACD and Signal line,
- implementation of a basic buy/sell algorithm based on moments when MACD and Signal line cross,
- analysis of indicator effectiveness on both long- and short-term investments,
- visualization of results using plots.

The project uses stock prices of CD Projekt SA from the last 1000 trading days, ending on March 15, 2024 – data was retrieved from [stooq.pl](https://stooq.pl).
The implementation was done entirely in MATLAB.

---

## Trading Algorithm

The algorithm executes trades based on MACD/Signal crossovers:

- **Buy** – when MACD crosses the Signal line from below,
- **Sell** – when MACD crosses the Signal line from above.

Mechanism:
- The simulation starts with an initial amount of cash.
- On a buy signal, the algorithm purchases as many stocks as possible.
- On a sell signal, it sells all holdings.
- At the end, the cash value after transactions and percentage profit are displayed.

This strategy generated a profit of around **14%** over the tested time period.

---

## Results

Using the MACD indicator is one of the simplest methods for detecting trend changes. The only condition is to check if MACD crosses the Signal line. However, as the analysis shows, this method is effective only in **long-term investments**, due to delayed signals given by the MACD indicator. In the case of short-term investments, relying solely on the MACD indicator without any additional tools can even result in a loss instead of a profit.

A full report in Polish is available in the `/docs` directory.
