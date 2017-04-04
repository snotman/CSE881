Y=[
0 , 0.5840 , 0.1955 , 0.3815 , 0.1127;
0.5840 , 0 , 0.6132 , 0.4956 , 0.5733;
0.1955 , 0.6132 , 0 , 0.2390 , 0.3067;
0.3815 , 0.4956 , 0.2390 , 0 , 0.4694;
0.1127 , 0.5733 , 0.3067 , 0.4694 , 0;];
Y=squareform(Y)
Z1=linkage(Y,'single');
Z2=linkage(Y,'complete');
figure;
set(gcf,'color','white');
dendrogram(Z1);
title('single ink hierarchical clustering')
saveas(gcf,'C:\Users\nan66\Dropbox\CSE881\HW9\q1single','jpeg')
figure;
set(gcf,'color','white');
dendrogram(Z2);
title('complete ink hierarchical clustering')
saveas(gcf,'C:\Users\nan66\Dropbox\CSE881\HW9\q1complete','jpeg')


L=[
2 ,-1 ,-1 , 0 , 0 , 0 , 0;
-1, 2 ,-1 , 0 , 0 , 0 , 0;
-1,-1 , 3 ,-1 , 0 , 0 , 0;
0 , 0 ,-1 , 2 , 0 ,-1 , 0;
0 , 0 , 0 , 0 , 2 ,-1 ,-1;
0 , 0 , 0 ,-1 ,-1 , 3 ,-1;
0 , 0 , 0 , 0 ,-1 ,-1 , 2;];
[V,D] = eig(L);

Z=[0.3780,0.3780,0.3780,0.3780,0.3780,0.3780,0.3780;
-0.4440,-0.4440,-0.3251,-0.0000,0.4440,0.3251,0.4440;
-0.2808,-0.2808,0.1645,0.7941,-0.2808,0.1645,-0.2808];

K=[0.3780,0.3780,0.3780;
   -0.4044,0.4044,0;
   -0.1324,-0.1324,0.7941];
for i=1:4    
    for n=1:7
        for k=1:3
         d(k,n)=sum((Z(:,n)-K(:,k)).^2);
        end
        ass(n)=min(find(d(:,n)==min(d(:,n))));

    end
    for k=1:3
        K(k)=mean(Z(ass==k));
    end
ass
K
end


K=[0.3780,0.3780,0.3780;
   -0.4044,0.4044,0;
   -0.1324,-0.1324,0.7941];


W=[
2 , 0 , 0 ;
0 , 2 , 0 ;
0 , 0 , 3 ];

V=union(K(:,1),K(:,2),K(:,3))
for i=1:3

end
