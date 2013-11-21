clear all
dt=0.001; %Step size. I used 0.001

V=xlsread('Variables.xls');
AFP=zeros(7,6);

%Model Selection
%K:= Column coresponding to desired ecosystem. 0<k<7.

for K=1:6
    Vtemp=V(1:15,K);
    [FP, A, b]=FixedPoints(K,Vtemp);%Returns fixed points, FP, and matrices
                                    %A, b, where dx/dt=Ax+b
    AFP(:,K)=FP;

end %End for-loop K=1:6
%clear V Vtemp K i
