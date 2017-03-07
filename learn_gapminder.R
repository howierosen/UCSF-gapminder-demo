# read in a tab separated data file using read.table
# run it within head so you can see the first 6 rows of the output

head (read.table(file = "output/combined_gapMinder.tsv", header = TRUE, sep = "\t"))


# do the same thing but save it to an object

gapM <- read.table(file = "output/combined_gapMinder.tsv", header = TRUE, sep = "\t")

# plot all the variables in the file against each other

plot(gapM)

# plot population versus life expectancy

plot(x=gapM$pop, y=gapM$lifeExp, xlab="population", ylab="life expectancy", main="Gapminder" )

# to plot a portion of the data, first subset it. gapM$pop >= 100,000,000
# you are using square brackets to refer to the "location" you want
# so what you are saying below is to look at all rows where population
# is greater than 100M and save all the columns of data to the new object

gapM_large_pop <- gapM[gapM$pop >= 100000000, ]

#plot subsetted data

plot(x=gapM_large_pop$pop, y=gapM_large_pop$lifeExp, xlab="population", ylab="life expectancy", main="Gapminder" )

# group data based on (or by) a categorical variable of interest
# the dot (.) means all columns, the ~ means "by", and you're asking for hte mean

agg_gap_country <- aggregate(.~country, data=gapM, FUN=mean)

# do same for population only

agg_gap_country <- aggregate(pop~country, data=gapM, FUN=mean)

# do same for two variables: population and life expectancy, need to use cbind
# so you can do the operation on 2 variables

agg_gap_country <- aggregate(cbind(pop,lifeExp)~country, data=gapM, FUN=mean)

# aggregate a variable of interest by two different variables, so you can divide your
#data up even more

agg_gap_continet_year <- aggregate(pop~continent +year, data=gapM, FUN=mean)
plot(agg_gap_continet_year$year,agg_gap_continet_year$pop)

#####################################################
# This is where I am starting the final exam project
#####################################################

# supposed to choose 3 countries, will get a list of all of them
levels(gapM$country)

# need to pick countries to view. Will Canada, United States and Mexico
# here I'm doing it one at a time using subset, and then combining the data

canada <- subset(gapM, (gapM$country=="Canada"))
unitstates <- subset(gapM, (gapM$country=="United States"))
mexico <- subset(gapM, (gapM$country=="Mexico"))
threeCountries <- rbind(canada, unitstates, mexico)

# here I'm doing it to grab all the rows I want and saving it
allthree <- subset(gapM, gapM$country=="Canada" | gapM$country=="United States" | gapM$country=="Mexico")

# plot year vs. GDP for each country, GDP is going up by year for each country

plot(x=canada$year, y=canada$gdpPercap, xlab="year", ylab="GDP", main="GDP by Year, Canada" )
plot(x=unitstates$year, y=unitstates$gdpPercap, xlab="year", ylab="GDP", main="GDP by Year, United States" )
plot(x=mexico$year, y=mexico$gdpPercap, xlab="year", ylab="GDP", main="GDP by Year, Mexico" )

# need to calculate summary statistics for each continent in the whole dataset
# create a single file with all the stats in one file
# rename the columns in the file

agg_gap_continent_mean <- aggregate(lifeExp~continent, data=gapM, FUN=mean)
agg_gap_continent_min <- aggregate(lifeExp~continent, data=gapM, FUN=min)
agg_gap_continent_max <- aggregate(lifeExp~continent, data=gapM, FUN=max)
summ_continents <- cbind(agg_gap_continent_mean, agg_gap_continent_min[ ,2], agg_gap_continent_max[ , 2])
colnames(summ_continents) <- c("continent", "mean", "min", "max")

# need to make a histogram of global life expectancies, and remake using smaller bins
hist(gapM$lifeExp)
hist(gapM$lifeExp, breaks = 50)






