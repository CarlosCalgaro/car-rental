require_relative 'car_styles'

class Car

  attr_reader :title
  attr_reader :price_per_day
  
  def initialize(title)
    @title = title
    @price_per_day = 0
  end

  # The default bonus point for a rent is 1
  # If the car is an SUV, it should return the default bonus points + 1
  # There was a condition where the  bonus points were supposed to be decreased by 10
  # if the total amount were negative, but the amount can never be negative

  def bonus_points_for_days(days) 
    raise 'Error: days invalid' unless valid_days?(days)
    return 1
  end
  
  def price_for_days(days) 
    raise 'Error: days invalid' unless valid_days?(days)
    return 0
  end

  private
  
  def valid_days?(days)
    days.is_a?(Integer) && days > 0
  end
end
  
