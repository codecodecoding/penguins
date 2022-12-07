#step 1 is to load the data
source("functions/libraries.r")
load_libraries()

#step 2: appropriately clean the data

#call up the cleaning function saved in a different script
source("functions/cleaning.r")

# Calling the function
penguins_now_clean <- cleaning(penguins_raw)

## step 3: run a statistical test (anova) on a linear model

penguin.mod <- lm(culmen_length_mm ~ species, penguins_now_clean)

anova(penguin.mod)

#Results of statistical test: P value is a lot less than 0.05, so result is very strongly significant. 
#There is a strong correlation between species and the mean flipper length of a penguin.

#Check assumptions of test are met:

#q-q plot generation for normality
#Data points follow reference line quite closely, so assumption is met
plot(penguin.mod,2)

#Scale-location plot generation
#Ideally, should have a horizontal line with equally spread points along a range of predictors. This plot fits assumption for equal variance of points
plot(penguin.mod,3)

source("functions/plotting.R")

#step 4: plot a figure

barchart <- plotting(penguins_now_clean)
print(barchart)


#step 5: save image as a vector

save_flipper_plot_svg(penguins_now_clean, 
                      "figures/fig01_vector.svg", 
                      size = 15, scaling = 1.5)
