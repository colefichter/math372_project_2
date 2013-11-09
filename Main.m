clear all
V=xlsread('Variables.xls');

%Model Selection
%K:= Column coresponding to desired ecosystem. 0<k<7.
for K=1:6
    Vtemp=V(1:15,K);
    FP=FixedPoints(K,Vtemp); %Call function that returns fixed points
end



clear V Vtemp FP K
