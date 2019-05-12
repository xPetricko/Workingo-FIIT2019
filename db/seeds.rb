# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# User.create!(name:  "Andrej Petricko",
#              email: "petricko.andrej@gmail.com",
#              password:              "Andrej03601",
#              password_confirmation: "Andrej03601",
#              admin: true)
#
# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password)
# end


# states = State.all
# states.each do |i|
#   # State.create(label: i[1], code: i[0])
#   provinces = Province.where(state: i)
#   provinces.each do |p|
#     #Province.create(name: c[1], code: c[0], state: i)
#     cities = CS.get(i.code,p.code)
#     cities.each do  |c|
#       City.create(name: c, state:i, province: p)
#     end
#   end
#
# end
#

cities = City.all
25.times do |time|
  cities.each_with_index do |city, index|
    Offer.new(label: "Fake-#{time * index+10}", content: "Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake Fake", user_id: 1, category_id: 2, state_id: city.state_id, province_id: city.province_id, city_id: city.id, date: Faker::Date.forward(2500)).save(validate: false)
   end
end