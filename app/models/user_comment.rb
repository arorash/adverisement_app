class UserComment < ApplicationRecord
  belongs_to :advertisement

  validates :commenter, :presence => true
  validates :body, :presence => true
end
