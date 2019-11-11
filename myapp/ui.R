ui <- dashboardPage(skin = "red",
                    dashboardHeader(title = "ICHEM"),
                    dashboardSidebar(
                      sidebarMenu(
                        br(),
                        br(),
                        br(),
                        
                        # menuItem("MAX & MIN", tabName = "M_MAXMIN"),
                        # menuItem("RADAR", tabName = "M_RADAR"),
                        hr(),
                        "POR REGIÓN",br(),
                        menuItem("ÍNDICE", tabName = "M_INDEX_R"),
                        menuItem("DATOS", tabName = "M_DATA_R"),
                        hr(),
                        "TODO CHILE",br(),
                        menuItem("ÍNDICE", tabName = "M_INDEX_CHILE"),
                        menuItem("DATOS", tabName = "M_DATA_CHILE"),
                        hr()
                      )
                    ),
                    dashboardBody(
                      # leafletOutput("mymap")
                      tabItems(
                        tabItem(tabName="M_INDEX_R", selectInput("INPUT_R", "Seleccione una región:", choices=unique(DATA_INDEX_RPC$NAME_REG)), parcoordsOutput("pc_R",height=700),style="height: 700px"),
                        tabItem(tabName="M_DATA_R",selectInput("INPUT_R2", "Seleccione una región:", choices=unique(DATA_INDEX_RPC$NAME_REG)),DTOutput('DATA_INDEX_R')),
                        tabItem(tabName="M_INDEX_CHILE",  parcoordsOutput("pc",height=4000),style="height: 4000px;"),
                        tabItem(tabName="M_DATA_CHILE",DTOutput('DATA_INDEX_CHILE') )
                        
                      )
                    )
)
