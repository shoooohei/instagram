class PicturesController < ApplicationController
  before_action :check_logging_in
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_action :set_new_picuture, only: [:confirm, :create]
  before_action :set_show_pictures, only: [:index, :create]

  def index
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end

    respond_to do |format|
      format.html { redirect_to pictures_path }
      format.js
    end
  end

  def confirm
    respond_to do |format|
      format.html { redirect_to pictures_path }
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
        format.html { redirect_to pictures_path, notice: '投稿しました' }
        format.js { @status = "success" }
      else
        @pictures = Picture.all.order(created_at: :desc)
        format.html { render 'index' }
        format.js { @starus = "fail" }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to pictures_path }
      format.js
    end
  end

  def cancel
    respond_to do |format|
      format.html { redirect_to pictures_path }
      format.js
    end
  end

  def update
    if @picture.update(edit_comment)
      redirect_to edit_picture_path(@picture.id), notice: "更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path
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
