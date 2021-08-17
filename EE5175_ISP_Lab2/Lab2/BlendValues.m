function avg = BlendValues(a,b,c)

if(a==0 && b~=0 && c~=0)
    avg=b;
elseif(a~=0 && b==0 && c~=0)
    avg=a;
elseif(a~=0 && b~=0 && c==0)
    avg=a;
elseif(a==0 && b==0 && c~=0)
    avg=c;
elseif(a==0 && b~=0 && c==0)
    avg=b;
elseif(a~=0 && b==0 && c==0)
    avg=a;
 elseif(a~=0 && b~=0 && c~=0)
     avg=b;
     
else
     avg=0;
end