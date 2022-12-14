class SellStocksController < ApplicationController
  before_action :require_approved

  def show
    symbol = params[:symbol].upcase
    @quote = Stock.data(symbol)
    @stock = current_user.stocks.find_by_symbol(symbol)
  end

  def create
    @stock =
      current_user.sell_stock(stock_params[:symbol], stock_params[:shares].to_f)

    if @stock
      UserTransaction.record(@stock, 2, 'sell')

      redirect_to portfolio_path,
                  notice:
                    "Successfully sold #{@stock.transact_shares} shares of #{@stock.company_name}!"
    else
      redirect_to get_sellstock_path(params[:symbol])
    end
  end

  private

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
      flash[:alert] = 'You are not yet approved by the admin.'
      redirect_to stocks_path
    end
  end
end
