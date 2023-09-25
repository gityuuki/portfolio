class Recruitment < ApplicationRecord
  belongs_to :user
	has_many :recruitment_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @recruitment = Recruitment.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @recruitment = Recruitment.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @recruitment = Recruitment.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @recruitment = Recruitment.where("title LIKE?","%#{word}%")
    else
      @recruitment = Recruitment.all
    end
  end

end
