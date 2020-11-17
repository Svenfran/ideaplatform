class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.string :title
      t.float :size
      t.references :idea_problem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
