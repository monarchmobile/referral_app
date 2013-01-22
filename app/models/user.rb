class User < ActiveRecord::Base 
  attr_accessible :admin, :biz_type, :company, :email, :first_name, :last_name, :password_reset_sent_at, :password_reset_token, :website, :guest
  attr_accessible :password, :password_confirmation, :fullname, :biz_type_id
  attr_accessible :social_networks_attributes, :affiliations_attributes, :addresses_attributes, :phone_numbers_attributes, :emails_attributes
  attr_accessible :sent_leads_attributes, :sent_referrals_attributes

  # static arrays found in lib/array.rb
  include ARRAYS 

  # associations
  belongs_to :biz_type
  has_many :social_networks,:dependent => :destroy
  has_many :affiliations,:dependent => :destroy
  has_many :addresses,:dependent => :destroy
  has_many :phone_numbers,:dependent => :destroy
  has_many :emails,:dependent => :destroy

  # contact_list
  has_many :contacts, :foreign_key => "user_id"
  has_many :associates, :through => :contacts

  has_many :inverse_contacts, :class_name => "Contact", :foreign_key => "associate_id"
  has_many :inverse_associates, :through => :inverse_contacts, :source => :user,:dependent => :destroy

  # referrals
  has_many :sent_leads, :class_name => "Lead", :foreign_key => "referrer_id"
  has_many :sent_referrals, :through => :sent_leads, :foreign_key => "referral_id", :source => :referral,:dependent => :destroy

  has_many :received_leads, :class_name => "Lead", :foreign_key => "referee_id"
  has_many :received_referrals, :through => :received_leads, :foreign_key => "referral_id", :source => :referral,:dependent => :destroy

  has_many :received_recommendations, :class_name => "Lead", :foreign_key => "target_id"
  has_many :target_referrals, :through => :received_recommendations, :foreign_key => "referral_id", :source => :referral,:dependent => :destroy

  accepts_nested_attributes_for :social_networks, allow_destroy: true
  accepts_nested_attributes_for :affiliations, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true
  accepts_nested_attributes_for :emails, allow_destroy: true
  accepts_nested_attributes_for :sent_leads, :sent_referrals


  before_create { generate_token(:auth_token) }
  # validations
  validates :company,
    :presence => { message: "Can't be blank" }
  validates :biz_type_id, 
    :presence => { message: "Category is needed to proceed" }
  validates :email,
    :presence => true

  validates_presence_of :password_digest, unless: :guest?
  validates_confirmation_of :password
  

  # override has_secure_password to customize validation until Rails 4.
  require 'bcrypt'
  attr_reader :password
  include ActiveModel::SecurePassword::InstanceMethodsOnActivation

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

  def self.new_guest
    new { |u| u.guest = true }
  end

 


end
