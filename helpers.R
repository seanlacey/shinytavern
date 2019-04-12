library(shiny)
library(bs4Dash)
library(wordcloud2)
library(lubridate)
library(shinyWidgets)
library(DT)

###Load Data
tdata <- readRDS("data/taverndata.RDS")
cdata <- readRDS("data/chardata.RDS")

###Bubble Card
wc_tab <- bs4TabItem(
  tabName = "wordCloud",
  fluidRow(
    bs4Box(
      width = 12,
      wordcloud2Output("wordCloud", width = "100%", height = "600px")
    )
  )
)

###Character Tab
char_tab <- bs4TabItem(
  tabName="chars",
  fluidRow(
    bs4Card(
      title="Select Character",
      closable=FALSE,
      width=5,
      solidHeader=TRUE,
      collapsible=FALSE,
      pickerInput(inputId="charpick",
                  label=NULL,
                  choices=setNames(as.list(cdata[["charlist"]]$code), cdata[["charlist"]]$name),
                  selected="AN",   
                  options = list(
                    `live-search` = TRUE))
    )
  ),
  fluidRow(
    bs4Card(
      title = "Character", 
      closable = FALSE, 
      width = 12,
      solidHeader = TRUE, 
      collapsible = FALSE,
      tableOutput("chartable")
    )
  ),
  fluidRow(
    bs4Card(
      title = "Episodes", 
      closable = FALSE, 
      width = 12,
      solidHeader = TRUE, 
      collapsible = FALSE,
      DTOutput("chareps")
    )
  )
)


