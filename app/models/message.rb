class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	has_many :ReplyMessage, :dependent => :destroy
end
