class CreateCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.column :title, :string
      t.column :description, :text

      t.timestamps
    end

    add_index :categories, :title
  end
end
