# MyClass
An R function for easy class conversion

Description:  
This function is a quick and safe way to convert the class of a scalar or vector variable.  
It can convert to character, factor, numeric, or integer, but is of most use when converting 
to numeric or integer, when there can be problems with converting from factors if not done right.

Usage:  
```
goodclass(x,whatclass)
```

Arguments:
```
x         - scalar or vector variable
whatclass - desired class
```

Example:
```
dat <- data.frame(cbind(letters[1:10],seq(1,5.5,by=.5)))
dat$col3 <- as.numeric(1:10)
dat$col4 <- factor(11:20)
dat$col5 <- factor(21:30)
dat$col6 <- seq(6,10.5,by=.5)
dat$col7 <- factor(rep(c("A","B"),5),levels=c("B","A"))
for(j in 1:ncol(dat)) print(class(dat[,j]))
classes <- c("character","numeric","integer","number","numeric","number","factor")
for(j in 1:ncol(dat)) dat[,j] <- goodclass(dat[,j],classes[j])
for(j in 1:ncol(dat)) print(class(dat[,j]))
levels(dat$col7) #factor levels are retained as well.
```
