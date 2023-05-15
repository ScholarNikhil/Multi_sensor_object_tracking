function [M]=delRA(U,AT,a,M)
p=0;
O=0;
redB=zeros(U,3*(AT-1));
b1=a(:,2:3);      b2=a;         b2(:,2)=[];        b3=a(:,1:2);
for k=1:U
    for i=1:U
        if b1(k,:)==b1(i,:);
            p=p+1;
        else
            O=O+1;
        end 
       
    end
        M(1,k)=p;
        p=0;     
end
for k=1:U
    for i=1:U
        if b2(k,:)==b2(i,:);
            p=p+1;
        else
            O=O+1;
        end 
       
    end
        M(2,k)=p;
        p=0;     
end
for k=1:U
    for i=1:U
        if b3(k,:)==b3(i,:);
            p=p+1;
        else
            O=O+1;
        end 
       
    end
        M(3,k)=p;
        p=0;     
end
end