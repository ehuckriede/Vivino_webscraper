# Load package
library(dplyr)

# Load the data
all_data <- read.csv(file = 'All_regions_data_test.csv')

# Check for any anomalities 
summary(all_data)

# Change Average.Rating into a numerical variable 
all_data$Average.Rating <- (gsub("\\,", ".", all_data$Average.Rating))
all_data$Average.Rating <- as.numeric(all_data$Average.Rating)
# Check whether it worked
is.numeric(all_data$Average.Rating)

# Get rid of columns that don't matter to us
all_data <- all_data[, c(2, 4:7)]

# Make dummy variables
all_data$bordeaux <- as.numeric(all_data$Region == "Bordeaux")
all_data$bourgogne <- as.numeric(all_data$Region == "Bourgogne")
all_data$napa_valley <- as.numeric(all_data$Region == "Napa Valley")
all_data$piemonte <- as.numeric(all_data$Region == "Piemonte")
all_data$rhone_valley <- as.numeric(all_data$Region == "Rhone Valley")
all_data$toscana <- as.numeric(all_data$Region == "Toscana")

# Check for NAs
sum(is.na(all_data$Region))
sum(is.na(all_data$Number.of.Ratings))
sum(is.na(all_data$Average.Rating))

# Mean of every region 
all_data %>% group_by(Region) %>% summarize(average_rating = mean(Average.Rating))
