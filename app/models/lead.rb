class Lead < ActiveRecord::Base
  attr_accessible :referee_id, :referral_id, :referrer_id

  belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
  belongs_to :referee, :class_name => "User", :foreign_key => "referee_id"
  # belongs_to :user
  belongs_to :referral
end
