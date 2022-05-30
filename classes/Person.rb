class Person
    @name
    def initialize(name)
        @name = name.to_s
    end
#=======================================================================================#
#			                          check name valid                                  #
#=======================================================================================#
    def valid_name?()
        if /[a-zA-Z]/.match(@name)
            return true
        else
            puts "Invalid Name"
            return false
        end
    end
end
