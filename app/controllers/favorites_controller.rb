class FavoritesController < ApplicationController

  before_action :login?, only: %i[create destroy]

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんの投稿をいいね！しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(picture_id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんの投稿をいいね！取り消しました"
  end
end
