module StocksHelper
  def format_date(date)
    date.strftime("%m/%d/%Y")
  end

  def slice_text(text)
    text.slice(0, 160)
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
