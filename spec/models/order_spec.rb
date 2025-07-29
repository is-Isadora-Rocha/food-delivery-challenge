require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:user) { User.create(name: "Isadora", email: "isa@email.com") }

  it "é válido com todos os atributos obrigatórios" do
    order = Order.new(
      user: user,
      pickup_address: "Rua A",
      delivery_address: "Rua B",
      items_description: "Pizza + Coca",
      estimated_price: 50.0,
      requested_at: Time.current
    )
    expect(order).to be_valid
  end

  it "é inválido sem endereço de coleta" do
    order = Order.new(user: user, pickup_address: nil)
    order.valid?
    expect(order.errors[:pickup_address]).to include("não pode ficar em branco")
  end

  it "é inválido sem valor estimado" do
    order = Order.new(user: user, estimated_price: nil)
    order.valid?
    expect(order.errors[:estimated_price]).to include("não pode ficar em branco")
  end

  it "é inválido com valor estimado negativo" do
    order = Order.new(user: user, estimated_price: -10)
    order.valid?
    expect(order.errors[:estimated_price]).to include("deve ser maior que")
  end
  
end
