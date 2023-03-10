require "open-uri"

USERS_TO_CREATE.times do |i|
  user = User.create(
    email: Faker::Internet.safe_email,
    password: "123456",
    password_confirmation: "123456",
    first_name: Faker::FunnyName.name,
    last_name: Faker::FunnyName.name
  )
  file_url = PROFILE_PHOTOS[i] || PROFILE_PHOTOS[i % PROFILE_PHOTOS.length]
  if file_url
    begin
      file = URI.open(file_url)
    rescue => e
      puts "#{e.message}: #{file_url} can not be opened."
      raise
    end
    user.photo.attach(io: file, filename: "profile_photo.jpg", content_type: "image/jpg")
    user.save!
  end
  puts "Created #{user.first_name} - #{user.password}"
end
