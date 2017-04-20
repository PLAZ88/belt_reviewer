class User < ActiveRecord::Base
  has_many :events
  has_many :comments 
  has_many :attendees
  has_many :events_attending, through: :attendees, source: :event

  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :location, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  
  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end

end
