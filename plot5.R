source("data.R")
library(ggplot2)
temp <- SCC
Sector <- grep("vehicle", SCC$EI.Sector, ignore.case=TRUE, value =TRUE)
keys <- subset(temp, temp$EI.Sector %in% Sector, select="SCC")
Baltimore_City <- subset(NEI, fips == "24510")
Vehicle <- subset(Baltimore_City, Baltimore_City$SCC %in%  keys$SCC)
vEmission <- aggregate(Vehicle[c("Emissions")], list(year = Vehicle$year), sum)

png('plot5.png', width=480, height=480)
p <- ggplot(vEmission, aes(x=year, y=Emissions)) +
  geom_point(alpha=.3) + geom_line(linetype=1) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City")
print(p)
dev.off()