function sgd(U, A, Ip, In, Iptest, Intest, K, eta, lambda, maxiter, k, gamma)
	n = size(K,1)
	T = size(Ip,1)
	bsize = 10
	for iter= 1:maxiter
		#println("Iter=", iter)
#		if (iter % 50000==0)
#			eta = eta/5
#		end
		#updating u
		grad = zeros(k,n)
		gradA = zeros(n)
	        sgame = randperm(T)
		for gidx= 1:bsize
			timeA = 0.0
			timeB = 0.0
			t = sgame[gidx]
			pit = Ip[t,:]
			nit = In[t,:]
			sumup = sum(U[:,pit],2)
			sumun = sum(U[:,nit],2)
			sumap = sum(A[pit])
			suman = sum(A[nit])
			sumpproduct = 0.0
			sumnproduct = 0.0
			start_time = time_ns()
			for i = 1:size(pit,1)
				for j = i+1:size(pit,1)
					sumpproduct += dot(U[:,pit[i]],U[:,pit[j]])
					sumnproduct += dot(U[:,nit[i]],U[:,nit[j]])
				end
			end
			timeA += time_ns() - start_time
			constmax = max(0.0,1.0-(sumap-suman+gamma*sumpproduct-sumnproduct))
			for i = 1:size(pit,1)
				grad[:,pit[i]] = -2* gamma* constmax * (vec(sumup) - U[:,pit[i]]) + 2 * lambda * U[:,pit[i]] / K[pit[i]]
				grad[:,nit[i]] =  2* gamma* constmax * (vec(sumun) - U[:,nit[i]]) + 2 * lambda * U[:,nit[i]] / K[nit[i]]
			end	
			timeB += time_ns() - timeA
		end
		if (iter %1000 ==0)
			println(iter," ",evaluation(U,A,T,Ip,In,Iptest,Intest,lambda,gamma))
		end

	#	println(timeA," ",timeB)
		U = U - eta * grad
		#updating A
		for gidx = 1:bsize
			t = sgame[gidx]
			pit = Ip[t,:]
			nit = In[t,:]
			sumap = sum(A[pit])
			suman = sum(A[nit])
			sumpproduct = 0.0
			sumnproduct = 0.0
			start_time = time_ns()
			for i = 1:size(pit,1)
				for j = i+1:size(pit,1)
					sumpproduct += dot(U[:,pit[i]],U[:,pit[j]])
					sumnproduct += dot(U[:,nit[i]],U[:,nit[j]])
				end
			end
			constmax = max(0.0,1.0-(sumap-suman+gamma*sumpproduct-sumnproduct))		
			for i = 1:size(pit,1)
				gradA[pit[i]] = -2* constmax
				gradA[nit[i]] =  2* constmax 
			end
		end
		A = A - eta * gradA
		if (iter %1000 ==0)
			println(iter," ",evaluation(U,A,T,Ip,In,Iptest,Intest,lambda,gamma))
		end
	end
	return U,A
end
