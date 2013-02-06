class Note < ActiveRecord::Base 
  attr_accessible :written_note, :referral_id

  belongs_to :referral
end
