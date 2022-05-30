class User < Person 
    include Contactable
    @email
    @mobile
    def initialize(name, email, mobile)
        super(name)
        @email = email
        @mobile = mobile
    end

#=======================================================================================#
#			                          check mobile valid                                #
#=======================================================================================#
    def self.valid_mobile?(mobile)
        if /^[0]\d{10}$/.match(mobile)
            return true
        else
            puts "Invalid mobile number"
            return false
        end
    end
#=======================================================================================#
#			                        check email valid                                   #
#=======================================================================================#
    def self.valid_email?(email)
        if /^[a-zA-Z]+[0-9]*@[a-zA-Z]+\.[a-zA-Z]+$/.match(email)
            return true
        else
            puts "Invalid email"
            return false
        end
    end
#=======================================================================================#
#			                         check name valid                                   #
#=======================================================================================#
    def create()
        if valid_name?() && self.class.valid_email?(@email) && self.class.valid_mobile?(@mobile)
            if self.class.check_email_exits(@email)
                return
            end
            File.open('./db/db.txt', 'a') do |f|
                f.puts "#{@name}    |   #{@email}  |   #{@mobile}"
            end
            puts "User #{@name} created successfully"
        else
            puts "Invalid data"
        end

        self.class
    end
#=======================================================================================#
#			                       check email exit in db                               #
#=======================================================================================#
    def self.check_email_exits(email)
        File.open('./db/db.txt', 'r') do |f|
            f.each_line do |line|
                data = line.split("|")
                if data[1] == email
                   puts "Email exits"
                    return true
                end 
            end
        end
        return false
    end
#=======================================================================================#
#			                            lists users                                     #
#=======================================================================================#
    def self.lists(*parms)
        if parms.length == 1
            counter = 1
            File.open('./db/db.txt', 'r') do |f|
                f.each_line do |line|
                    if counter <= parms[0].to_i
                        data = line.split('|')
                        puts contact_details(data[1], data[2])
                        counter+=1
                    else
                        break
                    end
                end
            end
        else
            File.open('./db/db.txt', 'r') do |f|
                f.each_line do |line|
                    puts line
                end
            end
            self.class
        end
    end
end
