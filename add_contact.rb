require 'json'
require './menu'

class AddContact
  def self.run

    @user_input_store = {}

    puts " New Contact ".center(50, "#")
    puts
    print "Enter first name: "
    first_name_user_input = gets.chomp
    print "Enter Last name: "
    last_name_user_input = gets.chomp
    print "Enter phone number for #{first_name_user_input} #{last_name_user_input}: "
    phone_user_input = gets.chomp

    @user_input_store[:first_name]=first_name_user_input
    @user_input_store[:last_name]=last_name_user_input
    @user_input_store[:phone]=phone_user_input
    
    File.open("address.txt", "a") do |file|
      file.puts @user_input_store.to_json
    end

    puts " Contact successfully added ".center(50, "-")

    puts
    puts " Summary ".center(50, "~")
    puts "First name: #{first_name_user_input}" 
    puts "Last name: #{last_name_user_input}" 
    puts "Phone number: #{phone_user_input}" 
    puts
    print "00. Back to main menu: "
    option_back = gets.chomp
    puts

    case option_back
    when '00' then Menu.new.run
    else
      puts "Invalid input" 
      puts Menu.new.run 
    end

  end
 
end
