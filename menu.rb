require './addContact'
require './editContact'
require './viewContact'
require './deleteContact'

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
    when '1' then @menu_command.add_contact
    when '2' then @menu_command.edit_contact
    when '3' then @menu_command.view_contact
    when '4' then @menu_command.delete_contact
    else
      puts "Invalid input (Option should range from 1-4)"
      main_menu = Menu.new.run  
    end
  end
 
end

class Command

  def add_contact
    add_contact_user = AddContact.run
  end

  def edit_contact
    edit_contact_user = EditContact.new.run
  end

  def view_contact
    view_contact_user = ViewContact.new.run
  end

  def delete_contact
    delete_contact_user = DeleteContact.new.run
  end
end