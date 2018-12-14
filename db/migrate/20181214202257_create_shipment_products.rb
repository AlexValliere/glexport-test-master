class CreateShipmentProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :shipment_products do |t|
      t.references :product, foreign_key: true
      t.references :shipment, foreign_key: true
      t.integer :quantity
      t.column :created_by, 'timestamp without time zone'
      t.column :updated_at, 'timestamp without time zone'
      t.timestamps
    end
  end
end
