def power(base, exp)
  ans = 1
  exp.times {ans *= base}
  return ans
end

def factorial(input_num)
  primes_array = []
  base_primes = [2,3,5,7]
  if primes(input_num)
    primes_array.push(1, input_num)
  else
    base_primes.each do |e|
      until input_num % e != 0
        primes_array.push(e)
        input_num /= e
      end
    end
    primes_array.push(input_num) if input_num != 1
    primes_array
  end
end

def uniques(in_array)
#is "in_array | in_array" basically the same as calling 'uniq?'?  Not sure, so I did this......
  dupes = []
  in_array.each do |val1|
    in_array.each do |val2|
      dupes.push(val1) if val1 == val2
    end
  end
  in_array |= dupes
end

def combinations(arr_1, arr_2)
  out_arr = []
  arr_1.each_with_index do |val1, ind1|
    arr_2.each_with_index do |val2, ind2|
      out_arr.push("#{val1}" + "#{val2}")
    end
  end
  out_arr
end

def primes(input_num)
  is_prime = true
  #I should prolly use a case here, but oh well.....
  if input_num % 2 == 0 && input_num / 2 != 1
    is_prime = false
  elsif input_num % 3 == 0 && input_num / 3 != 1
    is_prime = false
  elsif input_num % 5 == 0 && input_num / 5 != 1
    is_prime = false
  elsif input_num % 7 == 0 && input_num / 7 != 1
    is_prime =false
  else
    is_prime = true
  end
end

def overlap(rec_1, rec_2)
  overlap = false
#these variable names are AWESOME!
  rec1_top_right_x = rec_1[1][0]
  rec1_top_right_y = rec_1[1][1]
  rec2_bot_left_x = rec_2[0][0]
  rec2_bot_left_y = rec_2[0][1]

  #puts "#{rec1_top_right_x}, #{rec1_top_right_y}, #{rec2_bot_left_x}, #{rec2_bot_left_y}"

  overlap = true if rec2_bot_left_x < rec1_top_right_x && rec2_bot_left_y < rec1_top_right_y
  return overlap
end

p power(2,2)
p primes(7)
p factorial(19212)
p uniques([1,5,'frog', 2,1,3,'frog'])
p combinations(['on','in'],['to','rope'])
p overlap( [ [0,0],[3,3] ], [ [1,1],[4,5] ] )
p overlap( [ [0,0],[1,4] ], [ [1,1],[3,2] ] )
