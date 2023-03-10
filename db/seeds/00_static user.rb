user = User.create email: "domegna@gmail.com",
password: "123456",
password_confirmation: "123456",
first_name: "Diego",
last_name: "Omegna"
# admin: true

puts "Creating an user for each team member"

user = User.create email: "diegoomegna@gmail.com",
password: "12345678",
password_confirmation: "123456",
first_name: "Diego",
last_name: "Chancho"
# admin: false

puts ":fire: Created #{user.first_name} - #{user.password}"
