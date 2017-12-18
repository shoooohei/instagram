class PicturesController < ApplicationController
  before_action :check_logging_in
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_action :set_new_picuture, only: [:confirm, :create]
  before_action :set_show_pictures, only: [:index, :create]

  def index
  end

  def favorites
    @pictures = current_user.favorite_pictures.order(created_at: :desc)
    @other_comment = OtherComment.new
    render 'index'
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end

    respond_to do |format|
      format.js
    end
  end

  def confirm
    respond_to do |format|
      #確認画面だから、saveしたりしないためバリデーションをかける必要がある。
      if @picture.invalid?
        format.js { @picture_errors = @picture.errors }
      else
        format.js
      end
    end
  end

  def create
    if params[:cache][:image].present?
      @picture.image.retrieve_from_cache! params[:cache][:image]
    end

    respond_to do |format|
      if @picture.save
        PictureMailer.picture_mail(@picture).deliver
        format.js { @status = "success" }
      else
        @pictures = Picture.all.order(created_at: :desc)
        format.js { @status = "fail" }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def cancel
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      @picture.update(edit_comment)
        @status = "success"
        format.js { @id_comment = @picture.id }
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.js { @id_comment = @picture.id }
    end
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :comment)
  end

  def set_new_picuture
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
  end

  def set_show_pictures
    @pictures = Picture.all.order(created_at: :desc)
    @other_comment = OtherComment.new
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def edit_comment
    params.require(:picture).permit(:comment)
  end
end
