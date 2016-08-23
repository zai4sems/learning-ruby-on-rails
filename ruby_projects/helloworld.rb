puts "Hello world"

puts "Enter your first name"

first_name = gets.chomp
puts "Enter your last name"
last_name = gets.chomp
puts "Welcome #{first_name} #{last_name}, to ruby tutorial"

puts " Please enter your first number"
first_num = gets.chomp
puts "Please enter second number"
second_num = gets.chomp

puts " The first number times second number is : #{first_num.to_i * second_num.to_i}"