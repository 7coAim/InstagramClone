class SessionsController < ApplicationController
  def new
    render template: 'users/top'
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: "ログインしました"
    else
      flash.now[:danger] = 'ログインに失敗しました'
      @user = User.new
      render template: 'users/top'
    end
  end

  def destroy
      session.delete(:user_id)
      flash[:notice] = 'ログアウトしました'
      redirect_to new_session_path
  end
end
