require './modules/Contact.rb'
require './classes/Person.rb'
require "./classes/User.rb"

def create()
    puts "Enter your name: "
    name = gets.chomp
    
    puts "Enter your email: "
    email = gets.chomp
    
    puts "Enter your mobile: "
    mobile = gets.chomp
    
    user = User.new(name, email, mobile).create()
end

while true
    print"""
    +=======================================================================================+
    |                                   Select What You Want  🧐                            |
    +=======================================================================================+
    |                                      1. Create User                                   |
    |                                      2. List Users                                    |
    |                                      3. List number Users                             |
    |                                      4. Exit                                          |
    +=======================================================================================+
    """
    user_choice = gets.chomp
    case user_choice.to_i
    when 1
        create
    when 2
        User.lists
    when 3
        puts "Enter user number of users : "
        user_number = gets.chomp
        User.lists(user_number)
    when 4
        break;
    end
end