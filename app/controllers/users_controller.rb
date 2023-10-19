class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @recruitments = @user.recruitments
    @recruitment = Recruitment.new
  end

  def index
    @users = User.where(is_withdrawal: false)
    @recruitment = Recruitment.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      tags = Vision.get_image_data(params[:user][:profile_image])
      @user.tags.destroy_all
      tags.each do |tag|
        @user.tags.create(name: tag)
      end
      redirect_to user_path(@user), notice: "更新できました。"
    else
      render "edit"
    end
  end

  def withdrawal
    @user = User.find(params[:user_id])
    @user.update(is_withdrawal: true)
    # reset_session
    sign_out @user unless current_user.is_admin?
    flash[:notice] = "退会完了いたしました。"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end