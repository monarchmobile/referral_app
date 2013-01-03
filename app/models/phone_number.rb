class PhoneNumber < ActiveRecord::Base
  attr_accessible :number, :phone_type

  belongs_to :user
end
