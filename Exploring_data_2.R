# Data Manipulation & Visualization

pkg1 <- c("dplyr", "ggplot2", "choroplethr", "choroplethrMaps", 
          "openintro", "fiftystater", "colorplaner")

# Install the packages
install.packages(pkg1)

# 7 Package 
library(dplyr)
library(ggplot2)
library(choroplethr)
library(`choroplethrMaps`)
library(openintro)
# library(fiftystater)
library(colorplaner)

install.packages("remotes")
remotes::install_github("wmurphyrd/fiftystater")
library(fiftystater)

# Data
vehicle <- read.csv('vehicle_1.csv')
car <- as_data_frame(vehicle)
car

# Filter
car %>%
  filter(State=='CA' | State == 'TX' | State=='FL')

car %>%
  filter(State=='CA', Mileage < 50000, fm > 3)

# Arrange
car %>%
  filter(State=='CA' | State == 'TX' | State=='FL') %>%
  arrange(desc(Mileage))

# Summarise
car %>%
  summarise(Avg_lc = mean(lc),
            sd_lc = sd(lc),
            max_lc = max(lc),
            min_lc = min(lc, na.rm = TRUE),
            sum_lc = sum(lc, na.rm = TRUE),
            median_lc = median(lc, na.rm = TRUE),
            total = n())

# Group by
car %>%
  group_by(State) %>%
  summarise(Avg_lc = mean(lc),
            sd_lc = sd(lc),
            max_lc = max(lc),
            min_lc = min(lc, na.rm = TRUE),
            sum_lc = sum(lc, na.rm = TRUE),
            median_lc = median(lc, na.rm = TRUE),
            total = n()) %>%
  arrange(desc(Avg_lc))

# Mutate and Summarise
car %>%
  group_by(State) %>%
  mutate(cph = sum(lc) / sum(lh)) %>%  
  summarise(
    Avg_cph = mean(cph, na.rm = TRUE),   
    Avg_mileage = mean(Mileage, na.rm = TRUE)  
  ) %>%
  arrange(desc(Avg_cph))  


# Visualization 
# Histogram
car %>%
  filter(State == 'CA' | State == 'TX' | State == 'FL') %>%
  ggplot(aes(x = lc, fill = State)) +   # Fill bars by 'State'
  geom_histogram(alpha = 0.8, color = 'darkblue') +
  ggtitle('Labor cost in Top 3 states') +
  facet_wrap(~State)

# Density Plot
car %>%
  filter(State == 'CA' | State == 'TX' | State == 'FL') %>%
  ggplot(aes(x = lc, fill = State)) +
  geom_density(alpha = 0.5, color = 'darkblue') +  
  ggtitle('Labor cost in Top 3 states')

# Scatter Plot
car %>%
  filter(State == 'CA' | State == 'TX' | State == 'FL') %>%
  ggplot(aes(x = lh, y = lc, col = State, size = mc)) +
  geom_point(alpha = 0.5) +  
  geom_smooth(se = FALSE) +  
  facet_wrap(~State)         

# Bar plot
new <- car %>%
  group_by(State) %>%
  mutate(cph = lc / lh) %>%  
  summarise(Avg_cph = mean(cph, na.rm = TRUE),  
            Avg_mileage = mean(Mileage, na.rm = TRUE)) %>%  
  arrange(desc(Avg_cph))

ggplot(new, aes(x = State, y = Avg_cph, fill = State)) +
  geom_col() +  
  coord_flip() + 
  ggtitle('Cost per hour in 50 states')


# Box plot
car %>%
  group_by(State) %>%
  filter(n() > 40) %>%  
  ggplot(aes(x = State, y = lc, col = State)) +  
  geom_boxplot() 


# Map-1
# Data preparation
new <- car %>%
  group_by(State) %>%
  summarise(total = n(),
            Avg_mileage = mean(Mileage))
colnames(new) <- c('region', 'value', 'mileage')
new
new$region <- abbr2state(new$region)  
new$region <- tolower(new$region)     
new <- new[-1,]  

# Choropleth map
state_choropleth(new,
                 title = "Car Failures in US",
                 legend = 'Number of Failures')


# Map-2
p <- ggplot(new, aes(map_id = region)) +  
  geom_map(aes(fill = value), map = fifty_states) +  
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +  
  coord_map() +
  scale_x_continuous(breaks = NULL) +
  scale_y_continuous(breaks = NULL) +
  labs(x = "", y = "") +
  theme(legend.position = "bottom",
        panel.background = element_blank())

# Add inset boxes for the map
p + fifty_states_inset_boxes()

# Add color plane for filling the map, and position legend on the right
p + aes(fill2 = mileage) + 
  scale_fill_colourplane() +  
  theme(legend.position = 'right') +
  ggtitle('Geo Map for Failures and Average Mileage')
