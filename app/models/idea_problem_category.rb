class IdeaProblemCategory < ApplicationRecord
  belongs_to :category
  belongs_to :idea_problem
end
