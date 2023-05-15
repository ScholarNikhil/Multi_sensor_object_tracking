clc; clear all; close all;

%Input Video
video = VideoReader('F:\myphd\work\Thermal-visual obect tracking granular fusion\Visual Thermal ECIC\OSU_Video\1a\output.mp4'); 
get(video);
 video123 = VideoReader('F:\myphd\work\Thermal-visual obect tracking granular fusion\Visual Thermal ECIC\OSU_Video\1b\output.mp4'); 
get(video123);

rectrackvis=[103.5 152.5 10.9 26.9];
sf=751;     ef=800;     tf=sf-1;    rp=1;       nof=ef-tf;      Npop_particles = 40;
Xstd_pos = 1.1;     Xstd_vel = 0.25;    Xstd_lik = 0.25;  ss=0.05;
F_update = [1 0 0 0 1 0; 0 1 0 0 1 1; 0 0 1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 1 0; 0 0 0 0 0 1];
runvariables;
  OC1=zeros(1,1000); 
  OC=zeros(1,1000); 
  SOC=zeros(1,1000); 
  AVSOC=zeros(1,1000); 
  count=zeros(1,nof);

dispvis=read(video,tf);     dispvis=imresize(dispvis,rp);
Itrackvis= imcrop(dispvis,rectrackvis);
entvis=rangefilt(rgb2gray(Itrackvis));
sx=rectrackvis(1); sy=rectrackvis(2); w=rectrackvis(3); h=rectrackvis(4); wvis=abs(rectrackvis(3)); hvis=abs(rectrackvis(4));
thvis=rgbhist(Itrackvis,8,1);   thhogvis=HOG(Itrackvis);  thentvis=imhist(entvis)/numel(entvis);     % Reference Histograms

dispir=read(video123,tf);       % dispir=rgb2gray(dispir); 
dispir=imresize(dispir,rp);      %dispir=imsharpen(dispir);
[ItrackIR,rectrackIR] = imcrop(dispir,rectrackvis);
wir=abs(rectrackIR(3));         hir=abs(rectrackIR(4));
entIR=rangefilt(rgb2gray(ItrackIR));
thIR=rgbhist(ItrackIR,8,1);     thhogIR=HOG(ItrackIR);  thentIR=imhist(entIR)/numel(entIR);     % Reference Histogram

    X = create_particles(Npix_resolution,Npop_particles,w,h,sx,sy);
   
      
 for k = sf:ef
        % Getting Image
        Y_kvis = read(video,k);    Y_kvis=imresize(Y_kvis,rp);  %Y_kvis=imsharpen(Y_kvis);
        Y_kir = read(video123,k);  Y_kir=imresize(Y_kir,rp);    %Y_kir=rgb2gray(Y_kir);   Y_kir=imsharpen(Y_kir);
        

       X = update_particles(F_update,X,Xstd_pos, Xstd_vel,Npop_particles,w,h,Npix_resolution);
        LikelihoodECIC
        fusioncodeECIC
 
    Xavg=[0;0;0;0;0;0];
    for   p=1:Npop_particles
    Xnew=NWF(k,p)*X(:,p);
    Xavg=Xavg+Xnew;
    end
    FOS(k,:)=(Xavg(1:4))';
    
      runnormal
      rinnew
      runvariables 
 end 

