class AddIndexes < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, :author_id
    add_index :users, %i[first_name last_name], unique: true
  end
end
