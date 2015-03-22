source("data.R")
library(ggplot2)
Baltimore_City <- subset(NEI, fips == "24510")
aggEmission <- aggregate(Baltimore_City[c("Emissions")], list(type = Baltimore_City$type, year = Baltimore_City$year), sum)

png('plot3.png', width=480, height=480)
p <- ggplot(aggEmission, aes(x=year, y=Emissions, colour=type)) +
  geom_point(alpha=.3) + geom_line(linetype=1) +
  ggtitle("Total Emissions by Type in Baltimore City")

print(p)

dev.off()