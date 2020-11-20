class Category < ApplicationRecord
    has_many :idea_problem_categories
    has_many :idea_problems, through: :idea_problem_categories
end
