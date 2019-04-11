class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
        t.belongs_to :user, index: true, null: true
        t.belongs_to :customer, index: true, null: true
        t.belongs_to :building, index: true, null: true
        t.belongs_to :battery, index: true, optional: true
        t.belongs_to :column, index: true, optional: true
        t.belongs_to :elevator, index: true, optional: true
        t.integer :employee_id, optional: true
        t.datetime :intervention_start, optional: true
        t.datetime :intervention_finish, optional: true
        t.text :intervention_result, optional: false
        t.text :report, optional: true
        t.text :intervention_status, optional: false

      t.timestamps
    end
  end
end
