# ---------------------------------------------------------------------------------
#                               DATA PREPROCESSING
# ---------------------------------------------------------------------------------

##EXEC
source('preprocessing.R')

#exec -> std.scaler.normalization
k = c(0, 1, 2, 3, 4, 5)
knorm = std.scaler.normalization(k)

#exec -> std.scaler.standarization
kstd = std.scaler.standarization(k)

#exec -> std.scaler [iris/ standarization]
dt_iris = read.csv('dataset/iris.data.txt', header = F)
dt_iris[, -5] = std.scaler(dataset = dt_iris[, -5], tipo = 'standarization')

#exec -> std.scaler [wine/ normalization]
dt_wine = read.csv('dataset/wine.csv')
dt_wine[, -1] = std.scaler(dataset = dt_wine[, -1], tipo = 'normalization')

#exec -> train.test.split [iris]
dt_iris = read.csv('dataset/iris.data.txt', header = F)
x = dt_iris[, -5]
y = as.numeric(dt_iris[, 5])
sets = train.test.split(x, y, train.size = 0.7)
x.train = sets$x.train   #105 amostras
y.train = sets$y.train
x.test = sets$x.test     #45 amostras
y.test = sets$y.test

#exec -> kfolds.split [iris]
indexs = kfolds.split(x, y, k_folds = 10) 
