class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.belongs_to :building, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
      t.belongs_to :user, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.string :building_type, null: false
      t.integer :battery_status
      t.date :date_of_install
      t.date :date_of_inspect
      t.integer :inspect_certificate
      t.text :information
      t.text :notes
    end
  end
end
