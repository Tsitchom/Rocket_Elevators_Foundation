class CreateGmaps < ActiveRecord::Migration[5.2]
  def change
    create_table :gmaps do |t|

      t.timestamps
    end
  end
end
