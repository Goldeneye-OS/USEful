class SessionsController < ApplicationController

	skip_before_action :require_login

	def signin
		token = Tokens.decode(params[:t]) # decode token to get email
		user = User.find_by(email: token['email']) # find user by email
		if !user # if no user found, create user
			user = User.new
			user.email = token['email']
			user.save!
		end
		session = Tokens.issue({ # create and return session token
			id: user.id, 
			email: user.email
		}) 
		redirect_to Rails.application.config.domain + "/" + Rails.application.config.sign_in_path + "?t=" + session
  end
  
  def start # create a session token, email the user a link to create a session.
		token = Tokens.issue({
			email: params[:email]
		})
		port = request.port
		url = request.original_url
		SessionMailer.with(
			t: token, 
			host: url,
			port: port,
			to: params[:email]
		).signin.deliver_now
		render json: { 
			status: "ok" 
		}
  end

private

	def session_params
		params.permit(:email)
	end
end
