class SocialNetwork < ActiveRecord::Base
  attr_accessible :acct_name, :network_name, :user_id

  belongs_to :user
end
