%This function is using the Floyd algrithm to solve the shortest path problem
function y=short(n,U);

S=zeros(n,n);
   for i=1:n
      for j=1:n   S(i,j)=j;   end
   end   
for m=1:n
   for i=1:n
      for j=1:n
         if U(i,j)>U(i,m)+U(m,j)  S(i,j)=S(i,m); U(i,j)=U(i,m)+U(m,j);  end
      end
   end
end
a=S(1,n);  C=zeros(1,n);  C(1)=1;  j=1;
while a~=n    j=j+1; C(j)=a;  a=S(a,n);    end
j=j+1; C(j)=n;

y=C; 
