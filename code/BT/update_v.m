function [V] = update_v(P, N, V, K, eta, lambda)
%% Input: V,P,N,K
%%     V: the V after previous updating 
%%     P: the player index of winning team for random game t.(1*5 vector)
%%     N:the player index of losing team for random game t.(1*5 vector)
%%     K:the participation frequnce of each player in T games.(n*1 vector)

%% Output:V
%%     V: the vector we want to get after updating
PN=[P,N];
Pv=V(P);
Nv=V(N);
for i=1:size(P,2)
    v=V(P(i));
    grad=-1+2*exp(sum(Pv))/(exp(sum(Pv))+exp(sum(Nv)))+lambda*(exp(v)-exp(-v))/K(P(i));
    v=v-eta*grad;
    V(P(i))=v;
end
for i=1:size(N,2)
    v=V(N(i));
    grad=-1+2*exp(sum(Nv))/(exp(sum(Pv))+exp(sum(Nv)))+lambda*(exp(v)-exp(-v))/K(N(i));
    v=v-eta*grad;
    V(N(i))=v;
end
end