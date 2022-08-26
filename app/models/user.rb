class User < ApplicationRecord

	validates :email, {
		presence: true,
		uniqueness: true,
		format: {
			with: URI::MailTo::EMAIL_REGEXP
		}
	}

	after_create do 
	end
end
