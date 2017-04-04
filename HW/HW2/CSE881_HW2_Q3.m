%NAN CAO A52871775
%CSE881 HW2 Q3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(a)
x1=train0(1:50,:)';
x2=train1(1:50,:)';
x3=train2(1:50,:)';
x4=train3(1:50,:)';
X=[x1,x2,x3,x4]';
X=im2double(X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(b)
N = 50; % number of images associated with each digit
numCols = 10;
numRows = ceil(4*N/numCols);
d = sqrt(size(X,2));
figure;
set(gcf,'color','white');
set(gcf,'Position',[520,85,800,720]);%resize the plot
for i=1:size(X,1);
subplot(numRows,numCols,i);
img = reshape(X(i,:),d,d)'; % convert each row
imagesc(img); % plot the image
set(gca,'xtick',[]);
set(gca,'ytick',[]);
end;
colormap(gray) ;% convert the images into gray scale
saveas(gcf,'C:\Users\nan66\Dropbox\CSE881\HW2\digit_image_3b','jpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(c)
[U,Z,S] = pca(X);
X1=U(:,1)';%first comp
d1 = sqrt(size(X1,2));
figure;
set(gcf,'color','white');
set(gcf,'Position',[520,85,800,600]);
img = reshape(X1,d1,d1)';
imagesc(img); 
set(gca,'xtick',[]);
set(gca,'ytick',[]);
colormap(gray) ;
saveas(gcf,'C:\Users\nan66\Dropbox\CSE881\HW2\digit_image_3c1','jpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X2=U(:,2)';%first comp
d2 = sqrt(size(X2,2));
figure;
set(gcf,'color','white');
set(gcf,'Position',[520,85,800,600]);
img = reshape(X2,d2,d2)';
imagesc(img); 
set(gca,'xtick',[]);
set(gca,'ytick',[]);
colormap(gray) ;
saveas(gcf,'C:\Users\nan66\Dropbox\CSE881\HW2\digit_image_3c2','jpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(d)
figure;
set(gcf,'color','white');
plot(Z(1:50,1),Z(1:50,2),'r*'); % images for digit 0 is shown as *
hold on
plot(Z(51:100,1),Z(51:100,2),'b+'); % images for digit 1 is shown as +
plot(Z(101:150,1),Z(101:150,2),'ko'); % images for digit 2 is shown as o
plot(Z(151:200,1),Z(151:200,2),'gv'); % images for digit 3 is shown as triangles
hold off
colormap(gray) ;% convert the images into gray scale
saveas(gcf,'C:\Users\nan66\Dropbox\CSE881\HW2\digit_image_3d','jpeg')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%(e)
rank = 2;
W = Z(:,1:rank)*diag(S(1:rank))*U(:,1:rank)';
d3 = sqrt(size(W,2));
figure;
set(gcf,'color','white');
set(gcf,'Position',[520,85,1020,720]);
for i=1:size(W,1);
subplot(numRows,numCols,i);
img = reshape(W(i,:),d3,d3)'; 
imagesc(img); 
set(gca,'xtick',[]);
set(gca,'ytick',[]);
end;
colormap(gray) ;% convert the images into gray scale
saveas(gcf,'C:\Users\nan66\Dropbox\CSE881\HW2\digit_image_3e','jpeg')
%%%%%%%%%%%%%%%%%%%%%%%%
%(f)
rank = 50;
W50 = Z(:,1:rank)*diag(S(1:rank))*U(:,1:rank)';
N = 50; % number of images associated with each digit
d4 = sqrt(size(W50,2));
figure;
set(gcf,'color','white');
set(gcf,'Position',[520,85,1020,720]);
for i=1:size(W50,1);
subplot(numRows,numCols,i);
img = reshape(W50(i,:),d4,d4)'; 
imagesc(img); 
set(gca,'xtick',[]);
set(gca,'ytick',[]);
end;
colormap(gray);
saveas(gcf,'C:\Users\nan66\Dropbox\CSE881\HW2\digit_image_3f','jpeg')
