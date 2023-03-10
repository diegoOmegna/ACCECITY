require "open-uri"


  User.all.each do |user|
    PLACES_TO_CREATE.times do |i|
      puts " Creating Place"
      user = User.all.sample
      place = Place.create!(
        name: Faker::Restaurant.name,
        details: Faker::Lorem.sentence,
        address: Faker::Address.street_address,
        zip_code: Faker::Address.zip,
        user: user,
        contact_email: Faker::Internet.safe_email,
      )
      file_url_header = PLACE_HEADER_PHOTOS[i]
      if file_url_header
        file = URI.open(file_url_header)
        place.header_photo.attach(io: file, filename: "header_photo.jpg", content_type: "image/jpg")
        place.save!
      end
      puts place.user.first_name
      puts place.address
    end
  end
