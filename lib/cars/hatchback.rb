require "./lib/car"

class Hatchback < Car 

    CODE = 2
    def initialize(title)
        super(title)
        @price_per_day = 15
    end


    def price_for_days(days)
        amount = 15
        if days > 3
            amount  += (days - 3) * @price_per_day
        end
    end

end