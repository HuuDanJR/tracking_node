class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, index: true
      t.decimal :total
      t.integer :status
      t.timestamps
    end
  end
end
