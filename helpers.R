library(shiny)
library(bs4Dash)
library(wordcloud2)
library(lubridate)
library(shinyWidgets)

###Load Data
tdata <- readRDS("data/taverndata.RDS")
cdata <- readRDS("data/chardata.RDS")

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

###Character Tab
char_tab <- bs4TabItem(
  tabName="chars",
  fluidRow(
    bs4Card(
      title = textOutput("charname"), 
      closable = FALSE, 
      width = 12,
      solidHeader = TRUE, 
      collapsible = TRUE,
      fluidRow(
        column(3,
         pickerInput(inputId="charpick",
                     label=NULL,
                     choices=setNames(as.list(cdata[["charlist"]]$code), cdata[["charlist"]]$name),
                     selected="AN",   
                     options = list(
                       `live-search` = TRUE))       
        ),
        column(9,
         tableOutput("chartable")
        )
      )
    )
  )
)


