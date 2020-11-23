class IdeaProblem < ApplicationRecord
  belongs_to :user
  has_many :idea_problem_categories, dependent: :destroy
  has_many :categories, through: :idea_problem_categories
  has_many_attached :documents
  validates :title, :user_id, :category_ids, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_description_category,
    against: [ :title, :description_long, :type_idea ],
    associated_against: {
      categories: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
  }

end
