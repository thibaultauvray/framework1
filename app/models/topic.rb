class Topic < ActiveRecord::Base
	belongs_to :category
	belongs_to :SubCategory
	belongs_to :user
	has_many :message
	validates :title, presence: true
  	validates :texte, presence: true
end
