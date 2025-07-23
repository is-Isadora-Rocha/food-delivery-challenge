class Order < ApplicationRecord
  belongs_to :user

  validates :pickup_address, :delivery_address, :items_description, :requested_at, :estimated_price, presence: { message: "Não pode estar vazio"}
  validates :estimated_price, numericality: { greater_than: 0 }
end
