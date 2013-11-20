# prereqs arrays, methods, conditional logic, chaining
# Stop this code from throwing an exception. 
 
def sum
  [1, 4, nil, 9, 16, nil].compact.inject(0) {|sum, number| sum + number}
end