library(shiny)
library(bs4Dash)
library(wordcloud2)
library(lubridate)

###Load Data
tdata <- readRDS("data/taverndata.RDS")

###Bubble Card
wc_tab <- bs4TabItem(
  tabName = "wordCloud",
  fluidRow(
    bs4Card(
      title = "Character Chart", 
      closable = FALSE, 
      width = 12,
      solidHeader = TRUE, 
      collapsible = TRUE,
      wordcloud2Output("wordCloud", width = "100%", height = "600px")
    )
  )
)