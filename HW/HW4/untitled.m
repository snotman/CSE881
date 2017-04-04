TrainPre1 = [TrainPre ones(2000,1)]; % add a column of 1s
TestPre1 = [TestPre ones(2000,1)]; 
TestPre1 = [TestPre ones(Len-2000,1)]; 
TrainPre1 = [TrainPre ones(Len2000,1)]; 

%MLR
wMLR=regress(TrainTar,sTrainPre1);
%lasso
[w,stats]=lasso(sTrainPre1,TrainTar,'Alpha',1,'CV',10);
Figure1=lassoPlot(w,stats,'PlotType','CV');
saveas(Figure1,'Q1b','jpeg');
wbest=w(:,stats.Index1SE');