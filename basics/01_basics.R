# ASSIGN a STRING value to the VARIABLE name.
name = "Georges"

# ASSIGN a STRING value to the VARIABLE surname
surname = "Labreche"

# INVOKE the paste FUNTION to CONCATENATE the STRING VARIABLES str1 and str2.
# ASSIGN the CONCATENATED results to a new VARIABLE full_name
full_name = paste(name, surname)

# Print the CONCATENATED STRING
print(full_name)

# OVERWRITE the full_name VARIABLE by RE-ASSIGNING a new value to it.
# The new value of full_name will include the middle names.
middle_names = "Louis Joseph"
full_name = paste(name, middle_names, surname)

# Print the new value of full_name.
print(full_name)


# ASSIGN the NUMERIC value 3 to the VARIABLE a.
a = 3

# ASSIGN the NUMERIC value 5 to the VARIABLE b.
b = 5

# Sum the VARIABLES a and b. ASSIGN the result to the VARIABLE c.
c = a + b

# INVOKE the print FUNCTION to display the value set in the VARIABLE c.
print(c)

# INVOKE the sum FUNCTION to sum a and b.
# ASSIGN the RETURNED result to the VARIABLE s.
s = sum(a, b)

# USE the IF and ELSE CONDITIONAL STATEMENTS to check if VARIABLES c and s are equal:
if(c == s){
  print("Equal")
}else{
  print("Not equal")
}

# INVOKE the SUM function to sum a, b, c, and s.
# ASSIGN the RETURNED result to the variable z.
z = sum(a, b, c, s)

# USE the IF and ELSE CONDITIONAL STATEMENTS to check if VARIABLES z and s are equal:
if(z == s){
  print("Equal")
}else{
  print("Not equal")
}

# Create two VECTORS of NUMERICS and ASSIGN them to VARIABLEs vect_a and vect_b.
vect_a = c(1, 10, 3, 5, 6)
vect_b = c(60, 2, 10, 6, 0)

# Calculate the sum of both vectors by INVOKING the sum function.
# ASSIGN the returned result to vect_c
vect_c = vect_a + vect_b

# INVOKE the print funtion to display the contents of vect_c VECTOR
print(vect_c)

# Create a MASK that will be used to only dist values the vect_c VECTOR that
# are greater than 12.
mask = vect_c > 12

# Print the mask to see which values at which positions will be kept (TRUE)
# or ditehed (FALSE) when applying the MASK to vect_c.
print(mask)

# Apply the MASK to the VECTOR vect_c and ASSIGN the FILTERED RESULT to
# a new VECTOR VARIABLE called vect_filtered.
vect_filtered = vect_c[mask]

# INVOKE the print FUNCTION to print the filtered vector.
print(vect_filtered)
