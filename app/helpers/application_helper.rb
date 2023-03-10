module ApplicationHelper
  def place_header_photo_url(place)
    if place.header_photo.attached?
      cl_image_url place.header_photo.key
    else
      image_url "Zurich_banner.webp"
    end
  end

  def profile_picture_url(user)
    if user.photo.attached?
      cl_image_url user.photo.key
    else
      image_url "avatar-unknown.png"
    end
  end
end
