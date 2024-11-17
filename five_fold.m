function [Xre,Yre]=five_fold(X,Y,R)
l=size(R,2);    
V=size(X,2);%%%%%%%%%ÅÐ¶ÏÊÓ¾õ¸öÊý
for i=1:l
    ind1=find(R(:,i)==1);
    ind2=find(R(:,i)==2);
    for j=1:V
        T=X{j};
        Xre{i,1}{j}=T(ind1,:);
        Xre{i,2}{j}=T(ind2,:);
    end
    Yre{i,1}=Y(ind1,:);
    Yre{i,2}=Y(ind2,:);
end
        