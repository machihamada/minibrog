class CreateBrogs < ActiveRecord::Migration
  def change
    create_table :brogs do |t|

      t.string      :name
      t.string       :title
      t.text        :text
      t.timestamps
    end
  end
end
