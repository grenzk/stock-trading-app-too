class Stock < ApplicationRecord
  belongs_to :user

  validates :symbol, :company_name, presence: true

  def stocks_data(symbol)
    client =
      IEX::Api::Client.new(
        publishable_token:
          Rails.application.credentials[:iex][:publishable_token],
        secret_token: Rails.application.credentials[:iex][:secret_token],
        endpoint: 'https://cloud.iexapis.com/v1'
      )
  end

  def check_stocks(symbol)
    where(symbol: symbol).first
  end
end
