function sgd(U, Ip, In, Iptest, Intest, K, eta, lambda, maxiter, k)
	n = max(size(K,1))
	T = size(Ip,1)
	bsize = 20
	for iter= 1:maxiter
		#println("Iter=", iter)
		if (iter % 10000 == 0)
			eta = eta/2
		end
		grad = zeros(k,n)
	        sgame = randperm(T)
		for gidx= 1:bsize
			timeA = 0.0
			timeB = 0.0
			t = sgame[gidx]
			pit = Ip[t,:]
			nit = In[t,:]
			nonzero = countnz(pit)
			sumup = sum(U[:,pit[1:nonzero]],2)
			sumun = sum(U[:,nit[1:nonzero]],2)
			sumpproduct = 0.0
			sumnproduct = 0.0
			start_time = time_ns()
			for i = 1:nonzero
				for j = i+1:nonzero
					sumpproduct += dot(U[:,pit[i]],U[:,pit[j]])
					sumnproduct += dot(U[:,nit[i]],U[:,nit[j]])
				end
			end
			timeA += time_ns() - start_time
			constmax = max(0.0,1.0-(sumpproduct-sumnproduct))
			for i = 1:nonzero
				grad[:,pit[i]] = -2* constmax * (vec(sumup) - U[:,pit[i]]) + 2 * lambda * U[:,pit[i]] / K[pit[i]]
				grad[:,nit[i]] = 2* constmax * (vec(sumun) - U[:,nit[i]]) + 2 * lambda * U[:,nit[i]] / K[nit[i]]
			end	
			timeB += time_ns() - timeA
		end
	#	println(timeA," ",timeB)
		U = U - eta * grad
		if (iter %1000 ==0)
			println(iter," ",evaluation(U,T,Ip,In,Iptest,Intest,lambda))
		end
	end
	return U
end
