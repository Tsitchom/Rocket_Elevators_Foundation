class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions, :id => false do |t|
        t.integer :id 
        t.belongs_to :user, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
        t.belongs_to :building, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, null: false
        t.belongs_to :battery, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, optional: true
        t.belongs_to :column, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}, optional: true
        t.belongs_to :elevator, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade},optional: true
        t.datetime :intervention_start, optional: false
        t.datetime :intervention_finish, optional: true
        t.integer :intervention_result, optional: false
        t.text :report, optional: true
        t.integer :intervention_status, optional: false

      t.timestamps
    end
  end
end
