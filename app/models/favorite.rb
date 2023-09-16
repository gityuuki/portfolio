class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recruitment
  validates_uniqueness_of :recruitment_id, scope: :user_id
end
