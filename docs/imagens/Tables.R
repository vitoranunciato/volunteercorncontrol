#Load the libraries
library(dplyr)
library(kableExtra)
library(formattable)


# 30 cm
corn30 <- read.csv("C:/Users/vitor/Google Drive/Presentations/Control of volunteer corn/volunteercorncontrol/docs/data/corn30int.csv")

corn30 %>%
  mutate(
  Average = color_bar("lightgreen")(Average),
  Interaction.1 = cell_spec(Interaction.1, "html", 
                            color = ifelse(Interaction.1 == "ANTAGONIC", "#d00000", 
                                           ifelse(Interaction.1 == "SYNERGIC", "lightgreen", 
                                                  "black"))),
  Interaction.2 = cell_spec(Interaction.2, "html", 
                            color = ifelse(Interaction.2 == "ANTAGONIC", "#d00000", 
                                           ifelse(Interaction.2 == "SYNERGIC", "lightgreen", 
                                                  "black"))))%>%
  kable(escape = F, align = "c",  
        caption = "Control of volunteer corn treated at height 30 cm, with a mixture of Clethodim and Dicamba.",
        col.names = c("Herbicide 1",
                      "Herbicide 2",
                      "Estimated",
                      "Observed",
                      "p-value",
                      "Interaction",
                      "Estimated",
                      "Observed",
                      "p-value",
                      "Interaction",
                      "Average"))%>%
  kable_styling(c("condensed", "hover", "striped"), full_width = F)%>%
  row_spec(0, bold = T, color = "#f5f1e7", background = "#d00000")%>%
  pack_rows("No NIS", 1, 3) %>%
  pack_rows("Add+ NIS*", 4, 6) %>%
  add_header_above(c("Treatment" = 2, "Field 2019" = 4, "Field 2020" = 4, " " = 1 ))%>%
  footnote(general = "The numbers in front of the herbicide name represent the dose of the herbicide in g ai or g ae by herctare.",
           symbol = c("Add NIS(R11) dose 0.25% v/v."))%>%
  save_kable("30cm.png", zoom = 3)


# 60 cm
corn60 <- read.csv("C:/Users/vitor/Google Drive/Presentations/Control of volunteer corn/volunteercorncontrol/docs/data/corn60int.csv")

corn60 %>%
  mutate(
    Average = color_bar("lightgreen")(Average),
    Interaction.1 = cell_spec(Interaction.1, "html", 
                              color = ifelse(Interaction.1 == "ANTAGONIC", "#d00000", 
                                             ifelse(Interaction.1 == "SYNERGIC", "lightgreen", 
                                                    "black"))),
    Interaction.2 = cell_spec(Interaction.2, "html", 
                              color = ifelse(Interaction.2 == "ANTAGONIC", "#d00000", 
                                             ifelse(Interaction.2 == "SYNERGIC", "lightgreen", 
                                                    "black"))))%>%
  kable(escape = F, align = "c",  
        caption = "Control of volunteer corn treated at height 60 cm, with a mixture of Clethodim and Dicamba.",
        col.names = c("Herbicide 1",
                      "Herbicide 2",
                      "Estimated",
                      "Observed",
                      "p-value",
                      "Interaction",
                      "Estimated",
                      "Observed",
                      "p-value",
                      "Interaction",
                      "Average"))%>%
  kable_styling(c("condensed", "hover", "striped"), full_width = F)%>%
  row_spec(0, bold = T, color = "#f5f1e7", background = "#d00000")%>%
  pack_rows("No NIS", 1, 3) %>%
  pack_rows("Add+ NIS*", 4, 6) %>%
  add_header_above(c("Treatment" = 2, "Field 2019" = 4, "Field 2020" = 4, " " = 1 ))%>%
  footnote(general = "The numbers in front of the herbicide name represent the dose of the herbicide in g ai or g ae by herctare.",
           symbol = c("Add NIS(R11) dose 0.25% v/v."))%>%
save_kable("60cm.png", zoom = 3)

# 90 cm
corn90 <- read.csv("C:/Users/vitor/Google Drive/Presentations/Control of volunteer corn/volunteercorncontrol/docs/data/corn90int.csv")

corn90 %>%
  mutate(
    Average = color_bar("lightgreen")(Average),
    Interaction.1 = cell_spec(Interaction.1, "html", 
                              color = ifelse(Interaction.1 == "ANTAGONIC", "#d00000", 
                                             ifelse(Interaction.1 == "SYNERGIC", "lightgreen", 
                                                    "black"))),
    Interaction.2 = cell_spec(Interaction.2, "html", 
                              color = ifelse(Interaction.2 == "ANTAGONIC", "#d00000", 
                                             ifelse(Interaction.2 == "SYNERGIC", "lightgreen", 
                                                    "black"))))%>%
  kable(escape = F, align = "c",  
        caption = "Control of volunteer corn treated at height 90 cm, with a mixture of Clethodim and Dicamba.",
        col.names = c("Herbicide 1",
                      "Herbicide 2",
                      "Estimated",
                      "Observed",
                      "p-value",
                      "Interaction",
                      "Estimated",
                      "Observed",
                      "p-value",
                      "Interaction",
                      "Average"))%>%
  kable_styling(c("condensed", "hover", "striped"), full_width = F)%>%
  row_spec(0, bold = T, color = "#f5f1e7", background = "#d00000")%>%
  pack_rows("No NIS", 1, 3) %>%
  pack_rows("Add+ NIS*", 4, 6) %>%
  add_header_above(c("Treatment" = 2, "Field 2019" = 4, "Field 2020" = 4, " " = 1 ))%>%
  footnote(general = "The numbers in front of the herbicide name represent the dose of the herbicide in g ai or g ae by herctare.",
           symbol = c("Add NIS(R11) dose 0.25% v/v."))%>%
save_kable("90cm.png", zoom = 3)