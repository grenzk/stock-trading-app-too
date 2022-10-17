class UserTransaction < ApplicationRecord
  belongs_to :user
  belongs_to :transaction_type

  def self.record(stock, id, type)
    UserTransaction.create(
      symbol: stock.symbol,
      company_name: stock.company_name,
      shares: stock.transact_shares,
      price: stock.cost_price,
      value: (stock.cost_price * stock.transact_shares).round(2),
      transaction_type: TransactionType.find_by(id: id),
      name: type,
      user_id: stock.user_id
    )
  end
end
