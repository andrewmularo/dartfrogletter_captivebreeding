
library(tidyverse)
library(RColorBrewer)
library(ggpubr)


wd<- "C://Users/andre/OneDrive/Documents/Bernal Lab/Dendrobatids/Biodiversity_Editorial/Data"

setwd(wd)

dartfrog_data<- read.csv("CB_WC_Counts.csv") 



colors<- dartfrog_data %>% 
  group_by(Species, Color) %>% 
  summarize(total = sum(Count)) %>% 
  arrange(-total)



display.brewer.pal(n = 9, name = "Greys")
brewer.pal(n=9, "Greys")

origin_colors<- c("#FFFFFF", "#525252", "#000000")

p1<- ggplot(dartfrog_data, aes(x=reorder(Species, -Count), y=Count, fill = Origin))+
  geom_bar(stat="identity", color = "black")+
  theme_classic()+
  theme(axis.text.x = element_text(size = 20, angle = 70, hjust = 1.1, face = "italic", color = colors$Color),
        axis.text.y = element_text(size = 20, face = "bold"),
        axis.title.x = element_text(size = 25, face = "bold"),
        axis.title.y = element_text(size = 25, face = "bold"),
        legend.text = element_text(size = 15, face = "bold"),
        legend.title = element_text(size = 25, face = "bold"),
        title = element_text(size = 40, face = "bold"))+
  xlab("Species")+
  ylab("Number of Sources")+
  ggtitle(element_blank())+
  scale_fill_manual(values = origin_colors)
p1

ggsave("C://Users/andre/OneDrive/Documents/Bernal Lab/Dendrobatids/Biodiversity_Editorial/Letter/Figure1.jpeg", width = 25, height = 20, dpi=300)
