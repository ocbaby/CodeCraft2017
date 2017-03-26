function [result,flow] = climb( F , node , req )

result=[];
flow=[];
for i=1:length(F(:,1))
    if F(i,node)>0&&req>0
        if F(i,node)<=req
            req=req-F(i,node);
            [T,fw]=climb(F,i,F(i,node));
            
            r2=[ T ones(length(T(:,1)),1).*node];
            [m1,n1]=size(result);
            [m2,n2]=size(r2);
            if n1<n2
            o=zeros(m1,n2-n1);
            result=[result o;r2];
            flow=[flow;fw];
            else
            o=zeros(m2,n1-n2);
            result=[result;r2 o];
            flow=[flow;fw];
            end
            
            F(i,node)=0;
        else
            [T fw]=climb(F,i,req);
            
            r2=[ T ones(length(T(:,1)),1).*node];
            [m1,n1]=size(result);
            [m2,n2]=size(r2);
            if n1<n2
            o=zeros(m1,n2-n1);
            result=[result o;r2];
            flow=[flow;fw];
            else
            o=zeros(m2,n1-n2);
            result=[result;r2 o];
            flow=[flow;fw];
            end
            
            F(i,node)=F(i,node)-req;
        end
    end
end
if req>0
    result=[1 node];
    flow=req;
end

end

