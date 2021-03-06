p=[1,1000,1];
h=[500,5000];
N=3;
NT=27;  
T=0.01;
Q=2;
mT=1;
u0=4*pi*10^(-7);
pT=zeros(NT,1);
phiT=zeros(NT,1);
sT=zeros(NT,1);
while(1)
    w=2*pi/T;
    R=1;
    m=N-1;
    while(1)
        k=sqrt(-1i*w*u0/p(m));
        A=sqrt(p(m)/p(m+1));
        B=exp(-2*k*h(m))*(R-A)/(R+A);
        R=(1+B)/(1-B);
        m=m-1;
        if m<1  
            break;
        end    
    end
    pT(mT,:)=p(1)*abs(R)^2;
    phiT(mT,:)=atand(imag(R)/real(R))-45;
    sT(mT,:)=sqrt(T);
    mT=mT+1;
    T=T*Q;
    if mT>NT
        break;
    end
end
