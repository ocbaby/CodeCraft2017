function [F,tp] = cdn( W,C,consumer,need,price )
    [n w c v0]=construct(W,C,consumer,need);
    last_all=inf;
    r=1;r2=1
    alist=[];
    count=0;count2=0;
    min_tore=length(W);
    %list_F={};
    Fs=[];
    tp=inf;
    %for i=1:10
    while 1   
        %tic
        
        
        F=MCF(n,w,c,v0);
        
        tore=find(F(1,:)>0);
        cost=price*length(tore);
        all=cost+sum(sum(F(2:end,:).*w(2:end,:)));
        
        
        w(1,tore)=double(round(price./F(1,tore)));%�ڵ��̯
        w(1,find(F(1,:)<0))=0;
%%%%
        %w(1,:)=double(round(w(1,:)./2));%����˥��
        for k=tore 
            %if sum(F(2:end,k))>0 w(1,k)=w(1,k)*2; end   %����������Ӽ�
        end
        
        
        if r~=1 c(1,r)=sum(need);end    %�ͷŷ���
        if r2~=1 c(1,r2)=sum(need);end    %�ͷŷ���
        %r=tore;
        if length(tore)>1
            for p=r
            tore(find(tore==p))=[];%�ϴη���������β�����
            end
            
            r=[];
            %r=tore(randi(length(tore),randi(length(tore)),1));%������������ڵ�
            for k=1:length(r)
                if F(r(k),length(F))>sum(C(:,r(k)-1))
                    r(k)=[];
                end
            end
            %length(alist)
            if length(alist)>0&&alist(end)<all c(1,r)=0;end %��ϲ����
            %length(alist)>0&&alist(end)<all
            
            oop=[];
            %oop=find(F(1,tore)==F(tore,length(F))');
            for k=1:length(tore)
                temp=double(round(tore(k)));
                if F(temp,length(F))>0&&F(temp,length(F))<=sum(C(:,temp-1))%%%%%%%%%%%%
                    oop=[oop k];
                end
            end
            
            r2=[];
            if length(oop)>1
            oop=oop(randi(length(oop),randi(length(oop))-1,1));
            r2=tore(oop);%����ֱ��
            end
            if length(alist)>0&&alist(end)<all c(1,r2)=0;end %��ϲ����
            %length(alist)>0&&alist(end)<all
        end
        
        
        %if min_tore<1+length(tore) continue;end
        %min_tore=length(tore)+1;
        
        %��������ʷ���ţ����
        if min(alist)==all
            count=count+1;
            Fs=F;
        else count=0;
        end
        if count==2 break;
        end
        
        %����������w
        if length(alist)>0&&alist(end)==all
            count2=count2+1;
        else count2=0;
        end
            if count2==1
            w(1,randi(length(w),1,length(w)))=0;end
        
        
        %���ڼ�¼
        last_all=all;
        alist=[alist all];
        tp=min(alist)%�����Сֵ����
        %find(F(1,:)<0)
        %list_F{length(alist)}=F;
        %ind=find(alist==tp);
        %if tp==1569
           % F=list_F{ind(1)};
           % break;
       % end
       
       all
       %toc
       %if tp<1960 disp('ERROR!');break;end
       
       %��ʱ���ƣ�if ��ʱ F=Fs;break;end
        
        
    end
end
