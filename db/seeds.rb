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
engines = ['Electric', 'Hybrid', 'Inline 5', 'Inline 6', 'Rotary', 'V2', 'V3', 'V4', 'V6', 'V8', 'V10', 'V12', 'W12', 'W16']
fuel_types = ['Diesel', 'Dual Fuel', 'Electric', 'Gas Only', 'Hybrid', 'Petrol', 'Plug in Hybrid']
makes = ['Aston Martin', 'Audi', 'Bentley', 'BMW', 'Bugatti', 'Ferrari', 'Hennessey', 'Koenigsegg', 'Lamborghini', 'Land Rover', 'Lexus', 'Lotus', 'Maserati', 'McLaren', 'Mercedes-Benz', 'Pagani', 'Porsche', 'Rolls-Royce', 'Tesla', 'W Motors']
speeds = [5, 6, 7, 8, 9, 1]
states = ['ACT', 'NSW', 'NT', 'QLD', 'SA', 'TAS', 'VIC', 'WA']
transmissions = ['Automatic', 'Manual']
years = 2000..2021

aston_martin = ['DB9', 'DB11', 'DBC', 'DBS', 'DBX', 'Rapid', 'Valkyrie', 'Vanquish', 'Vantage', 'Virage']
audi = ['R8','RS Q8', 'RS3', 'RS4','RS5', 'RS6', 'RS7', 'TT RS']
bentley = ['Bacalar', 'Bentagyas', 'Continental GT', 'Flying Spur']
bmw = ['7-Series', '8-Series', 'i8', 'M3', 'M4', 'M5', 'M6', 'M7', 'M8', 'X6', 'X7']
bugatti = ['Chiron', 'Veyron', 'Veyron Supersport']
ferrari = ['458', '488', '599', '812 GTS', '812 Superfast', 'California', 'Enzo', 'F12', 'F430', 'F8 Spider', 'F8 Tributo', 'FF', 'FFX', 'GTC4Lusso', 'LaFerrari', 'Monza SP1', 'Monza SP2', 'Portifino M', 'Roma', 'SF90 Spider', 'SF90 Stradale']
hennessey = ['Venom GT', 'Venom F5']
koenigsegg = ['Agera', 'Agera R', 'Agera S', 'Agera RS', 'Agera Final', 'CCX', 'CCXR', 'CCXR Special Edition', 'Gemera', 'Jesko', 'Jesko Absolut', 'One:1', 'Regera']
lamborghini = ['Aventador', 'Centenario', 'Gallardo', 'Huracan', 'Murcieglago', 'Reventon', 'Sian', 'Urus', 'Veneno']
land_rover = ['Range Rover', 'Range Rover Autobiography', 'Range Rover SV', 'Range Rover Velar', 'Range Rover Vogue', 'Range Rover Vogue SE']
lexus = ['LFA', 'RC F', 'LC F']
lotus = ['Elise Cup220', 'Elise R', 'Elise S', 'Elise Sport 220', 'Elise Sprint', 'Elise Sprint 220', 'Evija', 'Evora 400', 'Evora GT', 'Exige']
maserati = ['GranTurismo', 'Levante', 'MC20', 'Quattroporte']
mclaren = ['12C', '540C', '570S', '600LT', '620R', '625C', '650S', '675LT', '720S', '765LT', 'Artura', 'Elva', 'F1', 'GT', 'P1', 'Senna', 'Speedtail']
mercedes_benz = ['AMG GT', 'AMG GT Coupe', 'AMG GT 4-Doors Coupe', 'AMG GT Roadster', 'C63 AMG', 'E63 AMG', 'G-class', 'GLS AMG', 'Maybach Exelero', 'Maybach GLS-class', 'Maybach S-class', 'S-class', 'SLR McLaren', 'SLS AMG']
pagani = ['Huayra', 'Huayra BC', 'Huayra Imola', 'Huayra R', 'Huayra Roadster', 'Huayra Roadster BC', 'Zonda Cinque', 'Zonda Cinque Roadster', 'Zonda F', 'Zonda Roadster F', 'Zonda R', 'Zonda Roadster']
porsche = ['718 Cayman', '718 Boxster', '718 Cayman S', '718 Boxster S', '718 Cayman GTS 4.0', '718 Boxster GTS 4.0', '718 Cayman GT4', '718 Spyder', '911 Carrera', '911 Carrera S', '911 Carrera 4S', '911 Carrera GTS', '911 Carrera 4 GTS', '911 Targa 4 GTS', '911 Turbo', '911 Turbo S', '911 GT3', 'Carrera GT', 'Cayenne GTS', 'Cayenne Turbo GT', 'Panamera 4 Executive', 'Panamera GTS', 'Panamera Turbo S', 'Panamera GTS Sport Turismo']
rolls_royce = ['Cullinan', 'Dawn', 'Ghost', 'Phantom', 'Wraith']
tesla = ['Model S', 'Model X']
w_motors = ['Fenyr SuperSport', 'Lykan Hypersport']

allmakes = [aston_martin, audi, bentley, bmw, bugatti, ferrari, hennessey, koenigsegg, lamborghini, land_rover, lexus, lotus, maserati, mclaren, mercedes_benz, pagani, porsche, rolls_royce, tesla, w_motors]

features = %w[Heated\ and\ Cooled\ Seats Carbon\ Fibre\ Package Carbon\ Ceramic\ Brakes Custom\ Paint Forged\ Carbon Alcantara\ Steering\ Wheel Navigation\ and\ Infotainment\ System Rear\ View\ Camera\ and\ Parking\ Sensors Removable\ Hard\ Top Travel\ Package Refrigerator\ Compartment Chrome\ Package Pirelli\ P-Zero\ Tyres Vinyl\ Wrap Paint\ Protection Heated\ Windscreen Privacy\ Glass Heated\ Steering\ Wheel Panoramic\ Roof Performance\ Package Front\ and Rear\ Parking\ Sensors Adaptive\ Cruise\ Control]

if Admin.count.zero?
  Admin.create(
    username: 'Administrator',
    email: 'admin@admin.com',
    password: 'administrator'
  )
  puts 'Created Admin'
end

def create_users(index)
  User.create(
    username: "user#{index}",
    email: "user#{index}@test.com",
    password: 'testing'
  )
  puts "Created User #{index}"
end

if User.count.zero?  
  User.create(
    username: 'test',
    email: 'test@test.com',
    password: 'testing'
  )
  puts 'Created Test User'
  10.times.with_index { |index| create_users(index + 1) }
end

if Make.count.zero?
  makes.each do |make|
    Make.create(name: make)
    puts "Created #{make} make"
  end
end

def populates_model(name, id)
  Model.create(name: name, make_id: (id+1))
  puts "Created #{Make.find(id+1).name} #{name}"
end

if Model.count.zero?
  allmakes.each_with_index { |make, index| make.each { |model| populates_model(model, index) } }
end

if Year.count.zero?
  years.each do |year|
    Year.create(year: year)
    puts "Created #{year} year"
  end
end

# Only have 5, 6, and 7 speed Manual transmissions 
# (There's only a handful of cars with with 7sp Manual). 
# Added an exceptional case to have a 1-sp transmission 
# for Koenigsegg Regera which only has a single gear.
if Speed.count.zero?
  transmissions.each do |transmission|
    Transmission.create(name: transmission)
    puts "Created #{transmission} transmission"
    
    if transmission == 'Manual'
      3.times do |i|
        Speed.create(name: speeds[i], transmission_id: 2)
        puts "Created #{speeds[i]}sp Manual transmission"
      end
    else
      speeds.each do |speed|
        Speed.create(name: speed, transmission_id: 1)
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
def door_selection(door, id, body_type)
  Door.create(name: door, body_type_id: (id + 1))
  puts "Created #{door}door #{body_type}"
end

if Door.count.zero?
  body_types.each_with_index do |body_type, id|
    BodyType.create(name: body_type)
    puts "Created #{body_type} body type"

    # assigns odd no. of doors to Hatch body type and even for rest
    if body_type == 'Hatch'
      doors.select(&:odd?).each { |door| door_selection(door, id, body_type) }
    else
      doors.select(&:even?).each { |door| door_selection(door, id, body_type) }
    end        
  end
end

if Colour.count.zero?
  colours.each do |colour|
    Colour.create(name: colour)
    puts "Created #{colour} colour"
  end
end

if Feature.count.zero?
  features.sort!
  features.each do |feature|
    Feature.create(name: feature)
    puts "Created #{feature} feature"
  end
end
