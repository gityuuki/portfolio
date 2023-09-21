class FavoritesController < ApplicationController
    def create
    recruitment = Recruitment.find(params[:recruitment_id])
    favorite = current_user.favorites.new(recruitment_id: recruitment.id)
    favorite.save
    redirect_to request.referer
    end

  def destroy
    recruitment = Recruitment.find(params[:recruitment_id])
    favorite = current_user.favorites.find_by(recruitment_id: recruitment.id)
    favorite.destroy
    redirect_to request.referer
  end
end