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
data_field <- read_excel("C:/Users/vitor/Google Drive/Profissional/Vitor/PAT-Lab/CleDicamba_Daniel/analysis/data_field.xlsx", 
                         sheet = "r data")


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
)) + theme_classic() +
  ylim(0,100)+
  labs(
    title = "Effect of Dicamba and Clethodim in GR Volunteer Corn",
    subtitle = "(Non Ionic Surfactant add to tank mixture 0.25% v/v)",
    y = "% of mass in realtion to the check (%)",
    x = "Heigth when sprayed (cm)",
    caption = "First field trial 2019."
    
  )
ggsave("frw.png", plot = frw, dpi = 1200)



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
  )) + theme_classic() +
  ylim(0,100)+
  labs(
    title = "Effect of Dicamba and Clethodim in GR Volunteer Corn",
    subtitle = "(Non Ionic Surfactant add to tank mixture 0.25% v/v)",
    y = "% of mass in realtion to the check (%)",
    x = "Heigth when sprayed (cm)",
    caption = "Second field trial 2020."
    
  )
ggsave("srw.png", plot = srw, dpi = 1200)


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
  )) + theme_classic() +
  ylim(0,100)+
  labs(
    title = "Effect of Dicamba and Clethodim in GR Volunteer Corn",
    subtitle = "(Without Non Ionic Surfactant)",
    y = "% of mass in realtion to the check (%)",
    x = "Heigth when sprayed (cm)",
    caption = "First field trial 2019."
      )

ggsave("fro.png", plot = fro, dpi = 1200)


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
  )) + theme_classic() +
  ylim(0,100)+
  labs(
    title = "Effect of Dicamba and Clethodim in GR Volunteer Corn",
    subtitle = "(Without Non Ionic Surfactant)",
    y = "% of mass in realtion to the check (%)",
    x = "Heigth when sprayed (cm)",
    caption = "Second field trial 2020."
    )

ggsave("sro.png", plot = sro, dpi = 1200)

ggarrange(frw, fro, srw, sro, common.legend = TRUE)

col5 = ggarrange(frw + theme(title = element_blank(), axis.title.y = element_blank(), axis.title.x = element_blank()), 
                 fro + theme(title = element_blank(), axis.title.x = element_blank(), axis.title.y = element_blank()), 
                 srw + theme(title = element_blank(), axis.title.y = element_blank(), axis.title.x = element_blank()), 
                 sro + theme(title = element_blank(), axis.title.y = element_blank(), axis.title.x = element_blank()), 
                 common.legend = TRUE, ncol = 2, nrow = 2, labels = c("1st with NIS", "1st withou NIS", "2st with NIS", "2st withou NIS"), hjust = -8, vjust = 2)
col = annotate_figure(col5, left = text_grob("% of mass in realtion to the check (%)", color = "black", rot = 90), bottom = text_grob("Heigth when sprayed (cm)"))
ggexport(filename = "test.pdf")

ggexport(filename = "all.png", res = 1200)
