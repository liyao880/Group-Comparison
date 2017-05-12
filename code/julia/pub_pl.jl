using MAT
include("sgdnanr0.jl")
include("evalnanr0.jl")
# get data
Ip = readdlm("../../data/pubjulia/pW_public_train.txt")
In = readdlm("../../data/pubjulia/pL_public_train.txt")
Iptest = readdlm("../../data/pubjulia/pW_public_test.txt")
Intest = readdlm("../../data/pubjulia/pL_public_test.txt")
a = readdlm("../../data/pubjulia/p_public_train_K.txt")
#Ip = data["Ip"]
#In = data["In"]
Ip = round.(Int, Ip)
In = round.(Int, In)
Iptest = round.(Int, Iptest)
Intest = round.(Int, Intest)
a = round.(Int, a)
K = zeros(maximum(a))
for i=1: size(a,1)
	K[a[i,1]]=a[i,2]
end
#K = data["K"]
# parameter
n = size(K,1)
k = 200    
U = randn(k,n)
eta = 2e-4
lambda = 1e-2
maxiter = 100000;
# training
U = sgd(U, Ip, In, Iptest, Intest, K, eta, lambda, maxiter, k)
