require_relative "car_styles"
require_relative "cars/saloon"
require_relative "cars/suv"
require_relative "cars/hatchback"

class CarFactory

    def self.get(title, style)
        case style
            when CarStyles::SALOON
                return Saloon.new(title)
            when CarStyles::SUV
                return Suv.new(title)
            when CarStyles::HATCHBACK
                return Hatchback.new(title)
            else
                raise ArgumentError, "Invalid Car Style"
        end
    end
end