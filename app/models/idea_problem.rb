class IdeaProblem < ApplicationRecord
  belongs_to :user
  has_many :idea_problem_categories, dependent: :destroy
  has_many :categories, through: :idea_problem_categories
  has_many_attached :attachments
  validates :title, :user_id, :category_ids, presence: true

end
