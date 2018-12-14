
#step 1
#Read the string and insert into a datastructure (array or list)

#if someone enters a integer we convert to string
inputstr = str(input("Enter a String\n"))

data = []

if inputstr == "":
    print("The Entered input string in Null or Empty")

for i in range(0, len(inputstr)):
    data.append(inputstr[i])

#Actual original String
for i in range(0, len(data)):
    print(data[i])


for i in range(0, len(data) - 1):
    firsttemp = data[len(data) - i - 1]
    secondtemp = data[i]
    #print(firsttemp)
    #print(secondtemp)
    data[i] = firsttemp
    data[len(data) - i - 1] = secondtemp
    #data[len(data) - i - 1] = secondtemp

for i in range(0, len(data)):
    print(data[i])