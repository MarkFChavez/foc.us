class CreateItemCategory < ActiveRecord::Migration[5.1]
  def change
    create_table :item_categories do |t|
      t.column :subject_id, :integer
      t.column :subject_type, :string
      t.column :category_id, :integer

      t.timestamps
    end

    add_index :item_categories, [:subject_id, :subject_type]
    add_index :item_categories, :category_id
  end
end
