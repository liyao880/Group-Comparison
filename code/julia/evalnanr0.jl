function evaluation(U,T,Ip,In,lambda)
	loss = 0.0
	pred = 0
	for gidx= 1 : T
		pit = Ip[gidx,:]
		nit = In[gidx,:]
		nonzero = countnz(pit)
		sumpproduct = 0.0;
		sumnproduct = 0.0;
		for i = 1:nonzero
			for j=i+1:nonzero
				sumpproduct += dot(U[:,pit[i]],U[:,pit[j]])
				sumnproduct += dot(U[:,nit[i]],U[:,nit[j]])
			end
		end
		loss += max(0.0,1.0-(sumpproduct-sumnproduct))
		if (sumpproduct - sumnproduct>0)
			pred += 1
		end
	end
	obj = lambda * vecnorm(U) + loss
	acc = pred/T
	return obj,acc
end
