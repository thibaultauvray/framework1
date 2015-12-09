class User < ActiveRecord::Base
  has_many :post
  belongs_to :role
  has_many :message
  has_many :topic
  has_many :ReplyMessage
  has_many :ticket
  has_many :MessageTicket
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 5}, :on => :create
  validates :email, presence: true, uniqueness: true
end
