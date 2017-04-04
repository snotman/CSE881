% NAN CAO CSE881 HW4
% set dir in nan's win lap
cd C:\Users\nan66\Dropbox\CSE881\HW4\;
%set dir in nan's linux lap
% cd /home/nan/Dropbox/CSE881/HW4;
%%%%%
%(a)
%%%%%
ONP=csvread('OnlineNewsPopularity.csv',1,0);
Pre=ONP(:,1:58);%col 1~58 as Predict Variable
Tar=ONP(:,59);%col 59 as the Response/Target Variable
Tar=log(Tar);
Tar=Tar(:);
Tar(Tar==-Inf)=0;
rPre=rank(Pre);%rank of Predict Matrix
a=0;%set 3 initial variables
b=0;
c=0;
for i=1:57
    for j=(i+1):58 % try all the possible combination of 2 columns
        A=Pre;
        A(:,j)=[];%remove the one with greater column number first
        A(:,i)=[];
        rA=rank(A);
        if rA==56;
            a=a+1;%use a to calculate the number of the possible ij
            b(a)=i;%save possible i
            c(a)=j;%save possible j
        end
    end
end
d=[b;c]';%show all the possible combination of removing
d
%Remove column 36(is it Su) and column 37(is it Weekend);
Pre1=Pre;
Rm=[36,37];
Pre1=Pre;
Pre1(:,Rm)=[];
rank(Pre1)
%%%%%
%(b)
%%%%%
Len=length(Tar);
TrainPre=Pre1(1:2000,:);
TrainTar=Tar(1:2000);
TestPre=Pre1(2001:Len,:);
TestTar=Tar(2001:Len);
sTrainPre=zscore(TrainPre);%standardize
sTestPre=zscore(TestPre);
% TrainTar=zscore(TrainTar);%standardize
% TestTar=zscore(TestTar);
TrainPre1 = [TrainPre ones(2000,1)]; % add a column of 1s
sTrainPre1 = [sTrainPre ones(2000,1)]; 
TestPre1 = [TestPre ones(Len-2000,1)]; 
sTestPre1 = [sTestPre ones(Len-2000,1)]; 
%MLR
wMLR=regress(TrainTar,sTrainPre1);
%lasso
[w,stats]=lasso(sTrainPre1,TrainTar,'Alpha',1,'CV',10);
Figure1=lassoPlot(w,stats,'PlotType','CV');
saveas(Figure1,'Q1b','jpeg');
wbest=w(:,stats.Index1SE');

%cal top 10
[a1,b1]=sort(abs(wMLR),'descend');
a1(1:10)
b1(1:10)
[a2,b2]=sort(abs(wbest),'descend');
a2(1:10)
b2(1:10)
%cal  predicted values
MLRPreVal=sTestPre1*wMLR;
CorMLR=corr(MLRPreVal,TestTar)
LasPreVal=sTestPre1*wbest;
CorLas=corr(LasPreVal,TestTar)
%%%%
%(c)
%%%%
Len=length(Tar);
TrainPre=Pre1(1:2000,:);
TrainTar=Tar(1:2000);
TestPre=Pre1(2001:Len,:);
TestTar=Tar(2001:Len);
lambda=0.001
%calculate alpha for function 'applyKernel'
 dist1 = pdist(sTrainPre); % calculate distance between every pair of points
 dist1 = squareform(dist1); % convert to square matrix
 K = exp(-(1e-7) * dist1.^2); % mu: kernel parameter (specified by user)
 alpha = inv(K + lambda*eye(2000)) * TrainTar;
pred = applyKernel(sTrainPre,TestPre, alpha,1e-7);
CorKer=corr(pred,TestTar)





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(d)
%%%%
Pre2=Pre1;
Pre2(:,18:29)=log(Pre2(:,18:29));
Pre2(Pre2==-Inf)=0;
Len=length(Tar);
TrainPre=Pre2(1:2000,:);
TrainTar=Tar(1:2000);
TestPre=Pre2(2001:Len,:);
TestTar=Tar(2001:Len);
sTrainPre=zscore(TrainPre);%standardize
sTestPre=zscore(TestPre);
TrainPre1 = [TrainPre ones(2000,1)]; % add a column of 1s
sTrainPre1 = [sTrainPre ones(2000,1)]; 
TestPre1 = [sTestPre ones(Len-2000,1)]; 
sTestPre1 = [sTestPre ones(Len-2000,1)]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MLR
wMLR=regress(TrainTar,sTrainPre1);
%lasso
[w,stats]=lasso(sTrainPre1,TrainTar,'Alpha',1,'CV',10);
Figure1=lassoPlot(w,stats,'PlotType','CV');
saveas(Figure1,'Q1d','jpeg');
wbest=w(:,stats.Index1SE');

% %cal top 10
% [a1,b1]=sort(abs(wMLR),'descend');
% a1(1:10)
% b1(1:10)
% [a2,b2]=sort(abs(wbest),'descend');
% a2(1:10)
% b2(1:10)
%cal  predicted values
MLRPreVal=sTestPre1*wMLR;
CorMLR2=corr(MLRPreVal,TestTar)
LasPreVal=sTestPre1*wbest;
CorLas2=corr(LasPreVal,TestTar)
%%%%
%(c)
%%%%
Len=length(Tar);
TrainPre=Pre1(1:2000,:);
TrainTar=Tar(1:2000);
TestPre=Pre1(2001:Len,:);
TestTar=Tar(2001:Len);
lambda=0.1;
%calculate alpha for function 'applyKernel'
 dist1 = pdist(sTrainPre); % calculate distance between every pair of points
 dist1 = squareform(dist1); % convert to square matrix
 K = exp(-(1e-7) * dist1.^2); % mu: kernel parameter (specified by user)
 alpha = inv(K + lambda*eye(2000)) * TrainTar;
pred = applyKernel(sTrainPre,TestPre, alpha,1e-7);
CorKer2=corr(pred,TestTar)
