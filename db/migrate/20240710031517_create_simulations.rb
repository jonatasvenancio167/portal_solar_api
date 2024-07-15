class CreateSimulations < ActiveRecord::Migration[7.0]
  def change
    create_table :simulations do |t|
      t.references :client, null: false, foreign_key: true
      t.decimal :account_value
      t.string :pdf

      t.timestamps
    end
  end
end
