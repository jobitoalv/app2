
require 'tty-prompt'
require_relative './classes/salon'
require_relative './classes/service'
require_relative './classes/dog'
require_relative './classes/booking'
require_relative './classes/header'

# service and salon create 
salon = Salon.new.add_service(Deluxe.new).add_service(Basic.new).add_service(Clip.new)

def weight_checker 
    puts" what`s your dog weight?:" 
    weight = gets.strip.to_i
    until weight > 5 
        begin
          if weight >! 5
          end 
        rescue 
          puts "Input must be a reasonable weight, try again"
          weight = gets.strip.to_i
        end 
        return weight
    end 
end 




# Welcome message
clear
welcome(salon)

# Enter dogs detail 
puts "\n    Hola lets start ! \n\n"
puts "Please enter your Furbaby's name : \n\n"

#this is to make sure we can get the correct input from user in 2 try 
dog_name_count = 0
while dog_name_count < 2
    dog_name = gets.chomp.capitalize

    # exits the loop if the user types in a name
    if dog_name != "" 
        clear
        break

    # continues the loop until the user types in a name.
    else
        dog_name_count += 1
        if dog_name_count == 2
            clear
            puts "\n\n Do you really have a dog?..."
            clear
            puts" we are now closing this till you get a dog "
            exit  
            dog_name = puts "The hero Without A Name"
        else
            puts "OMG dont make me exit you out ?:"
        end
    end
end

puts "Please enter weight: \n\n"
weight = gets.chomp.to_i
# Creates a new dog object.
dog = Dog.new(dog_name, weight)
puts "\n\n woofff wooff good boy #{dog.name}!"

# Main  Loop 
while true
    
    #TTY-Prompt gem
    welcome(salon)
    selection = TTY::Prompt.new.select("How may can I help you? Please select from the following options:",  cycle: true, marker: '>', echo: false) do |menu|
        menu.choice('Make a new booking', 1)
        menu.choice('View an existing booking', 2)
        menu.choice('View Grooming Services', 3)
        menu.choice('View Grooming salon information', 4)
        menu.choice('Exit', 5)

        case selection

        # 1. Make a new booking
        when 1

            if dog.booking
                clear
                welcome(salon)
                puts "\n\n\n You already have a booking! \n\n\n"

            # no booking 
            else
                new_booking_header
                service = dog.choose_service
                
                new_booking_header
                service.display_service
                service.display_features
                booking_days = service.select_days

                
                while booking_days.length == 0
                    new_booking_header
                    puts "\n\n Ooops, no date were selected. \n\n\n"
                    booking_days = service.select_days
                end

                # creates the booking
                dog.booking = Booking.new(service, booking_days)

                # loading screen just for fun after seeing all my class mates loading page.
                loading_screen("Loading your booking right now please be patient, you might get a treat after......")

                clear
                puts "Thank you for your booking!"
                dog.booking.display_booking(dog, salon)
                back_main_menu
            end

        # View an existing booking
        when 2
            
            if dog.booking
                clear
                dog.booking.display_booking(dog, salon)
                back_main_menu
            else
                clear
                welcome(salon)
                puts "\n\n you don't have a booking yet! \n\n\n"
            end

        when 3
            view_services_header
            service = salon.select_service
            
            service_name_header(service.type)
            service.display_service
            service.display_features
            service.display_availability
            back_main_menu

        when 4
            clear
            salon.salon_info
            back_main_menu

        # exit
        when 5
            if dog.booking
                clear
                puts "Thank you #{dog_name}!"
                puts "can't wait to make your bestfriend the most handsomeboy in the block on #{dog.booking.days[0]}." 
                puts "Have a lovely day amigo!"
                return
            
            else 
                clear
                puts "Thank you #{dog_name}"
                puts " Gracias and have a lovely day now go and play with your doggie "
                return
            end
        end
    end
end
