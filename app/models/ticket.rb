class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: "User"

  validates :email, presence: true
  validates :name, presence: true
end
