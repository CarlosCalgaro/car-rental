carlos = Driver.new("Carlos")

suv = Car.new("Mercedes", Car::SUV) 

saloon = Car.new("Mercedes", Car::SALOON) 

hatchback = Car.new("Mercedes", Car::HATCHBACK) 

rentals = []
for i in 1..10 do 
    rentals << Rental.new(suv, i)
end

for i in 20..30 do 
    rentals << Rental.new(saloon, i)
end

for i in 30..40 do 
    rentals << Rental.new(hatchback, i)
end

rentals.each do |rental|
    carlos.add_rental(rental)
end
puts carlos.statement