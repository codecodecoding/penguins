plotting <- function(penguins_now_clean){
  penguins_now_clean %>%
    ggplot(aes(x = species, y = culmen_length_mm)) +
    geom_bar(stat="identity", width=0.5, color = "red")+
    ggtitle("Comparison of mean culmen length between penguin species")+
    labs(x="Penguin Species", y="Culmen Length (mm)")+
    scale_x_discrete(labels=c("Adelie","Chinstrap","Gentoo")) +
    #scale_colour_manual(values=c("#66CC99", "#CC66CC"))+
    theme(axis.text.x=element_text(angle=30, size=10, vjust=0.5))+
    theme(
      axis.title.x = element_text(vjust=-1),
      axis.title.y = element_text(vjust=4))
}