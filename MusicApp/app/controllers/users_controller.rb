class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def show
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to users_url(@user)
    else
      flash[:errors] = ["Invalid username/password"]
      redirect_to new_user_url(@user)
    end
  end


  private
  def user_params
    params.require(:users).permit(:email, :password)
  end
end
