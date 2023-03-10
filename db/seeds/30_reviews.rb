
Place.all.each do |place|
  REVIEWS_TO_CREATE.times do
    place = Place.all.sample
    review = Review.create(
      comment: Faker::Lorem.sentence,
      rating: rand(1..3),
      place_id: place.id,
      user_id: place.user_id,
    )
puts review.user.first_name
puts review.comment
puts review.place
puts review.rating
  end
end
