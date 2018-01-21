class CreateNote < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.column :description, :text
      t.timestamps
    end
  end
end
