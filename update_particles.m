function X = update_particles(F_update, X,Xstd_pos, Xstd_vec,Npop_particles,width,hieght,Npix_resolution)
N = size(X, 2);
X = F_update * X;
X(1:2,:) = X(1:2,:) + Xstd_pos * randn(2, N);
X(5:6,:) = X(5:6,:) + Xstd_vec * randn(2, N);

w=floor(width);
h=floor(hieght);

for   p=1:Npop_particles

      SX1=  floor(abs(X(1,p)));
      SY1 = floor(abs(X(2,p)));
      
      if SY1>(Npix_resolution(2)-h-1)
         X(2,p) = floor(abs(Npix_resolution(2)-h-1));
      else
          X(2,p) = SY1;
      end
    if   SX1> (Npix_resolution(1)-w-1)
         X(1,p) = floor(abs(Npix_resolution(1)-w-1));
         
    else 
        X(1,p) = SX1;
                 SX= floor((X(1,p)-1));
    end
end
