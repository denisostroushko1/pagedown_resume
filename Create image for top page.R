

library(igraph)
library(wesanderson)

set.seed(123)  # set the seed for reproducibility

# Create the graph with 30 nodes
g <- sample_gnp(30, 0.5)

# Get the 'Royal2' color palette
colors <- wes_palette("BottleRocket2")

# Assign a color to each node randomly
V(g)$color <- colors[sample(1:length(colors), vcount(g), replace = TRUE)]

# Assign a size to each node randomly
V(g)$size <- runif(vcount(g), 10, 30)

png("/Users/denisostroushko/Desktop/pagedown_resume/myplot.png",  width=300, height=300)
    
    # Plot the graph
    par(bg = "#A2E4B8", mar=c(0,0,0,0)+.01)
    plot(g, vertex.color = V(g)$color, 
         vertex.size = V(g)$size * .75, 
         vertex.label = NA,
         edge.color = adjustcolor("black", alpha = .5), 
         edge.size = 1000, 
         edge.width = 2, 
         bg = "#A2E4B8")

dev.off()
