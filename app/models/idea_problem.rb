class IdeaProblem < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :attachments
  validates :title, :user_id, :category_id, presence: true

end
