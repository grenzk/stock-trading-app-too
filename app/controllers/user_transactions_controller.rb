class UserTransactionsController < ApplicationController
  def index
    @transactions =
      current_user
        .user_transactions
        .includes(:transaction_type)
        .order(created_at: :DESC)
  end
end
