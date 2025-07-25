class UserLogin
  include ActiveModel::Model

  attr_accessor :name, :email

  validates :name, :email, presence: true
end
