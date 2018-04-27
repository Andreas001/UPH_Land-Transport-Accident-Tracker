#Load the libraries needed in this code
library("dplyr")
library("DT")
library("shiny")
library("leaflet")

#UI-------------------------------------------------------------------------------------------------------------------------------------
shinyUI(navbarPage("Accident tracker", id="nav", collapsible=T,
  tabPanel("Map",
    div(class="outer",

      tags$head(
        includeScript("analytics.js"),
        tags$link(rel = "stylesheet", type = "text/css",
          href = "ion.rangeSlider.skinFlat.css"),
        includeScript("spin.min.js"),
        includeCSS("styles.css")
      ),

      leafletOutput("mymap", width="100%", height="100%"),
      tags$script("
var spinner = new Spinner().spin();
$( 'div#mymap' ).append(spinner.el);"),

      absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
        draggable = TRUE, top = 100, left = "auto", right = 20, bottom = "auto",
        width = 360, height = "auto",

        h2(),
        p(class="intro",
          strong("Accident tracker"), " shows vechicle collisions in",
          "the city of Edinburgh, UK. Data from",
          a("Edinburgh Open Data.",
            href="http://www.edinburghopendata.info/dataset/vehicle-collisions",
            target="_blank")),

        tabsetPanel(
          tabPanel("Controls",

            dateRangeInput('dates',
              label = 'Occurred between:',
              start = as.Date("2010-01-01"), end = as.Date("2013-07-01")),
                   
                   selectInput("color", "Marker:",
              choices=c("None", "Severity")),

            sliderInput("alpha", label="Opacity:",
              min=0, max=1, value=0.4, step=.025, ticks=T),
                   
                   fluidRow(
              column(6,
                sliderInput("base", label="Point size:",
                  min=1, max=5, value=1)
              ),

              column(6,
                selectInput("scale", label="Scale by:", width=120,
                  selected="Vehicles", 
               choices=c("Casualties", "Vehicles"))#)
              )
            ),
                     
            
                   
         
            hr(class="thin"),
            p("Modified by",
              a("Andreas, Thompson, Jerry", href="github.com/Andreas001 or Tom112151",
                target="_blank"),
              HTML("&bull;"), "See the code on ",
              a("github", href="http://github.com/Andreas001/UPH_Land-Transport-Accident-Tracker",
                target="_blank"),
              class="foot")
          ),

          tabPanel("Graphs",
            #p("Static plots"),
            plotOutput("monthTotals", height = "200px"),
            plotOutput("month_waffle", height = "120px"),
            #hr(),
            plotOutput("involving", height = "120px", width="100%"),
            hr(class="thin")
          ),
          tabPanel("About",
            p(class="topp", "Explore vehicle collisions recorded in Edinburgh",
              "between 2010 and 2013 in this interactive data visualisation."
              ),
            p("This is written in ",
              a("Shiny,", href="http://shiny.rstudio.com/", target="_blank"),
              "a web application framework for the R language.",
              "Maps are built with ",
              a("leaflet.js", href="http://leafletjs.com/", target="_blank"),
              "via the",
              a("R language bindings,", href="https://rstudio.github.io/leaflet/",
                target="_blank"),
              "and using map data from",
              a("Open Street Map.", href="http://www.openstreetmap.org/copyright",
                target="_blank")
              ),
            p("Project modified by ",
              a("@Andreas, Thompson, Jerry", href="http://twitter.com/benjaminlmoore",
                target="_blank"),
              HTML("&mdash;"),
              "see the full code on ",
              a("github", href="http://github.com/Andreas001/UPH_Land-Transport-Accident-Tracker",
                target="_blank"),
              "or run locally with:"
            ),
            pre("shiny::runGitHub('Andreas001/UPH_Land-Transport-Accident-Tracker')"),
            hr(class="thin")
          )
          # end about panel
        ),

        tags$script('
  Shiny.addCustomMessageHandler("map_done",
        function(s) {
          spinner.stop();
          $( "div#mymap" ).remove(spinner);
        });')

      ),

      #Control / setting panel
      div(class="mobile-panel",
        p(strong("Blackspot"), " shows vechicle collisions in",
          "the city of Edinburgh, UK. Original & modified by",
          a("github.com/blmmoore", href="/Andreas001 & /Tom112151"),
          "see the code on ",
          a("github.", href="http://github.com/Andreas001/UPH_Land-Accident-Tracker"),
          "Data: ",
          a("Edinburgh Open Data.",
            href="http://www.edinburghopendata.info/dataset/vehicle-collisions")),

        hr(class="thin"),

        radioButtons("color_mob", "Colour by:", inline=T,
          choices=c("None", "Severity", "Casualties", "Time", "Vehicles", "Speed limit"))
      )
    )
  ), tabPanel("Table", DT::dataTableOutput("table"))
)
)
