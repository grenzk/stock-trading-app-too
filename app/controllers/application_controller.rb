class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_stocks_data

  def set_stocks_data 
    sectors = ["Retail Trade", "Communications", "Health Services", "Technology Services", "Finance"]
    client = IEX::Api::Client.new
    @quote = client.quote('MSFT')
    @list = client.get('/stock/market/collection/sector?collectionName=Wholesale Trade', token: 'sk_00c8f94b232642c3a90df6c727e6b6c5')

    
  end

  def after_sign_in_path_for(resource)
    return admin_path if current_user.admin?
    return portfolio_path if current_user.trader?
  end
end
