#Bases
#https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html#Table_Styles
#https://rpubs.com/yutao/444395

#Load the libraries
library(dplyr)
library(kableExtra)
library(formattable)


# 30 cm
corn30 <- getURL("https://raw.githubusercontent.com/vitoranunciato/volunteercorncontrol/main/docs/data/corn30int.csv")
corn30 = read.csv(text = corn30)

corn30 %>%
  mutate(
  Average = color_bar("lightgreen")(Average),
  Interaction.1 = cell_spec(Interaction.1, "html", 
                            color = ifelse(Interaction.1 == "ANTAGONISTIC", "#d00000", 
                                           ifelse(Interaction.1 == "SYNERGIC", "lightgreen", 
                                                  "black"))),
  Interaction.2 = cell_spec(Interaction.2, "html", 
                            color = ifelse(Interaction.2 == "ANTAGONISTIC", "#d00000", 
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
  footnote(general = "The numbers in behind of the herbicide name represent the dose of the herbicide in g ai or g ae by hectare.",
           symbol = c("Add NIS dose 0.25% v/v."))%>%
  save_kable("30cm.png", zoom = 3)


# 60 cm
corn60 <- getURL("https://raw.githubusercontent.com/vitoranunciato/volunteercorncontrol/main/docs/data/corn60int.csv")
corn60 = read.csv(text = corn60)

corn60 %>%
  mutate(
    Average = color_bar("lightgreen")(Average),
    Interaction.1 = cell_spec(Interaction.1, "html", 
                              color = ifelse(Interaction.1 == "ANTAGONISTIC", "#d00000", 
                                             ifelse(Interaction.1 == "SYNERGIC", "lightgreen", 
                                                    "black"))),
    Interaction.2 = cell_spec(Interaction.2, "html", 
                              color = ifelse(Interaction.2 == "ANTAGONISTIC", "#d00000", 
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
  footnote(general = "The numbers in behind of the herbicide name represent the dose of the herbicide in g ai or g ae by hectare.",
           symbol = c("Add NIS dose 0.25% v/v."))%>%
save_kable("60cm.png", zoom = 3)

# 90 cm
corn90 <- getURL("https://raw.githubusercontent.com/vitoranunciato/volunteercorncontrol/main/docs/data/corn90int.csv")
corn90 = read.csv(text = corn90)

corn90 %>%
  mutate(
    Average = color_bar("lightgreen")(Average),
    Interaction.1 = cell_spec(Interaction.1, "html", 
                              color = ifelse(Interaction.1 == "ANTAGONISTIC", "#d00000", 
                                             ifelse(Interaction.1 == "SYNERGIC", "lightgreen", 
                                                    "black"))),
    Interaction.2 = cell_spec(Interaction.2, "html", 
                              color = ifelse(Interaction.2 == "ANTAGONISTIC", "#d00000", 
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
  footnote(general = "The numbers in behind of the herbicide name represent the dose of the herbicide in g ai or g ae by hectare.",
           symbol = c("Add NIS dose 0.25% v/v."))%>%
save_kable("90cm.png", zoom = 3)