
# Random 5000 radiology reports selected and cleaned from MIMIC III database using stuff
#  LinguiRadR project...

library(tidyverse)
library(stringr)
library(tidytext)

xrseData <- read_csv("xrseData.csv") %>%
  data.frame(stringsAsFactors = FALSE)

headers <- "\\n*\\[*[[:print:][:blank:]]+\\n*[[:print:][:blank:]]+# \\[\\*\\*[[:print:][:blank:]]+\\*\\*\\]\\n"
subheadings <- "\\n*[:blank:]+([A-Z]{1}[[:blank:][A-Za-z\\(\\)\\,]]+\\:)|FINAL REPORT  \\(REVISED\\)|FINAL REPORT|FINAL ADDENDUM|PFI REPORT"
cpt <- "\\*{30,} CPT Codes \\*{30,}[[:print:][:space:]]+\\*{50,}"
boundlines <- "_{30,}"
phi <- "\\[\\*\\*[^\\*\\]]+\\*\\*\\]"
overcont <- "\\(Over\\)(.|\n)*?\\(Cont\\)"

xrseData[,1] <- xrseData[,1] %>%
  str_replace_all(headers, "\n") %>%
  # str_replace_all(subheadings, "") %>%
  str_replace_all(phi, "") %>%
  str_replace_all(cpt, "") %>%
  str_replace_all(overcont, "") %>%
  str_replace_all(boundlines, "") %>%
  str_replace_all("\n", " ")

# NO need to segment... too much fuss for not much in return for the
# poster project... May be later if time allows.

xrseData[1,1]

# Remember, the goal is not to search through the text... Need to make 
# computers understand the heirarchy/relatedness of concepts in the reports
# to enable more complex searching. E.g.: Lung pathology -> reports with all
# mentions of lung pathologies.


