class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@users=User.all
		@book=Book.new
	end

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
	end

	def create
		user=User.new(user_params[:id])
		user.save
		redirect_to book_path
	end

	def edit
		@user=User.find(params[:id])
		if current_user.id != @user.id
			redirect_to user_path(current_user)
		end
	end

	def update
		@user=User.find(params[:id])
		if @user.update(user_params)
			flash[:user_update] = "You have updated user successfully."
			redirect_to user_path(@user.id)
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end
