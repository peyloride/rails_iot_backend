class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.string :light
      t.string :temperature
      t.references :sensor

      t.timestamps
    end
  end
end
