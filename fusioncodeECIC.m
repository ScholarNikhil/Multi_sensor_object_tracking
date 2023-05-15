
    [ICvis(k),ICIR(k)]=intconf(round([Dvis;Dvishog;Dvishomo]',1),round([DIR;DIRhog;DIRhomo]',1));
    [ECvis(k),ECIR(k)]=extconf(round([Dvis;Dvishog;Dvishomo]',1),round([DIR;DIRhog;DIRhomo]',1));
    
    Wvis(k)=ICvis(k)+ECvis(k);              WIR(k)=ICIR(k)+ECIR(k);
    Wvis(k)= Wvis(k)/(Wvis(k)+WIR(k));      WIR(k)= WIR(k)/(Wvis(k)+WIR(k));       
    
    HOIW(k,:)=Wvis(k)*Dvis   + WIR(k)*DIR;        
    HOGW(k,:)=WIR(k)*DIRhog  + Wvis(k)*Dvishog;   
    HOMW(k,:)=WIR(k)*DIRhomo + Wvis(k)*Dvishomo;
    SF(k,:)=HOIW(k,:) + HOGW(k,:) + HOMW(k,:);
    L=SF(k,:);
    
    LF=zeros(1,Npop_particles);
    for   p=1:Npop_particles
    LF(p)= const1*(exp(L(p)^2)/const2);
    end
    WF(k,:)=LF;     NWF(k,:)=WF(k,:)/(sum(WF(k,:)));