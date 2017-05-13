using MAT
include("sgd.jl")
include("eval.jl")
# get data
Ip = readdlm("../../data/dota/dota_player_W_train")
In = readdlm("../../data/dota/dota_player_L_train")
Iptest = readdlm("../../data/dota/dota_player_W_test")
Intest = readdlm("../../data/dota/dota_player_L_test")
K = readdlm("../../data/dota/dota_player_K")
#Ip = data["Ip"]
#In = data["In"]
Ip = round.(Int, Ip)
In = round.(Int, In)
Iptest = round.(Int, Iptest)
Intest = round.(Int, Intest)
#K = data["K"]
# parameter
n = size(K,1)
k = 50    
U = randn(k,n)
eta = 2e-4
lambda = 1e-2
maxiter = 200000;
# training
U = sgd(U, Ip, In, Iptest, Intest, K, eta, lambda, maxiter, k)
