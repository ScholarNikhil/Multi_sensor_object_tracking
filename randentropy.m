function [En]=randentropy(U,M,m,sr)
En=0;
for i=1:U
    r=length(find(m(sr,:)==M(sr,i)));
  for n=1:U
        p=n *M(sr,i);
        if r==p;
        q1=n;
        else y=0;
        end
  end
    q=q1;     p=q *M(sr,i);     w=M(sr,i);
    
if (M(sr,i)> 1 && r == p);
    x=w;      s=log(x)/log(2);      z=q*s;
elseif M(sr,i)==0;
    x=0;     z=0;  
elseif M(sr,i)==1;
    x=1;     z=0;
elseif (M(sr,i)> 1 && r ~= p);
    x=w;     z=log(x)/log(2);
end
    E=z*(x/U);     En=E+En; 
end
end