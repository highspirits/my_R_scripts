#identify zero variance attributes in train
train.nzv = nearZeroVar(train, saveMetrics = TRUE)
names(train[train.nzv$zeroVar])

#identify near zero variance attributes in test
test.nzv = nearZeroVar(test, saveMetrics = TRUE)
names(test[test.nzv$zeroVar])

#Set TARGET field in test dataframe to -1 (so that subsetting can be done easily)
test$TARGET = -1

#Combine train and test dataftames
tt = rbind(train, test)

#identify and delete attributes common in test and train having zero variance (not near zero, but zero variance fields)
tt$ind_var2_0 = NULL
tt$ind_var2 = NULL
tt$ind_var27_0 = NULL
tt$ind_var28_0 = NULL
tt$ind_var28 = NULL
tt$ind_var27 = NULL
tt$ind_var41 = NULL
tt$ind_var46_0 = NULL  
tt$ind_var46 = NULL
tt$num_var27_0 = NULL
tt$num_var28_0 = NULL
tt$num_var28 = NULL
tt$num_var27 = NULL
tt$num_var41 = NULL
tt$num_var46_0 = NULL
tt$num_var46 = NULL
tt$saldo_var28 = NULL
tt$saldo_var27 = NULL
tt$saldo_var41 = NULL
tt$saldo_var46 = NULL
tt$imp_amort_var18_hace3 = NULL
tt$imp_amort_var34_hace3 = NULL
tt$imp_reemb_var13_hace3 = NULL
tt$imp_reemb_var33_hace3 = NULL
tt$imp_trasp_var17_out_hace3 = NULL
tt$imp_trasp_var33_out_hace3 = NULL
tt$num_var2_0_ult1 = NULL
tt$num_var2_ult1 = NULL
tt$num_reemb_var13_hace3 = NULL
tt$num_reemb_var33_hace3 = NULL
tt$num_trasp_var17_out_hace3 = NULL
tt$num_trasp_var33_out_hace3 = NULL
tt$saldo_var2_ult1 = NULL
tt$saldo_medio_var13_medio_hace3 = NULL




