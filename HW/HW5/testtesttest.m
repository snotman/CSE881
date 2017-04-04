clear;
%set dir
cd ***/*****/*****/*****/.;
A = load('spambase.data');
N = size(A, 1);
% seed = 10; 
% rng(seed); 
% A = A(randperm(N),:); 
A=load('load1.txt');
N=length(A);
% indices = crossvalind('Kfold',N,10);%outer loop
indices = load('load2.txt');
X=A(:,1:57);
Y=A(:,58);
%-----------------------------------------------------------------------------------------------
%linear
lambda = logspace(-3,3,11); % create a set of lambda values
sigma = logspace(-3,3,11); % create a set of kernel scale values
cvloss = zeros(11,11); % stores the CV error for each (lambda,sigma) pair
CPER1=0
Lam1=0
%------------------------------------------------------
k=1
%k=2,3,4,5,6,7,8,8,9,10
%------------------------------------------------------
% for k=1:10
testLocation = (indices == k); 
trainLocation = ~testLocation; 
Xtrain = X(trainLocation,:);
Ytrain = Y(trainLocation);
Xtest = X(testLocation,:);
Ytest = Y(testLocation);
for i=1:11
for j=1:11
SVMmodel = fitcsvm(Xtrain, Ytrain, 'KernelFunction','RBF','KernelScale',sigma(j),'BoxConstraint',lambda(i),'Kfold', 5);
cvloss(i,j)=kfoldLoss(SVMmodel);
end;
end;
mincvloss=min(cvloss);
[a,b]=find(cvloss==mincvloss(1));
i1=min(a);
j1=min(a);
bestLambda=lambda(i1);
bestSigma=sigma(j1);
SVMmodel = fitcsvm(Xtrain, Ytrain,'KernelFunction','RBF','KernelScale',bestSigma,'BoxConstraint',bestLambda);
pred = predict(SVMmodel, Xtest);
cp = classperf(Ytest);
classperf(cp,pred);
cp.DiagnosticTable % to show the confusion matrix
cp.ErrorRate % to show the classification error
Lam(k)=bestLambda;
Sig(k)=bestSigma
% end;


Sigma=sum(Sig)/10;
Lam=sum(Lam)/10;
SVMmodel= fitcsvm(X, Y,'KernelFunction','RBF','KernelScale',Sigma,'BoxConstraint',Lam);
pred= predict(SVMmodel, X);
cp=classperf(Y);
classperf(cp,pred);
cp.DiagnosticTable
cp.ErrorRate