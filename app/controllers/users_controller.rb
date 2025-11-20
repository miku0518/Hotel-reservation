class UsersController < ApplicationController
  before_action :authenticate_user! # ログインしていない場合はログインページへ
  def edit
  end

  def update
  end

  def account
    @user = current_user
  end


  def edit_profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(profile_params)
      redirect_to user_account_path, notice: "プロフィールを更新しました"
    else
      render :edit_profile
    end
  end
 
  def profile_params
    params.require(:user).permit(:name, :introduction, :icon)
  end


end
