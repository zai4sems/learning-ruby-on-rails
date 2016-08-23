def multiply(first_num,second_num)
    first_num.to_f * second_num.to_f
end

def divide(first_num,second_num)
    first_num.to_f / second_num.to_f
end

def subtract(first_num,second_num)
    first_num.to_f - second_num.to_f
end

def mod(first_num,second_num)
    first_num.to_f % second_num.to_f
end


puts " Please enter your first number"
first_num = gets.chomp
puts "Please enter second number"
second_num = gets.chomp

puts "Choose 1) multiply 2)divide 3)subtract"
prompt=gets.chomp

if prompt == '1'
    results = multiply(first_num,second_num)
    
elsif prompt =='2'
    results = divide(first_num,second_num)
    
elsif prompt == '3'
     results = subtract(first_num,second_num)

end

puts "Result is :#{results}"




#puts "Enter your first name"

#first_name = gets.chomp
#puts "Enter your last name"
#last_name = gets.chomp
#puts "Welcome #{first_name} #{last_name}, to ruby tutorial"







