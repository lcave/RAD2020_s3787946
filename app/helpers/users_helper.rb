module UsersHelper
  def gravatar_for(user, size = 200)
    email = user.gravatar
    if (email == nil)
      email = user.email
    end
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
