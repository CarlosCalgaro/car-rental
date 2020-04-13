require "./lib/car"

class Saloon < Car 

    CODE = 0
    def initialize(title)
        super(title)
        @price_per_day = 15
    end


    def price_for_days(days)
        amount = 20 
        if days > 2
            amount += (days - 2) * @price_per_day
        end
        amount
    end

end