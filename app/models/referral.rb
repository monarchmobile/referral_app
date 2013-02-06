class Referral < ActiveRecord::Base
  attr_accessible :card_given, :comments, :date_submitted, :inside, :preferred_contact, :urgency, :contact_by, :warm_up_by
  attr_accessible :first_name, :last_name, :fullname, :email, :phone1, :phone2
  attr_accessible :address1, :address2, :city, :state

  has_one :lead
  has_one :referrer, through: :lead 
  has_one :referee, through: :lead
  has_one :target, through: :lead
  has_many :notes
  # has_many :users, :through => :leads

  # validations
  # validates :card_given,
  #   presence: true

  validates :preferred_contact,
    presence: true

  validates :urgency,
    presence: true

  def fullname 
	 [first_name, last_name].join(' ')
  end

  def fullname=(name)
  	split = name.split(' ', 2)
  	self.first_name = split[0]
  	self.last_name = split[1]
  end
 
end
