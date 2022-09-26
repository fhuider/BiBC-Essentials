###### BiBC Essentials - Week 2 - Git & plotting
# Start with clean slate
rm(list=ls())

# Load required packages
library(dplyr)
library(readr)
library(reshape)
library(ggplot2)

# Specify path manually and load data
path <- "path_to_Scorings.csv"

typeVars <- c("Feet", "Head", "Type","FeatherColor")
ScoringData <- 
  read_delim(
    paste0(path, "Scorings.csv"),
    delim = ";",
    col_types = cols(
      Date = col_character(),
      Sex = col_character(),
      AnimalIdentifier = col_character(),
      Weight = col_integer(), 
      Color = col_character(), 
      Feet = col_integer(), 
      Head = col_integer(),
      Type = col_integer(), 
      FeatherColor = col_integer()
    )) %>%
  dplyr::mutate(
    AverageScore = rowMeans(select(., typeVars)) # Sums variables specified in the vector typeVars into a meanscore.
  )

# Adjust data for graphical purposes
data1 <- as.data.frame(ScoringData)
data2 <- melt(data1, id=c("Date", "Sex", "AnimalIdentifier", "Weight", "Color"))

# Plot feet, head, type feather, and the average of the four indicators for females, males, black, and blue colours.
ggplot(data = data2[!(is.na(data2$Color)),]) +
  geom_violin(mapping = aes(x = variable, y = value, fill = variable), alpha = 0.5) +
  scale_fill_brewer() +
  theme(legend.position="none") +
  geom_jitter(mapping = aes(x = variable, y = value), position = position_jitter(seed = 1, width = 0.2)) +
  facet_grid(Sex ~ Color)
