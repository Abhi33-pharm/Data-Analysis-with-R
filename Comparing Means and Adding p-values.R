# load required packages
library(tidyverse)
library(ggpubr)
library(ggsci)
library(hrbrthemes)
library(ggthemes)
library(patchwork)
library(cowplot)

# publication ready setup
theme_set(theme_gray() +
            theme(
              axis.line = element_line(size=0.5),
              panel.background = element_rect(fill=NA,size=rel(20)),
              panel.grid.minor = element_line(colour = NA),
              axis.text = element_text(size=16),
              axis.title = element_text(size=18)
            ))

# data
# URL: https://raw.githubusercontent.com/kassambara/data/master/expr_tcga.txt
url <- "https://raw.githubusercontent.com/kassambara/data/master/expr_tcga.txt"
epr_data <- read.delim(url) |>
  rename(Cancer_Type = dataset)


# Box plots with jittered points
# Specify the comparisons you want
comparison_group <- list(c("BRCA", "OV"), c("OV", "LUSC"))

ggboxplot(epr_data,
          x = "Cancer_Type",
          y = "GATA3",
          ylab = "Expression",
          xlab = "Cancer Type",
          color = "Cancer_Type",
          add = "jitter",
          shape = "Cancer_Type"
          )+
  stat_compare_means(comparisons = comparison_group)

# Add significance levels
# GATA3
p1 <- ggboxplot(epr_data,
          x = "Cancer_Type",
          y = "GATA3",
          ylab = "Expression",
          xlab = "Cancer Type",
          color = "Cancer_Type",
          add = "jitter",
          shape = "Cancer_Type",
          palette = "jico",
          legend = "none"
)+
  stat_compare_means(comparisons = comparison_group, label = "p.signif")

# PTEN
p2 <- ggboxplot(epr_data,
          x = "Cancer_Type",
          y = "PTEN",
          ylab = "Expression",
          xlab = "Cancer Type",
          color = "Cancer_Type",
          add = "jitter",
          shape = "Cancer_Type",
          legend = "none"
)+
  stat_compare_means(comparisons = comparison_group, label = "p.signif")

# XBP1
p3 <- ggboxplot(epr_data,
          x = "Cancer_Type",
          y = "XBP1",
          ylab = "Expression",
          xlab = "Cancer Type",
          color = "Cancer_Type",
          add = "jitter",
          shape = "Cancer_Type",
          legend = "none"
)+
  stat_compare_means(comparisons = comparison_group, label = "p.signif")

ggarrange(p1, p2, p3, nrow = 1, labels = c("A", "B", "C")) |>
  ggexport(filename = "figures/genes.pdf")


# You can save as jpg, png, pdf format


