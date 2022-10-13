class StocksController < ApplicationController
  def portfolio
  end

  def Transactions
  end

  def markets
    @company_symbol = params[:symbol] ||= 'MSFT'
    @company = @client.company(@company_symbol)
    @most_active = @client.stock_market_list(:mostactive) #quote
    @company_name = @company.company_name
    @company_symbol = @company.symbol
    @description = @company.description
    @logo = @client.logo(@company_symbol).url

    @quote = @client.quote(@company_symbol)
    @latest_price = "$ #{@quote.latest_price}"
    @change_percent = @quote.change_percent

    @news = @client.news(@company_symbol)
  end
end
