class CreateUserTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_transactions do |t|

      t.timestamps
    end
  end
end
