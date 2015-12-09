class Category < ActiveRecord::Base
	has_many :sub_categories
	has_one :topic
	validates :title, presence: true
end
