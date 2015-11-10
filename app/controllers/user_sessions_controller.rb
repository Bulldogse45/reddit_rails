class UserSessionsController < ApplicationController

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(session_params)
    if @user_session.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user_session).permit(:username, :password)
  end

end
