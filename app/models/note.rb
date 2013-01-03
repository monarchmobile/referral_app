class Note < ActiveRecord::Base
  attr_accessible :written_note

  belongs_to :referral
end
