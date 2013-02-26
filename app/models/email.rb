class Email < ActiveRecord::Base
  attr_accessible :email

  belongs_to :user

  validates :email,
    :presence => { message: "Can't be blank" }
end
