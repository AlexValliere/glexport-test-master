class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.column :created_by, 'timestamp without time zone'
      t.column :updated_at, 'timestamp without time zone'

      t.timestamps
    end
  end
end
