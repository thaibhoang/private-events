class Invitation < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipent, class_name: "User"
  belongs_to :event

  validates :sender_id, presence: true
  validates :recipent_id, presence: true
  validates :event_id, presence: true
end
