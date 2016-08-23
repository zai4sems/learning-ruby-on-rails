city = {"puchong" => "47140",
        "kl" => "47100", 
        "gombak" => "55000"
        }

city.each { |k, v|  puts "City available are #{k} "}

def get_city_name(somehash)
   somehash.each { |k, v| puts k}
end

def get_area_code(somehash, key)
    somehash[key]
end

loop do 
    puts "Do you want lookup for city name? (Y/N)"
    
    answer = gets.chomp
    if answer != "Y"
        break
    end
    
    puts "which city name you want the area code for?"
    get_city_name(city)
    prompt = gets.chomp
    if city.include?(prompt)
        puts "The area code for #{prompt} is #{get_area_code(city, prompt)}"
    else
        puts "wrong selection"
    end
    
end

