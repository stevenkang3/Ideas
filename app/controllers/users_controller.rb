class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [ :edit, :update, :destroy]

  def index
    @user = User.find(params[:id])
    @ideas = Idea.all
    @user_id = session[:user_id]
    # @secrets = @user.secrets
  end

  # def new
  #   @user = User.find(params[:id])
  #   @secrets = @user.secrets
  # end

  def create
  user = User.create(user_params)
  if user.save
    session[:user_id] = user.id
    redirect_to "/users/#{user.id}"
  else
    flash[:errors] = user.errors.full_messages
    redirect_to '/user/new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @likes = Like.where(user_id: params[:id]).count
    @idea = Idea.where(user_id: params[:id]).count
  end

  def show
    @user = User.find(params[:id])
    @likes = Like.where(user_id: params[:id]).count
    @idea = Idea.where(user_id: params[:id]).count
  end

  def update
  user = User.find(params[:id])
  user.update(user_params)
  redirect_to "/users/#{user.id}"
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    session.delete(:user_id)
    redirect_to "/sessions/new"
  end

private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
end
