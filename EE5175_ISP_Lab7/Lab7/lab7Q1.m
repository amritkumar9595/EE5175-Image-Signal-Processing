N=8    %size of markov -covariance matrix
%MARKOV CO-VARIANCE MATRIX
p=0.91;
R=zeros(N,N);
for i=1:N
    for j=1:N
        R(i,j)=p^(abs(i-j));
    end
end

%WALSH-HADAMARD MATRIX
H1=[1,1;1,-1]./(sqrt(2));
H2=kron(H1,H1);
H3=kron(H2,H1);

VW=H3*R*H3;    %WALSH-HADAMARD TRANSFORM OF R

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

VC=C*R*transpose(C);  %DCT OF R  

%CALCULATION OF EPE
epeW=epe(N,VW);
epeC=epe(N,VC);

[R_eigenvector,D,W]=eig(R);
dct_basis=transpose(C);



    




        