library(tidyverse, stringr)

ageplus <- as.character(90:115)
agetest <- "\\[\\*\\*Age over 90\\ \\*\\*\\]"

wksData <- read.csv("wksData1_20170813_datmod.csv", header = FALSE)
wksText <- as.character(wksData$V2)

wkstextmod <- NULL

for (i in 1:length(wksText)) {
  wkstext1 <- wksText[i]
  wkstext1 <- str_replace_all(wkstext1, agetest, sample(ageplus, 1))
  wkstextmod <- append(wkstextmod, wkstext1)
}

wksData$V2 <- as.character(wkstextmod)
wksData <- as.data.frame(wksData)
write_csv(wksData, "wksData2_20170813_90plusage.csv")

age <- as.character(c(1:89, ageplus))
ageDict <- data.frame(age)
ageDict <- t(ageDict)
write_csv(data.frame(ageDict), "ageDict.csv")
