

plotting <- function(penguins_now_clean){
  penguins_now_clean %>%
    ggplot(aes(x = species, y = culmen_length_mm)) +
    geom_bar(stat="identity", width=0.5, color = "red")+
    ggtitle("Comparison of mean culmen length between penguin species")+
    labs(x="Penguin Species", y="Culmen Length (mm)")+
    scale_x_discrete(labels=c("Adelie","Chinstrap","Gentoo")) +
    theme(axis.text.x=element_text(angle=30, size=10, vjust=0.5))+
    theme(
      axis.title.x = element_text(vjust=-1),
      axis.title.y = element_text(vjust=4))
}




save_flipper_plot_svg <- function(penguins_now_clean, 
                                  filename, size, scaling){
  size_inches = size/2.54
  svglite(filename, width   = size_inches, 
          height  = size_inches, 
          scaling = scaling)
  barchart <- plotting(penguins_now_clean)
  print(barchart)
  dev.off()
}
