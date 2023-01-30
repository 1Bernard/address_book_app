require './menu'

class Application 
  def self.run
    main_menu = Menu.new.run
  end
end