require 'rails_helper'

RSpec.describe "API::Orders", type: :request do
  let!(:user) { User.create(name: "Isadora", email: "isa@example.com") }

  let!(:order1) do
      Order.create(
        user: user,
        pickup_address: "Rua A",
        delivery_address: "Rua B",
        items_description: "Pedido 1",
        requested_at: Time.current,
        estimated_price: 30.0
      )
    end

    let!(:order2) do
      Order.create(
        user: user,
        pickup_address: "Rua C",
        delivery_address: "Rua D",
        items_description: "Pedido 2",
        requested_at: Time.current,
        estimated_price: 50.0
      )
    end

  describe "GET /api/orders/user/:user_id" do

    it "retorna todos os pedidos do usuário" do
      get "/api/orders/user/#{user.id}"

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json.size).to eq(2)
      expect(json[0]["items_description"]).to eq("Pedido 1")
      expect(json[1]["items_description"]).to eq("Pedido 2")
    end

    it "retorna 404 se usuário não existir" do
      get "/api/orders/user/0"
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "POST /api/orders" do
    let(:valid_params) do
      {
        user_id: user.id,
        pickup_address: "Rua X",
        delivery_address: "Rua Y",
        items_description: "Novo pedido",
        requested_at: Time.current,
        estimated_price: 40.0
      }
    end

    it "cria um novo pedido com dados válidos" do
      expect {
        post "/api/orders",
        params: { order: valid_params }.to_json,
        headers: {
          "CONTENT_TYPE" => "application/json",
          "ACCEPT" => "application/json"
        }
      }.to change(Order, :count).by(1)

      expect(response).to have_http_status(:created)

      json = JSON.parse(response.body)
      expect(json["items_description"]).to eq("Novo pedido")

      expect(Order.count).to eq(3)
    end

    it "retorna erros quando dados são inválidos" do
      invalid_params = { user_id: user.id, pickup_address: nil }

      expect {
        post "/api/orders",
        params: { order: invalid_params }.to_json,
        headers: {
          "CONTENT_TYPE" => "application/json",
          "ACCEPT" => "application/json"
        }
      }.not_to change(Order, :count)

      expect(response).to have_http_status(:unprocessable_entity)

      json = JSON.parse(response.body)
      expect(json["errors"]).to include("Pickup address Não pode estar vazio")
    end
  end
end
