function evaluation(U,T,Ip,In,Iptest,Intest,lambda)
	loss = 0.0
	trpred = 0
	tepred = 0
	for gidx= 1 : T
		pit = vec(Ip[gidx,:])
		nit = vec(In[gidx,:])
		sumpproduct = 0.0;
		sumnproduct = 0.0;
		for i = 1:size(pit,1)
			for j=i+1:size(pit,1)
				sumpproduct += dot(U[:,pit[i]],U[:,pit[j]])
				sumnproduct += dot(U[:,nit[i]],U[:,nit[j]])
			end
		end
		loss += max(0.0,1.0-(sumpproduct-sumnproduct))
		if (sumpproduct - sumnproduct>0)
			trpred += 1
		end
	end
	for gidx =1 : size(Iptest,1)
		ptest = vec(Iptest[gidx,:])		
		ntest = vec(Intest[gidx,:])
		sumptest = 0.0;
		sumntest = 0.0;
		for i =1 : size(ptest,1)
			for j=i+1:size(ptest,1)
				sumptest += dot(U[:,ptest[i]],U[:,ptest[j]])
				sumntest += dot(U[:,ntest[i]],U[:,ntest[j]])
			end
		end
		if (sumptest - sumntest > 0)
			tepred += 1
		end
	end
	obj = lambda * vecnorm(U) + loss
	tracc = trpred/T
	teacc = tepred/size(Iptest,1)
	return obj,tracc, teacc
end
