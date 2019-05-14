library(shiny)
library(bs4Dash)
library(wordcloud2)
library(lubridate)
library(shinyWidgets)
library(dplyr)
library(DT)
library(tibble)

###Load Data
tdata <- readRDS("data/taverndata.RDS")
cdata <- readRDS("data/chardata.RDS")
edata <- readRDS("data/epdata.RDS")

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
      solidHeader=FALSE,
      status="dtavern",
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
      solidHeader = FALSE,
      status="dtavern",
      collapsible = FALSE,
      tableOutput("chartable")
    )
  ),
  fluidRow(
    bs4Card(
      title = "Episodes", 
      closable = FALSE, 
      width = 12,
      solidHeader = FALSE,
      status="dtavern",
      collapsible = FALSE,
      DTOutput("chareps")
    )
  )
)

###Episode Tab
ep_tab <- bs4TabItem(
  tabName="eps",
  fluidRow(
    bs4Card(
      title="Select Episode",
      closable=FALSE,
      width=5,
      solidHeader=FALSE,
      status="dtavern",
      collapsible=FALSE,
      pickerInput(inputId="eppick",
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
      solidHeader = FALSE,
      status="dtavern",
      collapsible = FALSE,
      tableOutput("chartable")
    )
  ),
  fluidRow(
    bs4Card(
      title = "Episodes", 
      closable = FALSE, 
      width = 12,
      solidHeader = FALSE,
      status="dtavern",
      collapsible = FALSE,
      DTOutput("chareps")
    )
  )
)
