source("data.R")

Baltimore_City <- subset(NEI, fips == "24510")
aggEmission <- aggregate(Emissions ~ year, Baltimore_City, sum)

png('plot2.png', width=480, height=480)
plot(aggEmission$year, aggEmission$Emissions,type = "l", xlab = "Year", ylab = "Emissions", main = "Total Emissions from PM2.5 in Baltimore City")
dev.off()