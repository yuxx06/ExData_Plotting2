source("data.R")
library(ggplot2)
temp <- SCC
Sector <- grep("vehicle", SCC$EI.Sector, ignore.case=TRUE, value =TRUE)
keys <- subset(temp, temp$EI.Sector %in% Sector, select="SCC")
Baltimore_LA <- subset(NEI, fips == "24510"|fips == "06037")
Vehicle <- subset(Baltimore_LA, Baltimore_LA$SCC %in%  keys$SCC)
vEmission <- aggregate(Vehicle[c("Emissions")], list(fips = Vehicle$fips, year = Vehicle$year), sum)


png('plot6.png', width=480, height=480)
p <- ggplot(vEmission, aes(x=year, y=Emissions, color=fips)) +
  geom_point(alpha=.3) + geom_line(linetype=1) +
  ggtitle("Vehicle Emissions in Baltimore vs. LA") +
  scale_color_discrete(name="Cities", breaks=c("06037", "24510"),labels=c("LA", "Baltimore"))

print(p)
dev.off()
