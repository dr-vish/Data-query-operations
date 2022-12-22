#Indexing

# Data ----

# Run the following line to download data on heart failure from the UCI repository:
hf <- read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/00519/heart_failure_clinical_records_dataset.csv")

# Exercises ----

# Notes: 
# When the question asks you to "extract" something as a specific 
# structure, it means to do so in a single step, not to convert it after the 
# fact.

# 1. ----
# >> Print:
# * The class of the 'hf' object:
class(hf)
print(class(hf))

# * The number of rows and number of columns in 'hf':
nrow(hf)
ncol(hf)
dim(hf)

# * The structure of 'hf':
str(hf)

# 2. ----
# >> Get the element at the 79th row and 8th column of 'hf':
e1 <- hf[79, 8]
e1

# 3. ----
# >> Print rows 131 through 139 of 'hf':
row1 <- hf[131:139, ]
row1
print(row1)

# 4. ----
# >> Extract the third column of 'hf' as a vector:
col_3 <- hf[ ,13]
col_3
hf [ ,3]
hf[[3]]


# 5. ----
# >> Extract the last column of 'hf' as a single-column data.frame:
last_col <- hf["anaemia"]
last_col
typeof(last_col)
hf[ncol(hf)]
hf[13]
hf["DEATH_EVENT"]


# 6. ----
# >> Create a logical vector indicating the rows where serum_creatinine and 
# serum_sodium are greater than their respective median values:

med_1 <- median(as.numeric(unlist(hf["serum_creatinine"])))
med_1


med_2 <- median(as.numeric(unlist(hf["serum_sodium"])))
med_2

log_vec <- hf["serum_creatinine"] > med_1 & hf["serum_sodium"] > med_2
log_vec


idl <- hf$serum_creatinine > median(hf$serum_creatinine) & hf$serum_sodium > median(hf$serum_sodium)
idl


# 7. ----
# >> How many cases have both serum_creatinine and serum_sodium greater than 
# their respective median values?

length(hf["serum_creatinine"] > med_1 & hf["serum_sodium"] >med_2)
sum(idl)
table(idl)
      
      
# 8. ----
# >> Convert the logical index you created above to an integer index:
integer_index <- which(log_vec)
integer_index

# 9. ----
# >> Use the logical index created at 6. and the integer index created at 8. to 
# *exclude* those cases from 'hf'. 
exclude_log <- hf[!log_vec]
exclude_log
exclude_int <- hf[-integer_index]
exclude_int

# >> Check that the two resulting data.frames are identical.
typeof(exclude_log)
typeof(exclude_int)

# 10. ----
# >> Create a data.frame using `subset()` to get all cases in 'hf' whose age is 
# greater than 80 years and have high_blood_pressure
df <- subset(hf, age > 80 & high_blood_pressure==1)
df

# 11. ----
# >> Use `split()` to split the 'hf' dataset into two data frames by sex:
df_sex <- split(hf, hf$sex)
df_sex


# 12. ---- 
# >> Convert 'hf' to a list named "hfl"
hfl <- as.list(hf)
hfl

# 13. ---- 
# >> Extract ejection_fraction from the 'hfl' list you created as a vector:
ext <- hfl[["ejection_fraction"]]
ext
hfl$ejectionfraction

# >> Check its class
class(ext)

# 14. ----
# >> Extract creatinine_phosphokinase from 'hfl' as a list of length 1
ext_creat <- as.list(hfl["creatinine_phosphokinase"])
ext_creat
