#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue May  9 21:44:51 2017

@author: apple
"""
# cd /Users/apple/GitHub/Group-Comparison/data/dota
import sys
import trueskill
from math import sqrt
import numpy as np
from sklearn.metrics import accuracy_score
## Things need to input
# number of characters or players,Win_train,Lose_train,Win_test,Lose_test

#sys.argv=[54,'chW_train.txt','chL_train.txt','chW_test.txt','chL_test.txt']
#sys.argv=[62,'chW_public_train.txt','chL_public_train.txt','chW_public_test.txt','chL_public_test.txt']
#sys.argv=[3470,'pW_train.txt','pL_train.txt','pW_test.txt','pL_test.txt']
#sys.argv=[7266,'pW_public_train.txt','pL_public_train.txt','pW_public_test.txt','pL_public_test.txt']
#sys.argv=[113,'dota_char_W_train','dota_char_L_train','dota_char_W_test','dota_char_L_test']
sys.argv=[33127,'dota_player_W_train','dota_player_L_train','dota_player_W_test','dota_player_L_test']

## Code
k=sys.argv[0]
R=[]
for i in range(k):
    R.append(trueskill.Rating())
    
def RMNA(query):
    resultwords  = [word for word in query if word not in ['NA']]
    result_query = ' '.join(resultwords)
    return result_query
    
vi=[]
li=[]
f = open(sys.argv[1],'r')
for line in f:
    tmp=line.split()
    tmp=RMNA(tmp)
    vi.append(map(int,tmp.split()))
f.close()

h = open(sys.argv[2],'r')
for line in h:
    tmp=line.split()
    tmp=RMNA(tmp)
    li.append(map(int,tmp.split()))
h.close()

for i in range(len(vi)):
    win=vi[i]
    lose=li[i]
    win[:] = [x - 1 for x in win]
    lose[:] = [x - 1 for x in lose]
    t1=[]
    t2=[]
    for j in range(len(win)):
        t1.append(R[win[j]])
        t2.append(R[lose[j]])
    matchresult=trueskill.rate([t1,t2],ranks=[0,1])
    for k in range(len(win)):
        R[win[k]]=matchresult[0][k]
        R[lose[k]]=matchresult[1][k]

def Pwin(rAlist=[trueskill.Rating()],  rBlist=[trueskill.Rating()]):
    deltaMu = sum( [x.mu for x in rAlist])  - sum( [x.mu for x in  rBlist])
    rsss = sqrt(sum( [x.sigma**2 for x in  rAlist]) + sum( [x.sigma**2 for x in rBlist]) )
    return trueskill.backends.cdf(deltaMu/rsss)

vi_test=[]
li_test=[]
f = open(sys.argv[3],'r')
for line in f:
    tmp=line.split()
    tmp=RMNA(tmp)
    vi_test.append(map(int,tmp.split()))
f.close()
h = open(sys.argv[4],'r')
for line in h:
    tmp=line.split()
    tmp=RMNA(tmp)
    li_test.append(map(int,tmp.split()))
h.close()  

Proba=[]
for i in range(len(vi_test)):
    win=vi_test[i]
    lose=li_test[i]
    win[:] = [x - 1 for x in win]
    lose[:] = [x - 1 for x in lose]
    t1=[]
    t2=[]
    for j in range(len(win)):
        t1.append(R[win[j]])
        t2.append(R[lose[j]])
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

