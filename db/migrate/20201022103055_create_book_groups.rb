class CreateBookGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :book_groups do |t|
      t.integer :book_id
      t.integer :group_id
      t.timestamps
    end
    add_index :book_groups, :book_id
    add_index :book_groups, :group_id
  end
end
