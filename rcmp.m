function [p]=rcmp(U,a,k)
p=0;
O=0;
for i=1:U
        if a(k,:)==a(i,:);
            p=p+1;
        else
            O=O+1;
        end    
end
end