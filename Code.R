library(tidyverse)
library(here)

#Set the working directory
getwd()
setwd("C:/Users/katie/OneDrive/Documents/Project_200256498")

#Importing of the relevant datasets: Donor_commitments and Donor_disbursements
library(readxl)
 Donor_commitments <- read_excel("Data/Donor commitments.xlsx")
 View(Donor_commitments)
 library(readxl)
 Donor_disbursements <- read_excel("Data/Donor disbursements.xlsx")
 View(Donor_disbursements)


#Merge Donor commitment and Donor disbursments data to get one dataset
merged_data <- left_join(Donor_commitments, Donor_disbursements, by = "Country")

#Removal of first blank row
merged_data <- merged_data[-c(1),]


#Renaming of variables for clarity
colnames(merged_data)[2] <- "donor_committed" 
colnames(merged_data)[3] <- "donor_paid"

#First few rows of dataset after preparation 
head(merged_data)

#Plot parameters 
plottitle <- "Money committed to aid compared to money disbursed"
xlab <- "Money committed (US $)"
ylab <- "Money disbursed (US $)"


#Plotting the graph
v <- ggplot(data = merged_data, mapping = aes_string(x = "donor_committed", y = "donor_paid"))
                                                     
v + geom_point(alpha = 0.5) +
    ggtitle(plottitle) +
    xlab(xlab) +
    ylab(ylab) +
    xlim(0,600) +
    ylim(0,1250) +
    geom_abline(aes(intercept=0, slope=1))


    
   

