class CreateInvoices < ActiveRecord::Migration

  def change
    create_table :invoices do |t|
      t.string :serial
      t.date :date
      t.decimal :amount
      t.integer :vat
      t.decimal :total_amount
      t.integer :io
      t.integer :user_id

      t.timestamps
    end
    add_index :invoices, :user_id
  end
end
