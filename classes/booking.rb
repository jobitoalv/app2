require_relative 'dog'
require_relative 'header'

class Booking
    attr_reader :days

    def initialize(service, days)
        @service = service      
        @days = days      
    end

    # displays the booking
    def display_booking(dog, salon)
        puts HEADER_LINE
        puts "#{dog.name.upcase}'S BOOKING".center(HEADER_LENGTH)
        puts HEADER_LINE
        puts
        puts salon.name
        salon.contact_info
        puts
        puts "Service Type: #{@service.type}"
        @service.display_features
        puts
        puts "Booking Day:"
        @days.each { |day| puts "       * #{day}"}
        puts
    end

end



