require_relative 'car_styles'

class Car
  include CarStyles

  attr_reader :title
  attr_reader :price_per_day
  
  def initialize(title)
    @title = title
    @price_per_day = nil
  end

  def price_for_days(days) 
    days * @price_per_day
  end
end
  
