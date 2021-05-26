require_relative '../classes/dog'

describe "dog booking" do 
    it "should choose service type based on weight" do 
        dog = Dog.new("Missy", 9)
        service = dog.choose_service
        expect(service.type).to eq("Basic")
    end 
end 