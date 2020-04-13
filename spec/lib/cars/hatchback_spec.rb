require "rubygems"
require "bundler/setup"
require 'car_factory'

RSpec.describe Hatchback, "#hatchback" do 

    let(:car_title){"Mercedes"}

    subject{ CarFactory.get(car_title, CarStyles::HATCHBACK) }

    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :price_per_day }
    it { is_expected.to respond_to :price_for_days }

    context "In creation" do 
        it "shouldn't change it's title" do
            expect(subject.title).to eq(car_title)
        end
    end

    context ".price_for_days" do
        context "for days between 1 and 3 days" do 
            it "should return 15" do 
                expect(subject.price_for_days(1)).to eq(15)
                expect(subject.price_for_days(2)).to eq(15)
                expect(subject.price_for_days(3)).to eq(15)
            end
        end
        context "for more than 3 days" do 
            it "should return (15 + ((days - 3) * price))" do 
                days = 30 
                expected = 15 + ((days - 3) * subject.price_per_day)
                price = subject.price_for_days(days)
                expect(price).to eq(expected)
            end
        end
        
        context "for less than 1 day" do 
            it "should raise runtime error" do 
                expect{subject.price_for_days(-1)}.to raise_error(RuntimeError)
                expect{subject.price_for_days(0)}.to raise_error(RuntimeError)
            end
        end
        
    end

    context ".bonus_points_for_days" do
        context "when calculating for 1 or more days" do 
            it "should return 2" do 
                expect(subject.bonus_points_for_days(2)).to eq(1)
                expect(subject.bonus_points_for_days(3)).to eq(1)
                expect(subject.bonus_points_for_days(20)).to eq(1)
            end
        end

        context "when calculating for days lesser than 1" do 
            it "should raise runtime error" do 
                expect{subject.bonus_points_for_days(-1)}.to raise_error(RuntimeError)
                expect{subject.bonus_points_for_days(0)}.to raise_error(RuntimeError)
            end
        end
    end

end