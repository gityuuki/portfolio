class RecruitmentCommentsController < ApplicationController
  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    comment = current_user.recruitment_comments.new(recruitment_comment_params)
    comment.recruitment_id = recruitment.id
    #pp "hoge"
    comment.save!
    redirect_to request.referer
  end

  def destroy
    RecruitmentComment.find_by(id: params[:id], recruitment_id: params[:recruitment_id]).destroy
    redirect_to request.referer
  end

  private
  def recruitment_comment_params
    params.require(:recruitment_comment).permit(:comment)
  end
end
