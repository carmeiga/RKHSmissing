



  # X=read.csv('datn100p8.dat')
  # X=as.matrix(X[,-1])
  # 
  # Y<-rep(0,n)
  # Y<-2*X[,3]
  # X=X[1:50,]
  # Y=Y[1:50]
  # wcens=wcens[1:50,1:50]
  
  #executar dende aqui
  
  
  library("Rcpp")
  #setwd("C:/Users/Carlos M Garcia/Desktop/mfmissing")
  
  
  #install.packages("RcppProgress")
  library("RcppProgress") #hai que engadir tres li?as por rutina
  
  
  
  sourceCpp("ModelFreeVS.cpp")
  #install.packages("RcppProgress")
  
  setwd("~/repodir/RKHSmissing")
  
  #setwd("C:/Users/Carlos M Garcia/Google Drive/Marcos/missingdata/R/modelfreecensoredfinal")
  #setwd("/home/carlos/R")
  n=500
  p=30
  
  pesos=rep(1,n)
  wcens= pesos%*%t(pesos);
  wcens= wcens*n*(n-1)/2; 
  
  X<-matrix(0,nrow=n,ncol=p)
  
  
  
  
  for (i in 1:p) {
    X[,i]<-runif(n,0,10)
  }
  # 
  # Y<-2*X[,2]
  
  Y<-rep(0,n)
  Y<-2*X[,3]
  totaltime<-5
  numberclose<-4
  
  
  
  dim(wcens)
  dim(X)
  t=proc.time()
  res<-ModelFreeVS(X,Y,numberclose,totaltime,wcens)
  tempo=proc.time()-t
  #write.csv(X,'datn200p8.dat')
# library("profvis")
# 
# profvis(
#   res<-ModelFreeVS(X,Y,numberclose,10,wcens)
# ) non distingue entre subrutinas



