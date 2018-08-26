class RemoveNameFromBrogs < ActiveRecord::Migration
  def change
    remove_column :brogs, :name, :string
  end
end
