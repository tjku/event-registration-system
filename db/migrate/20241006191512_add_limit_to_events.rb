class AddLimitToEvents < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :limit, :integer
  end
end
