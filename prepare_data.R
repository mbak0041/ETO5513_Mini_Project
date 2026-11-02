library(dplyr)

# Load the original datasets
renewable_data <- read.csv(
  "Data/share-of-electricity-generation-from-renewables.csv"
)

fossil_data <- read.csv(
  "Data/share-of-electricity-generation-from-fossil-fuels.csv"
)

# Combine datasets using matching country and year information
combined_data <- inner_join(
  renewable_data,
  fossil_data,
  by = c("Entity", "Code", "Year")
)

# Select five countries and the years 2000–2024
final_data <- combined_data %>%
  filter(
    Entity %in% c("Australia", "Canada", "Germany", "India", "Japan"),
    Year >= 2000,
    Year <= 2024
  ) %>%
  select(Entity, Year, Renewables, Fossil.fuels)

# Save the prepared dataset
write.csv(
  final_data,
  "Data/electricity_analysis.csv",
  row.names = FALSE
)