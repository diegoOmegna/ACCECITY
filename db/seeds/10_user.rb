USERS_TO_CREATE.times do
  user = User.create(
    email: Faker::Internet.safe_email,
    password: "123456",
    password_confirmation: "123456",
    first_name: Faker::FunnyName.name,
    last_name: Faker::FunnyName.name
  )
  puts "Created #{user.first_name} - #{user.password}"
end
