class UsersController < Clearance::UsersController

	def create
		@user = User.new(user_params)
		if @user.save
			@user.sign_in
			flash[:success] = "Awesome, you may create a company profile and jobs now."
			redirect_to root_path
		else
			flash[:error] = "Failed to create an account, please contact admin."
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :password, :role)
		end
end
