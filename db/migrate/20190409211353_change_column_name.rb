class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :interventions, :user_id, :author
  end
end
