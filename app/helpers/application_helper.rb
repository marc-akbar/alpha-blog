# Helper methods used throuhgout app
module ApplicationHelper
  # User gravatar for user image and set size
  def gravatar_for(user, options = { size: 80 })
    # Gravatar id is based off of user email in https://en.gravatar.com
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    # Sets size option for url
    size = options[:size]
    # Grabs user url
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    # Puts gravatar image in tag and style as circle
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end
end
