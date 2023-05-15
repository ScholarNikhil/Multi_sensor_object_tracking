function X = create_particles(Npix_resolution, Npop_particles,w,h,sx,sy)

X1 = randi(Npix_resolution(1), 1, Npop_particles);
X2 = randi(Npix_resolution(2), 1, Npop_particles);
X1(1,1)=sx;
X2(1,1)=sy;
X3 = zeros(2, Npop_particles);
X3(1,:)=w-1;
X3(2,:)=h-1;
X4 = zeros(2, Npop_particles);
X = [X1; X2; X3; X4];
