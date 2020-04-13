require "./lib/car"

class Suv < Car 

    CODE = 1
    def initialize(title)
        super(title)
        @price_per_day = 30
    end


    def price_for_days(days)
        days * @price_per_day 
    end

end