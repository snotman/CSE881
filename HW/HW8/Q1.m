%NAN CAO A52871775
%CSE881 HW8 Q1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Q1a
P=[0.1, 0.2, 0.8,0.9, 1.0, 1.3, 1.8, 1.9];
K=[0, 0.3, 2];
for i=1:3    
    for n=1:8
        for k=1:3
         d(k,:)=(P-K(k)).^2;
        end
        ass(n)=min(find(d(:,n)==min(d(:,n))));

    end
    for k=1:3
        K(k)=mean(P(ass==k));
    end
ass
K
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Q1b
sum((P(ass==1)-K(1)).^2)+sum((P(ass==2)-K(2)).^2)+sum((P(ass==3)-K(3)).^2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Q1c
clear
P=[0.1, 0.2, 0.8,0.9, 1.0, 1.3, 1.8, 1.9];
K=[0,  2];
for i=1:2    
    for n=1:8
        for k=1:2
         d(k,:)=(P-K(k)).^2;
        end
        ass(n)=min(find(d(:,n)==min(d(:,n))));

    end
    for k=1:2
        K(k)=mean(P(ass==k));
    end
ass
K
end
SSE1=sum((P(ass==1)-K(1)).^2)
SSE2=sum((P(ass==2)-K(2)).^2)


clear
P=[0.1, 0.2, 0.8,0.9, 1.0];
K=[0.1 , 1];
for i=1:3    
    for n=1:5
        for k=1:2
         d(k,:)=(P-K(k)).^2;
        end
        ass(n)=min(find(d(:,n)==min(d(:,n))));

    end
    for k=1:2
        K(k)=mean(P(ass==k));
    end
ass
K
end

clear
P=[1.0, 1.3, 1.8, 1.9];
K=[1 , 1.9];
for i=1:3    
    for n=1:4
        for k=1:2
         d(k,:)=(P-K(k)).^2;
        end
        ass(n)=min(find(d(:,n)==min(d(:,n))));

    end
    for k=1:2
        K(k)=mean(P(ass==k));
    end
ass
K
end


clear
P=[0.1, 0.2, 0.8,0.9, 1.0, 1.3, 1.8, 1.9];
ass=[1  ,  1  ,  1  ,  1  ,  2  ,  2  ,  3  ,  3]
K=[0.5, 1.15,  1.85]
sum((P(ass==1)-K(1)).^2)+sum((P(ass==2)-K(2)).^2)+sum((P(ass==3)-K(3)).^2)
