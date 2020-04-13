require_relative 'car'
require_relative 'cars/suv'

class Rental

  attr_reader :car, :days_rented
  
  def initialize(car, days_rented)
    raise ArgumentError, 'Error: invalid car' unless car.is_a?(Car)
    raise 'Error: days_rented invalid' unless days_rented.is_a?(Integer) && days_rented > 0
    @car = car
    @days_rented = days_rented
  end

  def bonus_points
   @car.bonus_points_for_days(@days_rented)
  end
  
  def amount
    @car.price_for_days(@days_rented)
  end

  def to_h
    {
      car: @car.title,
      bonus_points: bonus_points,
      amount: amount
    }
  end

end
  