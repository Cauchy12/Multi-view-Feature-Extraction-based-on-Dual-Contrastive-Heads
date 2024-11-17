function [w1,F]=adam(w1,W2,P,Xtrain,tol,h,alpha,beta,gamma)
 mu=1e-3;
 maxIter=50;
 F(1)=0;
%%%%%%%%%%%%%%%%%%%%%%%adam
[m1,m2]=size(w1);
a=ones(m1,m2);
e=0.001;
rho1=0.9;
rho2=0.999;
A=1e-8*a;
s=0;
r=0;
t=0;
 for i=1:maxIter
     [L,f]=qiudao(w1,W2,P,Xtrain,tol,h,alpha,beta,gamma);
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
         w1=w1+w;
    end
 end
end
