class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :book_author
      t.integer :author_id
      t.integer :amount
      t.integer :time
      t.timestamps
    end
    add_index :books, :author_id
  end
end
