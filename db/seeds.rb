# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

makes = ['Aston Martin', 'Audi', 'Bentley', 'BMW', 'Bugatti', 'Ferrari', 'Hennessey', 'Koenigsegg', 'Lamborghini', 'Land Rover', 'Lexus', 'Lotus', 'Maserati', 'McLaren', 'Mercedes-Benz', 'Porsche', 'Rolls-Royce', 'SSC', 'Tesla', 'W Motors']
years = 1950..2021

if User.count.zero?
  User.create(
    username: "administrator",
    email: "admin@admin.com",
    password: "administrator"
  )
  puts "Created Admin"
  
  User.create(
    username: "test",
    email: "test@test.com",
    password: "testing"
  )
  puts "Created test User"
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