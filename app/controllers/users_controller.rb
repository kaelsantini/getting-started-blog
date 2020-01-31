class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
     if @user.save
       format.html { redirect_to users_path }
     else
       format.json { render json: @user.errors, status: :unprocessable_entity }
     end
   end
  end

  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_path
  end

  private
      def user_params
          params.require(:user).permit(:name, :email, :password_digest)
      end

end
