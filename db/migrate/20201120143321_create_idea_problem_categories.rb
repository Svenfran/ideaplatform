class CreateIdeaProblemCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :idea_problem_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :idea_problem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
