
### 
### testing routines for LA package
### 

library(la)

latest <- function(test, description) {
    if (!test) stop(description)
}

# -  -  -  -  -  -  -  -  -  -  -  -  -  -  
# testing something

a = c(2,1,1,1,0)
b = c(0,0,0,1,0)
latest( (round(cor(a,b),3) == 0), "[LA] - vector comparison");

