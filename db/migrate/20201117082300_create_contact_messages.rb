class CreateContactMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_messages do |t|
      t.string :subject
      t.string :email
      t.text :message
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
