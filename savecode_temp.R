###Date Text
  #UI
htmlOutput("dateText")

  #Server
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

###Word Cloud
  #UI
wc_tab <- bs4TabItem(
  tabName = "wordCloud",
  fluidRow(
    bs4Box(
      width = 12,
      wordcloud2Output("wordCloud", width = "100%", height = "600px")
    )
  )
)

  #Server
output$wordCloud <- renderWordcloud2({
  wordcloud2(data = tdata[["char_freq"]][,c("word","scalefreq")],
             size=0.35,
             shape='circle')
})

###Char Name
  #UI
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

  #Server
output$charname <- renderText({
  as.character(cdata[[input$charpick]][cdata[[input$charpick]]$COL1=="Name","COL2"])
})

###Char Table
  #UI

  #Server
output$chartable <- renderTable({
  cdata[[input$charpick]]
},
colnames=FALSE,
sanitize.text.function = function(x) x)

###Char Episodes
  #UI

  #Server
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