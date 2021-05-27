require_relative './service'

#main class fo dog 
class Dog
    attr_accessor :booking, :name

    def initialize(name, weight)
        @name = name
        @booking = nil
        @weight = weight
        @service = nil
    end

    def choose_service
        if @weight <= 10
            puts" based on your dog`s weight: #{@weight} we have choosen a basic service"
           @service = Basic.new 
        end
    end
end
