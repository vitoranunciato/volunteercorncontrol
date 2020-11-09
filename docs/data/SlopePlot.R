## Slope plot ###
# https://ibecav.github.io/slopegraph/

#Library
library(readxl)
library(dplyr)
library(ggplot2)
library(ggrepel)
library(kableExtra)
library(RColorBrewer)
library(ggpubr)

### Data ###
data_field = read.csv("C:/Users/vitor/Google Drive/Presentations/Control of volunteer corn/volunteercorncontrol/docs/data/control.csv")


df.summary <- data_field %>%
  group_by(herbicide, rep, adj, cm) %>%
  summarise(
    sd = sd(mass, na.rm = TRUE),
    mass = mean(mass)
  )

## First run With NIS ##

data1with = df.summary %>% filter(rep == "1", adj == "with")
str(data1with)
data1with$herbicide <- factor(data1with$herbicide, levels = c("Clethodim 76.8", "Clethodim 102", "Clethodim 136", "ClethodimDicamba 76.8", "ClethodimDicamba 102", "ClethodimDicamba 136", "Dicamba 560"))
data1with$cm = as.factor(data1with$cm)

frw = ggplot(data = data1with, aes(x = cm, y =  mass, group =  herbicide, label = round(mass,0))) +
  geom_line(aes(colour =  herbicide), size = 1) +
  geom_point(aes(colour =  herbicide), size = 3) +
  geom_label_repel() + 
  scale_colour_manual(values = c("#B2182B", "#D6604D", "#F4A582", "#E0E0E0", "#BABABA", "#878787", "#4D4D4D"
)) + theme_classic() + theme(title=element_text(size=30),
                             axis.text = element_text(size=30),
                             legend.text = element_text(size=30))+
  ylim(0,100)+
  labs(y = "Biomass control (%)",
    colour = "Treatment",
    x = "Plant heigth at application (cm)")
ggsave("frw.png", plot = frw, dpi = 1200, width = 40, height = 20, units = "cm")



## Second run With NIS ##

data2with = df.summary %>% filter(rep == "2", adj == "with")
str(data2with)
data2with$herbicide <- factor(data2with$herbicide, levels = c("Clethodim 76.8", "Clethodim 102", "Clethodim 136", "ClethodimDicamba 76.8", "ClethodimDicamba 102", "ClethodimDicamba 136", "Dicamba 560"))
data2with$cm = as.factor(data2with$cm)

srw = ggplot(data = data2with, aes(x = cm, y =  mass, group =  herbicide, label = round(mass,0))) +
  geom_line(aes(colour =  herbicide), size = 1) +
  geom_point(aes(colour =  herbicide), size = 3) +
  geom_label_repel() + 
  scale_colour_manual(values = c("#B2182B", "#D6604D", "#F4A582", "#E0E0E0", "#BABABA", "#878787", "#4D4D4D"
  )) + theme_classic() + theme(title=element_text(size=30),
axis.text = element_text(size=30),
legend.text = element_text(size=30))+
  ylim(0,100)+
  labs(y = "Biomass Control (%)",
    colour = "Treatment",
    x = "Plant heigth at application (cm)")
ggsave("srw.png", plot = srw, dpi = 1200, width = 40, height = 20, units = "cm")


## First run without NIS ##

data1without = df.summary %>% filter(rep == "1", adj == "without")
str(data1without)
data1without$herbicide <- factor(data1without$herbicide, levels = c("Clethodim 76.8", "Clethodim 102", "Clethodim 136", "ClethodimDicamba 76.8", "ClethodimDicamba 102", "ClethodimDicamba 136", "Dicamba 560"))
data1without$cm = as.factor(data1without$cm)

fro = ggplot(data = data1without, aes(x = cm, y =  mass, group =  herbicide, label = round(mass,0))) +
  geom_line(aes(colour =  herbicide), size = 1) +
  geom_point(aes(colour =  herbicide), size = 3) +
  geom_label_repel() + 
  scale_colour_manual(values = c("#B2182B", "#D6604D", "#F4A582", "#E0E0E0", "#BABABA", "#878787", "#4D4D4D"
  )) + theme_classic() + theme(title=element_text(size=30),
                               axis.text = element_text(size=30),
                               legend.text = element_text(size=30))+
  ylim(0,100)+
  labs(y = "Biomass control (%)",
    colour = "Treatment",
    x = "Plant heigth at application (cm)")

ggsave("fro.png", plot = fro, dpi = 1200, width = 40, height = 20, units = "cm")


## Second run without NIS ##

data2without = df.summary %>% filter(rep == "2", adj == "without")
str(data2without)
data2without$herbicide <- factor(data2without$herbicide, levels = c("Clethodim 76.8", "Clethodim 102", "Clethodim 136", "ClethodimDicamba 76.8", "ClethodimDicamba 102", "ClethodimDicamba 136", "Dicamba 560"))
data2without$cm = as.factor(data2without$cm)

sro = ggplot(data = data2without, aes(x = cm, y =  mass, group =  herbicide, label = round(mass,0))) +
  geom_line(aes(colour =  herbicide), size = 1) +
  geom_point(aes(colour =  herbicide), size = 3) +
  geom_label_repel() + 
  scale_colour_manual(values = c("#B2182B", "#D6604D", "#F4A582", "#E0E0E0", "#BABABA", "#878787", "#4D4D4D"
  )) + theme_classic() + theme(title=element_text(size=30),
                               axis.text = element_text(size=30),
                               legend.text = element_text(size=30))+
  ylim(0,100)+
  labs(
    title = "Effect of Dicamba and Clethodim in GR Volunteer Corn",
    subtitle = "(Without Non Ionic Surfactant)",
    y = "Biomass control (%)",
    colour = "Treatment",
    x = "Plant heigth at application (cm)")

ggsave("sro.png", plot = sro, dpi = 1200, width = 40, height = 20, units = "cm")


