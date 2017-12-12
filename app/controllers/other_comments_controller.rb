class OtherCommentsController < ApplicationController
  before_action :set_other_comment, only: [:edit, :update, :destroy]

  def create
    @other_comment = OtherComment.new(other_comment_params)
    @other_comment.user_id = current_user.id

    respond_to do |format|
      if @other_comment.save
        format.html { redirect_to pictures_path }
        format.js { @status = 'success' }
      else
        @pictures = Picture.all.order(created_at: :desc)
        @picture = Picture.new
        format.html { render 'pictures/index' }
        format.js { @status = 'fail' }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to pictures_path }
      format.js { @id_comment = @other_comment.id }
    end
  end

  def cancel
    @other_comment = OtherComment.find(params[:id])
    respond_to do |format|
      format.html { redirect_to pictures_path }
      format.js { @id_comment = @other_comment.id }
    end
  end

  def update
    respond_to do |format|
      if @other_comment.update(other_comment: params[:other_comment][:other_comment])
        format.html { redirect_to pictures_path }
        format.js { @id_comment = @other_comment.id }
      else
        format.html { render 'pictures/index' }
        format.js { @status = 'fail' }
      end
    end
  end


  def destroy
    @other_comment = OtherComment.find(params[:id])
    respond_to do |format|
      @other_comment.destroy
      format.html { redirect_to pictures_path }
      format.js { @id_comment = @other_comment.id }
    end
  end



  private
  def other_comment_params
    params.require(:other_comment).permit(:picture_id, :other_comment)
  end

  def set_other_comment
    @other_comment = OtherComment.find(params[:id])
  end

end
