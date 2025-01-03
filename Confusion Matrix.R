# Load necessary libraries
library(caret)
library(ggplot2)
library(randomForest)
library(gridExtra)

# Predicitons
model_rf <- randomForest(ICD.level.0 ~ Chemical.class, data = data_train, importance = TRUE)
data_test$ICD.level.0 <- as.factor(data_test$ICD.level.0)
predictions <- predict(model_rf, newdata = data_test)
predictions <- factor(predictions, levels = levels(data_test$ICD.level.0))

# Confusion Matrix
confusion <- confusionMatrix(predictions, data_test$ICD.level.0)
confusion_df <- as.data.frame(confusion$table)

# Heatmap
heatmap <- ggplot(data = confusion_df, aes(x = Reference, y = Prediction, fill = Freq)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "navyblue") +
  geom_text(aes(label = Freq), color = "black", size = 3) +  # Adjusted size for readability
  labs(
    title = "Confusion Matrix Heatmap for ICD Level 0",
    x = "Observed Categories (ICD Level 0)",
    y = "Predicted Categories (ICD Level 0)",
    fill = "Frequency"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),  # Rotate x-axis labels
    axis.text.y = element_text(size = 10),
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    legend.title = element_text(size = 9),
    legend.text = element_text(size = 7)
  )
print(heatmap)


