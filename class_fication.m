function [AC_s,std_AC_s,AC_f,std_AC_f,Ac_f,Func]=class_fication(Xre,Yre,t1,t2,alpha,beta,gamma,D)
m=size(Xre,1);
V=2;
l=[10:10:D];
Dim=size(l,2);
Ac_s=zeros(Dim,V);Ac_f=zeros(Dim,m);Ac_s_1=zeros(Dim,m);Ac_s_2=zeros(Dim,m);%Ac_s_3=zeros(Dim,m);
for i=1:m
    [W,Func{i}]=iteration(Xre{i,1},t1,t2,alpha,beta,gamma);
    for d=1:Dim
        [ac_s(d,:),ac_f(d)]=accuracy(W,Xre{i,1},Xre{i,2},Yre{i,1},Yre{i,2},l(d));
        Ac_s_1(d,i)= ac_s(d,1);
        Ac_s_2(d,i)= ac_s(d,2);
        %Ac_s_3(d,i)= ac_s(d,3);            
    end
    Ac_s=Ac_s+ac_s;
    Ac_f(:,i)=ac_f;
end
AC_s=Ac_s/m;
AC_f=mean(Ac_f,2);
std_AC_f=std(Ac_f');
std_Ac_s_1=std(Ac_s_1');std_Ac_s_2=std(Ac_s_2');%std_Ac_s_3=std(Ac_s_3');
std_AC_s=[std_Ac_s_1',std_Ac_s_2'];%,std_Ac_s_3'];

        
    
