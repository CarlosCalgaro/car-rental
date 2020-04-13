require 'car_factory'

RSpec.describe CarFactory, "#car_factory" do

    let(:car_title){ "Mercedes"}
    subject{CarFactory}
    it { is_expected.to respond_to :get }
    
    context ".get" do 
        it "should return the correct kind of car" do 
            car = subject.get(car_title, CarStyles::SUV)
            expect(car).to be_a(Suv)
        end

        it "should return the car with correct title" do 
            car = subject.get(car_title, CarStyles::SUV)
            expect(car.title).to eq(car_title)
        end
        
        it "should return an ArgumentError if wrong style is passed" do 
            wrong_code = -999
            expect{subject.get(car_title, wrong_code)}.to raise_error(ArgumentError)
        end

        it "should convert the title to string" do
            example_title = 10
            car = subject.get(example_title, CarStyles::SUV)
            expect(car.title).to be_a(String)
        end
    end
end