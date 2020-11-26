class CreateContactMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_messages do |t|
      t.string :sender_subject
      t.string :sender_email
      t.text :sender_message
      t.string :recipient_name
      t.string :recipient_email
      t.string :recipient_idea_problem_title
      t.bigint :recipient_idea_problem_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
