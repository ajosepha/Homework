# Instructions:
# Return an array that contains the squares of all elements in an array?
 
def square_array(some_array)
    array_squared = []
    some_array.each do |number|
    array_squared << number * number
  end  
  return array_squared
end