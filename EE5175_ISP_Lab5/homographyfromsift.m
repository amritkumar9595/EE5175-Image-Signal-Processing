function [H,concensus_ctr]=homography(corresp1,corresp2) %this function computes the HOMOGRAPHIC MATRIX by incorporating RANSAC

N=4; % no. of rows needed
concensus_ctr=0;
corr=[corresp2 corresp1];
% corr= fliplr(corr);

random_rows=randperm(length(corr),N)


p=corr(random_rows,:);   %corresponding points first of image2 and then image 1
          

A=[ p(1,2),p(1,1),1,0,0,0,-p(1,2)*p(1,4),-p(1,1)*p(1,4),-p(1,4);
    0,0,0,p(1,2),p(1,1),1,-p(1,2)*p(1,3),-p(1,1)*p(1,3),-p(1,3);
    p(2,2),p(2,1),1,0,0,0,-p(2,2)*p(2,4),-p(2,1)*p(2,4),-p(2,4);
    0,0,0,p(2,2),p(2,1),1,-p(2,2)*p(2,3),-p(2,1)*p(2,3),-p(2,3);
    p(3,2),p(3,1),1,0,0,0,-p(3,2)*p(3,4),-p(3,1)*p(3,4),-p(3,4);
    0,0,0,p(3,2),p(3,1),1,-p(3,2)*p(3,3),-p(3,1)*p(3,3),-p(3,3);
    p(4,2),p(4,1),1,0,0,0,-p(4,2)*p(4,4),-p(4,1)*p(4,4),-p(4,4);
    0,0,0,p(4,2),p(4,1),1,-p(4,2)*p(4,3),-p(4,1)*p(4,3),-p(4,3)  ];

[U,D,V]=svd(A,0);
h=V(:,end)
H=[h(1),h(2),h(3);h(4),h(5),h(6);h(7),h(8),h(9)];

for i=1:size(corr,1)
    if(ismember(random_rows,i)==0)
        
        S=[corr(i,2);corr(i,1);1];
        TT=[corr(i,4);corr(i,3);1];
        T=H*S;
        T=T./T(3,1);
        error=T-TT;
        pixel_error=sqrt(sum((T-TT).^2));
        
        if(pixel_error<10)
            concensus_ctr=concensus_ctr+1;
            
       
    end
  
  end
end
        