

  User.all.each do |user|
    PLACES_TO_CREATE.times do
      puts " Creating Place"
      user = User.all.sample
      place = Place.create(
    name: Faker::Restaurant.name,
    details: Faker::Lorem.sentence,
    address: Faker::Address.street_address,
    zip_code: Faker::Address.zip,
    user: user,
    contact_email: Faker::Internet.safe_email,
    )
    puts place.user.first_name
    puts place.address
    end
  end
