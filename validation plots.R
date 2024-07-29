library(readr)
library(writexl)
library(ggplot2)
library(ggsignif)
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(plotly)
library(htmlwidgets)
library(gtools)
library(abind)
library(fractaldim)
library(ie2misc)
library(multimode)
library(car)
library(emmeans)
library(lmerTest)
library(ggpmisc)
library(DescTools)
library(entropy)
library(readxl)
library(ggridges)
library(ggpubr)
library(philentropy)
library(ohenery)
library(Rfast)
library(umap)
library(coin)

# path = "/Users/manna/Documents/git/Genetics_of_learning_individuality/"
path = "/Users/riddha/git/Genetics_of_learning_individuality/"
setwd(path)

to_col<-function(x){
  if(x=='shock'){return('gold')}
  if(x=='noShock'){return('darkgray')}
}

activity_filter <- function(exp,cutoff){
  return(quantile(df$activity[df$group==exp],cutoff,na.rm = TRUE))
}

df = read.csv("/Users/riddha/git/Genetics_of_learning_individuality/validation/summary_cL_green.csv",header = TRUE)
exps = unique(df$group)
exps_mf = c(str_c(exps,"_male"),str_c(exps,"_female"))
l=combinations(length(exps),2,exps)
comparison_mat = l[unlist(strsplit(l[,1],"_"))[seq(1,length(unlist(strsplit(l[,1],"_"))),2)]==unlist(strsplit(l[,2],"_"))[seq(1,length(unlist(strsplit(l[,1],"_"))),2)],]

for(i in 1:length(df$id)){
  activity_cutoff_low = activity_filter(df$group[i],0.05)
  activity_cutoff_high = activity_filter(df$group[i],1)
  activity = df$activity[i]
  frac_time_on_shocked = df$frac_time_on_shocked[i]
  id = as.integer(df$id[i])
  if(is.na(activity) || is.na(frac_time_on_shocked) || activity<activity_cutoff_low || activity>activity_cutoff_high || frac_time_on_shocked<=0.0 || frac_time_on_shocked>0.75)# || id>32)
  {
    df$frac_time_on_shocked[i] = NA
  }
  
}

ds = df[df$treatment=="shock",]
dnS = df[df$treatment=="noShock",]
df$p.value = 1
df$effS = 0
for(e in unique(df$genotype)){
  df[df$genotype == e,]$effS = CohenD(dnS[str_detect(dnS$genotype,e),]$frac_time_on_shocked,ds[str_detect(ds$genotype,e),]$frac_time_on_shocked,na.rm=T)[1]
  df[df$genotype==e,]$p.value = t.test(dnS[str_detect(dnS$genotype,e),]$frac_time_on_shocked,ds[str_detect(ds$genotype,e),]$frac_time_on_shocked,na.rm=T)$p.value
}

p=ggplot(df, aes(x=reorder(group,effS/p.value, decreasing=T), y=frac_time_on_shocked))+
  ylab(bquote(bold(atop('Task performance', '(T'['shocked']*')'))))+
  ylim(-0.01,0.75) +
  geom_boxplot(outlier.shape = NA) +
  geom_hline(yintercept = 1/2, linetype = "dashed", lwd=2) +
  scale_fill_viridis(discrete = TRUE, alpha=0.6) +
  # geom_point(shape=19,aes(label = id))+
  # geom_text(label=df$id,position=position_jitter(width=0.3,height=0.0))+
  geom_jitter(shape=19,position=position_jitter(0.2)
              ,color = lapply(df$treatment,to_col),
              size=3
  ) +
  #geom_label(aes(label = id),x_nudge=2)+
  #theme_ipsum() +
  stat_summary(fun=mean, geom="pointrange", shape=3, size=3, color="red") +
  scale_x_discrete(labels = c(expression(bold("Wild-type")), expression(bold("")), expression(bold('  dnc'^'1')),expression(bold("")),expression(bold(' norpA'^'EE5')),expression(bold(""))))+
  theme_minimal()+
  theme(axis.text.x = element_text( size = 32, face='bold', hjust = 0.1))+
  theme(axis.text.y = element_text(size = 32, face='bold'))+
  theme(plot.title = element_text(size = 16, face='bold'))+
  theme(axis.title.x = element_blank())+
  theme(axis.title.y = element_text(size = 48, face='bold'))+
  stat_signif(comparisons = as.list(as.data.frame(t(comparison_mat))),
              # na.rm = FALSE,
              map_signif_level=c("***"=0.001,"**"=0.01, "*"=0.05, "N.S."=2),
              test = "t.test",
              step_increase = 0,
              y_position = 0.7,
              textsize = 8,
              fontface = 'bold'
  )

png('generated_plots/cL_green.png',800,800)
print(p)
dev.off()
print(p)
