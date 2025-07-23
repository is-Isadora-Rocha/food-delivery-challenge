RSpec.describe "API::Users", type: :request do

   it "cria um usuário com dados válidos" do
    params = { user: { name: "Isa", email: "isa@example.com" } }

    expect {
      post "/api/users", params: params.to_json,
        headers: {
          "CONTENT_TYPE" => "application/json",
          "ACCEPT" => "application/json"
        }
    }.to change(User, :count).by(1)

    expect(response).to have_http_status(:created)
  end

  it "não cria usuário sem nome" do
    params = { user: { name: nil, email: "isa@example.com" } }

    expect {
      post "/api/users", params: params.to_json,
        headers: {
          "CONTENT_TYPE" => "application/json",
          "ACCEPT" => "application/json"
        }
    }.not_to change(User, :count)

    expect(response).to have_http_status(:unprocessable_entity)
  end
end
