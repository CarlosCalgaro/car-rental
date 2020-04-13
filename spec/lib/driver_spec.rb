require 'driver'
require 'car_factory'
require 'rental'

RSpec.describe Driver, "#driver" do 

    let(:driver_name){"Carlos"}
    let(:car){ CarFactory.get("Mercedes", CarStyles::SUV)}
    let(:rental){ Rental.new(car, 30)}
    
    subject{ Driver.new(driver_name)}


    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :add_rental}
    it { is_expected.to respond_to :statement }
    it { is_expected.to respond_to :add_rental}
    it { is_expected.not_to respond_to :bonus_points }
    it { is_expected.not_to respond_to :total_amount}
    it { is_expected.not_to respond_to :rentals_as_hash }


    context "In creation" do 
        it "should initialize with the name" do
            expect(subject.name).to eq(driver_name)
        end
    end
    
    context ".name" do
        it "should return the name" do 
            expect(subject.name).to eq(driver_name)
        end
    end

    context ".statement" do 
        context "if a rental is added" do 
            it "should return a string" do 
                subject.add_rental(rental)
                expect(subject.statement).to be_a(String)
            end
            
            it "should contain information about the driver" do 
                subject.add_rental(rental)
                expect(subject.statement).to include(subject.name)
            end
            
            it "should contain information about the rental" do 
                subject.add_rental(rental)
                expect(subject.statement).to include(rental.car.title, rental.amount.to_s, rental.bonus_points.to_s)
            end
        end

        context "if a rental isn't added" do 
            it "should return a string" do
                expect(subject.statement).to be_a(String)
            end
            
            it "should contain information about the driver" do
                expect(subject.statement).to include(subject.name)
            end
        end
    end
    
    context ".json_statement" do 
        context "if a rental is added" do 
            it "should return a string" do 
                subject.add_rental(rental)
                expect(subject.json_statement).to be_a(String)
            end
            
            it "should be parseable as a JSON" do 
                subject.add_rental(rental)
                statement = subject.json_statement
                expect{JSON.parse(statement)}.not_to raise_error
            end
            
            it "should contain keys" do 
                subject.add_rental(rental)
                statement_hash = JSON.parse(subject.json_statement).inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
                expect(statement_hash).to include(:driver, :rentals, :amount, :bonus_points)
            end
        end

        context "if a rental isn't added" do 
            it "should return a string" do 
                expect(subject.json_statement).to be_a(String)
            end
            
            it "should be parseable as a JSON" do 
                statement = subject.json_statement
                expect{JSON.parse(statement)}.not_to raise_error
            end
            
            it "should contain keys" do 
                statement_hash = JSON.parse(subject.json_statement).inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
                expect(statement_hash).to include(:driver, :rentals, :amount, :bonus_points)
            end
        end
        
    end
end