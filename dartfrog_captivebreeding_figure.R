library(tidyverse)
library(RColorBrewer)
library(ggpubr)


wd<- "C://Users/andre/OneDrive/Documents/Bernal Lab/Dendrobatids/Biodiversity_Editorial/Data"

setwd(wd)

dartfrog_data<- read.csv("CB_WC_Counts.csv") 

color1<- brewer.pal(n=3, name = "Set1")
color2<- brewer.pal(n=6, name = "RdYlGn")

p1<- ggplot(dartfrog_data, aes(x=reorder(Species, -Count), y=Count, fill = Origin))+
  geom_bar(stat = "identity")+
  theme_classic()+
  theme(axis.text.x = element_text(size = 15, angle = 90, face = "italic"),
        axis.text.y = element_text(size = 15, face = "bold"),
        axis.title.x = element_text(size = 25, face = "bold"),
        axis.title.y = element_text(size = 25, face = "bold"),
        legend.text = element_text(size = 15, face = "bold"),
        legend.title = element_text(size = 25, face = "bold"),
        title = element_text(size = 40, face = "bold"))+
  xlab("Species")+
  ggtitle("A")+
  scale_fill_brewer(palette = "YlOrRd")
  

p2<- ggplot(dartfrog_data, aes(x=reorder(Species, -Count), y=Count, fill = IUCN))+
  geom_bar(stat = "identity")+
  theme_classic()+
  theme(axis.text.x = element_text(size = 15, angle = 90, face = "italic"),
        axis.text.y = element_text(size = 15, face = "bold"),
        axis.title.x = element_text(size = 25, face = "bold"),
        axis.title.y = element_text(size = 25, face = "bold"),
        legend.text = element_text(size = 15, face = "bold"),
        legend.title = element_text(size = 25, face = "bold"),
        title = element_text(size = 40, face = "bold"))+
  xlab("Species")+
  ggtitle("B")+
  scale_fill_brewer(palette="RdYlGn")

ggarrange(p1, p2, ncol = 1, nrow = 2)
ggsave("C://Users/andre/OneDrive/Documents/Bernal Lab/Dendrobatids/Biodiversity_Editorial/Letter/Figure1.jpeg", width = 15, height = 20, dpi=300)
