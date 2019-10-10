# function that check if a string is palindrome (case sensitive)
# input:
#   str: word to check
# return:
#   true or false

def palindrome?(str)
  str == str.reverse
end
