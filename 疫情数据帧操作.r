getwd()
rm(list = ls())
load("covid19.RData")
data<-y$global
sumconfirm=subset(data,time=="2020-03-25")
sum(sumconfirm[,"cum_confirm"])
sum(sumconfirm[,"cum_dead"])
#计算3月25日全球累计的确诊数和病死人数

dat100=subset(data,cum_confirm>100)
dat100
#在全球数据集中筛选出确诊数超过100例的记录，赋值给新变量dat100

top=sumconfirm[order(-sumconfirm$cum_confirm),]
top
x=c(1,2,3,4,5,6)
y=c(69176,47610,35353,22633,10456,8167)
maxy=max(y) 
dev.new()
plot(x,y,type="o",xlab="国家",ylab="确诊数",xaxt="n",ylim=c(0,maxy),col="red",main="3月25日确诊数前10个国家中欧洲国家的确诊数的趋势图")
axis(side = 1,at=c(1,2,3,4,5,6),labels = c("Italy","Spain","Germany","France","Switzerland","United Kingdom"))
#画出确诊数前10个国家中欧洲国家的确诊数的趋势图

library(dplyr)
require(dplyr)
day=subset(dat100,cum_confirm>100&country!="China")%>%group_by(country)%>%mutate(days=as.numeric(time-min(time)))
day
View(day)
#在dat100中增加一个变量计算超100例后的天数

day$deadrate=day$cum_dead/day$cum_confirm
x=day$days
y=day$deadrate
dev.new()
plot(x,y,type="o",xlab="日期",ylab="病死率",xlim=c(0,35),ylim=c(0,0.3),col="red",main="确诊数前10个国家中欧洲国家的病死率的趋势图")
#画出确诊数前10个国家中欧洲国家的病死率的趋势图,以超100例后天数为x轴,并没有找出确诊数前十的国家