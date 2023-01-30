require './menu'
require "json"

class ViewContact
    def run
        puts " Your Contact List ".center(50, "#")
        puts
        address_display
        puts
        print "00. Back to main menu: "
        option_back = gets.chomp
        puts
        case option_back
        when '00' then main_menu = Menu.new.run
        else
            puts "Invalid input" 
            main_menu = Menu.new.run  
        end

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

end     