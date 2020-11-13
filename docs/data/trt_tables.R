#Bases
#https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html#Table_Styles
#https://rpubs.com/yutao/444395

#Load the libraries
library(dplyr)
library(kableExtra)
library(formattable)
library(RCurl)


trt <- getURL("https://raw.githubusercontent.com/vitoranunciato/volunteercorncontrol/main/docs/data/treatments.csv")
trt = read.csv(text = trt)
trt[is.na(trt)] = "-"

trt %>%
  kable(escape = F, align = "c",  
        col.names = c("Clethodim (g ai/ha)",
                      "Dicamba (g ea/ha)",
                      "Non Ionic Surfactant v/v",
                      "Clethodim (g ai/ha)",
                      "Dicamba (g ea/ha)",
                      "Non Ionic Surfactant v/v"))%>%
  kable_styling(c("condensed", "hover", "striped"), full_width = F)%>%
  row_spec(0, bold = T, color = "#f5f1e7", background = "#d00000")%>%
  pack_rows("No mixture", 1, 4) %>%
  pack_rows("Mixture", 5, 7) %>%
  add_header_above(c("No Non Ionic Sufactant (NIS)" = 3, "Non Ionic Sufactant (NIS)" = 3))%>%
    footnote(general = "All solutions with DRA at 0.5% v/v",
           symbol = c("NIS = Non Ionic Surfactant."))%>%
    save_kable("trt.png", zoom = 3)
