function [M]= redund(U,M,n)
for j=1:n
for i=1:U
    r=length(find(M(j,:)==M(j,i)));
    if M(j,i)>1 && r>1;
            M(j,i)=0;
    elseif M(j,i)>1 && r==1;
            M(j,i)=M(j,i);
       elseif M(j,i)==1
                M(j,i)=1;
    end
end
end
end