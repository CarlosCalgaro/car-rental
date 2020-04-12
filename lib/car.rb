require_relative 'car_styles'

class Car
  include CarStyles

  attr_reader :title
  attr_accessor :style

  def initialize(title, style)
    raise ArgumentError, "Invalid Style" unless (style.is_a?(Integer) && style < 2)
    @title = title
    @style = style
  end
end
  
