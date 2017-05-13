using MAT
include("sgd.jl")
include("eval.jl")
# get data
Ip = readdlm("../../data/tournament/pW_train.txt")
In = readdlm("../../data/tournament/pL_train.txt")
Iptest = readdlm("../../data/tournament/pW_test.txt")
Intest = readdlm("../../data/tournament/pL_test.txt")
K = readdlm("../../data/tournament/p_train_K.txt")
#Ip = data["Ip"]
#In = data["In"]
Ip = round.(Int, Ip)
In = round.(Int, In)
Iptest = round.(Int, Iptest)
Intest = round.(Int, Intest)
#K = data["K"]
# parameter
n = size(K,1)
k = 100    
U = randn(k,n)
eta = 1e-4
lambda = 1e-2
maxiter = 100000;
# training
U = sgd(U, Ip, In, Iptest, Intest, K, eta, lambda, maxiter, k)