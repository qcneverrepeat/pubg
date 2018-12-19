---
title: "PUBG analysis"
output: pubg
---

```{r}
# import raw data and sampling

library(data.table)
data1 <- fread("E:\\DS\\pubg\\aggregate\\agg_match_stats_1.csv")
data1 <- data1[sample(1:length(data1$date),size = 100000,replace = F),]
data2 <- fread("E:\\DS\\pubg\\deaths\\kill_match_stats_final_1.csv")
data2 <- data2[sample(1:length(data2$killed_by),size = 100000,replace = F),]

# data1 : meta information about the match (rank/damage/...), each observation matches a player
# data2 : death information about fighting (gun/death/location/...), each observation matched a player
# the raw data is too large (about 10^7 obs), take a random sample (10^5 obs)

```

data1 : 每场游戏每个玩家对应一个观测
data2 : 每场游戏每次死亡对应一个观测

```{r}
# preprocessing

data1 <- na.omit(data1)
data2 <- na.omit(data2)

data2 <- data2[-which(data2$map==''),]

data1 <- data1[,-4]

```

```{r}

match_id <- data.frame(table(data1$match_id))
id1 <- data.frame(table(data1$player_name))
length(match_id$Var1)
length(id1$Var1)

match_id2 <- data.frame(table(data2$match_id))
id_victim <- data.frame(table(data2$victim_name))
length(match_id2$Var1)
length(id_victim$Var1)
# data1 (100,000 obs) contains 72,801 matches for 96,640 players
# data2 (90,197 obs) contains 67,392 matches for 87,047 victims

```

```{r}
# time sequency

data1$day <- as.Date(substr(data1$date,1,10))
data1$time <- substr(data1$date,12,19)
data1 <- data1[,-1]

```

```{r}

miramar <- data2[map == 'MIRAMAR']
erangel <- data2[map == 'ERANGEL']

# data2 contains 74,031 ERANGEL death records and 16,148 MIRAMAR death records
```

```{r}
lastkill <- data2[killer_placement==1 & victim_placement==2]

```

```{r}
data1$day <- substr(data1$date,1,10)
data1$time <- substr(data1$date,12,19)
data1$daytime <- paste(data1$day, data1$time, sep = ' ')
data1$daytime1 <- as.POSIXct(strptime(data1$daytime, format = '%Y-%m-%d %T'))
data1$day <- as.Date(data1$day)
# transfer character to POSIXct/POSIXt format

day <- data.frame(table(data1$day))

library(ggplot2)
library(scales)
day$day <- factor(day$Var1)
p1 <- ggplot(data = day, aes(x = dayindate, y = Freq, group = 1))
p1 + geom_line(linetype="dotted") + labs(title = '', x = 'Date',y = 'Game Heat') + scale_x_date(breaks = date_breaks("15 days")) + geom_point()
```
```{r}
# 周期性分解 ?
day_ts <- ts(day$Freq)
plot(day_ts)

library(TTR)
smo1 <- SMA(day_ts, n=7)
som2 <- data.frame(smo1)
som2 <- cbind(som2,date$Var1)
colnames(som2) <- c('freq','date')
som2$date <- as.Date(som2$date)
p1 <- ggplot(data = som2, aes(x = date, y = freq))
p1 + geom_line(linetype="dotted") + labs(title = '', x = 'Date',y = 'Game Heat') + scale_x_date(breaks = date_breaks("15 days")) + geom_point()

date$weekday <- weekdays(as.Date(date$Var1))
week <- data.frame(table(date$weekday))

sum <- data.frame(tapply(date$Freq, INDEX = as.factor(date$weekday), FUN = sum, simplify = TRUE))
sum$weekday <- rownames(sum)
colnames(sum) <- c('freq','weekday')
colnames(week) <- c('weekday','freq')
week <- merge(sum, week,by.x = 'weekday',by.y = 'Var1')
week$aver <- week$freq/week$Freq
week <- week[c(7,1,4,5,6,2,3),]
rownames(week) <- 1:7
week$weekday <- factor(week$weekday,ordered = T, levels = c("星期一", "星期二" ,"星期三", "星期四", "星期五", "星期六", "星期日"))
ggplot(data = week, aes(x=weekday, y=aver,group=1)) + geom_line(linetype="dotted")+ geom_point()+labs(title = '', x = '',y = 'Game Heat')
```


```{r}
# death points heatmap
ggplot(data = data2, aes(x=time)) + geom_density(colour='grey',fill='grey') + labs(x = 'Death time[s]', y = 'Probility')
range(data2$time)
```

```{r}
# try 2 maps
ggplot(data = erangel, aes(x=time)) + geom_density(colour='grey',fill='grey') + labs(title='ERANGEL',x = 'Death time[s]', y = 'Probility')
range(erangel$time)

ggplot(data = miramar, aes(x=time)) + geom_density(colour='grey',fill='grey') + labs(title='MIRAMAR',x = 'Death time[s]', y = 'Probility')
range(miramar$time)

# 129s 113s max
```

```{r}
# choose 60s since first death
# erangel 65-125s
# miramar 62-122s

era_landing <- erangel[which(erangel$time<=125),]
mir_landing <- miramar[which(miramar$time<=122),]

write.csv(era_landing, 'era_landing.csv')
write.csv(mir_landing, 'mir_landing.csv')
```

```{r}
write.csv(bigera, 'era.csv')
write.csv(bigmir, 'mir.csv')
```

```{r}
library(data.table)
data2 <- fread("E:\\DS\\pubg\\deaths\\kill_match_stats_final_1.csv")
data2 <- data2[sample(1:length(data2$killed_by),size = 10000000,replace = F),]
```

```{r}
weapoon <- data.frame(table(data2$killed_by))
weapoon$fre <- weapoon$Freq/sum(weapoon$Freq)
weapoon <- weapoon[order(weapoon$Freq, decreasing = T),]
rownames(weapoon) <- 1:57
gun <- weapoon[-c(1,7,10,16,20,21,23,24,34,35,37,39,40,41,43,44,45,47,48,49,50:57),]
rownames(gun) <- 1:29


```


```{r}
# delete the 0 placement from data2
data3 <- data2[which(data2$victim_position_x!=0&data2$victim_position_y!=0&data2$killer_position_x!=0&data2$killer_position_y!=0),]
data3$distance <- ((data3$killer_position_x-data3$victim_position_x)^2 + (data3$victim_position_y-data3$killer_position_y)^2)^0.5

data4 <- subset(data3, data3$killed_by %in% c('AKM','M416','SCAR-L','Kar98k','Mini 14','SKS','M164A','UMP9','S1897','S686','S12K','Micro UZI','Tommy Gun','M24','AWM'))

# guntype
for (i in 1:length(data4$killed_by)){
if (data4$killed_by[i] %in% c('AKM','M416','SCAR-L','M164A')){
  data4$guntype[i] <- '步枪'
  }

else if (data4$killed_by[i] %in% c('S1897','S686','S12K')){
  data4$guntype[i] <- '霰弹枪'
  }

else if (data4$killed_by[i] %in% c('Kar98k','M24','AWM')){
  data4$guntype[i] <- '栓狙'
}
  
else if (data4$killed_by[i] %in% c('Mini 14','SKS')){
  data4$guntype[i] <- '连狙'
}
  
else{
  data4$guntype[i] <- '冲锋枪'
  }
}

library(ggplot2)
library(ggthemes)

ggplot(data = data4, aes(killed_by, distance,fill = guntype)) + geom_boxplot() + scale_y_discrete(limits=c(0,50000))
ggplot(data = data4, aes(guntype, distance,fill = killed_by)) + geom_boxplot()

data5 <- subset(data4, data4$killed_by %in% c('AKM','M416','SCAR-L','M164A','S1897','S686','S12K','Micro UZI','Tommy Gun','UMP9'))
ggplot(data = data5, aes(x=distance, colour=guntype)) + geom_density() + scale_x_continuous(limits = c(0,10000))+labs(x='distance [cm]')
ggplot(data = data5, aes(x=distance, colour=guntype)) + geom_density() + scale_x_continuous(limits = c(0,50000))+labs(x='distance [cm]')
```

```{r}
# seperate data4
data4_as <- data4[which(data4$guntype=='步枪'),]
data4_sub <- data4[which(data4$guntype=='冲锋枪'),]
data4_snip1 <- data4[which(data4$guntype=='栓狙'),]
data4_snip2 <- data4[which(data4$guntype=='连狙'),]
data4_shot <- data4[which(data4$guntype=='霰弹枪'),]

```

```{r}
# survive analysis
library(magrittr)
library(dplyr)
library(survival)
library(tidyverse)
library(survminer)

surv <- Surv(time=data1$player_survive_time)
fit1 <- survfit(surv ~ party_size, data = data1)
ggsurvplot(fit1, data = data1, xlab="Playing time [s]", surv.median.line="hv",
           legend.labs=c("单人","双人","四人"), ggtheme = theme_light())
mutate(data1$drive <- ifelse(data1$player_dist_ride>0, 1, 0))
fit2 <- survfit(surv ~ drive, data = data1)
ggsurvplot(fit2, data = data1, xlab="Playing time [s]", surv.median.line="hv",
           legend.labs=c("无驾驶","有驾驶"), ggtheme = theme_light())
```

```{r}
# linear
data1$team_per_rank <- data1$team_placement / data1$game_size
fit3 <- lm(data = data1, team_per_rank ~ player_assists + player_dbno + player_dist_ride + player_dist_walk + 
             player_dmg + player_kills + player_survive_time)
summary(fit3)
library(car)
vif(fit3)

fit4 <- lm(data = data1, team_per_rank ~ player_dbno + player_dist_ride + player_dist_walk + 
             player_dmg + player_kills + player_survive_time)
summary(fit4)
vif(fit4)
```
```{r}
# Logit
mutate(data1$chicken <- ifelse(data1$team_placement==1, 1, 0))

nochicken <- data1[chicken==0]
nochickensample <- nochicken[sample(1:length(nochicken$game_size),size = 2855,replace = F),]
dataforlogit <- rbind(nochickensample, data1[chicken==1])

fit5 <- glm(data = dataforlogit, chicken ~ player_assists + player_dbno + player_dist_ride + player_dist_walk + player_dmg + player_kills + player_survive_time, family = binomial(link = logit))
summary(fit5)
vif(fit5)

fit6 <- glm(data = dataforlogit, chicken ~ player_assists + player_dist_ride + player_dist_walk + player_dmg + player_kills + player_survive_time, family = binomial(link = logit))
summary(fit6)
vif(fit6)
```







