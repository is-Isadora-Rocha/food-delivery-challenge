# 🍽️ Food Delivery App

Aplicação full-stack criada como desafio técnico.  
Simula um sistema de entrega de comida, com criação e consulta de pedidos.

## 🚀 Funcionalidades

- Login simples com nome e e-mail (não autenticado)
- Criação de pedidos
- Listagem de pedidos do usuário
- Busca de pedidos por ID do usuário (admin)
- API para criação e consulta de pedidos
- Testes de interface com Capybara

## 🔧 Tecnologias

- Ruby on Rails com ERB
- Sqlite3
- RSpec + Capybara (testes)

## 🔗 Rotas principais

| Método | Rota                          | Descrição                          |
|--------|-------------------------------|-------------------------------------|
| GET    | `/`                           | Tela de login                      |
| GET    | `/orders` `/orders/new`       | Lista e cria pedidos               |
| GET    | `/admin/orders/search`        | Busca de pedidos por ID (admin)    |
| POST   | `/api/orders`                 | Criação de pedido via API          |
| GET    | `/api/orders/user/:id`        | Listagem de pedidos via API        |
