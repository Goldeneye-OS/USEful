class UsersController < ApplicationController
  
  skip_before_action :require_login, only: [ :create, :show ]
  
  # GET /current_user_data
  def current_user_data
		@user = current_user
  end

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # POST /users
  def create
  end

  # PATCH/PUT /users/1
  def update
  end

  # DELETE /users/1
  def destroy
  end

  private
  
	# Only allow a list of trusted parameters through.
	def user_params
		params.permit(:email)
	end
end
