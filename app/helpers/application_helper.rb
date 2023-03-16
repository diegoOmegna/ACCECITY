module ApplicationHelper
  def place_header_photo_url(place)
    if place.header_photo.attached?
      cl_image_path place.header_photo.key
    else
      image_url "Zurich_banner.webp"
    end
  end

  def profile_picture_url
    if current_user.avatar.attached?
      cloudinary_url current_user.avatar.key
    else
      image_url "avatar-unknown.png"
    end
  end

  def greeting_user
    time = Time.now
    if time.hour >= 5 && time.hour < 12
      "Good morning, #{current_user.first_name}!"
    elsif time.hour >= 12 && time.hour < 18
      "Good afternoon, #{current_user.first_name}!"
    else
      "Good Evening, #{current_user.first_name}!"
    end
  end

  def greeting_everyone
    time = Time.now
    if time.hour >= 5 && time.hour < 12
      "Good morning!"
    elsif time.hour >= 12 && time.hour < 18
      "Good afternoon!"
    else
      "Good Evening!"
    end
  end

def review_medals(total_reviews)
    if total_reviews >= 10 && total_reviews < 20
      "🥉"
    elsif total_reviews >= 20 && total_reviews < 30
      "🥈"
    elsif total_reviews >= 30 && total_reviews < 40
      "🥇"
    elsif total_reviews >= 40
      "🏵️"

    end
  end
end
