library(rhandsontable)
library(htmlTable)

get_db_conn <-
  function(db_name = Sys.getenv("db_nam"),
           db_host = Sys.getenv("db_hst"),
           db_port = Sys.getenv("db_prt"),
           db_user = Sys.getenv("db_usr"),
           db_pass = Sys.getenv("db_pwd")) {
    RPostgreSQL::dbConnect(
      drv = RPostgreSQL::PostgreSQL(),
      dbname = db_name,
      host = db_host,
      port = db_port,
      user = db_user,
      password = db_pass
    )
  }


shinyServer(function(input, output, session) {
  con <- get_db_conn()
    res <- DBI::dbGetQuery(con, "SELECT * FROM dc_metadata.dataset_resolution_types")
    readr::write_csv(res, "dataset_resolution_types.csv")
    cvg <- DBI::dbGetQuery(con, "SELECT * FROM dc_metadata.dataset_coverage_areas")
    readr::write_csv(res, "dataset_coverage_areas.csv")
    src <- DBI::dbGetQuery(con, "SELECT * FROM dc_metadata.dataset_source_info")
    readr::write_csv(res, "dataset_source_info.csv")
  DBI::dbDisconnect(con)

  fname = "dataset_resolution_types.csv"

  observe({
    # remove button and isolate to update file automatically
    # after each table change
    input$saveBtn
    hot = isolate(input$hot)
    if (!is.null(hot)) {
      readr::write_csv(hot_to_r(input$hot), fname)

      readr::write_lines(htmlTable(readr::read_csv(fname)), paste0("docs/", fname, ".html"))

      con <- get_db_conn()
      up <- readr::read_csv(fname)
      DBI::dbWriteTable(con, c("dc_metadata", "dataset_resolution_types"), up, overwrite = TRUE, row.names = FALSE)
      DBI::dbDisconnect(con)

      print(fname)
    }
  })

  output$hot = renderRHandsontable({
    if (!is.null(input$hot)) {
      DF = hot_to_r(input$hot)
    } else {
      DF = readr::read_csv("dataset_resolution_types.csv")
    }

    rhandsontable(DF) %>%
      hot_table(
        highlightCol = TRUE,
        highlightRow = TRUE,
        rowHeaders = FALSE) %>%
      hot_cols(colWidths = c(50, 200, 550),
               manualColumnResize = TRUE)
  })
})
