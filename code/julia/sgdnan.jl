function sgd(U, Ip, In, K, eta, lambda, maxiter, k)
	n = size(K,1)
	T = size(Ip,1)
	bsize = 5
	for iter= 1:maxiter
		#println("Iter=", iter)
		grad = zeros(k,n)
	        sgame = randperm(T)
		for gidx= 1:bsize
			timeA = 0.0
			timeB = 0.0
			t = sgame[gidx]
			tpit = vec(Ip[t,:])
			tnit = vec(In[t,:])
			pit = round.(Int, tpit[!isnan.(tpit)])
			nit = round.(Int, tnit[!isnan.(tnit)])
			ppg = size(pit,1)
			sumup = sum(U[:,pit],2)
			sumun = sum(U[:,nit],2)
			sumpproduct = 0.0
			sumnproduct = 0.0
			start_time = time_ns()
			for i = 1:ppg
				for j = i+1:ppg
					sumpproduct += dot(U[:,pit[i]],U[:,pit[j]])
					sumnproduct += dot(U[:,nit[i]],U[:,nit[j]])
				end
			end
			timeA += time_ns() - start_time
			constmax = max(0.0,1.0-(sumpproduct-sumnproduct))
			for i = 1:ppg
				grad[:,pit[i]] = -2* constmax * (vec(sumup) - U[:,pit[i]]) + 2 * lambda * U[:,pit[i]] / K[pit[i]]
				grad[:,nit[i]] = 2* constmax * (vec(sumun) - U[:,nit[i]]) + 2 * lambda * U[:,nit[i]] / K[nit[i]]
			end	
			timeB += time_ns() - timeA
		end
	#	println(timeA," ",timeB)
		U = U - eta * grad
		if (iter %100 ==0)
			println(iter," ",evaluation(U,T,Ip,In,lambda))
		end
	end
	return U
end
