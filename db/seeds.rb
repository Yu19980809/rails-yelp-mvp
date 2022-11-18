# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Deleting previous restaurants......'
Restaurant.destroy_all
puts 'Finished deleting'

puts 'Creating new restaurant......'

5.times do
  r = Restaurant.new
  r.name = Faker::Restaurant.name
  r.address = Faker::Address.street_address
  r.phone_number = Faker::PhoneNumber.phone_number_with_country_code
  r.category = %w[chinese italian japanese french belgian].sample
  r.save

  puts "Created #{r.id} - #{r.name}"
end

puts "Finished creating, #{Restaurant.count} restaurants have been created."
