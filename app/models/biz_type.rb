class BizType < ActiveRecord::Base
  attr_accessible :category, :code

  has_many :users
end
