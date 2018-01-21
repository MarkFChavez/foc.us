class CreateTodo < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.column :description, :text
      t.column :done, :boolean
      t.timestamps
    end
  end
end
