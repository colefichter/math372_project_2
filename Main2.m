clear all
dt=0.001; %Step size. I used 0.001
V=xlsread('Variables.xls');

strt=0; %Starting Year
fin=6000; %Ending Year
n=(fin-strt)/dt;



%Model Selection
K=1; %k=1 Tropical Forest
    Vtemp=V(1:15,K);
    [FP, A, b]=FixedPoints(K,Vtemp);%To get Matrix A and vector b
                                    %x'=Ax+b
    %Loop to calculate evolution of x in ecosystem k;
    xTForest=zeros(7,n);
    t=zeros(1,n);
    for m=2:1:n
        xTForest(:,m)=xTForest(:,m-1)+dt*(A*xTForest(:,m-1)+b);
        t(m)=m*dt;
    end
    
K=3; %k=3 Grassland
    Vtemp=V(1:15,K);
    [FP, A, b]=FixedPoints(K,Vtemp);
    xGrass=zeros(7,n);
    for m=2:1:n
        xGrass(:,m)=xGrass(:,m-1)+dt*(A*xGrass(:,m-1)+b);
    end
    
K=4; %k=4 Agricultural Land
    Vtemp=V(1:15,K);
    [FP, A, b]=FixedPoints(K,Vtemp);
    xAgri=zeros(7,n);
    for m=2:1:n
        xAgri(:,m)=xAgri(:,m-1)+dt*(A*xAgri(:,m-1)+b);
    end

    
   % save('TForest.out','xTForest', '-ASCII');
   % save('Grass.out','xGrass', '-ASCII');
   % save('Agri.out','xAgri', '-ASCII');
   % save('Time.out','t', '-ASCII');

