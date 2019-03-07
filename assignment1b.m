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
for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        
        if i ==1 || j == 1
            G(n,:) = 0;
            G(n,n) = 1;
            F(n) = 1;
        elseif i == nx || j == ny
            G(n,:) = 0;
            G(n,n) = 1;
        else
            nxm = j + (i-2)*ny;
            nxp = j + i*ny;
            nyp = j + 1 + (i-1)*ny;
            nym = j - 1 + (i-1)*ny;
                       
            G(n,nxm) = 1/(dx^2);
            G(n,nxp) = 1/(dx^2);
            G(n,nym) = 1/(dy^2);
            G(n,nyp) = 1/(dy^2);
            G(n,n) = -2*(1/dx^2 + 1/dy^2);
        end
    end
end

figure
spy(G)

[F,D] = eigs(G,9,'SM');

for k = 1:9
    for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        V(i,j) = F(n,k);
    end
    end
    surf(V)
end
    
    
