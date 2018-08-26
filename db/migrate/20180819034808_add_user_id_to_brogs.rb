class AddUserIdToBrogs < ActiveRecord::Migration
  def change
    add_column :brogs, :user_id, :integer
  end
end
