class ApplicationController < ActionController::API

	before_action :require_login
	
	def require_login # require logged in user before request (default)
		if not current_user
			render json: {error: "unauthorized"}, status: 401 
		end
	end

private

	def current_user # current user
		User.find(jwt_token['id']) if !!auth_token
	end

	def auth_token # raw jwt token
		request.env["HTTP_AUTHORIZATION"]
	end
	
	def jwt_token # decoded jwt token
		Tokens.decode(auth_token)
	end
end
