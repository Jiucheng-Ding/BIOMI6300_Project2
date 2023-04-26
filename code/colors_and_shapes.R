# This file indicates that colors and shapes of metadata across various
# let's keep the visualizations consistent! :) 

fraction_shapes <- c(
  "Particle" = 23, 
  "Free" = 21,
  "Whole" = 22,
  "Control" = 24)

fraction_colors <- c(
  "Particle" = "firebrick3", 
  "Free" = "goldenrod1", 
  "Whole" = "darkorange2",
  "Control" = "grey")

station_colors <- c(
  "Shipping Channel" = "dodgerblue4",
  "Aransas Bay" = "dodgerblue2",
  "Copano West" = "#D9CC3C",
  "Copano East" = "#A0E0BA",
  "Mesquite Bay" = "#00ADA7",
  "Control" = "grey")

station_shapes <- c(
  "Shipping Channel" = 15,
  "Aransas Bay" = 16, 
  "Copano West" = 17,
  "Copano East" = 18,
  "Mesquite Bay" = 19,
  "Control" = 20)


depth_colors <- c(
  "B" = "steelblue3",
  "S" = "forestgreen")

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