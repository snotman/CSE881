cd C:\Users\nan66\Dropbox\CSE881\HW8\;
Price = load('prices.txt');
Stock = load('sp500.class');
Class = fileread('classes.txt');
rng(1)
[clusters,centroids]=kmeans(Price,10,'Replicates',500);
CfMat3d=confusionmat(Stock,clusters);
rng(1)
[clusters2,centroids2]=kmeans(Price,10,'Distance','correlation','Replicates',5);
CfMat3f=confusionmat(Stock,clusters2);
CorrectRate3d=trace(CfMat3d)/sum(CfMat3d(:))
CorrectRate3f=trace(CfMat3f)/sum(CfMat3f(:))