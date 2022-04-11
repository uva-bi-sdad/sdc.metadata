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
    readr::write_csv(cvg, "dataset_coverage_areas.csv")
    src <- DBI::dbGetQuery(con, "SELECT * FROM dc_metadata.dataset_source_info")
    readr::write_csv(src, "dataset_source_info.csv")
  DBI::dbDisconnect(con)


  observeEvent(input$saveRes, {
    # remove button and isolate to update file automatically
    # after each table change

    fname = "dataset_resolution_types.csv"

    hotRes = isolate(input$hotRes)
    if (!is.null(hotRes)) {
      readr::write_csv(hot_to_r(input$hotRes), fname)

      readr::write_lines(htmlTable(readr::read_csv(fname)), paste0("../../../docs/", fname, ".html"))

      con <- get_db_conn()
      up <- readr::read_csv(fname)
      DBI::dbWriteTable(con, c("dc_metadata", "dataset_resolution_types"), up, overwrite = TRUE, row.names = FALSE)
      DBI::dbSendQuery(con, "ALTER TABLE dc_metadata.dataset_resolution_types OWNER TO data_commons")
      DBI::dbDisconnect(con)

      print(fname)
    }
  })


  observeEvent(input$saveCvg, {
    # remove button and isolate to update file automatically
    # after each table change

    fname = "dataset_coverage_areas.csv"

    hotCvg = isolate(input$hotCvg)
    if (!is.null(hotCvg)) {
      readr::write_csv(hot_to_r(input$hotCvg), fname)

      readr::write_lines(htmlTable(readr::read_csv(fname)), paste0("../../../docs/", fname, ".html"))

      con <- get_db_conn()
      up <- readr::read_csv(fname)
      DBI::dbWriteTable(con, c("dc_metadata", "dataset_coverage_areas"), up, overwrite = TRUE, row.names = FALSE)
      DBI::dbSendQuery(con, "ALTER TABLE dc_metadata.dataset_coverage_areas OWNER TO data_commons")
      DBI::dbDisconnect(con)

      print(fname)
    }
  })


  observeEvent(input$saveSrc, {
    # remove button and isolate to update file automatically
    # after each table change

    fname = "dataset_source_info.csv"

    hotSrc = isolate(input$hotSrc)
    if (!is.null(hotSrc)) {
      readr::write_csv(hot_to_r(input$hotSrc), fname)

      readr::write_lines(htmlTable(readr::read_csv(fname)), paste0("../../../docs/", fname, ".html"))

      con <- get_db_conn()
      up <- readr::read_csv(fname)
      DBI::dbWriteTable(con, c("dc_metadata", "dataset_source_info"), up, overwrite = TRUE, row.names = FALSE)
      DBI::dbSendQuery(con, "ALTER TABLE dc_metadata.dataset_source_info OWNER TO data_commons")
      DBI::dbDisconnect(con)

      print(fname)
    }
  })


  output$hotRes = renderRHandsontable({
    if (!is.null(input$hotRes)) {
      DF = hot_to_r(input$hotRes)
    } else {
      DF = readr::read_csv("dataset_resolution_types.csv")
    }

    rhandsontable(DF) %>%
      hot_table(
        highlightCol = TRUE,
        highlightRow = TRUE,
        rowHeaders = FALSE) %>%
      hot_cols(colWidths = c(100, 200, 550),
               manualColumnResize = TRUE)
  })

  output$hotCvg = renderRHandsontable({
    if (!is.null(input$hotCvg)) {
      DF = hot_to_r(input$hotCvg)
    } else {
      DF = readr::read_csv("dataset_coverage_areas.csv")
    }

    rhandsontable(DF) %>%
      hot_table(
        highlightCol = TRUE,
        highlightRow = TRUE,
        rowHeaders = FALSE) %>%
      hot_cols(colWidths = c(100, 200, 550),
               manualColumnResize = TRUE)
  })

  output$hotSrc = renderRHandsontable({
    if (!is.null(input$hotSrc)) {
      DF = hot_to_r(input$hotSrc)
    } else {
      DF = readr::read_csv("dataset_source_info.csv")
    }

    rhandsontable(DF) %>%
      hot_table(
        highlightCol = TRUE,
        highlightRow = TRUE,
        rowHeaders = FALSE) %>%
      hot_cols(colWidths = c(100, 300, 300, 500),
               manualColumnResize = TRUE)
  })
})
