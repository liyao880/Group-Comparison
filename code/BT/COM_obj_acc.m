function [pred] = COM_obj_acc(V, Ip, In)
 % the following loop is to calculate the value of objective function
 %obj=lambda*sum(exp(V)+exp(-V));
 pred=0;
 T=size(Ip,1);
 for i=1:T
     P=Ip(i,:);
     N=In(i,:);
     P=P(P~=0);
     N=N(N~=0);
     Pv=V(P);
     Nv=V(N);
     %tmp=-sum(Pv)+log(exp(sum(Pv))+exp(sum(Nv)));
     proba=exp(sum(Pv))/(exp(sum(Pv))+exp(sum(Nv)));
     if proba>0.5 pred=pred+1;
     end
     %obj=obj+tmp;
 end
end