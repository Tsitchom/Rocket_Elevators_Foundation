class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.belongs_to :column, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.string :serial_number, null: false
      t.string :model_type, null: false
      t.string :building_type, null: false
      t.string :elevator_status
      t.date :date_of_install
      t.date :date_of_inspect
      t.string :inspect_certificate
      t.text :information
      t.text :notes
    end
  end
end
