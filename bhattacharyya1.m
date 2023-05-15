function [bc]=bhattacharyya1(X1,X2)
error(nargchk(2,2,nargin));
error(nargoutchk(0,1,nargout));
[n,m]=size(X1);
assert(size(X2,2)==m,'Dimension of X1 and X2 mismatch.');
sq=zeros(n,1);
ne=numel(X1);
for i=1:ne
sq(i,:)=sqrt(abs(X1(i)*X2(i)));
end
sq1=sq;
bc=sum(sq1);
end
