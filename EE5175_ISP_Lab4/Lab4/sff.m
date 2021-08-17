clc
clear 
close all

load("stack.mat");
I=eval(['frame',sprintf('%.3d',1)]);

step=1;
window=2;
deld=50.50;

ML_matrix=zeros(size(I,1),size(I,2),100);
FM_matrix=zeros(size(I,1),size(I,2),100);
depth_map=zeros(size(I,1),size(I,2));

% STEP_1: MODIFIED LAPLACIAN MATRIX

for n=1:100
    I=eval(['frame',sprintf('%.3d',n)]);
    ML_matrix(:,:,n)=modifiedlaplacian(I,step);
end

% STEP_2: SUM MODIFIED LAPLACIAN MATRIX

for n=1:100
    for i=1:size(FM_matrix,1)
        for j=1:size(FM_matrix,2)

            FM_matrix(i,j,n)=summodifiedlaplacian(ML_matrix(:,:,n),window,i,j);
            
        end
    end
end

% x=squeeze(FM_matrix(1,38,:));
% plot(x)


% STEP_3: DEPTH ESTIMATION BY GAUSSIAN INTERPOLATION


for i=1:100
    for j=1:100
        
        i
        
        
        focus_arr=squeeze(FM_matrix(i,j,:));
        
        
        depth_map(i,j)=gaussianinterpol(focus_arr,deld,100);
    end
end


% xx=linspace(1,100);
% yy=linspace(1,100);
% [X,Y]=meshgrid(xx,yy);
% Z=depth_map(X.,Y.);
% size(Z)
mesh(depth_map);




