clear all
dt=0.001; %Step size. I used 0.001
K=1 % Only model #1 is 





V=xlsread('Variables.xls');
accuracy=0.95 %Must be smaller than 1
t=0;
T=2000;
m=ceil((T-t)/dt);
x=zeros(7,m);

%Model Selection
%K:= Column coresponding to desired ecosystem. 0<k<7.

%for K=1:6
    Vtemp=V(1:15,K);
    [FP, A, b]=FixedPoints(K,Vtemp);%Returns fixed points, FP, and matrices
                                    %A, b, where dx/dt=Ax+b
    %Since dx/dt=Ax+b, a linear system, therefore the Jacobian matrix is A
    [evec,eval]=eig(A);
    eval=diag(eval);
    
    display('The model''s eiganvectors are:')
    evec
    format long;
    display('& their eiganvalues are:')
    eval
    display('with each eiganvalue having size of:')
    eval.*eval
    format short;
    
    for n=2:1:m
        x(:,n)=x(:,n-1)+dt*(A*x(:,n-1)+b);
    end
        
    xtemp=x;
    for i=1:7
        xtemp(i,:)=x(i,:)-accuracy*FP(i);
        a(i)=min(find(xtemp(i,:)>=0)); 
    end
    acc='It''ll take this many years to achive the the desired accuracy of :';
    acc=strcat(acc,num2str(accuracy));
    display(acc);
    acctime=(a-1)*dt
    
    acc=strcat('Model',num2str(K),'Jacobi.Out');
    save(acc,'A', '-ASCII');
    acc=strcat('Model',num2str(K),'b.Out');
    save(acc,'b', '-ASCII');
    acc=strcat('Model',num2str(K),'FixedPoints.Out');
    save(acc,'FP', '-ASCII');
    acc=strcat('Model',num2str(K),'Evolution.Out');
    save(acc,'x', '-ASCII');
    acc=strcat('Model',num2str(K),'95PercentFirstArrival.Out');
    save(acc,'a', '-ASCII');
    acc=strcat('Model',num2str(K),'Setting.Out');
    xtemp=strcat('From :',num2str(t),' To:',num2str(T),' in steps of :',num2str(dt));
    save(acc,'xtemp', '-ASCII');
    
%end %End for-loop K=1:6
%clear V Vtemp K i
