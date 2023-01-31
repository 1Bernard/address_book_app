require './add_contact'
require './edit_contact'
require './view_contact'
require './delete_contact'

class Menu
  def initialize
    @menu_command = Command.new
  end

  def run
    puts
    puts " Welcome To My Address Book ".center(50, "#")
    puts
    puts "1. Add contact"
    puts "2. Edit contact"
    puts "3. View contact"
    puts "4. Delete contact"
    print "Select from the options above: "
    menu_user_choice = gets.chomp
    puts

    case menu_user_choice
    when '1'
      AddContact.run
    when '2' 
      EditContact.run
    when '3'
      ViewContact.run
    when '4'
      DeleteContact.run
    else
      puts "Invalid input (Option should range from 1-4)"
        Menu.new.run  
    end
  end
 
end

class Command

  def add_contact
    AddContact.run
  end

  def edit_contact
    EditContact.run
  end

  def view_contact
    ViewContact.run
  end

  def delete_contact
    DeleteContact.new.run
  end
end