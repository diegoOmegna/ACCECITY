# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
USERS_TO_CREATE = 10
PLACES_TO_CREATE = 10
PLACE_HEADER_PHOTOS = %w[
  https://res.cloudinary.com/diokvkwbd/image/upload/v1678448268/JFJ_pbumlh.jpg
  https://www.planetware.com/photos-large/CH/old-town-2.jpg
  https://media.istockphoto.com/id/1211547141/photo/modern-restaurant-interior-design.jpg?b=1&s=612x612&w=0&k=20&c=c5Mfq76KDAKUN2OPsMMUEyIErd0iOKhOwHB7FUjR0ko=
  https://cdn.thecrazytourist.com/wp-content/uploads/2017/08/Lake-Z%C3%BCrich.jpg
  https://www.touropia.com/gfx/d/tourist-attractions-in-zurich/opernhaus_zurich.jpg
  https://media.tacdn.com/media/attractions-splice-spp-360x240/0a/e6/ba/80.jpg
  https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtWoZjpIm9WG8ax8rWVPhKQ5Hkhk47_7TQUw&usqp=CAU
  https://www.premiumswitzerland.com/img/image_db/dolder-resort-restaurant-terrace-622.jpg
  https://www.mypremiumeurope.com/img/image_db/best_restaurants_in_zurich_baur_au_lac-942.webp
  https://cache.marriott.com/content/dam/marriott-renditions/ZRHBR/zrhbr-bar-8853-hor-feat.jpg
]
REVIEWS_TO_CREATE = 5
PROFILE_PHOTOS = %w[
  https://wallpaperaccess.com/full/2213426.jpg  https://images.hola.com/us/images/027b-168119b04f1e-4ad72c0ac2e1-1000/horizontal-1200/zac-efron.jpg
  https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Dwayne_Johnson_2014_%28cropped%29.jpg/640px-Dwayne_Johnson_2014_%28cropped%29.jpg
]

Dir[Rails.root.join("db", "seeds", "*.rb")].sort.each do |file|
  require file
end
