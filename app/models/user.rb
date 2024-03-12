class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: "creator_id"
  has_many :tickets, foreign_key: "attendee_id"
  has_many :attended_events, through: :tickets, source: :event
  has_many :sent_invitations, foreign_key: "sender_id", class_name: "Invitation"
  has_many :received_invitations, foreign_key: "recipient_email", class_name: "Invitation", primary_key: "email"
  has_many :invited_events, through: :received_invitations, source: :event
end
