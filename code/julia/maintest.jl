using MAT
include("sgd.jl")
include("eval.jl")
# get data
data = matread("../data01_pl.mat")
Ip = data["Ip"]
In = data["In"]
Ip = round.(Int, Ip)
In = round.(Int, In)
K = data["K"]
# parameter
n = size(K,1)
k = 100    
U = randn(k,n)
eta = 1e-4
lambda = 1e-2
maxiter = 20000;
# training
U = sgd(U, Ip, In, K, eta, lambda, maxiter, k)
