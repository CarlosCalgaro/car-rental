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
            it "raises argument error if wrong class is passed" do 
                car = Car.new(CAR_TITLE, Car::SUV)
                expect{Rental.new(car, "this is not a integer")}.to raise_error(RuntimeError)
            end
    
            it "raises runtime error if invalid  day is passed" do 
                car = Car.new(CAR_TITLE, Car::SUV)
                invalid_day = -1
                expect{Rental.new(car, invalid_day)}.to raise_error(RuntimeError)
            end
        end
    end
    
    context ".car" do 
        it "should have a public getter" do 
            car = Car.new("Mercedes", Car::SUV)
            rental = Rental.new(car, 30)
            expect(rental).to respond_to(:car) 
        end
    end
   
    context ".days_rented" do 
        it "should have a public getter" do 
            car = Car.new("Mercedes", Car::SUV)
            rental = Rental.new(car, 30)
            expect(rental).to respond_to(:days_rented) 
        end
    end

end