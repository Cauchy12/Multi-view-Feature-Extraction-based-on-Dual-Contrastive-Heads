function [P,F]=CLCCA(Xtrain,W,S1,S2,tol,beta)
 V=size(Xtrain,2);%ï¿½Ó¾ï¿½ï¿½ï¿½ï¿½ï¿½
 mu=1e-3;
 maxIter=50;
 F(1)=0;
%[W]=PCA(Xtrain);%ï¿½ï¿½ï¿½ï¿½ï¿½Ö?
[m1,m2]=size(W);
a=ones(m1,m2);
%%%%%%%%%%%%%%%%%%%%%%%adamï¿½ï¿½Ê¼ï¿½ï¿½
e=0.001;
rho1=0.9;
rho2=0.999;
A=1e-8*a;
s=0;
r=0;
t=0;
 for i=1:maxIter
     [L,f]=qiudao_p(Xtrain,W,S1,S2,tol,beta);
     F(i+1)=f;
     C=F(i)-F(i+1);   
     if C<mu&&i>=2
        break
     else
         t=t+1;
         s=rho1*s+(1-rho1)*L;
         r=rho2*r+(1-rho2)*(L.*L);
         S=s/(1-rho1^t);  
         R=r/(1-rho2^t);
         w=-e*(S./(R.^0.5+A));
         W=W+w;
    end
end
W_1=real(W);[a1,b]=size(W_1);
c=a1/V;
for r=1:V
    P{r}=W_1((r-1)*c+1:r*c,:);
end
end

    
     
 
