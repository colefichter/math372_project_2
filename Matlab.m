V=xlsread('Variables.xls');

%Model Selection
%K:= Column coresponding to desired ecosystem. 0<k<7.
K=1;
V=V(:,K);
h=V(13);
c=V(14);
%I'll work on this later today and tommorrow. Just I'm confused about the h
%and c

%Constructing matrix equation dx/dt = Ax+b
k50=0; %Need a formula in terms of h and c
k60=0; %Need a formula in terms of h and c


A=zeros(7,7);
b=zeros(7,1);

for i=1:1:4
    b(i)=V(i+1)*V(1);
end

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
