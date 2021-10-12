# Load package
library(dplyr)

# Load the data
all_data <- read.csv(file = 'all_regions_data.csv')

# Check for any anomalities 
View(all_data)
summary(all_data)

# Change Average.Rating into a numerical variable 
all_data$average_rating <- (gsub("\\,", ".", all_data$average_rating))
all_data$average_rating <- as.numeric(all_data$average_rating)
# Check whether it worked
is.numeric(all_data$average_rating)

# Get rid of columns that don't matter to us
all_data <- all_data[, c(2:6)]

# Make dummy variables
all_data$bordeaux <- as.numeric(all_data$region == "Bordeaux")
all_data$bourgogne <- as.numeric(all_data$region == "Bourgogne")
all_data$napa_valley <- as.numeric(all_data$region == "Napa Valley")
all_data$piemonte <- as.numeric(all_data$region == "Piemonte")
all_data$rhone_valley <- as.numeric(all_data$region == "Rhone Valley")
all_data$toscana <- as.numeric(all_data$region == "Toscana")

# Check for NAs
sum(is.na(all_data$region))
sum(is.na(all_data$number_of_ratings))
sum(is.na(all_data$average_rating))

# Mean of every region 
all_data %>% group_by(region) %>% summarize(average_rating = mean(average_rating))
