class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  def merge_sort(&prc)
    prc ||= Proc.new { |x,y| x<=>y }

    return self if self.length <= 1

    middle_idx = self.length / 2
    left_array_sorted = self[0...middle_idx].merge_sort(&prc)
    right_array_sorted = self[middle_idx..-1].merge_sort(&prc)

    Array.merge(left_array_sorted,right_array_sorted,&prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      merged << left.shift if prc.call(left.first,right.first,&prc) == -1
      merged << left.shift if prc.call(left.first,right.first,&prc) == 0
      merged << right.shift if prc.call(left.first,right.first,&prc) == 1
    end

    merged.concat(left)
    merged.concat(right)
    merged

  end
  #Changes
 #Forget to call prc.call(left.first,right.first,&prc)
 # I was calling prc.call(left,right,&prc) instead
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    result = []
    (0...self.length).each do |idx|
      (idx+1...self.length).each do |idx2|
        if self[idx] + self[idx2] == target
          result << [idx,idx2]
        end
      end
    end
    result
  end
end
#Changes
#I was not calling self[idx] + self[idx2] == target
# I was calling idx + idx2 == 0

# Write a method that recursively finds the first `n` factorial numbers
# and returns them. N! is the product of the numbers 1 to N.
# Be aware that the first factorial number is 0!, which is defined
# to equal 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  return [1] if num == 1
  facc = factorials_rec(num-1)
  facc << facc.last * (num-1)
  facc

  #changes
  # I was calling
  #facc << facc * (num-1)
  #I should call facc.last because facc.last take the last in array and times (num-1)
end

class String
  # This method returns true if the string can be rearranged to form the
  # sentence passed as an argument.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)

    self.split.sort == other.split.sort

  end

  #didn't even think carefully about what was asking
  #I nailed this one quickly at home
end

def is_prime?(num)
  (2...num).each do |n|
    return false if num % n == 0
  end
  return true
end

# Write a method that returns the nth prime number
def nth_prime(n)
  result = []
  i = 2
  while result.length < n
    result << i if is_prime?(i)
    i += 1
  end
  result[-1]
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    arr = []
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end
#Changes
#return self can make it chainable

class Array
  # Write an array method that calls the given block on each element and
  # combines each result one-by-one with a given accumulator. If no accumulator is
  # given, the first element is used.
  def my_inject(accumulator = nil, &prc)
    i = 0
    if accumulator.nil?
      accumulator = self[0]
      i += 1
    end
     while i < self.length
       accumulator = prc.call(accumulator,self[i])
       i += 1
     end
     accumulator
  end
end
