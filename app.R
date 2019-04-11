###Load Helpers
source("helpers.R",local=TRUE)

###Load UI Parts
source("sidebar.R",local=TRUE)

ui <- bs4DashPage(
  navbar=bs4DashNavbar(
    textOutput("dateText")
  ),
  
  sidebar=sidebar,
  
  body=bs4DashBody(bs4TabItems(
          wc_tab
        )),
  
  controlbar=bs4DashControlbar(skin="light"),
  
  footer=bs4DashFooter(),
  
  title="Hello from the Shiny Tavern!"
)

server <- function(input, output, session) {
  output$wordCloud <- renderWordcloud2({
      wordcloud2(data = tdata[["char_freq"]][,c("word","freq")],
                 size=0.30,
                 shape='circle')
    })
  
  output$dateText <- renderText({
    daydiff <- as.numeric(difftime(today(),tdata[["firstdate"]],units="days")) 
    yearpart <- floor(daydiff/365.25)
    monthpart <- round((daydiff - (yearpart*365.25)) / 30.4167)
    
    if(monthpart==0){
      date.sent <- paste("About",yearpart,"years ago",sep=" ")
    }else if(monthpart==1){
      date.sent <- paste("About",yearpart,"years and",monthpart,"month ago",sep=" ")
    }else{
      date.sent <- paste("About",yearpart,"years and",monthpart,"months ago",sep=" ")
    }
    
    date.sent
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

