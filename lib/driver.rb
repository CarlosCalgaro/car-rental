require 'json'
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
      statement+="#{rental[:car]},#{rental[:amount]}\n"
    end
    statement += "Amount owed is €#{total_amount}\n"
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
  
  