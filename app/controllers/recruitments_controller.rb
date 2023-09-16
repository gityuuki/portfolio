class RecruitmentsController < ApplicationController
  def edit
  end

  def index
    @recruitments = Recruitment.all
    @recruitment = Book.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.user_id = current_user.id
    if @recruitment.save
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
    if @recruitment.update(recruitment_params)
      redirect_to recruitment_path(@recruitment), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @recruitment.destroy
    redirect_to recruitments_path
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
