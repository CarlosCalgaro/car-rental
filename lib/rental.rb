require 'car'
class Rental

  attr_reader :car, :days_rented
  
  def initialize(car, days_rented)
    raise ArgumentError, 'Error: invalid car' unless car.is_a?(Car)
    raise 'Error: days_rented invalid' unless days_rented.is_a?(Integer) && days_rented > 0
    @car = car
    @days_rented = days_rented
  end
end
  