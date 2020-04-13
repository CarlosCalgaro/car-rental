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
    bonus_points = 1
    bonus_points -= 10 if amount < 0
    bonus_points += 1  if @car.is_a?(Suv) && @days_rented > 1 
    bonus_points
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
  