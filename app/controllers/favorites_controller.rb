class FavoritesController < ApplicationController

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    @picture = Picture.find(favorite.picture_id)
    @id_comment = @picture.id
    respond_to do |format|
      format.js
    end
  end


  def show
    # @pictures = current_user.favorite_pictures.order(created_at: :desc)
    # @other_comment = OtherComment.new
    # render 'pictures/index'
  end

  def destroy
    @favorite = current_user.favorites.find_by(picture_id: params[:id])
    @favorite.destroy
    @picture = Picture.find(params[:id])
    @id_comment = @picture.id
    respond_to do |format|
      format.js
    end
  end
end
