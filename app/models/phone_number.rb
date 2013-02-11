class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :phone_type

  validates :number,
  	presence: true

  belongs_to :user
end
