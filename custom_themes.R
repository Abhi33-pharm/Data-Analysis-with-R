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

# grid plots
library(cowplot)

# data
data <- read.csv("data/pulse_data.csv", stringsAsFactors = T)
glimpse(data)

# set globally
theme_set(theme_pubr())



#Publication ready theme

theme_set(
  theme_gray()+
    theme(
      axis.line= element_line(size=0.05),
      panel.background = element_rect(fill=NA, size= rel(20)),
      panel.grid.minor = element_line(colour =NA),
      axis.text = element_text(size=16),
      axis.title = element_text(size=18)
    )
)


# publication-ready
p1 <- ggplot(data, aes(x = fct_infreq(Exercise), fill = Gender)) +
  geom_bar(position = "dodge")+
  labs(
    x = "Exercise Level",
    y = "Counts"
)+
  scale_fill_lancet() # Here you can add any theme, ipsum will be a good choice


p2 <- ggplot(data, aes(x = fct_infreq(BMICat), fill = Gender)) +
  geom_bar(position = "dodge")+
  labs(
    x = "BMI Category",
    y = "Counts"
  )+ scale_fill_bmj()
  scale_fill_bmj()


plot_grid(p1, p2, labels = c("A", "B"))
ggsave("figures/combined_plot.png", dpi = 300)  

# I can insert width and height to increase the image size



