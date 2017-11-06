library(tidyverse)

wksDatainit <- read.csv("wksData2_20170813_90plusage.csv",header=FALSE)

value = 21584 #study number number of last completely processed report

wksDatainit$V1 == value #Find at what index the output is true 

wksDataSet1 <- wksDatainit[1:28,1:2] #plug appropriate number in 1st argument

write_csv(wksDataSet1,"wksDataSet1.csv")
