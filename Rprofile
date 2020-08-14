##############################################
# Referências
# https://stackoverflow.com/questions/1189759/expert-r-users-whats-in-your-rprofile
# http://www.gettinggeneticsdone.com/2011/08/sync-your-rprofile-across-multiple-r.html
# https://www.statmethods.net/interface/customizing.html
# https://www.r-bloggers.com/fun-with-rprofile-and-customizing-r-startup/
# http://scs.math.yorku.ca/index.php/Rprofile
# http://r-br.2285057.n4.nabble.com/R-br-Rprofile-no-Linux-td3736241.html
# ideia do cara do link acima: fazer funções em docs diferentes e usar source(foo, local=.env())
# https://wiki.archlinux.org/index.php/R
# https://rseek.org/
# https://www.reddit.com/r/Rlanguage/

#----------------------------------
# GIT
# http://happygitwithr.com/

##############################################
# Mensagem inicial
cat("\n sessão nova começada em", date(), "\n \n")

##############################################
# PACOTES
# Don't ask me for my CRAN mirror every time
options("repos" = c(CRAN = "http://cran.rstudio.com/"))

##############################################
# .Last function

.Last <- function(){
 cat("\n Sessão Terminada em", date(), "\n")
}

message("\n*** Successfully loaded .Rprofile ***\n")
