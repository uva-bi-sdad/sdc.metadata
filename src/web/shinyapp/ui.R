library(rhandsontable)

shinyUI(fluidPage(
  tags$style('#myid * { word-wrap: break-word; color: blue }'),
  titlePanel("Data Commons Metadatas"),
  helpText("Changes to the table will be automatically saved to the source file."),
  # uncomment line below to use action button to commit changes

  actionButton("saveBtn", "Save"),
  tabsetPanel(type = "tabs",
              tabPanel("resolutions",
                       div(id='myid', rHandsontableOutput("hot"))

                       ),
              tabPanel("coverages",


                       ),
              tabPanel("sources",


                       )
  )

))
