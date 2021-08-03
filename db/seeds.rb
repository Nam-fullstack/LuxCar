# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

body_types = ['Convertible', 'Coupe', 'Hatch', 'Sedan', 'SUV', 'Wagon']
colours = ['Beige', 'Black', 'Blue', 'Bronze', 'Brown', 'Burgundy', 'Gold', 'Green', 'Grey', 'Magenta', 'Maroon', 'Orange', 'Other', 'Pink', 'Purple', 'Red', 'Silver', 'White', 'Yellow']
doors = [2, 3, 4, 5]
drives = ['4WD', 'AWD', 'FWD', 'RWD']
engines = ['Electric', 'V2', 'V3', 'V4', 'Inline 5', 'V6', 'Inline 6', 'V8', 'V10', 'V12', 'W16']
fuel_types = ['Diesel', 'Dual Fuel', 'Electric', 'Gas Only', 'Hybrid', 'Petrol', 'Plug in Hybrid']
makes = ['Aston Martin', 'Audi', 'Bentley', 'BMW', 'Bugatti', 'Ferrari', 'Hennessey', 'Koenigsegg', 'Lamborghini', 'Land Rover', 'Lexus', 'Lotus', 'Maserati', 'McLaren', 'Mercedes-Benz', 'Porsche', 'Rolls-Royce', 'SSC', 'Tesla', 'W Motors']
speeds = [5, 6, 7, 8, 9, 1]
states = ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA']
transmissions = ['Automatic', 'Manual']
years = 1990..2021


if Admin.count.zero?
  Admin.create(
    username: "Administrator",
    email: "admin@admin.com",
    password: "administrator"
  )
  puts "Created Admin"
end

if User.count.zero?  
  User.create(
    username: "test",
    email: "test@test.com",
    password: "testing"
  )
  puts "Created test User"

  User.create(
    username: "test2",
    email: "test2@test.com",
    password: "testing"
  )
  puts "Created test User 2"
end

if Make.count.zero?
  makes.each do |make|
    Make.create(name: make)
    puts "Created #{make} make"
  end
end

if Year.count.zero?
  years.each do |year|
    Year.create(year: year)
    puts "Created #{year} year"
  end
end

if Speed.count.zero?
  speeds.each do |speed|
    Speed.create(name: speed)
    puts "Created #{speed}sp"
  end
end

# Only have 5 and 6 speed Manual transmissions (and a few with 7sp). 
# Added an exceptional case to have a 1-sp transmission 
# for Koenigsegg Regera which only has a single gear.
if Transmission.count.zero?
  transmissions.each do |transmission|
    if transmission == 'Manual'
      3.times do |i|
        Transmission.create(name: transmission, speed: speeds[i])
        puts "Created #{speeds[i]}sp #{transmission} transmission"
      end
    else
      speeds.each do |speed|
        Transmission.create(name: transmission, speed: speed)
        puts "Created #{speed}sp #{transmission} transmission"
      end
    end
  end
end

if Fuel.count.zero?
  fuel_types.each do |fuel|
    Fuel.create(name: fuel)
    puts "Created #{fuel} fuel type"
  end
end

if Engine.count.zero?
  engines.each do |engine|
    Engine.create(name: engine)
    puts "Created #{engine} engine"
  end
end

if DriveType.count.zero?
  drives.each do |drive|
    DriveType.create(name: drive)
    puts "Created #{drive} drivetrain"
  end
end

if State.count.zero?
  states.each do |state|
    State.create(name: state)
    puts "Created #{state} state"
  end
end

if Door.count.zero?
  doors.each do |door|
    Door.create(name: door)
    puts "Created #{door} doors"
  end
end

if BodyType.count.zero?
  body_types.each do |body_type|
    BodyType.create(name: body_type)
    puts "Created #{body_type} body type"
  end
end