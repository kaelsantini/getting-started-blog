class UsersController < ApplicationController

  def index
    @users = User.all
    @users = @users.where("lower(name) LIKE lower(?)", "%#{params[:name]}%") if params[:name].present?
    @users = @users.where("lower(email) LIKE lower(?)", "%#{params[:email]}%") if params[:email].present?
    @users = @users.where(gender: params[:gender]) if params[:gender].present?
    if params[:begin_date].present? && params[:end_date].present?
      @users = @users.where("birth_date BETWEEN ? and ?", params[:begin_date], params[:end_date])
    else
      if params[:begin_date].present?
          @users = @users.where("birth_date >= ?", params[:begin_date])
      end
      if params[:end_date].present?
          @users = @users.where("birth_date <= ?", params[:end_date])
      end
    end
    puts @users.length
    respond_to do |format|
      format.html
      format.json
    end

  end

  def new
    @user = User.new
    render 'edit'
  end

  def edit
      @user = User.find(params[:id])
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

  def update
    @user = User.find(params[:id])
    respond_to do |format|
     if @user.update(user_params)
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
          params.require(:user).permit(:name, :email, :birth_date, :gender, :password, :password_confirmation)
      end
end
