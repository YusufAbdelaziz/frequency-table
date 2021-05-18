number_of_classes <- readline(prompt = "Enter number of classes: ")
class_width <- ceiling((max(oscars$year_ceremony) - (min(oscars$year_ceremony))) / strtoi(number_of_classes))
oscars <- read_excel("oscars.xlsx")

year_ceremony <- cut(oscars$year_ceremony,
  unique(c(seq(min(oscars$year_ceremony),
    max(oscars$year_ceremony) + 1,
    by = class_width
  ), max(oscars$year_ceremony))),
  dig.lab = 5, ordered_result = TRUE, include.lowest = TRUE,
)

library(gmodels)
CrossTable(year_ceremony, oscars$gender,
  digits = 2, prop.t = TRUE, prop.r = TRUE,
  prop.c = TRUE, format = "SPSS", dnn = c("Cermony Year", "Gender")
)
