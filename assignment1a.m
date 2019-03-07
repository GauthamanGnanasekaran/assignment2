clear
clc
%part 1
%use ratio 3/2 (L/W)
L = 3;
W = 2;
v0 = 1;

dx = 0.25;
dy = 0.25;

nx =3.0/0.1;
ny = 2/0.1;
np = nx*ny; %number of points
x = linspace(0,L,nx);
y = linspace(0,W,ny);

G = zeros(nx*ny,nx*ny);
F = zeros(nx*ny,1);

%boundary condition is 0 V on left and 1 on right

for i=1:np
    if (i == np) % right 
        G(i,i) = 1;
        F(i) = 0;
    elseif i == 1 % left
        G(i,i) = 1;
        F(i) = 1;
    else % Middle
        G(i,i)   = -2;
        G(i,i+1) =  1;
        G(i,i-1) =  1;
    end
end

figure(1)
V = G\F;
plot(V);
title(sprintf('Part a'));
xlabel('X')
ylabel('V')


%1b



