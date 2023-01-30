require './menu'

class DeleteContact
    def run
        puts " Delete Contact ".center(50, "#")
        puts
        address_display
        puts
        address_delete
    end
    
    def address_display
        address_txt = File.open("address.txt", "r")
        address_txt.each_with_index { |item, index|
          address_txt_json = JSON.parse(item)
            puts "#{index+1}."
            print "First Name: "
            puts address_txt_json["first_name"]
            print "Last Name: " 
            puts address_txt_json["last_name"]
            print "Phone: " 
            puts address_txt_json["phone"]
            puts

        }
    end
    
    def address_delete
        entries = [@address_txt]
        if entries.empty?
        puts "No Enteries Found".center(50, "-")
        end
        if entries.length > 0
        print "Enter index to delete: "
        @index = gets.chomp.to_i
        address_fetch = entries.fetch(@index-1)
        puts
        puts "Do you want to delete contact?"
        puts
        puts "1. Yes"
        puts "2. No"
        print "Select option to delete: "
        option = gets.chomp

        case option
        when '1' then
            address_txt_lines = File.readlines("address.txt")
            puts "Contact Deleted".center(50, "-")
            address_txt_lines.pop(@index)

        when '2' then main_menu = Menu.new.run
        else
        puts "Invalid input"
        puts main_menu = Menu.new.run  
        end

    end
end    
end
