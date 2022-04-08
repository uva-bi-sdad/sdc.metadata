library(rhandsontable)

shinyUI(fluidPage(
  tags$style('#myid * { word-wrap: break-word; color: blue }'),
  titlePanel("Data Commons Metadatas"),
  helpText("Changes to the table will be automatically saved to the source file."),
  # uncomment line below to use action button to commit changes

  tabsetPanel(type = "tabs",
              tabPanel("resolutions",
                       actionButton("saveRes", "Save"),
                       div(id='myid', rHandsontableOutput("hotRes"))
                       ),
              tabPanel("coverages",
                       actionButton("saveCvg", "Save"),
                       div(id='myid', rHandsontableOutput("hotCvg"))
                       ),
              tabPanel("sources",
                       actionButton("saveSrc", "Save"),
                       div(id='myid', rHandsontableOutput("hotSrc"))
                       )
  )

))
