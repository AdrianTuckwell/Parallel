def expensive_operation(number)
  (0..100).each do |iteration|
    number = Math.sqrt(number) + 5
  end
  number
end

array_size = 999999
# test_array = (1..array_size).to_a

start_time = Time.now

#  A lock called mutex


#  Parallel Thread 1
sum1 = 0
t1 = Thread.new do
  (1..array_size/2).each do |number|
     sum1 += expensive_operation(number)
  end
end

# Parallel Thread 2
sum2 = 0
t2 = Thread.new do
  ((array_size/2 + 1)..array_size).each do |number|
    sum2 += expensive_operation(number)
  end
end

t1.join
t2.join

sum = sum1 + sum2

end_time = Time.now
puts("The sum is #{sum}")
puts("It took #{ end_time - start_time } seconds")