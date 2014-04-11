class UsersController < ApplicationController
  before_filter :authorize, only: [:edit, :update]

  def index
    @user = User.new
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "New user successfuly created."
      redirect_to('/users')
    else
      render('users')
    end
  end

  def show
    @user = User.find(params[:id])
    @attachment = Attachment.new
    @photo = Attachment.find_by(user_id: params[:id])
    @photos = Attachment.all
  end

  def edit
    @user = User.find(params[:id])
    render('users/edit.html.erb')
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render("users/show.html.erb")
    else
      render("users/show.html.erb")
    end
  end


private

  def user_params
    params.require(:user).permit(:user_name, :avatar, :password, :password_confirmation)
  end
end
