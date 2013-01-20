class Referral < ActiveRecord::Base
  attr_accessible :card_given, :comments, :date_submitted, :inside, :preferred_contact, :urgency
  attr_accessible :first_name, :last_name, :fullname, :email, :phone1, :phone2
  attr_accessible :address1, :address2, :city, :state

  has_one :lead
  has_one :referrer, through: :lead
  has_one :referee, through: :lead
  has_one :target_id, through: :lead

  has_many :notes
  # has_many :users, :through => :leads

  def fullname 
	[first_name, last_name].join(' ')
  end

  def fullname=(name)
	split = name.split(' ', 2)
	self.first_name = split[0]
	self.last_name = split[1]
  end
 
end
