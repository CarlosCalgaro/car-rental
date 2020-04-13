require 'rental'
require 'pry'
require 'car_factory'

RSpec.describe Rental do
    
    let(:car_title){"Mercedes"}
    let(:days_rented){30}
    let(:car){CarFactory.get(car_title, CarStyles::SUV)}

    subject{Rental.new(car, days_rented)}

    it { is_expected.to respond_to :car }
    it { is_expected.to respond_to :days_rented}
    it { is_expected.to respond_to :bonus_points}
    it { is_expected.to respond_to :amount}
    it { is_expected.to respond_to :to_h}

    context "#initialize" do 
        context "When passing an invalid car" do 
            it "raises argument error" do 
                expect{Rental.new("this is not a car", 30)}.to raise_error(ArgumentError)
            end
        end

        context "When passing an invalid days_passed" do 
            it "raises argument error" do 
                expect{Rental.new(car, "this is not a integer")}.to raise_error(RuntimeError)
            end
    
            it "raises runtime error if an invalid day is passed" do 
                invalid_day = -1
                expect{Rental.new(car, invalid_day)}.to raise_error(RuntimeError)
            end
        end
    end

    context ".bonus_points" do 
        it "should return a integer" do 
            expect(subject.bonus_points).to be_a(Integer)
        end

        it "should return 2 if the car is a SUV" do 
            expect(subject.bonus_points).to eq(2)
        end
        
        it "should return 1 if the car is not a SUV" do
            another_car = CarFactory.get(car_title, CarStyles::SALOON)
            another_subject = Rental.new(another_car, days_rented)
            expect(another_subject.bonus_points).to eq(1)
        end
    end

    context ".amount" do 
        it "should return a float" do 
            expect(subject.amount).to be_a(Float)
        end
    end

    context ".to_h" do 
        it "should return a hash" do 
            expect(subject.to_h).to be_a(Hash)
        end
        
        it "should contain specific keys" do 
            expect(subject.to_h).to include(:car, :bonus_points, :amount)
        end
    end

end