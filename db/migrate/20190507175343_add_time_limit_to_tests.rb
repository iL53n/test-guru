class AddTimeLimitToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :time_limit, :integer
  end
end