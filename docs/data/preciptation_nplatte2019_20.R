#Bases
#https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html#Table_Styles
#https://rpubs.com/yutao/444395

#Load the libraries
library(dplyr)
library(kableExtra)
library(formattable)
library(RCurl)


precp <- getURL("https://raw.githubusercontent.com/vitoranunciato/volunteercorncontrol/main/docs/data/preciptation_northplatte2019_20.csv")
precp = read.csv(text = precp)
precp$month = factor(precp$month, levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

rain = ggplot(data = precp, aes(x = month, y = precip, group = year, colour = year)) +
  geom_line(size = 1.5) +
  geom_point(size = 2) +
  theme_classic()+
  annotate("rect", xmin = "Jun", xmax = "Oct", ymin = -Inf, ymax = Inf,
           alpha = .2, fill = "#d00000")+
  annotate(geom="text", x="Aug", y=170, label="Experiment period",
           color="white", fontface = 'bold', size = 5)+
  scale_colour_manual(values = c("#B2182B", "#000000", "#BABABA"))+
  labs(title = "Total monthly precipitation in North Platte, Nebraska",
       x = "Month", y = "Monthly Precipitation (mm)", 
       caption = "Total year precipitation 2019 = 807.47 mm, 2020 = 347.73, historical = 513.59.",
       colour = "Year")+
  theme(title=element_text(size=10),
        axis.text = element_text(size=10),
        legend.text = element_text(size=10))

ggsave("rain.png", plot = rain, dpi = 1200, width = 20, height = 10, units = "cm")

