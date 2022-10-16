class Stock < ApplicationRecord
  belongs_to :user

  validates :symbol, :company_name, presence: true

  def self.data(symbol)
    new(
      symbol: symbol,
      company_name: @client.company(symbol).company_name,
      cost_price: @client.quote(symbol).latest_price
    )
  rescue StandardError
    nil
  end

  def self.check_stocks(symbol)
    where(symbol: symbol).first
  end
end
