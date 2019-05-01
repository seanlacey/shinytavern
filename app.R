###Load Helpers
source("helpers.R",local=TRUE)

###Load UI Parts
source("sidebar.R",local=TRUE)

ui <- bs4DashPage(
  navbar=bs4DashNavbar(
    htmlOutput("dateText"),
    controlbarIcon = "wifi"
  ),
  
  sidebar=sidebar,
  
  body=bs4DashBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "mystyle.css")
    ),
    bs4TabItems(
      char_tab,
      wc_tab
      )
    ),
  
  controlbar=bs4DashControlbar(title="Available Networks",
                               icon("signal"),
                               "Burger King: Weak",
                               skin="light"),
  
  footer=bs4DashFooter(),
  
  title="Hello from the Shiny Tavern!",
  sidebar_collapsed = TRUE
)

server <- function(input, output, session) {
  output$wordCloud <- renderWordcloud2({
      pal <- c("#242038","#9B1D20", "#0E34A0", "#561D25")
      wordcloud2(data = tdata[["char_freq"]][,c("word","scalefreq")],
                 size=0.35,
                 shape='circle',
                 color=rep_len(pal[2:4], nrow(tdata[["char_freq"]])))
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
    
    date.sent <- paste0("<b>Time since falling through portal:</b> ",date.sent)
    
    date.sent
  })
  
  output$charname <- renderText({
    as.character(cdata[[input$charpick]][cdata[[input$charpick]]$COL1=="Name","COL2"])
  })
  
  output$chartable <- renderTable({
    cdata[[input$charpick]]
    },
    colnames=FALSE,
    sanitize.text.function = function(x) x)
  
  output$chareps <- renderDT({
    if(!is.null(input$charpick) & !is.na(input$charpick)){
      out.table <- tdata[["all_eps_char"]] %>% 
        filter(CHARID==input$charpick) %>%  
        mutate(seasep = paste0("Season ",Season,", Episode ",Episode),
               datec = as.character(Date)) %>% 
        select(seasep,Name,datec)
      
      out.table  
    }
  },options = list(ordering=FALSE),
    colnames=c("Episode Number","Name","Date"),
    rownames=FALSE,
    class="compact")
}

# Run the application 
shinyApp(ui = ui, server = server)

