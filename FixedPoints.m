function [ FP, A, b ] = FixedPoints( K , V )
%Calculats FixedPoints
%Model Selection
%K:= Column coresponding to desired ecosystem. 0<K<7.
%V: Model Parameters, 7 parameters expected

%Constructing matrix equation dx/dt = Ax+b
    A=zeros(7,7);
    b=zeros(7,1);

    ztemp=V(1)*1000/V(15); %Converts to Z to gC/year
    for i=1:1:4
        b(i)=V(i+1)*ztemp; %Calculats & Assignes p*z
    end

    h=V(13);
    c=V(14);
    k50=(1-h)*V(10); %(1-h)*Amount_Leaving_Litter
    k60=(1-c)*V(11); %(1-c)*Amount_Leaving_Humus

    A(1,1)=-V(6);
    A(2,2)=-V(7);
    A(3,3)=-V(8);
    A(4,4)=-V(9);
    A(5,1)=V(6);
    A(5,2)=V(7);
    A(5,3)=V(8);
    A(5,5)=-V(10);
    A(6,4)=V(9);
    A(6,5)=V(10)-k50;
    A(6,6)=-V(11);
    A(7,6)=V(11)-k60;
    A(7,7)=-V(12);
    %Matrix should be ok now

    %Solves the fixed points
    %Solves 0=Ax+b >> -b=Ax
    FP=A\(-b);
    format long;
    display(strcat('The fixed points of the model #', int2str(K) ,' is:'));
    FP
    format short; %end formatting
    clear ztemp i h c k50 k60 temp
end

