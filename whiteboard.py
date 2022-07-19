# Find Even numbers
# Create a function that, given a list as a parameter, finds the even numbers inside the list. The function should then return a list.
# Example:
# Input: [2, 7, 10, 11, 12]
# Output: [2, 10, 12]

def findevens(list):
    newlist = []
    for i in list:
        if i % 2 == 0:
            newlist.append(i)
    return newlist
            
print(findevens([2,7,10,11,12,19,3,7]))




