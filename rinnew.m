
rectangle('Position',FOS(k,:),'EdgeColor','w','LineWidth',2);
F_k=getframe(gcf); Vis_k=frame2im(F_k);
hold off
out=sprintf('F:img_00001.jpg',k);
imwrite(Vis_k,out);

X = create_particles(Npix_resolution,Npop_particles,w,h,sx,sy);