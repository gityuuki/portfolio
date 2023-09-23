class HomesController < ApplicationController
  def top
  end

  def about
  end

  def guest_login
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
      user.name = "ゲストユーザー"
    end
    sign_in user
    redirect_to user_path(user), notice: 'ゲストユーザーとしてログインしました。'
  end
end