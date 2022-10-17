class Admin::UserTransactionsController < ApplicationController
  def index
    @transactions =
      UserTransaction
        .includes(:transaction_type, :user)
        .all
        .order(created_at: :DESC)
  end
end
