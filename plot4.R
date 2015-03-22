source("data.R")
library(ggplot2)
temp <- SCC
Sector <- grep("coal", SCC$EI.Sector, ignore.case=TRUE, value =TRUE)
keys <- subset(temp, temp$EI.Sector %in% Sector, select="SCC")
coal_combustion <- subset(NEI, NEI$SCC %in%  keys$SCC)
ccEmission <- aggregate(coal_combustion[c("Emissions")], list(year = coal_combustion$year), sum)

png('plot4.png', width=480, height=480)
p <- ggplot(ccEmission, aes(x=year, y=Emissions)) +
  geom_point(alpha=.3) + geom_line(linetype=1) +
  ggtitle("Emissions of PM2.5 from coal combustion-related sources in US")
print(p)
dev.off()