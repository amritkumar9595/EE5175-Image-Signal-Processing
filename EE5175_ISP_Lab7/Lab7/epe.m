function Z =epe(N,V) %this function computes the ENERGY PACKING EFFICIENCY
Ndiag=zeros(1,N);
Nw=0;
Dw=0;
for i=1:N
    Ndiag(i)=V(i,i);
end

Ndiag_max=max(Ndiag);

for i=1:N
    Dw=Dw+Ndiag(i);
    if(Ndiag(i)>0.05*Ndiag_max)
        Nw=Nw+Ndiag(i);
    end
end
Z=Nw/Dw;
end

    




        
