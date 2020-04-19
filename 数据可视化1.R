getwd()
library(dplyr)
library(ggplot2)
load("dat_country.RData")
new=subset(dat,cum_confirm>"0"&time=="2020-04-08")
new
summary(new)  #有疫情的国家地区数
a=sum(new[,"cum_confirm"]);a  #总确诊
b=sum(new[,"cum_dead"]);b    #总死亡
c=sum(new[,"cum_heal"]);c   #总康复
rate1=b/a*100;rate1            
paste(rate1, "%", sep='')   #病死率
rate2=c/a*100;rate2
paste(rate2, "%", sep='')   #康复率

link=merge(dat,country_df,by="country",all=FALSE)  #country_df与疫情数据表dat内连接
link
link1=link[!duplicated(link[,c(1)]),]
link1
continent1=subset(link1,continent=="Asia")  #亚洲有疫情国家个数
count1=nrow(continent1) ;count1
continent2=subset(link1,continent=="Europe") #欧洲有疫情国家个数
count2=nrow(continent2) ;count2
continent3=subset(link1,continent=="Africa")  #非洲有疫情国家个数
count3=nrow(continent3) ;count3
continent4=subset(link1,continent=="Americas")  #美洲有疫情国家个数
count4=nrow(continent4) ;count4
continent5=subset(link1,continent=="Oceania")  #大洋洲有疫情国家个数
count5=nrow(continent5) ;count5
dev.new()
math <- c(43, 49, 53, 49, 8)
continents<-c("亚洲", "欧洲", "非洲", "美洲", "大洋洲")
x<-barplot(math,names.arg=continents,main="各洲有疫情国家个数",xlab="洲名",ylab="国家个数")
lbls<-paste(" ",math)
text(x,math,labels=lbls,cex=1,pos=1)