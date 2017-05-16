function [V] = BT(V, Ip, In, K, eta, lambda, maxiter)
%% Solve min_{U} \sum_{t=1}^T (e_t^{+}UU^Te_t^{+}-e_t^{-}UU^Te_t^{-}-1)^2 + lambda||U||_F^2 
%% Input: V,Ip,In,K
%%     V: Initial values of V, usually we use U=randn(n,1),
%%        where n is the number of players
%%     Ip:the player index of winning team for each game.(T*5 matrix)
%%     In:the player index of losing team for each game.(T*5 matrix)
%%      K:the participation frequnce of each player in T games.(n*1 vector)
%% Parameters to be tuned:eta,lambda,maxiter
%%     eta:the step size. For previous data, we use 1e-5
%%     lambda: the penalty term. For previous data,we use 1e-2
%%     maxiter: the maximum number of iterations. For previous data,we use 1e4
%% Output:U,obj,pred
%%     U: the matrix we want to get

T=size(Ip,1);%% Get the total number of games
for iter=1:maxiter
    t=randsample(T,1);%% random sample a game
    P=Ip(t,:); % get the corresponding player index for the winning team
    N=In(t,:); % get the corresponding player index for the losing team
    [V] = update_v(P, N, V, K, eta, lambda); % Update U
end
[obj,pred] = COM_obj_acc(V, Ip, In, lambda);
 disp(obj);
 disp(pred/T);
end