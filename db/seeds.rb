# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

body_types = ['Convertible', 'Coupe', 'Sedan', 'SUV', 'Wagon', 'Hatch']
colours = ['Beige', 'Black', 'Blue', 'Bronze', 'Brown', 'Burgundy', 'Gold', 'Green', 'Grey', 'Magenta', 'Maroon', 'Orange', 'Other', 'Pink', 'Purple', 'Red', 'Silver', 'White', 'Yellow']
doors = [2, 3, 4, 5]
drives = ['4WD', 'AWD', 'FWD', 'RWD']
engines = ['Electric', 'Rotary', 'V2', 'V3', 'V4', 'Inline 5', 'Inline 6', 'V6', 'V8', 'V10', 'V12', 'W16']
fuel_types = ['Diesel', 'Dual Fuel', 'Electric', 'Gas Only', 'Hybrid', 'Petrol', 'Plug in Hybrid']
makes = ['Aston Martin', 'Audi', 'Bentley', 'BMW', 'Bugatti', 'Ferrari', 'Hennessey', 'Koenigsegg', 'Lamborghini', 'Land Rover', 'Lexus', 'Lotus', 'Maserati', 'McLaren', 'Mercedes-Benz', 'Porsche', 'Rolls-Royce', 'SSC', 'Tesla', 'W Motors']
speeds = [5, 6, 7, 8, 9, 1]
states = ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA']
transmissions = ['Automatic', 'Manual']
years = 1990..2021

if Admin.count.zero?
  Admin.create(
    username: 'Administrator',
    email: 'admin@admin.com',
    password: 'administrator'
  )
  puts 'Created Admin'
end

if User.count.zero?  
  User.create(
    username: 'test',
    email: 'test@test.com',
    password: 'testing'
  )
  puts 'Created test User'

  User.create(
    username: 'test2',
    email: 'test2@test.com',
    password: 'testing'
  )
  puts 'Created test User 2'
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

# Only have 5 and 6 speed Manual transmissions (and a few with 7sp). 
# Added an exceptional case to have a 1-sp transmission 
# for Koenigsegg Regera which only has a single gear.
if Transmission.count.zero?
  transmissions.each do |transmission|
    Transmission.create(name: transmission)
    puts "Created #{transmission} transmission"
    
    if transmission == 'Manual'
      3.times do |i|
        Speed.create(name: speeds[i], transmission_id: 1)
        puts "Created #{speeds[i]}sp Manual transmission"
      end
    else
      speeds.each do |speed|
        Speed.create(name: speed, transmission_id: 0)
        puts "Created #{speed}sp Automatic transmission"
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

# Refactored door selection to create entries based on body type,
# with hatches having odd number of doors.
def door_selection(door, i, body_type)
  Door.create(name: door, body_type_id: i)
  puts "Created #{door}door #{body_type}"
end

if BodyType.count.zero?
  body_types.each_with_index do |body_type, i|
    BodyType.create(name: body_type)
    puts "Created #{body_type} body type"

    # assigns odd no. of doors to Hatch body type and even for rest
    if body_type == 'Hatch'
      doors.select(&:odd?).each do |door|
        door_selection(door, i, body_type)
      end
    else
      doors.select(&:even?).each do |door|
        door_selection(door, i, body_type)
      end
    end        
  end
end

if Colour.count.zero?
  colours.each do |colour|
    Colour.create(name: colour)
    puts "Created #{colour} colour"
  end
end