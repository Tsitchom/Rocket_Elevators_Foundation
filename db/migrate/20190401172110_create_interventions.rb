class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
        t.belongs_to :user, index: true, null: true
        t.belongs_to :customer, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
        t.belongs_to :building, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: true
        t.belongs_to :battery, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, optional: true
        t.belongs_to :column, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, optional: true
        t.belongs_to :elevator, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade},optional: true
        t.integer :employee_id, optional: true
        t.datetime :intervention_start, optional: true
        t.datetime :intervention_finish, optional: true
        t.integer :intervention_result, optional: false, :default => 2
        t.text :report, optional: true
        t.integer :intervention_status, optional: false, :default => 2

      t.timestamps
    end
  end
end
