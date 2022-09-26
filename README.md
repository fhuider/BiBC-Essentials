# BiBC-Essentials

plot_chicken_data.R is an Rscript that visualizes data from different chicken breeds and a number of characteristic scores by sex and color. In-script annotations detail the process.

In short, we load packages, read in the data, use the melt() function to transform the data to long format, and plot rater scores of chicken's feet, head, type, feather color, and the average of all 4, as violin plots by sex and color.

The result is this:
![alt text](https://github.com/fhuider/BiBC-Essentials/blob/main/characteristicscores_by_colourandsex.png?raw=true)

At first glance the spread within females appears to be higher than in males. However, the number of observations, particularly in the male category, is too low to make any definitive statements.
