class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_one :topic

  validates :title, presence: true, uniqueness: true
end
