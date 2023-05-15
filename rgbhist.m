function H = rgbhist(I,nBins,Nind)
if (size(I, 3) ~= 3)
    error('rgbhist:numberOfSamples', 'Input image must be RGB.')
end

if(nargin<3)
    Nind=0;
end
H=zeros([nBins nBins nBins]);
for i=1:size(I,1)
    for j=1:size(I,2)
        p=double(reshape(I(i,j,:),[1 3]));
        p=floor(p/(256/nBins))+1;
        H(p(1),p(2),p(3))=H(p(1),p(2),p(3))+1;
    end
end

H=H(:);


if(Nind==1)
    H=H./sum(H);
else if(Nind==2)
        H=normc(H);
    end
end
