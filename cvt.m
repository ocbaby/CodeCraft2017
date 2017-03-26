function  [result,flow] = cvt( F )

req=sum(F(:,length(F)));
[result flow]=climb(F,length(F),req);


end

