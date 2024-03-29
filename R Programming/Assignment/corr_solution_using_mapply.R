corr <- function(directory, threshold = 0) {

  filenames <- list.files(directory, pattern="*.csv", full.names=TRUE)
  
  c<-mapply(doshit,filenames,threshold)
  cvec<-as.vector(c)
  cvec <- cvec[!is.na(cvec)]
  
  return(cvec)
  
}


doshit <- function(fp,threshold=0) {
  
  if(fp!=0) {
    d <- read.csv(fp, header=T)
    
    #    and examine if it meets the threshold criterium
    ok <- complete.cases(d$sulfate,d$nitrate)
    
    if(sum(ok) > threshold) {
      d <- d[ok,]
      
      #    If the file meets the criterium, calculate correlation between nitrate and sulfate and append this to the correlation vector
      c<-cor(d$nitrate,d$sulfate)
      return(c)
    }
    else { return(NA) }
  }
}