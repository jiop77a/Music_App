class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save!
      render text: "Welcome!"
    else
      flash[:errors] = user.errors.full_message
      redirect_to new_users_url
    end
  end

  def show

  end


  def signup

  end

  def login
    to :root
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end
end
