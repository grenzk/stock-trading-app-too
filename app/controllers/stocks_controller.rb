class StocksController < ApplicationController
  before_action :set_stock, only: %i[show edit update destroy]
  before_action :require_approved, except: %i[index markets]

  def index
    @stocks = current_user.stocks.where.not(shares: 0).order(symbol: :ASC)
  end

  def show
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = current_user.buy_stock(stock_params, stock_params[:shares].to_f)

    Transaction.record @stock, 'buy'
    redirect_to stocks_path, notice: 'Your purchase was successful.'
  end

  def edit
  end

  def update
    if @stock.update(stock_params)
      redirect_to @stock, notice: 'Stock was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @stock.destroy
    redirect_to stocks_url, notice: 'Stock was successfully deleted.'
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

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(
      :symbol,
      :company_name,
      :shares,
      :cost_price,
      :user_id
    )
  end

  def require_approved
    return if current_user.admin?

    unless current_user.approved?
      flash[:notice] = 'You are not yet approved by the admin.'
      redirect_to stocks_path
    end
  end
end
