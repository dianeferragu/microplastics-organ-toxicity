# Libraries
library(caTools)
library(readxl)
library(rpart)
library(rpart.plot)
library(dplyr)
install.packages("usethis")
install.packages("git2r")
library(usethis)
library(git2r)
usethis::use_github(protocol = "https")
usethis::use_git()
usethis::use_github()

# Data 
Plastic_Data <- read_excel("/Users/diane/Library/Mobile Documents/com~apple~CloudDocs/11th grade/Plastic Research/PlasticData2.xlsx")
colnames(Plastic_Data) <- make.names(colnames(Plastic_Data))

# Columns --> Factors
Plastic_Data$ICD.level.0 <- as.factor(Plastic_Data$ICD.level.0)
Plastic_Data$Chemical.class <- as.factor(Plastic_Data$Chemical.class)

# Train 
set.seed(123)
tree_model <- rpart(ICD.level.0 ~ Chemical.class, data = Plastic_Data, method = "class")

# Prune
tree_model <- prune(tree_model, cp = 0.01)  # Less aggressive pruning

# Plot
rpart.plot(
  tree_model,
  main = "Decision Tree for ICD Level 0",  # Title for the tree
  type = 0,                    # Compact split labels (internal splits only)
  extra = 104,                 # Show percentages and counts inside nodes
  fallen.leaves = FALSE,        # Arrange nodes to "fall" naturally
  tweak = 1.1,                 # Adjust spacing for better readability
  cex = 0.45,                   # Compact text size for nodes
  under.cex = 0.1,             # Compact text size under nodes
  digits = 2,                  # Use two decimal precision
  box.palette = "RdYlGn",      # Multicolor palette: red to yellow to green
  shadow.col = "gray",         # Subtle shadow for better contrast
  roundint = TRUE,             # Round integer values
  split.cex = 1,             # Font size for split labels
  split.box.col = "lightblue", # Highlight split labels with light blue boxes
  split.border.col = "blue"    # Borders around split boxes in blue
)








