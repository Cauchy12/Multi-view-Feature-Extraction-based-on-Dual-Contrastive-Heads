function [ac_s,ac_f]=accuracy(W,Xtrain,Xtest,Ytrain,Ytest,d)
%ac_s单视角结果1*3，ac_f多视角结果
V=size(Xtrain,2);%%%%%%%%%判断视觉个数
xtr_f=zeros(size(Ytrain,1),d);xte_f=zeros(size(Ytest,1),d);
for i=1:V
    Xtr{i}=Xtrain{i}*W{i}(:,1:d);
    xtr_f=xtr_f+Xtr{i};
    Xte{i}=Xtest{i}*W{i}(:,1:d);
    xte_f=xte_f+Xte{i};
    ac_s(i)=test(Xtr{i},Xte{i},Ytrain,Ytest);
end
ac_f=test(xtr_f,xte_f,Ytrain,Ytest);
end

function [ac]=test(xtr,xte,ytr,yte)
mdl=ClassificationKNN.fit(xtr,ytr,'NumNeighbors',1);
p_label=predict(mdl,xte);
n=size(yte,1);
ac=sum(p_label==yte)/n;   
end
    