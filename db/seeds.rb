# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

property = Property.first
ActsAsTenant.current_tenant = property.account

units_attributes = [
  { name: "Unit 1", bedrooms: 3, bathrooms: 2, rent: 15000 },
  { name: "Unit 2", bedrooms: 2, bathrooms: 1, rent: 12000 },
  { name: "Unit 3", bedrooms: 4, bathrooms: 1, rent: 10000 },
  { name: "Unit 4", bedrooms: 3, bathrooms: 2, rent: 15000 },
  { name: "Unit 5", bedrooms: 2, bathrooms: 1, rent: 12000 },
  { name: "Unit 6", bedrooms: 1, bathrooms: 1, rent: 10000 },

]

units_attributes.each do |unit_attributes|
  property.units.create(unit_attributes)
end
