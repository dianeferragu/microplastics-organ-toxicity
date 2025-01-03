# Libraries
library(caTools)
library(readxl)
library(ggplot2)
library(viridis)
library(dplyr)

# Data
Plastic_Data <- read_excel("/Users/diane/Library/Mobile Documents/com~apple~CloudDocs/11th grade/Plastic Research/PlasticData2.xlsx")

# Rename 
colnames(Plastic_Data) <- make.names(colnames(Plastic_Data))

# Frequency Analysis
data_train <- Plastic_Data
data_train$ICD.level.0 <- as.factor(data_train$ICD.level.0)
data_train$Chemical.class <- as.factor(data_train$Chemical.class)

# Main plot: Composition of Microplastics
composition_plot <- ggplot(data_train, aes(x = ICD.level.0, fill = Chemical.class)) +
  geom_bar(stat = "count", position = "stack") +
  scale_fill_viridis_d(option = "viridis") +
  labs(
    title = "Composition of Microplastics in Biological Systems",
    x = "System",
    y = "Frequency",
    fill = "Plastic Type"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 7),
    axis.title.x = element_text(size = 10),
    axis.title.y = element_text(size = 10),
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    legend.title = element_text(size = 8),
    legend.text = element_text(size = 6)
  )

# Plot
print(composition_plot)






