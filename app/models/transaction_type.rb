class TransactionType < ApplicationRecord
  has_many :transactions, dependent: :destroy
end
