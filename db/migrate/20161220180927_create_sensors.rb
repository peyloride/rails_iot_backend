class CreateSensors < ActiveRecord::Migration[5.0]
  def change
    create_table :sensors do |t|
      t.string :name
      t.string :type
      t.string :address

      t.timestamps
    end
  end
end
