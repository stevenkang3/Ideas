class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    liked = Like.find_by(user_id: params[:user_id], idea_id: params[:idea_id])
    if (liked)
      redirect_to "/users/#{params[:user_id]}"
    else
      Like.create(user_id: params[:user_id], idea_id: params[:idea_id])
    redirect_to "/users/#{params[:user_id]}"
    end
  end

  def destroy
    liked = Like.find_by(user_id: params[:user_id], idea_id: params[:idea_id])
    if (liked)
    liked.destroy
    redirect_to "/users/#{params[:user_id]}"
    else
    redirect_to "/users/#{params[:user_id]}"
    end
  end
end
