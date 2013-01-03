class Contact < ActiveRecord::Base
  attr_accessible :associate_id, :user_id

  belongs_to :user
  belongs_to :associate, :class_name => "User" 
end
