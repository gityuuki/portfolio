class RecruitmentComment < ApplicationRecord
    belongs_to :user
    belongs_to :recruitment
    
    validates :comment, presence: true
end
