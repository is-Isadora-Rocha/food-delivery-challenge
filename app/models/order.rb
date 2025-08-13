class Order < ApplicationRecord
  belongs_to :user

  validates :pickup_address, :delivery_address, :items_description,
            :requested_at, :estimated_price, presence: true

  validates :estimated_price, numericality: { greater_than: 0 }

  validate :delivery_address_different_from_pickup

  private

  def delivery_address_different_from_pickup
    if pickup_address == delivery_address
      errors.add(:delivery_address, "deve ser diferente do endereço de coleta")
    end
  end
end
