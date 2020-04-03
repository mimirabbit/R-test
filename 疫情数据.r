getwd()
library("readxl")
ill_excel=read_excel("湖北疫情3月14日现有确诊.xlsx",col_names=T);head(ill_excel)
attach(ill_excel)
top5=ill_excel[order(-num),][c(1:5),]
dev.new()
barplot(top5$num~top5$city,main="湖北省最严重五市疫情柱状图",ylim=c(0,10000),ylab = "现有确诊",xlab = "城市",col=rainbow(5))

