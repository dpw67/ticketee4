class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def create
    
    @user = User.new(user_params)
    
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have signed up successfully."
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end
  
  def index
    @users = User.all
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "Profile has been updated."
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name,:email,
        :password,
        :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
