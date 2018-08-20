
#how to import csv from google sheet
#install.packages('gsheet')
library(gsheet)

url='https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907'

denco=as.data.frame(gsheet2tbl(url))
str(denco)
head(denco)

# who is the loyal customer
denco %>% count(custname, sort=TRUE)

denco %>% group_by(custname) %>% summarise(n=n()) %>% arrange(desc(n))

#
dfa3= aggregate(denco$revenue, by=list(denco$partnum), FUN=sum)
head(dfa3)

denco %>% group_by(partnum) %>% summarise(n=n()) %>% arrange(desc(n))

names(denco)

dfa4=aggregate(margin= partnum, data=sales, FUN=sum)




