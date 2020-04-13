require 'car'
require "rubygems"
require "bundler/setup"

require 'pry'

RSpec.describe Car, "#car" do 

    let(:car_title){"Mercedes"}
    subject{ Car.new(car_title) }

    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :price_per_day }
    it { is_expected.to respond_to :price_for_days }

    context "In creation" do 
        it "shouldn't change it's title" do
            expect(subject.title).to eq(car_title)
        end
    end

    context ".bonus_points_for_days" do 
        it "Should return 1" do 
            days = 1
            expect(subject.bonus_points_for_days(1)).to eq(1)
        end
    end

end