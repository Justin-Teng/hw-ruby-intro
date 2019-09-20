# Justin Teng
# 725002441
# CSCE 606
# September 19, 2019

# When done, submit this entire file to the autograder.

# Part 1

require 'set'

def sum arr
  result = 0
  
  # Iterate through array and sum each element
  arr.each do |item|
    result += item
  end
  
  return result
end

def max_2_sum arr
  if arr.length == 0
    return 0
  
  elsif arr.length == 1
    return arr[0]
  
  else
    # 'largest' holds largest value seen so far
    largest = arr[0]
    
    # 'next_largest' holds 2nd largest value seen so far
    next_largest = arr[1]
    
    if next_largest > largest
      largest, next_largest = next_largest, largest
    end
    
    # Iterate through each element of the array except for the first 2 elements
    arr.last(arr.length-2).each do |item|
      if item > largest
        next_largest = largest
        largest = item
      elsif item > next_largest
        next_largest = item
      end
    end
    
    return largest + next_largest
  end
  
end

def sum_to_n? arr, n
  # Set stores numbers that we have seen so far
  s = Set.new
  
  # For each number x, if we've seen n-x, return true, otherwise add x to set
  arr.each do |item|
    if s.include? (n-item)
      return true
    end
    
    s << item
  end
  
  return false
end

# Part 2

def hello(name)
  return "Hello, " + name
end

def starts_with_consonant? s
  if s.size == 0
    return false
  else
    # First character must be a letter and must not be a vowel
    s[0] =~ /[A-Za-z]/ && s[0].count("aeiouAEIOU") == 0
  end
end

def binary_multiple_of_4? s
  # s must contain only 0 and 1 and cannot be the empty string
  if s.length == 0 || s.count("01") != s.size
    return false
  else
    # Convert s to number and check if it is a multiple of 4
    return s.to_i(2) % 4 == 0
  end
end

# Part 3

class BookInStock
  # Constructor
  def initialize(isbn, price)
    if isbn.empty? || price <= 0
      raise ArgumentError
    end
    
    @isbn = isbn
    @price = price
  end
  
  # getter
  def isbn
    @isbn
  end
  
  # setter
  def isbn=(isbn)
    if isbn.empty?
      raise ArgumentError
    end
    
    @isbn = isbn
  end
  
  # getter
  def price
    @price
  end
  
  # setter
  def price=(price)
    if price <= 0
      raise ArgumentError
    end
    
    @price = price
  end
  
  def price_as_string
    "$" + "%.2f" % @price
  end
end