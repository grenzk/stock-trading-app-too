class User < ApplicationRecord
  has_many :stocks, dependent: :destroy
  has_many :transactions, dependent: :destroy

  after_initialize :set_default_role, if: :new_record?

  devise :database_authenticatable, :registerable, :validatable, :confirmable

  enum role: %i[trader admin]

  def set_default_role
    self.role ||= :trader
  end

  def admin?
    self.role == 'admin'
  end

  def trader?
    self.role == 'trader'
  end
end
