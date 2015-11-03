class IdeasController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]

  def index
    @ideas = Idea.all
    @user = session[:user_id]
    # @like = Like.all.where(user_id: @user).any?
    # if like.first.user_id
    #   @like = like.first.user_id
  end


  def show
    @ideas = Idea.where(id: params[:id])
    @likes = @ideas.first.likes
    @user = session[:user_id]
  end

  def create
    user = User.find(params[:ideas][:user_id])
    user.ideas.create(content: params[:ideas][:content])
    redirect_to "/users/#{params[:ideas][:user_id]}"
  end

  def destroy
   idea = Idea.find(params[:id])
   idea.destroy if idea.user == current_user
   redirect_to "/users/#{current_user.id}"
 end
end
