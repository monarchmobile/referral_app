class Note < ActiveRecord::Base 
  attr_accessible :referral_id, :written_note, :warm_up_by
  attr_accessible :r_urgency, :r_comments, :r_card_given, :r_preferred_contact, :r_contact_by
  attr_accessible :t_urgency, :t_comments, :t_card_given, :t_preferred_contact
  belongs_to :referral
end
