class Order < ApplicationRecord
  belongs_to :user

  validates :pickup_address, :delivery_address, :requested_at, :estimated_price, presence: { message: "Não pode estar vazio"}
end
