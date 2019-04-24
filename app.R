###Load Helpers
source("helpers.R",local=TRUE)

ui <- argonDashPage(
  title="Hello from the Shiny Tavern!",
  navbar=NULL,
  sidebar=argonDashSidebar(
    brand_logo = "tavernapplogo.png",
    id="tavern-side",
    side="left",
    size="md",
    vertical=TRUE,
    argonSidebarHeader("Main Menu"),
    argonSidebarMenu(
      argonSidebarItem(
        tabName="charInfo",
        icon="users",
        "Character Info"
      )
    )
  ),
  header=NULL,
  body=argonDashBody(
    argonTabItems(
      argonTabItem(
        tabName="charInfo",
        argonRow(
          argonCard(
            title="Select Character",
            width=5,
            pickerInput(inputId="charpick",
                        label=NULL,
                        choices=setNames(as.list(cdata[["charlist"]]$code), cdata[["charlist"]]$name),
                        selected="AN",   
                        options = list(
                          `live-search` = TRUE))
          )
        ),
        argonRow(
          argonCard(
            title = "Character",
            width = 12,
            tableOutput("chartable")
          )
        ),
        argonRow(
          argonCard(
            title = "Episodes", 
            width = 12,
            DTOutput("chareps")
          )
        )
      )
    )
  ),
  footer=NULL
)

server <- function(input, output, session) {
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

