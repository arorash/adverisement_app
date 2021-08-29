class Advertisement < ApplicationRecord
	belongs_to :user

	has_many :user_comments, dependent: :destroy

	validates :title, :presence => true
	validates :offer, :presence => true
	validates :discription, :presence => true
end
