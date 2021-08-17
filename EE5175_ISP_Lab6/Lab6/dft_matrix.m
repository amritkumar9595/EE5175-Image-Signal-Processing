function H = dft_matrix(N)

H=zeros(N,N);
for k=1:N
    for l=1:N
        
        pr=(2*pi*(k-1-N/2)*(l-1-N/2));  %if DFT matrix is centralized,then the dft is obtained at the centre!!
        H(k,l)=exp(-i*pr/N);
    end
end
H=H./sqrt(N);
