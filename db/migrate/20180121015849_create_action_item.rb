class CreateActionItem < ActiveRecord::Migration[5.1]
  def change
    create_table :action_items do |t|
      t.column :description, :text
      t.column :todo_id, :integer

      t.timestamps
    end

    add_index :action_items, :todo_id
    add_foreign_key :action_items, :todos
  end
end
