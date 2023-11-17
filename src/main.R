dev.set(which = dev.next())
# Create a sample data frame
data <- data.frame(
  x = c(1, 2, 3, 4, 5),
  y = c(2, 3, 5, 7, 11)
)

# Create a scatter plot using the plot() function
plot(data$x, data$y, 
     main = "Scatter Plot Example", 
     xlab = "X-axis", 
     ylab = "Y-axis", 
     pch = 16)
