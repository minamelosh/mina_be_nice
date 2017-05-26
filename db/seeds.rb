require 'faker'

# User.delete_all

30.times.map do
  User.create!(user_name: Faker::Name.first_name,
                email: Faker::Internet.email,
                password: "password")
end
