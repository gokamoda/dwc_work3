class UsersController < ApplicationController
  
    
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: params[:id])
  end
  
  def edit
    if User.find(params[:id]).id == current_user.id
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
    
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end
  
  def index
    @user = User.find(current_user.id)
    @book = Book.new()
    @users = User.all
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
