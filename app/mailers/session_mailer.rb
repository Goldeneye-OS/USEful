class SessionMailer < ApplicationMailer
	def signin
		@url = signin_sessions_url(t: params[:t], host: params[:host], port: params[:port])
		mail(to: params[:to], subject: "🔑 #{Rails.application.config.app}: Sign In")
	end
end
