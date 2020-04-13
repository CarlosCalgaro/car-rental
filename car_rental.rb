module CarStyles
    SALOON = 0
    SUV = 1
    HATCHBACK = 2 
end

class Car

  attr_reader :title
  attr_reader :price_per_day
  
  def initialize(title)
    @title = title
    @price_per_day = 0
  end

  # The default bonus point for a rent is 1
  # If the car is an SUV, it should return the default bonus points + 1
  # There was a condition where the  bonus points were supposed to be decreased by 10
  # if the total amount were negative, but the amount can never be negative

  def bonus_points_for_days(days) 
    raise 'Error: days invalid' unless valid_days?(days)
    return 1
  end
  
  def price_for_days(days) 
    raise 'Error: days invalid' unless valid_days?(days)
    return 0
  end

  private
  
  def valid_days?(days)
    days.is_a?(Integer) && days > 0
  end
end
  
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

class Suv < Car 

    CODE = 1
    def initialize(title)
        super(title)
        @price_per_day = 30.to_f
    end

    def price_for_days(days)
        raise 'Error: days invalid' unless valid_days?(days)
        days.to_f * @price_per_day
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

class Rental

  attr_reader :car, :days_rented
  
  def initialize(car, days_rented)
    raise ArgumentError, 'Error: invalid car' unless car.is_a?(Car)
    raise 'Error: days_rented invalid' unless days_rented.is_a?(Integer) && days_rented > 0
    @car = car
    @days_rented = days_rented
  end

  def bonus_points
   @car.bonus_points_for_days(@days_rented)
  end
  
  def amount
    @car.price_for_days(@days_rented)
  end

  def to_h
    {
      car: @car.title,
      bonus_points: bonus_points,
      amount: amount
    }
  end

end

class Driver
  
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end

  def statement
    statement = "Car rental record for #{@name}\n"
    rentals_as_hash.each do |rental|
      statement+="#{rental[:car]}, #{rental[:amount]}\n"
    end
    statement += "Amount owed is € #{total_amount}\n"
    statement += "Earned bonus points: #{bonus_points}"
    statement 
  end
  
  def json_statement 
    {
        driver: name,
        rentals: rentals_as_hash,
        amount: total_amount,
        bonus_points: bonus_points
    }.to_json
    
  end

  private

  def bonus_points
    @rentals.sum{|e| e.bonus_points}
  end

  def total_amount 
    @rentals.sum{|e| e.amount}
  end

  def rentals_as_hash
    @rentals.map{|e| e.to_h}
  end
end
  
  