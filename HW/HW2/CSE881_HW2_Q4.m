%NAN CAO A52871775 
%CSE881 HW2 Q4 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
x1=train0(1:50,:)'; 
x2=train1(1:50,:)'; 
x3=train2(1:50,:)'; 
x4=train3(1:50,:)'; 
X=[x1,x2,x3,x4]'; 
X=im2double(X); 
% 1. Compute the distance between every pair of points and its median 
dist = pdist(X); 
med = median(dist); 
dist = squareform(dist); 
% 2. Set kernel parameter, gamma, based on median value of the distances 
gamma = 1/med^2; 
% 3. Create the Gaussian radial basis function kernel matrix: 
K = exp(-gamma * dist.^2); 
% 4. Sparsify the kernel matrix by keeping only its nearest neighbors 
numNeighbors = 20; 
numZeros = size(K,2) - numNeighbors - 1; 
M = size(K,1); 
[temp,I] = sort(K,2); 
J = repmat([1:M]',1,numZeros); 
I = sub2ind(size(K),J,I(:,1:numZeros)); 
K(I) = 0; 
% 5. Center the kernel matrix (read the supplementary notes). 
E=ones(size(K)); 
Kc =K-(1\M)*K*E-(1\M)*E*K-(1\M^2)*E*K*E; 
% 6. Extract a matrix W that contains the first two eigenvectors of the centered kernel matrix 
[Uk,Zk,Sk] = pca(Kc); 
rank=2; 
Wkc = Uk(:,1:2) 
% 7. Project each data point to its first two components 
V = Kc * Wkc 
% 8. Draw a scatter plot of the projected values. 
figure; 
set(gcf,'color','white'); 
plot(V(1:50,1),V(1:50,2),'r*'); % images for digit 0 is shown as * 
hold on 
plot(V(51:100,1),V(51:100,2),'b+'); % images for digit 1 is shown as + 
plot(V(101:150,1),V(101:150,2),'ko'); % images for digit 2 is shown as o 
plot(V(151:200,1),V(151:200,2),'gv'); % images for digit 3 is shown as triangles 
hold off 
saveas(gcf,'C:\Users\nan66\Dropbox\CSE881\HW2\digit_image_4','jpeg')