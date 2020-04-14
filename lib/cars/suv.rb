require "./lib/car"

class Suv < Car 

    CODE = 1
    def initialize(title)
        super(title)
        @price_per_day = 30
    end

    def price_for_days(days)
        raise 'Error: days invalid' unless valid_days?(days)
        days * @price_per_day
    end

    def bonus_points_for_days(days)
        raise 'Error: days invalid' unless valid_days?(days)
        if days > 1
            return 2
        else 
            return 1 
        end 
    end
end