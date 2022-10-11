module MarketplaceHelper

  def format_date(date)
    date.strftime("%m/%d/%Y")
  end

  def slice_text(text)
    text.slice(0, 160)
  end
end
