require 'json'

class User
    attr_accessor :email, :name, :permissions
    
    def initialize(*args)
        @email = args[0]
        @name = args[1]
        @permissions = User.permission_from_template
    end
    
    def self.permission_from_template
       file = File.read 'user_permission_template.json'
       JSON.load(file, nil, symbolize_names: true)
    end
    
    def save
        eg_json = {email: @email, name: @name, permissions: @permissions}.to_json
        open('users.json', 'a') do |file| #append to json file
            file.puts eg_json
        end
    end
    
end
