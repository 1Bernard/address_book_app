require 'json'
require './menu'

class EditContact
    def self.run
        begin
            @edit_user_input_store = {}

            puts " Edit Contact ".center(50, "#")
            puts
            address_display
            puts
            address_update
            puts
            print "00. Back to main menu: "
            option_back = gets.chomp
            puts
            case option_back
            when '00' then main_menu = Menu.new.run
            else
                puts "Invalid input"  
            end
        rescue Exception => e 
            puts "invalid input".center(50, "-")

            
        end
    end

    def self.address_display
        address_txt = File.open("address.txt", "r")
        @address_list_index = address_txt.each_with_index { |item, index|
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

    def address_update
        print "Enter index to delete: "
        @index = gets.chomp.to_i

        address_txt = File.open("address.txt", "r")
        entries = @address_list_index

         
    end    
        
end
