RSpec.describe User, type: :model do

  it "é válido com nome e email" do
    user = User.new(name: "Isa", email: "isa@example.com")
    expect(user).to be_valid
  end

  it "é inválido sem nome" do
    user = User.new(name: nil, email: "isa@example.com")
    expect(user).not_to be_valid
  end

  it "é inválido sem email" do
    user = User.new(name: "Isa", email: nil)
    expect(user).not_to be_valid
  end

  it "é inválido com email mal formatado" do
    user = User.new(name: "Isa", email: "sem-arroba")
    expect(user).not_to be_valid
  end
end
