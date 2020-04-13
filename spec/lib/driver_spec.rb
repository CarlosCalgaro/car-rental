require 'driver'
RSpec.describe Driver, "#driver" do 

    DRIVER_NAME = "Carlos"
    context "In creation" do 
        it "should initialize with name" do
            driver = Driver.new(DRIVER_NAME)
            expect(driver.name).to eq(DRIVER_NAME)
        end
    end

    context ".name" do
        it "should respond to the name method" do 
            driver = Driver.new(DRIVER_NAME)
            expect(driver).to respond_to(:name)
        end
    end 

    
    #    context ".car" do 
    #        it "should have a public getter" do 
    #            car = Car.new(CAR_TITLE, Car::SUV)
    #            expect(car).to respond_to(:title)
    #        end
    #    end
    #
    #
    #    context ".days_rented" do 
    #        it "should have a public getter" do 
    #            car = Car.new(CAR_TITLE, Car::SUV)
    #            expect(car).to respond_to(:style)
    #        end
    #        
    #        it "should have a public setter" do 
    #            car = Car.new(CAR_TITLE, Car::SUV)
    #            expect(car).to respond_to("style")
    #        end
    #    end
end