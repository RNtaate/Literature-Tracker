class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.string :name
      t.boolean :status, default: false
      t.timestamps
    end
    add_index :groups, :user_id
  end
end
