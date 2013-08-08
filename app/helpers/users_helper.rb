module UsersHelper
	def gravatar_for(user,options={})
	    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"+"?s="+options[:size].to_s
	    image_tag(gravatar_url, alt: user.username, class: "gravatar")
  	end
end
