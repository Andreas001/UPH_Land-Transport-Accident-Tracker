# UPH_Land-Transport-Accident-Tracker

# Final project

#

Acknowledgement : 

Forked from -> https://github.com/blmoore/blackspot

#

Associates:

github.com/Tom112151

github.com/Andreas001

#

Description:

The shiny app main features are tracking and showing where land transport related accidents happened in the city Edinburgh using black dots that gets larger depending on the scale of the accident. It also features a control panel / setting panel that can be used to plot the accidents by date, change the opacity (intensity of the dot color), show graphs, and also showing what the app is about. The app also features another tab where the data used for the plotting can be viewed, sort by severity/date/day/etc, and a search function.

#

What we changed:

Instead of the option to change the color by the speed limit of the area in which the accidents happened we changed it so that it changes colour depending on the severity of the accident wether its just a slight accident or fatal. The control panel before couldnt be moved so it became a problem because the map overlays the control panel so we set the control panel to drag able. We also changed the graph to show incidents per year.



# Instructions

Before the app will be available to use a couple of thing will be needed to install


These are the list of what will be needed to be able to run the app

Simply copy and paste these in the R console:

- install.packages("shiny")

- install.packages("leaflet")

- install.packages("dplyr")

- install.packages("DT")

- install.packages("ggplot2")

- install.packages("htmltools")

#

After that is done copy and paste this into the console

shiny::runGitHub("Andreas001/UPH_Land-Transport-Accident-Tracker")

#

#Further details

What we used and on what, also includes pictures


- Plotting accident on map (using leaflet)

![plotting](https://raw.githubusercontent.com/Tom112151/blackspot/master/www/img/blak1.JPG)

- Plot size according to vehicles involved (using ggplot)

- Fill data on table (using DT)

![table](https://raw.githubusercontent.com/Tom112151/blackspot/master/blak3.JPG)

- About panel (using shiny)

![about](https://raw.githubusercontent.com/Tom112151/blackspot/master/blak2.JPG)

What we added: - Marker plot (colorized plot based on accident severity)

![Marker](https://raw.githubusercontent.com/Tom112151/blackspot/master/blak5.JPG)


- Sliders (Plot opacity and size)

![Marker](https://raw.githubusercontent.com/Tom112151/blackspot/master/blak4.JPG)

- Graph of accidents per year 

![Marker](https://raw.githubusercontent.com/Tom112151/blackspot/master/blak6.JPG)
