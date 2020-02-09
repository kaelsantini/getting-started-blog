class LoginController < ApplicationController

  skip_before_action :authorized, only: [:login, :do_login, :logout]

  def login
    @user = User.new
  end

  def do_login
    @user = User.find_by( email: params[:user][:email].downcase )

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.notice = 'Invalid email or password'
      redirect_to :login
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end


end
