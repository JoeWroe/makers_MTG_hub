class AddPropertiesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :name, :string
    add_column :events, :game_format, :string
    add_column :events, :description, :text
    add_column :events, :cost, :integer
    add_column :events, :min_size, :integer
    add_column :events, :max_size, :integer
    add_column :events, :start_time, :datetime
  end
end
