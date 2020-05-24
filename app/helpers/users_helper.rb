module UsersHelper

  # Get gravater for user using gravatar email or
  # normal email if seperate gravatar email is not set
  def gravatar_for(user, size = 200)
    email = user.gravatar
    unless email
      email = user.email
    end
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
