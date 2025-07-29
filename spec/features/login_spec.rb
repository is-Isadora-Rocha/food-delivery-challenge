require 'rails_helper'

RSpec.feature "Login de Usuário", type: :feature do
  scenario "Usuário faz login com sucesso e é redirecionado para a tela de pedidos" do
    visit root_path

    fill_in 'Nome', with: 'Isadora'
    fill_in 'Email', with: 'isa@teste.com'
    click_button 'Entrar'

    expect(current_path).to eq(orders_path)
  end
end
