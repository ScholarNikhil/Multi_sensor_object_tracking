Npix_resolution = floor(rp*[video.Width video.Height]); Nfrm_movie = floor(video.Duration * video.FrameRate);
trackIR=zeros(nof,4); trackvis=zeros(nof,4); trackIRhog=zeros(nof,4); trackvishog=zeros(nof,4); trackvishomo=zeros(nof,4); trackIRhomo=zeros(nof,4);
Maxvis=zeros(1,nof);  Maxvishog=zeros(1,nof); MaxIR=zeros(1,nof); MaxIRhog=zeros(1,nof); Maxvishomo=zeros(1,nof); MaxIRhomo=zeros(1,nof);
sdevvis=zeros(1,nof);  sdevvishog=zeros(1,nof); sdevIR=zeros(1,nof); sdevIRhog=zeros(1,nof); sdevvishomo=zeros(1,nof); sdevIRhomo=zeros(1,nof);
likevis=zeros(nof,Npop_particles);      likevishog=zeros(nof,Npop_particles);        likevishomo=zeros(nof,Npop_particles);
likeIR=zeros(nof,Npop_particles);       likeIRhog=zeros(nof,Npop_particles);         likeIRhomo=zeros(nof,Npop_particles);
Dmvis=zeros(nof,Npop_particles);        Dmvishog=zeros(nof,Npop_particles);           Dmvishomo=zeros(nof,Npop_particles);
DmIR=zeros(nof,Npop_particles);         DmIRhog=zeros(nof,Npop_particles);            DmIRhomo=zeros(nof,Npop_particles);
ICvis=zeros(1,nof);     ICIR=zeros(1,nof);      ECvis=zeros(1,nof);     ECIR=zeros(1,nof);
Wvis=zeros(1,nof);      WIR=zeros(1,nof);           WF=zeros(nof,Npop_particles);    NWF=zeros(nof,Npop_particles);
like=zeros(nof,Npop_particles);
FOS=zeros(nof,4);
const1=1/(sqrt(2*pi*0.01));     const2=2*(0.01*2);