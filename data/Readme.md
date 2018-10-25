# This folder contains the datasets we use for the project.

There are two datasets. One is tournament data of Heroes of the storm, and another one is public data of Heroes of the storm.

For the tournament dataset: there are 9610 games.
chW.txt: contains the indices of characters on the winning team. 9610*5 matrix
chL.txt: contains the indices of characters on the losing team. 9610*5 matrix
pW.txt: contains the indices of players on the winning team. 9610*5 matrix
pL.txt: contains the indices of players on the losing team. 9610*5 matrix
ch_train_K.txt: contains the K indices for character training data set
ch_test_K.txt: contains the K indices for character testing data set
p_train_K.txt: contains the K indices for player training data set
p_test_K.txt: contains the K indices for player testing data set

chW_train, chW_test, chL_train, chL_test, pW_train, pW_test, pL_train, pL_test: are training and testing datasets of the corresponding datasets, with splitratio=0.8

For the public dataset: there are 139,426 games. 
chW_public.txt: contains the indices of characters on the winning team. 139,426*5 matrix
chL_public.txt: contains the indices of characters on the losing team. 139,426*5 matrix
pW_public.txt: contains the indices of players on the winning team. 139,426*5 matrix
pL_public.txt: contains the indices of players on the losing team. 139,426*5 matrix
ch_public_train_K.txt: contains the K indices for character training data set
ch_public_test_K.txt: contains the K indices for character testing data set
p_public_train_K.txt: contains the K indices for player training data set
p_public_test_K.txt: contains the K indices for player testing data set

Note that there are some missing values represented by 'NA'. For some games, we only have indices for some of the players and characters.

chW_public_train, chW_public_test, chL_public_train, chL_public_test, pW_public_train, pW_public_test, pL_public_train, pL_public_test: are training and testing datasets of the corresponding datasets, with splitratio=0.8
