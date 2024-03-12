class Invitation < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User", primary_key: "email", foreign_key: "recipient_email"
  belongs_to :event

  validates :sender_id, presence: true
  validates :recipient_email, presence: true
  validates :event_id, presence: true
end
