function[IC1,IC3,sig1,sig3]=intconf(a1,a3)

U=size(a1,1);   AT=size(a1,2);
M=zeros(2,U);   M1=zeros(3,U);      M3=zeros(3,U);

for k=1:U
        [p]=rcmp(U,a1,k);
        M(1,k)=p;    
end

for k=1:U
     [p]=rcmp(U,a3,k);  
      M(2,k)=p;    
end

m=zeros(2,U);      m(:,:)=m(:,:)+M(:,:);

M=redund(U,M,2);

E1=randentropy(U,M,m,1);        
E3=randentropy(U,M,m,2);        
Eat1=[E1 E3];

M1=delRA(U,AT,a1,M1);
m1=zeros(AT,U);     m1(:,:)=m1(:,:)+M1(:,:);

M1=redund(U,M1,3);
E11=randentropy(U,M1,m1,1); 
E12=randentropy(U,M1,m1,2); E13=randentropy(U,M1,m1,3);

sig11=E11-Eat1(1);  sig12=E12-Eat1(1);  sig13=E13-Eat1(1); sig1=[sig11 sig12 sig13];
j=1;
redat1=zeros(U,nnz(sig1));
for i=1:AT
    if sig1(i)~=0;
        po=a1(:,i);         redat1(:,j)=po;
        j=j+1;
    else
        z=0;
    end
end

redat1=redat1(:,:);     el1=numel(redat1);

IC1=el1/numel(a1); 

M3=delRA(U,AT,a3,M3);
m3=zeros(AT,U);     m3(:,:)=m3(:,:)+M3(:,:);

M3=redund(U,M3,3);
E31=randentropy(U,M3,m3,1); E32=randentropy(U,M3,m3,2); E33=randentropy(U,M3,m3,3);
sig31=E31-Eat1(2); sig32=E32-Eat1(2); sig33=E33-Eat1(2); sig3=[sig31 sig32 sig33];
j=1;
redat3=zeros(U,nnz(sig3));
for i=1:AT
    if sig3(i)~=0;
        po=a3(:,i);         redat3(:,j)=po;
        j=j+1;
    else
        z=0;
    end
end
redat3=redat3(:,:);     el2=numel(redat3);
IC3=el2/numel(a3);
end
