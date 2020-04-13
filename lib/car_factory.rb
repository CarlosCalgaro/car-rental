require_relative "car_styles"
require_relative "cars/saloon"
require_relative "cars/suv"
require_relative "cars/hatchback"

class CarFactory

    def self.get(title, style)
        case style
            when CarStyles::SALOON
                return Saloon.new(title.to_s)
            when CarStyles::SUV
                return Suv.new(title.to_s)
            when CarStyles::HATCHBACK
                return Hatchback.new(title.to_s)
            else
                raise ArgumentError, "Error: Invalid Car Style"
        end
    end
end