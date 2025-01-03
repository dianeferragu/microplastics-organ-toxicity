# Load necessary libraries
library(xgboost)
library(dplyr)
library(ggplot2)

# Data Prep
data_train_processed <- data_train %>%
  mutate(
    Chemical.class = as.numeric(as.factor(Chemical.class)),
    Age.at.exposure = as.numeric(as.factor(Age.at.exposure)),
    Sex = as.numeric(as.factor(Sex))
  )

data_test_processed <- data_test %>%
  mutate(
    Chemical.class = as.numeric(as.factor(Chemical.class)),
    Age.at.exposure = as.numeric(as.factor(Age.at.exposure)),
    Sex = as.numeric(as.factor(Sex))
  )

data_train_matrix <- as.matrix(data_train_processed[, c('Chemical.class', 'Age.at.exposure', 'Sex')])
data_test_matrix <- as.matrix(data_test_processed[, c('Chemical.class', 'Age.at.exposure', 'Sex')])
target_train <- as.numeric(data_train$ICD.level.0) - 1
target_test <- as.numeric(data_test$ICD.level.0) - 1

# Train 
xgb_model <- xgboost(data = data_train_matrix, label = target_train, 
                     nrounds = 100, objective = "multi:softmax", 
                     num_class = length(unique(target_train)))

# Feature Importance
importance_df <- xgb.importance(model = xgb_model)

# Clean 
importance_df$Feature <- gsub("\\.", " ", importance_df$Feature)
importance_df$Feature <- tools::toTitleCase(importance_df$Feature)

# Plot 
ggplot(importance_df, aes(x = reorder(Feature, Gain), y = Gain, fill = Feature)) +
  geom_bar(stat = "identity", color = "black", show.legend = FALSE) +
  scale_fill_manual(values = c("navyblue", "dodgerblue3", "skyblue")) +  # Custom blue shades
  labs(
    title = "Feature Importance",
    x = "Feature",
    y = "Importance (Gain)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.text.x = element_text(size = 10, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 10),
    axis.title.x = element_text(size = 12),
    axis.title.y = element_text(size = 12),
    panel.grid.major = element_line(color = "grey85"),
    panel.grid.minor = element_blank()
  )
