class RecruitmentsController < ApplicationController

  def edit
    @recruitment = Recruitment.find(params[:id])
  end

  def index
    @recruitments = Recruitment.all
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    tags = Vision.get_image_data(list_params[:image])
    @recruitment.user_id = current_user.id
    if @recruitment.save
      tags.each do |tag|
        @recruitment.tags.create(name: tag)
      end
      redirect_to recruitment_path(@recruitment), notice: "You have created book successfully."
    else
      @recruitments = Recruitment.all
      render 'index'
    end
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @recruitment_comment = RecruitmentComment.new
  end

  def update
      @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(recruitment_params)
      redirect_to recruitment_path(@recruitment), notice: "更新しました"
    else
      flash[:alert] = "更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to recruitments_path, notice: "投稿削除しました"
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:title, :body)
  end

  def ensure_correct_user
    @recruitment = Recruitment.find(params[:id])
    unless @recruitment.user == current_user
      redirect_to recruitments_path
    end
  end
end
