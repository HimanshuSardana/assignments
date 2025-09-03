# Create a list named MyList having title “My First List” and criteria having following
# items:
# a. Age vector a = (12, 14,16, 20)
# b. A two dimensional matrix with 5 rows.
# c. A score vector with values s = (‘First’, ‘Second’, ‘Third’)
# Print MyList, criteria, and vector a

myList <- list(
  title = "My First List",
  criteria = list(
    age_vector = c(12, 14, 16, 20),
    matrix_2d = matrix(1:10, nrow = 5),
    score_vector = c('First', 'Second', 'Third')
  )
)

print(myList)
print(myList$criteria)
print(myList$criteria$age_vector)
