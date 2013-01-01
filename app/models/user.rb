class User < ActiveRecord::Base
  attr_accessible :admin, :biz_type, :company, :email, :first_name, :last_name, :password_reset_sent_at, :password_reset_token, :website
  attr_accessible :password, :password_confirmation, :fullname

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
