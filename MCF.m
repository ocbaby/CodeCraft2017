%input(' This program  solves the minimum-cost flow problem.')
%n=input('Enter the number of the verties : ')
%W=input('Enter the cost matrix as W(s,s):   ') %W(i,j)=inf if (i,j) isn't in graph
%C=input('Enter the capacity matrix as C(s,s):   ') %C(i,j)=0 if (i,j) isn't in graph
%V0=input('Enter the required flow value:   ')

function f=MCF(n,W,C,V0)

%stpe0
f=zeros(n);   NW=ones(n)*inf;   NC=zeros(n);   Vf=0;

while Vf~=V0
   
   %step1
      %construct N(f)
   for i=1:n
      for j=1:n
         if (C(i,j)>0)&&(f(i,j)==C(i,j))   NC(j,i)=C(i,j); NW(j,i)=-W(i,j);
         elseif (C(i,j)>0)&(f(i,j)==0)   NC(i,j)=C(i,j);  NW(i,j)=W(i,j);
         elseif (C(i,j)>0)&(f(i,j)>0)&(f(i,j)<C(i,j))    NC(j,i)=f(i,j);  NC(i,j)=C(i,j)-f(i,j);
                                                         NW(j,i)=-W(i,j); NW(i,j)=W(i,j);
         end
      end
   end
   P=short(n,NW); pc=ones(1,n)*inf;
   for i=1:(n-1)
      if P(i+1)~=0   pc(i)=NC(P(i),P(i+1));   end
   end
   cp=min(pc);
   
   %step2
   for i=1:(n-1)
      if (P(i+1)~=0)&(cp>=(V0-Vf))   f(P(i),P(i+1))=f(P(i),P(i+1))+V0-Vf;
      elseif (P(i+1)~=0)&(cp<(V0-Vf))   f(P(i),P(i+1))=f(P(i),P(i+1))+cp;
      end
   end
   Vf=sum(f(1,:)); %V(f)
   NW=ones(n)*inf;   NC=zeros(n); 

   if Vf<0 ;
   end
end

%input('the mim-cost flow is:')
%f 
   
   
   
   
   
   
   
   

                                               
            
            


         



