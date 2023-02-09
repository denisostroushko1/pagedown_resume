
library(igraph)
library(wesanderson)

# Specify edges for a directed graph
gd <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(gd)

directed <- 
  graph(
    c(
      2, 1, 3, 1, 2, 3, 1, 4, 
      
      5, 6, 7, 6, 
      
      8, 
      
      9, 
      
      4, 10, 6, 10, 8, 10, 9, 10
    )
    )

V(directed)

V(directed)$group <- c("one", "one", "one",  # for 1,2,3
                       "two",  # for 4 
                       "three", "three", "three",  # for 5,6,7
                       'four', 'four', # for 8,9
                       "FIVE"
                       )

color_palet <- wes_palette('Royal2')

V(directed)$color[c(1,2,3)] <- color_palet[1]
V(directed)$color[c(4)] <- color_palet[2]
V(directed)$color[c(5,6,7)] <- color_palet[3]
V(directed)$color[c(8,9)] <- color_palet[4]
V(directed)$color[c(10)] <- color_palet[5]
  
directed <- set_vertex_attr(directed, "degree", value = ifelse(V(directed)$group == "FIVE", 30, 20))

par(bg = "#A2E4B8")
plot(directed,
        edge.color = 'black', 
        weight.edge.lengths = 2, 
        vertex.size = V(directed)$degree ,
        vertex.label = NA, 
        bg = "#A2E4B8"
     )









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

png("/Users/denisostroushko/Desktop/pagedown_resume/myplot.png",  width=300, height=1000)
    
    # Plot the graph
    par(bg = "#A2E4B8")
    plot(g, vertex.color = V(g)$color, vertex.size = V(g)$size, vertex.label = NA,
         edge.color = "black", edge.size = 1000, 
         edge.width = 2, bg = "#A2E4B8")

dev.off()
