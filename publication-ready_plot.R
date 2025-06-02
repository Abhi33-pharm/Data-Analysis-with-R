# data manipulation
library(tidyverse)

# advanced visualization
library(ggpubr)
library(sjPlot)

# themes
library(ggthemes)
library(hrbrthemes)

# colors
library(RColorBrewer)
library(viridis)
library(paletteer)
library(ggsci)

# data
data <- read.csv("data/pulse_data.csv", stringsAsFactors = T)
glimpse(data)

# basic customization
basic <- ggplot(data, aes(x = Exercise, fill = Gender)) +
  geom_bar(position = "dodge")+
  labs(
    x = "Exercise Level",
    y = "Counts",
    title = "Distribution of Exercise by Gender",
    subtitle = "The figure shows the frequency distribution of exercise by gender.",
    caption = "Data Source: CHIRAL/Author: Jubayer"
  )

# show the plot
basic

# working with themes (default themes)
basic + theme_bw()
basic + theme_gray()
basic + theme_fivethirtyeight()
basic + theme_economist()
basic + theme_economist_white()
basic + theme_ipsum()
basic + theme_dark()

# Paly with colors: RColorBrewer
display.brewer.all()
colors()

# Apply colors to the plot: colors ~ fill (dynamic)
basic + scale_fill_brewer()
basic + scale_fill_canva()
basic + scale_fill_colorblind()

# Apply colors to the plot: colors ~ journal colors
basic + scale_fill_bmj()
basic + scale_fill_aaas()
basic + scale_fill_bs5()
basic + scale_fill_cosmic()
basic + scale_fill_frontiers()
basic + scale_fill_lancet()
basic + scale_fill_jama()

# Manual colors
basic + scale_fill_manual(values = c("#950404FF", "#E04B28FF", "#C38961FF", "#004042FF", "#007D82FF", "#0F542FFF"))

# Working with fonts
library(showtext)
showtext_auto()
font_add_google("Lato", "lato")

# add global font family, font size
basic + theme_bw(base_family = "Lato", base_size = 18)

# title
basic + theme(plot.title = element_text(size = 20, family = "Lato", face = "bold"))

# subtitle
basic + theme(plot.subtitle = element_text(size = 16, family = "Lato"))

# axis titles
basic + theme(axis.title = element_text(size = 20))
basic + theme(axis.title.x = element_text(size = 20))
basic + theme(axis.title.y = element_text(size = 20))

# font family
basic + theme(axis.title = element_text(size = 28, family = "Arial"))
basic + theme(axis.title.x = element_text(size = 28, family = "Arial"))
basic + theme(axis.title.y = element_text(size = 28, family = "Arial"))

# legend position and text
basic + theme(legend.position = "left")
basic + theme(legend.position = "top")
basic + theme(legend.position = "bottom")
basic + theme(legend.title = element_text(size = 20))
