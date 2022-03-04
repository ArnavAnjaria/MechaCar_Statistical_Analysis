# import the dplyrr package
library(dplyr)
library(readr)


## Deliverable 1

#import the csv
MechaCar_mpg <- read_csv("data/MechaCar_mpg.csv")
# perform lin reg
lin_reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar_mpg)
summary(lin_reg)

## Deliverable 2

# import the csv
Suspension_Coil <- read_csv("data/Suspension_Coil.csv")

# total summary df
total_summary <- Suspension_Coil %>% summarize(
  Mean_PSI=mean(PSI),
  Median_PSI=median(PSI),
  Var_PSI=var(PSI),
  Std_Dev_PSI=sd(PSI),
  .groups = 'keep'
)

# total summary df
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(
  Mean_PSI=mean(PSI),
  Median_PSI=median(PSI),
  Var_PSI=var(PSI),
  Std_Dev_PSI=sd(PSI),
  .groups = 'keep'
)

## Deliverable 3

# t-test across all the lots
t.test(Suspension_Coil$PSI, mu=1500)

# t-test for each lot
# lot 1
lot1 <- subset(Suspension_Coil, Manufacturing_Lot == 'Lot1')
t.test(lot1$PSI, mu=1500)
# lot 2
lot2 <- subset(Suspension_Coil, Manufacturing_Lot == 'Lot2')
t.test(lot2$PSI, mu=1500)
# lot 1
lot3 <- subset(Suspension_Coil, Manufacturing_Lot == 'Lot3')
t.test(lot3$PSI, mu=1500)

