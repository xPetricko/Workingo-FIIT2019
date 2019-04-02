# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1000000.times do |n|
  name  = n.to_s+"nm"
  email = "examplase2asd-#{n}@fakes.orsg"
  password = "password"
  User.create!(full_name:  name,
               email: email,
               date_of_birth: "01-01-2020",
               gender: "x",
               password:              password,
               password_confirmation: password)
end

#vypnuť constrains a  uplooadovať to ako sql stringy