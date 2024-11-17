function [ACCURACY]=parameter(X,Y,R,D)
%X=center(X);
[Xre,Yre]=ten_fold(X,Y,R);
T1=[1e-2,1e-1,1e0,1e1,1e2,1e3];
T2=[1e-2,1e-1,1e0,1e1,1e2,1e3];
Alpha=[10^-6,10^-4,10^-2,10^0,10^2,10^4,10^6];
Beta=[0.001,0.01,1,100,10000];
Gamma=[0.0001,0.01,1,100,10000];
s=1
for t1=1:6
    for t2=1:6
        for A=4:4
            for B=3:3
                for G=3:3
                    tic;
                    [AC_s,std_AC_s,AC_f,std_AC_f,Ac_f,Func]=class_fication(Xre,Yre,T1(t1),T2(t2),Alpha(A),Beta(B),Gamma(G),D);
                    ACCURACY{s,1}=T1(t1);
                    ACCURACY{s,2}=T2(t2);
                    ACCURACY{s,3}=Alpha(A);
                    ACCURACY{s,4}=Beta(B);
                    ACCURACY{s,5}=Gamma(G);
                    %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    ACCURACY{s,6}=AC_s;
                    ACCURACY{s,7}=std_AC_s;
                    a=mean(AC_s,2);
                    ACCURACY{s,8}=a;
                    ACCURACY{s,9}=max(a);
                    ACCURACY{s,10}=find(a==max(a));
                    %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    ACCURACY{s,11}=AC_f;
                    ACCURACY{s,12}=std_AC_f;
                    ACCURACY{s,13}=max(AC_f);
                    ACCURACY{s,14}=find(AC_f==max(AC_f));
                    ACCURACY{s,15}=Ac_f;
                    %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                    ACCURACY{s,16}=Func;
                    save BBC_tr25
                    toc;
                    s=s+1
                end
            end
        end
    end
end
end