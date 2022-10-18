require 'rails_helper'

RSpec.describe Stock, type: :model do
  context 'validate stock parameters' do
    it 'it is not valid without symbol' do
      stock = described_class.new
      stock.symbol = nil
      expect(stock).not_to be_valid
    end

    it 'it is not valid without company_name' do
      stock = described_class.new
      stock.company_name = nil
      expect(stock).not_to be_valid
    end
  end
end
