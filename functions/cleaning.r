# Defining the cleaning function
#to remove empty rows and columns, the comments, empty culmen lengths
#other columns not linked to culmen length
cleaning <- function(data_raw){
  data_raw %>%
    clean_names() %>%
    remove_empty(c("rows", "cols")) %>%
    select(-starts_with("delta")) %>%
    select(-comments) %>%
    filter(!is.na(culmen_length_mm)) %>%
    select(species, culmen_length_mm)
}