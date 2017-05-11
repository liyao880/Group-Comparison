using MAT
include("sgdnan.jl")
include("evalnan.jl")
# get data
data = matread("../data02_pl.mat")
Ip = data["Ip"]
#Ip = Ip[:,1:3]
In = data["In"]
#In = In[:,1:3]
#Ip = round.(Int, Ip)
#In = round.(Int, In)
K = data["K"]
# parameter
n = size(K,1)
k = 200    
U = randn(k,n)
eta = 2e-4
lambda = 1e-2
maxiter = 20000;
# training
U = sgd(U, Ip, In, K, eta, lambda, maxiter, k)
