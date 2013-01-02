class User < ActiveRecord::Base
  attr_accessible :admin, :biz_type, :company, :email, :first_name, :last_name, :password_reset_sent_at, :password_reset_token, :website
  attr_accessible :password, :password_confirmation, :fullname, :biz_type_id, :social_networks_attributes, :affiliations_attributes

  # static arrays found in lib/array.rb
  include ARRAYS

  # associations
  belongs_to :biz_type
  has_many :social_networks
  has_many :affiliations

  accepts_nested_attributes_for :social_networks, allow_destroy: true
  accepts_nested_attributes_for :affiliations, allow_destroy: true

  # validations
  validates :company,
    :presence => { message: "Can't be blank" }
  validates :biz_type_id, 
    :presence => { message: "Category is needed to proceed" }


  has_secure_password
  validates_presence_of :password, :on => :create
  before_create { generate_token(:auth_token) }

  # pretty url
  extend FriendlyId
  friendly_id :last_name

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def fullname 
    [first_name, last_name].join(' ')
  end

  def fullname=(name)
  split = name.split(' ', 2)
  self.first_name = split[0]
  self.last_name = split[1]
  end
end
