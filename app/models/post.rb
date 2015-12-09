class Post < ActiveRecord::Base
	has_attached_file :photo, :styles => { :small => "500x200>" },
                  :url  => "/assets/post/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/post/:id/:style/:basename.:extension"
default_scope { order('created_at DESC') } 


validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/gif']
  belongs_to :user
end
