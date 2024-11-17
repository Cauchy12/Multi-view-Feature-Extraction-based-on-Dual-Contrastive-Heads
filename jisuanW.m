function [W,F]=jisuanW(R,X,tol,alpha,beta,gamma)
%t����������r����
%l=size(R,2);    
V=size(X,2);%%%%%%%%%�ж��Ӿ�����
for i=1:5
    indices1=find(R(:,i)==1);%%%%%%%%ѵ����
    indices2=find(R(:,i)==2);%%%%%%%%���Լ�
    for j=1:V
        T=X{j};%%%%%%%%%%%%��ȡ�Ӿ�����
        Xtrain{j}=T(indices1,:);
        Xtest{j}=T(indices2,:);
    end
    [W{i},F{i}]=iteration(Xtrain,tol,alpha,beta,gamma);   
end