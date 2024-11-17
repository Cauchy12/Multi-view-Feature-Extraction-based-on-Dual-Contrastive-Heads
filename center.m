function xtrain=center(Xtrain)
n=size(Xtrain,2);
for i=1:n
    [a,b]=size(Xtrain{i});
    e=ones(a,1);
    xtrain{i}=Xtrain{i}-(1/a)*e*e'*Xtrain{i};
end