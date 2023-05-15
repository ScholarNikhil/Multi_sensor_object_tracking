function X = resample_particles1(X,l)
n=length(l);
c=mean(l);
jmax=0;
L=max(l);

for i=1:n
    if l(i)== L
        jmax = i;
    end
end


for j=1:n
    if l(j)<c
        X(:,j)=X(:,jmax);
    else
        X(:,j)=X(:,j);
    end
end

        
        
        

    
