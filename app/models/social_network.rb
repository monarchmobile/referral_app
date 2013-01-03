class SocialNetwork < ActiveRecord::Base
  attr_accessible :acct_name, :network_name

  belongs_to :user
end
