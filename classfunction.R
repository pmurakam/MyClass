################################################################################
## Copyright (C) 2010 Peter Murakami <peter.murakami@gmail.com>
## 
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
################################################################################


#This function converts your variable to the class specified by 
#'whatclass':
goodclass <- function(x,whatclass,...){
    stopifnot(whatclass%in%c("character","factor","numeric","integer","number"))
    if(whatclass=="character") return(as.character(x))
    if(whatclass=="factor")    return(factor(x,...))
    if(whatclass%in%c("numeric","integer","number")){
        if(any(is.na(as.numeric(as.character(na.omit(x)))))) stop("Cannot make non-numeric values numeric.")
        if(inherits(x,"factor")) x = as.numeric(levels(x))[x] else x = as.numeric(x)
        if(whatclass=="integer" & all(x%%1==0,na.rm=TRUE)) x = as.integer(x)
    }
    return(x)
}
