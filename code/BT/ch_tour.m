%specify data and parameters
n=33127;
V=randn(n,1);
eta=0.1;
lambda=0.1;
train_W=dotaplayerWtrain;
train_L=dotaplayerLtrain;
test_W=dotaplayerWtest;
test_L=dotaplayerLtest;

%%Run code
for epoch=1:1000
    maxiter=100;
    [V] = BT(V, train_W,train_L, K, eta, lambda, maxiter); 
end

[obj,pred] = COM_obj_acc(V,test_W, test_L, lambda);
disp(pred/size(test_W,1));