function [L,f]=qiudao(w1,W2,P,Xtrain,tol,i,alpha,beta,gamma)
n=size(W2,1);
%%
G2=zeros(n,1);
for j=1:n
    a(j)=w1'*W2(:,j);
    b(j)=norm(w1)*norm(W2(:,j))*tol;
    sim(j)=a/b;
    A(j)=exp(sim(j));
    %%
    g2{j}=A(j)*(W2(:,j)*b(j)-a(j)*((w1'*w1)^(0.5))*w1*norm(W2(:,j))*tol)/(b(j)^2);
    G2=G2+g2{j};
end
B=sum(A);
G1=-B/A(i);
G3=(g2{i}*B-A(i)*G2)/(B^2);
L=G1*G3/(2*n)*alpha;
f=-log(A(i)/B)/(2*n)*alpha;
L=L+alpha*((2*(Xtrain*P*P'*Xtrain'*w1-Xtrain*P*P'*Xtrain(i,:)'))*beta+2*w1*gamma);
f=f+alpha*beta*norm(P'*Xtrain(i,:)'-P'*Xtrain'*w1)^2+gamma*norm(w1)^2;
end


