require "./lib/car"

class Saloon < Car 

    CODE = 0
    def initialize(title)
        super(title)
        @price_per_day = 15.to_f
    end


    def price_for_days(days)
        raise 'Error: days invalid' unless valid_days?(days)
        amount = 20.to_f
        if days > 2
            amount += (days - 2) * @price_per_day
        end
        amount.to_f
    end

end