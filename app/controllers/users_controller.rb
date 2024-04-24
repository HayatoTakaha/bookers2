class UsersController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path
  end
  
  def index
    @users = User.all
    @book = Book.new
  end
  
  def destroy
 @user = User.find(params[:id])
 @books.destroy
 flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end
    
  private

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
    redirect_to book_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
