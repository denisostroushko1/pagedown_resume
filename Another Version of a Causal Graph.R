
# https://currentprotocols.onlinelibrary.wiley.com/doi/full/10.1002/cpz1.45
# https://cran.r-project.org/web/packages/ggdag/vignettes/intro-to-ggdag.html

library(dagitty)
library(ggdag)
library(tidyverse)

model <- dagitty( 'dag {
bb="-4.6,-3.8,3.7,3.7"
Age [pos="-2,-2.6"]
Education [pos="1.4,0.5"]
HoursPerWeek [pos="-0.6,-0.1"]
Immigrant [pos="1.1,-2.6"]
Income [pos="-1.6,2.7"]
MaritalStatus [pos="-3.7,-2.6"]
Race [pos="3.0,-2.5"]
Sex [pos="-0.5,-2.6"]
Age -> { Education HoursPerWeek Income MaritalStatus }
Education -> Income
HoursPerWeek -> Income
Immigrant -> { Education HoursPerWeek }
Immigrant <-> Race
MaritalStatus -> Income
Race -> Education
Sex -> { Education HoursPerWeek }
}' )

par(bg = "#A2E4B8")

ggdag(model, layout = "circle") + 
  theme_void() + 
  theme(
    text = element_text(color = "black")
  )


