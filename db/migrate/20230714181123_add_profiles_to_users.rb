class AddProfilesToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :profile, :text
  end

  def down
    add_column :users, :profile, :string
  end
end