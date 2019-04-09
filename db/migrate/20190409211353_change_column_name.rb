class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :interventions, :user, :author
  end
end
