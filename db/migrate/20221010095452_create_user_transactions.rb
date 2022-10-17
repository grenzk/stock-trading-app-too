class CreateUserTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_transactions do |t|
      t.string :symbol
      t.string :company_name
      t.float :shares
      t.float :price
      t.float :value
      t.integer :transaction_type_id
      t.string :name

      t.timestamps
    end
  end
end
