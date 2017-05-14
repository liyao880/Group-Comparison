#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue May  9 21:44:51 2017

@author: apple
"""
# cd /Users/apple/GitHub/Group-Comparison/data/tournament
import sys
from trueskill import Rating, rate
from math import sqrt
from trueskill.backends import cdf
import numpy as np
from sklearn.metrics import accuracy_score
## Thins need to input
k=sys.argv[1] # number of characters or players
## Four datasets: Win_train,Lose_train,Win_test,Lose_test
## Tournament Game: Character
R=[]
for i in range(k):
    R.append(Rating())

vi=[]
li=[]
f = open(sys.argv[2],'r')
for line in f:
    vi.append(map(int,line.split()))
f.close()
h = open(sys.argv[3],'r')
for line in h:
    li.append(map(int,line.split()))
h.close()   

for i in range(len(vi)):
    win=vi[i]
    lose=li[i]
    win[:] = [x - 1 for x in win]
    lose[:] = [x - 1 for x in lose]
    t1=[R[win[0]],R[win[1]],R[win[2]],R[win[3]],R[win[4]]]
    t2=[R[lose[0]],R[lose[1]],R[lose[2]],R[lose[3]],R[lose[4]]]
    (R[win[0]],R[win[1]],R[win[2]],R[win[3]],R[win[4]]),(R[lose[0]],R[lose[1]],R[lose[2]],R[lose[3]],R[lose[4]])=rate([t1,t2],ranks=[0,1])

def Pwin(rAlist=[Rating()],  rBlist=[Rating()]):
    deltaMu = sum( [x.mu for x in rAlist])  - sum( [x.mu for x in  rBlist])
    rsss = sqrt(sum( [x.sigma**2 for x in  rAlist]) + sum( [x.sigma**2 for x in rBlist]) )
    return cdf(deltaMu/rsss)

vi_test=[]
li_test=[]
f = open(sys.argv[4],'r')
for line in f:
    vi_test.append(map(int,line.split()))
f.close()
h = open(sys.argv[5],'r')
for line in h:
    li_test.append(map(int,line.split()))
h.close()  

Proba=[]
for i in range(len(vi_test)):
    win=vi_test[i]
    lose=li_test[i]
    win[:] = [x - 1 for x in win]
    lose[:] = [x - 1 for x in lose]
    t1=[R[win[0]],R[win[1]],R[win[2]],R[win[3]],R[win[4]]]
    t2=[R[lose[0]],R[lose[1]],R[lose[2]],R[lose[3]],R[lose[4]]]
    tmp=Pwin(t1,t2)
    Proba.append(Pwin(t1,t2))

Pred=[]
for i in range(len(Proba)):
    if Proba[i]>0.5:
        Pred.append(1)
    else:
        Pred.append(0)

Y_true=np.repeat(1,len(Proba))
accu=accuracy_score(Y_true, Pred)
print('The prediction accuracy on the testing dataset is:',accu)

