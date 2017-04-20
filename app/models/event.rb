class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :attendees

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  validate :expiration_date_cannot_be_in_the_past

  def expiration_date_cannot_be_in_the_past
    errors.add(:date, "Event can't be in the past") if !date.blank? and date < Date.today
  end

end
