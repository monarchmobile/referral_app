class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :phone_type

  validates :number,
  	presence: { message: "Can't be blank" }

  belongs_to :user
end
