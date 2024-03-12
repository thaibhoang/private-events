class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :tickets, dependent: :destroy
  has_many :attendees, through: :tickets, source: :attendee
  has_many :invitations
  has_many :invitations_attendees, through: :invitations, source: :recipient

  scope :past, -> {where('date < ?', Time.now)}
  scope :future, -> {where('date >= ?', Time.now)}
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :prive, inclusion: { in: [true, false]}

end
