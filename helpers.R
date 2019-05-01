library(shiny)
library(wordcloud2)
library(lubridate)
library(shinyWidgets)
library(dplyr)
library(DT)

###Load Data
tdata <- readRDS("data/taverndata.RDS")
cdata <- readRDS("data/chardata.RDS")


