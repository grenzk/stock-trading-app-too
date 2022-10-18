require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  context 'validate transaction associations' do
    it 'belongs to a user' do
      transaction = UserTransaction.new
      user = User.new
      user.user_transactions << transaction
      expect(transaction.user).to be user
    end
  end
end
