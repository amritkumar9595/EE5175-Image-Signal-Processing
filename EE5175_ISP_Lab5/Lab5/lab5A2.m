% close all
A=imread('/home/amrit/Documents/EE5175/EE5175_ISP_Lab5/Lab5/pillars.jpg');
A=squeeze(A(:,:,1));
%figure(1),imshow(A)

f=500;          %focal length (in pixels) =100, 500, 1000
d=1000;           % depth of scene = 200, 1000, 5000


imageall=zeros(40,450,673);
avg=zeros(450,673);

for i=1:40
    i
    
    R=rotation_matrix(rx(i),ry(i),rz(i));
%     R=eye(3);
%     T=translation_matrix(tx(i),ty(i),tz(i));
    T=translation_matrix(0,0,0);
    H=homography_matrix(T,R,d,f);
    imageall(i,:,:) = homography(H,A);
end
% RUN THIS FOR CAMERA MOTION:

%  for i=(1:40)
%      a=squeeze(imageall(i,:,:));
%      imshow(a,[0,255])
%  end
    
 
 for i=(1:40)
     i
     a=squeeze(imageall(i,:,:));
     avg=avg+a;
 end
 avg=avg/40;
 %figure(2),imshow(avg,[0,255])

% GIF MAKER:

FileName = 'motionblur.gif';

for k = 1:40
    aa=squeeze(imageall(k,:,:));
    if k ==1

%// For 1st image, start the 'LoopCount'.
        
        imwrite(aa,FileName,'gif','LoopCount',Inf,'DelayTime',1);
    else
        imwrite(aa,FileName,'gif','WriteMode','append','DelayTime',0.1);
    end

end
   
     
 
 








   
    
    
    
    
    