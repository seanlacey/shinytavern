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

##Acknowledgement Tab
ack_tab <- bs4TabItem(
  tabName="ack",
  fluidRow(
    bs4Card(
      title="Acknowledgements",
      closable=FALSE,
      width=10,
      solidHeader=FALSE,
      status="dtavern",
      collapsible=FALSE,
      p(h5("While this application was built using R and Shiny, it would not have been possible without the following:")),
      tags$ul(
        tags$li(h5("Arnie, Adel, Matt, and the entire crew that works to create this wonderful podcast.")),
        tags$li(h5(a("The Magic Tavern Website:",href="https://hellofromthemagictavern.com/")," was the source of all data on episodes and the characters in each episode.")),
        tags$li(h5(a("Magic Tavern Wiki:",href="http://magictavern.wikidot.com/")," was the source of most all of the character specific data."))
      )
    )
  ),
  fluidRow(
    bs4UserCard(
      type = 2,
      src = "plaidypus.png",
      status = "primary",
      imageElevation = 2,
      title = "created by slacey",
      h5(a("slacey.net",href="https://www.slacey.net"))
    )
  )
)
