#r script for SLRE-APIS project (2019 sampling)

#Install packages
library(ggplot2)
#Programs

#Color vectors
S_col_vec<-c("#386cb0","#f0027f")
Tax_col_vec<-c("#1b9e77","#d95f02","#7570b3")
#Upload dataset
slReCop<-read.csv("~/Documents/MFCycloCalaHarpAPIS19_rev.csv", sep = ",", header = T )
names(slReCop)
levels(slReCop$Species)
#Clean dataset
#Create different datasets for each time point
levels(slReCop$ID)
slReCop_SS1<-subset(slReCop, ID=="south shore 1")
slReCop_SS2<-subset(slReCop, ID=="south shore 2")
slReCop_SS3<-subset(slReCop, ID=="south shore 3")
slReCop_Cal<-subset(slReCop, TaxonomicGroup=="AdultCalanoids")
slReCop_Cal$Species<-droplevels(as.factor(slReCop_Cal$Species))
str(slReCop_Cal)
slReCop_Cyc<-subset(slReCop, TaxonomicGroup=="AdultCyclopoids")
slReCop_Cyc$Species<-droplevels(as.factor(slReCop_Cyc$Species))
slReCop_Har<-subset(slReCop, TaxonomicGroup=="AdultHarpacticoids")
slReCop_Har$Species<-droplevels(as.factor(slReCop_Har$Species))
#Visualize whole dataset
ggplot(slReCop, aes(x=Species, y=DensityNumperm3, color=Sex)) +
  geom_bar(stat="identity")+
  ylab("Density (#/m3)")+
  scale_color_manual(values=S_col_vec)+
  facet_grid(Time_point~Site)+
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        axis.title.x=element_text(size=16),axis.title.y=element_text(size=16),
        axis.text.x=element_text(size=14),axis.text.y = element_text(size=14),
        legend.title=element_text(size=16),legend.text = element_text(size=14))
ggplot(slReCop, aes(x=Site, y=DensityNumperm3, color=Sex)) +
  geom_bar(stat="identity")+
  ylab("Density (#/m3)")+
  scale_color_manual(values=S_col_vec)+
  facet_grid(Time_point~TaxonomicGroup)+
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        axis.title.x=element_text(size=16),axis.title.y=element_text(size=16),
        axis.text.x=element_text(size=14),axis.text.y = element_text(size=14),
        legend.title=element_text(size=16),legend.text = element_text(size=14))
ggplot(slReCop, aes(x=Site, y=DensityNumperm3, fill=TaxonomicGroup)) +
  geom_bar(stat="identity")+
  ylab("Density (#/m3)")+
  scale_fill_manual(values=Tax_col_vec)+
  facet_grid(Time_point~Sex)+
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        axis.title.x=element_text(size=16),axis.title.y=element_text(size=16),
        axis.text.x=element_text(size=14),axis.text.y = element_text(size=14),
        legend.title=element_text(size=16),legend.text = element_text(size=14))
#Visulaize based on taxonomic group
ggplot(slReCop_Cal, aes(x=Species, y=DensityNumperm3, color=Sex)) +
  geom_bar(stat="identity")+
  ylab("Density (#/m3)")+
  scale_color_manual(values=S_col_vec)+
  facet_grid(Time_point~Site)+
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        axis.title.x=element_text(size=16),axis.title.y=element_text(size=16),
        axis.text.x=element_text(size=14),axis.text.y = element_text(size=14),
        legend.title=element_text(size=16),legend.text = element_text(size=14))
ggplot(slReCop_Cal, aes(x=Site, y=DensityNumperm3, color=Sex)) +
  geom_bar(stat="identity")+
  ylab("Density (#/m3)")+
  scale_color_manual(values=S_col_vec)+
  facet_grid(Time_point~Species,scales="free_y")+
  theme(panel.background = element_rect(fill = "white", colour = "grey50"),
        axis.title.x=element_text(size=16),axis.title.y=element_text(size=16),
        axis.text.x=element_text(size=14),axis.text.y = element_text(size=14),
        legend.title=element_text(size=16),legend.text = element_text(size=14))
