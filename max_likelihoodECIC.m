function [Lvis,Dvis,lvis,Ivis,sdvis,Xavgvis,LIR,DIR,lIR,IIR,sdIR,XavgIR,...
Lvishog,Dvishog,lvishog,Ivishog,sdvishog,Xavgvishog,LIRhog,DIRhog,lIRhog,IIRhog,sdIRhog,XavgIRhog,...
Lvishomo,Dvishomo,lvishomo,Ivishomo,sdvishomo,Xavgvishomo,LIRhomo,DIRhomo,lIRhomo,IIRhomo,sdIRhomo,XavgIRhomo]...
 = max_likelihoodECIC(Npop_particles,X,Y_kvis,Y_kir,w,h,Npix_resolution,thvis,thIR,thvishog,thIRhog,thvisent,thIRent)

const1=1/(sqrt(2*pi*0.01)); const2=2*(0.01*2);
w=floor(w); h=floor(h);
Xavgvis=[0;0;0;0];XavgIR=[0;0;0;0];Xavgvishog=[0;0;0;0];Xavgvishomo=[0;0;0;0];XavgIRhog=[0;0;0;0];XavgIRhomo=[0;0;0;0];
lvis=zeros(1,Npop_particles);lvishog=zeros(1,Npop_particles);lvishomo=zeros(1,Npop_particles);lIR=zeros(1,Npop_particles);lIRhog=zeros(1,Npop_particles);lIRhomo=zeros(1,Npop_particles);
Dvis=zeros(1,Npop_particles);Dvishog=zeros(1,Npop_particles);Dvishomo=zeros(1,Npop_particles);DIR=zeros(1,Npop_particles);DIRhog=zeros(1,Npop_particles);DIRhomo=zeros(1,Npop_particles);

for   p=1:Npop_particles
       part=zeros(w,h,3);
      SX1=  floor(abs(X(1,p)));
      SY1 = floor(abs(X(2,p)));
      
      if SY1>(Npix_resolution(2)-h-1)
         SY = floor(abs(Npix_resolution(2)-h-1));
      else
          SY = SY1;
      end
    if   SX1> (Npix_resolution(1)-w-1)
         SX = floor(abs(Npix_resolution(1)-w-1));
         
    else 
        SX = SX1;
                 SX= floor((X(1,p)-1));
    end
[partvis] = imcrop(Y_kvis,[SX SY w h]); [partIR]  = imcrop(Y_kir,[SX SY w h]);

Phvis=rgbhist(partvis,8,1);  Dvis(p)= bhattacharyya1(thvis,Phvis);          lvis(p)= const1*(exp(Dvis(p)^2)/const2);
PhIR=rgbhist(partIR,8,1);    DIR(p)= bhattacharyya1(thIR,PhIR);             lIR(p)= const1*(exp(DIR(p)^2)/const2);
Phvishog=HOG(partvis);       Dvishog(p)=bhattacharyya1(thvishog,Phvishog);  lvishog(p)= const1*(exp(Dvishog(p)^2)/const2);
PhIRhog=HOG(partIR);         DIRhog(p)=bhattacharyya1(thIRhog,PhIRhog);     lIRhog(p)= const1*(exp(DIRhog(p)^2)/const2);
partvis=rangefilt(rgb2gray(partvis));  
Phvishomo=imhist(partvis)/numel(partvis);        Dvishomo(p)=bhattacharyya1(thvisent,Phvishomo);  lvishomo(p)= const1*(exp(Dvishomo(p)^2)/const2);
partIR=rangefilt(rgb2gray(partIR));  
PhIRhomo=imhist(partIR)/numel(partIR);        DIRhomo(p)=bhattacharyya1(thIRent,PhIRhomo);  lIRhomo(p)= const1*(exp(DIRhomo(p)^2)/const2);
%  l(p)= exp(-(1-D(p))/0.5);
end
Dvis(isnan(Dvis))=0; lvis(isnan(lvis))=0; sumpw=sum(lvis);  lvis=(lvis/sumpw);  [Lvis,Ivis]=max(lvis);   sdvis=std(lvis);
DIR(isnan(DIR))=0; lIR(isnan(lIR))=0; sumpw=sum(lIR);  lIR=(lIR/sumpw);  [LIR,IIR]=max(lIR);   sdIR=std(lIR);
Dvishog(isnan(Dvishog))=0; lvishog(isnan(lvishog))=0; sumpw=sum(lvishog);  lvishog=(lvishog/sumpw);  [Lvishog,Ivishog]=max(lvishog);   sdvishog=std(lvishog);
DIRhog(isnan(DIRhog))=0; lIRhog(isnan(lIRhog))=0; sumpw=sum(lIRhog);  lIRhog=(lIRhog/sumpw);  [LIRhog,IIRhog]=max(lIRhog);   sdIRhog=std(lIRhog);
Dvishomo(isnan(Dvishomo))=0; lvishomo(isnan(lvishomo))=0; sumpw=sum(lvishomo);  lvishomo=(lvishomo/sumpw);  [Lvishomo,Ivishomo]=max(lvishomo);   sdvishomo=std(lvishomo);
DIRhomo(isnan(DIRhomo))=0; lIRhomo(isnan(lIRhomo))=0; sumpw=sum(lIRhomo);  lIRhomo=(lIRhomo/sumpw);  [LIRhomo,IIRhomo]=max(lIRhomo);   sdIRhomo=std(lIRhomo);

for   p=1:Npop_particles
    Xnewvis=lvis(p)*X(1:4,p); XnewIR=lIR(p)*X(1:4,p); Xnewvishog=lvishog(p)*X(1:4,p);  XnewIRhog=lIRhog(p)*X(1:4,p);  Xnewvishomo=lvishomo(p)*X(1:4,p);  XnewIRhomo=lIRhomo(p)*X(1:4,p);
    Xavgvis=Xavgvis+Xnewvis; XavgIR=XavgIR+XnewIR; Xavgvishog=Xavgvishog+Xnewvishog; XavgIRhog=XavgIRhog+XnewIRhog; Xavgvishomo=Xavgvishomo+Xnewvishomo; XavgIRhomo=XavgIRhomo+XnewIRhomo;
end
end