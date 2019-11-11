# frozen_string_literal: true

module BlogsHelper
  def gravatar_helper(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    image_tag "https://gravatar.com/avatar/#{gravatar_id}", width: 60
  end
end
