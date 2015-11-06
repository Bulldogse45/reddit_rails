class UsersController < ApplicationController
  def index
    redirect_to root_path
  end
  def create
    user = User.new(user_params)
    if user.save
      redirect_to root_path
    else
      render "new"
    end
  end
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params['id'])
    render "new"
  end
  def show
    @user = User.find(params['id'])
  end
  def update
    @user= User.find(params['id'])
    @user.update(user_params)
    redirect_to root_path
  end
  def destroy
    @user= User.find(params['id'])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

end