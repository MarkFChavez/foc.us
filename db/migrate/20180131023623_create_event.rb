class CreateEvent < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.column :name, :string
      t.column :user_id, :integer
      t.column :start_time, :datetime
      t.column :end_time, :datetime

      t.timestamps
    end

    add_index :events, :name
    add_index :events, :user_id
  end
end
