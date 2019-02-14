class User::SessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params.to_h)
    if @user_session.save
      flash[:success] = 'ログインしました。'
      redirect_to "/"
    else
      flash[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to "/"
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password)
  end
end
