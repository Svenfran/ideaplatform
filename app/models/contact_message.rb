class ContactMessage < ApplicationRecord
  belongs_to :user
  belongs_to :idea_problems

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :subject, :email, :message, presence: :true 
end
