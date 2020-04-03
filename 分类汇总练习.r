getwd()
library(readr)
library(dplyr)
library(ggplot2)
library(lubridate)
library(magrittr)
dat<-readr::read_csv("UGdata.csv",locale = locale(encoding = "GB2312"))
df=read.csv("UGdata.csv",stringsAsFactors = FALSE)
arrange(df, income)
data1<-df[which((df$income>0)&(df$income<10)), ]   #低收入
data2<-df[which((df$income>10)&(df$income<50)), ]   #中收入
data3<-df[which((df$income>50)&(df$income<200)), ]   #高收入
count(data1)  #计算低收入人数
count(data2)  #计算中收入人数
count(data3)  #计算高收入人数
fag=data.frame(level=c("低收入","中收入","高收入"),frequent=c(10,32,6))
fag     #分组显示人数
dev.new()
ggplot(fag,aes(x=level,y=frequent))+     #画出频数分布图
  geom_bar(stat="identity",width=0.5,fill="green")+
  geom_text(aes(label=frequent,vjust=-0.5,hjust=0.5),show.legend = TRUE)

find1=df[,c("id","name","birth")]
find1
date <- c(df$birth,df$id,df$name) %>% ymd()
begin <- '1990-1-1' ## 筛选的开始时间
end <- '1992-3-7' ## 筛选的结束时间
intva <- interval(begin, end)
find=data.frame(find1$id,find1$name,date) %>% filter(date %within% intva)
find

find1%>%filter(month(find1$birth)==3)   #筛选出3月份的人
#或使用grep函数find2<-grep("*-3",find1$birth,value=T)

