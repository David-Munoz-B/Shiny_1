
server <- function(input, output){
  
  DATA_INDEX_RPC_R <- reactive(DATA_INDEX_RPC)
  
  output$pc <- renderParcoords({
    parcoords(DATA_INDEX %>% dplyr::arrange(COD_COMUNA) %>% column_to_rownames('COD_COMUNA'), 
              brushMode = "1D-axes-multi",
              alpha=1, 
              autoresize = T,
              # height=3000,
              color = list(colorBy = "I.PCA",colorScale = "scaleOrdinal")
              , withD3 = TRUE)
  })
  
  output$pc_R <- renderParcoords({
    parcoords(DATA_INDEX_RPC %>% dplyr::arrange(COMUNA) %>% 
                dplyr::filter(NAME_REG==input$INPUT_R) %>% 
                dplyr::select(-NAME_REG,-NAME_PROV) %>% 
                column_to_rownames('COMUNA'), 
              brushMode = "1D-axes-multi",
              alpha=1,
              autoresize = T,
              color = list(colorBy = "I.PCA",colorScale = "scaleOrdinal")
              , withD3 = TRUE)
  })
  
  
  
  output$DATA_INDEX_R <- renderDT(
    datatable(DATA_INDEX_RPC %>% dplyr::arrange(COMUNA) %>% 
                dplyr::filter(NAME_REG==input$INPUT_R2) %>% 
                dplyr::select(-NAME_REG,-NAME_PROV) %>% 
                mutate(COMUNA=as.factor(COMUNA)), rownames = FALSE,
              extensions = 'Buttons',filter = 'top',
              options = list(scrollX = TRUE,pageLength = -1, dom = 'Bfrtip',
                             buttons = c('copy', 'csv', 'excel')
              )) %>% 
      formatRound( c(2:ncol(DATA_INDEX_RPC)), 4)) 
  
  output$DATA_INDEX_CHILE <- renderDT(
    datatable(DATA_INDEX %>% rename(COMUNA=COD_COMUNA) %>% 
                dplyr::arrange(COMUNA) %>% 
                mutate(COMUNA=as.factor(COMUNA)), rownames = FALSE,
              extensions = 'Buttons',filter = 'top',
              options = list(scrollX = TRUE,pageLength = -1, dom = 'Bfrtip',
                             buttons = c('copy', 'csv', 'excel')
              )) %>% 
      formatRound( c(2:ncol(DATA_INDEX_RPC)), 4)) 
  
  # output$mymap <- renderLeaflet({
  #   
  #     leaflet(data = llanos) %>% addTiles() %>% addProviderTiles(providers$OpenStreetMap) %>% 
  #     addPolygons(fill = FALSE, stroke = TRUE, color = "#03F") %>% addLegend("bottomright", colors = "#03F", labels = "Llanos ecoregion")
  #   ,style="height: 700px;"
  #   
  #     
  # })
}
