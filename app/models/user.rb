class User < ApplicationRecord
  after_initialize :set_default_role, if: :new_record?

  devise :database_authenticatable, :registerable, :validatable

  enum role: %i[admin trader]

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
