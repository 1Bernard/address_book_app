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
            when '00' then Menu.new.run
            else
                puts "Invalid input"  
            end
        rescue Exception => e 
            puts "invalid input".center(50, "-")

            
        end
    end

    def self.address_display
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

    def self.address_update
        print "Select index to edit: "
        input = gets.chomp.to_i
        all_contacts = IO.readlines("address.txt")
        selected_contact = all_contacts[input-1]
        found_contact = JSON.parse(selected_contact)
        found_contact = JSON.parse(selected_contact)
        puts "Are you sure you want to edit #{found_contact["first_name"]} #{found_contact["last_name"]}"
        
    end    
        
end
