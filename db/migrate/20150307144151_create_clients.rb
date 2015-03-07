class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :invoice_id
      t.integer :fiscal_id
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
