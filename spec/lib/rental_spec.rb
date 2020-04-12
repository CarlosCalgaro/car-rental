require 'rental'


require 'pry'
RSpec.describe Rental do 
    
    CAR_TITLE="Mercedes"
    context "#initialize" do 

        context "When passing the car argument" do 
            it "raises argument error if wrong class is passed" do 
                expect{Rental.new("this is not a car", 30)}.to raise_error(ArgumentError)
            end
        end

        context "When passing the days_passed" do 
            it "raises argument error if wrong class is passed as days_passed" do 
                car = Car.new(CAR_TITLE, Car::SUV)
                expect{Rental.new(car, "this is not a integer")}.to raise_error(RuntimeError)
            end
    
            it "raises argument error if " do 
                car = Car.new(CAR_TITLE, Car::SUV)
                expect{Rental.new(car, "this is not a integer")}.to raise_error(RuntimeError)
            end
        end

        
    end
end