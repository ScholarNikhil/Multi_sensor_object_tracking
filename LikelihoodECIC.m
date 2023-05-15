[Lvis,Dvis,lvis,Ivis,sdvis,Xavgvis,LIR,DIR,lIR,IIR,sdIR,XavgIR,...
     Lvishog,Dvishog,lvishog,Ivishog,sdvishog,Xavgvishog,LIRhog,DIRhog,lIRhog,IIRhog,sdIRhog,XavgIRhog,...
     Lvishomo,Dvishomo,lvishomo,Ivishomo,sdvishomo,Xavgvishomo,LIRhomo,DIRhomo,lIRhomo,IIRhomo,sdIRhomo,XavgIRhomo] = max_likelihoodECIC(Npop_particles,X,Y_kvis,Y_kir,w,h,Npix_resolution,thvis,thIR,thhogvis,thhogIR,thentvis,thentIR);
 
     Maxvis(k)=Lvis;     likevis(k,:)=lvis;     sdevvis(k)=sdvis;     Dmvis(k,:)=Dvis;
     trackvis(k,:) = (abs(Xavgvis))';    rectangle('Position',trackvis(k,:),'EdgeColor','r','LineWidth',2);       
 
    MaxIR(k)=LIR;    likeIR(k,:)=lIR;     sdevIR(k)=sdIR;     DmIR(k,:)=DIR;
    trackIR(k,:) = (abs(XavgIR))';   rectangle('Position',trackIR(k,:),'EdgeColor','y','LineWidth',2); 
 
    Maxvishog(k)=Lvishog;     likevishog(k,:)=lvishog;     sdevvishog(k)=sdvishog;     Dmvishog(k,:)=Dvishog;
    trackvishog(k,:) = (abs(Xavgvishog))';  rectangle('Position',trackvishog(k,:),'EdgeColor','b','LineWidth',2); 
    
    MaxIRhog(k)=LIRhog;     likeIRhog(k,:)=lIRhog;     sdevIRhog(k)=sdIRhog;     DmIRhog(k,:)=DIRhog;
    trackIRhog(k,:) = (abs(XavgIRhog))';    rectangle('Position',trackIRhog(k,:),'EdgeColor','g','LineWidth',2); 
    
     Maxvishomo(k)=Lvishomo;     likevishomo(k,:)=lvishomo;     sdevvishomo(k)=sdvishomo;     Dmvishomo(k,:)=Dvishomo;
     trackvishomo(k,:) = (abs(Xavgvishomo))';  rectangle('Position',trackvishomo(k,:),'EdgeColor','m','LineWidth',2); 
    
    MaxIRhomo(k)=LIRhomo;     likeIRhomo(k,:)=lIRhomo;     sdevIRhomo(k)=sdIRhomo;     DmIRhomo(k,:)=DIRhomo;
    trackIRhomo(k,:) = (abs(XavgIRhomo))';    rectangle('Position',trackIRhomo(k,:),'EdgeColor','c','LineWidth',2);