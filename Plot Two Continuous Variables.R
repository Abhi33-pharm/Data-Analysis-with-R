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


# scatter
ggscatter(
  epr_data,
  x = "GATA3",
  y = "PTEN",
  color = "black",
  shape = 21,
  size = 3,
  add = "reg.line",
  add.params = list(color = "blue", fill = "lightgray"),
  conf.int = TRUE,
  cor.coef = TRUE,
  cor.coeff.args = list(method = "pearson", label.x = 3, label.sep = "\n")
)






