# Libraries
library(caTools)
library(readxl)
library(ggplot2)
library(dplyr)

# Data
Plastic_Data <- read_excel("/Users/diane/Library/Mobile Documents/com~apple~CloudDocs/11th grade/Plastic Research/PlasticData2.xlsx")
colnames(Plastic_Data) <- make.names(colnames(Plastic_Data))
set.seed(123)
train_indices <- sample(seq_len(nrow(Plastic_Data)), size = 0.7 * nrow(Plastic_Data))
data_train <- Plastic_Data[train_indices, ]
data_train$`ICD.level.0` <- as.factor(data_train$`ICD.level.0`)

# Frequency Analysis
organ_frequency <- data_train %>%
  group_by(ICD.level.0) %>%
  summarize(Frequency = n(), .groups = "drop") %>%
  arrange(desc(Frequency))

# Plot
plot <- ggplot(organ_frequency, aes(x = reorder(ICD.level.0, -Frequency), y = Frequency)) +
  geom_bar(stat = "identity", fill = "navyblue") +
  labs(
    title = "Frequency of Microplastics in Biological Systems",
    x = "ICD Level (Numeric Code)",
    y = "Frequency"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 7),  # Compact x-axis text
    axis.title.x = element_text(size = 9),
    axis.title.y = element_text(size = 9),
    plot.title = element_text(size = 11, face = "bold", hjust = 0.5)
  )
print(plot)


