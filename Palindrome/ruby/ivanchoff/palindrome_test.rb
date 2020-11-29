require "./palindrome"

begin
  # raises an ArgumentError with the message "you messed up!"
  if palindrome?("hola") == true
    raise ArgumentError.new("The code for palindrome is wrong!")
  else
    print("hola is no-palindrome\n")
  end
  
  if palindrome?("ala") == false
    raise ArgumentError.new("The code for palindrome is wrong!")
  else
    print("ala is palindrome\n")
  end
  
  if palindrome?("radar") == false
    raise ArgumentError.new("The code for palindrome is wrong!")
  else
    print("radar is palindrome\n")
  end
  
  rescue ArgumentError => e  
    puts e.message
end
