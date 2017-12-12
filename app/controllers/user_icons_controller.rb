class UserIconsController < ApplicationController
  def create
    @user_icon = UserIcon.new(user_icon_params)
    if @user_icon.save
      redirect_to user_path(@user_icon.user_id), notice: 'アイコンを設定しました'
    else
      render 'users/show'
    end
  end

  def update
    @user_icon = UserIcon.find_by(user_id: current_user.id)
    if @user_icon.update(user_icon_params)
      redirect_to user_path(current_user.id), notice: 'アイコンを更新しました'
    else
      @user = User.find(current_user.id)
      render 'users/show'
    end
  end

  def destroy
  end

  private
  def user_icon_params
    params.require(:user_icon).permit(:user_id, :image)
  end

end
