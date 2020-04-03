getwd()
library(readr)
library(dplyr)
library(ggplot2)
library(lubridate)
library(magrittr)
dat<-readr::read_csv("UGdata.csv",locale = locale(encoding = "GB2312"))
df=read.csv("UGdata.csv",stringsAsFactors = FALSE)
arrange(df, income)
data1<-df[which((df$income>0)&(df$income<10)), ]   #������
data2<-df[which((df$income>10)&(df$income<50)), ]   #������
data3<-df[which((df$income>50)&(df$income<200)), ]   #������
count(data1)  #�������������
count(data2)  #��������������
count(data3)  #�������������
fag=data.frame(level=c("������","������","������"),frequent=c(10,32,6))
fag     #������ʾ����
dev.new()
ggplot(fag,aes(x=level,y=frequent))+     #����Ƶ���ֲ�ͼ
  geom_bar(stat="identity",width=0.5,fill="green")+
  geom_text(aes(label=frequent,vjust=-0.5,hjust=0.5),show.legend = TRUE)

find1=df[,c("id","name","birth")]
find1
date <- c(df$birth,df$id,df$name) %>% ymd()
begin <- '1990-1-1' ## ɸѡ�Ŀ�ʼʱ��
end <- '1992-3-7' ## ɸѡ�Ľ���ʱ��
intva <- interval(begin, end)
find=data.frame(find1$id,find1$name,date) %>% filter(date %within% intva)
find

find1%>%filter(month(find1$birth)==3)   #ɸѡ��3�·ݵ���
#��ʹ��grep����find2<-grep("*-3",find1$birth,value=T)

