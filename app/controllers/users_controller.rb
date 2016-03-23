class UsersController < Clearance::UsersController

	def create
		@user = User.new(user_params)
		authorize @user
		if @user.save
			flash[:success] = "Awesome, #{@user.role} user account has been created."
			redirect_to root_path
		else
			flash[:error] = "Failed to create an account, please try again."
			redirect_to create_user_path
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :password, :role)
		end
end
