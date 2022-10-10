class TransactionType < ApplicationRecord
  has_many :user_transactions, dependent: :destroy
end
