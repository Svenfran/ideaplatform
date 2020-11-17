# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

categories = ["E-Mobility", "Healthcare", "Automotive", "Computerscience", "Environment"]

categories.each do |c|
    category = Category.create(name: c)
    category.save
end
