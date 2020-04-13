require "./lib/car"

class Hatchback < Car 

    CODE = 2
    def initialize(title)
        super(title)
        @price_per_day = 15.to_f
    end


    def price_for_days(days)
        raise 'Error: days invalid' unless valid_days?(days)
        amount = 15.to_f
        if days > 3
            amount  += (days - 3) * @price_per_day
        end
        amount.to_f
    end

end