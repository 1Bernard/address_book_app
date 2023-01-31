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
        puts "Edit #{found_contact["first_name"]} #{found_contact["last_name"]}"
        @user_input_store = {}
        puts
        print "Enter first name: "
        first_name_update = gets.chomp
        print "Enter Last name: "
        last_name_update = gets.chomp
        print "Enter phone number for #{first_name_update} #{last_name_update}: "
        phone_update = gets.chomp

        @user_input_store[:first_name]=first_name_update
        @user_input_store[:last_name]=last_name_update
        @user_input_store[:phone]=phone_update

        # Edit old contact with new contact code here
        
        puts " Contact successfully edited ".center(50, "-")
    end    
        
end
