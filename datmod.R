library(tidyverse, stringr)

dates <- "\\[\\*\\*[0-9\\-]+\\*\\*\\]"

dtyr <- 2001:2012 %>%
  sprintf("%s-", .) %>%
  c("", .)

dtmt <- 1:12 %>%
  sprintf("%s-", .)

dtdt <- 1:28

dt.combo <- NULL

for (y in 1:length(dtyr)) {
  for (m in 1:length(dtmt)) {
    for (d in 1:length(dtdt)) {
      dt.combo <- append(dt.combo, sprintf("%s%s%s", dtyr[y], dtmt[m], dtdt[d]))
    }
  }
}

for (i in 1:length(wksText)) {
  c <- 0
  wkstext1 <- wksText[i]
  
  dtcount <- str_count(wkstext1, dates)
  
  while (c <= dtcount){
    wkstext1 <- str_replace(wkstext1, dates, sample(dt.combo, 1))
    c <- c+1
  }
  
  wkstextmod <- append(wkstextmod, wkstext1)
}
wksData$V2 <- as.character(wkstextmod)
wksData <- as.data.frame(wksData)
write_csv(wksData, "wksData1_20170813_datmod.csv")

dt.comboDict <- data.frame(dt.combo)
dt.comboDict <- t(dt.comboDict)
write_csv(data.frame(dt.comboDict), "dt.comboDict.csv")
