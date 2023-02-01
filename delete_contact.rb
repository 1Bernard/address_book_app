require './menu'
require 'json'

class DeleteContact
    def self.run
        puts " Delete Contact ".center(50, "#")
        puts
        address_display
        puts
        address_delete
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
    
    def self.address_delete
        all_contacts = IO.readlines("address.txt")
        if all_contacts.empty?
            puts " No Enteries In Your Contact List. Add Contact ".center(50, "-")
            puts Menu.new.run
          end
        if all_contacts.length > 0
            print "Select index to delete contact: "
            input = gets.chomp.to_i
            puts
            all_contacts = IO.readlines("address.txt")
            selected_contact = all_contacts[input-1]
            found_contact = JSON.parse(selected_contact)
            puts "Are you sure you want to delete #{found_contact["first_name"]} #{found_contact["last_name"]}"
            puts "1. Yes" 
            puts "2. No"
            puts
            print "Select from options above: "
            option = gets.chomp.to_i
            case option
                when 1
                    all_contacts.delete(selected_contact)
                    # update_contacts(all_contacts)
                    puts " Contact deleted ".center(50, "-")
                    puts Menu.new.run
                when 2
                    puts Menu.new.run
                else
                    puts "invalid input".center(50, "-")
                    puts Menu.new.run
            end    
        end

    end
end    
