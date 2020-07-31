function [score]=WRMF(Y,M,D,r,param)
[~,m]=size(M);
[~,n]=size(D);
B=zeros(m,n);
for i=1:m
    for j=1:n
        if(Y(i,j)==1)
            B(i,j)=1+param;
        else
            B(i,j)=1;
        end
    end
end
W=rand(m,r);
H=rand(n,r);
W=W';
H=H';
parm1=1;
parm2=1;
parm3=0.5;
parm4=0.5;
k=1;
while k<1000
   
 W=W.*((H*(Y'.*B')+2*parm3*W*M)./(H*((H'*W).*B')+parm1*W+2*parm3*W*(W')*W));

  H=H.*((W*(Y.*B)+2*parm4*H*D)./(W*((W'*H).*B)+parm2*H+2*parm4*H*(H')*H));
 %error(k)=0.5*norm(A-X*W*H'*Y','fro')^0.5;%+0.5*norm(W,'fro')^2+0.5*norm(H,'fro')^2;
    k=k+1;
end
score=W'*H;
end


