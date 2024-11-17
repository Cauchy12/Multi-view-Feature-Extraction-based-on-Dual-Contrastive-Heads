function [L,f]=qiudao_p(Xtrain,P,W1,W2,tol,beta)
V=size(Xtrain,2);
[m1,n]=size(Xtrain{1}');
m2=size(Xtrain{2}',1);
%m3=size(Xtrain{3}',1);
X1=zeros(m1,n);
Y1=zeros(m2,n);
%Z1=zeros(m3,n);
X{1}=[Xtrain{1}';Y1];
X{2}=[X1;Xtrain{2}'];
%X{3}=[X1;Y1;Xtrain{3}'];
[D,D1]=size(P);
G2=zeros(D,D1);
L=zeros(D,D1);
f=0;
d2=zeros(1,n);
for v1=1:V
    for v2=1:V
        if v1~=v2
            G3=zeros(D,D1);
            for i=1:n
                
                %%
                a=X{v1}(:,i)'*P*P'*X{v2}(:,i);
                b1=norm(P'*X{v1}(:,i));
                b2=norm(P'*X{v2}(:,i));
                b=b1*b2*tol;
                c=a/b;%%%%%%%%%%%%���ƶȷ���
                A=exp(c);
                for j=1:n
                    aa=X{v1}(:,i)'*P*P'*X{v2}(:,j);
                    b21=norm(P'*X{v2}(:,j));
                    bb=b1*b21*tol;
                    cc=aa/bb;
                    d2(j)=exp(cc);
                    %%
                    a11=X{v1}(:,i)'*P*P'*X{v1}(:,i);e1=a11^(-0.5);
                    a12=X{v2}(:,j)'*P*P'*X{v2}(:,j);e2=a12^(-0.5);
                    a21=X{v1}(:,i)*X{v1}(:,i)'*P;
                    a22=X{v2}(:,j)*X{v2}(:,j)'*P;
                    a13=X{v2}(:,i)'*P*P'*X{v2}(:,i);e3=a13^(-0.5);
                    a23=X{v2}(:,i)*X{v2}(:,i)'*P;
                    g3=d2(j)*((X{v1}(:,i)*X{v2}(:,j)'+X{v2}(:,j)*X{v1}(:,i)')*P*bb-tol*(e1*a21*b21+e2*a22*b1)*aa)/(bb^2);%%%%%%%%%%%�󵼵�����
                    G3=G3+g3;
                end
                B=sum(d2);%%%%%%%%%%�ͷ�������ĸ
                G1=-B/A;%%%%%%%%%%%%�󵼵�һ��
                G2=A*((X{v1}(:,i)*X{v2}(:,i)'+X{v2}(:,i)*X{v1}(:,i)')*P*b-tol*(e1*a21*b2+e3*a23*b1)*a)/(b^2);%%%%%%%%%%%�󵼵ڶ���
                G4=(G2*B-G3*A)/(B^2);%%%%%%%�󵼵��Ĳ�
                G=G1*G4;
                L=L+G/(2*n);
                f1=-log(A/B)/(2*n);
                f=f+f1/(2*n);
            end
        end
    end
end
I=eye(n,n);
SL=X{1}*(I-W1-W1'+W1*W1')*X{1}'+X{2}*(I-W2-W2'+W2*W2')*X{2}';
L=L+2*(SL+SL')*P*beta;
f=f+2*trace(P'*SL*P)*beta;
end
