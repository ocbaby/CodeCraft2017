function [n,Sw,Sc,s] = construct( W,C,consumer,need )

s=sum(need);
n=length(W);
d=ones(1,n)*s;
cons=zeros(n,1);
cons(consumer)=need;
Sc=[
    0 d 0;
    zeros(n,1) C cons;
    zeros(1,n+2)
];
Sw=[
    zeros(1,n+2);
    zeros(n,1) W zeros(n,1);
    zeros(1,n+2);
];
n=n+2;
end

