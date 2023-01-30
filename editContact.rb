require 'json'
require './menu'

class EditContact
    def run
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

    def address_update
        entries = [@address_txt_index]
        if entries.empty?
        puts "No Enteries Found".center(50, "-")
        end
        if entries.length > 0
        print "Enter index to edit: "
        index = gets.chomp.to_i
        puts
        address_fetch = entries.fetch(index-1)
        print "First name: "
        first_name_update = gets.chomp
        print "Last name: "
        last_name_update = gets.chomp
        print "Phone number: "
        phone_update = gets.chomp
        puts         
        @edit_user_input_store[:first_name]=first_name_update
        @edit_user_input_store[:last_name]=last_name_update
        @edit_user_input_store[:phone]=phone_update

        @edit_user_input_store ={"first_name" => "#{first_name_update}", "last_name" => "#{last_name_update}", "phone" =>"#{phone_update}"}
        puts @edit_user_input_store
        @edit_user_input_store.each { |key, value| @edit_user_input_store[key] = value }
        puts @edit_user_input_store
        File.open("address.txt", "w") do |file|
            file.puts JSON.parse(@edit_user_input_store).to_json
            address_txt_update_index = @edit_user_input_store.each_with_index { |item, index|
            puts "#{index+1}. #{item}"
        }
        end

        puts "Contact Updated".center(50, "-")
        end

    end    
        
end
