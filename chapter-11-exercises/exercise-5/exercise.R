# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
dep_delay_by_month <- group_by(flights, month) %>% summarise(avg_dep_delay = mean(dep_delay, na.rm = TRUE))

# Which month had the greatest average departure delay?
worst_month <- arrange(dep_delay_by_month, -avg_dep_delay) %>% top_n(1) %>% pull(month)

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
dep_delay_by_dest <- group_by(flights, dest) %>% summarise(avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(-avg_dep_delay) %>% head()

# You can look up these airports in the `airports` data frame!
View(airports)

# Which city was flown to with the highest average speed?

