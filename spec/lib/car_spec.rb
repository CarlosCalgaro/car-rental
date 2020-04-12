require 'car'

RSpec.describe Car, "#car" do 

    CAR_TITLE = "Mercedes"
    context "In creation" do 
        it "raises argument error if wrong argument class is passed" do 
            expect{Car.new(CAR_TITLE, "C200")}.to raise_error(ArgumentError)
        end

        it "raises argument error if non-existing style is passed" do 
            expect{Car.new(CAR_TITLE, 999999)}.to raise_error(ArgumentError)
        end

        it "shouldn't change it's title" do 
            car = Car.new(CAR_TITLE, Car::SUV)
            expect(car.title).to eq(CAR_TITLE)
        end
    end

    context ".title" do 
        it "should have a public getter" do 
            car = Car.new(CAR_TITLE, Car::SUV)
            expect(car).to respond_to(:title)
        end
    end


    context ".style" do 
        it "should have a public getter" do 
            car = Car.new(CAR_TITLE, Car::SUV)
            expect(car).to respond_to(:style)
        end
        
        it "should have a public setter" do 
            car = Car.new(CAR_TITLE, Car::SUV)
            expect(car).to respond_to("style")
        end
    end
end