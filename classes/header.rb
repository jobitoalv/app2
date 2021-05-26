# Some beautiful headers and useful functions for our main app

require 'tty-prompt'
require 'colorize'

# Line for the headers
HEADER_LINE = "_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^_^"
HEADER_LENGTH = HEADER_LINE.length

#clear to make user terminal much easier to see 
def clear
    puts "\e[2J\e[f"
end

# Returns user to the main menu
def back_main_menu
    puts "\n\n Press any key to go back to the main menu"
    $stdin.getch
    clear
end

#an idea added from looking at peoples presentations.
def loading_screen(string)                                           
    string.length.times do |i|
        clear
        
        # Please wait header 
        puts HEADER_LINE
        puts "Please Wait...".upcase.center(HEADER_LENGTH)
        puts HEADER_LINE
        puts
        puts string[0, i].center(HEADER_LENGTH)
        sleep(0.2)
    end
end

# Welcome to the app
def welcome(salon)
    puts
    puts HEADER_LINE
    puts "WELCOME TO ".center(HEADER_LENGTH)
    puts "#{salon.name} Dog Grooming !".center(HEADER_LENGTH).colorize(:light_blue)
    puts HEADER_LINE
    puts
end

# header for when placing a new booking
def new_booking_header
    clear
    puts
    puts HEADER_LINE
    puts "lets play a game and create your baby a booking".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
    puts
end

# header for when selecting grooming service 
def view_services_header
    clear
    puts
    puts HEADER_LINE
    puts "View services".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
    puts
end

# header for when viewing selected service
def service_name_header(service_name)
    clear
    puts
    puts HEADER_LINE
    puts "#{service_name} Service".upcase.center(HEADER_LENGTH)
    puts HEADER_LINE
end