# load required packages
library(tidyverse)
library(ggpubr)
library(ggsci)
library(hrbrthemes)
library(ggthemes)
library(patchwork)
library(cowplot)

# Creating function for personal theme to apply to all plots
personal_theme <- function(){
  theme_bw()+
    theme(
      axis.title = element_text(size = rel(1.25)),
      axis.text = element_text(size = rel(1.15)),
      plot.title = element_text(size = rel(1.5), hjust = 0.5),
      panel.grid = element_blank(),
      legend.position = "none"
    )
}


# data
# URL: https://raw.githubusercontent.com/kassambara/data/master/expr_tcga.txt
url <- "https://raw.githubusercontent.com/kassambara/data/master/expr_tcga.txt"
epr_data <- read.delim(url) |>
  rename(Cancer_Type = dataset)

# boxplot
ggboxplot(
  epr_data,
  x = "Cancer_Type",
  y = "GATA3",
  xlab = "Cancer Types",
  ylab = "GATA3",
  color = "Cancer_Type"
)

# Box plots with jittered points
ggboxplot(
  epr_data,
  x = "Cancer_Type",
  y = "GATA3",
  xlab = "Cancer Types",
  ylab = "GATA3",
  color = "Cancer_Type",
  add = "jitter",
  shape = "Cancer_Type"
)

# violin
ggviolin(
  epr_data,
  x = "Cancer_Type",
  y = "GATA3",
  xlab = "Cancer Types",
  ylab = "GATA3",
  color = "Cancer_Type"
)


