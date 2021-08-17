close all
A=imread('/home/amrit/Documents/EE5175/EE5175_ISP_Lab5/Lab5/pillars.jpg');
A=squeeze(A(:,:,1));
figure(1),imshow(A,[0,255])


imageall=zeros(40,450,673);
avg=zeros(450,673);

% HOMOGRAPHY:

for i=1:40
    i
  
    R=rotation_matrix(rx(i),ry(i),rz(i));
    T=translation_matrix(tx(i),ty(i),tz(i));
    H=homography_matrix(T,R);
    imageall(i,:,:) = homography(H,A);
end

% TAKING AVERAGE TO GENERATE BLURRED IMAGE:
avg1=zeros(450,673);
for i=(1:40)
     
     a=squeeze(imageall(i,:,:));
     avg1=avg1+a;
 end
 avg1=avg1/40;
 figure(2),imshow(avg1,[0,255])
 
% TAKING WEIGHTED AVERAGE TO GENERATE BLURRED IMAGE:

freq=zeros(40,40);
for j=(1:40)
    z=squeeze(imageall(j,:,:));
    for i=(1:40)
      y=squeeze(imageall(i,:,:));
      tf = isequal(z,y);
      if(tf==1)
         freq(j,i) = i;
      end
    end
    
   
end

[ii,jj,kk]=unique(freq,'rows','stable');
 weight=ones(1,40);
 for i=(1:40)
     for j=(i+1:40)
        if(kk(i)==kk(j))
            kk(j)=-j;  % giving a unique negative value,so that it doesnt match with subsequent positions
            weight(i)=weight(i)+1;
            weight(j)=0;
        end
     end
 end
 weight=weight/sum(weight);

avg2=zeros(450,673);
for i=(1:40)
     a=squeeze(imageall(i,:,:));
     avg2=avg2+weight(i)*a;
     
end

figure(3),imshow(avg2,[0,255])
% FINDING ERRORS :
N=size(avg,1)*size(avg,2);
for i=(1:size(avg1,1))
    for j=(1:size(avg1,2))
        mean_error=(avg1(i,j)-avg1(i,j));
        mean_error=(mean_error.^2/N);
    end
end
mean_error       
error_matrix=avg1-avg2;
figure(4),imshow(error_matrix,[0,255])

 
 
     
     
 