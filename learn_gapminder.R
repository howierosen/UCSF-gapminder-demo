# read in a tab separated data file using read.table
# run it within head so you can see the first 6 rows of the output

head (read.table(file = "output/combined_gapMinder.tsv", header = TRUE, sep = "\t"))


# do the same thing but save it to an object

gapM <- read.table(file = "output/combined_gapMinder.tsv", header = TRUE, sep = "\t")

# plot all the variables in the file against each other

plot(gapM)

# plot population versus life expectancy

plot(x=gapM$pop, y=gapM$lifeExp, xlab="population", ylab="life expectancy", main="Gapminder" )




