class Affiliation < ActiveRecord::Base
  attr_accessible :aff_name, :chapter
  belongs_to :user
end
