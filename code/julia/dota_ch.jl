using MAT
include("sgddota.jl")
include("evaldota.jl")
# get data
Ip = readdlm("../../data/dota/dota_char_W_train")
In = readdlm("../../data/dota/dota_char_L_train")
Iptest = readdlm("../../data/dota/dota_char_W_test")
Intest = readdlm("../../data/dota/dota_char_L_test")
K = readdlm("../../data/dota/dota_char_K")
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
A = randn(n)
eta = 1e-4
lambda = 1e-2
maxiter = 200000;
gamma = 0
# training
U = sgd(U, A, Ip, In, Iptest, Intest, K, eta, lambda, maxiter, k, gamma)
