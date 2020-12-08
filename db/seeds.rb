# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning db..."
IdeaProblemCategory.destroy_all
IdeaProblem.destroy_all
User.destroy_all
Category.destroy_all

# CATEGORIES
puts "Creating categories..."
category_list = ["E-Mobilität", "Gesundheitswesen", "Automotive", "Computerwissenschaften", "Umwelt", "Ecommerce", "BEV", "Verkehrstechnik", "Schienenverkehr", "Sonstige", "Kunst", "Kultur"]

category_list.each do |c|
    category = Category.create(name: c)
    category.save
end

# USERS
puts "Creating users..."
user1 = User.create(email: "john@example.com", password: "password")
user2 = User.create(email: "jeff@example.com", password: "password")
user3 = User.create(email: "ben@example.com", password: "password")
user1.save
user2.save
user3.save


# IDEAS
puts "Creating ideas..."
idea_title = "Reicheweitenverlängerung für E-Fahrzeuge in Kombination mit Schienenverkehr und noch viel mehr!"
idea_description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut egestas purus id fringilla lobortis. Curabitur quis urna nec ligula facilisis blandit auctor sed libero. Fusce vitae dictum libero. Maecenas quis lorem tortor. Donec lobortis dolor vitae auctor tincidunt. Ut aliquet sollicitudin efficitur. Duis accumsan ante sem, vitae accumsan ante suscipit id. Nulla at pellentesque nisl. Donec in dui vitae dolor viverra posuere varius eget libero. Fusce pharetra nisi vel metus dictum varius. Morbi interdum est non quam tempus, eu aliquet diam commodo. Maecenas et massa molestie, efficitur nunc ut, consequat metus. Aenean feugiat dolor eu ipsum gravida, nec hendrerit eros tincidunt. Suspendisse non enim semper, suscipit augue quis, ultrices diam. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut egestas purus id fringilla lobortis. Curabitur quis urna nec ligula facilisis blandit auctor sed libero. Fusce vitae dictum libero. Maecenas quis lorem tortor. Donec lobortis dolor vitae auctor tincidunt. Ut aliquet sollicitudin efficitur. Duis accumsan ante sem, vitae accumsan ante suscipit id. Nulla at pellentesque nisl. Donec in dui vitae dolor viverra posuere varius eget libero. Fusce pharetra nisi vel metus dictum varius. Morbi interdum est non quam tempus, eu aliquet diam commodo. Maecenas et massa molestie, efficitur nunc ut, consequat metus. Aenean feugiat dolor eu ipsum gravida, nec hendrerit eros tincidunt. Suspendisse non enim semper, suscipit augue quis, ultrices diam."
idea_type = [true, false]
open_status = [true, false]
categories = Category.all

50.times {
    idea = IdeaProblem.create(
        title: idea_title,
        description_long: idea_description,
        type_idea: idea_type.sample,
        status_open: open_status.sample,
        user_id: [user1.id, user2.id].sample,
        category_ids: [categories[rand(0..categories.length - 1)].id, categories[rand(0..categories.length - 1)].id, categories[rand(0..categories.length - 1)].id, categories[rand(0..categories.length - 1)].id, categories[rand(0..categories.length - 1)].id]
    )
    idea.save
}

puts "Done!"
