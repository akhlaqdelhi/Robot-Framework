
'''
multi line
comments may reside here
and so on
'''

print("variable")
print("declaration and initialization and fetching the value")

num = 109
# int variable num
print("variable num = "+str(num))

# float variable
salary = 2344.34
tax = salary/100*20
print("tax = ")
print(tax)

# dictionary
dic_student = {"name": "akhlaq", "age": 20}
print(dic_student["name"])

# arrays
ary_num = [12, 52, 23, 43, 45, 56, 65, 76, 54]
print(ary_num[0])
print(ary_num[3])
# -----------------------------------
# string methods

str1 = "Akhlaq Ahmed"
# get length of string
print("length of string is : ")
print(len(str1))

print("string in UPPER case : "+str1.upper())
print("string in lower case : "+str1.lower())
concateString = "Name: " + str1
print("concateString : "+concateString)

find_index = str1.find("q")
print("index position in str1 = "+str(find_index))



