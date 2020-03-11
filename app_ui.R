source("shiny_scripts/page_one.R")
source("shiny_scripts/interact_one.R")
source("shiny_scripts/interact_two.R")
source("shiny_scripts/conclusion.R")

my_ui <- navbarPage(
  "Understanding Twitter",
  page_1,         
  page_two, 
  page_three
  ,
  # page_four,
  page_five
)
