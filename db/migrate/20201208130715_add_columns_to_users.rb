class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :company_name, :string, default: ""
    add_column :users, :alias, :string, default: ""
    add_column :users, :person_group_private, :boolean, default: true
    add_column :users, :is_admin, :boolean, default: false
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
