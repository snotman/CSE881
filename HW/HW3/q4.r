a1<-c(10,3,8,9,6,5,4,2,1,7)
a2<-c(3,9,7,5,4,2,6,8,1,10)
a3<-c(4,2,3,1,7,5,6,9,8,10)
a4<-c(6,4,3,10,7,8,5,9,1,2)
a5<-c(9,6,8,5,1,4,7,2,3,10)
a6<-c(10,1,4,6,9,2,7,3,8,5)
d1<-c(1,1,1,0,0,0,1,0,1,1)
d2<-c(0,1,1,1,0,1,1,1,0,1)
d3<-c(0,0,1,1,0,0,1,0,0,0)
d4<-c(0,1,0,0,0,1,1,1,0,1)
a<-t(matrix(c(t(a1),t(a2),t(a3),t(a4),t(a5),t(a6)),10,6))
d<-t(matrix(c(t(d1),t(d2),t(d3),t(d4)),10,4))
m<-matrix(0,24,10)
for(i in 1:6){
    for(k in 1:4){
    	dd<-d[k,]
       	t=4*i-4+k
    	m[t,]<-dd[a[i,]]
    }
}