class ContactMessage < ApplicationRecord
  belongs_to :user

  validates :sender_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :sender_subject, :sender_email, :sender_message, presence: :true 
end
