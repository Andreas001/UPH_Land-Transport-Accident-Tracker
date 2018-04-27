# blackspot
[![docker automated](https://img.shields.io/docker/automated/blmoore/blackspot.svg)](https://hub.docker.com/r/blmoore/blackspot/)

Shiny app exploring Edinburgh traffic collision data. View from R with: 

```r
shiny::runGitHub("blmoore/blackspot")
```

Or use docker (view at http://localhost:3838):

```
docker run -dp 3838:3838 blmoore/blackspot
```

Note `analytics.js` contains my Google analytics tracking code, you'll want to comment this out (i.e. `includeScript("analytics.js")` in `ui.R`) or swap in your own code if you're deploying this app!

