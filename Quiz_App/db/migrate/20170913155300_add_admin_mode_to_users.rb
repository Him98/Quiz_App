class AddAdminModeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin_mode, :boolean, default: false
  end
end
