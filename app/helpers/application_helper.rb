module ApplicationHelper
	
	def sign_in(user)
	    cookies.permanent[:remember_token] = user.remember_token
	    self.current_user = user
  	end

  	def current_user=(user)
    	@current_user = user
  	end

  	def current_user
    	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
  	end

  	def signed_in?
    	!current_user.nil?
  	end

    def gravatar_for(user,options={})
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"+"?s="+options[:size].to_s
      image_tag(gravatar_url, alt: user.username, class: "gravatar")
    end
end
