class FavoritesController < ApplicationController

  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    favorite.save
    @topic = Topic.find_by(id: params[:topic_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    # binding.pry
    favorite.destroy
    @topic = Topic.find_by(id: params[:topic_id])
  end
end
