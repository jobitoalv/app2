require 'tty-prompt'
require_relative 'header'

class Salon
    attr_reader :services, :name

    def initialize
        @name = "Fluffy Tails"
        @address = "Nudgee Beach somewhere far far away"
        @phone = "1800 Baxter Missy Chico "
        @email = "Dogs_are_the_best@gmail.com"
        @services = []  # Array of service objects
        @about = "~ A place for your furbabies to relax and be surrounded by like-minded pals, \n  Your baby will not only look good but smell good also with a long of love and care"
    end

    # Displays the contact information of the salon
    def hotel_info
        puts HEADER_LINE
        puts "#{@name.upcase}".center(HEADER_LENGTH)
        puts HEADER_LINE
        contact_info
        puts
        puts "   #{@about}"
        puts HEADER_LINE
    end

    def contact_info
        puts " Address: #{@address}"
        puts " Phone No: #{@phone}"
        puts " Email: #{@email}"
    end

    def add_service(service)
        @services << service
        return self
    end

    
    def select_service

        # These two lines create an array for the menu to display the service type
        menu = []
        @services.each { |service| menu.push(service.type)} 

        # this displays the menu using the TTY-Prompt gem. It returns the selected type
        selection = TTY::Prompt.new.select("Choose a service type:", menu, cycle: true, marker: '>', echo: false)
            @services.each { |service| return service if service.type == selection }
    end



end




