# This file indicates that colors and shapes of metadata across various
# let's keep the visualizations consistent! :) 

location_shapes <- c(
  "FC" = 23, 
  "JJ" = 21)

#location_colors <- c(
 # "FC" = "goldenrod1", 
 # "JJ" = "darkorange2")


heat_colors <- c(
  "hot" = "steelblue3",
  "cool" = "firebrick3")

#heat_shapes <- c(
#  "hot" = "14",
 # "cool" = "15")
# Set the ggplot theme
theme_set(theme_bw() + 
            theme(axis.title = element_text(size = 12),
                  axis.text = element_text(size = 10),
                  legend.title = element_text(size = 10),
                  legend.text = element_text(size = 9)))

# Set the phylum colors
phylum_colors <- c(
  Acidobacteriota = "navy", 
  Actinobacteriota = "darkslategray2", 
  Armatimonadota = "deeppink1",
  Alphaproteobacteria = "plum2", 
  Bacteroidota = "gold", 
  Betaproteobacteria = "plum1", 
  Bdellovibrionota = "red1",
  Chloroflexi="black", 
  Crenarchaeota = "firebrick",
  Cyanobacteria = "limegreen",
  Deltaproteobacteria = "grey", 
  Desulfobacterota="magenta",
  Firmicutes = "#3E9B96",
  Gammaproteobacteria = "greenyellow",
  "Marinimicrobia (SAR406 clade)" = "yellow",
  Myxococcota = "#B5D6AA",
  Nitrospirota = "palevioletred1",
  Proteobacteria = "royalblue",
  Planctomycetota = "darkorange", 
  "SAR324 clade(Marine group B)" = "olivedrab",
  #Proteobacteria_unclassified = "greenyellow",
  Thermoplasmatota = "green",
  Verrucomicrobiota = "darkorchid1")
# Other = "grey")