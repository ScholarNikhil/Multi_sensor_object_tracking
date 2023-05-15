function[EC1,EC2]=extconf(I1,I2)
%taking 2 sources%
k1=zeros(6,6); k2=zeros(6,6);
D=zeros(2,2); D(1,1)=1; D(2,2)=1;
count_all=0; count=0; l=1;
sum=0; SUM=0;
ec=zeros(2,2);

for i=1:6
 for j=1:6
		if I1(i,:)==I1(j,:) 
				k1(i,j)=j;
				l=l+1;
		
			else
				k1(i,j)=0;
			end
end
		
			l=0;
end

for i=1:6
	for j=1:6
			if I2(i,:)== I2(j,:) 
				k2(i,j)=j;
				l=l+1;
			
			else
				k2(i,j)=0;
			
		end
end
			l=0;
end


for i=1:6
	for j=1:6
		if k1(i,j)>0;
			count_all= count_all + 1;
		else 
                 	end
 
			
		if k2(i,j)>0;
			count_all= count_all + 1;
		else
			end
			
		if k1(i,j)==k2(i,j) && k1(i,j)~=0;
				count=count+2;
		else
			end
	end

	sum=sum + (count_all - count);
	count_all=0;
		count=0;
end
	
	D(1,2)=sum;
	D(2,1)=sum;
	sum=0;
   
    

	for i=1:2
		for j=1:2
			if i~=j
				ec(i,j)=1-D(i,j)/35;
			else
				ec(i,j)=D(i,j);
			end
		end
	end
	


	for i=1:2
		for j=1:2
			SUM=SUM+ec(i,j);
		end
		EC(i)=SUM/2;
		
		SUM=0;
  end
EC1=EC(1);
EC2=EC(2);

end

