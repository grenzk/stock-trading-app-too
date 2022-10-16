class Stock < ApplicationRecord
  belongs_to :user

  validates :symbol, :company_name, presence: true

  def self.data(symbol)
    client =
      IEX::Api::Client.new(
        publishable_token:
          Rails.application.credentials[:iex][:publishable_token],
        secret_token: Rails.application.credentials[:iex][:secret_token],
        endpoint: 'https://cloud.iexapis.com/v1'
      )

    begin
      new(
        symbol: symbol,
        company_name: client.company(symbol).company_name,
        cost_price: client.quote(symbol).latest_price
      )
    rescue StandardError
      nil
    end
  end

  def self.check_stocks(symbol)
    where(symbol: symbol).first
  end
end
