# This is a set of outdated but working functions to parse data
# Custom functions were created to build metadata off of 
# sample ID names. 

# There are a few  functions 
# 1. Not in
# 2. make_MA_metadata - build metadata from sample ID Names 
# 3. matround - for better rounding 
# 3. scale_reads - scaling the data
# 4. make_MA2_metadata - build metadata from combined replicates.

#----------------------------------------------------------------
# 1. Function for "not in" a vector
'%!in%' <- function(x,y)!('%in%'(x,y))


# 2. make_MA_metadata, which wil build metadata from sample names. 

## This function adds the categorical metadata to a dataframe based on the sample name
# IMPORTANT!!!  The dataframe MUST have column named "names"
make_MA_metadata <- function(dataframe){ 
  
  # Create new columns based on information in the sample name
  dataframe$year <- substr(dataframe$names, 1,4) 
  dataframe$month <- substr(dataframe$names, 5,6) 
  dataframe$day <- substr(dataframe$names, 7,8) 
  dataframe$location <- substr(dataframe$names,9,10) 
  dataframe$heat <- substr(dataframe$names, 11, 11) 
  dataframe$Run <- substr(dataframe$names, 12,12) 
  
  # Run
  dataframe$Run <- ifelse(dataframe$Run == "SRR15570324", NA,
                          ifelse(dataframe$Run == "SRR15570325", NA,
                                 ifelse(dataframe$Run == "SRR15570326", NA,
                                        ifelse(dataframe$Run == "SRR15570327", NA, NA))))
  dataframe$Run <- as.factor(dataframe$Run)
  dataframe$Run <- factor(dataframe$Run, levels = c("SRR15570324", "SRR15570325", "SRR15570326", "SRR15570327"))
  
  
  # Month
  dataframe$month <- ifelse(dataframe$month == "08", "August", "Other")
  
  
  # Location
  dataframe$location <- ifelse(dataframe$location == "FC", 
                               ifelse(dataframe$location == "JJ"))
  dataframe$location <- as.factor(dataframe$location)
  dataframe$location <- factor(dataframe$location,levels = c("FC", "JJ"))
  
  # Heat
  dataframe$heat <- ifelse(dataframe$heat == "H", "hot", 
                           ifelse(dataframe$heat == "C", "cool"))
  dataframe$heat <- as.factor(dataframe$heat)
  dataframe$heat <- factor(dataframe$heat,levels = c("hot", "cool"))
  
  # Return the data
  return(dataframe)
}




# 
### scale_reads function
#################################################################################### 2
# Function to scale reads 
# Modified from code written by Michelle Berry, available at http://deneflab.github.io/MicrobeMiseq/ 
# Scales reads by 
# 1) taking proportions
# 2) multiplying by a given library size of n
# 3) rounding 
# Default for n is the minimum sample size in your library
# Default for round is floor

# 3. matround for better rounding 
matround <- function(x){trunc(x+0.5)}


# 4. scale reads function 
scale_reads <- function(physeq, n = min(sample_sums(physeq)), round = "round") {
  
  # transform counts to n
  physeq.scale <- transform_sample_counts(physeq, function(x) {(n * x/sum(x))})
  
  # Pick the rounding functions
  if (round == "floor"){
    otu_table(physeq.scale) <- floor(otu_table(physeq.scale))
  } else if (round == "round"){
    otu_table(physeq.scale) <- round(otu_table(physeq.scale))
  } else if (round == "matround"){
    otu_table(physeq.scale) <- matround(otu_table(physeq.scale))
  }
  
  # Prune taxa and return new phyloseq object
  physeq.scale <- prune_taxa(taxa_sums(physeq.scale) > 0, physeq.scale)
  return(physeq.scale)
}



######
#####
######

# 5. making metadata from replicates. 

make_MA2_metadata <- function(dataframe){ 
  
  # Create new columns based on information in the sample name
  dataframe$year <- substr(dataframe$names, 2,5) 
  dataframe$month <- substr(dataframe$names, 6,7) 
  dataframe$day <- substr(dataframe$names, 8,9) 
  dataframe$location <- substr(dataframe$names,10,11) 
  dataframe$heat <- substr(dataframe$names, 12, 12) 
  dataframe$Run <- substr(dataframe$names, 13,13) 
  
  # Run
  dataframe$Run <- ifelse(dataframe$Run == "4", "SRR15570324", 
                          ifelse(dataframe$Run == "5", "SRR15570325", 
                                 ifelse(dataframe$Run == "6","SRR15570326",
                                        ifelse(dataframe$Run == "7","SRR15570327"))))
  dataframe$Run <- as.factor(dataframe$Run)
  dataframe$Run <- factor(dataframe$Run,levels = c("SRR15570324", "SRR15570325", "SRR15570326", "SRR15570327"))
  
  # Month
  dataframe$month <- ifelse(dataframe$month == "08")
                        
  # Location
  dataframe$location <- ifelse(dataframe$location == "FC",
                               ifelse(dataframe$location == "JJ"))
  dataframe$location <- as.factor(dataframe$location)
  dataframe$location <- factor(dataframe$location,levels = c("FC", "JJ"))
  
  # Heat
  dataframe$heat <- ifelse(dataframe$heat == "H", "hot", 
                           ifelse(dataframe$heat == "C", "cool"))
  dataframe$heat <- as.factor(dataframe$heat)
  dataframe$heat <- factor(dataframe$heat,levels = c("hot", "cool"))
  
  # Return the data
  return(dataframe)
}
