###Load Helpers
source("helpers.R",local=TRUE)

ui <- fluidPage(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "mystyle.css")
  ),
  fluidRow(
    div(h1('Hello from the Shiny Tavern!'))
  ),
  fluidRow(h4(htmlOutput("dateText"))),
  fluidRow(br()),
  fluidRow(
    navlistPanel(
      "Pages",
      tabPanel("Characters",
               div(pickerInput(inputId="charpick",
                               label=NULL,
                               choices=setNames(as.list(cdata[["charlist"]]$code), cdata[["charlist"]]$name),
                               selected="AN",   
                               options = list(
                                 `live-search` = TRUE))),
               br(),
               tags$div(class="parchmentTop",
                        tags$div(class="parchment"),
                        tags$div(class="parchmentBody",tableOutput("chartable")),
                        tags$div(class="parchmentBottom")
               ),
               br(),
               tags$div(class="parchmentTop",
                        tags$div(class="parchment"),
                        tags$div(class="parchmentBody",DTOutput("chareps")),
                        tags$div(class="parchmentBottom")
               )
            ),
      tabPanel("Word Cloud",
               div(div(wordcloud2Output("wordCloud", width = "100%", height = "600px"),class='paper'),class='paper-wrap')
               ),
      widths = c(3,8)
    )  
  )
)

server <- function(input, output, session) {
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
    df <- cdata[[input$charpick]] %>% 
      mutate(COL2 = ifelse(COL1=="<b>Link</b>",
                           paste0('<a href="',COL2,'">',COL2,'</a>'),
                           COL2))
    
    df
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
  
  output$wordCloud <- renderWordcloud2({
    pal <- c("#242038","#9B1D20", "#0E34A0", "#561D25")
    
    wordcloud2(data = tdata[["char_freq"]][,c("word","scalefreq")],
               size=0.35,
               shape='circle',
               backgroundColor = '#E1E2B7',
               fontFamily = 'Indie Flower',
               color=rep_len(pal[2:4], nrow(tdata[["char_freq"]]))
    )
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

