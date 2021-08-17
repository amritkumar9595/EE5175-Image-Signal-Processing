p=0.91;
B=(1-p^2)/(1+p^2);
a=p/(1+p^2);
N=8;               %size of markov -covariance matrix
%MARKOV CO-VARIANCE MATRIX :
R=zeros(N,N);
for i=1:N
    for j=1:N
        R(i,j)=p^(abs(i-j));
    end
end

P=B*inv(R);    % P is beta**2_R_inv !!
%FORMATION OF Q MATRIX :
Q=zeros(N,N);
for i=1:N
    Q(i,i)=1;
    if(i+1<=N)
        Q(i,i+1)=-a;
    end
    if(i-1>0)
        Q(i,i-1)=-a;
    end
end
Q(1,1)=1-a;
Q(N,N)=1-a;

%DCT MATRIX:
C=zeros(N,N);
for k=1:N
    for n=1:N
        if(k-1==0)
            C(k,n)=1/(sqrt(N));
        else
            C(k,n)=cos((pi*(2*(n-1)+1)*(k-1))/(2*N))*sqrt(2/N);
        end
    end
end

VQ=C*Q*transpose(C);  %DCT OF Q 
VP=C*P*transpose(C);  %DCT OF P
error=VQ-VP;

    