class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.belongs_to :battery, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :building_type, null: false
      t.integer :number_of_floors, null: false
      t.integer :column_status
      t.text :information
      t.text :notes
    end
  end
end
