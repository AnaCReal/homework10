# Program for generating the key and the ciphered text
set.seed(101)
key <- sample.int(25,25)

# Since R starts counting in 1 (in vectors and data frames)the key goes from 1-25,
# to make it match to other languages there will be two keys, official_key starts from 0-24

keys <- data.frame(rbind(key,key-1))
rownames(keys) <- c("R.key","Official.key")
# Printing the key in a file
# Write CSV in R

write.table(keys, file = "key.csv",row.names=TRUE, col.names=FALSE, sep=", ")

# Plain text vectors

plain <- data.frame(matrix(0,10000,25))
for (i in 1:10000) {
    zer <- sample.int(25,1)
    vec <- c(rep(0, zer), rep(1, 25-zer))
    vec <- sample(vec)
    plain[i,] <- vec
}

# Applying the key to each row

ciphered <- plain[,key]

# Pasting both

data <- cbind(plain,ciphered)

# Exporting
# Write CSV in R
write.table(data, file = "data25-Train.csv",row.names=FALSE,col.names=FALSE, sep=", ")

# Generating the test set

plain2 <- data.frame(matrix(0,10000,25))
for (i in 1:10000) {
    zer <- sample.int(25,1)
    vec <- c(rep(0, zer), rep(1, 25-zer))
    vec <- sample(vec)
    plain2[i,] <- vec
}

# Applying the key

ciphered2 <- plain2[,key]

data2 <- cbind(plain2,ciphered2)

# Exporting
# Write CSV in R
write.table(data2, file = "data25-Test.csv",row.names=FALSE,col.names=FALSE, sep=", ")
