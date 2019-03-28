class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    # Add column to users table called admin of type boolean
    add_column :users, :admin, :boolean, default: false
  end
end

# user.toggle!(:admin) to change admin settings between false and true in console
