module ApplicationHelper
  def most_active
    client = IEX::Api::Client.new
    client.stock_market_list(:mostactive)
  end

  def symbol_list
    client = IEX::Api::Client.new
    client.ref_data_symbols()
  end

  def company_info(symbol)
    client = IEX::Api::Client.new
    company = client.company(symbol)
    company.company_name
  end

  def company_logo(symbol)
    client = IEX::Api::Client.new
    logo = client.logo(symbol)
    logo.url
  end

  def percent_color(value)
    if value < 0
      'negative'
    end
  end

end
