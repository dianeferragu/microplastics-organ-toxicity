

Readme


# Microplastics-Organ-Toxicity

## Overview
This project investigates the accumulation of microplastics in human organs and tissues, focusing on their physiological and toxicological impacts in American adults. The research leverages data from the **Plastic Health Map** to identify the most affected organs and explore potential health implications.

## Features
- Comprehensive analysis of microplastic accumulation in human tissues.
- Advanced machine learning models, including decision trees, random forests, and XGBoost.
- Data-driven insights into physiological and toxicological impacts.
- Reproducible R scripts for analysis and visualization.
- Publication-ready visualizations.

## Prerequisites
To run the analysis, ensure you have the following:
- R version 4.0.0 or higher
- Required R packages (listed in `scripts/requirements.txt`)
- Git for version control

## Repository Structure
- `data/` - Raw and processed data files.
- `scripts/` - R scripts for data processing, machine learning models, and visualization.
- `results/` - Visualizations, tables, and other outputs.
- `README.md` - Project documentation (this file).

## Installation
Clone the repository to your local machine:

```bash
git clone https://github.com/dianeferragu/microplastics-organ-toxicity.git
Install the necessary R packages by running:

source("scripts/install_packages.R")
Usage
Load the Data
Run the following command in your R console to load the data for analysis:

source("scripts/load_data.R")
This script reads and prepares the data from the data/ folder.

Run Analysis Scripts
After loading the data, run the analysis scripts to perform various tasks, such as building machine learning models and generating results. For example:

source("scripts/decision_tree.R")
source("scripts/xgboost.R")
Generate Visualizations
Each analysis script will create visualizations, which will be automatically saved in the results/ folder. You can open these files to review the outputs.

Key Outputs
Composition Analysis: Breakdown of microplastic types in biological systems.

Example Output
Example visualization of microplastic frequency across biological systems:



Frequency Analysis: Distribution of microplastics across organs.

Model Accuracy: Evaluation of machine learning models using confusion matrices.

Feature Importance: Insights from XGBoost on key predictors.

Data Source
This project uses data from the Plastic Health Map:

Plastic Health Map. "Comprehensive Data on Microplastic Exposure and Health Outcomes." Available at: https://plastichealthmap.org. Accessed August 12, 2024.

Requirements
To successfully run the scripts, the following R packages are required:

caTools: For data splitting

readxl: For reading Excel files

ggplot2: For visualizations

dplyr: For data manipulation

randomForest: For Random Forest models

caret: For confusion matrices

rpart and rpart.plot: For decision trees

xgboost: For XGBoost models

Troubleshooting
Missing Packages: If you encounter an error about missing packages, install them by running:

install.packages("package_name")
Data Not Found: Ensure the data/ folder contains the necessary data files. Replace absolute file paths with relative paths to avoid path issues.

Contributions
Contributions to this project are welcome! Feel free to:

Report issues

Suggest new features

Submit pull requests

Contact
For inquiries, reach out to Diane Ferragu at diane@ferragu.net.

License
This project is licensed under the MIT License. See the LICENSE file for details.

Thank you for your interest in this project!


