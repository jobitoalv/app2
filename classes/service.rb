require 'tty-prompt'

class Service
    attr_reader :type, :features, :price, :availability

    def initialize(type, features, price, availability)
        @type = type
        @features = features               
        @price = '%.2f' % price
        @availability = availability       
    end

    # displays the service type and it's price
    def display_service
        puts "Grooming Service Type: #{@type}"
        puts "Price: $#{@price} per Style"
    end
    
    # displays service type
    def display_features
        puts
        puts "Features:"
        @features.each { |feature| puts "       * #{feature}"}
    end

    def display_availability
        puts
        puts "Availability:"
        @availability.each { |day, status| puts "       * #{day}: #{status}"}
    end

    def select_days
        days_menu = []
        days_selected = []
        select_days_menu(days_menu)
        select_days_selection(days_selected, days_menu)
        return days_selected
    end

    def select_days_menu(days_menu)
        @availability.each do |day, status|
            if status != "Available"                                           
                days_menu.push({name: day.to_s, disabled: "Booked Out"})    
            else                                                                
                days_menu.push(name: day.to_s)                            
            end
        end
    end
    
    def select_days_selection(days_selected, days_menu)
        TTY::Prompt.new.multi_select("Please select your days to book in:", days_menu, cycle: true, marker: '>', echo: false, per_page: 7).each do |day|
            @availability[day.to_sym] = "Booked Out"
            days_selected.push(day)
        end
    end
end

class Deluxe < Service
    def initialize
        super("Deluxe", ["Breed/style body trim , scissor finish", "shampoo and conditioner bath", "tear stain treatment", "full body brunsh"], 90, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Available", Sunday: "Available"})
    end
end

class Basic < Service
    def initialize
        super("Basic", ["Breed/style body trim , scissor finish", "shampoo and conditioner bath", "tear stain treatment", "full body brunsh"], 60, {Monday: "Available", Tuesday: "Available", Wednesday: "Available", Thursday: "Available", Friday: "Available", Saturday: "Booked Out", Sunday: "Booked Out"})
    end
end

class Clip < Service
    def initialize
        super("Full Body Clip", ["Shorter Lenght", "Blow Dry", "Nail Trimming ", "Ear CLeaning"], 45, {Monday: "Available", Tuesday: "Available", Wednesday: "Booked Out", Thursday: "Booked Out", Friday: "Available", Saturday: "Available", Sunday: "Available"})
    end
end




