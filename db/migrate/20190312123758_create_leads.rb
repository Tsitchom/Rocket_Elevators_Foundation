class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.belongs_to :customer, index: true, foreign_key: {on_delete: :cascade, on_update: :cascade}
      t.string :full_name
      t.string :company_name
      t.string :email
      t.string :phone_number
      t.string :project_name
      t.text :project_description
      t.string :department_in_charge
      t.text :message
      t.binary :attachment
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
