# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Jointure.destroy_all
Project.destroy_all
Category.destroy_all
User.destroy_all

require "faker"

mymy = User.new(email: "mymy@gmail.com", password:"123456")
mymy.save!

puts "mymy created"

categories = ["captations évènements", "contenus digitaux", "short media", "films institutionnels", "reportages et publireportages"]

categories.each do |title|
  category = Category.new(title: title)
  category.save!
end

puts "categories created"

10.times do
  project = Project.new(user: mymy, video_url: "https://www.youtube.com/watch?v=dZzWLrmCo3I", description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true), title: Faker::Lorem.paragraph(sentence_count: 1, supplemental: true))
  project.save!
end

puts "projects created!"

Category.all.each do |category|
  Project.all.each do |project|
    jointure = Jointure.new(category: category, project: project)
    jointure.save!
  end
end

puts "jointures created"
