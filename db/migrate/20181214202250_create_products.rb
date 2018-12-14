class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :description
      t.integer :company_id
      t.column :created_by, 'timestamp without time zone'
      t.column :updated_at, 'timestamp without time zone'

      t.timestamps
    end
  end
end
