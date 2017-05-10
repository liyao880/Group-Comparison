#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Tue May  9 21:44:51 2017

@author: apple
"""
# cd /Users/apple/GitHub/Group-Comparison/data/tournament

from trueskill import Rating, rate

## Tournament Game: Character
n=54 # number of characters
R=[]
for i in range(n):
    R.append(Rating())

vi=[]
li=[]
f = open('ChW.txt','r')
for line in f:
    vi.append(map(int,line.split()))
f.close()
h = open('ChL.txt','r')
for line in h:
    li.append(map(int,line.split()))
h.close()   

for i in range(len(vi)):
    win=vi[i]
    lose=li[i]
    t1=[R[win[0]],R[win[1]],R[win[2]],R[win[3]],R[win[4]]]
    t2=[R[lose[0]],R[lose[1]],R[lose[2]],R[lose[3]],R[lose[4]]]
    (R[win[0]],R[win[1]],R[win[2]],R[win[3]],R[win[4]]),(R[lose[0]],R[lose[1]],R[lose[2]],R[lose[3]],R[lose[4]])=rate([t1,t2],ranks=[0,1])

## Public Game: Character

