class MessageTicket < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
end
