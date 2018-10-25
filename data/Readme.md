## This folder contains the datasets we use for the project.

### There are three datasets
- tournament data of Heroes of the storm
- public data of Heroes of the storm
- public data of notable players in Dota2

### Tournament dataset of HotS: there are 9610 games.
- chW.txt: contains the indices of characters on the winning team. 
- chL.txt: contains the indices of characters on the losing team. 
- pW.txt: contains the indices of players on the winning team. 
- pL.txt: contains the indices of players on the losing team. 
- ch_train_K.txt: contains the K indices for character training data set
- ch_test_K.txt: contains the K indices for character testing data set
- p_train_K.txt: contains the K indices for player training data set
- p_test_K.txt: contains the K indices for player testing data set

chW_train, chW_test, chL_train, chL_test, pW_train, pW_test, pL_train, pL_test: are training and testing datasets of the corresponding datasets, with splitratio=0.8

### Public dataset of HotS: there are 139,462 games. 
- chW_public.txt: contains the indices of characters on the winning team. 
- chL_public.txt: contains the indices of characters on the losing team. 
- pW_public.txt: contains the indices of players on the winning team. 
- pL_public.txt: contains the indices of players on the losing team. 
- ch_public_train_K.txt: contains the K indices for character training data set
- ch_public_test_K.txt: contains the K indices for character testing data set
- p_public_train_K.txt: contains the K indices for player training data set
- p_public_test_K.txt: contains the K indices for player testing data set

Note that there are some missing values represented by 'NA'. For some games, we only have indices for some of the players and characters.

chW_public_train, chW_public_test, chL_public_train, chL_public_test, pW_public_train, pW_public_test, pL_public_train, pL_public_test: are training and testing datasets of the corresponding datasets, with splitratio=0.8

### Public dataset of Dota2: there are 46,459 games.
- dota_char_W_train/test: contains the indices of characters on the winning team. 
- dota_char_L_train/test: contains the indices of characters on the losing team. 
- dota_player_W_train/test: contains the indices of players on the winning team. 
- dota_player_L_train/test: contains the indices of players on the losing team. 
- dota_char_K: contains the K indices for character data set
- dota_player_K: contains the K indices for player data set
