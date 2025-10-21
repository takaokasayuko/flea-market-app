class SessionsController < ApplicationController
  skip_before_action :logged_in_user, only: [ :new, :create ]
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email].downcase)
    if @user && @user.authenticate(user_params[:password])
      log_in @user
      redirect_to root_path, status: :see_other
    else
      @user = User.new(email: user_params[:email])
      flash.now[:alert] = "ログインに失敗しました"
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path, status: :see_other
  end


  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
