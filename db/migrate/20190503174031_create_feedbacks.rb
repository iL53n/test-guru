class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.string :title, null: false
      t.string :messages, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
