class CreateIdeaProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :idea_problems do |t|
      t.string :title
      t.text :description_long
      t.boolean :type_idea
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
