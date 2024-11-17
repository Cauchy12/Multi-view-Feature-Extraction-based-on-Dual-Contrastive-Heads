function [P,F]=iteration(Xtrain,t1,t2,alpha,beta,gamma)
V=size(Xtrain,2);
n=size(Xtrain{1},1);
I=eye(n,n);
%% %%%%%%%%%%%%%%%%%%%
p1=pca(Xtrain{1});
p2=pca(Xtrain{2});
P0=[p1;p2];
%% %%%%%%%%%%%%%%%%%%%%%
for v=1:V
    W{v}=inv(I+Xtrain{v}*Xtrain{v}')*(Xtrain{v}*Xtrain{v}');
end
%% %%%%%%%%%%%%%%%%%%%%%
for t=1:5
    f4=0;
    [P,f1]=CLCCA(Xtrain,P0,W{1},W{2},t1,beta);
    for i=1:n
        [W{1}(:,i),f2]=adam(W{1}(:,i),W{2},P{1},Xtrain{1},t2,i,alpha,beta,gamma);
        [W{2}(:,i),f3]=adam(W{2}(:,i),W{1},P{2},Xtrain{2},t2,i,alpha,beta,gamma);
        f4=min(f2)+min(f3);
    end
    F(t)=min(f1)+f4;
    if (t>=2)&&(F(t)-F(t-1)<=0.001)
        break;
    else
        P0=[P{1};P{2}];
    end
end
end
